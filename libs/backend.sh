#!/usr/bin/env bash

###########
# Backend #
###########

backendPath="${HOME}/.lowbit/planner"

backendAdd() {

  thisResource="${1}"
  thisKey="${2}"
  thisFields="${3}"
  thisResourcePath="${backendPath}/${thisResource}.csv"

  # Check if key already exists
  if tail -n +2 "${thisResourcePath}" | grep -e "^${thisKey}," >/dev/null 2>&1 ; then
    return 1 # RC1 = Key already exists
  fi

  echo "${thisKey},${thisFields}" >> "${thisResourcePath}"

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

backendDelete() {

  thisResource="${1}"
  thisKey="${2}"
  thisResourcePath="${backendPath}/${thisResource}.csv"

  # Check if key exists
  if ! tail -n +2 "${thisResourcePath}" | grep -e "^${thisKey}," >/dev/null 2>&1 ; then
    return 1 # RC1 = Key do not exists
  fi

  # echo "${thisKey},${thisFields}" >> "${thisResourcePath}"
  sed -i "/${thisKey},/d" "${thisResourcePath}"

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
