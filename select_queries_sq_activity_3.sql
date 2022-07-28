--query to find unique states from country United States
select distinct state from customers where country='united states'

--------------------------------------------------------------------------------------------------------------------------------

--query to find count of orders which are estimated to be delivered between 01-01-2017 and 20-06-2017
select count(order_id) from orders where order_estimated_delivery_date BETWEEN '2017-01-01' and '2017-06-30'

--------------------------------------------------------------------------------------------------------------------------------

--query to pull out orders which are ordered by customer from california or texas with first class shipping mode
select * from orders a left join customers b on a.customer_id=b.customer_id 
where state in ('california','texas') and shipmode='First Class'

--------------------------------------------------------------------------------------------------------------------------------

--query to find customer with first name starting with dar
select * from customers where customer_name like 'Dar%'

--------------------------------------------------------------------------------------------------------------------------------

--to get column as profitability status
select order_id,profit_amt,
case when profit_amt>0 then 'Profit'
else 'Loss'
end as profitability_status from transactions

--------------------------------------------------------------------------------------------------------------------------------

--query to get delivery_delay and delivery_delay_status
select order_id,
case when delivery_delay<0 then 'Late'
else 'On-Time/Early' end as delivery_delay_status FROM
(select DATEDIFF(day,order_estimated_delivery_date,order_delivered_customer_date) as delivery_delay,
order_id 
from orders where order_status='delivered') as t1

--------------------------------------------------------------------------------------------------------------------------------

--query to get value of product in decreasing order of price
select distinct product_id, sales_amt/qty as product_value from transactions 
where qty>0 order by product_value desc

--costliest product is TEC-MA-10002412

--------------------------------------------------------------------------------------------------------------------------------

--query to get all orders that are accepted but not yet delivered
select * from orders where order_status not in ('delivered','canceled','unavailable') 

--------------------------------------------------------------------------------------------------------------------------------


