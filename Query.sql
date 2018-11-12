
/* Question 1.1 */
SELECT eName FROM EMPLOYEE , Department , worksIn
WHERE Employee.eId = worksIn.emp AND Department.dId = worksIn.dept
GROUP BY worksIn.emp
HAVING COUNT(worksIn.dept)<=2;

/*Question 1.2 */
SELECT eName, eId FROM EMPLOYEE , Department , worksIn, Payroll
WHERE Employee.eId = Payroll.emp 
GROUP BY Payroll.emp
HAVING COUNT(DISTINCT Payroll.year)>2;

/* Question 1.3 */
CREATE VIEW SALAR(eNames, sal) AS
SELECT (eName), SUM(amount) FROM Employee, Payroll
WHERE Employee.eId = Payroll.emp AND Payroll.year = 2016
GROUP BY Payroll.emp;

/* Question 1.4 */

CREATE VIEW department_total(d, s,c) AS
SELECT (dId), SUM(amount), COUNT(DISTINCT eiD) FROM Department, Employee, Payroll, worksIn 
WHERE Department.dId = worksIn.dept AND Employee.eId = worksIn.emp AND
Employee.eId = Payroll.emp AND Payroll.year = 2016
GROUP BY Department.dId;
CREATE VIEW department_avergaes(d, a,f,g) AS 
# deparment id, department total salary, #of employees, average salary
SELECT department_total.d, s,c, s/c FROM department_total;
CREATE VIEW employee_salars(dId, e, sal) AS
SELECT (dId), eId , SUM(amount) FROM Employee, Payroll, Department, worksIn
WHERE Employee.eId = worksIn.emp AND department.dId = worksIn.dept AND Employee.eId = Payroll.emp AND Payroll.year = 2016
GROUP BY dId, eId;
CREATE VIEW Final_sala(departid, totalsal, numofemp, average, departid2, empid, empsala) AS
SELECT * from department_avergaes INNER JOIN employee_salars ON d = employee_salars.dId;
# Final ANSWER 

SELECT departid, sum(empid) FROM Final_sala
WHERE empsala> average 
GROUP BY departid;





/* Question 2.1 */
WITH RECURSIVE r(flight_from, f_Destination, Leastcost) AS
(SELECT origin, destination, cost FROM flight
UNION ALL SELECT fl.origin, r.f_Destination, fl.cost+r.Leastcost as Leastcost
FROM flight fl, r
WHERE fl.destination = r.flight_from)
SELECT r.f_Destination, MIN(Leastcost) FROM  r where r.flight_from = 'BUF'
GROUP BY r.f_Destination;


/*  2.2 
When there are cycles in the data, the queries may not be properly terminated giving irelevant output.
*/
