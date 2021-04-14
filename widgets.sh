#!/bin/bash

main() {
  if [ -z ${WIDGET_CONTROL+x} ]; then
    ./mem.sh
    ./cpu.sh
  else
    select_widget
  fi
}

select_widget() {
  i=1
  while [ "$i" -lt 6 ]; do
    file_var=$(echo "${WIDGET_CONTROL}" | cut -d',' -f"$i")
    if [[ -z "$file_var" ]]; then
      echo ""
      tput cuu1
      tput el
    else
      source ./$file_var.sh
    fi
    i=$((i + 1))
  done
}

main