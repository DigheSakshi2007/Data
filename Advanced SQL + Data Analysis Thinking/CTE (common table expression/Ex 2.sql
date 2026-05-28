select * from student;
+----+--------+-------+
| id | name   | marks |
+----+--------+-------+
|  1 | Adarsh |    85 |
|  2 | Rahul  |    90 |
|  3 | Amit   |    78 |
+----+--------+-------+
3 rows in set (0.01 sec)
mysql> with topstudent as(select name,marks from student where marks>80) select * from topstudent;
+--------+-------+
| name   | marks |
+--------+-------+
| Adarsh |    85 |
| Rahul  |    90 |
+--------+-------+
2 rows in set (0.00 sec)

mysql> with topstudent as(select * from student where marks>80) select * from topstudent;
+----+--------+-------+
| id | name   | marks |
+----+--------+-------+
|  1 | Adarsh |    85 |
|  2 | Rahul  |    90 |
+----+--------+-------+
2 rows in set (0.00 sec)

mysql> select * from employee11;
+-------+--------+------+
| ename | salary | id   |
+-------+--------+------+
| ram   |  55000 |    2 |
| sham  |  30000 |    1 |
| radha |  20000 |    3 |
+-------+--------+------+
3 rows in set (0.01 sec)
mysql> select * from department;
+----+------+
| id | name |
+----+------+
|  1 | IT   |
|  2 | HR   |
+----+------+
2 rows in set (0.01 sec)
mysql> create table employee12(id int primary key,ename varchar(90),salary int,dept varchar(90));
Query OK, 0 rows affected (0.20 sec)
mysql> insert into employee12 values(1,'ram',55000,'it'),(2,'sham',30000,'hr'),(3,'radha',20000,'manager');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee12;
+----+-------+--------+---------+
| id | ename | salary | dept    |
+----+-------+--------+---------+
|  1 | ram   |  55000 | it      |
|  2 | sham  |  30000 | hr      |
|  3 | radha |  20000 | manager |
+----+-------+--------+---------+
3 rows in set (0.00 sec)

mysql> with itemployee as(select * from employee12 where dept='it'),highsalary as(select * from itemployee where salary>20000) select * from highsalary;
+----+-------+--------+------+
| id | ename | salary | dept |
+----+-------+--------+------+
|  1 | ram   |  55000 | it   |
+----+-------+--------+------+
1 row in set (0.00 sec)

mysql> with itemployee as(select * from employee12 where dept='it'),highsalary as(select * from itemployee where salary>30000) select * from highsalary;
+----+-------+--------+------+
| id | ename | salary | dept |
+----+-------+--------+------+
|  1 | ram   |  55000 | it   |
+----+-------+--------+------+
1 row in set (0.00 sec)
mysql> with itemployee as(select * from employee12 where dept='it'),highsalary as(select * from itemployee where salary>55000) select * from highsalary;
Empty set (0.00 sec)
mysql> with empavg as(select dept, avg(salary) as avgsalary from employee12 group by dept) select * from empavg;
+---------+------------+
| dept    | avgsalary  |
+---------+------------+
| it      | 55000.0000 |
| hr      | 30000.0000 |
| manager | 20000.0000 |
+---------+------------+
3 rows in set (0.02 sec)

mysql> select * from employee12;
+----+-------+--------+---------+
| id | ename | salary | dept    |
+----+-------+--------+---------+
|  1 | ram   |  55000 | it      |
|  2 | sham  |  30000 | hr      |
|  3 | radha |  20000 | manager |
+----+-------+--------+---------+
3 rows in set (0.00 sec)

mysql> select * from department;
+----+------+
| id | name |
+----+------+
|  1 | IT   |
|  2 | HR   |
+----+------+
2 rows in set (0.01 sec)
mysql> with empdept as (select ename,name from employee11 inner join department on employee11.id=department.id) select * from empdept;
+-------+------+
| ename | name |
+-------+------+
| ram   | HR   |
| sham  | IT   |
+-------+------+
2 rows in set (0.01 sec)
