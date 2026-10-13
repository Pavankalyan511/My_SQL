use pfs39;

#=================================== Triggers ========================================
# Trigger is a database object that executes a predefined   set of sql statements whenever the specified event
# (Insert, update, delete) occurs in a table

# ---Types==
#Before insert, after insert
#Before update, after update
#Before delete, after delete

create table student2(std_id int, std_name char(20), marks int);
insert into student2 values(1,'Geetha',95),(2,'karuna',75);
select * from student2;

insert into student2 values(3,'Madhu',150);

create table student_audit(status varchar(150));
select * from student_audit;

insert into student2 values(6,'Tanuja',200);
insert into student2 values(5,'Pavan',95);
select * from student2;

update student2 set marks=-75 where std_id=2;
set sql_safe_updates=0;

create table students_updated_table (std_id int, std_name char(20), old_marks int, new_marks int);
select * from students_updated_table;

create table student_archieve(std_id int, std_name char(20), marks int);
select * from student_archieve;

delete from student2 where std_id=3;
delete from student2 where std_id=5;

select * from student_audit;

