#!/usr/bin/env bash

##########
# System #
##########

systemName="Lowbit Planner"
systemVersion="v1.0.0-dev"

systemHelp() {

  echo "Usage:"
  echo "  `basename $0` COMMAND [SUBCMOMAND]"
  echo
  echo "General commands:"
  echo "  help      - Prints main help"
  echo "  start     - Start interactive mode"
  echo "  version   - Prints CLI version"
  echo
  echo "Objects commands:"
  echo "  inbox     - Inbox operations"
  echo
  exit 0

}

systemGetVersion() {

  echo "${systemName} - ${systemVersion}"
  exit 0

}