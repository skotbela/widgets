#!/bin/bash

main() {
  option=$1
  if [[ "$option" == "visual" ]]
  then
    run_visual;
  else
    run_casual;
  fi
}

run_casual() {
  echo "---== USER DATA ==---
  "

  currently_logged_in_users=$(who | awk '{ print $1 }')
  echo "Currently logged in users: "
  echo "$currently_logged_in_users"

  echo ""
}

run_visual() {
  zenity \
  --info \
  --text="<span size=\"xx-large\">$(who | awk '{ print $1 }')</span>" \
  --title="Logged in as: " \
  --ok-label="OK"
}

main "$@"
