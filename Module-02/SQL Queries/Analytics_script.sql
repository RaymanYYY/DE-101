select --some total values
sum(sales) as total_sales,
sum(profit) as total_profit,
sum(profit)/sum(sales) as profit_ratio,
avg(profit) as avg_profit_per_order
from orders o;

select --some info about customers
customer_name, 
sum(sales) as sales_per_customer,
avg(discount) as avg_discount
from orders o
group by customer_name

select --the best customers of 2018
customer_name, 
sum(profit) as total_customer_profit
from orders o
where order_date between '2018-01-01' and '2019-01-01'
group by customer_name
order by sum(profit) desc 

select --sales per segments monthly
to_char(order_date, 'YYYY-MM') as period,
segment,
sum(sales) as total_sales
from orders o 
group by to_char(order_date, 'YYYY-MM'),2
order by 1

select --sales per categories monthly
to_char(order_date, 'YYYY-MM') as period,
category,
sum(sales) as total_sales
from orders o 
group by to_char(order_date, 'YYYY-MM'),2
order by 1