------------ employees --------------
INSERT INTO 
  ClassicCarsDW..employees(employeeNumber, lastname, firstName, extension, email, officeCode, reportsTo, jobTitle) 
SELECT 
  employeeNumber, lastname, firstname, extension, email, officeCode, reportsTo, jobTitle
FROM ClassicCars..employees
  --done, test case--
  ----------offices-------------
  insert into ClassicCarsDW..offices
  (officecode, city, phone, addressLine1, addressline2, state, country, postalCode, territory)
  select
   officecode, city, phone, addressLine1, addressline2, state, country, postalCode, territory
   from ClassicCars..Offices

   --------products--------
   insert into ClassicCarsDW..products
   (productCode, productName, productScale, productVendor, productdescription, quantityInStock, buyPrice, MSRP, textdescription, htmldescription, image, productLine)
   select
   p.productCode, p.productName, p.productScale, p.productVendor, p.productdescription, p.quantityInStock, p.buyPrice, p.MSRP, l.textdescription, l.htmldescription, l.image, l.productLine
   from ClassicCars..products p, ClassicCars..productlines l

   --------orders--------
   insert into ClassicCarsDW..orders
   (ordernumber, orderDate, requiredDate, shippeddate, status, comments, customerNumber)
   select
   ordernumber, orderDate, requiredDate, shippeddate, status, comments, customerNumber
   from ClassicCars..orders

   ---------time--------
  insert into ClassicCarsDW..customers
  (customerNumber, customerName, contactlastname, contactFirstname, phone, addressLine1, addressLine2, city, state, postalcode, country, salesRepEmployeesNumber, Creditlimit)
  select
  customerNumber, customerName, contactlastname, contactFirstname, phone, addressLine1, addressLine2, city, state, postalcode, country, salesRepEmployeesNumber, Creditlimit
  from ClassicCars..customers

  --------payment--------
  alter table payments nocheck constraint all
  insert into ClassicCarsDW..payments
  (checkNumber, paymentDate, amount)
  select
  p.checkNumber, p.paymentDate, p.amount
  from ClassicCars..payments p


  /* default sql
------------ ProductDIM --------------
DELETE FROM ProductDIM
INSERT INTO 
  NorthwindDW..ProductDIM(ProductKey, ProductName, Supplier, Category, QuantityPerUnit, Discontinued)  
SELECT 
  p.ProductID, p.ProductName, s.CompanyName, c.CategoryName, p.QuantityPerUnit, p.Discontinued 
FROM 
  Northwind..Products p, Northwind..Suppliers s, Northwind..Categories  c
WHERE 
  p.SupplierID=s.SupplierID AND p.CategoryID=c.CategoryID


--------------CustomerDIM------------
DELETE FROM CustomerDIM

INSERT INTO NorthwindDW..CustomerDIM SELECT * FROM Northwind..Customers n


--------------RegionDIM------
DELETE FROM RegionDIM
INSERT INTO 
  NorthwindDW..RegionDIM(RegionKey, RegionDesc) 
SELECT 
  RegionID, RTRIM(RegionDescription) FROM Northwind..Region
  */