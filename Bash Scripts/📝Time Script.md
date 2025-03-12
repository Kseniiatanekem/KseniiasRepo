# 📝 Bash Script Analysis

## 📌 **Description**

This **Bash script** provides basic system information, including the **current date and time**, the **logged-in username**, and the **current working directory**.

---

## 🔍 **Script Workflow**

### 1️⃣ **Display Current Date and Time**

```bash
echo "Current date and time: $(date)"
```

- Uses the `date` command to retrieve the current **date and time** and prints it.

### 2️⃣ **Display Logged-in Username**

```bash
echo "Hello, $(whoami)"
```

- Uses `whoami` to **get the current user's name** and greets them.

### 3️⃣ **Display Current Directory**

```bash
echo "Current directory: $(pwd)"
```

- Uses `pwd` (**print working directory**) to show the **user’s current location** in the filesystem.

---

## ✅ **Key Features**

✔ **Displays Date and Time** → Shows the current timestamp.  
✔ **Identifies the User** → Greets the logged-in user.  
✔ **Shows Current Directory** → Helps users verify their location.

---

## ⚡ **Usage Example**

### 📌 Running the script:

```bash
./system_info.sh
```

#### **Example Output:**

```bash
Current date and time: Wed Mar 13 14:30:00 UTC 2024
Hello, user123
Current directory: /home/user123
```

---

## 🛠 **Possible Improvements**

1️⃣ **Fix Typographical Errors** → "Curent" → "Current", "dirrectory" → "directory".  
2️⃣ **Enhance Output Formatting** → Add spacing or styling for readability.  
3️⃣ **Include System Uptime** → Show how long the system has been running.

🚀 **Would you like me to implement these improvements?** 😊