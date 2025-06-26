--task1

--create databse
create database TechShop

--create table customers
create table customers(
customerid int primary key,
firstname varchar(15),
lastname varchar(15),
email varchar(30) unique,
phone_number varchar(20),
addresss varchar(40))

--navigate to techshop
use TechShop

select * from customers

--create table products
create table products(
productid int primary key,
productname varchar(20),
descriptionn varchar(100),
price decimal)

--create table orders
create table orders(
orderid int primary key,
customerid int foreign key references customers(customerid),
orderdate datetime,
totalamount decimal)

--create table orderdetails
create table orderdetails(
orderdetailid int primary key,
orderid int foreign key references orders(orderid),
productid int foreign key references products(productid),
quantity int not null)

--create table inventory
create table inventory(
inventoryid int primary key,
productid int foreign key references products(productid),
quantityinstock int,
laststockupdate datetime)

--insert values to customer tables
insert into customers (CustomerID, FirstName, LastName, email, Phone_number, Addresss)
VALUES
    (1, 'Alice', 'Johnson', 'alice.johnson@gmail.com', '+91-7352463718', '123 Maple St, Springfield'),
    (2, 'Bob', 'Smith', 'bob.smith@gmail.com', '+91-8354728476', '456 Oak St, Springfield'),
    (3, 'Charlie', 'Brown', 'charlie.brown@gmail.com', '+91-7283645183', '789 Pine St, Springfield'),
    (4, 'Diana', 'Prince', 'diana.prince@gmail.com', '+91-7823458692', '321 Elm St, Springfield'),
    (5, 'Ethan', 'Hunt', 'ethan.hunt@gmail.com', '+91-6293745173', '654 Cedar St, Springfield'),
    (6, 'Fiona', 'Gallagher', 'fiona.g@gmail.com', '+91-8765932154', '987 Birch St, Springfield'),
    (7, 'George', 'Michaels', 'george.m@gmail.com', '+91-1357924687', '111 Willow St, Springfield'),
    (8, 'Hannah', 'Lee', 'hannah.lee@gmail.com', '+91-7856341290', '222 Chestnut St, Springfield'),
    (9, 'Ian', 'Curtis', 'ian.curtis@gmail.com', '+919876543218', '333 Aspen St, Springfield'),
    (10, 'Julia', 'Roberts', 'julia.roberts@gmail.com', '+91-9876458321', '444 Walnut St, Springfield');

    --insert values to products tables
insert into products (productid, productname, descriptionn, price)
VALUES
    (1, 'Laptop', '15-inch display, 8GB RAM, 256GB SSD', 899.99),
    (2, 'Mouse', 'Wireless optical mouse, ergonomic design', 24.99),
    (3, 'Keyboard', 'Mechanical keyboard with RGB lighting', 69.99),
    (4, 'Monitor', '24-inch Full HD LED monitor', 149.99),
    (5, 'Headphones', 'Noise-canceling over-ear headphones', 129.99),
    (6, 'Webcam', '1080p HD webcam with microphone', 49.99),
    (7, 'Charger', '65W USB-C fast charger', 29.99),
    (8, 'Tablet', '10-inch Android tablet, 64GB storage', 199.99),
    (9, 'Smartwatch', 'Fitness tracker with heart rate monitor', 89.99),
    (10, 'External HDD', '1TB USB 3.0 external hard drive', 59.99);

    select * from products

    --insert value to order tables
    insert into orders (orderid, customerid, orderdate, totalamount)
VALUES
    (1, 1, '2025-06-01 10:30:00', 899.99),   -- Alice ordered a laptop
    (2, 2, '2025-06-02 12:00:00', 49.98),    -- Bob ordered 2 mice
    (3, 3, '2025-06-02 14:15:00', 149.99),   -- Charlie ordered a monitor
    (4, 4, '2025-06-03 09:45:00', 199.99),   -- Diana ordered a tablet
    (5, 5, '2025-06-03 11:00:00', 99.98),    -- Ethan ordered 2 chargers
    (6, 6, '2025-06-04 15:20:00', 69.99),    -- Fiona ordered a keyboard
    (7, 7, '2025-06-04 17:00:00', 129.99),   -- George ordered headphones
    (8, 8, '2025-06-05 10:10:00', 89.99),    -- Hannah ordered a smartwatch
    (9, 9, '2025-06-05 14:30:00', 59.99),    -- Ian ordered an external HDD
    (10, 10, '2025-06-06 16:45:00', 174.98); -- Julia ordered a webcam + keyboard

    select * from orders

    --insert values to order details table
    insert into orderdetails (orderdetailid, orderid, productid, quantity)
VALUES
    (1, 1, 1, 1),  
    (2, 2, 2, 2),  
    (3, 3, 4, 1),  
    (4, 4, 8, 1),  
    (5, 5, 7, 2),  
    (6, 6, 3, 1),  
    (7, 7, 5, 1),  
    (8, 8, 9, 1),   
    (9, 9, 10, 1),  
    (10, 10, 6, 1); 

    select * from orderdetails

    --insert values in inventory table
    insert into inventory (inventoryid, productid, quantityinstock, laststockupdate)
VALUES
    (1, 1, 15, '2025-06-01 08:00:00'),  -- Laptop
    (2, 2, 40, '2025-06-02 09:00:00'),  -- Mouse
    (3, 3, 25, '2025-06-02 10:30:00'),  -- Keyboard
    (4, 4, 18, '2025-06-03 08:45:00'),  -- Monitor
    (5, 5, 12, '2025-06-03 09:15:00'),  -- Headphones
    (6, 6, 22, '2025-06-04 10:00:00'),  -- Webcam
    (7, 7, 35, '2025-06-04 11:20:00'),  -- Charger
    (8, 8, 10, '2025-06-05 08:50:00'),  -- Tablet
    (9, 9, 14, '2025-06-05 09:45:00'),  -- Smartwatch
    (10, 10, 28, '2025-06-06 07:30:00');-- External HDD

    select * from inventory


    --task 2

    --1. Write an SQL query to retrieve the names and emails of all customers

    select firstname, lastname, email 
    from customers

    --2.Write an SQL query to list all orders with their order dates and corresponding customer name

    select o.orderid,o.orderdate,concat(c.firstname, ' ', c.lastname) as customer_name
    from orders o
    inner join 
    customers c 
    on o.customerid = c.customerid
    order by o.orderdate

    --3.Write an SQL query to insert a new customer record into the "Customers" table. Include
        --customer information such as name, email, and address

    insert into customers (customerid, firstname, lastname, email, phone_number, addresss)
   values
    (11, 'John', 'Davis', 'john.davis@gmail.com', '+91-9876543210', '555 Maple Avenue, Springfield')

    select * from customers

    --4.Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
        --increasing them by 10%

      update products 
      set price = price * 1.10

      select * from products

     --5.Write an SQL query to delete a specific order and its associated order details from the
     --"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

      delete from orderdetails where orderid = 2
      delete from orders where orderid = 1
      select * from orders

     --6.Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
       --order date, and any other necessary information.

     insert into orders (orderid, customerid, orderdate, totalamount)
     values (11, 3, '2025-06-14 15:30:00', 219.98);

     select * from orders

     --7.Write an SQL query to update the contact information (e.g., email and address) of a specific
     --customer in the "Customers" table. Allow users to input the customer ID and new contact information.

     update customers 
     set email = 'alicejohnson123@gmail.com',phone_number = '+91-9867520933',addresss = '767 charlie St,springfield'
     where customerid = 1

     select * from customers

     --8.Write an SQL query to recalculate and update the total cost of each order in the "Orders"
     --table based on the prices and quantities in the "OrderDetails" table.

      update orders 
     set totalamount = (
     select sum(od.quantity * p.price)
     from orderdetails od
     join 
     products p 
     on od.productid = p.productid
     where od.orderid = orders.orderid)

     select * from orders
     
   --9.Write an SQL query to delete all orders and their associated order details for a specific
   --customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.

   delete orderdetails
   from orderdetails od
   inner join 
   orders o 
   on od.orderid = o.orderid
   where o.customerid = 5 

   delete from orders
   where customerid = 5

   select * from orders

   --10.Write an SQL query to insert a new electronic gadget product into the "Products" table,
   --including product name, category, price, and any other relevant details.

   insert into products (productid, productname, descriptionn, price)
   values (11, 'Bluetooth Speaker', 'Portable wireless speaker with 10-hour battery life', 79.99);

   select * from products

   --11.Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
   --"Pending" to "Shipped"). Allow users to input the order ID and the new status.

   alter table orders 
   add order_status varchar(20)

   update orders 
   set order_status = 'shipped'
   where orderid = 4

   --12.Write an SQL query to calculate and update the number of orders placed by each customer
   --in the "Customers" table based on the data in the "Orders" table.

   alter table customers 
   add order_count int default 0

   update customers 
   set order_count = (
    select count(*)
    from orders 
    where orders.customerid = customers.customerid)

    select * from customers


    --task 3

    --1.Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
    --customer name) for each order.

    select o.orderid,o.orderdate,o.totalamount,concat(c.firstname, ' ', c.lastname) as customer_name
    from orders o
    inner join 
    customers c 
    on o.customerid = c.customerid

    --2.Write an SQL query to find the total revenue generated by each electronic gadget product.
    --Include the product name and the total revenue

    select p.productname,sum(od.quantity * p.price) as total_revenue
    from products p
    join
    orderdetails od
    on p.productid = od.productid
    group by p.productname

    --3.Write an SQL query to list all customers who have made at least one purchase. Include their
    --names and contact information

    select concat(c.firstname, ' ', c.lastname) AS customer_name,c.email,c.phone_number,c.addresss
    from customers c
    join orders o 
    on c.customerid = o.customerid

    --4.Write an SQL query to find the most popular electronic gadget, which is the one with the highest
    --total quantity ordered. Include the product name and the total quantity ordered.

    select top 1 
    p.productname,sum(od.quantity) as total_quantity
    from products p
    join 
    orderdetails od 
    on p.productid = od.productid
    group by p.productname
    order by total_quantity

    --5.Write an SQL query to retrieve a list of electronic gadgets along with their corresponding
    --categories

    select productname,descriptionn as product_description
    from products

    --6.Write an SQL query to calculate the average order value for each customer. Include the
    --customer's name and their average order value

      select concat(c.firstname, ' ', c.lastname) as customer_name,
      avg(o.totalamount) as average_order_value
      from customers c
      join
      orders o 
      on c.customerid = o.customerid
      group by c.customerid, c.firstname, c.lastname

      --7.Write an SQL query to find the order with the highest total revenue. Include the order ID,
      --customer information, and the total revenue

      select top 1
      o.orderid,concat(c.firstname, ' ', c.lastname) as customer_name,c.email,c.phone_number,o.totalamount as total_revenue
      from orders o
      join
      customers c
      on o.customerid = c.customerid
      order by o.totalamount


      --8.Write an SQL query to list electronic gadgets and the number of times each product has been ordered.

      select p.productname,count(od.orderid) as times_ordered
      from products p
      left join
      orderdetails od 
      on p.productid = od.productid
      group by p.productid, p.productname
      order by times_ordered

      --9.Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.

      select round(sum(o.totalamount) / count(o.orderid), 2) as average_order_value_all_customers
      from orders o
      inner join
      customers c 
      on o.customerid = c.customerid

      --10. Write an SQL query to find the total number of orders placed by each customer and list their
      --names along with the order count
      select concat(c.firstname, ' ', c.lastname) as customer_name,count(o.orderid) as order_count
      from customers c
      left join
      orders o 
      on c.customerid = o.customerid
      group by c.customerid, c.firstname, c.lastname
      order by order_count


      --task4

      --1.Write an SQL query to find out which customers have not placed any orders

      select customerid,concat(firstname, ' ', lastname) as customer_name,email,phone_number,addresss
      from customers c
      where c.customerid not in (
      select customerid 
      from orders 
      where customerid is not null)

      --2.Write an SQL query to find the total number of products available for sale.

      select 'Total Products Available for Sale' as description,
     (select count(*) from products) as total_products

     --3.Write an SQL query to calculate the total revenue generated by TechShop 

     select 'Total Revenue Generated by TechShop' as main,
    (select sum(totalamount) from orders) as total_revenue

    --4.Write an SQL query to calculate the average quantity ordered for products in a specific category.
    --Allow users to input the category name as a parameter 

    declare @categoryName varchar(50) = 'Laptop'

    select @categoryName as category_searched,'Average Quantity Ordered' as metric,
    (select avg(cast(od.quantity as decimal(10,2)))
     from orderdetails od
     inner join 
     products p
     on od.productid = p.productid
     where p.productname like '%' + @categoryName + '%' or p.descriptionn like '%' + @CategoryName + '%') as average_quantity

     --5.Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
     --to input the customer ID as a paramete

       declare @customerid int = 2

       select 
    @customerid as customer_id_searched,
    (select concat(c.firstname, ' ', c.lastname) 
     from customers c 
     where c.customerid = @customerid) as customer_name,
    (select c.email 
     from customers c 
     where c.customerid = @customerid) as customer_email,
    (select sum(o.totalamount) 
     from orders o 
     where o.customerid = @CustomerID) as total_revenue_generated,
    (select count(o.orderid) 
     from orders o 
     where o.customerid = @CustomerID) as total_orders_placed

     --6.Write an SQL query to find the customers who have placed the most orders. List their names
     --and the number of orders they've placed

     select concat(c.firstname, ' ', c.lastname) as customer_name,c.email,
     (select count(*) 
     from orders o 
     where o.customerid = c.customerid) as number_of_orders
     from customers c
     where (select count(*) 
     from orders o 
     where o.customerid = c.customerid) = 
     (select max(order_count) 
     from (select count(*) as order_count 
     from orders 
     group by customerid) as order_counts)
     order by customer_name

       --7.Write an SQL query to find the most popular product category, which is the one with the highest
       --total quantity ordered across all orders.

       select top 1
       p.productname as most_popular_product,
       (select sum(od.quantity) 
       from orderdetails od 
       where od.productid = p.productid) as total_quantity_ordered
       from products p
       where (select sum(od.quantity) 
       from orderdetails od 
       where od.productid = p.productid) = 
       (select max(total_qty) 
       from (select sum(od.quantity) as total_qty
       from orderdetails od
       group by od.productid) as product_totals)
       order by total_quantity_ordered 

      --8.Write an SQL query to find the customer who has spent the most money (highest total revenue)
      --on electronic gadgets. List their name and total spending


      select concat(c.firstname, ' ', c.lastname) as customer_name,c.email,
      (select sum(o.totalamount) 
      from orders o 
      where o.customerid = c.customerid) as total_spending
      from customers c
      where (select sum(o.totalamount) 
      from orders o 
      where o.customerid = c.customerid) = 
      (select max(customer_total) 
      from (select sum(o.totalamount) as customer_total
      from orders o
      group by o.customerid) as customer_spending)
      order by total_spending 

      --9.Write an SQL query to calculate the average order value (total revenue divided by the number of
      --orders) for all customers

      select 'average order value for all customers' as description,
      round((select sum(totalamount) from orders) / 
      (select count(*) from orders), 2) as average_order_value

        --10.Write an SQL query to find the total number of orders placed by each customer and list their
        --names along with the order count 

        select concat(c.firstname, ' ', c.lastname) as customer_name,c.email,
        (select count(*) 
        from orders o 
        where o.customerid = c.customerid) as order_count
        from customers c
        order by order_count desc, customer_name