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

  line_number=$(ps axu | wc -l) # The command wc provides lineCount (-l), wordCount (-w), and charCount (-c)
  process_number=$((line_number-1))
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
