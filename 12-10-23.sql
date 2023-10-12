use Test_Database

create table tbldotnet
(
	id int,
	pos varchar(25),
	salary int
)
insert into tbldotnet values(3 , 'Senior Associate' , 115000)

select * from tbldotnet

update tbldotnet set salary = 50000 where id = 2

select count(salary) from tbldotnet

select avg(salary) from tbldotnet

select upper(pos) from tbldotnet

select SUBSTRING(pos,1 , 3) from tbldotnet

select LOWER(pos) from tbldotnet

select count(pos) from tbldotnet group by salary having salary = 50000


alter table tbldotnet add city varchar(25);

alter table tbldotnet drop column city 

select replace('Prince Kumar' , 'n' , 'q')

SELECT TRIM('s ' FROM pos) from tbldotnet

select FORMAT(50000 , '##,###')

select DATALENGTH('Prince Kumar') as dataLength
select LEN('Prince Kumar') as length

select TRIM('       Prince Kumar      ') as Trim
select LTRIM('       Prince Kumar      ') as lTrim
select RTRIM('       Prince Kumar      ') as RTrim


select DIFFERENCE('Prince Kumar', 'Prince Kumar') as diff

select nchar(67) as unicode

select CONCAT('Prince' , ' Kumar')

select CONCAT_WS('_' , 'Prince' , 'Kumar')


select ASCII('Prince')
