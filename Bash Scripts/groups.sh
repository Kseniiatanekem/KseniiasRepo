#!/bin/bash

#Users groups
username=$(whoami)
groups_list=$(groups $username)

#Split groups into an array
groups_array=($groups_list)

#deleted users name from the array

groups_array=("${groups_array[@]:2}")

# We go through the groups and display information
for group in "${groups_array[@]}"; do
  echo "$username is a part of group $group"
done

