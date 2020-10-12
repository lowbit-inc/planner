#!/usr/bin/env bash

#########
# Areas #
#########

areasAdd() {

  if [[ "${1}" ]] ; then
    thisAreaName="${@}"
  else
    logMessage error "Missing area name"
    exit 1
  fi

  thisTimestamp=`datetimeGetTimestamp`

  cliAdd "areas" "${thisAreaName}" "${thisTimestamp}"

}

areasDelete() {

  if [[ ${1} ]] ; then
    thisAreaName="${@}"
  else
    logMessage error "Missing area name"
    exit 1
  fi

  cliDelete "areas" "${thisAreaName}"

}

areasHelp() {

  echo "Usage:"
  echo "  `basename $0` areas [COMMAND]"
  echo
  echo "Commands:"
  echo "  add AREA      - Add a new area"
  echo "  list          - List all areas"
  echo "  delete AREA   - Delete an area"
  echo
  exit 0

}

areasList() {

  cliList "areas" "1"

}

areasRouter() {

  if [[ ${1} ]] ; then
    usrCommand=$1 ; shift
  else
    areasHelp
  fi

  case "${usrCommand}" in

    "add")
      areasAdd "${@}"
      ;;

    "delete")
      areasDelete "${@}"
      ;;

    "list")
      areasList
      ;;

    *)
      logMessage error "Invalid command '${usrCommand}'"
      ;;

  esac

}
