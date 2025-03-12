#!/bin/bash

#check if there is an argument
if [ $# -lt 1 ]; then
  echo "Error: ./delet_script.sh <filename1> <filename2>..."
  exit 1
fi

#Go through all the transferred files
for file in "$@"; do

#Check if  the file exist
  if [ ! -f "$file" ]; then
    echo "File $file does not exist"
    continue
  fi

#Request for confirmation
  read -p "Are you sure you want to delete this file "$file"? (y/n): " answer

#Perform or cancel the deletion
  if [ "$answer" = "y" ]; then
    rm "$file"
    echo "File $file deleted."
  else
    echo "Deletion cancelled."
  fi
done
