

CREATE TABLE Employee(
eId varchar(10) primary key,
eName varchar(20) not null
);


INSERT INTO Employee(eId,eName) VALUES('0','Matt');
INSERT INTO Employee(eId,eName) VALUES('1','Tom');
INSERT INTO Employee(eId,eName) VALUES('2','Drew');
INSERT INTO Employee(eId,eName) VALUES('3','Russell');
INSERT INTO Employee(eId,eName) VALUES('4','Julian');
INSERT INTO Employee(eId,eName) VALUES('5','Joe');
INSERT INTO Employee(eId,eName) VALUES('6','Kamara');
INSERT INTO Employee(eId,eName) VALUES('7','Aaron');



CREATE TABLE Department(
dId varchar(5) primary key,
dName varchar(20) not null unique
);
INSERT INTO Department(dId,dName) VALUES(0,'IT');
INSERT INTO Department(dId,dName) VALUES(1,'BIO');
INSERT INTO Department(dId,dName) VALUES(2,'H');
INSERT INTO Department(dId,dName) VALUES(3,'PSY');
INSERT INTO Department(dId,dName) VALUES(4,'CSE');
INSERT INTO Department(dId,dName) VALUES(5,'BIS');
INSERT INTO Department(dId,dName) VALUES(6,'LNG');
INSERT INTO Department(dId,dName) VALUES(7,'PO');



CREATE TABLE worksIn(
emp varchar(10) references Employee(eId),
dept varchar(5) references Department(dId),
primary key (emp, dept)
);
INSERT INTO worksIn(emp,dept) VALUES(0,0);
INSERT INTO worksIn(emp,dept) VALUES(0,1);
INSERT INTO worksIn(emp,dept) VALUES(1,2);
INSERT INTO worksIn(emp,dept) VALUES(2,2);
INSERT INTO worksIn(emp,dept) VALUES(3,4);
INSERT INTO worksIn(emp,dept) VALUES(4,5);
INSERT INTO worksIn(emp,dept) VALUES(4,6);
INSERT INTO worksIn(emp,dept) VALUES(4,7);
INSERT INTO worksIn(emp,dept) VALUES(4,8);
INSERT INTO worksIn(emp,dept) VALUES (5,3);
INSERT INTO worksIn(emp,dept) VALUES (6,3);
INSERT INTO worksIn(emp,dept) VALUES (7,3);
INSERT INTO worksIn(emp,dept) VALUES (1,3);
INSERT INTO worksIn(emp,dept) VALUES (2,3);




CREATE TABLE Payroll(
checkNumber varchar(30) primary key,
emp varchar(10) references Employee(eId) ,
year char(4) not null,
amount numeric not null
);

INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (11,0,2016,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (28,0,2016,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (23,0,2016,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (14,1,2016,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (15,2,2015,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (16,3,2016,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (17,4,2016,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (18,5,2016,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (19,6,2016,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (20,7,2016,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (21,0,2013,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (27,1,2016,800);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (26,2,2013,200);
INSERT INTO Payroll(checkNumber,emp,year,amount) VALUES (24,3,2018,200);


CREATE VIEW EM(n, a) AS
SELECT (eName), SUM(amount) FROM Employee, Payroll
WHERE Employee.eId = Payroll.emp AND Payroll.year = 2016
GROUP BY Payroll.emp;





CREATE TABLE flight(
    Origin Varchar(5),
    Destination Varchar(5),
    Cost Int,
    PRIMARY KEY (Origin, Destination) 
);

INSERT INTO flight(
	origin, destination, cost)
	VALUES ('ATL', 'ORD', 1000);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('BUF', 'ORD', 1500);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('BUF', 'JFK', 300);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('JFK', 'ORD', 200);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('JFK', 'LAX', 600);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('BUF', 'LAX', 2000);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('LAX', 'LAS', 500);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('JFK', 'CLT', 150);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('JFK', 'MIA', 300);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('BUF', 'BOS', 150);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('DTW', 'BUF', 200);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('LAX', 'SEA', 100);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('DTW', 'IAH', 800);
    INSERT INTO flight(
	origin, destination, cost)
	VALUES ('IAH', 'EWR', 870);
 