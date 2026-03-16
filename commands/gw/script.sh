_GW_DIR="$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")"

gw() {
  if [ -z "$1" ]; then
    cat "$_GW_DIR/README.md"
    return
  fi

  # gw rm <branch> — delete worktree
  if [ "$1" = "rm" ]; then
    local branch="$2"
    local wt_path
    wt_path=$(git worktree list --porcelain \
      | awk '/^worktree/{wt=$2} /^branch refs\/heads\/'$branch'$/{print wt}')
    if [ -z "$wt_path" ]; then
      echo "gw: no worktree found for branch '$branch'"
      return 1
    fi
    rm -rf "$wt_path"
    git worktree prune
    echo "gw: deleted $wt_path"
    return
  fi

  # gw nuke — delete all worktrees
  if [ "$1" = "nuke" ]; then
    local repo_root
    repo_root=$(git rev-parse --show-toplevel 2>/dev/null)
    if [ -z "$repo_root" ]; then
      echo "gw: not inside a git repository"
      return 1
    fi
    local wt_base="$repo_root/.worktrees"
    if [ ! -d "$wt_base" ] || [ -z "$(ls -A "$wt_base" 2>/dev/null)" ]; then
      echo "gw: no worktrees to delete"
      return
    fi
    for wt in "$wt_base"/*/; do
      [ -d "$wt" ] || continue
      rm -rf "$wt"
      echo "gw: deleted $wt"
    done
    git worktree prune
    return
  fi

  local branch="$1"
  local repo_root
  repo_root=$(git rev-parse --show-toplevel 2>/dev/null)
  if [ -z "$repo_root" ]; then
    echo "gw: not inside a git repository"
    return 1
  fi

  local wt_path="$repo_root/.worktrees/$branch"

  # If worktree already exists, just cd into it
  if git worktree list --porcelain | grep -q "^worktree $wt_path$"; then
    cd "$wt_path" || return 1
    return
  fi

  # Create worktree (try existing branch first, then create new)
  mkdir -p "$wt_path"
  git worktree add "$wt_path" "$branch" 2>/dev/null \
    || git worktree add -b "$branch" "$wt_path" \
    || { rmdir "$wt_path" 2>/dev/null; return 1; }

  cd "$wt_path"
}
