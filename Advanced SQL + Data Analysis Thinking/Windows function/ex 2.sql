mysql> show databases;
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
11 rows in set (0.17 sec)

mysql> use sys;
Database changed
mysql> create table employee(eid int primary key,ename varchar(90),dept varchar(90),salary int);
Query OK, 0 rows affected (0.16 sec)
mysql> insert into employee values(1,'adarsh','it',50000),(2,'rahul','it',70000),(3,'amit','hr',60000),(4,'neha','hr',55000);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0
mysql> select * from employee;
+-----+--------+------+--------+
| eid | ename  | dept | salary |
+-----+--------+------+--------+
|   1 | adarsh | it   |  50000 |
|   2 | rahul  | it   |  70000 |
|   3 | amit   | hr   |  60000 |
|   4 | neha   | hr   |  55000 |
+-----+--------+------+--------+
4 rows in set (0.00 sec)

mysql> select ename,salary,avg(salary) over() as avgsalary from employee;
+--------+--------+------------+
| ename  | salary | avgsalary  |
+--------+--------+------------+
| adarsh |  50000 | 58750.0000 |
| rahul  |  70000 | 58750.0000 |
| amit   |  60000 | 58750.0000 |
| neha   |  55000 | 58750.0000 |
+--------+--------+------------+
4 rows in set (0.01 sec)
mysql> select dept,avg(salary) from employee group by dept;
+------+-------------+
| dept | avg(salary) |
+------+-------------+
| it   |  60000.0000 |
| hr   |  57500.0000 |
+------+-------------+
2 rows in set (0.01 sec)

mysql> select ename,salary,sum(salary) over(order by eid) as runningtotal from employee;
+--------+--------+--------------+
| ename  | salary | runningtotal |
+--------+--------+--------------+
| adarsh |  50000 |        50000 |
| rahul  |  70000 |       120000 |
| amit   |  60000 |       180000 |
| neha   |  55000 |       235000 |
+--------+--------+--------------+
