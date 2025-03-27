# 🍽️ 24KITCHEN - Specialised Virtual Kitchen

## 📌 Description  
24Kitchen is a **responsive website** that showcases a **virtual kitchen** and **three special recipes**. This project was developed as part of the **CS1IAD Portfolio 1** assignment, applying **HTML5, CSS3, and JavaScript** to create an engaging user experience.

The website includes:  
✔️ **Home Page** - Information about the virtual kitchen  
✔️ **Recipes Page** - Three featured recipes with ingredients and instructions  
✔️ **Contact Page** - Form for users to book private cooking lessons  

## 🚀 **New Features (Portfolio 2 Updates)**  
As part of the **CS1IAD Portfolio 2**, the website has been enhanced with the following features:  

### **1. Dynamic Recipe Loading**  
- Recipes are now fetched from a **MySQL database** and displayed dynamically on the homepage.  
- The backend uses **PHP** to query the database and return recipes in JSON format.  

### **2. Recipe Rating System**  
- Users can now **rate and like recipes** through a form.  
- Ratings and likes are stored in the database and can be retrieved for reporting.  

### **3. Responsive Navbar with Scroll Effects**  
- The navbar now changes its appearance when the page is scrolled.  
- A **mobile-friendly menu** has been added for smaller screens.  

### **4. Smooth Scrolling**  
- Internal links now scroll smoothly to their respective sections.  

### **5. Scroll-to-Top Button**  
- A **scroll-to-top button** appears when the user scrolls down, allowing them to return to the top of the page with a smooth animation.  

### **6. Contact Form Validation**  
- The contact form now validates user input:  
  - Ensures the email belongs to **Aston University** (`@aston.ac.uk`).  
  - Ensures the selected date is in the **future**.  

## 📁 Project Structure  

### **Frontend Files**  
- **`index.html`** - Homepage with dynamic recipe loading.  
- **`recipes.html`** - Page showcasing three featured recipes.  
- **`contact.html`** - Contact form for booking private cooking lessons.  
- **`style.css`** - Stylesheet for the entire website.  
- **`index.js`** - JavaScript for dynamic content, scroll effects, and form validation.  

### **Backend Files**  
- **`fetch_recipes.php`** - Fetches recipes from the MySQL database and returns them in JSON format.  
- **`submit_rating.php`** - Handles recipe ratings and likes, saving them to the database.  

### **Database Files**  
- **`database_schema.sql`** - SQL file to create the database schema and tables.  
- **`select_queries.sql`** - SQL queries for generating reports (e.g., most-liked recipes).  

### **Assets**  
- **`img/`** - Folder containing all images used on the website.  

## 🛠️ **How to Run the Project**  

### **1. Set Up the Database**  
1. Import the `database_schema.sql` file into your MySQL server using phpMyAdmin or MySQL Workbench.  
2. Populate the database with sample data using the DML commands in `database_schema.sql`.  

### **2. Set Up the Backend**  
1. Place the PHP files (`fetch_recipes.php` and `submit_rating.php`) in your server's root directory (e.g., `htdocs` for XAMPP).  
2. Ensure the PHP files can connect to the MySQL database by updating the connection details if necessary.  

### **3. Open the Website**  
1. Open the `index.html` file in your browser to view the homepage.  
2. Navigate to the **Recipes** and **Contact** pages to explore all features.  

📜 License

This project is licensed under the MIT License. See the LICENSE file for details.

🙏 Acknowledgments

Dr. Alexandros Giagkos - For guidance and support during the assignment.
WASS Team - For technical assistance and resources.