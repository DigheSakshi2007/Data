use college
Database changed
mysql> show tables;
+-------------------+
| Tables_in_college |
+-------------------+
| competition       |
| competition1      |
| student           |
| user              |
+-------------------+
4 rows in set (0.14 sec)

mysql> use college1
Database changed
mysql> show tables;
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
7 rows in set (0.00 sec)

mysql> select * from employee11;
+-------+--------+------+
| ename | salary | id   |
+-------+--------+------+
| ram   |  55000 |    2 |
| sham  |  30000 |    1 |
| radha |  20000 |    3 |
+-------+--------+------+
3 rows in set (0.08 sec)

mysql> select * from employee12;
+----+-------+--------+---------+
| id | ename | salary | dept    |
+----+-------+--------+---------+
|  1 | ram   |  55000 | it      |
|  2 | sham  |  30000 | hr      |
|  3 | radha |  20000 | manager |
+----+-------+--------+---------+
3 rows in set (0.02 sec)
mysql> create index indid on employee12(id);
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee12;
+----+-------+--------+---------+
| id | ename | salary | dept    |
+----+-------+--------+---------+
|  1 | ram   |  55000 | it      |
|  2 | sham  |  30000 | hr      |
|  3 | radha |  20000 | manager |
+----+-------+--------+---------+
3 rows in set (0.00 sec)

mysql> select ename,salary from employee12;
+-------+--------+
| ename | salary |
+-------+--------+
| ram   |  55000 |
| sham  |  30000 |
| radha |  20000 |
+-------+--------+
3 rows in set (0.00 sec)

mysql> select * from employee12 where dept='it';
+----+-------+--------+------+
| id | ename | salary | dept |
+----+-------+--------+------+
|  1 | ram   |  55000 | it   |
+----+-------+--------+------+
1 row in set (0.01 sec)

mysql> select * from employee12 limit 2;
+----+-------+--------+------+
| id | ename | salary | dept |
+----+-------+--------+------+
|  1 | ram   |  55000 | it   |
|  2 | sham  |  30000 | hr   |
+----+-------+--------+------+
2 rows in set (0.00 sec)

mysql> explain select * from employee12 where salary>55000;
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | employee12 | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    3 |    33.33 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.01 sec)
