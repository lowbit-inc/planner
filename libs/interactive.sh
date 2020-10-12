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

  case "${thisMenu^}${thisContent^}" in
    "AreasList")
      echo -n "[add] [delete] [select] "
      ;;
    "InboxList")
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
      thisMenu="${usrCommand}"
      thisContent="list"
      ;;

    # Global Actions
    
    "quit")
      clear # Privacy ;)
      exit 0
      ;;

    # Local Actions

    "add")

      case "${thisMenu^}${thisContent^}" in

        "AreasList")
          interactiveAsk "Area name"
          thisAreaName="${thisAnswer}"
          areasAdd "${thisAreaName}"
          ;;

        "InboxList")
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

      case "${thisMenu^}${thisContent^}" in

        "AreasList")
          interactiveAsk "Area name"
          thisAreaName="${thisAnswer}"
          areasDelete "${thisAreaName}"
          ;;

        "InboxList")
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

interactiveContentActionsList() {

  echo ">>> Available soon... <<<"

}

interactiveContentAreasList() {

  # List all Areas
  areasList

}

interactiveContentInboxList() {

  # List first Inbox Items (limiting the output)
  inboxList | head

}

interactiveContentMiscWelcome() {

  echo "Welcome to ${systemName}."
  echo
  echo "=> Type the name of a [menu] to change between contexts."
  echo "=> Type the name of an [action] to interact."

}

interactiveDraw() {

  thisMenu="${1}"
  thisContent="${2}"

  while [[ true ]]; do

    # Cleaning the screen
    clear

    # Header
    interactiveHeader

    # Menu
    interactiveMenu

    # Content
    interactiveContent${thisMenu^}${thisContent^}

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

    if [[ $option == $thisMenu ]] ; then
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