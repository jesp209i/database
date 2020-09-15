CREATE DATABASE demo04;
GO

USE demo04;

CREATE TABLE Employee (
	ID INT IDENTITY PRIMARY KEY,
	Firstname VARCHAR(50) NOT NULL,
	Lastname VARCHAR(50) NOT NULL,
	Salary DECIMAL(9,2) NOT NULL,
	Bonus DECIMAL(9,2)
)

GO

INSERT INTO Employee (Firstname, Lastname, Salary, Bonus)
VALUES 
	('John', 'Smith', 1000, 500),
	('Mary', 'Smith', 1000, 1500),
	('Peter', 'White', 1800, NULL),
	('Nick', 'Perry', 1000, NULL);

GO
