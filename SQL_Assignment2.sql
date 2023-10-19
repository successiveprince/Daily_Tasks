create database SQLAssignment2
use SQLAssignment2

create table tblStudents(
	studentID INT Primary Key,
	firstName varchar(25),
	lastName varchar(25)
)
create table tblCourses(
	courseID INT Primary Key,
	courseName varchar(25),
	deptID INT Foreign Key References tblDepartments(deptID)
)

create table tblDepartments(
	deptID INT Primary Key,
	deptName varchar(50),
	)
	
create table tblEnrollments(
	enrollID INT Primary Key,
	studentID INT Foreign Key References tblStudents(studentID),
	courseID INT Foreign Key References tblCourses(courseID)
)
alter table tblEnrollments add enrollDate DATE

select * from tblStudents
select * from tblCourses
select * from tblDepartments
select * from tblEnrollments


--Q1
select s.studentID, s.firstName , s.lastName from tblStudents s 
inner join tblEnrollments e ON s.studentID = e.studentID
inner join tblCourses c ON c.courseID = e.courseID
inner join tblDepartments d ON c.deptID = d.deptID
where d.deptName = 'computer'
group by s.studentID,s.firstName,s.lastName
having count(e.studentID) > 1

--Q2
select distinct C.CourseName from tblCourses as c
inner join tblEnrollments as e on e.CourseId = c.CourseId
where e.enrollDate < '2023-10-19 15:55:02.383'                           



--Q3
SELECT s.FirstName, s.LastName
FROM tblStudents s
INNER JOIN tblEnrollments e ON s.studentID = e.studentID
INNER JOIN tblCourses c ON e.courseID = c.courseID
GROUP BY s.firstName, s.lastName
HAVING COUNT(DISTINCT c.deptID) > 1;


--Q4
select s.firstName , s.lastName from tblStudents s 
inner join tblEnrollments e ON s.studentID = e.studentID
inner join tblCourses c ON c.courseID = e.courseID
inner join tblDepartments d ON c.deptID = d.deptID
where d.deptName = 'Engineering'
group by s.firstName,s.lastName


select * from tblDepartments
select * from tblEnrollments
select * from tblStudents
select * from tblCourses

--Q5
SELECT d.deptName, c.courseName, COUNT(DISTINCT s.StudentID) AS TotalStudents
FROM tblDepartments d
INNER JOIN tblCourses c ON d.deptID = c.deptID
INNER JOIN tblEnrollments e ON c.courseID = e.courseID
INNER JOIN tblStudents s ON e.studentID = s.studentID
GROUP BY d.deptName, c.courseName ORDER By TotalStudents;


--Q6
SELECT s.FirstName, s.LastName
FROM tblStudents s
INNER JOIN tblEnrollments e ON s.StudentID = e.StudentID
INNER JOIN tblCourses c ON e.CourseID = c.CourseID
INNER JOIN tblDepartments d ON c.deptID = d.deptID
WHERE s.FirstName = d.deptName;


--Q7
SELECT TOP 1 d.deptName, AVG(Student_count) AS Avg_Students_Per_Course
FROM (
    SELECT c.deptID, COUNT(e.CourseID) AS Student_count
    FROM tblEnrollments AS e
    INNER JOIN tblCourses AS c ON e.CourseID = c.courseID
    GROUP BY c.deptID, e.CourseID
) AS subquery
INNER JOIN tblDepartments AS d ON d.deptID = subquery.deptID
GROUP BY d.deptName
ORDER BY Avg_Students_Per_Course DESC

--Q8
SELECT s.FirstName, s.LastName
FROM tblStudents s WHERE s.StudentID
NOT IN 
(SELECT e.StudentID FROM tblEnrollments e 
INNER JOIN tblCourses c ON e.CourseID = c.CourseID 
INNER JOIN tblDepartments d ON c.deptID = d.deptID
WHERE d.deptName = 'computer');


--Q9
SELECT   d.deptName, c.CourseName, MAX(e.enrollDate) AS MostRecentEnrollmentDate
FROM tblDepartments d
INNER JOIN tblCourses c ON d.deptID = c.deptID
INNER JOIN tblEnrollments e ON c.CourseID = e.CourseID
GROUP BY d.deptName, c.CourseName
order by MostRecentEnrollmentDate



--Q10
SELECT  d.deptName, AVG(Student_count) AS Avg_Students_Per_Course
FROM (
    SELECT c.deptID, COUNT(e.CourseID) AS Student_count
    FROM tblEnrollments AS e
    INNER JOIN tblCourses AS c ON e.CourseID = c.courseID
    GROUP BY c.deptID, e.CourseID
) AS subquery
INNER JOIN tblDepartments AS d ON d.deptID = subquery.deptID
where d.deptName='Engineering'
GROUP BY d.deptName,d.deptID
ORDER BY Avg_Students_Per_Course DESC