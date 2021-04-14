#!/bin/bash

#usage_data=$(df -h --total | command grep total | head -1)
#result_data=$(cut -f 1 $usage_data)
#echo $result_data
block_devices=$(lsblk| command grep disk | awk '{ print $1 }')
echo "Available disks: " $block_devices
total_disk_space=$(df -h --total | command grep total | awk '{ print $2 }')
echo "Total disk space: $total_disk_space"
available_disk_space=$(df -h --total | command grep total | awk '{ print $3 }')
echo "Available disk space: $available_disk_space"
disk_usage=$(df -h --total | command grep total | awk '{ print $5 }')
echo "Disk usage: $disk_usage"
