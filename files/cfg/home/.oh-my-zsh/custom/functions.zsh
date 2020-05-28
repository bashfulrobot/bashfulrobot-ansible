# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

function asciinema-upload() {
  curl -v -u $USER:$(cat ~/.config/asciinema/install-id) https://asciinema.org/api/asciicasts -F asciicast=@$1
}

function myint() {
  ip -4 a | grep -v valid_lft | awk '{print $2}'
}

function catclip() {
  cat $1 | xclip -i -selection clipboard
}

function myip() {
  hostname -I | awk '{print $1}'
}

function myip() {
  curl -s https://myip.biturl.top/ | cut -d "%" -f1
}

function do-update() {
  runAptUpdateIfNeeded
  sleep 1
  echoSection "Updating Distro"
  sudo apt dist-upgrade -y
  sleep 1
  echoSection "Performing Autoremove"
  sudo apt clean -y
  sudo apt autoremove -y
  sleep 1
  echoSection "Adding Missing Deps"
  sudo apt install -f -y
  sleep 1
  echoHeader "Completed System Update"
}

function br-clone() {
  # Is GIT installed?
  checkInstalledApt git
  # Check if the repo exists already
  # GIT PULL if it does
  if [ -d "$HOME/tmp/$1" ]; then
    echo "Directory $HOME/tmp/$1 exists. Pulling remote repo instead."
    echo
    cd "$HOME/tmp/$1"
    git pull
    echo
  else
    # Repo does not exist, clone
    git clone git@github.com:bashfulrobot/$1 "$HOME/tmp/$1"
  fi

  echo
  echo "Current repo files ----"
  ls "$HOME/tmp/$1"
  echo
}

function cfg-update-pull() {
  ID=$(dconf dump /com/solus-project/budgie-panel/panels/ | grep { | cut -d '[' -f2 | cut -d ']' -f1)
  APULL=$(which ansible-pull)
  MYREPORMT="https://github.com/bashfulrobot/bashfulrobot-ansible.git"
  $APULL --extra-vars "PANEL_ID=$ID" -U $MYREPORMT
}

function cfg-local-apply() {

  ID=$(dconf dump /com/solus-project/budgie-panel/panels/ | grep { | cut -d '[' -f2 | cut -d ']' -f1)

  ANSIBLE=$(which ansible-playbook)
  GIT=$(which git)
  MYLOCBASE="$HOME/tmp"
  MYREPO="$MYLOCBASE/bashfulrobot-ansible"

  cd $MYREPO
  # $GIT pull

  $ANSIBLE --extra-vars "PANEL_ID=$(getPanelId)" $MYREPO/local.yml --connection=local
}

function cfg-update() {

  ID=$(dconf dump /com/solus-project/budgie-panel/panels/ | grep { | cut -d '[' -f2 | cut -d ']' -f1)

  ANSIBLE=$(which ansible-playbook)
  GIT=$(which git)
  MYLOCBASE="$HOME/tmp"
  MYREPO="$MYLOCBASE/bashfulrobot-ansible"

  cd $MYREPO
  $GIT pull

  $ANSIBLE --extra-vars "PANEL_ID=$(getPanelId)" $MYREPO/local.yml --connection=local
}

function rename-pad-num() {
  rename 's/\d+/sprintf("%04d",$&)/e' "$1"
}

function gh-rate-limit-reset-time() {
  # Are the apps installed?
  checkInstalledApt jq
  checkInstalledApt curl

  date -d @$(curl -X GET https://api.github.com/rate_limit | jq .rate.reset)
}

function gh-rate-limit() {
  # Are the apps installed?
  checkInstalledApt curl
  curl -X GET https://api.github.com/rate_limit
}

bwcopy() {
  checkInstalledApt fzf
  checkInstalledApt jq
  checkInstalledApt xclip

  if hash bw 2>/dev/null; then
    bw get item "$(bw list items | jq '.[] | "\(.name) | username: \(.login.username) | id: \(.id)" ' | fzf-tmux | awk '{print $(NF -0)}' | sed 's/\"//g')" | jq '.login.password' | sed 's/\"//g' | xclip -sel clip
  fi
}