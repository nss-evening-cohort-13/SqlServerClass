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



select *, 
	Case 
		When s.Country = 'USA' Then 'Made in the USA' 
		When s.Country = 'America' Then 'Made in the USA'
		Else null
	End MuricaTag,
	Case s.Country
		When 'USA' Then 'Made in the USA' 
		When 'America' Then 'Made in the USA'
		Else null
	End 
from Suppliers s


--give me all distinct results between two or more sets
select c.Address, city, PostalCode, Country, c.Fax
from Customers c
where c.Region = 'OR' 
union
select Address, city, PostalCode, Country, null
from Employees e
where e.Region = 'OR'


--give me all results, not just distinct, between two or more sets
select c.Address, city, PostalCode, Country, c.Fax
from Customers c
where c.Region = 'OR' 
union all
select Address, city, PostalCode, Country, null
from Employees e
where e.Region = 'OR'



--all from the first set that doesn't exist in the second
select Address, city, PostalCode, Country, null
from Employees
except
select Address, city, PostalCode, Country, null
from Employees e
where e.Region = 'OR'



--self join 
select e.FirstName, bosses.FirstName 
from Employees e
	join Employees bosses
		on bosses.EmployeeID = e.ReportsTo

