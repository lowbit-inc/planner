#!/usr/bin/env bash

###############
# Interactive #
###############

interactiveMenus="
  inbox
  areas
"

interactiveActions() {

  echo

  echo "+------------------------------------------------------------------------------+"
  echo "| Actions: [add] [list] [search] [delete]                                      |"
  echo "+------------------------------------------------------------------------------+"

  echo

}

interactiveCommand() {

  read -p "Command: " usrCommand

}

interactiveContentWelcome() {

  echo "Welcome to Lowbit Planner."

}

interactiveDraw() {

  thisContent="${1}"

  # Cleaning the screen
  clear

  # Header
  interactiveHeader

  # Menu
  interactiveMenu

  # Content
  interactiveContent${thisContent^}

  # Actions
  interactiveActions

  # User Command
  interactiveCommand

}

interactiveHeader() {

  echo "+----------------------- ${systemName} - ${systemVersion} --------------------------+"
  echo "|                                                                              |"

}

interactiveMenu() {

  echo -n "+-------------------------- Menu:"

  for item in $interactiveMenus ; do
    echo -n " [$item]"
  done

  echo " -----------------------------+" ; echo

}
