Mini Project 1: Employee Salary Analysis
use project;
Database changed
mysql> create table department(dept_id int primary key,dept_name varchar(90));
Query OK, 0 rows affected (0.14 sec)

mysql> create table employee(emp_id int,emp_name varchar(90),dept_id int references department(dept_id),salary int);
Query OK, 0 rows affected (0.03 sec)

mysql> insert into department values(1,'it'),(2,'hr'),(3,'sales');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into employee values(101,'amit',1,50000),(102,'sneha',2,35000)
,(103,'rahul',1,65000),(104,'priya',3,45000),(105,'karan',2,40000);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from department;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | it        |
|       2 | hr        |
|       3 | sales     |
+---------+-----------+
3 rows in set (0.01 sec)

mysql> select * from employee;
+--------+----------+---------+--------+
| emp_id | emp_name | dept_id | salary |
+--------+----------+---------+--------+
|    101 | amit     |       1 |  50000 |
|    102 | sneha    |       2 |  35000 |
|    103 | rahul    |       1 |  65000 |
|    104 | priya    |       3 |  45000 |
|    105 | karan    |       2 |  40000 |
+--------+----------+---------+--------+
5 rows in set (0.00 sec)
1. JOIN
Employee with Department
select e.emp_name,d.dept_name,e.salary from employee e inner join department d on e.dept_id=d.dept_id;
+----------+-----------+--------+
| emp_name | dept_name | salary |
+----------+-----------+--------+
| amit     | it        |  50000 |
| sneha    | hr        |  35000 |
| rahul    | it        |  65000 |
| priya    | sales     |  45000 |
| karan    | hr        |  40000 |
+----------+-----------+--------+
5 rows in set (0.01 sec)
GROUP BY
Average Salary Department-wise
select d.dept_name,avg(e.salary) avg_salary from employee e join department d on e.dept_id=d.dept_id group by d.dept_name;
+-----------+------------+
| dept_name | avg_salary |
+-----------+------------+
| it        | 57500.0000 |
| hr        | 37500.0000 |
| sales     | 45000.0000 |
+-----------+------------+
3 rows in set (0.01 sec)
Aggregate Functions
select max(salary) highest_salary,min(salary) lowest_salary,avg(salary) avg_salary,sum(salary) total_salary, count(*) employee_count from employee;
+----------------+---------------+------------+--------------+----------------+
| highest_salary | lowest_salary | avg_salary | total_salary | employee_count |
+----------------+---------------+------------+--------------+----------------+
|          65000 |         35000 | 47000.0000 |       235000 |              5 |
+----------------+---------------+------------+--------------+----------------+
1 row in set (0.00 sec)
Subquery
Employees Earning Above Average Salary
select emp_name,salary from employee where salary>(select avg(salary)from employee);
+----------+--------+
| emp_name | salary |
+----------+--------+
| amit     |  50000 |
| rahul    |  65000 |
+----------+--------+
2 rows in set (0.00 sec)
CTE
Department Salary Report
with deptsalary as(select dept_id,avg(salary) avgsal from employee group by dept_id)  select d.dept_name,ds.avgsal from deptsalary ds join department d on ds.dept_id=d.dept_id;
+-----------+------------+
| dept_name | avgsal     |
+-----------+------------+
| it        | 57500.0000 |
| hr        | 37500.0000 |
| sales     | 45000.0000 |
+-----------+------------+
3 rows in set (0.00 sec)
Window Function
Salary Ranking
select emp_name,salary,rank() over(order by salary desc) salary_rank from employee;
+----------+--------+-------------+
| emp_name | salary | salary_rank |
+----------+--------+-------------+
| rahul    |  65000 |           1 |
| amit     |  50000 |           2 |
| priya    |  45000 |           3 |
| karan    |  40000 |           4 |
| sneha    |  35000 |           5 |
+----------+--------+-------------+
5 rows in set (0.01 sec)
Indexing
create index ide_salary on employee(salary);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0
Query Optimization
Bad Query
select * from employee;
+--------+----------+---------+--------+
| emp_id | emp_name | dept_id | salary |
+--------+----------+---------+--------+
|    101 | amit     |       1 |  50000 |
|    102 | sneha    |       2 |  35000 |
|    103 | rahul    |       1 |  65000 |
|    104 | priya    |       3 |  45000 |
|    105 | karan    |       2 |  40000 |
+--------+----------+---------+--------+
5 rows in set (0.00 sec)
Optimized Query

mysql> select emp_name,salary from employee where salary>50000;
+----------+--------+
| emp_name | salary |
+----------+--------+
| rahul    |  65000 |
+----------+--------+
1 row in set (0.01 sec)
