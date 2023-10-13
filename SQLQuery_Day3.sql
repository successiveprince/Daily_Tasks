use Test_Database

--create table tbl_Emp(
--	empId int ,
--	empName varchar(25) ,
--	empCity varchar(25) ,
--	empDomain varchar(25)
--)

insert into tbl_Emp values (1 , 'Rohan' , 'Noida' , 'ML')
insert into tbl_Emp values (1 , 'Mohan' , 'UP' , 'AI')
insert into tbl_Emp values (1 , 'Rahul' , 'MP' , 'SQL')
insert into tbl_Emp values (1 , 'Ajay' , 'Bihar' , 'C++')
insert into tbl_Emp values (1 , 'Mina' , 'Gujrat' , 'Java')

update tbl_Emp set empId = 5 where empName='Mina'

select * from tbl_Emp
select * from tbldotnet

--left join
select tbldotnet.pos, tbl_Emp.empName from tbldotnet left join tbl_Emp on tbl_Emp.empId = tbldotnet.id

--right join
select tbldotnet.pos, tbl_Emp.empName from tbldotnet right join tbl_Emp on tbl_Emp.empId = tbldotnet.id

--inner join (common data)
select tbldotnet.pos, tbl_Emp.empName from tbldotnet inner join tbl_Emp on tbl_Emp.empId = tbldotnet.id

--full outer join
select tbldotnet.pos, tbl_Emp.empName from tbldotnet full outer join tbl_Emp on tbl_Emp.empId = tbldotnet.id

--self join
select * from tbldotnet t1 , tbldotnet t2

--cross join
select tbldotnet.pos, tbl_Emp.empName from tbldotnet cross join tbl_Emp 