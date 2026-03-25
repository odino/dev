# dev — Personal Dev Environment Toolkit

A collection of shell aliases, Docker/k8s utilities, and Claude agent configs to manage development workflows with minimal host installation.

## Structure

- **aliases** — Main shell config (zsh/bash). Source this to get all shortcuts.
- **commands/** — Command scripts sourced by `aliases`
  - `gw/` — Git worktree manager (create, navigate, nuke)
- **bin/** — Standalone utilities
  - `db` — Connect to local MySQL via k8s port-forward (ABS script)
  - `db-tunnel` — SSH tunnel to remote DBs with config file support (ABS script)
- **agents/** — Claude Code agent configs and skills
  - `Makefile` — `make install` symlinks skills/memories to `~/.claude/`
  - `skills/` — Custom Claude skills
  - `memories/` — User context files

## Setup

```sh
chmod +x build.sh && ./build.sh   # install system deps (docker, kubectl, etc.)
source aliases                     # load shell shortcuts
make -C agents install             # install Claude agent skills/memories
```

## Key Aliases (from `aliases`)

| Alias | Purpose |
|-------|---------|
| `gw <branch>` | Create/navigate git worktree |
| `gw nuke` | Delete all worktrees |
| `kup` / `kdown` | Start/stop microk8s |
| `k` | kubectl shortcut |
| `my` | Connect to local MySQL (via port-forward) |
| `mf` | Start MySQL port-forward |
| `docker-clean` | Remove stopped containers + dangling images |

## Tech Stack

- Shell: Bash/Zsh
- Containerization: Docker (snap)
- Orchestration: Kubernetes (microk8s)
- Scripting: ABS (A Better Script) for db utilities
- Claude Code CLI integration
