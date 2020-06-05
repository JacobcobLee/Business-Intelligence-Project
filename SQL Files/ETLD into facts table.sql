use ClassicCarsDW
--alter table salesfacts nocheck constraint all
INSERT INTO ClassicCarsDW..salesfacts
(productKey, 
employeeKey, 
orderKey, 
officeKey, 
customerKey, 
timeKey,
quantityOrdered, 
priceEach)

SELECT
 o.orderKey, 
 p.productKey,
 e.employeeKey, 
 f.officeKey, 
 c.customerKey, 
 t.timeKey,
 od.quantityOrdered, 
 od.priceEach

FROM 
ClassicCars..[orderdetails] od INNER JOIN ClassicCarsDW..[Orders] o
ON od.ordernumber = o.ordernumber

INNER JOIN ClassicCarsDW..products p
ON od.productCode = p.productCode

INNER JOIN ClassicCarsdw..customers c
ON o.customerNumber = c.customerNumber

INNER JOIN ClassicCarsdw..employees e
ON c.salesRepEmployeesNumber = e.employeeNumber

INNER JOIN ClassicCarsdw..offices f
ON e.officecode = f.OfficeCode 

INNER JOIN classicCarsDW..timeDim t
on o.shippeddate = t.date
;



