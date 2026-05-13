mysql> use school;
Database changed
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
| 19 | ram  | bca     |    95 |
+----+------+---------+-------+
9 rows in set (0.07 sec)

mysql> select marks from student1 order by marks asc;
+-------+
| marks |
+-------+
|    10 |
|    40 |
|    40 |
|    40 |
|    40 |
|    40 |
|    40 |
|    50 |
|    95 |
+-------+
9 rows in set (0.02 sec)

mysql> select marks from student1 order by marks desc;
+-------+
| marks |
+-------+
|    95 |
|    50 |
|    40 |
|    40 |
|    40 |
|    40 |
|    40 |
|    40 |
|    10 |
+-------+
9 rows in set (0.00 sec)

mysql> select marks,name from student1 order by marks desc,name desc;
+-------+------+
| marks | name |
+-------+------+
|    95 | ram  |
|    50 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    10 | sham |
+-------+------+
9 rows in set (0.01 sec)
mysql> select marks,name from student1 order by marks desc,name asc;
+-------+------+
| marks | name |
+-------+------+
|    95 | ram  |
|    50 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    10 | sham |
+-------+------+
9 rows in set (0.00 sec)

mysql> select marks,name from student1 order by marks asc,name asc;
+-------+------+
| marks | name |
+-------+------+
|    10 | sham |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    50 | ram  |
|    95 | ram  |
+-------+------+
9 rows in set (0.00 sec)

mysql> select marks,name from student1 order by marks desc,name desc;
+-------+------+
| marks | name |
+-------+------+
|    95 | ram  |
|    50 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    40 | ram  |
|    10 | sham |
+-------+------+
9 rows in set (0.00 sec)

mysql> select marks,count(marks) from student1 group by marks;
+-------+--------------+
| marks | count(marks) |
+-------+--------------+
|    40 |            6 |
|    50 |            1 |
|    10 |            1 |
|    95 |            1 |
+-------+--------------+
4 rows in set (0.03 sec)

mysql> select marks,sum(marks) from student1 group by marks;
+-------+------------+
| marks | sum(marks) |
+-------+------------+
|    40 |        240 |
|    50 |         50 |
|    10 |         10 |
|    95 |         95 |
+-------+------------+
4 rows in set (0.01 sec)

mysql> select marks,avg(marks) from student1 group by marks;
+-------+------------+
| marks | avg(marks) |
+-------+------------+
|    40 |    40.0000 |
|    50 |    50.0000 |
|    10 |    10.0000 |
|    95 |    95.0000 |
+-------+------------+
4 rows in set (0.00 sec)

mysql> select marks,min(marks) from student1 group by marks;
+-------+------------+
| marks | min(marks) |
+-------+------------+
|    40 |         40 |
|    50 |         50 |
|    10 |         10 |
|    95 |         95 |
+-------+------------+
4 rows in set (0.00 sec)

mysql> select marks,max(marks) from student1 group by marks;
+-------+------------+
| marks | max(marks) |
+-------+------------+
|    40 |         40 |
|    50 |         50 |
|    10 |         10 |
|    95 |         95 |
+-------+------------+
4 rows in set (0.00 sec)
mysql> select id,avg(marks) from student1 group by id having avg(marks)>40;
+----+------------+
| id | avg(marks) |
+----+------------+
| 12 |    50.0000 |
| 19 |    95.0000 |
+----+------------+
2 rows in set (0.01 sec)

mysql> select name,avg(marks) from student1 group by name having avg(marks)>40;
+------+------------+
| name | avg(marks) |
+------+------------+
| ram  |    48.1250 |
+------+------------+
1 row in set (0.01 sec)
mysql> select name,avg(marks) from student1 group by name having avg(marks)>40;
+------+------------+
| name | avg(marks) |
+------+------------+
| ram  |    48.1250 |
+------+------------+
1 row in set (0.00 sec)

mysql> select * from student1 where marks>70;
+----+------+---------+-------+
| id | name | subject | marks |
+----+------+---------+-------+
| 19 | ram  | bca     |    95 |
+----+------+---------+-------+
1 row in set (0.01 sec)

mysql> select name from student1 where subject='bcs';
+------+
| name |
+------+
| ram  |
+------+
1 row in set (0.01 sec)
mysql> select name,avg(marks) from student1 group by name;
+------+------------+
| name | avg(marks) |
+------+------------+
| ram  |    48.1250 |
| sham |    10.0000 |
+------+------------+
2 rows in set (0.02 sec)

mysql> select name,count(marks) from student1 group by name;
+------+--------------+
| name | count(marks) |
+------+--------------+
| ram  |            8 |
| sham |            1 |
+------+--------------+
2 rows in set (0.01 sec)

mysql> select name,sum(marks) from student1 group by name;
+------+------------+
| name | sum(marks) |
+------+------------+
| ram  |        385 |
| sham |         10 |
+------+------------+
2 rows in set (0.00 sec)
