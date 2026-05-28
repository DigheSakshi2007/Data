> create table marks(marks int);
Query OK, 0 rows affected (0.12 sec)
> insert into marks values(90),(80),(70),(90),(95),(99),(50),(33),(90);
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> select * from marks;
+-------+
| marks |
+-------+
|    90 |
|    80 |
|    70 |
|    90 |
|    95 |
|    99 |
|    50 |
|    33 |
|    90 |
+-------+
9 rows in set (0.01 sec)
create table marks_student(marks int);
Query OK, 0 rows affected (0.04 sec)

mysql> insert into marks_student values(90),(80),(70),(90),(95),(99),(50),(33),(90);
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0
select version();
+-----------+
| version() |
+-----------+
| 8.0.45    |
+-----------+
1 row in set (0.01 sec)
show tables;
+--------------------+
| Tables_in_college1 |
+--------------------+
| department         |
| employee           |
| employee11         |
| employee12         |
| marks              |
| marks_student      |
| student            |
+--------------------+
7 rows in set (0.02 sec)

mysql> desc marks;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| marks | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
1 row in set (0.02 sec)

mysql> desc marks_student;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| marks | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
1 row in set (0.01 sec)

mysql> use demo;
Database changed
mysql> create table marks(no int);
Query OK, 0 rows affected (0.04 sec)

mysql> insert into marks values(90),(80),(70),(90),(95),(99),(50),(33),(90);
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0
show tables;
+--------------------+
| Tables_in_college1 |
+--------------------+
| department         |
| employee           |
| employee11         |
| employee12         |
| marks              |
| marks_student      |
| student            |
+--------------------+
7 rows in set (0.02 sec)

mysql> desc marks;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| marks | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
1 row in set (0.02 sec)

mysql> desc marks_student;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| marks | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
1 row in set (0.01 sec)

mysql> use demo;
Database changed
mysql> create table marks(no int);
Query OK, 0 rows affected (0.04 sec)

mysql> insert into marks values(90),(80),(70),(90),(95),(99),(50),(33),(90);
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0show tables;
+--------------------+
| Tables_in_college1 |
+--------------------+
| department         |
| employee           |
| employee11         |
| employee12         |
| marks              |
| marks_student      |
| student            |
+--------------------+
7 rows in set (0.02 sec)

mysql> desc marks;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| marks | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
1 row in set (0.02 sec)

mysql> desc marks_student;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| marks | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
1 row in set (0.01 sec)

mysql> use demo;
Database changed
mysql> create table marks(no int);
Query OK, 0 rows affected (0.04 sec)

mysql> insert into marks values(90),(80),(70),(90),(95),(99),(50),(33),(90);
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0
select version();
+-----------+
| version() |
+-----------+
| 8.0.45    |
+-----------+
1 row in set (0.00 sec)
select no,
    -> row_number() over ()
    -> from marks;
+------+----------------------+
| no   | row_number() over () |
+------+----------------------+
|   90 |                    1 |
|   80 |                    2 |
|   70 |                    3 |
|   90 |                    4 |
|   95 |                    5 |
|   99 |                    6 |
|   50 |                    7 |
|   33 |                    8 |
|   90 |                    9 |
+------+----------------------+
9 rows in set (0.01 sec)
create table test_data(new_id int primary key,new_cat varchar(90));
Query OK, 0 rows affected (0.19 sec)
>   create table test_data1(new_id int,new_cat varchar(90));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into test_data1 values(100,'agni'),(200,'agni'),(500,'dharti'),(700,'dharti'),(200,'vayu'),(300,'vayu'),(500,'vayu');
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from test_data1;
+--------+---------+
| new_id | new_cat |
+--------+---------+
|    100 | agni    |
|    200 | agni    |
|    500 | dharti  |
|    700 | dharti  |
|    200 | vayu    |
|    300 | vayu    |
|    500 | vayu    |
+--------+---------+
7 rows in set (0.01 sec)
use college1;
Database changed
mysql> select * from employee11;
+-------+--------+------+
| ename | salary | id   |
+-------+--------+------+
| ram   |  55000 |    2 |
| sham  |  30000 |    1 |
| radha |  20000 |    3 |
+-------+--------+------+
3 rows in set (0.01 sec)
SELECT ename,
    -> salary,
    -> AVG(salary) OVER() AS average_salary
    -> FROM Employee11;
+-------+--------+----------------+
| ename | salary | average_salary |
+-------+--------+----------------+
| ram   |  55000 |     35000.0000 |
| sham  |  30000 |     35000.0000 |
| radha |  20000 |     35000.0000 |
+-------+--------+----------------+
3 rows in set (0.01 sec)
