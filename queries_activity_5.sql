--query to find number of transactions in June 17

select count(*) from transactions a left join orders b on a.Order_ID=b.order_id where order_approved_at between '2017-06-01' and '2017-06-30'

----------------------------------------------------------------------------------------------------------------------------------------------------
--query to find statewise profit
select state,sum(profit) as Profit from transactions a left join orders b on a.Order_ID=b.order_id 
inner join customers c on b.customer_id=c.customer_id 
left join locations_01 d on c.postal_code=d.postal_code group by state order by Profit desc

----------------------------------------------------------------------------------------------------------------------------------------------------
--query to find top 5 states as per profit

select top 5 state,sum(profit) as Profit from transactions a left join orders b on a.Order_ID=b.order_id 
inner join customers c on b.customer_id=c.customer_id 
left join locations_01 d on c.postal_code=d.postal_code group by state order by Profit desc

----------------------------------------------------------------------------------------------------------------------------------------------------
--query to find top 5 states profit margin

select top 5 state,format(sum(profit)/sum(Sales),'P') as Profit_Margin from transactions a left join orders b on a.Order_ID=b.order_id 
inner join customers c on b.customer_id=c.customer_id 
left join locations_01 d on c.postal_code=d.postal_code group by state order by Profit_Margin desc

----------------------------------------------------------------------------------------------------------------------------------------------------

--query to get sales by month_year

select '1',month_year,sum(sales) as Sales from transactions a left join orders b on a.Order_ID=b.order_id group by month_year having month_year in ('Dec-2017','Nov-2017','Oct-2017')

--for last 6 months

select '2',month_year,sum(sales) as Sales from transactions a left join orders b on a.Order_ID=b.order_id group by month_year having month_year in ('Jul-2017','Aug-2017','Sep-2017','Dec-2017','Nov-2017','Oct-2017')

--for last 12 months/ year 2017

select '3',month_year,sum(sales) as Sales from transactions a left join orders b on a.Order_ID=b.order_id group by month_year having month_year like ('%-2017') 

----------------------------------------------------------------------------------------------------------------------------------------------------

--query to get sales by period

select id as Period,sum(Sales) Sales from (select '1' as id,month_year,sum(sales) as Sales from transactions a left join orders b on a.Order_ID=b.order_id group by month_year having month_year in ('Dec-2017','Nov-2017','Oct-2017') union
select '2' as id,month_year,sum(sales) as Sales from transactions a left join orders b on a.Order_ID=b.order_id group by month_year having month_year in ('Jul-2017','Aug-2017','Sep-2017','Dec-2017','Nov-2017','Oct-2017') union
select '3' as id,month_year,sum(sales) as Sales from transactions a left join orders b on a.Order_ID=b.order_id group by month_year having month_year like ('%-2017')) as t1 group by id

----------------------------------------------------------------------------------------------------------------------------------------------------
--query to get total_amount_spent, total_orders, avg_basket_value

select customer_id,Total_Amount_Spent,Total_Orders, Total_Amount_Spent/ Total_Orders as Avg_Basket_Value from
(select orders.customer_id,sum(Sales) as Total_Amount_Spent, count(orders.order_id) as Total_Orders  from transactions 
inner join orders on transactions.order_id=orders.order_id 
inner join customers on orders.customer_id=customers.customer_id group by orders.customer_id) as t1
