## "q" Means Answer Only, No Changes

When a message starts or ends with a standalone `q` (the letter q on its own), treat it as a question. Answer it and make no changes.

**Rules:**
- Don't edit, create, delete or revert files, and don't run commands that change state.
- Read-only lookups to answer accurately are fine (reading files, grep, git log/diff).
- If the answer suggests a change, offer it and wait for Alex to ask.

**Examples:**
- `q why did you name it open_task_failure_chat?` → explain the choice; don't rename it.
- `why did you change STATE.md? q` → explain; don't revert it.

**Why:** Alex wants a quick, explicit way to ask about work without it turning into an action.
