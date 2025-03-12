#!/bin/bash

#Jokes File
JOKES_FILE="/home/kseniia/jokes.txt"

#Check for presence of joke file

if [ ! -s "$JOKES_FILE" ]; then
  echo "No jokes found. Please create a jokes.txt file with jokes"
  exit 1
fi

#Function: Tell a joke

function tell_joke {
  joke=$(shuf -n 1 "$JOKES_FILE")
  echo "$joke"
  if command -v espeak >/dev/null; then
    espeak "$joke"
  fi
}

#Funktion: Show time
function show_time {
  current_time=$(date "+%H:%M:%S")
  echo "Time $current_time"
  if command -v espeak >/dev/null; then
    espeak "The curent time is $current_time"
  fi
}

#Function solve the  equation
function solve_math {
  echo "enter the equation:4+5:"
  read equation
  result=$(echo "$equation" | bc -l 2>/dev/null)
  if [ $? -eq 0 ]; then
    echo "Result: $result"
    if comand -v espeak >/dev/null;then
      espeak "The result is $result"
    fi
  else
    echo "Error"
  fi
}

#Function: show weather
function show_weather {
  location=${1:-""} #option
  curl -s "wttr.in/$location?lang=ru$format=3"
}

#Function: interactive mode
function interactive_mode {
  echo "Hello! I'm your friend. How can i help?"
  echo "1) Tell a joke"
  echo "2) Show the time"
  echo "3) Solve the math"
  echo "4) Show the weather"
  echo "5) Exit"

  while true; do
    echo -n "Your choice: "
    read choice
    case $choice in
      1) tell_joke ;;
      2) show_time ;;
      3) solve_math ;;
      4)
        echo -n "Enter location or press ENTER for qurent location:"
        read location
        show_weather "$location" ;;
      5)echo "See you later!"; exit 0 ;;
    esac
  done
}

#Non interactive mode
if [ "$1" == "--joke" ]; then
  tell_joke
elif [ "$1" == "--time" ]; then
  show_time
elif [ "$1" == "--solve" ]; then
  show_math
elif [ "$1" == "--weather" ]; then
  show_weather "$2"
else
  interactive_mode
fi
