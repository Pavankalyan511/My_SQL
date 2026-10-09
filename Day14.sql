use pfs39;

create table customers(c_id int primary key, c_name varchar(20), age tinyint, city varchar(20));
create table orders(order_id int primary key, c_id int, order_date date, foreign key(c_id) references customers(c_id));
create table products(prod_id int primary key, prod_name varchar(20), price decimal(10,2));
create table order_details(od_id int primary key, order_id int, prod_id int, quantity int, 
foreign key(order_id) references orders(order_id), foreign key (prod_id) references products(prod_id));

insert into customers values(1,'kavya',26,'vizag'),(2,'yamini',25,'vjw'),(3,'anusha',23,'hyd'),(4,'Pavan',24,'blr'),(5,'praveen',26,'hyd'),(6,'revanth',23,'kolkata');
insert into orders values(1,2,'2026-03-01'),(2,1,'2026-05-13'),(3,3,'2026-02-13'),(4,1,'2026-04-15'),(5,4,'2025-12-31'),(6,1,'2025-11-23'),(7,5,'2025-12-31');
insert into products values (101,'Smartphone',55000),(102,'laptop',70000),(103,'Air conditioner',60000),(104,'Washing Machine',40000),(105,'Head phones', 20000);
insert into order_details values (11,1,101,2),(12,2,102,1),(13,3,105,2),(14,4,101,3),(15,5,102,2),(16,6,104,1),(17,7,105,2);

select * from customers;
select * from orders;
select * from products;
select * from order_details;

#get customer names and their order ids
select c.c_name, o.order_id from customers c join orders o on o.c_id=c.c_id;

select c.c_name, o.order_id, p.prod_name from customers c join orders o on c.c_id = o.c_id
 join order_details od on o.order_id=od.order_id join products p on p.prod_id=od.prod_id;
 
#get the customers who purchased 'smartphone'
select c.c_name,o.order_id, p.prod_name from customers c join orders o on c.c_id=o.c_id 
join order_details od on o.order_id=od.order_id join products p on p.prod_id=od.prod_id where p.prod_name='Smartphone';

#display the products and count how many times each product purchased
select p.prod_name, count(od.prod_id) as product_count from products p join order_details od on p.prod_id=od.prod_id group by 1;

#display customers and count of orders each customer placed
select c.c_name, count(o.c_id) as total_orders from customers c join orders o on c.c_id=o.c_id group by c.c_name;

#display the customers who are from hyd and the products they purchases 
select c.c_name,c.city, p.prod_name from customers c join orders o on c.c_id=o.c_id 
join order_details od on o.order_id=od.order_id join products p on p.prod_id=od.prod_id where c.city='hyd';

#find total expenditure of each customer
select c.c_name, sum(p.price*od.quantity) as total_expenditure from customers c 
join orders o on c.c_id=o.c_id join order_details od on od.order_id=o.order_id 
join products p on p.prod_id =od.prod_id group by 1;

##self join
select e.emp_name as employee, m.emp_name as manager from emps e join emps m on e.manager_id=m.emp_id;
#on condition --> finds the employee whose emp_id matches with this manager_id

#find the products purchased by kavya
select p.prod_name from products p join order_details od on p.prod_id=od.prod_id 
join orders o on od.order_id=o.order_id join customers c on o.c_id=c.c_id where c.c_name='Kavya';

#find the customer who placed highest no.of orders
select c.c_name, count(o.order_id) as total_orders from customers c 
join orders o on c.c_id=o.c_id group by c.c_id, c.c_name order by total_orders desc limit 1;

#find customer who spent highest amount
select c.c_name, sum(p.price*od.quantity) as total_spent from customers c
join orders o on c.c_id=o.c_id join order_details od on o.order_id=od.order_id 
join products p on od.prod_id=p.prod_id group by c.c_id, c.c_name order by total_spent desc limit 1;

#find customer who never placed any order
select c.c_name from customers c left join orders o on c.c_id=o.c_id where o.order_id is null;

#find the products which never purchesed
select p.prod_name from products p left join order_details od on p.prod_id=od.prod_id where od.prod_id is null;

#find youngest customer who placed an order
select c.c_name, c.age from customers c join orders o on c.c_id =o.c_id order by c.age asc limit 1;