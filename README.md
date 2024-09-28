# 📚 Library Database Management System

This project is a **Library Database Management System** built using **SQL** to manage library operations efficiently. It helps in organizing books, readers, and transactions like book lending and returns, making it easier to manage a library's inventory and user activity.

## 🛠️ Technologies Used
- **SQL**: For designing, creating, and managing the database.
- **MySQL** (or any other RDBMS): To store and manipulate library data.
- **Python (optional)**: Can be used to integrate the system with a frontend or automate operations.

## ✨ Features
- **Book Management**: Store and manage details of all available books in the library.
- **Reader Management**: Keep track of library members and their activities.
- **Book Transactions**: Monitor the borrowing and return status of books.
- **Database Integrity**: Ensure data consistency using primary and foreign keys.
- **CRUD Operations**: Supports Create, Read, Update, and Delete operations for library data.

## 🚀 Database Structure
The database includes several tables designed to support core library functions. Below are the primary tables used in the system:

### Tables
1. **Books**: Stores book information like title, author, genre, and availability.
   - Columns: `Book_ID`, `Title`, `Author`, `Genre`, `Publication_Year`, `Availability`
   
2. **Readers**: Manages the information of library users (readers).
   - Columns: `Reader_ID`, `First_Name`, `Last_Name`, `Email`, `Phone_Number`, `Active_Status`
   
3. **Book_Issues**: Records details about the books borrowed by readers.
   - Columns: `Issue_ID`, `Book_ID` (foreign key), `Reader_ID` (foreign key), `Issue_Date`, `Return_Date`, `Status`
   
4. **Active_Readers**: Maintains a list of currently active readers who have borrowed books.
   - Columns: `Active_ID`, `Reader_ID` (foreign key), `Book_ID` (foreign key), `Issue_Date`

### Relationships
- The **Books** table and **Readers** table are linked via the **Book_Issues** table through **foreign keys**.
- The **Active_Readers** table helps track books that are currently issued by active readers.

## 🖼️ Database Design
Here’s an overview of how the tables are connected:
- **Books** ↔️ **Book_Issues** ↔️ **Readers**: The **Book_Issues** table serves as a middle layer connecting books to readers.
- **Active_Readers** pulls real-time data for currently active borrowing transactions.

## 🧩 How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/library-dbms.git
   ```

2. Import the `Library.sql` file into your **SQL** database:
   ```sql
   source /path/to/Library.sql;
   ```

3. (Optional) Integrate with **Python** or any frontend to create an interactive system.

## Sample Queries
Here are some SQL queries to interact with the system:

- **To add a new book**:
   ```sql
   INSERT INTO Books (Title, Author, Genre, Publication_Year, Availability)
   VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 'Available');
   ```

- **To issue a book to a reader**:
   ```sql
   INSERT INTO Book_Issues (Book_ID, Reader_ID, Issue_Date, Return_Date, Status)
   VALUES (1, 101, '2024-09-28', '2024-10-12', 'Issued');
   ```

- **To list all available books**:
   ```sql
   SELECT * FROM Books WHERE Availability = 'Available';
   ```

- **To update the return of a book**:
   ```sql
   UPDATE Book_Issues SET Status = 'Returned', Return_Date = '2024-10-01'
   WHERE Issue_ID = 1;
   ```

## 📚 Learning Outcomes
Working on this project helped me develop:
- **Database design skills** with **SQL**.
- Experience with **CRUD operations** and data relationships.
- Ability to manage real-world library operations using relational databases.

## 📝 Future Enhancements
- [ ] Add **user authentication** for library admins.
- [ ] Implement a **frontend interface** for easy library management.
- [ ] Integrate **due date reminders** for book returns.
- [ ] Add **book categorization** and search features.

## 👨‍💻 Author
**Your Name**  
**KAVI J**
