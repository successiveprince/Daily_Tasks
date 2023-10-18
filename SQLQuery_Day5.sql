create database Assignment
use Assignment

create table tblEmployees(
	epmId INT Primary Key ,
	firstName Varchar(50) ,
	lastName varchar (50) ,
	deptId INT
	)
	--alter table tblEmployees RENAME column departmentId to deptId
	EXEC sp_RENAME 'tblEmployees.departmentId' , 'deptId', 'COLUMN'
	select * from tblEmployees



insert into tblEmployees values (01 , 'Prince' , 'Kumar' , 101)
insert into tblEmployees values (02 , 'Ram' , 'Charan' , 102)
insert into tblEmployees values (03 , 'Govind' , 'Sharma' , 103)
insert into tblEmployees values (04 , 'Ajay' , 'Bohra' , 104)
insert into tblEmployees values (05 , 'Akasha' , 'Sinha' , 105)
insert into tblEmployees values (06 , 'Ajay' , 'Kumar' , 106)
insert into tblEmployees values (07 , 'Rohan' , 'Verma' , 106)
insert into tblEmployees values (08 , 'Sohan' , 'Dutt' , 102)



create table tblDepartment(
	deptId INT Primary Key ,
	deptName Varchar(50) ,
	)
truncate table tblDepartment
truncate table tblEmployees

select * from tblDepartment
ALTER TABLE tblEmployees
ADD FOREIGN KEY (deptId) REFERENCES tblDepartment(deptId);

insert into tblDepartment values (101 , 'Web')
insert into tblDepartment values (102 , 'ML')
insert into tblDepartment values (103 , 'AI')
insert into tblDepartment values (104 , '.NET')
insert into tblDepartment values (105 , 'React')
insert into tblDepartment values (106 , 'Node')
insert into tblDepartment values (108 , 'Web3')


create table tblOrders(
	orderId INT Primary Key ,
	custId INT ,
	orderDate DATE
	)

insert into tblOrders values (90 , 1001 , '2021-03-01')
insert into tblOrders values (91 , 1002 , '2021-05-07')
insert into tblOrders values (92 , 1003 , '2021-11-11')
insert into tblOrders values (93 , 1004 , '2022-03-31')
insert into tblOrders values (94 , 1005 , '2022-03-01')
insert into tblOrders values (95 , 1006 , '2022-03-01')
insert into tblOrders values (96 , 1007 , '2022-06-21')
insert into tblOrders values (97 , 1008 , '2023-01-02')
insert into tblOrders values (98 , 1009 , '2023-04-10')
insert into tblOrders values (99 , 1010 ,'2023-10-10')


create table tblOrderDetails(
	orderDetailsId INT Primary Key ,
	orderId INT ,
	productID INT ,
	quantity INT
	)
ALTER TABLE tblorderDetails
ADD FOREIGN KEY (orderId) REFERENCES tblOrders(orderId);

insert into tblOrderDetails values (611 , 91 , 511 , 50)
insert into tblOrderDetails values (612 , 92 , 512 , 500)
insert into tblOrderDetails values (613 , 93 , 513 , 5)
insert into tblOrderDetails values (614 , 94 , 514 , 20)
insert into tblOrderDetails values (615 , 95 , 515 , 100)
insert into tblOrderDetails values (616 , 96 , 516 , 150)
insert into tblOrderDetails values (617 , 97 , 517 , 230)
insert into tblOrderDetails values (618 , 98 , 518 , 70)
insert into tblOrderDetails values (619 , 99 , 519 , 120)
insert into tblOrderDetails values (620 , 90 , 520 , 30)

create table tblProducts(
	productID INT Primary Key,
	productName varchar(50) ,
	unitPrice INT
	)


insert into tblProducts values (511 , 'Bill Machine' , 15000)
insert into tblProducts values (512 , 'Website' , 5000)
insert into tblProducts values (513 , 'Game' , 23000)
insert into tblProducts values (514 , 'Chat Bot' , 150000)
insert into tblProducts values (515 , 'OTT platform' , 55000)
insert into tblProducts values (516 , 'Books' , 12000)
insert into tblProducts values (517 , 'Bulbs' , 7000)
insert into tblProducts values (518 , 'AC' , 65000)
insert into tblProducts values (519 , 'Tables' , 5000)
insert into tblProducts values (520 , 'Chairs' , 5000)
insert into tblProducts values (521 , 'Laptop' , 90000)
insert into tblProducts values (522 , 'Keyboard' , 5000)


ALTER TABLE tblOrderDetails
ADD FOREIGN KEY (productID) REFERENCES tblProducts(productID);


--Q1
select firstName , lastName from tblEmployees

--Q2
select count(*) , deptId from tblEmployees group by(deptId)

--Q3
select * from tblDepartment where deptId NOT IN (select deptId from tblEmployees)

--Q4
select * from tblEmployees where epmId = (select max(epmId) from tblEmployees)

--Q5
select avg(quantity) from tblOrderDetails

--Q6
select distinct e.firstName , e.lastName from tblEmployees e INNER JOIN tblOrders o ON e.epmId = o.custId

--Q7
select YEAR(orderDate) as Years , count(orderId) as Counts from tblOrders group by YEAR(orderDate)

--Q8
select * from tblProducts where productID NOT IN(select productID from tblOrderDetails)

--Q9
select e.firstName , e.lastName from tblEmployees e INNER JOIN tblDepartment d ON e.firstName = d.deptName

--Q10
	select orderId , sum(unitPrice * quantity)as TotalPrice  from tblOrderDetails as o
	INNER JOIN tblProducts as p ON p.productID = o.productID group by(orderId)

--Q11
select TOP 1 custId ,sum(unitPrice * quantity)as TotalPrice  from tblOrderDetails as o
INNER JOIN tblProducts as p ON p.productID = o.productID INNER JOIN tblOrders od 
ON od.orderId = o.orderId
Group By custId
Order By TotalPrice DESC

--Q12
select TOP 1 custId , max(od.quantity) as TotalQuantity
from tblOrders o INNER JOIN tblOrderDetails od ON o.orderId = od.orderId 
Group by custId
Order By TotalQuantity DESC


--Q13
select  d.deptName from tblEmployees e
INNER JOIN tblDepartment d ON e.deptId = d.deptId
group by d.deptName having count(e.deptId)>1


--Q14
select d.deptName , avg(p.unitPrice) as AvgPrice 
from tblDepartment d 
INNER JOIN tblEmployees e ON  e.deptId = d.deptId
INNER JOIN tblOrders o ON e.epmId = o.custId
INNER JOIN tblOrderDetails od ON od.orderId = o.orderId
INNER JOIN tblProducts p ON p.productID = od.productID 
group by d.deptName;


--Q15
select Top 1 orderId , sum(unitPrice * quantity)as TotalPrice  from tblOrderDetails as o
	INNER JOIN tblProducts as p ON p.productID = o.productID group by(orderId) Order By TotalPrice DESC

--Q16
select * from tblEmployees where epmId NOT IN (select custId from tblOrders)

--Q17
select p.productName ,sum(unitPrice * quantity)as TotalRevenue  from tblOrderDetails as o
INNER JOIN tblProducts as p ON p.productID = o.productID
Group By p.productName


--Q18
select p.productName from tblProducts p INNER JOIN
tblOrderDetails od ON p.productID = od.productID
group by p.productName having count(od.productID) > 1


--Q19



--Q20
select TOP 1 p.productName ,sum(unitPrice * quantity)as TotalRevenue  from tblOrderDetails as o
INNER JOIN tblProducts as p ON p.productID = o.productID
Group By p.productName order by TotalRevenue DESC