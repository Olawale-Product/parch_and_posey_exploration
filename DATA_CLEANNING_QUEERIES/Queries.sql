
--Extract Firstname and lastname

SELECT name,
SUBSTR(primary_poc,1,POSITION (' ' IN primary_poc)) first_name,
SUBSTR(primary_poc,1,POSITION (' ' IN primary_poc)) fname,
RIGHT(primary_poc,POSITION (' ' IN REVERSE(primary_poc))) last_name      
FROM accounts;


--Minus 1 from POSITION to exclude space in string extraction
SELECT name,
SUBSTR(primary_poc,1,POSITION (' ' IN primary_poc)-1) first_name,
LENGTH(SUBSTR(primary_poc,1,POSITION (' ' IN primary_poc)-1) ) l_first_name,
SUBSTR(primary_poc,1,POSITION (' ' IN primary_poc)) fname,
LENGTH(SUBSTR(primary_poc,1,POSITION (' ' IN primary_poc))) l_fname,
RIGHT(primary_poc,POSITION (' ' IN REVERSE(primary_poc))) last_name      
FROM accounts;


SELECT ROW_NUMBER() OVER () AS row_number, name,
SUBSTR(name,1,POSITION (' ' IN name)) first_name,
SUBSTR(name,1,POSITION (' ' IN name)) fname, RIGHT(name,POSITION (' ' IN REVERSE(name))) last_name      
FROM sales_reps
LIMIT 10;




SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name, 
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;


SELECT LEFT(name, STRPOS(name, ' ') -1 ) first_name, 
       RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) last_name
FROM sales_reps;


SELECT
SUBSTR(primary_poc, 1, REVERSE(LOCATE(' ', REVERSE(primary_poc))) - 1) first_name,
REVERSE(SUBSTR(REVERSE(primary_poc), 1, LOCATE(' ', REVERSE(primary_poc)) - 1)) last_name
FROM sales_reps



--COALESCE

SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;


SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;