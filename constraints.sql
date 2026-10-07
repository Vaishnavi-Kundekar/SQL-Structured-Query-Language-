Create database schools;
use schools;
create table schools(
id int primary key, 
std_name varchar(100), 
mobile bigint unique ,
city varchar(100));
insert into schools values(1,"veda",9876543210,'pune');
select * from schools;
insert into schools values(2,"mina",9876543210,'nagpur'); -- mobile is not unique 
insert into schools values(3,"shreya",9876545610,'');

alter table schools modify city varchar(100) not null;
insert into schools values(4,"veda",9876786210, '');
describe schools;
insert into schools values(5,"pratham",8886543210);  -- column count doesnt match
insert into schools (id,std_name,mobile)values(1,"veda",9876543210);  -- city doesnt have default
insert into schools (id, mobile, city)values(6,9879943210,'pune');   -- data insertion depends on protocol

update schools set city='satara' where id=3;