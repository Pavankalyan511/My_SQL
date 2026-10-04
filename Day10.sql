use pfs39;

select distinct Customer_Name from superstore;
select distinct Customer_Name, locate(' ',Customer_Name) from superstore; 
select distinct product_name from superstore;
select distinct product_name, locate(' ',product_name) as 1st, locate(' ',product_name,locate(' ',product_name)+1) as 2nd from superstore;
select distinct product_name, locate(' ',product_name) as 1st, locate(' ',product_name,locate(' ',product_name)+1) as 2nd,
 locate(' ',product_name, locate(' ',product_name, locate(' ',product_name)+1)+1) as 3rd from superstore;
 
 #string length fuctions --> length(),char_length()
 #length() --> counts in bytes
 #char_length() --> counts the characters
 select length('Codegnan');
 select char_length('Codegnan');
 select distinct country, char_length(country) as len from superstore;
 
 #Find the length of customer names in bytes
 select distinct customer_name, length(customer_name) as len from superstore;
 
 #String Modifications function --> upper(), lower(), reverse(),replace()
 select distinct customer_name, upper(customer_name) as uppercase, lower(customer_name) as lowercase from superstore;
 select distinct country, upper(country) as uppercase, lower(country) as lowercase from superstore;
 
 select distinct country ,reverse(country) from superstore;
 
 select distinct order_id from superstore;
 
 #replace(string, old_substring,new_substring)
 select distinct order_id, replace(order_id, 'ES', 'IT') as RPC from superstore;
 
 #replace the year 2019 with 2025
 select distinct order_id, replace(order_id, 2019, 2025) as RPC from superstore;
 
 #String concatenation functions --> concat(), concat_ws()
 select concat('pfs',' ','jfs');
 select concat_ws(' ','pfs','jfs','da');
 
 select concat('Code',' ',null,' ','gnan');
 select concat_ws(' ','code',null,'gnan');
 
 select distinct customer_name, contry, concat(customer_name,' ', country, ' ',region) from superstore;
 select distinct concat_ws(' ',customer_name, country, region) from superstore;
 
 #String Extraction Functions --> left(),right(), mid()/Substring()/subs
 #left(string,length)
 #right(string, length)
 #mid(string, length, starting_position)
 
 #PAVAN KALYAN ROCKY
 select left('Pavan kalyan rocky',5);
 select right('Pavan kalyan rocky',5);
 select substring('Pavan kalyan rocky',7,6);
 select substring('Pavan kalyan rocky',1,5);
 
 select disctinct order_id from superstore;
 select distinct order_id,left(order_id,2) as code, mid(order_id,4,4) as year, right(order_id,7) as order_num from superstore;
 
 select distinct customer_name from superstore;
 select distinct customer_name,left(customer_name,locate(' ',customer_name)) as f_name,
 right(customer_name, length(customer_name)-locate(' ',customer_name)) as l_name from superstore;
 
 #String formatting functions --> lpad(), rpad()
 #lpad(str,len,p)  left side padding
 #rpad(str,len,p)  right side padding

 #XXXX XXXX 1234
 select lpad(1234,12,'X');
 
 #AB***
 select rpad('AB',5,'*');
 
 #trim(), ltrim(),rtrim()
 #trim() -- removes both forward and trailing spaces
 #ltrim() -- removes forward spaces only
 #rtrim() -- removes trailing spaces only
 select trim('     hello     ');
 select ltrim('     hello     ');
 select rtrim('     hello     ');