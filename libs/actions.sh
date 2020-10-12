#!/usr/bin/env bash

###########
# Actions #
###########

actionsAdd() {

  # Initial values
  thisAreaName=""
  thisActionName=""

  # Processing input
  while [[ "${1}" ]] ; do

    case "${1}" in

      "--area")
        shift
        if [[ "${1}" ]] ; then
          thisAreaName="${1}" ; shift
        else
          logMessage error "Missing area name"
          exit 1
        fi
        ;;
      "--name")
        shift
        if [[ "${1}" ]] ; then
          thisActionName="${1}" ; shift
        else
          logMessage error "Missing action name"
          exit 1
        fi
        ;;
      *)
        logMessage error "Unknown parameter '${1}'"
        exit 1
        ;;

    esac

  done

  # Required parameters
  if [[ -z ${thisAreaName} ]] ; then
    logMessage error "Missing 'area' parameter"
    exit 1
  fi

  if [[ -z ${thisActionName} ]] ; then
    logMessage error "Missing 'name' parameter"
    exit 1
  fi

  # Validating input
  if ! backendKeyExists "areas" "${thisAreaName}" ; then
    logMessage error "Area '${thisAreaName}' not found"
    exit 1
  fi

  # Adding
  thisTimestamp=`datetimeGetTimestamp`

  cliAdd "actions" "${thisActionName}" "${thisTimestamp},${thisAreaName}"

}

# inboxDelete() {

#   if [[ ${1} ]] ; then
#     thisInboxItemName="${@}"
#   else
#     logMessage error "Missing item name"
#     exit 1
#   fi

#   cliDelete "inbox" "${thisInboxItemName}"

# }

actionsHelp() {

  echo "Usage:"
  echo "  `basename $0` actions [COMMAND]"
  echo
  echo "Commands:"
  echo "  add --area AREA --name ITEM       - Add an action"
  echo "  list [--area AREA]                - List actions"
  echo "  search [--area AREA] --name ITEM  - Search for an action"
  echo "  delete --area AREA --name ITEM    - Delete an action"
  echo
  exit 0

}

# inboxList() {

#   cliList "inbox" "1"

# }

actionsRouter() {

  if [[ ${1} ]] ; then
    usrCommand=$1 ; shift
  else
    actionsHelp
  fi

  case "${usrCommand}" in

    "add")
      actionsAdd "${@}"
      ;;

    "delete")
      actionsDelete "${@}"
      ;;

    "list")
      actionsList "${@}"
      ;;

    "search")
      actionsSearch "${@}"
      ;;
    
    *)
      logMessage error "Invalid command '${usrCommand}'"
      ;;

  esac

}

# inboxSearch() {

#   if [[ ${1} ]]; then
#     thisTerm="${@}"
#   else
#     logMessage error "Missing search term"
#     exit 1
#   fi

#   cliSearch "inbox" "1" "${thisTerm}"

# }
