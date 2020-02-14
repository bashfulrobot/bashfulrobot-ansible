#!/bin/bash

# Software Dependencies
neededSoftware=(software-properties-common ansible dialog git)

# These application vars are set here to avoid a chicken/egg scenario

# Where is the DPKG command?
DPKG=$(which dpkg)
# Where is the APT command?
APT=$(which apt)

# Check if software is installed and install with APT if needed.
function checkInstalled() {
  $DPKG -s "$1" 2>/dev/null >/dev/null || sudo $APT -y install "$1"
}

# Update APT Repos of older than 12 hours
if [ -z "$(find /var/cache/apt/pkgcache.bin -mmin -720)" ]; then
  sudo apt update
fi

# Install Software if needed
for sw in "${neededSoftware[@]}"; do
  checkInstalled "$sw"
done

### SCRIPT VARS

# These application vars are set after software deps are met

# Where is the ansible-playbook command?
ANSIBLE=$(which ansible-playbook)
# Where is the ansible-pull command?
APULL=$(which ansible-pull)
# Where is the git command?
GIT=$(which git)

# Local working root folder
MYLOCBASE="$HOME/tmp"
# Local repo path
MYREPO="$MYLOCBASE/bashfulrobot-ansible"
# Remote repo path
MYREPORMT="https://github.com/bashfulrobot/bashfulrobot-ansible.git"

# Configure git
$GIT config user.name bashfulrobot
$GIT config user.email dustin@bashfulrobot.com
$GIT config user.editor code-insiders

# Ansible Deploy from local GIT repo
function deployLocal() {
  if [ ! -f "$MYYAML" ]; then
    # Get the repo if needed
    mkdir -p $MYLOCBASE
    cd $MYLOCBASE
    $GIT clone $MYREPORMT
    cd $MYREPO
    git remote set-url origin git@github.com:bashfulrobot/bashfulrobot-ansible
  else
    cd $MYREPO
    # Get the latest version if exists.
    $GIT pull
  fi

  # Run ansible-pull no matter what (local dev iteration)
  $ANSIBLE $MYYAML --connection=local
}

# Setup Ansible CFG
if [ ! -f $HOME/.ansible.cfg ]; then
  touch $HOME/.ansible.cfg
  echo '[defaults]' >$HOME/.ansible.cfg
  echo 'remote_tmp     = /tmp/$USER/ansible' >>$HOME/.ansible.cfg
fi

# Build Menu
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Deploying ansible scripts"
TITLE="Ansible Deploy"
MENU="Choose one of the following options:"

OPTIONS=(1 "Local Repo Deploy All"
  2 "Local Repo Deploy ZSH"
  3 "Remote Repo Deploy All"
  4 "Local Repo Test Script")

CHOICE=$(dialog --clear \
  --backtitle "$BACKTITLE" \
  --title "$TITLE" \
  --menu "$MENU" \
  $HEIGHT $WIDTH $CHOICE_HEIGHT \
  "${OPTIONS[@]}" \
  2>&1 >/dev/tty)

clear

case $CHOICE in
1)
  echo "Running $MYREPO/local.yml"
  MYYAML="$MYREPO/local.yml"
  deployLocal
  ;;
2)
  echo "Running $MYREPO/local-test.yml"
  MYYAML="$MYREPO/local-test.yml"
  deployLocal
  ;;
3)
  echo "Running ansible-pull from $MYREPORMT"
  $APULL -U $MYREPORMT
  ;;
4)
  echo "Running $MYREPO/local-test.yml"
  MYYAML="$MYREPO/local-test.yml"
  deployLocal
  ;;
esac

exit 0
