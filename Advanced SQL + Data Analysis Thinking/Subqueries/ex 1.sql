 use class;
Database changed
mysql> select * from student;
+----+--------+-------+
| id | name   | marks |
+----+--------+-------+
|  1 | ram    |    78 |
|  2 | sakshi |    93 |
|  3 | rahul  |    85 |
|  4 | divya  |    96 |
|  5 | roshan |    92 |
+----+--------+-------+
5 rows in set (0.01 sec)
mysql> select avg(marks) from student ;
+------------+
| avg(marks) |
+------------+
|    88.8000 |
+------------+
1 row in set (0.00 sec)

mysql> select name from student where marks>88.8000 ;
+--------+
| name   |
+--------+
| sakshi |
| divya  |
| roshan |
+--------+
3 rows in set (0.00 sec)

mysql> select name,marks from student where marks>88.8000 ;
+--------+-------+
| name   | marks |
+--------+-------+
| sakshi |    93 |
| divya  |    96 |
| roshan |    92 |
+--------+-------+
3 rows in set (0.00 sec)
mysql> select name,marks from student where marks>(select avg(marks) from student);
+--------+-------+
| name   | marks |
+--------+-------+
| sakshi |    93 |
| divya  |    96 |
| roshan |    92 |
+--------+-------+
3 rows in set (0.01 sec)

mysql> select id%2 from student;
+------+
| id%2 |
+------+
|    1 |
|    0 |
|    1 |
|    0 |
|    1 |
+------+
5 rows in set (0.00 sec)

mysql> select id from student where id%2=0;
+----+
| id |
+----+
|  2 |
|  4 |
+----+
2 rows in set (0.00 sec)
mysql> select id from student where id in(2,4);
+----+
| id |
+----+
|  2 |
|  4 |
+----+
2 rows in set (0.01 sec)

mysql> select id,name from student where id in(2,4);
+----+--------+
| id | name   |
+----+--------+
|  2 | sakshi |
|  4 | divya  |
+----+--------+
2 rows in set (0.00 sec)

mysql> select id,name from student where id in (select id from student where id%2=0);
+----+--------+
| id | name   |
+----+--------+
|  2 | sakshi |
|  4 | divya  |
+----+--------+
2 rows in set (0.01 sec)
