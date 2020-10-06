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
      logMessage info "Entry added to ${thisResource^}"
      ;;
    1)
      logMessage error "Entry already exists in ${thisResource^}"
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
      logMessage info "Entry deleted from ${thisResource^}"
      ;;
    1)
      logMessage error "Entry not found in ${thisResource^}"
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
