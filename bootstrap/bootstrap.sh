#!/usr/bin/env bash

sudo apt install git ansible openssh-server dialog gpg seafile-cli vim-nox -y

mkdir -p ~/tmp

cd ~/tmp

git clone https://github.com/bashfulrobot/bashfulrobot-ansible.git

exit 0