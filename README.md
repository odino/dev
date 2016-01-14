# Dev

Since I decided to install as less stuff as
possible on my machine, here I keep the
dockerfiles / shell configs that define
the tools and workflow I use.

You might not find most of this stuff super
useful, as it's simply a description of
what runs (mostly through docker) on my
dev machine.

* [odino.org/how-docker-changed-me/](http://odino.org/how-docker-changed-me/)

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

Runs Apache Benchmark:

```
ab -n 1000 -c 50 https://github.com/
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

### countdown

Triggers a countdown, useful for pausing bash scripts and
giving the user the ability to stop them:

```
~/projects/dev (master ✘)✹✭ ᐅ countdown 5
```

### docker-clean

Cleans docker directories:

```
~/projects/dev (master ✔) ᐅ docker-clean
Removing exited containers
9bdfbf4fcf06
Removing dangling images
...
```

### get-installed-packages

Prints a list of the stuff I have installed on my own,
so that I can review it and check if there's  anything
that should either be dockerized, removed or kept on my
host:

```
~/projects/dev (master ✘)✹✭ ᐅ get-installed-stuff
You have this stuff installed:

atom
build-essential
dropbox
flashplugin-installer
gimp
git
google-chrome-stable
guake
hipchat
htop
keepassx
lxc-docker
mysql-workbench
skype:i386
vim
whois
zsh

If you wish to install these packages:

sudo apt-get install -y \
atom \
build-essential \
dropbox \
flashplugin-installer \
gimp \
git \
google-chrome-stable \
guake \
hipchat \
htop \
keepassx \
lxc-docker \
mysql-workbench \
skype:i386 \
vim \
whois \
zsh \
```

### mysql-server

Launches a local mysql server:

```
~  ᐅ mysql-server
=> Using an existing volume of MySQL
=> Creating MySQL user ...
========================================================================
You can now connect to this MySQL Server using:

    mysql -uroot -proot -h<host> -P<port>

MySQL user 'root' has no password but only allows local connections
========================================================================
=> importdb option selected was no
=> No need for re-importing the databases
=> Starting MySQL Server ...
```

### mysql-local

Connect to the local mysql instance:

```
~  ᐅ mysql-local
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1
Server version: 5.6.19-0ubuntu0.14.04.1 (Ubuntu)

Copyright (c) 2000, 2015, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

### ngrok

Runs [ngrok](https://ngrok.com/) locally, so that I can
[expose stuff I am working on the internet](http://odino.org/how-to-test-3rd-party-hooks-and-webservices-locally/):

```
~  ᐅ ngrok 8888
[07/20/15 08:10:16] [INFO] Reading configuration file /.ngrok
[07/20/15 08:10:16] [INFO] [client] Trusting root CAs: [assets/client/tls/ngrokroot.crt]
[07/20/15 08:10:16] [INFO] [view] [web] Serving web interface on 127.0.0.1:4040
[07/20/15 08:10:16] [INFO] Checking for update
[07/20/15 08:10:17] [DEBG] [ctl:672c001e] New connection to: 96.126.125.171:443
[07/20/15 08:10:17] [DEBG] [ctl:672c001e] Writing message: {"Type":"Auth","Payload":{"Version":"2","MmVersion":"1.7","User":"","Password":"","OS":"linux","Arch":"amd64","ClientId":""}}
[07/20/15 08:10:17] [DEBG] [ctl:672c001e] Waiting to read message
```

### play

Spins up a bare-minimum linux image ([alpine](https://github.com/gliderlabs/docker-alpine))
for you to play:

```
~  ᐅ play
/ # ls -la
total 56
drwxr-xr-x   30 root     root          4096 Jul 23 06:36 .
drwxr-xr-x   30 root     root          4096 Jul 23 06:36 ..
-rwxr-xr-x    1 root     root             0 Jul 23 06:36 .dockerenv
-rwxr-xr-x    1 root     root             0 Jul 23 06:36 .dockerinit
drwxr-xr-x    2 root     root          4096 Jul 23 06:33 bin
drwxr-xr-x    5 root     root           380 Jul 23 06:36 dev
drwxr-xr-x   19 root     root          4096 Jul 23 06:36 etc
drwxr-xr-x    2 root     root          4096 Jun 12 19:19 home
drwxr-xr-x    7 root     root          4096 Jul 23 06:33 lib
lrwxrwxrwx    1 root     root            12 Jun 12 19:19 linuxrc -> /bin/busybox
drwxr-xr-x    5 root     root          4096 Jun 12 19:19 media
drwxr-xr-x    2 root     root          4096 Jun 12 19:19 mnt
dr-xr-xr-x  290 root     root             0 Jul 23 06:36 proc
drwx------    2 root     root          4096 Jul 23 06:36 root
drwxr-xr-x    2 root     root          4096 Jun 12 19:19 run
drwxr-xr-x    2 root     root          4096 Jul 23 06:33 sbin
dr-xr-xr-x   13 root     root             0 Jul 23 06:36 sys
drwxrwxrwt    2 root     root          4096 Jun 12 19:19 tmp
drwxr-xr-x   12 root     root          4096 Jul 23 06:33 usr
drwxr-xr-x   10 root     root          4096 Jul 23 06:32 var
/ #
```

### unrar

Extracts a `rar` archive in the current directory:

```
~/Downloads/rar (master ✔) ᐅ unrar archive.rar

UNRAR 5.21 freeware      Copyright (c) 1993-2015 Alexander Roshal


Extracting from archive.rar
```
