#!/usr/bin/zsh
source ./aliases

echo "Creating docker images:"
echo "You have 5 seconds to stop this operation..."

# countdown 5

find . -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*' |  \
sed 's/.\///' | \
awk {'print "echo BUILDING DOCKER IMAGE " $1 " && docker build -t " $1 " " $1'} | \
bash

echo "Manually installing some packages:"
echo "You have 5 seconds to stop this operation..."

countdown 5

sudo apt-get install -y \
atom \
build-essential \
dropbox \
flashplugin-installer \
gimp \
git \
google-chrome-stable \
guake \
htop \
keepassx \
lxc-docker \
mysql-workbench \
skype:i386 \
vim \
whois \
zsh \
