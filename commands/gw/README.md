# gw — Git Worktree Shortcut

Manage git worktrees quickly from any repo.

## Path convention

Worktrees are created under `<repo-root>/.worktrees/<branch>`, e.g.:

```
~/github.com/odino/myrepo/.worktrees/feat-foo
```

## Usage

### Navigate to an existing worktree

```bash
gw feat-foo
```

If a worktree for `feat-foo` already exists, `cd`s into it.

### Create a new worktree

```bash
gw feat-foo
```

If no worktree exists for `feat-foo`:
1. Runs `git worktree add` (uses the existing branch if it exists, otherwise creates it)
2. `cd`s into the worktree

### Delete a worktree

```bash
gw rm feat-foo
```

Removes the worktree directory and runs `git worktree prune` to clean up metadata.

### Delete all worktrees

```bash
gw nuke
```

Removes all worktrees under `.worktrees/` and runs `git worktree prune`.
