#!/bin/bash

  APULL=$(which ansible-pull)

  MYREPORMT="https://github.com/bashfulrobot/bashfulrobot-ansible.git"

  sudo $APULL --extra-vars "PANEL_ID=$(dconf dump /com/solus-project/budgie-panel/panels/ | grep { | cut -d '[' -f2 | cut -d ']' -f1)" -U $MYREPORMT > /dev/null