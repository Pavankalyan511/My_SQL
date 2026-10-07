
create table emps (emp_id int primary key, emp_name varchar(20), dept_id int, salary decimal(10,2), manager_id int);
insert into emps values(1,'Ram',101,25000, 5),(2,'Geetha',102,30000,4),(3,'Kavya',101,33000,5),(4,'Sandhya',102,38000,6),(5,'Tanuja',101,50000,7),
(6,'Praveen',NULL,42000,7),(7,'Pavan',104,90000,NULL);

create table depts(dept_id int primary key, dept_name varchar(20));
insert into depts values(101,'IT'),(102,'Sales'),(103,'HR'),(104,'CEO'),(105,'Marketing');


 ----------------------------------------- Multiple Joins -----------------------------------------------------------

create table customers(c_id int primary key, c_name varchar(20), age tinyint, city varchar(20));
create table orders(order_id int primary key, c_id int, order_date date, foreign key(c_id) references customers(c_id));
create table products(prod_id int primary key, prod_name varchar(20), price decimal(10,2));
create table order_details(od_id int primary key, order_id int, prod_id int, quantity int, 
foreign key(order_id) references orders(order_id), foreign key (prod_id) references products(prod_id));

insert into customers values(1,'kavya',26,'vizag'),(2,'yamini',25,'vjw'),(3,'anusha',23,'hyd'),(4,'Pavan',24,'blr'),(5,'praveen',26,'hyd'),(6,'revanth',23,'kolkata');
insert into orders values(1,2,'2026-03-01'),(2,1,'2026-05-13'),(3,3,'2026-02-13'),(4,1,'2026-04-15'),(5,4,'2025-12-31'),(6,1,'2025-11-23'),(7,5,'2025-12-31');
insert into products values (101,'Smartphone',55000),(102,'laptop',70000),(103,'Air conditioner',60000),(104,'Washing Machine',40000),(105,'Head phones', 20000);
insert into order_details values (11,1,101,2),(12,2,102,1),(13,3,105,2),(14,4,101,3),(15,5,102,2),(16,6,104,1),(17,7,105,2);


