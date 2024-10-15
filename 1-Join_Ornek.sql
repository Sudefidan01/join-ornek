--Hangi ürünüm hangi kategoridedir
--(Categories , Products)
select
	Products.ProductName,
	Categories.CategoryName
from Products 
	inner join Categories on Products.CategoryID=Categories.CategoryID
order by 
	Products.ProductName asc

--Çalışanlarım ne kadarlık satış yapmış
--(employees , orders , order details)
select
	(Employees.FirstName + '  '+Employees.LastName) as FullName,
	sum((od.Quantity*od.UnitPrice) * (1-Discount)) as TotalPrice
from Employees 
	inner join Orders on Employees.EmployeeID=Orders.EmployeeID
	inner join [Order Details] as od on od.OrderID=Orders.OrderID
group by 
	Employees.FirstName + '  '+Employees.LastName

--Hangi kategoride kaç tane ürün satmışım
--(categories , products , order details)
select
	Categories.CategoryName,
	sum(od.Quantity) as Amount
from Categories
	inner join Products on Categories.CategoryID=Products.CategoryID
	inner join [Order Details] as od on od.ProductID=Products.ProductID
group by CategoryName
order by Amount


	
