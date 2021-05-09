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
  echo "---== DISK DATA ==---
  "

  block_devices=$(lsblk| command grep disk | awk '{ print $1 }')
  echo "Available disks:  $block_devices"
  total_disk_space=$(df -h --total | command grep total | awk '{ print $2 }')
  echo "Total disk space: $total_disk_space"
  available_disk_space=$(df -h --total | command grep total | awk '{ print $3 }')
  echo "Available disk space: $available_disk_space"
  disk_usage=$(df -h --total | command grep total | awk '{ print $5 }')
  echo "Disk usage: $disk_usage"

  echo ""
}

run_visual() {
  zenity \
    --info \
    --text="<span size=\"xx-large\">$(lsblk| command grep disk | awk '{ print $1 }')</span>
    <span size=\"xx-large\">$(df -h --total | command grep total | awk '{ print $2 }')</span>
    <span size=\"xx-large\">$(df -h --total | command grep total | awk '{ print $5 }')</span>" \
    --title="Disk-Widget" \
    --ok-label="OK"
}

main "$@"