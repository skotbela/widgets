#!/bin/bash

currently_logged_in_users=$(who | awk '{ print $1 }')
echo "Currently logged in users: "
echo $currently_logged_in_users

all_users=$(getent passwd |awk -F':' '{ print $1}')
echo "All users: "
echo $all_users

all_groups=$(getent group |awk -F':' '{ print $1}')
echo "All groups: "
echo $all_groups

