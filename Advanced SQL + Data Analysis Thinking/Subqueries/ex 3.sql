show databases;
+--------------------+
| Database           |
+--------------------+
| class              |
| colege             |
| college            |
| college1           |
| demo               |
| information_schema |
| mysql              |
| performance_schema |
| practice_db        |
| school             |
| sys                |
+--------------------+
11 rows in set (0.10 sec)

mysql> use colege;
Database changed
mysql> show tables;
+------------------+
| Tables_in_colege |
+------------------+
| course           |
| employee         |
| student          |
+------------------+
3 rows in set (0.11 sec)

mysql> select * from employee;
+----+--------+------------+
| id | name   | manager_id |
+----+--------+------------+
|  1 | ram    |          2 |
|  2 | sham   |          1 |
|  3 | rahul  |          2 |
|  4 | radha  |       NULL |
|  5 | prachi |          3 |
+----+--------+------------+
5 rows in set (0.01 sec)
mysql> select * from student;
+----+-------+
| id | name  |
+----+-------+
|  1 | ram   |
|  2 | sham  |
|  3 | rahul |
+----+-------+
3 rows in set (0.01 sec)

mysql> use college;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_college |
+-------------------+
| competition       |
| competition1      |
| student           |
+-------------------+
3 rows in set (0.00 sec)

mysql> select * from student;
+---------+--------+---------+
| sreg_no | s_name | s_class |
+---------+--------+---------+
|       1 | sakshi | sy      |
|       3 | rahul  | ty      |
|       4 | arti   | fy      |
|       5 | rita   | sy      |
+---------+--------+---------+
4 rows in set (0.08 sec)

mysql> use class;
Database changed
mysql> show tables;
+-----------------+
| Tables_in_class |
+-----------------+
| student         |
+-----------------+
1 row in set (0.01 sec)

mysql> use college1;
Database changed
mysql> show tables;
+--------------------+
| Tables_in_college1 |
+--------------------+
| student            |
+--------------------+
1 row in set (0.00 sec)

mysql> create table department(id int primary key,name varchar(90));
Query OK, 0 rows affected (0.16 sec)
mysql> create table employee(ename varchar(90),id int references department(id));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into department values(1,'IT'),(2,'HR');
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into employee values('ram',2),('sham',1);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0
mysql> select * from department;
+----+------+
| id | name |
+----+------+
|  1 | IT   |
|  2 | HR   |
+----+------+
2 rows in set (0.01 sec)

mysql> select * from employee;
+-------+------+
| ename | id   |
+-------+------+
| ram   |    2 |
| sham  |    1 |
+-------+------+
2 rows in set (0.00 sec)

mysql> select ename from employee where id in (select id from department);
+-------+
| ename |
+-------+
| ram   |
| sham  |
+-------+
2 rows in set (0.01 sec)

mysql> insert into employee values('ram',2),('sham',1),('radha',3);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+-------+------+
| ename | id   |
+-------+------+
| ram   |    2 |
| sham  |    1 |
| ram   |    2 |
| sham  |    1 |
| radha |    3 |
+-------+------+
5 rows in set (0.00 sec)

mysql> select ename from employee where id in (select id from department);
+-------+
| ename |
+-------+
| ram   |
| sham  |
| ram   |
| sham  |
+-------+
4 rows in set (0.00 sec)
