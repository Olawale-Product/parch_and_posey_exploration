Query1
SELECT ROW_NUMBER() OVER(ORDER BY date_time) AS rank,
       date_time
FROM   db;


Query2
SELECT RANK() OVER(ORDER BY date_time) AS rank,
       date_time
FROM   db;


Query3
SELECT DENSE_RANK() OVER(ORDER BY date_time) AS rank,
       date_time
FROM   db;



Ranking Total Paper Ordered by Account
Select the id, account_id, and total variable from the orders table, then create a column called total_rank that ranks this total amount of paper ordered (from highest to lowest) for each account using a partition. Your final table should have these four columns.
SELECT id, account_id, total,
RANK() OVER(PARTITION BY account_id ORDER BY total DESC) AS "total_rank"
FROM	orders