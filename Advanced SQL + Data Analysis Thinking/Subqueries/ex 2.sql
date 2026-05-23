use mysql
Database changed
mysql> create table employee;
mysql> create table employee(id int primary key,name varchar(60),salary int);
Query OK, 0 rows affected (0.11 sec)

mysql> insert into employee values(1,'rakesh',300000),(2,'ramesh',200000),(3,'rehan',456000),(4,'noya',360000),(5,'saloni',888000);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+----+--------+--------+
| id | name   | salary |
+----+--------+--------+
|  1 | rakesh | 300000 |
|  2 | ramesh | 200000 |
|  3 | rehan  | 456000 |
|  4 | noya   | 360000 |
|  5 | saloni | 888000 |
+----+--------+--------+
5 rows in set (0.01 sec)

mysql> SELECT AVG(salary)
    -> FROM Employee;
+-------------+
| AVG(salary) |
+-------------+
| 440800.0000 |
+-------------+
1 row in set (0.01 sec)
mysql>  SELECT name, salary FROM Employee WHERE salary > 440800.0000;
+--------+--------+
| name   | salary |
+--------+--------+
| rehan  | 456000 |
| saloni | 888000 |
+--------+--------+
2 rows in set (0.00 sec)

mysql> select name,salary from employee where salary>(select avg(salary) from employee);
+--------+--------+
| name   | salary |
+--------+--------+
| rehan  | 456000 |
| saloni | 888000 |
+--------+--------+
2 rows in set (0.00 sec)

mysql> select name,salary from employee where salary=(select max(salary) from employee);
+--------+--------+
| name   | salary |
+--------+--------+
| saloni | 888000 |
+--------+--------+
1 row in set (0.00 sec)

mysql> create table department(id int primary key,name varchar(60));
Query OK, 0 rows affected (0.05 sec)
mysql> insert into department values(1,'it'),(2,'hr'),(3,'bsc'),(4,'bba'),(5,'bcs');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> create table employee1(eid int primary key,name varchar(60),id int, foreign key (id) references department(id));
Query OK, 0 rows affected (0.20 sec)
mysql> insert into employee1 values(1,'rakesh',4),(2,'ramesh',1),(3,'rehan',2),(4,'noya',3),(5,'saloni',2);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from department;
+----+------+
| id | name |
+----+------+
|  1 | it   |
|  2 | hr   |
|  3 | bsc  |
|  4 | bba  |
|  5 | bcs  |
+----+------+
5 rows in set (0.01 sec)

mysql> select * from employee1;
+-----+--------+------+
| eid | name   | id   |
+-----+--------+------+
|   1 | rakesh |    4 |
|   2 | ramesh |    1 |
|   3 | rehan  |    2 |
|   4 | noya   |    3 |
|   5 | saloni |    2 |
+-----+--------+------+
5 rows in set (0.00 sec)

mysql> select name from employee1 where id in(select id from department);
+--------+
| name   |
+--------+
| rakesh |
| ramesh |
| rehan  |
| noya   |
| saloni |
+--------+
5 rows in set (0.02 sec)
