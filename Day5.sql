use pfs39;

#create a table from another table
#create table new_table_name as
        #select col1,col2 from source_table where condition
select * from emp where salary <40000;
create table low_sal_emps as select * from emp where salary < 40000;
select * from low_sal_emps;

select * from employees;

alter table employees add column dep_id int;
desc employees;

create table employees1
(emp_id int,
emp_name varchar(30),
dept_id int,
salary decimal(10,2),
email varchar(20),
city varchar(20));

desc employees1;
insert into employees1 values
(1,'kavya',101,35000,null,'hyd'),
(2,null,null,40000,'abc@gmail.com','vij'),
(3,'geetha',102,28000,'geetha@gmail.com',null),
(4,'praveen',101,33000,null,'vij'),
(5,'Tharuni',102,25000,null,'blr'),
(6,'Tanuja',103,45000,'tanuja@gmail.com','hyd'),
(7,'Pavan',103,50000,'pavan@gmail.com','vij');

desc employees1;
select * from employees1;

update employees1 set email='kavya@gmail.com' where emp_id=1;
set sql_safe_updates=0;

update employees1 set email='praveen@gmail.com' where emp_id=4;

update employees1 set dept_id='102' where dept_id is null;

update employees1 set email='Not provided' where email is null;

update employees1 set city='blr' where dept_id=103 and city='hyd';

update employees1 set city='hyd' where dept_id=102;

delete from employees1 where dept_id=101 and city='vij';
delete from employees1 where salary<30000;

select * from employees1;

delete from employees1;

#drop -- removes both the data and the table in the database
#truncate -- removes only the data, but the table will be there
#delete -- removes particular records while using with where clause,
# if we use without where, clause, removes overall data, but table wil be there