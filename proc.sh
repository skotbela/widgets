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
  echo "---== PROCESS DATA ==---
  "

  process_number=$(ps axu | wc -l)
  echo "Number of running processes: $process_number"

  echo ""
}

run_visual() {
  zenity \
    --info \
    --text="<span size=\"xx-large\">$(ps axu | wc -l)</span>" \
    --title="Process-Widget" \
    --ok-label="OK"
}

main "$@"
