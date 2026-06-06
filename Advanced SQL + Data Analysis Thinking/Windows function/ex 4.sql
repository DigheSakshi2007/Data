use sys;
Database changed
mysql> SELECT ename, salary,
    ->        ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
    -> FROM employee;
+--------+--------+---------+
| ename  | salary | row_num |
+--------+--------+---------+
| rahul  |  70000 |       1 |
| amit   |  60000 |       2 |
| neha   |  55000 |       3 |
| adarsh |  50000 |       4 |
+--------+--------+---------+
4 rows in set (0.01 sec)
mysql> use college1;
Database changed
mysql> SELECT name,
    ->        marks,
    ->        DENSE_RANK() OVER (ORDER BY marks DESC) AS dr
    -> FROM student;
+--------+-------+----+
| name   | marks | dr |
+--------+-------+----+
| Rahul  |    90 |  1 |
| Adarsh |    85 |  2 |
| Amit   |    78 |  3 |
+--------+-------+----+
3 rows in set (0.00 sec)
mysql>  SELECT ename,salary,ROW_NUMBER() OVER(ORDER BY salary DESC ) AS row_num FROM Employee;
+--------+--------+---------+
| ename  | salary | row_num |
+--------+--------+---------+
| rahul  |  70000 |       1 |
| amit   |  60000 |       2 |
| neha   |  55000 |       3 |
| adarsh |  50000 |       4 |
+--------+--------+---------+
4 rows in set (0.01 sec)
