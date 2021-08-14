show databases;
use classicmodels;
show tables;
desc customers;
select customerName, country from customers;
-- GROUP BY COMMAND
select customerName, country from customers group by country; -- gives us one row(frst cum first serve basis), with every unique country
-- group by returns 1 row for each group (the first row it finds in that grp, in this case grouping is done on the basis of country value)

select count(*) from customers;
select count(*) from customers where country = 'USA';
select count(*) from customers group by country; -- gives us the count of customers in each country(only shows us the count col without country col sso not useful)
select country, count(*) from customers group by country; -- gives us the count of customers in a particular country(with a country col alongside)
select state, count(*) from customers group by state; -- gives us count of customers in a state, table shows 73 customers have NULL as state value
select state, country, count(*) from customers group by country;
select state from customers where country = 'Australia';
-- comibnation of where and group by
select country,count(*) from customers where state is not NULL group by country;
select country, sum(creditLimit) from customers group by country;
select country, sum(creditLimit) from customers where creditLimit > 3000 group by country;

-- grouping by 2 cols together; groups by 1st col and subgroups by 2nd col

select country, state, count(*) from customers group by country, state;

-- HAVING CLAUSE (used to specify condns with group by statemnts, we cant use 'where' there.
-- Filering group by queries: purpose of having, without group by, having will behave as a simple where
-- we can use where with group by for any other column, except the one being grouped, for that we need having

select state, count(*) from customers group by state having count(*) > 5;

-- ORDER BY: ARRANGING RESULTS(SORT) IN AN ORDER/ for descending order, use desc at last

select country, sum(creditLimit) from customers group by country having sum(creditLimit) > 50000 order by sum(creditLimit); -- sorted in ascending order
select country, sum(creditLimit) from customers group by country having sum(creditLimit) > 50000 order by sum(creditLimit) desc; -- sorted in descending order

-- IN (used in place of multiple ORs)
-- like 'where(name = " sakshi" or name = "santa" or name = "raamu");', we can write 'where name in("sakshi", "santa", "ramu");'
-- NOT IN -> works as a NOT operator


-- BETWEEN , 'WHERE column_name BETWEEN value1 AND value2;' value1 and value 2 are inclusive;  values can be numbers, text, anything
-- not between can also be used to negate the same


-- LIKE operaator:  when we dont want to check the exact value from the where condition, but we want values like something, for eg if we want  condition that gives us the customer name that starts with 'a' and not the customer with name 'a'


-- JOIN  to extract data from multiple tables using a common column
-- 1. inner join: gives us intersection of the 2 tables, ie gives us all the rows from both tables wheere the column we specify has same value;
use classicmodels;
show tables;
desc orderdetails;
desc orders;
select * from orderdetails limit 10;
select * from orders limit 10;
-- joining 2 tables
select * from orderdetails inner join orders on orderdetails.orderNumber = orders.orderNumber; -- gives us all the cols from the join of both tables which satisfy our condition of ordernumber col being equal in both
select productcode, status from orderdetails join orders on orderdetails.orderNumber = orders.orderNumber; -- can use join instead of inner join, and only gives us the cols we want ti derive relations from

-- joining 3 tables


-- JOIN/inner join as an intersection bw the two tables
select 





