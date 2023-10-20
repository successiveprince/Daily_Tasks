use BankSystem

create table tblBranchs(
	branchId VARCHAR(50) Primary Key,
	branchName VARCHAR(50) ,
	branchCity VARCHAR(50),
)

insert into tblBranchs values ('B1' , 'Dwarka' , 'Delhi')
insert into tblBranchs values ('B2' , 'Rohini' , 'Delhi')
insert into tblBranchs values ('B3' , 'Noida' , 'Delhi')

create table tblEmployees(
	empId INT Primary Key,
	branchId VARCHAR(50),
	empName VARCHAR(50),
	empDOB DATE,
	empEmail VARCHAR(30),
	empAddress VARCHAR(50),
	empPhone VARCHAR(20),
	empPosition VARCHAR(50),
	CONSTRAINT tblEmployees_branchId_fk FOREIGN KEY(branchId) REFERENCES tblBranchs(branchId)
	)
	insert into tblEmployees values (101 , 'B1' , 'Prince Kumar' , '2001-01-02','prince@gmail.com' , 'Dwarka Mor' , '9875643214' , 'Manager')
	insert into tblEmployees values (102 , 'B2' , 'Ajay Bohra' , '2000-10-22','ajay@gmail.com' , 'Palam' , '9875353214' , 'Accountant')
	insert into tblEmployees values (103 , 'B3' , 'Utkarsh' , '2001081-12','utkarsh@gmail.com' , 'Dwarka Sec 14' , '9878943214' , 'Cashier')
	
create table tblCustomer(
	custId VARCHAR(50) Primary Key,
	custFristName VARCHAR(50),
	custLastName VARCHAR(50),
	custCity VARCHAR(50),
	custDOB DATE,
	custEmail VARCHAR(30),
	custPhone VARCHAR(20),

)

insert into tblCustomer values ('C1' , 'Yash' , 'Behl' , 'Delhi' , '1996-09-29' , 'yash@gmail.com' , '9876543234')
insert into tblCustomer values ('C2' , 'Akshat' , 'Kumar' , 'Mathura' , '1998-09-12' , 'akshat@gmail.com' , '9456373234')
insert into tblCustomer values ('C3' , 'Raj' , 'Kumar' , 'Noida' , '1996-12-19' , 'raj@gmail.com' , '9898763234')

create table tblAccounts(
	accountNumber VARCHAR(50) PRIMARY KEY,
	branchId VARCHAR(50),
	custId VARCHAR(50),
	accountType VARCHAR(50) ,
	currBalance DECIMAL(10 ,2),
	CONSTRAINT tblAccounts_custId_fk FOREIGN KEY(custId) REFERENCES tblCustomer(custId),
    CONSTRAINT tblAccounts_branchId_fk FOREIGN KEY(branchId) REFERENCES tblBranchs(branchId)
	)
	insert into tblAccounts values ('A11' , 'B1' , 'C1' , 'Saving' , 200000)
	insert into tblAccounts values ('A12' , 'B2' , 'C2' , 'Saving' , 500000)
	insert into tblAccounts values ('A13' , 'B3' , 'C3' , 'Current' , 100000)

create table tblTransaction(
	tranNumber VARCHAR(50) Primary Key,
	accountNumber VARCHAR(50),
	tranAmount DECIMAL(10,2),
	transactionDate DATETIME,
	CONSTRAINT tblTransaction_accountNumber_fk FOREIGN KEY(accountNumber) REFERENCES tblAccounts(accountNumber)
)
insert into tblTransaction values ('T11' , 'A11' , 5000 , '2022-04-22 10:34:23')
insert into tblTransaction values ('T12' , 'A12' , 1000 , '2023-09-12 07:40:43')
insert into tblTransaction values ('T13' , 'A13' , 7000 , '2023-10-02 11:14:13')

create table tblLoan(
	custId VARCHAR(50),
	branchId VARCHAR(50),
	loanType VARCHAR(20),
	loanAmount DECIMAL(10,2),
	CONSTRAINT tblLoan_tblCustomer_custId_branchId_pk PRIMARY KEY(custId,branchId),
	CONSTRAINT tblLoan_custId_fk FOREIGN KEY(custId) REFERENCES  tblCustomer(custId),
    CONSTRAINT tblLoan_branchId_fk FOREIGN KEY(branchId) REFERENCES  tblBranchs(branchId)
)
insert into tblLoan values ('C1' , 'B1' , 'House' , 2000000)
insert into tblLoan values ('C2' , 'B2' , 'Car' , 1500000)
insert into tblLoan values ('C3' , 'B3' , 'Business' , 4000000)

select * from tblAccounts
select * from tblBranchs
select * from tblCustomer
select * from tblEmployees
select * from tblLoan
select * from tblTransaction

