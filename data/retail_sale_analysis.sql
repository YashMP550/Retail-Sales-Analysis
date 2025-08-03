-- 1. What is the total revenue generated per year?
-- select extract(year from str_to_date(sale_date, '%d-%m-%Y')) as sale_year,sum(total_sale) as total_revenue
-- from retail_sales_analysis
-- group by sale_year
-- order by sale_year;


-- 2. What is the total revenue generated overall?
-- select sum(total_sale) as total_revenue from retail_sales_analysis


-- 3. What is the total revenue (total_sale) generated monthly?
-- select date_format(str_to_date(sale_date, '%d-%m-%Y'), '%Y-%M') as year_months, sum(total_sale) as total_revenue
-- from retail_sales_analysis
-- group by year_months
-- order by str_to_date(concat('01-', year_months), '%d-%Y-%M');


-- 4. Which product categories generate the highest revenue?
-- with revenue as (select category,sum(total_sale) as total_revenue,dense_rank()
-- over (partition by category order by sum(total_sale) desc) as highest_revenue
-- from retail_sales_analysis
-- group by category)

-- select category,total_revenue
-- from revenue
-- where highest_revenue=1


-- 5. What is the average sales value per transaction?
-- select round(avg(total_sale),2) as avg_sale_per_transaction from retail_sales_analysis;


-- 6. How does cogs (Cost of Goods Sold) compare with total_sale to determine gross profit?
-- select sum(total_sale - cogs) as gross_profit 
-- from retail_sales_analysis


-- 7. Which day or month sees the most sales?
-- select str_to_date(sale_date, '%d-%m-%Y') as sales_day, sum(total_sale) as daily_sales
-- from retail_sales_analysis
-- group by sales_day
-- order by daily_sales desc
-- limit 5;


-- 8. What is the distribution of sales across different times of the day?
-- select hour(str_to_date(sale_time, '%H:%i:%s')) as hours, sum(total_sale) as hourly_sale
-- from retail_sales_analysis
-- group by hours
-- order by hours asc


-- 9. What is the age and gender distribution of customers?
-- select gender,count(*) as customer_count
-- from retail_sales_analysis
-- group by gender;


-- 10. What is the total sales generated based on the gender?
-- select gender,sum(total_sale) as total_revenue
-- from retail_sales_analysis
-- group by gender
-- order by total_revenue desc

-- 11. Do men or women spend more on average per transaction?
-- select gender, round(avg(total_sale),2) as avg_per_transaction
-- from retail_sales_analysis
-- group by gender;

-- 12. Which product categories are most frequently purchased?
-- select category, count(*) as frequently_purchased
-- from retail_sales_analysis
-- group by category
-- order by frequently_purchased desc;


-- 13. Which product category generated the most revenue?
-- select category,sum(total_sale) as revenue
-- from retail_sales_analysis
-- group by category
-- order by revenue desc;

-- 14. What is the average quantity purchased per category?
-- select category, round(avg(quantiy),2) as avg_quantiy
-- from retail_sales_analysis
-- group by category
-- order by avg_quantiy desc;

-- 15. What is the average unit price per category?
-- select category, round(avg(price_per_unit),2) as avg_price_per_unit
-- from retail_sales_analysis
-- group by category
-- order by avg_price_per_unit desc;

-- 16. Which category has the highest gross margin (total_sale - cogs)?
-- select category,sum(total_sale - cogs) as gross_margin
-- from retail_sales_analysis
-- group by category
-- order by gross_margin desc;

-- 17. Do younger or older customers spend more?
-- select
-- 	case
--     when age<20 then "20"
--     when age between 21 and 30 then '21–30'
--     when age between 31 and 40 then '31–40'
--     when age between 41 and 50 then '41–50'
--     when age between 51 and 60 then '51–60'
--     else '60+'
--     end as age_group,
--     round(avg(total_sale),2) as total_spending
--     from retail_sales_analysis
--     group by age_group
--     order by total_spending desc;


-- 18. Do customers shop more in the morning or afternoon?
-- select hour(str_to_date(sale_time, '%H:%i:%s')) as hours, sum(total_sale) as sale
-- from retail_sales_analysis
-- group by hours
-- order by sale desc;

