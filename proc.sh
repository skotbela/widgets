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
  process_number=$(ps axu | wc -l)
  echo "Number of running processes: $process_number"
}

run_visual() {
  zenity \
    --info \
    --text="<span size=\"xx-large\">$(ps axu | wc -l).</span>" \
    --title="Memory-Widget" \
    --ok-label="OK"
}

main "$@"
