#!/usr/bin/env bash

###############
# Interactive #
###############

interactiveMenuOptions="
  inbox
  areas
  actions
  projects
  goals
  habits
  lists
  checklists
"

interactiveActions() {

  echo -n "Actions: "

  case $thisContent in
    "areas")
      echo -n "[add] [delete] [select] "
      ;;
    "inbox")
      echo -n "[add] [delete] [review] "
      ;;
    *)
      false
      ;;
  esac

  echo "[sync] [quit]"

}

interactiveAsk() {

  thisQuestion="${1}"
  thisAnswer=""

  clear

  read -p "${thisQuestion}: " thisAnswer

  export thisAnswer

}

interactiveCommand() {

  echo
  read -p "Command: " usrCommand

  case "${usrCommand}" in

    # Menu Options

    "inbox"|"areas")
      thisContent="${usrCommand}"
      ;;

    # Global Actions
    
    "quit")
      clear # Privacy ;)
      exit 0
      ;;

    # Local Actions

    "add")

      case "${thisContent}" in

        "areas")
          interactiveAsk "Area name"
          thisAreaName="${thisAnswer}"
          areaAdd "${thisAreaName}"
          ;;

        "inbox")
          interactiveAsk "Inbox item name"
          thisInboxItemName="${thisAnswer}"
          inboxAdd "${thisInboxItemName}"
          ;;

        *)
          false
          ;;
      esac

      ;;
      
    "delete")

      case "${thisContent}" in

        "areas")
          interactiveAsk "Area name"
          thisAreaName="${thisAnswer}"
          areaDelete "${thisAreaName}"
          ;;

        "inbox")
          interactiveAsk "Inbox item name"
          thisInboxItemName="${thisAnswer}"
          inboxDelete "${thisInboxItemName}"
          ;;

        *)
          false
          ;;
      esac

      ;;

    *)
      false
      ;;

  esac

}

interactiveContentAreas() {

  # List all Areas
  areaList

}

interactiveContentInbox() {

  # List first Inbox Items (limiting the output)
  inboxList | head

}

interactiveContentActions() {

  echo ">>> Available soon... <<<"

}

interactiveDraw() {

  thisContent="${1}"

  while [[ true ]]; do

    # Cleaning the screen
    clear

    # Header
    interactiveHeader

    # Menu
    interactiveMenu

    # Content
    interactiveContent${thisContent^}

    # Separator
    interactiveSeparator

    # Actions
    interactiveActions

    # User Command
    interactiveCommand

  done

}

interactiveHeader() {

  systemNameLenght="${#systemName}"
  systemVersionLenght="${#systemVersion}"
  terminalWidth="80"
  fixedWidth=7
  thisWhitespace=`echo "${terminalWidth}-${fixedWidth}-${systemNameLenght}-${systemVersionLenght}" | bc`

  echo "+------------------------------------------------------------------------------+"
  echo -n "|"
  printf " ${systemName} - ${systemVersion} "
  printf ' %.0s' $(seq 1 ${thisWhitespace})
  echo "|"
  echo "+------------------------------------------------------------------------------+"

}

interactiveMenu() {

  echo -n "Menu:"

  unset IFS
  for option in $interactiveMenuOptions ; do

    if [[ $option == $thisContent ]] ; then
      echo -n " [${option^^}]"
    else
      echo -n " [${option}]"
    fi

  done

  # Spacing
  echo ; echo

}

interactiveSeparator() {

  echo
  echo "+------------------------------------------------------------------------------+"
  echo

}