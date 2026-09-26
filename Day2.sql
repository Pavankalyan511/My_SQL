use pfs39;

desc students;

create table employees
(emp_id int primary key,
 emp_name char(20) not null,
 salary decimal(10,2) check(salary >=25000),
 email_id varchar(20) unique, 
 city char(20) default 'hyd',
 ph_num varchar(20));
 
 desc employees;
 
 drop table students;
 
create table courses
(c_id int primary key,
c_name char(20));

desc courses;

create table students
(std_id int primary key,
std_name varchar(20) not null, 
email varchar(30) unique,
ph_num bigint,
age tinyint check(age>=18),
city char(20) default 'vij',
c_id int, foreign key(c_id) references courses(c_id));

desc students;

desc employees;

#Alter commad is used to drop the column, 
#to change the datatype and size of column,
# to rename column or table, to add or drop the constranints

# to add a column
alter table employees add column exp tinyint;

desc employees;

# to drop a column
alter table employees drop column exp;

desc employees;

#to modify datatype and size
alter table employees modify column emp_name varchar(30);

desc employees;

#to rename any column
alter table employees rename column emp_id to employee_id;

desc employees;

#Rename a table
alter table employees rename to emps;

desc employees;
desc emps;

rename table emps to employees;