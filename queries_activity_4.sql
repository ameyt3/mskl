select * into customers_backup from customers

-------------------------------------------------------------------------------------------------------

--cleaning column city and adding cleaned column to new column


alter table customers add correct_state varchar(50)

update customers set correct_state = trim([state]) 

update customers set correct_state= 'california' where state='    calfornia'

---------------------------------------------------------------------------------------------------------

--seperating first_name and last_name

alter table customers add first_name varchar(50)
alter table customers add last_name varchar(50)

update customers set first_name = trim(left(customer_name,CHARINDEX(' ',customer_name))) 

update customers set last_name = trim(substring(customer_name,CHARINDEX(' ',customer_name)+1,20)) 

-----------------------------------------------------------------------------------------------------------

--capitalize state and city

select * from customers

update customers set city=upper(left(city,1)+lower(substring(city,2,len(city))))
update customers set correct_state=upper(left(correct_state,1)+lower(substring(correct_state,2,len(correct_state))))

-----------------------------------------------------------------------------------------------------------

--query to get end date of month

select order_purchase_date,EOMONTH(order_purchase_date) as end_month_date from orders

-----------------------------------------------------------------------------------------------------------

--query to get month_year

select order_purchase_date, concat(left(datename(MONTH,order_purchase_date),3),'-',DATENAME(year,order_purchase_date)) as month_year from orders

-----------------------------------------------------------------------------------------------------------

--query to extract number part of customer_id

select customer_id,substring(customer_id,CHARINDEX('-',customer_id)+1,len(customer_id)) as id_num_part from customers 

-----------------------------------------------------------------------------------------------------------

--query to extract number part of order_id

select order_id,substring(order_id,CHARINDEX('-',order_id)+1,len(order_id)) as id_num_part from orders 

-----------------------------------------------------------------------------------------------------------

--query to get discount_value 

select sales_amt, discount, round((discount*sales_amt),2) as discount_value from transactions

-----------------------------------------------------------------------------------------------------------

--queries to get average sales made in last 3, 6, 12 months

select * from transactions
select top 10 * from orders

select sum(sales_amt) from transactions a left join orders b on a.order_id=b.order_id where order_purchase_date between   DATEADD(QUARTER,-1,'2017-01-15')   and '2017-01-15'
select sum(sales_amt) from transactions a left join orders b on a.order_id=b.order_id where order_purchase_date between   DATEADD(QUARTER,-2,'2017-01-15')   and '2017-01-15'
select sum(sales_amt) from transactions a left join orders b on a.order_id=b.order_id where order_purchase_date between   DATEADD(QUARTER,-4,'2017-01-15')   and '2017-01-15'


-----------------------------------------------------------------------------------------------------------

--query to get week for the order_date



select order_purchase_date,concat(DATEPART(day,week_start_date),'-',left(DATENAME(MONTH,week_start_date),3),' To ',DATEPART(day,week_end_date),'-',left(DATENAME(MONTH,week_end_date),3)) as week FROM
(select order_purchase_date,dateadd(DAY,1-DATEPART(weekday,order_purchase_date),cast(order_purchase_date as date)) as week_start_date,
        dateadd(DAY,7-DATEPART(weekday,order_purchase_date),cast(order_purchase_date as date)) as week_end_date from orders) as t1
