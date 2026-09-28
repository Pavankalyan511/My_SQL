use pfs39;

select country,sales from superstore where country in ('Spain','Italy') and sales>500; 
select country,sales from superstore  where (country='Spain' or country='Italy') and sales>500;

select country,sales from superstore where sales>=500 and sales<=2000 order by sales asc;
select country,sales from superstore where sales between 500 and 2000 order by sales asc;

select distinct country from superstore where country between 'france' and 'Spain' order by country;

#Display country in asc order and sales in desc order
select distinct country, sales from superstore order by country desc, sales asc;

select distinct country, category from superstore order by country asc, category asc;

#Pattern Matching
select distinct country from superstore where country like 'i%';  #starts with
select distinct country from superstore where country like '%a';  #ends with

#get the countries which contain 'ia' letters
select distinct country from superstore where country like '%ia%';

#get the coustomer_name starting with 's' letter
select distinct customer_Name from superstore where country like 's%';

#get the countries ending with 'land'
select distinct country from superstore where country like '%land';

#get the countries which contain the word 'king'
select distinct country from superstore where country like '%king%';

#get the countries starting with 'i' letter and it has exactly 5 letters
select distinct country from superstore where country like 'i____';

#countries with exactly 7 letters
select distinct country from superstore where country like '_______';

#countries with more than 7 letters
select distinct country from superstore where country like '_______%';

#countries with less than 7 letters
select distinct country from superstore where country not like '_______%';

#countries which has the third letter as 'd'
select distinct country from superstore where country like '__d_%';

#Arithematic operators --> +,-,*,/,%
select distinct profit, quantity from superstore;
select distinct profit, quantity, profit/quantity as profit_per_item from superstore;

#add each sale by 200 as expected_sale
select distinct sales,sales+200 as expected_sale from superstore;

#Assignment operators --> =,:=
set @min_sales = 500;          #(we should use @ for declaring a variable)
select @min_sales;
select sales from superstore where sales > @min_sales;

select @max_sales:=6000;

#Bitwise operators --> &,|,^,<<,>>
select 2 & 6;
select 3 | 7;
select 5<<3;                #multiplies by 2 power n --> 5*2^3;  x=5,n=3 -- x*2^n
select 60>>2;               #Divides by 2 power n ---> x/2^n

select * from emp;
truncate emp;
insert into emp values(1,'kavya',null),
(2,null,35000),
(3,'geetha',28000),
(4,null,40000);

select * from emp where emp_name is null;
select * from emp where emp_name is not null;

