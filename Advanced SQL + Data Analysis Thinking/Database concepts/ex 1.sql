mysql> CREATE DATABASE college1;
Query OK, 1 row affected (0.04 sec)

mysql> USE college1;
Database changed
mysql> CREATE TABLE Student(
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     marks INT
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> INSERT INTO Student VALUES
    -> (1,'Adarsh',85),
    -> (2,'Rahul',90),
    -> (3,'Amit',78);
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Student VALUES
    -> (1,'Adarsh',85),
    -> (2,'Rahul',90),
    -> ^C
mysql> SELECT * FROM Student;
+----+--------+-------+
| id | name   | marks |
+----+--------+-------+
|  1 | Adarsh |    85 |
|  2 | Rahul  |    90 |
|  3 | Amit   |    78 |
+----+--------+-------+
3 rows in set (0.01 sec)

mysql> create database school;
Query OK, 1 row affected (0.10 sec)

mysql> use school;
Database changed
mysql> insert into student1 values(11,'ram','bca',40),(12,'ram','bcs',50),(13,'sham','bsc',10),(14,'ram','bca',40),(15,'ram','bca',40),(16,'ram','bca',40),(17,'ram','bca',40),(18,'ram','bca',40),(19,'ram','bca',40),(20,'ram','bca',40);
Query OK, 10 rows affected (0.05 sec)
Records: 10  Duplicates: 0  Warnings: 0

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
10 rows in set (0.01 sec)

mysql> select name from student1;
+------+
| name |
+------+
| ram  |
| ram  |
| sham |
| ram  |
| ram  |
| ram  |
| ram  |
| ram  |
| ram  |
| ram  |
+------+
10 rows in set (0.55 sec)

mysql> select name ,marks from student1;
+------+-------+
| name | marks |
+------+-------+
| ram  |    40 |
| ram  |    50 |
| sham |    10 |
| ram  |    40 |
| ram  |    40 |
| ram  |    40 |
| ram  |    40 |
| ram  |    40 |
| ram  |    40 |
| ram  |    40 |
+------+-------+
10 rows in set (0.00 sec)

mysql> select id,name ,marks from student1;
+----+------+-------+
| id | name | marks |
+----+------+-------+
| 11 | ram  |    40 |
| 12 | ram  |    50 |
| 13 | sham |    10 |
| 14 | ram  |    40 |
| 15 | ram  |    40 |
| 16 | ram  |    40 |
| 17 | ram  |    40 |
| 18 | ram  |    40 |
| 19 | ram  |    40 |
| 20 | ram  |    40 |
+----+------+-------+
10 rows in set (0.01 sec)
