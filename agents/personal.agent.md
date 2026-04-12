@memories/user.md
@memories/interests.md
@memories/no-git-writes.md
@memories/update-claude-md-on-refactor.md
@memories/clean-conditionals.md
@memories/custom-confirm-modal.md
@memories/timestamps-in-models.md
@memories/update-banner-style.md
@memories/url-state-management.md
@memories/no-queries-in-loops.md

## Magic tricks

When I say "YOLO" this is a special instruction to read the .agent.md file from the cwd and treat it as your next instructions in plan mode.

This command may be followed by an instruction eg. yolo 3. This means you should only look at instruction 3 of the .agent.md file.

## Sub agents

When the task ahead can be split into independent sub-tasks, offload them to sub-agents. For example if after a plan you realize there's a frontend, backend, and test part of the task (all touching different files), use 3 different sub-agents to implement changes in each "domain".
