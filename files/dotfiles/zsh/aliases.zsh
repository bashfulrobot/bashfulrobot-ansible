# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

alias pcp='rsync -aP'
alias cfg-pull='ansible-pull -U https://github.com/bashfulrobot/bashfulrobot-ansible.git'

alias e='code-insiders -r'

alias opermissions="stat -c '%A %a %n'"
alias octperm="stat -c '%A %a %n'"

alias s="gnome-control-center sound"

alias vpn-login="/usr/bin/nordvpn login"
alias vpn-logout="/usr/bin/nordvpn logout"
alias vpn-up="/usr/bin/nordvpn connect"
alias vpn-down="/usr/bin/nordvpn diconnect"
alias vpn-countries="/usr/bin/nordvpn countries"
alias vpn-cities="/usr/bin/nordvpn cities"
alias vpn-settings="/usr/bin/nordvpn settings"
alias vpn-status="/usr/bin/nordvpn status"
alias vpn-account="/usr/bin/nordvpn account"
