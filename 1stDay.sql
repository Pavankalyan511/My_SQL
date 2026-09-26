# creating a database
CREATE DATABASE PFS39;

# Displaying the databases 
show databases;

# Using the specific Database 
use pfs39;

# Removing a specific database
drop database pfs39;

# creating a table
create table students(std_id int, std_name varchar(20), std_mail varchar(30), ph_no varchar(20), city char(15));