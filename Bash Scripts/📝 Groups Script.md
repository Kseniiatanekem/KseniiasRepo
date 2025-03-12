# 📝 Script Analysis

## 📌 **Description**

This **Bash script** retrieves and displays the groups that the current user belongs to, excluding the username itself. It processes the groups and formats the output for clarity.

---

## 🔍 **Script Workflow**

### 1️⃣ **Retrieve User and Groups**

```bash
username=$(whoami)
groups_list=$(groups $username)
```

- `whoami` → Gets the current username.
- `groups $username` → Retrieves the list of groups the user belongs to.

### 2️⃣ **Convert Groups into an Array**

```bash
groups_array=($groups_list)
```

- The group list is stored as an array by splitting the space-separated output of `groups`.

### 3️⃣ **Remove the Username from the Array**

```bash
groups_array=("${groups_array[@]:2}")
```

- The first two elements of `groups_array` typically contain the username and a colon (`:`) or an initial group.
- This step removes those, leaving only the actual groups.

### 4️⃣ **Loop Through Groups and Display Output**

```bash
for group in "${groups_array[@]}"; do
  echo "$username is a part of group $group"
done
```

- Iterates over each remaining group in `groups_array`.
- Prints a formatted message for each group the user belongs to.

---

## ✅ **Key Features**

✔ **Automated User Detection** → Works for any logged-in user.  
✔ **Formatted Group Listing** → Outputs clean, readable results.  
✔ **Array Processing** → Splits and filters groups efficiently.

---

## ⚡ **Usage Example**

### 📌 Running the script:

```bash
./groups_script.sh
```

#### **Example Output:**

```bash
user123 is a part of group sudo
user123 is a part of group docker
user123 is a part of group developers
```

---

## 🛠 **Possible Improvements**

1️⃣ **More Robust Username Filtering** → Some systems format `groups` output differently.  
2️⃣ **Sorting and Formatting Output** → Display groups in a structured way.  
3️⃣ **Adding a `--help` Option** → Provide brief usage