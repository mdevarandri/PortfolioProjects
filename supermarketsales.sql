CREATE DATABASE Project2;
USE Project2;

SHOW TABLES;
SELECT * FROM Supermarketsales limit 10;
DESC supermarketsales;

-- Question 1: Does the overall sales data indicate any variance between the branches?
select 
  branch, 
  count(*) as Counts 
from 
  supermarketsales 
group by 
  branch 
order by 
  branch;


-- Question 2: What payment method do customers predominantly favor?
select 
  payment_method, 
  count(*) as Counts 
from 
  supermarketsales 
group by 
  payment_method 
order by 
  Counts desc;


-- What are the spending trends for both females and males, and in which category do they tend to allocate a significant portion of their spending?
select 
  product_line, 
  gender_customer, 
  count(*) as Counts 
from 
  supermarketsales 
group by 
  1, 
  2 
order by 
  Counts desc;


-- Question 4: What product line should the supermarket prioritize?
select 
  product_line, 
  count(*) as quantity, 
  round(
    (
      SUM(rating)/ count(*)
    ), 
    2
  ) as avg_rating 
from 
  supermarketsales 
group by 
  1;

-- Question 5: What city should be selected for expansion, and which specific products should be the primary focus?
select 
  city, 
  sum(gross_income) as gross_income_of_city 
from 
  supermarketsales 
group by 
  city 
order by 
  gross_income_of_city desc;


select 
  product_line, 
  count(*) as Counts 
from 
  supermarketsales 
where 
  city = 'Naypyitaw' 
group by 
  1 
order by 
  Counts desc;

