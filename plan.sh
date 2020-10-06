#!/usr/bin/env bash

########
# Libs #
########

# Backend libs
source libs/backend.sh

# Common libs
source libs/cli.sh
source libs/datetime.sh
source libs/log.sh
source libs/system.sh

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

  # Other
  
  *)
    logMessage error "Invalid command '${usrCommand}'"
    exit 1
    ;;

esac