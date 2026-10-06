use pfs39;

##System information functions
select version(); # returns the mysql server version
select user();    # returns user and hostname of the server
select connection_id();  # returns the unique id generated for thiss connection/session

select * from courses;
delete from courses;
set sql_safe_updates=0;

insert into courses values(101,'pfs'),(102,'jfs');
select row_count();  #returns no.of rows affected by the most recent dml statement

update courses set c_name='DA' where c_id=102;
select row_count();

select @@version;
select @@hostname;

##set operators
#union  --> returns the result from any 2 queries without any duplicates
#union all --> returns the result from any 2 queries with duplicates
#intersection --> returns the result which is common from any 2 queries 
#except

create table store_orders(c_id int, c_name char(20));
insert into store_orders values(101,'Kavya'),(103,'Sindhu'),(103,'kiran'),(104,'Pavan'),(105,'Sam');

create table online_orders(c_id int, c_name char(20));
insert into online_orders values(104,'Pavan'),(105,'Sam'),(106,'Ramya'),(107,'Priya'),(108,'Praveen');

select * from store_orders
union all
select * from online_orders;

select * from store_orders
intersect
select * from online_orders;

#find the customer who purchased only in-store but never in online
select * from store_orders
except
select * from online_orders;

#Conditional/Case statements
select * from myemp;

#if(condition, value_if_true, value_if_false)
select emp_id, salary, if(salary>15000,'good','bad') as status from myemp;
select emp_id, salary, case when salary>15000 then 'good' else 'bad' end as status from myemp;

#salary <10000 - 'bad', salary>15000 - 'good', salary 10-15k - 'avg'
select salary, if(salary<10000,'bad', if(salary>15000,'good','avg')) as status from myemp;
select salary, case when salary> 15000 then 'good' when salary<10000 then 'bad' else 'avg' end as status from myemp;
                               