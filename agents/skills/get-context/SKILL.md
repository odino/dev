---
name: get-context
description: quickly get context on the codebase
---

Quickly get context on the current codebase. Use haiku.
Limit yourself to files within the codebase, don't explore dependencies.

Create a CLAUDE.md file in the project if it doesn't exist -- the only line in it should be "@AGENTS.md".
Create an AGENTS.md file in the project if it doesn't exist -- that's where you dump context for this project. Keep it high level so that future sessions don't end up using stale data. Note down salient commands (like how to execute the tests) that aren't likely to change frequently.
