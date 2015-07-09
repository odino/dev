# Dockerfiles

Since I decided to install as less stuff as
possible on my machine, here I keep the
dockerfiles that define the tools I use.

## Aliases

```
cap="docker run -ti -v $(pwd):/src -v ~/.ssh/:/ssh cap"
```

## Available commands

### cap

Deploy using capistrano; copies the current folder
into a container, mounts your ssh keys and executes
then you can just type ↑ to get the command to deploy
your app.

```
cd path/to/project
cap
root@39de5d514f5a:/src# sshsetup && cap deploy -S branch=... -S user=anadalin
```