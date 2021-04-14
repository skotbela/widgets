#!/bin/bash

main() {
  if [[ "$1" == "visual" ]]
  then
    widget_control "visual"
  else
    widget_control
  fi
}

widget_control() {
  if [ -z ${WIDGET_CONTROL+x} ]; then
    ./mem.sh "$1"
    ./cpu.sh "$1"
  else
    select_widget "$1"
  fi
}

select_widget() {
  visual=$1
  i=1
  while [ "$i" -lt 6 ]; do
    file_var=$(echo "${WIDGET_CONTROL}" | cut -d',' -f"$i")
    if [[ -z "$file_var" ]]; then
      echo ""
      tput cuu1
      tput el
    elif [[ "$visual" == "visual" ]]
      then
        run_visual "$file_var" "visual"
    elif [[ -z "$visual" ]]
      then
        run_casual "$file_var"
    fi
    i=$((i + 1))
  done
}

run_visual() {
  gnome-terminal -- "./$1.sh" "$2"
}

run_casual() {
  echo "$1"
  "./$1.sh"
}

main "$@"
