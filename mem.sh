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
  echo "---== MEMORY DATA ==---
  "

  grep -E "MemFree|MemTotal" /proc/meminfo

  echo ""
}

run_visual() {
  zenity \
  --info \
  --text="<span size=\"xx-large\">$(grep -E "MemFree|MemTotal" /proc/meminfo)</span>" \
  --title="Memory-Widget" \
  --ok-label="OK"
}

main "$@"