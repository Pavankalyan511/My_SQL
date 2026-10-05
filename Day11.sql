use pfs39;

##Date Functions
select now();
select current_timestamp(); #Sql standard functions
select current_date();
select curdate();  #mysql functions
select current_time();
select curtime();
select date('2026-05-05');
select date(curdate());
select makedate(2026,375);
select year('2025-08-23') as yr;
select month(curdate());
select monthname(curdate());
select day(curdate());
select dayname(curdate());
select week(curdate());
select week('2026-05-05');
select quarter(curdate());
select weekday(curdate());     #mon-> 0, tue-> 1, _ _ _ _ _
select dayofweek(curdate());   #sun-> 1, mon-> 2, _ _ _ _ _
select dayofmonth(curdate());
select dayofyear(curdate());
select date_format(curdate(), '%y-%b-%D'); 
  #2026-10-05       26-Oct-5th

#%a --> short day name -- mon, tue, _ _ _.
#%b --> short month name -- jan, feb, _ _ _.
#%d --> day number -- 1,2,3, _ _ _.
#%m --> month number -- 1,2,3, _ _ _.
#%D --> Date with suffix -- 1st, 2nd, _ _ _.
#%M --> Full month number -- march, september, _ _ _.
#%W --> Full day names - Monday, Tuesday, _ _ _. 
#%Y --> Full year -- 2026.
#%y --> Short year --25,26.

select date_format('2004-09-15', '%Y-%b-%D') as year;

select datediff(curdate(),'2004-09-15');
select date_add(curdate(), interval 13 day);
select date_sub(curdate(), interval 365 day);

select distinct order_date, ship_date from superstore;

#Get year, month, monthname, and day from order_date column
select distinct order_date, year(order_date) as yr, month(order_Date) as mnth, monthname(order_Date) as MName, day(order_date) as DY from superstore;

#Get dayname, quarter and week from ship_date column
select distinct ship_date, dayname(ship_date) as Dyname, quarter(ship_date) as qtr, week(ship_date) as Weeek from superstore;

#calculate shipping days
select distinct datediff(ship_date,order_date) as diff from superstore;

#Add 10 days to the order_date as expected_date
select distinct date_add(order_date, interval 10 day) as expected_date from superstore;

#sub 30 days from order_date as previous date
select distinct date_sub(order_date, interval 30 day) as previous_date from superstore;

#Get the orders id's placed in 2022
select distinct order_id,year(order_date) as yr from superstore where year(order_date)=2022;

#get the orders placed in october
select distinct order_id,monthname(order_date) as mnth from superstore where monthname(order_date)='October';

#find the orders which are shipped on their order date
select distinct order_id from superstore where order_date=ship_date;
select distinct order_id from superstore where datediff(ship_date,order_date)=0;

#get the no.of orders placed in each year
select year(order_date) as yr, count(order_id) as no_of_orders from superstore group by yr;

#count orders by month
#format the order_date in this fromat: 26-10-mon;