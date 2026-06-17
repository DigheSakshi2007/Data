use college;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_college |
+-------------------+
| competition       |
| competition1      |
| student           |
+-------------------+
3 rows in set (0.15 sec)

mysql> select * from student;
+---------+--------+---------+
| sreg_no | s_name | s_class |
+---------+--------+---------+
|       1 | sakshi | sy      |
|       3 | rahul  | ty      |
|       4 | arti   | fy      |
|       5 | rita   | sy      |
+---------+--------+---------+
4 rows in set (0.01 sec)
select * from student where sreg_no=4;
+---------+--------+---------+
| sreg_no | s_name | s_class |
+---------+--------+---------+
|       4 | arti   | fy      |
+---------+--------+---------+
1 row in set (0.00 sec)
 use college;
Database changed
mysql> select * from student;
+---------+--------+---------+
| sreg_no | s_name | s_class |
+---------+--------+---------+
|       1 | sakshi | sy      |
|       3 | rahul  | ty      |
|       4 | arti   | fy      |
|       5 | rita   | sy      |
+---------+--------+---------+
4 rows in set (0.01 sec)

mysql> create index idx_name on student(s_name);
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show index;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select * from student;
+---------+--------+---------+
| sreg_no | s_name | s_class |
+---------+--------+---------+
|       1 | sakshi | sy      |
|       3 | rahul  | ty      |
|       4 | arti   | fy      |
|       5 | rita   | sy      |
+---------+--------+---------+
4 rows in set (0.00 sec)

mysql> create unique index idx_email on user(email);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0
mysql> create index idx_name1 on student(s_name,s_class);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

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
3 rows in set (0.00 sec)

mysql> select * from student;
+----+-------+
| id | name  |
+----+-------+
|  1 | ram   |
|  2 | sham  |
|  3 | rahul |
+----+-------+
3 rows in set (0.01 sec)


mysql> use college1;
Database changed
mysql> select * from student;
+----+--------+-------+
| id | name   | marks |
+----+--------+-------+
|  1 | Adarsh |    85 |
|  2 | Rahul  |    90 |
|  3 | Amit   |    78 |
+----+--------+-------+
3 rows in set (0.01 sec)

mysql> select * from student where name='amit' and marks>78;
Empty set (0.00 sec)

