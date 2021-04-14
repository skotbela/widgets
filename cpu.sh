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
  echo "---== CPU DATA ==---
  "

  grep -E 'model name|cpu cores|cpu MHz' /proc/cpuinfo |head -3

  echo ""
}

run_visual() {
  zenity \
    --info \
    --text="<span size=\"xx-large\">$(grep -E 'model name|cpu cores|cpu MHz' /proc/cpuinfo |head -3)</span>" \
    --title="CPU-Widget" \
    --ok-label="OK"
}

main "$@"
