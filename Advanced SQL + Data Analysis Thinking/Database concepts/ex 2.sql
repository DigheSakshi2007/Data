mysql> use school;
Database changed
mysql> CREATE TABLE Employee(
    ->     emp_id INT PRIMARY KEY,
    ->     name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.26 sec)
mysql> CREATE TABLE Teacher(
    ->     id INT,
    ->     name VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Users(
    ->     email VARCHAR(100) UNIQUE
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Staff(
    ->     city VARCHAR(50) DEFAULT 'Pune'
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> select * from employee;
Empty set (0.01 sec)

mysql> select * from staff;
Empty set (0.01 sec)

mysql> CREATE TABLE Department(
    ->     dept_id INT PRIMARY KEY,
    ->     dept_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)
mysql> use school;
Database changed
mysql> CREATE TABLE Employee1(emp_id INT PRIMARY KEY, name VARCHAR(50), dept_id INT,FOREIGN KEY(dept_id) REFERENCES Department(dept_id));
Query OK, 0 rows affected (0.06 sec)

mysql> select * from student1;
+----+------+---------+-------+
| id | name | subject | marks |
+----+------+---------+-------+
| 11 | ram  | bca     |    40 |
| 12 | ram  | bcs     |    50 |
| 13 | sham | bsc     |    10 |
| 14 | ram  | bca     |    40 |
| 15 | ram  | bca     |    40 |
| 16 | ram  | bca     |    40 |
| 17 | ram  | bca     |    40 |
| 18 | ram  | bca     |    40 |
| 19 | ram  | bca     |    40 |
| 20 | ram  | bca     |    40 |
+----+------+---------+-------+
10 rows in set (0.03 sec)

mysql> update student1 set marks=95 where id=19;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student1;
+----+------+---------+-------+
| id | name | subject | marks |
+----+------+---------+-------+
| 11 | ram  | bca     |    40 |
| 12 | ram  | bcs     |    50 |
| 13 | sham | bsc     |    10 |
| 14 | ram  | bca     |    40 |
| 15 | ram  | bca     |    40 |
| 16 | ram  | bca     |    40 |
| 17 | ram  | bca     |    40 |
| 18 | ram  | bca     |    40 |
| 19 | ram  | bca     |    95 |
| 20 | ram  | bca     |    40 |
+----+------+---------+-------+
10 rows in set (0.00 sec)

mysql> delete from student1 where id = 20;
Query OK, 1 row affected (0.01 sec)

mysql> select * from student1;
+----+------+---------+-------+
| id | name | subject | marks |
+----+------+---------+-------+
| 11 | ram  | bca     |    40 |
| 12 | ram  | bcs     |    50 |
| 13 | sham | bsc     |    10 |
| 14 | ram  | bca     |    40 |
| 15 | ram  | bca     |    40 |
| 16 | ram  | bca     |    40 |
| 17 | ram  | bca     |    40 |
| 18 | ram  | bca     |    40 |
| 19 | ram  | bca     |    95 |
+----+------+---------+-------+
9 rows in set (0.00 sec)

mysql> select * from student1 where marks> 40 and name='ram';
+----+------+---------+-------+
| id | name | subject | marks |
+----+------+---------+-------+
| 12 | ram  | bcs     |    50 |
| 19 | ram  | bca     |    95 |
+----+------+---------+-------+
2 rows in set (0.02 sec)

mysql> select * from student1 where marks> 10 or name='sham';
+----+------+---------+-------+
| id | name | subject | marks |
+----+------+---------+-------+
| 11 | ram  | bca     |    40 |
| 12 | ram  | bcs     |    50 |
| 13 | sham | bsc     |    10 |
| 14 | ram  | bca     |    40 |
| 15 | ram  | bca     |    40 |
| 16 | ram  | bca     |    40 |
| 17 | ram  | bca     |    40 |
| 18 | ram  | bca     |    40 |
| 19 | ram  | bca     |    95 |
+----+------+---------+-------+
9 rows in set (0.00 sec)

mysql> select * from student1 where marks> 40 or name='sham';
+----+------+---------+-------+
| id | name | subject | marks |
+----+------+---------+-------+
| 12 | ram  | bcs     |    50 |
| 13 | sham | bsc     |    10 |
| 19 | ram  | bca     |    95 |
+----+------+---------+-------+
3 rows in set (0.00 sec)
mysql> select * from student1 where name like 'A%';
Empty set (0.01 sec)
