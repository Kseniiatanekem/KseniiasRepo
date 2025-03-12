#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Please pass the path as an argument."
  exit 1
fi

path=$1

if [ ! -e "$path" ]; then
  echo "Path does not exist."
  exit 1
fi

if [ -d "$path" ]; then
  echo "This is a directory. It contains: "
  ls -l "$path"
elif [ -f "$path" ]; then
  echo "This is the file: "
  cat "$path"
else
  echo "This is not a file or a directory."
fi
