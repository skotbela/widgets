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

  all_users=$(getent passwd |awk -F':' '{ print $1}')
  echo "All users: "
  echo "$all_users"

  all_groups=$(getent group |awk -F':' '{ print $1}')
  echo "All groups: "
  echo "$all_groups"

  echo ""
}

run_visual() {
  zenity \
  --info \
  --text="<span size=\"xx-large\">$(who | awk '{ print $1 }')</span>
  <span size=\"xx-large\">$(getent passwd |awk -F':' '{ print $1}')</span>
  <span size=\"xx-large\">$(getent group |awk -F':' '{ print $1}')</span>" \
  --title="User-Widget" \
  --ok-label="OK"
}

main "$@"
