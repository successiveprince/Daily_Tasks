use Test_Database

select * from tbldotnet
select * from tbl_Emp
select * from tblEmployees

--view
create view avg_salary
As
select id , pos from tbldotnet where salary > (select avg(salary) from tbldotnet)

select * from avg_salary

create or alter view avg_salary
As
select id , pos , salary from tbldotnet where salary > (select avg(salary) from tbldotnet)

select * from avg_salary


drop view avg_salary


--stored procedure

create procedure highSalary @input INT
AS
Begin
	select id , pos from tbldotnet where salary > @input;
End;

Exec highSalary @input = 70000


--Trigger
create table employeeAudit(
	Login INT Primary key Identity(1,1)	,
	Action NVARCHAR(25),
	EmpId INT ,
	LogDate DATETIME
)

create trigger AuditEmpChange 
on tblEmployees
After INSERT , UPDATE , DELETE
AS
Begin
	declare @Action NVARCHAR(25);

	if exists (select * from inserted)
	Begin
		if exists (select *  from deleted)
			set @Action = 'UPDATE';
		else
			set @Action = 'INSERT';
	End
	else
		set @Action = 'DELETE';

	insert into employeeAudit (Action,EmpID, LogDate)
    select @Action, EmpId, GETDATE()
    from inserted;
End;

