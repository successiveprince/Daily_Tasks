create database BankSystem

use BankSystem

drop table tblBranchs
drop table tblEmployees
drop table tblAccounts
drop table tblCustomer
drop table tblLoan
drop table tblTransaction

create table tblBranchs(
	branchId VARCHAR(50) Primary Key,
	branchName VARCHAR(50) ,
	branchCity VARCHAR(50),
)

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

create table tblAccounts(
	accountNumber VARCHAR(50) PRIMARY KEY,
	branchId VARCHAR(50),
	custId VARCHAR(50),
	accountType VARCHAR(50) ,
	currBalance DECIMAL(10 ,2),
	CONSTRAINT tblAccounts_custId_fk FOREIGN KEY(custId) REFERENCES tblCustomer(custId),
    CONSTRAINT tblAccounts_branchId_fk FOREIGN KEY(branchId) REFERENCES tblBranchs(branchId)
	)

select * from tblAccounts

create table tblCustomer(
	custId VARCHAR(50) Primary Key,
	custFristName VARCHAR(50),
	custLastName VARCHAR(50),
	custCity VARCHAR(50),
	custDOB DATE,
	custEmail VARCHAR(30),
	custPhone VARCHAR(20),
	custAddress VARCHAR(50),

)

create table tblTransaction(
	tranNumber VARCHAR(50) Primary Key,
	accountNumber VARCHAR(50),
	tranAmount DECIMAL(10,2),
	transactionDate DATETIME,
	CONSTRAINT tblTransaction_accountNumber_fk FOREIGN KEY(accountNumber) REFERENCES tblAccounts(accountNumber)
)

create table tblLoan(
	custId VARCHAR(50),
	branchId VARCHAR(50),
	loanType VARCHAR(20),
	loanAmount DECIMAL(10,2),
	CONSTRAINT tblLoan_tblCustomer_custId_branchId_pk PRIMARY KEY(custId,branchId),
	CONSTRAINT tblLoan_custId_fk FOREIGN KEY(custId) REFERENCES  tblCustomer(custId),
    CONSTRAINT tblLoan_branchId_fk FOREIGN KEY(branchId) REFERENCES  tblBranchs(branchId)
)

