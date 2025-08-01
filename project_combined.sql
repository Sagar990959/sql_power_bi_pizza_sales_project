select* from pizza_sales;

#1: Total Revenue : The sum of total prize of all pizza orders.

select sum(total_price) as total_revenue from pizza_sales;

#2: Find out average order value: The average amount spent per orders calculated by dividing the total revenue by the total number of orders.

select sum(total_price)/ count(distinct order_id) as average_order_value from pizza_sales;

#3: Find out Total pizza sold: The sum of quantities of all the pizza sold.

select sum(quantity) as total_pizza_sold from pizza_sales;

#4: Find out the total orders placed:The total number of order placed.

select count(distinct order_id) as total_orders from pizza_sales;

#5:Find out  average pizza per order: The average number of pizza sold per order.
#calculated by dividing the total number of pizza sold by the total number of orders.

select sum(quantity)/ count(distinct order_id) as average_pizza_per_order from pizza_sales;

#6: Calculate daily trends for total orders?
# create a bar chart that displays the daily trend of total orders over  a specific time period . This chart will help us
# identify any patterns or fluctuations in order volumes on a daily basis.

select* from pizza_sales;

select dayname(ord_date) as order_day,count(distinct order_id) as total_orders
from pizza_sales
group by dayname(ord_date)
order by order_day;

#7:Calculate Monthly trends for total orders?
# Create a line chart that illustrates the Monthly trends of total orders throughout the Month.
# This chart will allow to identify peak Months of high orders activity.

select* from pizza_sales;
select dayofmonth(ord_date) as months,count(distinct order_id) as total_orders
from pizza_sales
group by dayofmonth(ord_date)
order by months;

select count(distinct ord_date) from pizza_sales;

#8: Find out percentage of sales by pizza category?
# Create pie chart that shows the distribution of sales accross different pizza categories.
# This chart will provide insight into the popularity of various pizza categories and their contribution to overall sales.

select * from pizza_sales;

select pizza_category,sum(total_price)*100/(select sum(total_price) from pizza_sales) as percent_total_sales from pizza_sales 
group by pizza_category;

#9: Find out percentage of sales by pizza size?
# Create a pie chart that represents the percentage of sales attributed to different pizza size.
# This chart will help us understand customer preferences for pizza sizes and their impact on sales.

select pizza_size, cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as percent_total_sales from pizza_sales 
group by pizza_size
order by percent_total_sales desc;

#10: Find out top 5 sellers by revenue, total quantity and total orders?
# Create a bar chart highlighting the top 5 best selling pizzas based on revenue,Total quantity,total orders.
# This chart will help us identitfy the most popular pizza options.

select* from pizza_sales;

select pizza_name,sum(total_price) as revenue
from pizza_sales
group by pizza_name
order by revenue desc
limit 5;

select pizza_name,sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc
limit 5;

select pizza_name,count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc
limit 5;



























