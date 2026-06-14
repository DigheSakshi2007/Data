select * from employee limit 2;
+-----+--------+------+--------+
| eid | ename  | dept | salary |
+-----+--------+------+--------+
|   1 | adarsh | it   |  50000 |
|   2 | rahul  | it   |  70000 |
+-----+--------+------+--------+
2 rows in set (0.01 sec)

mysql> create index i_name on employee(ename);
Query OK, 0 rows affected (0.31 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show index from employee from sys;
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employee |          0 | PRIMARY  |            1 | eid         | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employee |          1 | i_name   |            1 | ename       | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.09 sec)

mysql> show index from employee ;
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employee |          0 | PRIMARY  |            1 | eid         | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employee |          1 | i_name   |            1 | ename       | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.04 sec)

mysql> alter table employee drop index i_name;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show index from employee ;
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employee |          0 | PRIMARY  |            1 | eid         | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
1 row in set (0.01 sec)
