# ALU Database Project
A relational database for a school system with Students, Classroom, Faculty, Courses, and Extra Curricular Activities
## Team
- @bouattara-cpu: Students table
- [RyanGakire](https://github.com/RyanGakire): Classroom table
- [Virginie2026](https://github.com/Virginie2026): Faculty table
- [akagermain](https://github.com/akagermain): Courses table
- [fiinsikabore](https://github.com/fiinsikabore): Extra_Curricular_Activities
- [Lucky-Umoka](https://github.com/Lucky-Umoka): Junction Tables (Student_Courses, Student_Activities)

## File Structure
All SQL is in `commands.sql`, organized in this order:
1. CREATE DATABASE
2. CREATE TABLE statements with individual UPDATE / DELETE / SELECT statements
3. Group tasks: relationship checks, JOIN queries, aggregate query, and normalization notes

## How to run
The file works on any MySQL server. It creates it's own database and tables, so nothing needs to be set up beforehand.

**Option 1: From inside the MySQL prompt**
1. Connect to a MySQL server:
```mysql -h <host> -P <port> -u <user> -p``` or simply: ```mysql -u <user> -p``` if it's a local server.
2. Once connected, run:
   ```sql
   SOURCE /full/path/to/commands.sql;
   ```

**Option 2: Directly from the terminal**
```bash
mysql -h <host> -P <port> -u <user> -p commands.sql
```
