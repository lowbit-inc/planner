#!/usr/bin/env bash

########
# Libs #
########

# Common libs
source libs/datetime.sh
source libs/log.sh
source libs/system.sh

# Backend libs
source libs/backend.sh

# Modes libs
source libs/cli.sh
source libs/interactive.sh

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
    interactiveDraw welcome
    ;;

  "version")
    systemGetVersion
    ;;

  # Objects commands

  "inbox")
    inboxRouter "${@}"
    ;;

  # Other

  *)
    logMessage error "Invalid command '${usrCommand}'"
    exit 1
    ;;

esac