#!/usr/bin/env bash

#######
# CLI #
#######

cliAdd() {

  thisResource="${1}"
  thisEntry="${2}"

  if backendAdd "${thisResource}" "${thisEntry}" ; then
    logMessage info "Entry added to '${thisResource}'"
  else
    logMessage error "Faield to add entry to '${thisResource}'"
  fi

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
