#!/usr/bin/env bash

#########
# Inbox #
#########

inboxAdd() {

  if [[ "${1}" ]] ; then
    thisInboxItemName="${@}"
  else
    logMessage error "Missing item name"
    exit 1
  fi

  thisTimestamp=`datetimeGetTimestamp`

  cliAdd "inbox" "${thisInboxItemName}" "${thisTimestamp}"

}

inboxDelete() {

  if [[ ${1} ]] ; then
    thisInboxItemName="${@}"
  else
    logMessage error "Missing item name"
    exit 1
  fi

  cliDelete "inbox" "${thisInboxItemName}"

}

inboxHelp() {

  echo "Usage:"
  echo "  `basename $0` inbox [COMMAND]"
  echo
  echo "Commands:"
  echo "  add ITEM      - Add a new inbox item"
  echo "  list          - List all inbox items"
  echo "  search TERM   - Search for inbox items"
  echo "  delete ITEM   - Delete an inbox item"
  echo
  exit 0

}

inboxList() {

  cliList "inbox" "1"

}

inboxRouter() {

  if [[ ${1} ]] ; then
    usrCommand=$1 ; shift
  else
    inboxHelp
  fi

  case "${usrCommand}" in

    "add")
      inboxAdd "${@}"
      ;;

    "delete")
      inboxDelete "${@}"
      ;;

    "list")
      inboxList
      ;;

    "search")
      inboxSearch "${@}"
      ;;
    
    *)
      logMessage error "Invalid command '${usrCommand}'"
      ;;

  esac

}

inboxSearch() {

  if [[ ${1} ]]; then
    thisTerm="${@}"
  else
    logMessage error "Missing search term"
    exit 1
  fi

  cliSearch "inbox" "1" "${thisTerm}"

}
