# Dockerfiles

Since I decided to install as less stuff as
possible on my machine, here I keep the
dockerfiles that define the tools I use.

You might not find most of this stuff super
useful, as it's simply a description of
what runs through docker on my dev machine.

## Installation

As simple as:

```
chmod +x build.sh
./build.sh
```

To set the commands up, just source the aliases
file in your `.bashrc` / `.zshrc` / `.whateverrc`:

```
source /path/to/odino/dockerfiles/aliases
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