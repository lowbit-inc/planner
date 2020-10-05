#!/usr/bin/env bash

###########
# Backend #
###########

backendPath="${HOME}/.lowbit/planner"

backendAdd() {

  thisResource="${1}"
  thisEntry="${2}"
  thisResourcePath="${backendPath}/${thisResource}.csv"

  echo "${thisEntry}" >> "${thisResourcePath}"

  thisRC=$?

  return $thisRC

}

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

  thisRC=$?

  return $thisRC

}

backendList() {

  thisResource="${1}"
  thisFields="${2}"
  thisResourcePath="${backendPath}/${thisResource}.csv"

  tail -n +2 "${thisResourcePath}" | cut -d, -f "${thisFields}"

  thisRC=$?

  return $thisRC

}
