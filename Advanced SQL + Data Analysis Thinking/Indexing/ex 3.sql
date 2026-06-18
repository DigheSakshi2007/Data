create table articles(content varchar(90));
Query OK, 0 rows affected (0.32 sec)
create fulltext index idx_article on articles(content);
Query OK, 0 rows affected, 1 warning (0.43 sec)
Records: 0  Duplicates: 0  Warnings: 1
	
mysql> show databases
    -> ;
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
11 rows in set (0.07 sec)

mysql> use college1;
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
7 rows in set (0.02 sec)

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

mysql> select * from employee11;
+-------+--------+------+
| ename | salary | id   |
+-------+--------+------+
| ram   |  55000 |    2 |
| sham  |  30000 |    1 |
| radha |  20000 |    3 |
+-------+--------+------+
3 rows in set (0.01 sec)
mysql> create index index_salary on employee11(salary);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> drop index index_salary on employee11;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee12;
+----+-------+--------+---------+
| id | ename | salary | dept    |
+----+-------+--------+---------+
|  1 | ram   |  55000 | it      |
|  2 | sham  |  30000 | hr      |
|  3 | radha |  20000 | manager |
+----+-------+--------+---------+
3 rows in set (0.04 sec)

mysql> select * from employee12 where id=3;
+----+-------+--------+---------+
| id | ename | salary | dept    |
+----+-------+--------+---------+
|  3 | radha |  20000 | manager |
+----+-------+--------+---------+
1 row in set (0.00 sec)

mysql> select * from employee12 order by salary;
+----+-------+--------+---------+
| id | ename | salary | dept    |
+----+-------+--------+---------+
|  3 | radha |  20000 | manager |
|  2 | sham  |  30000 | hr      |
|  1 | ram   |  55000 | it      |
+----+-------+--------+---------+
3 rows in set (0.01 sec)

mysql> select * from department;
+----+------+
| id | name |
+----+------+
|  1 | IT   |
|  2 | HR   |
+----+------+
2 rows in set (0.01 sec)

mysql> select * from employee12 inner join department on employee12.id=department.id;
+----+-------+--------+------+----+------+
| id | ename | salary | dept | id | name |
+----+-------+--------+------+----+------+
|  1 | ram   |  55000 | it   |  1 | IT   |
|  2 | sham  |  30000 | hr   |  2 | HR   |
+----+-------+--------+------+----+------+
2 rows in set (0.01 sec)

mysql> create index idx_id on employee11(id);
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> explain select * from employee12 where id=3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | employee12 | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.01 sec)
