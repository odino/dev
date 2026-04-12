#!/usr/bin/env bash
set -euo pipefail

payload=$(cat)

tool_name=$(echo "$payload" | jq -r '.tool_name')
tool_input_path=$(echo "$payload" | jq -r '.tool_input.file_path // ""')
cwd=$(echo "$payload" | jq -r '.cwd')

# Only care about Write/Edit touching plan files
if [[ "$tool_name" != "Write" && "$tool_name" != "Edit" ]]; then
    exit 0
fi

plans_dir="$HOME/.claude/plans"

if [[ "$tool_input_path" != "$plans_dir/"* ]]; then
    exit 0
fi

plan_file="$tool_input_path"
[[ -f "$plan_file" ]] || exit 0

repo_root=$(git -C "$cwd" rev-parse --show-toplevel 2>/dev/null) || { exit 0; }

marker="plan-source: $plan_file"

if [[ "$tool_name" == "Edit" ]]; then
    # Find existing mirror by embedded source marker and update it
    mkdir -p "$repo_root/.plans"
    existing_mirror=$(grep -rl "$marker" "$repo_root/.plans" --include="*.md" 2>/dev/null | head -1 || true)
    if [[ -n "$existing_mirror" ]]; then
        # Preserve the marker line, replace the rest
        echo "[//]: # ($marker)" > "$existing_mirror"
        cat "$plan_file" >> "$existing_mirror"
    fi
    exit 0
fi

# Write: first-time mirror creation
date_iso=$(date +%Y-%m-%d)
unix_ts=$(date +%s)

first_heading=$(grep -m1 '^#' "$plan_file" 2>/dev/null \
    | sed 's/^#\+[[:space:]]*//' \
    | tr '[:upper:]' '[:lower:]' \
    | sed 's/[^a-z0-9]/-/g; s/-\+/-/g; s/^-//; s/-$//' || echo "plan")

[[ -z "$first_heading" ]] && first_heading="plan"

mkdir -p "$repo_root/.plans"
mirror_path="$repo_root/.plans/${date_iso}-${unix_ts}-${first_heading}.md"

{
    echo "[//]: # ($marker)"
    cat "$plan_file"
} > "$mirror_path"
