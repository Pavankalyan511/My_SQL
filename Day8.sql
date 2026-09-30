use pfs39;

##functions are used is select statements, where as opertors are used in where clause

##Null Handling -- is null(), ifnull(), coalesce() 
#isnull() --> it checks the value, returns true(1) if it null else false(0)  
#ifnull() --> it checks only one value, provides and alternative value if it is null   #ifnull will check/accept only one attribte or value at a time
#ccoalesce() --> checks multiple values, and returns the first non-null values

create table student(std_id int, std_name varchar(20),email char(30),phn_no bigint, city varchar(20),age tinyint);
insert into student values(1,'Tanuja',null,6543210987,'vij',22),
(2,'kavya','kavya@gmail.com',null,'vizag',null),
(3,'pavan','pavan@gmail.com',6789012345,'blr',24),
(4,'praveen',null,null,'hyd',27);

select * from student;

#isnull() --> it checks the value, returns true(1) if it null else false(0)
select email, isnull(email) from student;
select age,isnull(age) from student;

#ifnull() --> it checks the value, provides and alternative value if it is null
select phn_no, ifnull(phn_no,'Not provided') from student;
select age, ifnull(age,0) from student;

#coalesce() --> checks multiple values, and returns the first non-null values
select * from student;
select email,phn_no, coalesce(email,phn_no, 'Not provided') as first_contact from student;

#Aggregation Functions --> sum, avg, count, min, max
select sales from superstore;
select sum(sales) as total_sales from superstore;
select avg(sales) as average from superstore;
select count(sales) as numofsales from superstore;
select min(sales) as min_sales from superstore;
select max(sales) as max_sales from superstore;

select sum(sales) as total_sales, avg(sales) as avgerage, count(sales) as NumOfSales, min(sales) as Min_sales, max(sales) as Max_sales from superstore;

#Get country wise total sales
#group by is a clause used to group the rows
select country, sum(sales) as total_sale from superstore group by country order by total_sale desc;

#get category wiese avg sales
select category,avg(sales) as average_sales from superstore group by category;

#get country wise and category wise total_sales
select country,category,sum(sales) as total_sales from superstore group by country, category;

#get the highest sale in the countries(germany, france, italy spain, austria)
select country, max(sales) as Highest_sales from superstore  where country in ('Germany','France','Italy','Spain','Austria')
 group by country order by Highest_sales desc;

# where clause is used to and it is used when we want to retrive the data from existing table 
#filter data and having clause is used to filter the groups and it is used when we want to retrive the data from the aggregated functions in table
#Having clause --> it is used to filter the groups

select country, max(sales) as Highest_sales from superstore  where country in ('Germany','France','Italy','Spain','Austria')
 group by country having Highest_sales>5000 order by Highest_sales desc;
 
#from --> chooses the table from database
#where --> filters the data
#group by --> groups the rows, aggregates the columns
#having --> filters the groups
#select --> to select the column from the table
#distinct --> removes duplicates
#order by --> sorts the result

# find total and avg sales for the countries which has the letters 'a' ans 's' in and the total_sale should be above 500000
select country ,sum(sales) as Total_sales, avg(sales) as Average_sales from superstore 
where country like '%a%' and  country like '%s%' group by country having Total_sales>50000;

