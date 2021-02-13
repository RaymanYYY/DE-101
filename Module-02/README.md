# DE-101
Homework for DE-101 - Module02

## DW Creation

Star schema:

![img](https://github.com/RaymanYYY/DE-101/blob/master/Module-02/jpg/star_schema.jpg)


SQL queries are located in [SQL Queries](https://github.com/RaymanYYY/DE-101/tree/master/Module-02/SQL%20Queries) folder.

Quick overview of key metrics:

```sql
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
```

## Data Studio connecting to DB

Google Data Studio connection query:

```sql
select * from dw.sales_fact sf
inner join dw.product_dim p on sf.prod_id = p.prod_id
inner join dw.customer_dim c on sf.cust_id = c.cust_id
inner join dw.shipping_dim s on sf.ship_id = s.ship_id
inner join dw.geo_dim g on sf.geo_id =  g.geo_id
inner join dw.calendar_dim cr on sf.ship_date_id =  cr.dateid 
```

Resulted fields:

![img](https://github.com/RaymanYYY/DE-101/blob/master/Module-02/jpg/GDS_fields.jpg)

Google DataStudio Dashboard link: https://datastudio.google.com/reporting/1d9bf4c5-ca86-41c7-a7a3-f07c3b198b2c

Offline PDF version: https://github.com/RaymanYYY/DE-101/blob/master/Module-02/GoogelDataStudio.pdf
