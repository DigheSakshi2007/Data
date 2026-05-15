 use school;
Database changed
mysql> CREATE TABLE StudentSubjects(
    ->     student_id INT,
    ->     student_name VARCHAR(50),
    ->     subject VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.24 sec)

mysql> CREATE TABLE Student(
    ->     student_id INT PRIMARY KEY,
    ->     student_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Course(
    ->     course_id INT PRIMARY KEY,
    ->     course_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Enrollment(
    ->     student_id INT,
    ->     course_id INT,
    ->     PRIMARY KEY(student_id, course_id)
    -> );
Query OK, 0 rows affected (0.03 sec)
CREATE TABLE Department1( dept_id INT PRIMARY KEY, dept_name VARCHAR(50));
Query OK, 0 rows affected (0.04 sec)
CREATE TABLE Employee10( emp_id INT PRIMARY KEY, emp_name VARCHAR(50), dept_id INT, FOREIGN KEY(dept_id) REFERENCES Department(dept_id));
Query OK, 0 rows affected (0.06 sec)
