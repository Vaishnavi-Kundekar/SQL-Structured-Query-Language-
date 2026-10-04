CREATE DATABASE Sales2 ;
USE Sales2 ;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

INSERT INTO Customers
(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES

-- India
(1, 'Pune Fresh Mart', 'Rahul Patil', 'FC Road', 'Pune', '411004', 'India'),
(2, 'Mumbai Electronics', 'Amit Sharma', 'Andheri East', 'Mumbai', '400069', 'India'),
(3, 'Delhi Super Store', 'Neha Verma', 'Rohini', 'Delhi', '110085', 'India'),
(4, 'Bangalore Tech Hub', 'Arun Kumar', 'Whitefield', 'Bangalore', '560066', 'India'),
(5, 'Hyderabad Foods', 'Priya Reddy', 'Madhapur', 'Hyderabad', '500081', 'India'),
(6, 'Chennai Traders', 'Kiran Kumar', 'T Nagar', 'Chennai', '600017', 'India'),
(7, 'Nagpur Wholesale', 'Sanjay Joshi', 'Dharampeth', 'Nagpur', '440010', 'India'),
(8, 'Nashik Fruits', 'Pooja Patil', 'College Road', 'Nashik', '422005', 'India'),
(9, 'Ahmedabad Textiles', 'Rajesh Shah', 'Navrangpura', 'Ahmedabad', '380009', 'India'),
(10, 'Jaipur Handicrafts', 'Anita Sharma', 'Malviya Nagar', 'Jaipur', '302017', 'India'),
(11, 'Kolkata Books', 'Ravi Das', 'Salt Lake', 'Kolkata', '700091', 'India'),
(12, 'Surat Fashion', 'Meena Patel', 'Adajan', 'Surat', '395009', 'India'),
(13, 'Pune Mobile Store', 'Vijay Jadhav', 'Kharadi', 'Pune', '411014', 'India'),
(14, 'Mumbai Furniture', 'Sneha Kulkarni', 'Powai', 'Mumbai', '400076', 'India'),
(15, 'Delhi Stationery', 'Rohit Singh', 'Dwarka', 'Delhi', '110075', 'India'),
(16, 'Bangalore Computers', 'Nitin Rao', 'Electronic City', 'Bangalore', '560100', 'India'),
(17, 'Hyderabad Pharma', 'Kavya Reddy', 'Banjara Hills', 'Hyderabad', '500034', 'India'),
(18, 'Nashik Dairy', 'Mahesh Pawar', 'Gangapur Road', 'Nashik', '422013', 'India'),

-- USA
(19, 'New York Supplies', 'John Smith', 'Main Street', 'New York', '10001', 'USA'),
(20, 'Texas Electronics', 'David Brown', 'Austin Road', 'Austin', '73301', 'USA'),
(21, 'California Foods', 'Emily Johnson', 'Market Street', 'San Francisco', '94105', 'USA'),

-- UK
(22, 'London Traders', 'James Wilson', 'Oxford Street', 'London', 'W1D 1BS', 'UK'),
(23, 'Manchester Foods', 'Emma Taylor', 'King Street', 'Manchester', 'M2 4LQ', 'UK'),

-- Canada
(24, 'Toronto Store', 'Daniel Martin', 'Queen Street', 'Toronto', 'M5H 2N2', 'Canada'),
(25, 'Vancouver Traders', 'Sophia Lee', 'Main Street', 'Vancouver', 'V5K 0A1', 'Canada'),

-- Australia
(26, 'Sydney Electronics', 'Michael Brown', 'George Street', 'Sydney', '2000', 'Australia'),
(27, 'Melbourne Foods', 'Olivia Wilson', 'Collins Street', 'Melbourne', '3000', 'Australia'),

-- Germany
(28, 'Berlin Market', 'Hans Miller', 'Alexanderplatz', 'Berlin', '10178', 'Germany'),

-- UAE
(29, 'Dubai Traders', 'Ahmed Khan', 'Sheikh Zayed Road', 'Dubai', '00000', 'UAE'),

-- Singapore
(30, 'Singapore Store', 'Daniel Tan', 'Orchard Road', 'Singapore', '238823', 'Singapore');

select * from customers;



-- give me customers whose id is between 15 and 25 
-- so here we used between & and 
select * from customers where customerId between 15 and 25;



-- give me customers records who are in country india 
select * from customers where country = "india";



-- give me record of those customers whose id is not 25 
-- so here <> means "not"
select * from customers where customerId <> 25;



-- give me cities who have "me" in their name of city 
-- output is :    Ahmedabad , Melbourne 
select city from customers where city like '%me%';


-- give me records of customers who are in country India , UK
select * from customers where country IN ('india', 'UK');
select * from customers where country='india'or country='UK';



-- give me customer records in descending order by city 
-- here we use concept order by and desc 
select * from customers order by city desc;


-- give me customer records arranged ascending by country and descending by city
select * from customers order by country asc, city desc;



-- give me record of customers who are in india or having city pune
select * from customers where country="india" and city= "pune";
select * from customers where country="india" or city= "pune";



-- give me record of customers who are in country india but not in pune
select * from customers where country="india" and not city="Pune";



-- not between 
select * from customers where customerid not between 10 and 20;




-- leass than and greater than
select * from customers where customerid <10 or customerid >20;




-- give me count of customers having unique country 
-- Counts the number of unique non-null values.
select count(distinct country) from customers;




-- Adds the values of unique numbers together.
select sum(distinct country) from customers;



-- This query returns the city name that comes last alphabetically from your customers table.
-- When you use the MAX() function on a text/string column like city, 
-- MySQL sorts the text values from A to Z and returns the very last one.
select max(city) from customers;     -- output : Vancouver


-- "Find the total number of customers located in each country. 
-- Display the results sorted from the country with the lowest number of customers to the country with the highest."
-- This query counts the total number of customers in each country and lists them in order from the fewest customers to the most.
select country, count(*) as coustomercount from customers group by country order by coustomercount;




select * from customers where city is null or city = '';


update customers set city ='Pune', postalcode='411043' where customerid = 5;

-- added new record 
INSERT INTO Customers
(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES

-- India
(31, 'sai', 'Rahul jadhav', 'katraj', '', '', 'India');


-- update 
update customers set city ='mumbai', postalcode='412030' where customerid = 31;


-- delete specific thing or record or field
delete from customers where customerid = 31;



-- delete whole table
drop table customers;

select * from customers limit 10;

alter table customers add mobile bigint;

alter table customers rename column mobile to m_number;

alter table customers modify m_number int;


-- describe gives all information from table
-- data type, null or not , keys , default , or any extra thing
describe customers;



-- "Retrieve a complete list of all customer names from the customers table."
/*
SELECT c.customername
Tells the database to fetch the customername column. The c. prefix specifies that this column belongs to the table nicknamed c.

FROM customers AS c
Tells the database to pull data from the customers table. The AS c part gives the table a temporary alias (or nickname) named c.

*/
-- This query selects and displays all the customer names from your table using a shorthand nickname (alias) for the table.
select c.customername from customers as c;




-- alias :
/*
In SQL, an alias is a temporary nickname given to a table or a column to make queries shorter, easier to read, and more organized.
It only exists for the duration of that specific query. You create one using the AS keyword.
*/


alter table customers drop column m_number;


-- alter 
/*
The ALTER command in SQL is used to change the structure of an existing table.
Unlike UPDATE (which changes the data inside the rows), ALTER changes the columns themselves—like changing the blueprint of your database.
*/