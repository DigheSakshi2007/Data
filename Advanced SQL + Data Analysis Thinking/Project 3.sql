Mini Project 3: Student Marks Analytics
use project;
Database changed
mysql> create table student(student_id int primary key,student_name varchar(90));
Query OK, 0 rows affected (0.08 sec)

mysql> create table marks(student_id int references student(student_id),subject varchar(90),marks int);
Query OK, 0 rows affected (0.03 sec)

mysql> insert into student values(1,'ram'),(2,'sham'),(3,'amit'),(4,'rahul');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into marks values(1,'c',90),(2,'java',67),(1,'python',35),(3,'c++',50);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from student;
+------------+--------------+
| student_id | student_name |
+------------+--------------+
|          1 | ram          |
|          2 | sham         |
|          3 | amit         |
|          4 | rahul        |
+------------+--------------+
4 rows in set (0.00 sec)

mysql> select * from marks;
+------------+---------+-------+
| student_id | subject | marks |
+------------+---------+-------+
|          1 | c       |    90 |
|          2 | java    |    67 |
|          1 | python  |    35 |
|          3 | c++     |    50 |
+------------+---------+-------+
4 rows in set (0.00 sec)
JOIN
select s.student_name,m.subject,m.marks from student s join marks m on s.student_id=m.student_id;
+--------------+---------+-------+
| student_name | subject | marks |
+--------------+---------+-------+
| ram          | c       |    90 |
| sham         | java    |    67 |
| ram          | python  |    35 |
| amit         | c++     |    50 |
+--------------+---------+-------+
4 rows in set (0.02 sec)
GROUP BY
Subject-wise Average
select subject,avg(marks) avg_marks from marks group by subject;
+---------+-----------+
| subject | avg_marks |
+---------+-----------+
| c       |   90.0000 |
| java    |   67.0000 |
| python  |   35.0000 |
| c++     |   50.0000 |
+---------+-----------+
4 rows in set (0.03 sec)
Aggregate Functions
select max(marks) highest,max(marks) lowest,avg(marks) average,count(*) total_stubject from marks;
+---------+--------+---------+----------------+
| highest | lowest | average | total_stubject |
+---------+--------+---------+----------------+
|      90 |     90 | 60.5000 |              4 |
+---------+--------+---------+----------------+
1 row in set (0.01 sec)
Subquery
Students Above Average Marks
select * from marks where marks>(select avg(marks) from marks);
+------------+---------+-------+
| student_id | subject | marks |
+------------+---------+-------+
|          1 | c       |    90 |
|          2 | java    |    67 |
+------------+---------+-------+
2 rows in set (0.01 sec)
CTE
with subjectreport as(select subject,avg(marks) avgmarks from marks group by subject) select * from subjectreport;
+---------+----------+
| subject | avgmarks |
+---------+----------+
| c       |  90.0000 |
| java    |  67.0000 |
| python  |  35.0000 |
| c++     |  50.0000 |
+---------+----------+
4 rows in set (0.01 sec)
Window Function
Student Ranking
select student_id,marks,rank() over(order by marks desc)rank_no from marks;
+------------+-------+---------+
| student_id | marks | rank_no |
+------------+-------+---------+
|          1 |    90 |       1 |
|          2 |    67 |       2 |
|          3 |    50 |       3 |
|          1 |    35 |       4 |
+------------+-------+---------+
4 rows in set (0.01 sec)
CASE Statement
select student_id,marks,case when marks>=40 then 'pass' else 'fail' end result from marks;
+------------+-------+--------+
| student_id | marks | result |
+------------+-------+--------+
|          1 |    90 | pass   |
|          2 |    67 | pass   |
|          1 |    35 | fail   |
|          3 |    50 | pass   |
+------------+-------+--------+
4 rows in set (0.01 sec)
Indexing
create index idx_marks on marks(marks);
Query OK, 0 rows affected (0.25 sec)
Records: 0  Duplicates: 0  Warnings: 0
