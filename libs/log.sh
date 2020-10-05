#!/usr/bin/env bash

#######
# Log #
#######

logMessage() {

  thisLogLevel="${1}"
  thisLogString="${2}"
  thisTimestamp=`datetimeGetTimestamp`
  shouldPrint="true"

  case "${thisLogLevel}" in

    "error")
      thisLogLevelToPrint="ERROR"
      ;;

    "info")
      thisLogLevelToPrint="INFO "
      ;;

    *)
      echo "Error: unknown log level (${thisLogLevel})"
      return 1
      ;;

  esac

  # Printing the log message
  if [[ "${shouldPrint}" == "true" ]] ; then
    echo "[${thisTimestamp}] [${thisLogLevelToPrint}] ${thisLogString}"
  fi

}