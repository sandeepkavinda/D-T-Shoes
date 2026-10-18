# D-T-Shoes

A desktop shoe store management system for **D&T Shoe Store**. It handles day-to-day retail work in one application: sales invoicing, stock, suppliers, customers, returns, repairs and cash drawer tracking. A live dashboard shows sales and payment figures at a glance.

> **Academic group project.** Developed by a team of six members as part of our studies.

### Modules

| Module                  | Purpose                                                        |
| ----------------------- | -------------------------------------------------------------- |
| **User Management**     | Create and manage system users and their roles                 |
| **Supplier Management** | Maintain supplier details.                                     |
| **Customer Management** | Maintain customer records.                                     |
| **Product Management**  | Add and manage shoe products, with prices and categories.      |
| **Stock Management**    | Track stock levels and stock updates.                          |
| **Return Management**   | Handle customer returns and supplier returns.                  |
| **Repair Management**   | Record and track shoe repair jobs.                             |
| **Custom Management**   | Handle custom orders.                                          |
| **Drawer Management**   | Track cash drawer balance and cash and card payments.          |
| **Invoice Management**  | Create sales invoices and view invoice history.                |
| **GRN Management**      | Record Goods Received Notes for incoming stock from suppliers. |

## Tech stack

| Area     | Technology              |
| -------- | ----------------------- |
| Language | Java                    |
| UI       | Java Swing with FlatLaf |
| Database | MySQL                   |
| Reports  | JasperReports           |
| Build    | NetBeans                |

## Getting started

### Prerequisites

- JDK 8
- MySQL Server 5.7+ or 8.x
- NetBeans IDE

### Setup Instructions

1. **Clone the repository**

   ```bash
   git clone https://github.com/sandeepkavinda/D-T-Shoes.git
   ```

2. **Switch to branch master**

   ```bash
   cd D-T-Shoes
   git switch master
   ```

3. **Set up the database**
   - Open your preferred MySQL database management tool.
   - Import and execute the SQL file located at `database/d&t_db.sql` to create the database tables and insert.

4. **Database Configuration**
   - Navigate to the `src\model\MySQL.java` directory.
   - Update it with your MySQL credentials.

   ```java
   connection = DriverManager.getConnection("jdbc:mysql://localhost:3306d&t_db", "root", "YOUR_PASSWORD_HERE");
   ```

   Replace YOUR_PASSWORD_HERE with your actual MySQL password.

5. **Open the project**
   - Open NetBeans and choose **File → Open Project**, then select the `D&T_Shoes` folder.

6. **Run the application**
   - Right-click the project and choose **Run**. `gui.SignIn` is the main class.

## Team

This project was built by a group of six members.

| Member             | GitHub                                               |
| ------------------ | ---------------------------------------------------- |
| Mohamed Rimas      | [@rimasmumthas](https://github.com/rimasmumthas)     |
| Sandeep Kavinda    | [@sandeepkavinda](https://github.com/sandeepkavinda) |
| Daham Bandara      | [@Daham04](https://github.com/Daham04)               |
| Danula Gunawardana | [@GuneOfficial](https://github.com/GuneOfficial)     |
| Shamil Kayil       | [@ShamilK27](https://github.com/ShamilK27)           |
| Tajith Dikkumbura  | [@senura101](https://github.com/senura101)           |
