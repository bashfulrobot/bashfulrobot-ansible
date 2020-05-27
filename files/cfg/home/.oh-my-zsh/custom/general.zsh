# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# Set Shell Theme
# - Note this is a custom theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Support additional terminal
export TERM=xterm-256color

# Daily updates - default is every 2 weeks
UPDATE_ZSH_DAYS=1

# Suggest corrections for incorrect commands.
ENABLE_CORRECTION="true"

# Go Settings
export GO111MODULE=on

# dch Settings for ubuntu packaging
export DEBFULLNAME="Dustin Krysak"
export DEBEMAIL="dustin@bashfulrobot.com"

# https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-3-install-awesome-powerline-fonts
#POWERLEVEL9K_MODE='awesome-patched'

export EDITOR=code-insiders

# Enable COD binary
source <(cod init $$ zsh)

# Add colour to MAN pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"