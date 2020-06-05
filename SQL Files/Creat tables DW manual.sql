use RevisedClassicCarsDW

create table officesDIM
(
officeKey int not null identity primary key,
OfficeCode Varchar(10) not null,
city varchar(50),
phone varchar(50),
addressLine1 varchar(50),
addressline2 varchar(50),
state varchar(50),
country varchar(50),
postalCode varchar(15),
territory varchar(10)
);

create table employeesDIM
(
employeeKey int not null identity primary key,
employeeNumber int not null,
lastname varchar(50),
firstname varchar(50),
extension varchar(10),
officecode varchar(10),
jobTitle varchar(50)
);

create table customersDIM
(
customerKey int not null identity primary Key,
customerNumber int not null,
customerName varchar(50),
contactlastname varchar(50),
contactFirstname varchar(50),
city varchar(50),
state varchar(50),
country varchar(50),
salesRepEmployeesNumber int,
);

create table productsDIM
(
productKey int not null identity primary key,
productCode varchar(15) not null,
productName varchar(70),
productLine varchar(50),
productVendor varchar(50),
quantityInStock int,
buyPrice float,
MSRP float
);

create table productLineDIM
(
productLineKey int identity primary key,
productLine varchar(50)
);

create table ordersDIM
(
orderKey int not null identity primary key,
ordernumber int not null,
shippeddate datetime,
customerNumber int
)

create table orderDetailsDIM
(
orderDetailKey int not null identity primary Key,
ordernumber int,
quantityOrdered int,
priceEach float,
productCode varchar(15)
)

CREATE TABLE TimeDIM
	(	[TimeKey] INT primary key, 
		[Date] DATETIME,
		[FullDateUK] CHAR(10), -- Date in dd-MM-yyyy format
		[FullDateUSA] CHAR(10),-- Date in MM-dd-yyyy format
		[DayOfMonth] VARCHAR(2), -- Field will hold day number of Month
		[DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
		[DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday 
		[DayOfWeekUSA] CHAR(1),-- First Day Sunday=1 and Saturday=7
		[DayOfWeekUK] CHAR(1),-- First Day Monday=1 and Sunday=7
		[DayOfWeekInMonth] VARCHAR(2), --1st Monday or 2nd Monday in Month
		[DayOfWeekInYear] VARCHAR(2),
		[DayOfQuarter] VARCHAR(3),
		[DayOfYear] VARCHAR(3),
		[WeekOfMonth] VARCHAR(1),-- Week Number of Month 
		[WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
		[WeekOfYear] VARCHAR(2),--Week Number of the Year
		[Month] VARCHAR(2), --Number of the Month 1 to 12
		[MonthName] VARCHAR(9),--January, February etc
		[MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
		[Quarter] CHAR(1),
		[QuarterName] VARCHAR(9),--First,Second..
		[Year] CHAR(4),-- Year value of Date stored in Row
		[YearName] CHAR(7), --CY 2012,CY 2013
		[MonthYear] CHAR(10), --Jan-2013,Feb-2013
		[MMYYYY] CHAR(6),
		[FirstDayOfMonth] DATE,
		[LastDayOfMonth] DATE,
		[FirstDayOfQuarter] DATE,
		[LastDayOfQuarter] DATE,
		[FirstDayOfYear] DATE,
		[LastDayOfYear] DATE,
		[IsHolidayUSA] BIT,-- Flag 1=National Holiday, 0-No National Holiday
		[IsWeekday] BIT,-- 0=Week End ,1=Week Day
		[HolidayUSA] VARCHAR(50),--Name of Holiday in US
		[IsHolidayUK] BIT Null,
		[HolidayUK] VARCHAR(50) Null --Name of Holiday in UK
);

create table salesfacts
(
timeKey int not null,
officeKey int not null,
employeeKey int not null,
customerKey int not null,
productLineKey int not null,
productKey int not null,
orderKey int not null,
orderDetailKey int not null,
quantityOrdered int,
shippedDate datetime,
priceEach float,
MSRP float

CONSTRAINT SalesKey PRIMARY KEY
(timeKey, productkey, productLineKey, employeekey, orderkey, orderDetailKey, officekey, customerkey),
foreign key (timeKey) references timedim(timeKey),
foreign key (productKey) references productsDIM(productKey),
foreign key (productLineKey) references productLineDIM(productLineKey),
foreign key (employeeKey) references employeesDIM(employeeKey),
foreign key (orderKey) references ordersDIM(orderKey),
foreign key (orderDetailKey) references orderDetailsDIM(orderDetailKey),
foreign key (officeKey) references officesDIM(officeKey),
foreign key (customerKey) references customersDIM(customerKey)
)

drop table RevisedClassicCarsDW..salesfacts

