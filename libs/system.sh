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
  echo "  help      - Print main help message"
  echo "  start     - Start interactive mode"
  echo "  sync      - Sync backend"
  echo "  version   - Print CLI version"
  echo
  echo "Objects commands:"
  echo "  action    - Actions operations"
  echo "  area      - Areas operations"
  echo "  checklist - Checklists operations"
  echo "  goal      - Goals operations"
  echo "  habit     - Habits operations"
  echo "  inbox     - Inbox operations"
  echo "  lists     - Lists operations"
  echo "  project   - Projects operations"
  echo
  exit 0

}

systemGetVersion() {

  echo "${systemName} - ${systemVersion}"
  exit 0

}