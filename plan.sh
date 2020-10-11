#!/usr/bin/env bash

########
# Libs #
########

# Common libs
source libs/backend.sh
# source libs/color.sh # Soon
source libs/cli.sh
source libs/datetime.sh
source libs/interactive.sh
source libs/log.sh
source libs/system.sh

# Objects libs
source libs/area.sh
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
    interactiveDraw inbox
    ;;

  "version")
    systemGetVersion
    ;;

  # Objects commands

  "area")
    areaRouter "${@}"
    ;;

  "inbox")
    inboxRouter "${@}"
    ;;

  # Other

  *)
    logMessage error "Invalid command '${usrCommand}'"
    exit 1
    ;;

esac