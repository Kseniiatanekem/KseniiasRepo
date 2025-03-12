

## 📌 **Description**

This **Bash script** is designed to delete files **with user confirmation**. Let's break down its logic step by step.

---

## 🔍 **Script Workflow**

### 1️⃣ **Checking for Arguments**

```bash
if [ $# -lt 1 ]; then
  echo "Error: ./delet_script.sh <filename1> <filename2>..."
  exit 1
fi
```

- `$#` represents the number of command-line arguments.
- If no arguments are provided, the script prints an error message and exits.

### 2️⃣ **Looping Through Provided Files**

```bash
for file in "$@"; do
```

- `$@` contains all the filenames passed as arguments.
- The `for` loop iterates through each filename.

### 3️⃣ **Checking if the File Exists**

```bash
if [ ! -f "$file" ]; then
  echo "File $file does not exist"
  continue
fi
```

- `-f "$file"` checks whether the file exists and is a regular file (not a directory).
- If the file **does not exist**, the script prints a message and moves to the next file (`continue`).

### 4️⃣ **Asking for User Confirmation**

```bash
read -p "Are you sure you want to delete this file "$file"? (y/n): " answer
```

- `read -p` displays a prompt and waits for user input.
- The response (`y` or `n`) is stored in the variable `$answer`.

### 5️⃣ **Deleting the File (if confirmed)**

```bash
if [ "$answer" = "y" ]; then
  rm "$file"
  echo "File $file deleted."
else
  echo "Deletion cancelled."
fi
```

- If the user enters `y`, the file is deleted (`rm "$file"`).
- Otherwise, the deletion is canceled.

---

## ✅ **Key Features**

✔ **Safety:** Files are deleted **only after confirmation**. ✔ **Error Handling:** The script notifies the user if a file **does not exist**. ✔ **Batch Processing:** Supports **multiple files** in one execution.

---

## ⚡ **Usage Examples**

#### 🗑 **Deleting a Single File**

```bash
./delet_script.sh file1.txt
```

#### 🗑 **Deleting Multiple Files**

```bash
./delet_script.sh file1.txt file2.log file3.conf
```

**Example Output (if `file1.txt` exists but `file2.log` does not):**

```bash
Are you sure you want to delete this file file1.txt? (y/n): y
File file1.txt deleted.
File file2.log does not exist
Are you sure you want to delete this file file3.conf? (y/n): n
Deletion cancelled.
```

---

## 🛠 **Possible Improvements**

1️⃣ **Case-Insensitive Confirmation (Y/n):**

```bash
if [[ "$answer" =~ ^[Yy]$ ]]; then
```

2️⃣ **Adding a "Force Delete Without Confirmation" Option (-f Flag)** 3️⃣ **Displaying the Number of Successfully Deleted Files**

