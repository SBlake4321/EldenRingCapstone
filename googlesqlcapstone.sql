-- Joining 2 Table to be able to get info needed.

select *
from eldenring.damneg dn
join eldenring.immunity im
on dn.id = im.id
and dn.name = im.name
order by 2

-- Separating info needed for analysis

select dn.name, dn.category,dn.Fire, im.Poise, im.weight
from eldenring.damneg dn
join eldenring.immunity im
on dn.id = im.id
and dn.name = im.name
order by 1

-- Creating a CTE

with FvsP 
 as
 (
   select dn.name, dn.category, dn.Fire, im.Poise, im.weight
   from eldenring.damneg dn
   join eldenring.immunity im
    on dn.id = im.id
   and dn.name = im.name
   where dn.Fire != 0) 
select *, (Poise/fire) as PvsF
from FvsP

--Create a table with gathered data

CREATE TABLE eldenring.firevspoise 

as
(
select dn.name, dn.category, dn.Fire, im.Poise, im.weight
   from eldenring.damneg dn
   join eldenring.immunity im
on dn.id = im.id
and dn.name = im.name
)

-- Create different table with different varibles

Create Table eldenring.wightvspoise
as

  (select name, category, Poise, weight, (weight/poise) as wp
  from eldenring.immunity 
  where poise != 0)
  
  


