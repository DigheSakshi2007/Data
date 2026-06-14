 use sys;
Database changed
mysql> select * from employee;
+-----+--------+------+--------+
| eid | ename  | dept | salary |
+-----+--------+------+--------+
|   1 | adarsh | it   |  50000 |
|   2 | rahul  | it   |  70000 |
|   3 | amit   | hr   |  60000 |
|   4 | neha   | hr   |  55000 |
+-----+--------+------+--------+
4 rows in set (0.05 sec)
mysql> SELECT ename,salary,FIRST_VALUE(salary) OVER(ORDER BY salary DESC) AS highest_salary FROM Employee;
+--------+--------+----------------+
| ename  | salary | highest_salary |
+--------+--------+----------------+
| rahul  |  70000 |          70000 |
| amit   |  60000 |          70000 |
| neha   |  55000 |          70000 |
| adarsh |  50000 |          70000 |
+--------+--------+----------------+
4 rows in set (0.04 sec)

mysql> SELECT ename,salary,
    ->        LAST_VALUE(salary) OVER(
    ->            ORDER BY salary
    ->            ROWS BETWEEN UNBOUNDED PRECEDING
    ->            AND UNBOUNDED FOLLOWING
    ->        ) AS lowest_salary
    -> FROM Employee;
+--------+--------+---------------+
| ename  | salary | lowest_salary |
+--------+--------+---------------+
| adarsh |  50000 |         70000 |
| neha   |  55000 |         70000 |
| amit   |  60000 |         70000 |
| rahul  |  70000 |         70000 |
+--------+--------+---------------+
4 rows in set (0.01 sec)

mysql> SELECT ename,salary, FIRST_VALUE(salary) OVER(
    ->            ORDER BY salary
    ->        ) AS lowest_salary
    -> FROM Employee;
+--------+--------+---------------+
| ename  | salary | lowest_salary |
+--------+--------+---------------+
| adarsh |  50000 |         50000 |
| neha   |  55000 |         50000 |
| amit   |  60000 |         50000 |
| rahul  |  70000 |         50000 |
+--------+--------+---------------+
4 rows in set (0.00 sec)

mysql> SELECT ename,salary,FIRST_VALUE(salary) OVER(ORDER BY salary DESC) AS highest_salary,
    ->        FIRST_VALUE(salary) OVER(ORDER BY salary DESC)-salary AS difference
    -> FROM Employee;
+--------+--------+----------------+------------+
| ename  | salary | highest_salary | difference |
+--------+--------+----------------+------------+
| rahul  |  70000 |          70000 |          0 |
| amit   |  60000 |          70000 |      10000 |
| neha   |  55000 |          70000 |      15000 |
| adarsh |  50000 |          70000 |      20000 |
+--------+--------+----------------+------------+
4 rows in set (0.02 sec)
