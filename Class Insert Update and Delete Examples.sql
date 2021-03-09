declare @Size int = 3
declare @Type varchar(40) = 'Honey Wheat'
declare @price decimal(18,2) = 2.50
declare @weightInOunces int = 24
declare @id int = 6

--Adding data is done via insert
Insert into Loaves(Size,[Type],Price,WeightInOunces)
output inserted.Id --ouput has access to the fully resolved inserted data
Values (@Size,@Type, @price,@weightInOunces) -- order is important here, needs to match the insert column order

--safety measure, can undo changes inside of a transaction with a rollback
begin transaction
--updating data


Update Loaves
   Set WeightInOunces = 16, --column name = value
       Size = 2,
	   Type = 'Monkey Bread'
output inserted.*, deleted.*  --inserted contains the new values, deleted contains the old values
Where  id = @id -- always always always be specific

select * from Loaves where id = @id

rollback  -- undoes the changes in the transaction
--commit -- commits the changes in the transaction

--deleting data
Delete 
from Loaves
where id = @id


select * from Loaves

--this is a bad idea usually, it removes all rows but doesn't log the change
--truncate table Loaves