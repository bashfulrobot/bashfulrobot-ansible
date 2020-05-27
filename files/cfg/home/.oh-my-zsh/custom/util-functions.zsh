# These utilities are used in multiple
# zsh functions on my system

# Vars
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
NC=$(tput sgr0)

ONLINE="${GREEN}online$NC"
OFFLINE="${RED}offline$NC"

function echoHeader() {
  echo
  echo
  printf "%40s \n" "[$RED $1 $NC]"
  # echo "> > >  $1 =========="
  echo
}

function echoSection() {
  echo
  echo
  printf "$GREEN > > > $NC %1s \n" "$YELLOW $1 $NC"
  # echo "> > >  $1 =========="
  echo
}

function checkInstalledApt() {
  dpkg -s "$1" 2>/dev/null >/dev/null || sudo apt install -y "$1"
}

function runAptUpdateIfNeeded() {
  # Update APT Repos of older than 12 hours
  if [ -z "$(find /var/cache/apt/pkgcache.bin -mmin -720)" ]; then
    sudo apt update
  fi
}

# This is a general-purpose function to ask Yes/No questions in Bash, either
# with or without a default answer. It keeps repeating the question until it
# gets a valid answer.

ask() {
  # https://gist.github.com/davejamesmiller/1965569
  local prompt default reply

  if [ "${2:-}" = "Y" ]; then
    prompt="Y/n"
    default=Y
  elif [ "${2:-}" = "N" ]; then
    prompt="y/N"
    default=N
  else
    prompt="y/n"
    default=
  fi

  while true; do

    # Ask the question (not using "read -p" as it uses stderr not stdout)
    echo -n "$1 [$prompt] "

    # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
    read reply </dev/tty

    # Default?
    if [ -z "$reply" ]; then
      reply=$default
    fi

    # Check if the reply is valid
    case "$reply" in
    Y* | y*) return 0 ;;
    N* | n*) return 1 ;;
    esac

  done
}

######
# Example usage of "ask" function.
#
### EXAMPLE USAGE:

#if ask "Do you want to do such-and-such?"; then
#    echo "Yes"
#else
#    echo "No"
#fi

## Default to Yes if the user presses enter without giving an answer:
#if ask "Do you want to do such-and-such?" Y; then
#    echo "Yes"
#else
#    echo "No"
#fi

## Default to No if the user presses enter without giving an answer:
#if ask "Do you want to do such-and-such?" N; then
#    echo "Yes"
#else
#    echo "No"
#fi

## Only do something if you say Yes
#if ask "Do you want to do such-and-such?"; then
#    said_yes
#fi

## Only do something if you say No
#if ! ask "Do you want to do such-and-such?"; then
#    said_no
#fi

## Or if you prefer the shorter version:
#ask "Do you want to do such-and-such?" && said_yes

#ask "Do you want to do such-and-such?" || said_no

function send-notify() {
  # This is not actually a token in the code - just a UUID for the entry in Bitwarden.

  # Get my token from my vault.
  MYTOKEN="$(bw get password b43eb18a-1806-45dc-8dfd-aa6901533182)"
  THEURL="https://integram.org/webhook/$MYTOKEN"
  MYMSG="$1"
  PAYLOAD=$(printf "{\"text\":\"%s\"}" "$MYMSG")

  # Check if Bitwarden is logged in.
  if [[ -z "${BW_SESSION}" ]]; then
    echo "W_SESSION is undefined - Likely need to login to BW CLI or set the export"
  else
    curl -X POST -H "Content-Type: application/json" --data "$PAYLOAD" $THEURL
  fi
}
