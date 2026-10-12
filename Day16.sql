use pfs39;

#find the employees who are earning more than their dept's avg salary
select e1.emp_name, e1.salary from emps e1
 where e1.salary> (select avg(e2.salary) from emps e2
 where e1.dept_id =e2.dept_id);

#find thee emps earning highest salary in their deptartments
select e.emp_name,e.dept_id from emps e 
where e.salary=( select max(e1.salary) from emps e1 
where e.dept_id=e1.dept_id);

#find the emps who are the only in their dept
select e.emp_name, e.dept_id from emps e where (select count(e1.emp_name) from emps e1 where e.dept_id=e1.dept_id)=1;