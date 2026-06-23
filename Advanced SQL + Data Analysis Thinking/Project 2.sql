Mini Project 2: E-Commerce Sales Query Analysis
use project;
Database changed
mysql> create table customer(coustomer_id int primary key,customer_name varchar(90));
Query OK, 0 rows affected (0.28 sec)
create table orders(order_id int primary key,product_name varchar(90),coustomer_id int references customer(coustomer_id),category varchar(90),quantity int,price int, order_date date);
Query OK, 0 rows affected (0.04 sec)

mysql> insert into customer values(1,'sherya'),(2,'patil'),(3,'radha'),(4,'krushna');
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into orders values(11,'charger',1,'electronic',2,500,'2026-05-28'),(12,'laptop',2,'electronic',2,650000,'2025-05-29'),(1,'mobile',1,'electronic',1,25000,'2024-06-7'),(14,'book',3,'education',5,500,'2022-09-9');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0
select * from customer;
+--------------+---------------+
| coustomer_id | customer_name |
+--------------+---------------+
|            1 | sherya        |
|            2 | patil         |
|            3 | radha         |
|            4 | krushna       |
+--------------+---------------+
4 rows in set (0.01 sec)

mysql> select * from orders;
+----------+--------------+--------------+------------+----------+--------+------------+
| order_id | product_name | coustomer_id | category   | quantity | price  | order_date |
+----------+--------------+--------------+------------+----------+--------+------------+
|        1 | mobile       |            1 | electronic |        1 |  25000 | 2024-06-07 |
|       11 | charger      |            1 | electronic |        2 |    500 | 2026-05-28 |
|       12 | laptop       |            2 | electronic |        2 | 650000 | 2025-05-29 |
|       14 | book         |            3 | education  |        5 |    500 | 2022-09-09 |
+----------+--------------+--------------+------------+----------+--------+------------+
4 rows in set (0.01 sec)
JOIN
select c.customer_name,o.product_name,o.quantity from customer c join orders o on c.coustomer_id=o.coustomer_id;
+---------------+--------------+----------+
| customer_name | product_name | quantity |
+---------------+--------------+----------+
| sherya        | mobile       |        1 |
| sherya        | charger      |        2 |
| patil         | laptop       |        2 |
| radha         | book         |        5 |
+---------------+--------------+----------+
4 rows in set (0.01 sec)
GROUP BY
Category-wise Sales
select category,sum(quantity*price) total_sales from orders group by category;
+------------+-------------+
| category   | total_sales |
+------------+-------------+
| electronic |     1326000 |
| education  |        2500 |
+------------+-------------+
2 rows in set (0.01 sec)
Aggregate Functions
select sum(quantity*price) revenue,avg(price) avg_price,max(price) highest_price,min(price) lowest_price from orders;
+---------+-------------+---------------+--------------+
| revenue | avg_price   | highest_price | lowest_price |
+---------+-------------+---------------+--------------+
| 1328500 | 169000.0000 |        650000 |          500 |
+---------+-------------+---------------+--------------+
1 row in set (0.01 sec)
Subquery
Customer Spending Above Average
select coustomer_id,sum(quantity*price) total from orders group by coustomer_id having sum(quantity*price)>(select avg(quantity*price)from orders);
+--------------+---------+
| coustomer_id | total   |
+--------------+---------+
|            2 | 1300000 |
+--------------+---------+
1 row in set (0.01 sec)
CTE
with salescte as(select category, sum(quantity*price) sales from orders group by category) select * from salescte;
+------------+---------+
| category   | sales   |
+------------+---------+
| electronic | 1326000 |
| education  |    2500 |
+------------+---------+
2 rows in set (0.01 sec)
Window Function
Product Sales Ranking
select product_name,sum(quantity) total_sold,rank() over(order by sum(quantity) desc)rank_no from orders group by product_name;
+--------------+------------+---------+
| product_name | total_sold | rank_no |
+--------------+------------+---------+
| book         |          5 |       1 |
| charger      |          2 |       2 |
| laptop       |          2 |       2 |
| mobile       |          1 |       4 |
+--------------+------------+---------+
4 rows in set (0.01 sec)
Index
create index idx_product on orders(product_name);
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0
