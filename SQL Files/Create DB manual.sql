use RevisedClassicCars
create table Offices
(
OfficeCode Varchar(10) not null,
city varchar(50),
phone varchar(50),
addressLine1 varchar(50),
addressline2 varchar(50),
state varchar(50),
country varchar(50),
postalCode varchar(15),
territory varchar(10)
primary key (officecode)
)

create table employees
(
employeeNumber int not null,
lastname varchar(50),
firstname varchar(50),
extension varchar(50),
email varchar(100),
officecode varchar(10) not null,
reportsto int,
jobTitle  varchar(50)
primary key(employeeNumber)
foreign key(officecode) references offices(officecode)
)

create table customers
(
customerNumber int not null,
customerName varchar(50),
contactlastname varchar(50),
contactFirstname varchar(50),
phone varchar(50),
addressLine1 varchar(50),
addressLine2 varchar(50),
city varchar(50),
state varchar(50),
postalcode varchar(15),
country varchar(50),
salesRepEmployeesNumber int,
Creditlimit float
primary key (customerNumber)
foreign key (salesRepEmployeesNumber) references employees(employeeNumber)
)

create table payments
(
customerNumber int not null,
checkNumber varchar(50) not null,
paymentDate Datetime,
amount float
primary key(customerNumber, checknumber)
foreign key (customerNumber) references customers(customerNumber)
)

create table productlines
(
productline varchar(50) not null,
textdescription text,
htmldescription text,
image image
primary key(productline)
)



create table products
(
productCode varchar(15) not null,
productName varchar(70),
productLine varchar(50),
productScale varchar(10),
productVendor varchar(50),
productdescription varchar(max),
quantityInStock int,
buyPrice float,
MSRP float
primary key(productCode)
foreign key(productLine) references productLines(productLine)
)

create table orders
(
ordernumber int not null,
orderDate datetime,
requiredDate datetime,
shippeddate datetime,
status varchar(15),
comments text,
customerNumber int
primary key(orderNumber)
foreign key (customerNumber) references customers(customerNumber)
)

create table orderdetails
(
orderNumber int not null,
productCode varchar(15) not null,
quantityOrdered int,
priceEach float,
orderLineNumber smallint
primary key(orderNumber, productcode)
foreign key(orderNumber) references orders(orderNumber),
foreign key(productCode) references products(productcode)
)


