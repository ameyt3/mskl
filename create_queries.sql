create table customers(
    zip_code int,
    region varchar(25),
    country varchar(25),
    city varchar(25),
    state varchar(25),
    contact_number char(12)
)
create table orders (
    order_id varchar(20),
    customer_id varchar(20),
    shipmode varchar(20),
    vendor_id varchar(10),
    order_status varchar(15),
    order_purchase_date DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
)
create table products(
    product_id VARCHAR(20),
    product_name VARCHAR(150),
    colors varchar(20),
    category varchar(20),
    sub_category varchar(20),
    date_added varchar(20),
    manufacturer varchar(20),
    sizes varchar(300),
    upc varchar(150),
    weight varchar(10),
    product_photos_qty int
)
create table transactions(
    id int,
    order_id varchar(20),
    product_id varchar(20),
    sales_amt FLOAT,
    qty int,
    discount float,
    profit_amt FLOAT
)
create table returns(
    order_id varchar(20),
    return_reason varchar(20)
)
create table vendors(
    vendorID varchar(10),
    vendor_name varchar(20)
)
create table customer_reviews(
    review_id INT,
    review_text varchar(500),
    order_id varchar(20),
    customer_id varchar(20),
    reviews_rating int
)
create table order_payments(
    slno int,
    order_id varchar(20),
    payment_sequential int,
    payment_type varchar(20),
    payment_installments int,
    payment_value float
)