use sql_project_retail_sales;
SELECT * FROM retail_sales
where transactions_id is null;
 select *from retail_sales
 where sale_date is null;
  select *from retail_sales
 where sale_time is null or
     customer_id is null or 
     gender is null or
     age is null or
     category is null or
      quantity is null or 
      price_per_unit is null or
      cogs is null or 
	  total_sale is null;
   -- now we are going to delete the null value   
 delete from retail_sales
 where sale_time is null or
     customer_id is null or 
     gender is null or
     age is null or
     category is null or
      quantity is null or 
      price_per_unit is null or
      cogs is null or 
	  total_sale is null;
     
     -- so now i am going to check total how many slaes 
       select count(*) from retail_sales;
 -- so now i am ging to check how many customer we have
 select count(distinct customer_id) from retail_sales;
 -- now i am going to check the total no of category i have-- 
  select distinct category from retail_sales;
--   data analysis & business key problem & answer

 -- My Analysis & Findings

  select * from retail_sales
where sale_date='2022-11-05';
-- Q.2 Write a SQL query to retrieve all transactions where
--  the category is 'Clothing' and the quantity sold is more 
-- than 10 in the month of Nov-2022
SELECT *
FROM retail_sales
WHERE category = 'Clothing' and quantity>=3
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';
-- GROUP BY category;

-- Q.3 Write a SQL query to calculate the total sales
 -- (total_sale) for each category.
select category,sum(total_sale) from retail_sales
group by category;

-- Q.4 Write a SQL query to find the average age of customers
--  who purchased items from the 'Beauty' category.
select *from retail_sales
where age=(select round(avg(age)) from retail_sales) and category='Beauty'
-- Q.5 Write a SQL query to find all transactions where the
--  total_sale is greater than 1000.
;
select *from retail_sales
where total_sale>1000;
-- Q.6 Write a SQL query to find the total number of
 -- transactions (transaction_id) made by each gender in 
 -- each category.
 select category,gender,count(transactions_id) from retail_sales
 group by category,gender
 order by category;
 
-- Q.7 Write a SQL query to calculate the average
--  sale for each month. Find out best selling month 
 -- in each year

select year(sale_date),monthname(sale_date),avg(total_sale) as 'avg_sale'from retail_sales
group by year(sale_date),monthname(sale_date)
order by avg_sale desc limit 1;
-- Q.8 Write a SQL query to find the top 5 customers
--  based on the highest total sales 
select *from retail_sales
order by total_sale desc limit 5;

-- Q.9 Write a SQL query to find the number 
-- of unique customers who purchased items from 
 -- each category.
select category,
count(distinct customer_id)as 'fav_cust' from retail_sales
group by category;
-- Q.10 Write a SQL query to create each shift and 
-- number of orders (Example Morning <=12, Afternoon
--  Between 12 & 17, Evening >17)
select case
       when hour(sale_time)<12 then 'morning'
        when hour(sale_time) between 12 and 17
        then 'afternoom'
        else 'evening'
        end as shift,
        count(*) as total_orders
        from retail_sales
        group by shift
