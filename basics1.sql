
-- SQL stands for STRUCTURED QUERY LANGUAGE 
-- Communicate with relational database
-- what is RELATIONAL DATABASE? 
/*database is comprises of more than one table so those tables are related with each other in terms of
cardinality like one to many, many to one , one to one ...for the analysis of data 
For example : we have databse sales it have following tables such as customer, product and orders 
so for the accurate and specific buisness problem solving the table needs to have relation management 
so that is relational database */

-- semicolon; 
/* semicolon is used to end the query ...
    it indicates that this query is ended here */
    
-- to execute the query we can press ctrl + enter tab 

 
create database sales;   -- create is a reserved keyword hence it is appeared in a blue color and sales is a user defined that is in a black color
use sales;
show databases;

-- we can create number of tables under a database

create table customer(c_id int, c_name varchar(100), mobile bigint);
show tables;
DESC customer;  

-- desc, describe shows what is in the column 

insert into customer values(1,'vaishnavi',9876543210);
select * from customer;
select c_name from customer;
select c_id,c_name from customer;
insert into customer values(2,'sumit',null);
select * from customer notexist;
insert into customer (c_id,mobile)values(3,9876542301);
select * from customer notexist;
insert into customer values(4,'manu',8967567689),
(5,'nisha',7645567859),
(6,'vaishu',9886858483);
select * from customer;

-- data type: categorise the data such as informative and calculative 
-- Error Code :  1007 (Database already exist) 