use pfs39;

create table salary_grade(grade char(20), min_marks int, max_marks int);
alter table salary_grade rename column min_marks to min_salary;
alter table salary_grade rename column max_marks to max_salary;

insert into salary_grade values ('A',51000,90000),('B',31000,50000),('C',20000,30000);

select * from salary_grade;
select * from emps;
select e.emp_name, e.salary, s.grade from emps e join salary_grade s on e.salary between s.min_salary and s.max_salary;

#print detaisls of emps - 'B' grade
select e.emp_name, e.salary, s.grade from emps e join salary_grade s on e.salary between s.min_salary and s.max_salary where s.grade='B';

#find avg salary for each grade
select s.grade, avg(e.salary) as avg_sal from emps e join salary_grade s on e.salary between s.min_salary and s.max_salary group by s.grade;

select * from emps natural join depts;
select * from customers natural join products;

#======================================================SUB QUERY=========================================================================
#single-row subquery --> =,!=,>,< (any comparision operators)
#multiple-row subquery --> in, not in, any, all
#correlated subquery
#non-correlated subquery

#find the sales which are greater than the avg sales
select avg(sales) from superstore;
select sales from superstore where sales > (select avg(sales) from superstore);

#find the second highest sales
select max(sales) from superstore;
select max(sales) from superstore where sales < (select max(sales) from superstore);

select distinct sales from superstore order by sales desc limit 1 offset 1;

#find the profits which are greater than the max profit in furniture category
select profit from superstore where profit > (select max(profit) from superstore where category='furniture');

#find the orders placed on the latest order_date
select max(order_date) from superstore;
select order_id from superstore where order_date=(select max(order_date) from superstore);

## multiple-row subquery
# find all the orders of the customers who are from england
select customer_name, state, order_id from superstore where customer_name in
 (select distinct customer_name from superstore where state='England');
 
#find all the orders of the customers who ever placed an order in technology category
select customer_name, order_id from superstore where customer_name in 
 (select customer_name from superstore where category ='technology');
 
 # find the sales which are greater than any of the sales in furniture category
select sales from superstore where sales > any (select sales from superstore where category ='furniture');

# find the sales which are greater than all the sales in furniture category
select sales from superstore where sales > all (select sales from suprstore where category ='furniture');

#Display the customer who placed the order_id=3
select * from customers where c_id=(select c_id from orders where order_id=3);

#display the products purchased in order_id=5
select * from products where prod_id=(select prod_id from order_details where order_id=5);

#display the price of the product in order_id=1
select price from products where prod_id=(select prod_id from order_details where order_id=1);

#display the product which has price greater than the avg price fo all products

#display the customers who placed latest order

#display the customers who never ordered

#display the products that were never purchased

#display the products which were purchased more than once

# display customer who purchased smart phone

