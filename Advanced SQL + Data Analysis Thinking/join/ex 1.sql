mysql> use colege
Database changed
mysql> create table student(id int primary key,name varchar(40));
Query OK, 0 rows affected (0.08 sec)
mysql> insert into student values(1,'ram'),(2,'sham'),(3,'rahul');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> create table course(id int primary key,name varchar(40));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into course values(2,'ram'),(5,'sham'),(3,'rahul'),(4,'roshan');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from student;
+----+-------+
| id | name  |
+----+-------+
|  1 | ram   |
|  2 | sham  |
|  3 | rahul |
+----+-------+
3 rows in set (0.02 sec)

mysql> select * from course;
+----+--------+
| id | name   |
+----+--------+
|  2 | ram    |
|  3 | rahul  |
|  4 | roshan |
|  5 | sham   |
+----+--------+
4 rows in set (0.00 sec)

mysql> select * from student inner join course on student.id=course.id;
+----+-------+----+-------+
| id | name  | id | name  |
+----+-------+----+-------+
|  2 | sham  |  2 | ram   |
|  3 | rahul |  3 | rahul |
+----+-------+----+-------+
2 rows in set (0.01 sec)

mysql> select * from student as s inner join course as c on s.id=c.id;
+----+-------+----+-------+
| id | name  | id | name  |
+----+-------+----+-------+
|  2 | sham  |  2 | ram   |
|  3 | rahul |  3 | rahul |
+----+-------+----+-------+
2 rows in set (0.00 sec)
mysql> select * from student left join course on student.id=course.id;
+----+-------+------+-------+
| id | name  | id   | name  |
+----+-------+------+-------+
|  1 | ram   | NULL | NULL  |
|  2 | sham  |    2 | ram   |
|  3 | rahul |    3 | rahul |
+----+-------+------+-------+
3 rows in set (0.01 sec)

mysql> select * from student as s left join course as c on s.id=c.id;
+----+-------+------+-------+
| id | name  | id   | name  |
+----+-------+------+-------+
|  1 | ram   | NULL | NULL  |
|  2 | sham  |    2 | ram   |
|  3 | rahul |    3 | rahul |
+----+-------+------+-------+
3 rows in set (0.01 sec)

mysql> select * from student as s right join course as c on s.id=c.id;
+------+-------+----+--------+
| id   | name  | id | name   |
+------+-------+----+--------+
|    2 | sham  |  2 | ram    |
|    3 | rahul |  3 | rahul  |
| NULL | NULL  |  4 | roshan |
| NULL | NULL  |  5 | sham   |
+------+-------+----+--------+
4 rows in set (0.00 sec)

mysql> select * from student as s left join course as c on s.id=c.id union select * from student as s right join course as c on s.id=c.id;;
+------+-------+------+--------+
| id   | name  | id   | name   |
+------+-------+------+--------+
|    1 | ram   | NULL | NULL   |
|    2 | sham  |    2 | ram    |
|    3 | rahul |    3 | rahul  |
| NULL | NULL  |    4 | roshan |
| NULL | NULL  |    5 | sham   |
+------+-------+------+--------+
5 rows in set (0.03 sec)
mysql> select * from student as s left join course as c on s.id=c.id where c.id is null;
+----+------+------+------+
| id | name | id   | name |
+----+------+------+------+
|  1 | ram  | NULL | NULL |
+----+------+------+------+
1 row in set (0.02 sec)

mysql> select * from student as s right join course as c on s.id=c.id where s.id is null;
+------+------+----+--------+
| id   | name | id | name   |
+------+------+----+--------+
| NULL | NULL |  4 | roshan |
| NULL | NULL |  5 | sham   |
+------+------+----+--------+
2 rows in set (0.01 sec)

mysql> select * from student as s left join course as c on s.id=c.id where c.id is null union select * from student as s right join course as c on s.id=c.id where s.id is null;
+------+------+------+--------+
| id   | name | id   | name   |
+------+------+------+--------+
|    1 | ram  | NULL | NULL   |
| NULL | NULL |    4 | roshan |
| NULL | NULL |    5 | sham   |
+------+------+------+--------+
3 rows in set (0.01 sec)


mysql> create table employee(id int primary key,name varchar(90),manager_id int);
Query OK, 0 rows affected (0.06 sec)

mysql> insert into employee values(1,'ram',2),(2,'sham',1),(3,'rahul',2),(4,'radha',null),(5,'prachi',3);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

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
5 rows in set (0.00 sec)
mysql> select * from employee as a join employee as b on a.id=b.manager_id;
+----+-------+------------+----+--------+------------+
| id | name  | manager_id | id | name   | manager_id |
+----+-------+------------+----+--------+------------+
|  2 | sham  |          1 |  1 | ram    |          2 |
|  1 | ram   |          2 |  2 | sham   |          1 |
|  2 | sham  |          1 |  3 | rahul  |          2 |
|  3 | rahul |          2 |  5 | prachi |          3 |
+----+-------+------------+----+--------+------------+
4 rows in set (0.01 sec)

mysql> select a.name,b.name from employee as a join employee as b on a.id=b.manager_id;
+-------+--------+
| name  | name   |
+-------+--------+
| sham  | ram    |
| ram   | sham   |
| sham  | rahul  |
| rahul | prachi |
+-------+--------+
4 rows in set (0.01 sec)

mysql> select a.name as manager_name,b.name from employee as a join employee as b on a.id=b.manager_id;
+--------------+--------+
| manager_name | name   |
+--------------+--------+
| sham         | ram    |
| ram          | sham   |
| sham         | rahul  |
| rahul        | prachi |
+--------------+--------+
4 rows in set (0.01 sec)
