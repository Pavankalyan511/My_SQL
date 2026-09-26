use pfs39;

select * from Superstore;

select category, country, segment from Superstore;
select country from Superstore;

#distinct -- removes duplicate records and returns only the unique values
select distinct country from Superstore;
select distinct category from Superstore;
select distinct country,category from Superstore;
select distinct country,category,segment from Superstore;
select distinct country from Superstore;
select distinct country from Superstore order by country asc;
select distinct country from Superstore order by country desc;

#order by -- it's a clause used to sort the result
select distinct sales from Superstore order by sales asc;
select distinct sales from Superstore order by sales desc;

#limit -- it is used to mention how many records are required
select distinct sales from Superstore order by sales asc limit 10;
select distinct sales from Superstore order by sales desc limit 10;

#offset -- it is used to mention how many records are to be skipped
select distinct sales from Superstore order by sales desc limit 1 offset 1;
select distinct sales from Superstore order by sales desc limit 1 offset 2;
select distinct sales from Superstore order by sales desc limit 3 offset 3;

select distinct country from Superstore limit 1 offset 2;

#order by is a clause used to sort the result
#where is a clause used to filter the data
select distinct country from superstore where country ='Germany';

select distinct country,category from superstore where country ='Germany' and category='Technology';

#except Germany all countries should print
select distinct country from superstore where country != 'Germany';

select distinct country from superstore where country = 'Germany' or country = 'France';
select distinct country from superstore where country in ('Germany','France');

select distinct country from superstore where country != 'Germany' and country <> 'France';

select distinct country,sales from superstore  where country='Germany' or country='France' or country='Spain' or country='Italy';
select distinct country,sales from superstore where country in ('Germany','France','Spain','Italy');

select distinct country,sales from superstore where country in ('Germany','France','Spain','Italy') and sales>500;
select distinct country,sales from superstore where country in ('Germany','France','Spain','Italy') and sales>500 order by sales desc;
select distinct country,sales from superstore where country in ('Germany','France','Spain','Italy')and sales>500 order by sales;
