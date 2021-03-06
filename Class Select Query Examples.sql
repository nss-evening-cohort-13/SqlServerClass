select blerg = ProductName, 
	   UnitsInStock * UnitPrice as PotentialRevenue
from products
where UnitPrice = 20


--right outer joins give you all the data from the rightmost table
--and the matching data from the leftmost
select s.*,p.*
from products p 
	right join Suppliers s 
		on p.SupplierID = s.SupplierID
where p.ProductID is null


select p.*,s.CompanyName, c.CategoryName 
from products p 
	join Suppliers s 
		on p.SupplierID = s.SupplierID
	join Categories c
		on c.CategoryID = p.CategoryID

/*
which category (name) of product had the largest $ amount in sales all time

*/

select c.CategoryName, sum(od.UnitPrice * Quantity * (1-Discount)) as revenue
from [order details] od
	join Products p
		on p.ProductID = od.ProductID 
	join Categories c
		on c.CategoryID = p.CategoryID
group by c.CategoryName  -- columns either have to be a grouping, or they have to used for calculation
order by revenue desc

select c.CategoryName, count(distinct od.ProductID) --(od.UnitPrice * Quantity * (1-Discount)) as revenue
from [order details] od
	join Products p
		on p.ProductID = od.ProductID 
	join Categories c
		on c.CategoryID = p.CategoryID
group by c.CategoryName  -- columns either have to be a grouping, or they have to used for calculation
order by revenue desc


select count(18) from [order details]


