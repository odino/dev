# Dockerfiles

Since I decided to install as less stuff as
possible on my machine, here I keep the
dockerfiles / shell configs that define
the tools and workflow I use.

You might not find most of this stuff super
useful, as it's simply a description of
what runs (mostly through docker) on my
dev machine.

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

### atm

Launches the atom editor on the current directory.

```
cd projects/my-app
atm
```

### blog

Launches a container through `docker-compose` running
[odino.org](http://odino.org) on port `4000`.

```
~  ᐅ blog
Agent pid 10
Identity added: //.ssh/id_rsa (//.ssh/id_rsa)
root@cf8e192c4a71:/src# octopreview
Starting to watch source with Jekyll and Compass. Starting Rack on port 4000
[2015-07-12 20:31:33] INFO  WEBrick 1.3.1
[2015-07-12 20:31:33] INFO  ruby 1.9.3 (2013-11-22) [x86_64-linux]
[2015-07-12 20:31:33] INFO  WEBrick::HTTPServer#start: pid=21 port=4000
Configuration from /src/_config.yml
Auto-regenerating enabled: source -> public
[2015-07-12 20:31:34] regeneration: 654 files changed

Dear developers making use of FSSM in your projects,
FSSM is essentially dead at this point. Further development will
be taking place in the new shared guard/listen project. Please
let us know if you need help transitioning! ^_^b
- Travis Tilley

AliasGenerator loading...
Processing 224 post(s) for aliases...
>>> Compass is polling for changes. Press Ctrl-C to Stop.
Processing 56 page(s) for aliases...
```

I have some [aliases](https://github.com/odino/odino.github.com/blob/source/.bashrc)
setup for octopress that you might find useful.
