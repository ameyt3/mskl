alter table orders add  
    delay int;

alter table orders add  
    delay_status varchar(20);

alter table products drop column manufacturer,upc,weight

alter table orders alter column order_estimated_delivery_date DATETIME


