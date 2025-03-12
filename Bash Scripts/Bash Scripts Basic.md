**nano my_script.sh (create a document)**

**chmod +x my_script.sh (modify permissions)**

**./my_script.sh (execute the file)**

**#!/bin/bash** **echo "Hello, World!"**

_Scripting_

**Bash** is a command-line interpreter used in Unix-like systems such as Linux and macOS. It allows users to interact with the operating system by executing commands directly in the terminal. More interestingly, you can create a **Bash script**—a file containing a set of commands that can be executed automatically. This helps automate tasks that would otherwise be performed manually.

### Why Use Bash Scripts?

Bash scripts enable automation of processes that typically require significant time or effort. For example:

- Renaming multiple files
- Moving files between directories
- Backing up data
- Checking system status
- Performing complex system configurations

### Bash Scripting Syntax

Now that you have your first script, let's break down the basic syntax of Bash.

#### 1. **Variables**

Variables in Bash allow you to store data and use it in scripts.

```bash
#!/bin/bash
name="John"
echo "Hello, $name!"
```

**Output:**

```
Hello, John!
```

Note that the dollar sign (`$`) is used to access the value of a variable, but it is not needed when assigning a value.

#### 2. **Conditional Statements**

Using `if`, `else`, and `elif`, you can perform condition checks.

```bash
#!/bin/bash
age=18

if [ $age -ge 18 ]; then
  echo "You are an adult."
else
  echo "You are a minor."
fi
```

This script checks if a number is greater than or equal to 18 and prints the appropriate message.

#### 3. **Loops**

Loops allow you to repeat tasks multiple times. The most common loops are `for` and `while`.

- **For loop:**

```bash
#!/bin/bash
for i in {1..5}
do
  echo "Number $i"
done
```

**Output:**

```
Number 1
Number 2
Number 3
Number 4
Number 5
```

- **While loop:**

```bash
#!/bin/bash
count=1
while [ $count -le 5 ]
do
  echo "Count $count"
  ((count++))
done
```

**Output:**

```
Count 1
Count 2
Count 3
Count 4
Count 5
```

#### 4. **Functions**

Functions in Bash allow you to group commands for reuse.

```bash
#!/bin/bash
function greet {
  echo "Hello, $1!"
}

greet "Alice"
```

In this example, the `greet` function takes one argument (a name) and prints a greeting. `$1` represents the first argument passed to the function.

#### 5. **Comments**

Comments are used to explain the code. They start with `#`.

```bash
#!/bin/bash
# This is a comment
echo "This is not a comment"
```

Comments do not affect code execution.

---

### Web Scraping with Bash

Web scraping is the process of extracting data from web pages. While Bash is not the primary tool for this (Python is often preferred), it can perform simple tasks such as downloading web pages using `curl` or `wget`.

Example using `curl` to fetch a webpage:

```bash
#!/bin/bash
curl https://example.com
```

This script fetches the content of the page and displays it in the terminal.

For more complex tasks, such as extracting specific data from a webpage, you can combine Bash with tools like `grep` or `awk`.

---

### Practice and Conclusion

Now that you understand the basics, try writing small scripts to automate your tasks. Here are some practice ideas:

1. **File Management:** Write a script to create backups of important files.
2. **System Monitoring:** Create a script that checks disk space or memory usage and sends alerts if levels are too high.
3. **Text Processing:** Write a script that searches for a specific word or phrase in multiple files and displays the result.

The more you practice, the more confident you will become in using Bash. This powerful and flexible tool can be used for a variety of tasks.

If you have any questions or want to explore specific topics, feel free to ask!

### **Task Analysis**

1. **Objective:**
    
    - Pass three arguments (`"Shell is fun"`) to the script `prog.sh`.
    - Count the number of arguments in the `File` function and print the count.

### **Solution Steps**

1. In the `File` function, count the number of passed arguments using `$#`.
    
    ```bash
    echo $#
    ```
    
    `$#` returns the number of arguments passed to the function.
    
2. Pass three arguments (`"Shell is fun"`) when executing `bash prog.sh`.
    

### **Final Code for `prog.sh`**

```bash
#!/bin/bash

function File {
    # Count the number of arguments
    echo $#
}

# Do not modify this block
if [ ! $# -lt 1 ]; then
    File $*
    exit 0
fi

# Pass arguments
bash prog.sh Shell is fun
```

---

### **Expected Output**

```
3
```

### **Explanation**

1. Running `bash prog.sh Shell is fun`:
    - The arguments `Shell`, `is`, and `fun` become `$1`, `$2`, and `$3`.
    - `$# = 3` (total number of arguments).
2. The `File` function receives these arguments via `$*` and counts them using `$#`.

---

### **Arrays in Bash**

Bash arrays allow storing multiple values under a single variable name. This is useful for handling data sets.

#### **Creating an Array**

```bash
my_array=(apple banana "Fruit Basket" orange)
```

#### **Accessing Elements**

```bash
echo ${my_array[2]}  # Outputs: Fruit Basket
```

#### **Looping Through an Array**

```bash
for item in "${my_array[@]}"
do
    echo $item
done
```

**Output:**

```
apple
banana
Fruit Basket
orange
```

---

Bash scripting is a powerful tool for automating tasks. By understanding its core concepts—variables, conditionals, loops, functions, and arrays—you can efficiently manage system tasks. Continue practicing and experimenting with different scripts to strengthen your skills!