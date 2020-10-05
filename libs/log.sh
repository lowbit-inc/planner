#!/usr/bin/env bash

#######
# Log #
#######

logMessage() {

  thisLogLevel="${1}"
  thisLogString="${2}"
  thisTimestamp=`datetimeGetTimestamp`
  shouldPrint="true"
  shouldExit="false"

  case "${thisLogLevel}" in

    "info")
      thisLogLevelToPrint="INFO "
      shouldPrint=true
      shouldExit=false
      ;;

    *)
      return 1
      ;;

  esac

  # Printing the log message
  if [[ "${shouldPrint}" == "true" ]] ; then
    echo "[${thisTimestamp}] [${thisLogLevelToPrint}] ${thisLogString}"
  fi

  # Checking if needs to exit
  if [[ "${shouldExit}" == "true" ]] ; then
    exit 1
  fi

}