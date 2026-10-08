#-----------------------------------Joins--------------------------------------------------------------------------------------  
##Types --> Inner join, Left join, right join, full join, cross join, self join, equi join, non-equi join, natural join
#Inner join --> Returns only the matching records from both the tables
#left join --> Returns all the records from the left table and only the matching records from the right table
#right join --> Returns all the records from the right table and only the matching records from the left table
#full join --> Returns both (matching & non-matching records) from both tables 
#cross join --> Returns cartesian product of both tables
#self join --> A Table joins with itself
#equi join 
use pfs39;
create table emps (emp_id int primary key, emp_name varchar(20), dept_id int, salary decimal(10,2), manager_id int);
insert into emps values(1,'Ram',101,25000, 5),(2,'Geetha',102,30000,4),(3,'Kavya',101,33000,5),(4,'Sandhya',102,38000,6),(5,'Tanuja',101,50000,7),
(6,'Praveen',NULL,42000,7),(7,'Pavan',104,90000,NULL);
select * from emps;

create table depts(dept_id int primary key, dept_name varchar(20));
insert into depts values(101,'IT'),(102,'Sales'),(103,'HR'),(104,'CEO'),(105,'Marketing');
select * from depts;

#inner join
select e.emp_name, d.dept_name from emps e inner join depts d on e.dept_id=d.dept_id;

#left join
select e.emp_name, d.dept_name from emps e left join depts d on e.dept_id=d.dept_id;
select e.emp_name, d.dept_name from depts d left join emps e on e.dept_id=d.dept_id;

#right join
select e.emp_name, d.dept_name from emps e right join depts d on e.dept_id=d.dept_id;
select e.emp_name, d.dept_name from depts d right join emps e on e.dept_id=d.dept_id;

#full join
select e.emp_name, d.dept_name from emps e left join depts d on e.dept_id=d.dept_id
union 
select e.emp_name, d.dept_name from emps e right join depts d on e.dept_id=d.dept_id;

select e.emp_name, d.dept_name from emps e left join depts d on e.dept_id=d.dept_id
union all
select e.emp_name, d.dept_name from emps e right join depts d on e.dept_id=d.dept_id;

#cross join
select e.emp_name, d.dept_name from emps e cross join depts d;

#Display the employees who are working in 'IT' dept
select e.emp_name,d.dept_name from emps e join depts d on e.dept_id=d.dept_id where d.dept_name='IT';

#Display emp's salary with their dept_names
select e.emp_name,e.salary,d.dept_name from emps e join depts d on e.dept_id=d.dept_id; 

#Display the dept_names, including those with no emps
select e.emp_name, d.dept_name from emps e right join depts d on e.dept_id=d.dept_id;

#Display the depts which have no emps
select e.emp_name, d.dept_name from emps e right join depts d on e.dept_id=d.dept_id where e.emp_name is null;

#find highest salary in each dept
select d.dept_name,max(e.salary) from emps e join depts d on e.dept_id=d.dept_id group by 1;

#Display the depts with highest avg_salary
select dept_name, avg(salary) as avg_salary from emps e join depts d on e.dept_id=d.dept_id
group by d.dept_name order by avg_salary desc limit 1;
 
#Display the depts of the emps whose salary is above 30k
select d.dept_name, e.emp_name,e.salary from emps e join depts d on e.dept_id=d.dept_id where e.salary > 30000;

#Display the emps without a dept
select e.emp_name, d.dept_name from emps e left join depts d  on e.dept_id=d.dept_id where d.dept_name is null;
select e.emp_name, d.dept_name from depts d right join emps e on e.dept_id=d.dept_id where d.dept_name is null;

#Find no.of emps working in each dept
select d.dept_name, count(e.emp_id) as no_of_emps from emps e join depts d on e.dept_id=d.dept_id group by 1;