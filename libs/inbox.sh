#!/usr/bin/env bash

#########
# Inbox #
#########

inboxHelp() {

  echo "Usage:"
  echo "  `basename $0` inbox [COMMAND]"
  echo
  echo "Commands:"
  echo "  add ITEM      - Adds a new inbox item"
  echo "  list          - Lists all inbox items"
  echo "  search TERM   - Searchs for inbox items"
  echo "  delete ITEM   - Deletes an inbox item"
  echo
  exit 0

}

inboxList() {

  echo "Inbox:"

  backendList inbox

}

inboxRouter() {

  if [[ $1 ]] ; then
    usrCommand=$1 ; shift
  else
    inboxHelp
  fi

}