
# Script Analysis
## 📌 **Description**

This **Bash script** provides several interactive features, including telling jokes, showing the current time, solving math equations, and displaying the weather. It can operate in both **interactive and non-interactive** modes.

---

## 🔍 **Script Workflow**

### 1️⃣ **Jokes File Verification**

```bash
JOKES_FILE="/home/kseniia/jokes.txt"

if [ ! -s "$JOKES_FILE" ]; then
  echo "No jokes found. Please create a jokes.txt file with jokes"
  exit 1
fi
```

- The script **checks if a jokes file exists** and is not empty.
- If the file is missing, it prompts the user to create it and exits.

### 2️⃣ **Function: Tell a Joke**

```bash
function tell_joke {
  joke=$(shuf -n 1 "$JOKES_FILE")
  echo "$joke"
  if command -v espeak >/dev/null; then
    espeak "$joke"
  fi
}
```

- Randomly selects a joke using `shuf -n 1` from the joke file.
- If `espeak` is installed, it reads the joke aloud.

### 3️⃣ **Function: Show Current Time**

```bash
function show_time {
  current_time=$(date "+%H:%M:%S")
  echo "Time $current_time"
  if command -v espeak >/dev/null; then
    espeak "The current time is $current_time"
  fi
}
```

- Retrieves and displays the current time.
- Uses `espeak` to vocalize the time if available.

### 4️⃣ **Function: Solve Math Equations**

```bash
function solve_math {
  echo "Enter the equation: "
  read equation
  result=$(echo "$equation" | bc -l 2>/dev/null)
  if [ $? -eq 0 ]; then
    echo "Result: $result"
    if command -v espeak >/dev/null; then
      espeak "The result is $result"
    fi
  else
    echo "Error"
  fi
}
```

- Asks the user for a math equation.
- Uses `bc -l` for calculation.
- If `espeak` is installed, it reads the result.

### 5️⃣ **Function: Show Weather**

```bash
function show_weather {
  location=${1:-""} # Optional location argument
  curl -s "wttr.in/$location?lang=ru&format=3"
}
```

- Uses `curl` to fetch weather data from `wttr.in`.
- Supports an optional location argument.

### 6️⃣ **Function: Interactive Mode**

```bash
function interactive_mode {
  echo "Hello! I'm your friend. How can I help?"
  echo "1) Tell a joke"
  echo "2) Show the time"
  echo "3) Solve a math equation"
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
        echo -n "Enter location or press ENTER for current location: "
        read location
        show_weather "$location" ;;
      4) echo "See you later!"; exit 0 ;;
    esac
  done
}
```

- Provides a **menu-driven interface**.
- Allows users to select different functionalities interactively.
- Runs in a loop until the user chooses to exit.

### 7️⃣ **Non-Interactive Mode**

```bash
if [ "$1" == "--joke" ]; then
  tell_joke
elif [ "$1" == "--time" ]; then
  show_time
elif [ "$1" == "--solve" ]; then
  solve_math
elif [ "$1" == "--weather" ]; then
  show_weather "$2"
else
  interactive_mode
fi
```

- Supports **command-line arguments** for quick execution:
    - `--joke` → Tells a joke.
    - `--time` → Shows the current time.
    - `--solve` → Solves a math equation.
    - `--weather` → Displays weather info for a given location.
- If no arguments are provided, it defaults to **interactive mode**.

---

## ✅ **Key Features**

✔ **Multi-Functionality** → Jokes, Time, Math, and Weather.  
✔ **Interactive and Non-Interactive Modes** → Flexible usage.  
✔ **Speech Support** → Uses `espeak` to read responses aloud.  
✔ **Web Integration** → Fetches weather data from `wttr.in`.

---

## 🛠 **Possible Improvements**

1️⃣ **Fixing typos:** (`comand` → `command`, `qurent` → `current`). 2️⃣ **Improving input validation** (e.g., handling invalid math inputs better). 3️⃣ **Adding more command-line options** (e.g., `--help` for guidance). 4️⃣ **Allowing multi-language support** for jokes and responses.

🚀 **Would you like me to fix these issues and enhance the script?** 😊