#cit381-lab02-queries



#1
select 
	e.employeeNumber as number, concat(e.lastname, ', ', e.firstName) as employee,
    o.city as office
from employees e

inner join offices o
		
on e.officeCode = o.officeCode
		
and o.country != 'USA'
		
#2
select
	l.productLine as Line, p.productName as Product, p.quantityInStock as Qty, p.MSRP as MSRP, 
	p.buyPrice as Price

from products as p
	
inner join productlines as l
	
on p.productLine = l.productLine
	
and MSRP > 200
	
#3
select
	c.customerName as customerName, o.orderNumber as orderNumber, o.orderDate as orderDate, 
	p.productName as productName,
	od.quantityOrdered as quantityOrdered,
	o.shippedDate - o.orderDate as deliveryDate

from orders o
	
inner join orderdetails od ON o.orderNumber = od.orderNumber
	
inner join products p ON od.productcode = p.productCode = p.productCode
	
inner join customers c ON c.customerNumber = o.customerNumber
	
where o.shippedDate - o.orderDate = 1
	
order by c.customerName, p.productName

#4
select
	avg(p.buyPrice) as AvgPrice, max(p.buyPrice) as MaxPrice, min(p.buyPrice) as MinPrice

from products
	
