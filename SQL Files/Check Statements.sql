
------use this to check for data inconsistency!------

---to check for cheapest to most expensive product---
select min(priceEach) as 'cheapest product', max(priceEach) as 'most expensive product' from RevisedClassicCarsDW..orderDetailsDIM

---check for number of times product was ordered---
select p.productName, count(p.productName) as 'times sold total' from RevisedClassicCarsDW..productsDIM p, RevisedClassicCarsDW..orderDetailsDIM where p.productCode = RevisedClassicCarsDW..orderDetailsDIM.productCode
group by productName

---find price of each product---
select distinct od.priceEach, p.productName, p.MSRP, p.buyPrice, x.orderDate, x.ordernumber  from RevisedClassicCarsDW..productsDIM p, RevisedClassicCarsDW..orderDetailsDIM od, RevisedClassicCars..orders x where p.productCode = od.productCode and productName = '1928 Mercedes-Benz SSK'
group by productName, priceEach, MSRP, buyPrice, orderDate, x.ordernumber
order by orderDate asc

select productName from RevisedClassicCarsDW..orderDetailsDIM, RevisedClassicCarsDW..productsDIM where RevisedClassicCarsDW..productsDIM.productCode = 

select * from RevisedClassicCarsDW..orderDetailsDIM where productCode ='S18_1367'

select * from RevisedClassicCarsDW..productsDIM

---lastest transaction---
select MAX(shippedDate) as 'lastest transaction' from RevisedClassicCarsDW..ordersDIM

select priceEach as 'sale price', 

select productVendor from revisedclassiccarsDW..productsDIM

select * from offices

select * from employees

select * from products

select * from productlines

select * from orders

select * from orderDetails

select * from customers
