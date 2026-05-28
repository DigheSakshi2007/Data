create table employee11(ename varchar(90),salary int,id int references department(id));
Query OK, 0 rows affected (0.12 sec)
mysql> insert into employee11 values('ram',55000,2),('sham',30000,1),('radha',20000,3);
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from department;
+----+------+
| id | name |
+----+------+
|  1 | IT   |
|  2 | HR   |
+----+------+
2 rows in set (0.00 sec)

mysql> select * from employee11;
+-------+--------+------+
| ename | salary | id   |
+-------+--------+------+
| ram   |  55000 |    2 |
| sham  |  30000 |    1 |
| radha |  20000 |    3 |
+-------+--------+------+
3 rows in set (0.00 sec)
mysql> WITH highsalary AS (select ename,salary from employee11 where salary>20000) select * from highsalary;
+-------+--------+
| ename | salary |
+-------+--------+
| ram   |  55000 |
| sham  |  30000 |
+-------+--------+
2 rows in set (0.00 sec)
