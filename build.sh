#!/usr/bin/zsh
source ./aliases

echo "Prerequisites:"
echo "* clone and compile node (with npm)"
echo "* install docker (https://blog.docker.com/2015/07/new-apt-and-yum-repos/) and have it running for yur user (https://docs.docker.com/installation/ubuntulinux/#optional-configurations-for-docker-on-ubuntu)"
echo "Please abort (you have 5 seconds) if this stuff ain't done!"

countdown 5

echo "Manually installing some packages:"
echo "You have 5 seconds to stop this operation..."

countdown 5

sudo apt-get install -y --allow-unauthenticated \
build-essential \
dropbox \
flashplugin-installer \
gimp \
git \
google-chrome-stable \
guake \
htop \
keepassx \
mysql-workbench \
pwgen \
screen \
vim \
virtualbox \
vlc \
whois \
zsh \

sudo apt-get remove -y thunderbird

echo "Creating docker images:"
echo "You have 5 seconds to stop this operation..."

countdown 5

find . -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*' |  \
sed 's/.\///' | \
awk {'print "echo BUILDING DOCKER IMAGE " $1 " && sudo docker build -t " $1 " " $1'} | \
bash

echo "Manually installing atom's extensions:"
echo "You have 5 seconds to stop this operation..."

countdown 5

apm install docblockr atom-beautify 

echo "Configuring git:"
echo "You have 5 seconds to stop this operation..."

countdown 5

git config core.fileMode false
git config --global push.default simple
git config --global core.editor vim
git config --global user.name "odino"
git config --global user.email "alessandro.nadalin@gmail.com"
git config --global core.excludesfile ~/.gitignore_global

echo "k8s ftw"

cd /tmp

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.23.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh


echo 'All done!'
