# Dev

A collection of shell aliases, Kubernetes utilities, database tools, and Claude agent configs that define my development workflow. The goal is to install as little as possible on the host machine — most tooling runs through Docker or Kubernetes.

* [odino.org/how-docker-changed-me/](http://odino.org/how-docker-changed-me/)

## Structure

```
.
├── aliases           # Main shell config — source this to load all shortcuts
├── build.sh          # One-time system setup (apt packages, kubectl, helm)
├── commands/
│   └── gw/           # Git worktree manager (create, navigate, delete worktrees)
├── bin/
│   ├── db            # Connect to local MySQL via k8s port-forward
│   └── db-tunnel     # SSH tunnel to remote DBs with config file support
└── agents/           # Claude Code CLI integration (skills, memories, settings)
    ├── Makefile       # `make install` symlinks everything to ~/.claude/
    ├── settings.json  # Claude Code harness config (plan mode, hooks, status line)
    ├── CLAUDE.md      # Personal agent directives
    ├── personal.agent.md
    ├── memories/      # Code style and workflow rules loaded by the agent
    └── skills/        # Custom Claude skills (remember, get-context)
```

## Setup

```sh
chmod +x build.sh && ./build.sh   # install system deps (docker, kubectl, helm, etc.)
source aliases                     # load shell shortcuts (add to .zshrc / .bashrc)
make -C agents install             # symlink Claude skills, memories, and settings
```

## Shell aliases

The `aliases` file dynamically sources every `commands/*/script.sh` on load.

### Kubernetes

| Alias | Command | Description |
|-------|---------|-------------|
| `k` | `kubectl` | kubectl shortcut |
| `kup` | `microk8s start` | Start local k8s cluster |
| `kdown` | `microk8s stop` | Stop local k8s cluster |
| `ks` | `kubectl -n staging` | Staging namespace shortcut |
| `kr` | `kubectl -n production` | Production namespace shortcut |
| `kx` | `kubectl -n default` | Default namespace shortcut |
| `ki` | `kubectl -n infra` | Infra namespace shortcut |

### Docker

| Alias | Description |
|-------|-------------|
| `dup` | Enable Docker (snap) |
| `ddown` | Disable Docker (snap) |
| `docker-clean` | Remove exited containers and dangling images |

### Database

| Alias | Description |
|-------|-------------|
| `mf` | Start MySQL port-forward (`kubectl port-forward svc/mysql 3333:3306`) |
| `my` | Connect to local MySQL on port 3333 |

### Git

| Alias | Description |
|-------|-------------|
| `st` | `git status` |
| `reset` | `git reset` |
| `ck` | `git checkout` |
| `push` | `git push` |
| `merge` | `git merge` |
| `rebase` | `git rebase` |

### Navigation

| Alias | Description |
|-------|-------------|
| `gogo` | `cd ~/github.com` |
| `gome` | `cd ~/github.com/odino` |

### Utilities

| Alias | Description |
|-------|-------------|
| `countdown N` | Count down N seconds (useful for pausable scripts) |
| `p` | Print message with timestamp |
| `sshrenew` | Renew SSH agent keys |

---

## commands/

### gw — Git Worktree Manager

Manages git worktrees under `.worktrees/<branch>` inside any repo.

```sh
gw <branch>       # navigate to existing worktree, or create one (branch-or-new)
gw rm <branch>    # delete a specific worktree and prune metadata
gw nuke           # delete all worktrees under .worktrees/
```

Worktrees live at `.worktrees/<branch>` relative to the repo root. `gw <branch>` will cd into an existing worktree, or create and cd into a new one if it doesn't exist.

See `commands/gw/README.md` for full details.

---

## bin/

Scripts written in [ABS](https://www.abs-lang.org/) (A Better Script), a Go-inspired shell scripting language.

### db

Connects to a local MySQL instance running as a Kubernetes service.

```sh
db
```

Runs `kubectl port-forward svc/mysql 3333:3306` in the background, waits for the tunnel, then opens `mysql -u root -proot -P 3333 -h 127.0.0.1`.

### db-tunnel

SSH tunnel to a remote database with config file support.

```sh
db-tunnel -f config.txt -db mydb -env live
db-tunnel -f config.txt -status up
db-tunnel -f config.txt connect    # open MySQL session after tunneling
```

**Flags:**

| Flag | Description |
|------|-------------|
| `-f <file>` | Config file path |
| `-db <name>` | Database name to connect to |
| `-env <live\|staging>` | Target environment |
| `-status <up\|down>` | Check or tear down the tunnel |

**Config file format:**

```
jumphost: domain.com
db_name
host: 10.0.0.1
user: myuser
pwd: mypassword
port: 3307
jumphost_env: jumphost.domain.com
```

---

## agents/

Claude Code integration layer. Everything here is installed to `~/.claude/` via `make -C agents install`.

### make install

```sh
make -C agents install
```

Symlinks:
- `agents/skills/*/` → `~/.claude/skills/`
- `agents/personal.agent.md` + `agents/CLAUDE.md` + `agents/settings.json` → `~/`
- `agents/memories/` → `~/memories/`

### settings.json

Configures the Claude Code harness:

- **Default mode**: `plan` — Claude plans before executing any non-trivial task
- **Stop hook**: sends a desktop notification via `notify-send` when a session exits
- **Status line**: custom status using `npx ccstatusline@latest`
- **Permissions**: read/edit access to agent files and memories

### memories/

Code style and workflow rules loaded by the personal agent on every session:

| File | Rule |
|------|------|
| `user.md` | User context (name: Alex) |
| `no-git-writes.md` | Never run git write operations unless explicitly asked |
| `update-claude-md-on-refactor.md` | Keep CLAUDE.md in sync during large refactors |
| `clean-conditionals.md` | Prefer explicit multi-line `if` blocks over ternaries |
| `custom-confirm-modal.md` | Never use `window.confirm()` — build a custom modal instead |
| `timestamps-in-models.md` | All DB tables must have indexed `created_at` / `updated_at` |
| `update-banner-style.md` | Use bottom-fixed dark toast pattern for notifications |
| `url-state-management.md` | Persist UI state (filters, sort, tabs) in URL params |

### skills/

| Skill | Description |
|-------|-------------|
| `remember` | Save a new memory to `~/memories/` and import it into `personal.agent.md` |
| `get-context` | Quick codebase context retrieval using a lightweight model |
