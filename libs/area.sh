#!/usr/bin/env bash

########
# Area #
########

areaAdd() {

  if [[ "${1}" ]] ; then
    thisAreaName="${@}"
  else
    logMessage error "Missing area name"
    exit 1
  fi

  thisTimestamp=`datetimeGetTimestamp`

  cliAdd "area" "${thisAreaName}" "${thisTimestamp}"

}

areaDelete() {

  if [[ ${1} ]] ; then
    thisAreaName="${@}"
  else
    logMessage error "Missing area name"
    exit 1
  fi

  cliDelete "area" "${thisAreaName}"

}

areaHelp() {

  echo "Usage:"
  echo "  `basename $0` area [COMMAND]"
  echo
  echo "Commands:"
  echo "  add AREA      - Add a new area"
  echo "  list          - List all areas"
  echo "  delete AREA   - Delete an area"
  echo
  exit 0

}

areaList() {

  cliList "area" "1"

}

areaRouter() {

  if [[ ${1} ]] ; then
    usrCommand=$1 ; shift
  else
    areaHelp
  fi

  case "${usrCommand}" in

    "add")
      areaAdd "${@}"
      ;;

    "delete")
      areaDelete "${@}"
      ;;

    "list")
      areaList
      ;;

    *)
      logMessage error "Invalid command '${usrCommand}'"
      ;;

  esac

}
