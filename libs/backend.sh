#!/usr/bin/env bash

###########
# Backend #
###########

backendPath="${HOME}/.lowbit/planner"

backendBootstrap() {

  logMessage info "Bootstrapping backend resources"

  mkdir -p "${backendPath}"

  backendCreate inbox "name,timestamp"

}

backendCheck() {

  if [[ -d "${backendPath}" ]] ; then
    return 0
  else
    backendBootstrap
  fi

}

backendCreate() {

  thisResource="${1}"
  thisHeader="${2}"

  logMessage info "Initializing ${thisResource}"

  # Creating the resource
  echo "${thisHeader}" > "${backendPath}/${thisResource}.csv"

}

backendList() {

  thisResource="${1}"

  if [[ -f "${backendPath}/${thisResource}" ]] ; then
    true
  else
    backendCreate 
  fi

}