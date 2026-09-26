use pfs39;

desc courses;

desc students;

insert into courses values(101,'PFS');
SELECT * FROM COURSES;

insert into courses values(102,'JFS'), (103,'DA');

desc students;
insert into students values(1,'pk','pk@gmail.com',9876543210,22,'vij',101);
select * from students;
insert into students values(2,'rocky','rocky@gmail.com',6543217890,21,'bombay',102);
insert into students values(3,'pkrocky','pkrocky@gmail.com',876532190,22,'vij',105);
insert into students values(3,'pkrocky','pkrocky@gmail.com',876532190,22,'vij',101); #error
insert into students values(4,'pavan','pavan@gmail.com',876532190,22,'vij',101);
desc students;

insert into students(std_id, std_name,email,ph_num,age,c_id) values(5,'kaylan','kalyan@gmail.com',6789012345,22,102);

insert into students values(6,'abc','abc@gmail.com',6789012345,22,101);

#truncate -- removes the data in the table but not the structure of table
#drop-- removes the data and structure of the table / deletes entrire table
truncate students;
select * from students;
desc students;
drop table students;

create table students(std_id int, std_name varchar(20), email varchar(20), ph_num bigint,age int, city varchar(10), c_id int);
desc students;

#add constraints
#add primary key
#alter table table_name add constraint constraint_name primary key(col_name)
alter table students add constraint prk_emp_id primary key(std_id);

#add unique
#alter table table_name add constraint constraint_name unique(col_name);
alter table students add constraint unq_email unique(email);

#add check
#alter table table_name add constraint constraint_name check(condition);
alter table students add constraint chk_age check(age>=18);

#add default constraint
#alter table table_name alter column col_name set default 'value';
alter table students alter column city set default 'hyd';

#add not null
#alter table table_name modify column col_name datatype not null;
alter table students modify column ph_num bigint not null;

#add foreign key
#alter table table_name add constraint constraint_name foreign key(child_col_name) references parent_table_name(parent_col_name);
alter table students add constraint frk_cid foreign key(c_id) references courses(c_id);
desc students;