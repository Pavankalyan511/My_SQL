use pfs39;

select country ,sum(sales) as Total_sales, avg(sales) as Average_sales from superstore 
where country like '%a%' and  country like '%s%' group by country having Total_sales>50000;

select avg(sales) as Average_sales from superstore;

##non-scalar functions --> rount(), ceil()/ceiling(),floor(),truncate().
#round() --> rounds to the nearest integer, based on the decimal values, if the value is>=5, rounds up else rounds down to nearest integer.
#ceil()/ceiling() --> Rounds up to the nearest Integer.
#floor() --> Round Down to the nearest integer.
#truncate() --> Just trims the values.

select round(114.313,-1);  # -1 --> rounds to the nearest 10's.
select round(113.527,-2);  # -2 --> rounds to the nearest 100's.
select round(1153.576,-3); # -3 --> rounds to the nearest 1000's.
select round(11.51,0);     # 0 --> rounds to the nearest int based on the decimal values.
select round(11.563,1);    # 1 --> rounds to 1 decimal value based on the next decimal value.
select round(11.567,2);    # 2 --> rounds to 2 decimal value based on the next decimal value.
select round(11.567,3);    # 3 --> rounds to 3 decimal value based on the next decimal value.

select floor(13.9016);

select truncate(10.567,1);
select truncate(10.567,2);
select truncate(10.567,0);
select truncate(10.567,-1);  #trims to nearest 10's
select truncate(10.567,-2);  #trims to nearest 100's

select avg(sales) from superstore;
select round(avg(sales),3) from superstore;

select sqrt(36);
select power(2,3);
select abs(100-200); # returns nums without '-'
select mod(23,2);   
select pi();
select sign(-234); # returns -1 for negative vals
select sign(234);  # returns 1 for positive vals
select sign(0);    # returns 0
select rand();     # returns random decimal value in the range 0 to 1
select exp(2);
select log(7.38905609893065);
select greatest(12,300,23);
select least(10,300,123);

##String Functions
#String search functions --> locate(), position(), instr().
select distinct order_id from superstore;
select distinct order_id, locate('-',order_id) from superstore;         #locate(substring, string)
select distinct order_id, position('-' in order_id) from superstore;    #position(substring in string)
select distinct order_id, instr(order_id,'-') from superstore;          #instr(string, substring)

select distinct order_id, locate('-', order_id) as 1st, locate('-',order_id, locate('-',order_id)+1) as 2nd from superstore;

