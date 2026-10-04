CREATE DATABASE SalesAnalyticsDB;

USE SalesAnalyticsDB;

-------------------------------------------------------- 

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    RegistrationDate DATE
);


INSERT INTO Customers
(CustomerID, CustomerName, Email, Phone, City, State, Country, RegistrationDate)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Pune', 'Maharashtra', 'India', '2024-01-15'),
(2, 'Priya Patil', 'priya@gmail.com', '9876543211', 'Mumbai', 'Maharashtra', 'India', '2024-02-20'),
(3, 'Amit Joshi', 'amit@gmail.com', '9876543212', 'Nashik', 'Maharashtra', 'India', '2024-03-10'),
(4, 'Sneha Kulkarni', 'sneha@gmail.com', '9876543213', 'Pune', 'Maharashtra', 'India', '2024-03-25'),
(5, 'Rohit Deshmukh', 'rohit@gmail.com', '9876543214', 'Nagpur', 'Maharashtra', 'India', '2024-04-05'),
(6, 'Neha Shah', 'neha@gmail.com', '9876543215', 'Ahmedabad', 'Gujarat', 'India', '2024-04-15'),
(7, 'Vikram Singh', 'vikram@gmail.com', '9876543216', 'Delhi', 'Delhi', 'India', '2024-05-01'),
(8, 'Pooja Mehta', 'pooja@gmail.com', '9876543217', 'Mumbai', 'Maharashtra', 'India', '2024-05-12'),
(9, 'Karan Verma', 'karan@gmail.com', '9876543218', 'Bangalore', 'Karnataka', 'India', '2024-06-10'),
(10, 'Anjali Rao', 'anjali@gmail.com', '9876543219', 'Hyderabad', 'Telangana', 'India', '2024-06-20');

------------------------------------------------------------------------ 
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

INSERT INTO Categories
(CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Furniture'),
(4, 'Books'),
(5, 'Beauty');

--------------------------------------------------------------- 
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2),
    Stock INT,
    Supplier VARCHAR(100),
    LaunchDate DATE,
    
    FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID)
);


INSERT INTO Products
(ProductID, ProductName, CategoryID, Price, Stock, Supplier, LaunchDate)
VALUES
(101, 'Laptop', 1, 55000, 20, 'Dell India', '2024-01-10'),
(102, 'Smartphone', 1, 25000, 35, 'Samsung India', '2024-01-15'),
(103, 'Headphones', 1, 2500, 50, 'Boat', '2024-02-01'),
(104, 'T-Shirt', 2, 799, 100, 'Puma', '2024-02-10'),
(105, 'Jeans', 2, 1499, 80, 'Levis', '2024-02-15'),
(106, 'Office Chair', 3, 7500, 30, 'Nilkamal', '2024-03-01'),
(107, 'Study Table', 3, 12000, 15, 'Woodland', '2024-03-10'),
(108, 'Java Book', 4, 699, 60, 'TechBooks', '2024-03-20'),
(109, 'SQL Book', 4, 599, 70, 'DataBooks', '2024-03-25'),
(110, 'Face Cream', 5, 499, 90, 'Lakme', '2024-04-01');

-------------------------------------------------------------------------------- 
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    ManagerID INT,
    Salary DECIMAL(10,2),
    JoiningDate DATE
);

INSERT INTO Employees
(EmployeeID, EmployeeName, Department, ManagerID, Salary, JoiningDate)
VALUES
(1, 'Raj Mehta', 'Sales', NULL, 70000, '2022-01-10'),
(2, 'Aakash Patil', 'Sales', 1, 45000, '2023-02-15'),
(3, 'Snehal Joshi', 'Sales', 1, 48000, '2023-04-10'),
(4, 'Nikhil Shah', 'IT', NULL, 80000, '2021-08-20'),
(5, 'Riya Desai', 'IT', 4, 55000, '2023-06-12'),
(6, 'Omkar More', 'HR', NULL, 60000, '2022-11-01'),
(7, 'Pallavi Kulkarni', 'HR', 6, 42000, '2024-01-05');

------------------------------------------------------------------------------------ 
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    OrderStatus VARCHAR(30),
    
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID),
    
    FOREIGN KEY (EmployeeID)
    REFERENCES Employees(EmployeeID)
);


INSERT INTO Orders
(OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount, OrderStatus)
VALUES
(1001, 1, 2, '2024-05-01', 55000, 'Completed'),
(1002, 2, 3, '2024-05-03', 25000, 'Completed'),
(1003, 3, 2, '2024-05-05', 3299, 'Completed'),
(1004, 4, 3, '2024-05-08', 12000, 'Pending'),
(1005, 5, 2, '2024-05-10', 1499, 'Completed'),
(1006, 6, 5, '2024-05-12', 7500, 'Cancelled'),
(1007, 7, 5, '2024-05-15', 25699, 'Completed'),
(1008, 8, 2, '2024-05-18', 799, 'Completed'),
(1009, 9, 3, '2024-05-20', 55000, 'Completed'),
(1010, 10, 5, '2024-05-22', 499, 'Pending'),
(1011, 1, 2, '2024-06-01', 25000, 'Completed'),
(1012, 2, 3, '2024-06-05', 8998, 'Completed'),
(1013, 3, 2, '2024-06-10', 12000, 'Completed'),
(1014, 4, 3, '2024-06-15', 1499, 'Cancelled'),
(1015, 5, 2, '2024-06-20', 599, 'Completed');

------------------------------------------------------------------------ 
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),
    
    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails
(OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1001, 101, 1, 55000),
(2, 1002, 102, 1, 25000),
(3, 1003, 103, 1, 2500),
(4, 1003, 104, 1, 799),
(5, 1004, 107, 1, 12000),
(6, 1005, 105, 1, 1499),
(7, 1006, 106, 1, 7500),
(8, 1007, 102, 1, 25000),
(9, 1007, 103, 1, 699),
(10, 1008, 104, 1, 799),
(11, 1009, 101, 1, 55000),
(12, 1010, 110, 1, 499),
(13, 1011, 102, 1, 25000),
(14, 1012, 105, 2, 1499),
(15, 1012, 108, 1, 699),
(16, 1013, 107, 1, 12000),
(17, 1014, 105, 1, 1499),
(18, 1015, 109, 1, 599);

-------------------------------------------------------------- 

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(30),
    Amount DECIMAL(10,2),
    
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
);

INSERT INTO Payments
(PaymentID, OrderID, PaymentDate, PaymentMethod, PaymentStatus, Amount)
VALUES
(501, 1001, '2024-05-01', 'Credit Card', 'Paid', 55000),
(502, 1002, '2024-05-03', 'UPI', 'Paid', 25000),
(503, 1003, '2024-05-05', 'Debit Card', 'Paid', 3299),
(504, 1004, '2024-05-08', 'UPI', 'Pending', 12000),
(505, 1005, '2024-05-10', 'Cash', 'Paid', 1499),
(506, 1006, '2024-05-12', 'Credit Card', 'Failed', 7500),
(507, 1007, '2024-05-15', 'UPI', 'Paid', 25699),
(508, 1008, '2024-05-18', 'Cash', 'Paid', 799),
(509, 1009, '2024-05-20', 'Credit Card', 'Paid', 55000),
(510, 1010, '2024-05-22', 'UPI', 'Pending', 499),
(511, 1011, '2024-06-01', 'UPI', 'Paid', 25000),
(512, 1012, '2024-06-05', 'Debit Card', 'Paid', 3697),
(513, 1013, '2024-06-10', 'Credit Card', 'Paid', 12000),
(514, 1014, '2024-06-15', 'UPI', 'Failed', 1499),
(515, 1015, '2024-06-20', 'Cash', 'Paid', 599);


---------------------------------------------------------------------------- 

CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY,
    OrderID INT,
    ReturnDate DATE,
    Reason VARCHAR(200),
    RefundAmount DECIMAL(10,2),
    
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
);

INSERT INTO Returns
(ReturnID, OrderID, ReturnDate, Reason, RefundAmount)
VALUES
(701, 1006, '2024-05-20', 'Product damaged', 7500),
(702, 1014, '2024-06-20', 'Wrong product', 1499);


-- ---------------------------------------------------------