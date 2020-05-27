# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

alias pcp='rsync -aP'

alias e='code-insiders -r'

alias opermissions="stat -c '%A %a %n'"
alias octperm="stat -c '%A %a %n'"

alias s="gnome-control-center sound"

alias espanso-list="cat $HOME/.config/espanso/default.yml | grep trigger | cut -d ' ' -f5 | less"

alias vpn-login="/usr/bin/nordvpn login"
alias vpn-logout="/usr/bin/nordvpn logout"
alias vpn-up="/usr/bin/nordvpn connect"
alias vpn-down="/usr/bin/nordvpn disconnect"
alias vpn-countries="/usr/bin/nordvpn countries"
alias vpn-cities="/usr/bin/nordvpn cities"
alias vpn-settings="/usr/bin/nordvpn settings"
alias vpn-status="/usr/bin/nordvpn status"
alias vpn-account="/usr/bin/nordvpn account"
alias vpn-help="/usr/bin/firefox https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-and-Linux-Mint.htm"

alias cat="batcat"