use pfs39;

##Drop constraints
#drop primary key
#alter table table_name drop primary key;
alter table students drop primary key;
desc students;

#drop unique key
#alter table table_name drop index constraint_name;  
alter table students drop index unq_email;

#drop check 
#alter table table_name drop check constraint_name;
alter table students drop check chk_age;

#drop default
#alter table table_name alter column column_name drop default;
alter table students alter column city drop default;

#drop not null
#alter table table_name modify column column_name datatype null;
alter table students modify column ph_num bigint null;
alter table students modify column std_id int null;

#drop foreign key
#alter table table_name drop foreign key constraint_name;
alter table courses drop primary key;

alter table students drop foreign key frk_cid;

#multiple queries in single operation
alter table students drop column age, 
drop column city,
add column dept_id int;
desc students;


#insert into talbe_name values(....)
#insert into table_name(col1,col2,....) values(....)

drop table students;

create table emp
(emp_id int primary key auto_increment,
emp_name char(20),
salary decimal(10,2));
desc emp;

insert into emp(emp_name,salary) values ('Praveen',30000),('Pavan',70000),('kavya',45000);
select * from emp;

#auto_increment -- assigns values in increment order automatically.
#last_insert_id -- returns the first inserted id in the latest insert statement

select last_insert_id();
insert into emp(emp_name,salary) values ('Geetha',35000),('Sandhya',40000);

#insert values from one table to another table
create table high_salary_emps(emp_id int, emp_name varchar(20),salary decimal(10,2));
insert into high_salary_emps(emp_id, emp_name,salary) select * from emp where salary > 40000;

select * from emp where salary>40000;
select * from high_salary_emps;