create database school;
use school;
show tables;
create table students (std_id int primary key auto_increment,
std_name varchar(100) not null, course_id int);

insert into students (std_name, course_id) values ('raj', 1);
insert into students (std_name, course_id) values ('ram', 2);
insert into students (std_name, course_id) values ('shyam', 1);
insert into students (std_name, course_id) values ('neha', 3);
insert into students (std_name, course_id) values ('divya', 2);
insert into students (std_name) values ('Sachin');
select * from students;

create table courses (course_id int primary key auto_increment,
course_name varchar(100) not null, fees decimal(10,2) not null);

insert into courses(course_name, fees) values ('Java', 50000);
insert into courses(course_name, fees) values ('Data Analysis', 40000);
insert into courses(course_name, fees) values ('Ditital Marketing', 20000);
insert into courses(course_name, fees) values ('cyber security', 60000);
select * from courses;
select * from students;


select s.std_name, c.course_name, c.fees from students s 
inner join courses c on s.course_id = c.course_id;

-- Left Join --  
select s.std_name, c.course_name, c.fees from students s 
left join courses c on s.course_id = c.course_id;

-- Right Join --  
select s.std_name, c.course_name, c.fees from students s 
right join courses c on s.course_id = c.course_id;