USE employee_attrition;

 ALTER TABLE data
 RENAME COLUMN ï»¿Age to Age;
 
 ALTER TABLE data
 RENAME COLUMN EmployeeNumber to Employee_ID;
 
 Select * from data;
 
 /** Write an SQL query to find the details of employees under attrition having 5+ years of
 experience in between the age group of 27-35 */
 
 Select * from data
 where Age between 27 and 35
 and TotalWorkingYears >=5;
 
 #No. of Employees
 
 Select count(*) from data
 where Age between 27 and 35
 and TotalWorkingYears >=5;
 
 /** Ans: 455 **/
 
 /** Fetch the details of employees having maximum and minimum salary working in different department
 who received less than 13% salary hike*/
 
 Select department, max(MonthlyIncome), min(MonthlyIncome)
 from data
 where PercentSalaryHike <13
 group by department;
 
 /** Calculate the average montly income of all the employees 
 who worked more than 3 years and whose education background is medical **/
 
 Select avg(MonthlyIncome) as Average_Income
 from data
 where YearsAtCompany >3
 and EducationField = 'Medical'
 group by EducationField;
 
/** Ans: Average Monthly Income = 7345.9784 **/

/** Identify the total no. of male and female employees under attrition whose
marital status is married and haven't  received promotion in the last 2 years **/

Select Gender, count(Employee_ID)
from data
where MaritalStatus = 'Married'
and YearsSinceLastPromotion = 2
and Attrition = 'Yes'
group by Gender;

/** Employees with max performance rating but no promotion for 4 years and above **/

Select * from data
where PerformanceRating = ( select max(PerformanceRating) from data)
and YearsSinceLastPromotion >=4;

/** No. of Employees **/
Select Gender, count(*) from data
where PerformanceRating = ( select max(PerformanceRating) from data)
and YearsSinceLastPromotion >=4
group by Gender;

/** Who has max and min percentage salary hike **/

Select YearsAtCompany, 
PerformanceRating, 
YearsSinceLastPromotion,
max(PercentSalaryHike),
min(PercentSalaryHike) from data
group by YearsAtCompany, PerformanceRating, YearsSinceLastPromotion
order by max(PercentSalaryHike) desc, min(PercentSalaryHike) asc;

Select distinct department
from data;

/** Employees working overtime ut given min salary hike and
are more than 5 years with company **/

Select * from data
where OverTime = 'Yes'
and PercentSalaryHike = (Select min(PercentSalaryHike) from data)
and YearsAtCompany >5
and attrition = 'Yes';

#No.of Employees
Select count(*) from data
where OverTime = 'Yes'
and PercentSalaryHike = (Select min(PercentSalaryHike) from data)
and YearsAtCompany >5
and attrition = 'Yes';

/** Ans: 9 */

#Max

Select * from data
where OverTime = 'Yes'
and PercentSalaryHike = (Select max(PercentSalaryHike) from data)
and YearsAtCompany >5;

#No.of 
Select count(*) from data
where OverTime = 'Yes'
and PercentSalaryHike = (Select max(PercentSalaryHike) from data)
and YearsAtCompany >5;

/** Ans: 4 **/

#Less than 5 years

Select * from data
where OverTime = 'Yes'
and PercentSalaryHike = (Select max(PercentSalaryHike) from data)
and YearsAtCompany <5;


# No Overtime but got max salary Hike

Select * from data
where OverTime = 'No'
and PercentSalaryHike = (Select max(PercentSalaryHike) from data)
and YearsAtCompany <5;

/** What is maximum an minimum relationshipsatisfaction based on Marital STATUS **/

Select MaritalStatus,
max(RelationshipSatisfaction),
min(RelationshipSatisfaction) from data
group by MaritalStatus;