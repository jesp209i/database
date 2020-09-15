SELECT *
FROM Employee

-- Employees uden bonus
SELECT * 
FROM Employee
WHERE ISNULL(Bonus,0) = 0

-- Employees hvor bonus er mindre end 1000
SELECT * 
FROM Employee
WHERE ISNULL(Bonus,0) < 1000

-- Employees hvor salary + bonus er mindre end 1200
SELECT *
FROM Employee
WHERE Salary + ISNULL(Bonus,0) > 1200