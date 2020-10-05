#!/usr/bin/env bash

########
# Libs #
########

# Backend libs
source libs/backend.sh

# Common libs
source libs/system.sh
source libs/datetime.sh
source libs/log.sh
source libs/cli.sh

# Objects libs
source libs/inbox.sh

##########
# Script #
##########

# Checking the backend
backendCheck

# Mapping user arguments
if [ $1 ] ; then
  usrCommand=$1 ; shift
else
  systemHelp
fi

# Main router
case "${usrCommand}" in

  # General commands

  "help")
    systemHelp
    ;;

  "start")
    true
    ;;

  "version")
    systemGetVersion
    ;;

  # Objects commands

  "inbox")
    inboxRouter "${@}"
    ;;

  *)
    systemHelp
    ;;

esac