#============================== TCL commands ======================================================
use pfs39;

create table accounts(ac_id int, c_name varchar(20), amount decimal(10,2));
insert into accounts values(101, 'Ram',5000),(102,'Sita',10000);
select * from accounts;

start transaction;
update accounts set amount=amount-2000 where ac_id =102;
set sql_safe_updates=0;
update accounts set amount=amount+2000 where ac_id=101;
select * from accounts;
commit;
rollback;

begin;
update accounts set amount=amount-3000 where ac_id=102;
update accounts set amouint=amount+3000 where ac_id=101;
select * from accounts;
rollback;
commit;

start transaction;
insert into accounts values(103,'Sindhu',2000);
savepoint sp1;
update accounts set amount=amount-1000 where ac_id=101;
savepoint sp2;
update accounts set amount=amount+1000 where ac_id=103;
select * from accounts;
rollback to sp1;
commit;


#log file --> is a DBMS componenet. It keeps a record of all the changes made by a transaction, so that the database can recover from 
               #failures and maintains the data consistency
select * from accounts;
insert into accounts values(104,'Praveen',4000);
rollback;

set autocommit =0;
delete from accounts where ac_id=104;
rollback;

set autocommit=1;

#====================Stored Procedures ================================================
# is a pre-defined sql statement that can be stored in datablase, and can be executed whenever required by using all command.alter
# No parameter
# In parameter --> send a value into the procedure
# Out parameter --> get a value out of the procedure
# In Out parameter --> send a value into the procedure and get a value out from it

create table student1(std_id int, std_name varchar(20), marks int);
insert into student1 values(1,'Geetha', 92),(2,'Tanuja',85),(3,'Sandhya',95);
select * from student1;

call get_students;

call get_students_by_marks;
#in
call pfs39.get_students_by_marks(90);

#out
set @total_students = 0;
call pfs39.students_count(@total_students);
select @total_students;

#inout
set @num = 11;
call pfs39.double_number(@num);
select @num;
