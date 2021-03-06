#!/usr/bin/env bash

#######
# CLI #
#######

cliAdd() {

  thisResource="${1}"
  thisKey="${2}"
  thisFields="${3}"

  backendAdd "${thisResource}" "${thisKey}" "${thisFields}"

  thisRC=$?

  case $thisRC in

    0)
      logMessage info "'${thisKey}' added to '${thisResource}'"
      ;;
    1)
      logMessage error "'${thisKey}' already exists in '${thisResource}'"
      ;;
    *)
      logMessage error "Unknown error"
      ;;

  esac

}

cliDelete() {

  thisResource="${1}"
  thisKey="${2}"

  backendDelete "${thisResource}" "${thisKey}"

  thisRC=$?

  case $thisRC in

    0)
      logMessage info "'${thisKey}' deleted from '${thisResource}'"
      ;;
    1)
      logMessage error "'${thisKey}' not found in '${thisResource}'"
      ;;
    *)
      logMessage error "Unknown error"
      ;;

  esac

}

cliList() {

  thisResource="${1}"
  thisFields="${2}"

  echo "${thisResource^}:"
  echo

  IFS=$'\n'
  for item in `backendList ${thisResource} ${thisFields}` ; do
    echo "- $item"
  done

}

cliSearch() {

  thisResource="${1}"
  thisFields="${2}"
  thisTerm="${3}"

  echo "${thisResource^} (searching for '${thisTerm}'):"
  echo

  IFS=$'\n'
  for item in `backendSearch ${thisResource} ${thisFields} ${thisTerm}` ; do
    echo "- $item"
  done

}
