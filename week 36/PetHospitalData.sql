use PetHospital;

INSERT INTO dbo.Treatment 
VALUES ('Rabies Vaccination'),('Examine and Treat Wound'),('Heart worm test'),('Tetanus Vaccination'),('Annual Check up'),('Eye wash');

INSERT INTO dbo.PetType
VALUES ('Dog'),('Cat'),('Bird');

INSERT INTO dbo.Owner
VALUES 
('Will','Jensen','Vestergade 90','5000', 'Odense C'),
('Terry','Kim','Datenbank Strasse 1','5000','Odense C');

INSERT INTO dbo.Pet
VALUES
('Rover', DATEADD(yy,-12,GETDATE()), 1, 1),
('Spot', DATEADD(yy,-2,GETDATE()), 1, 2),
('Morris', DATEADD(yy,-4,GETDATE()), 2, 1),
('Tweedy', DATEADD(yy,-2,GETDATE()), 3, 2);

INSERT INTO dbo.Visit
VALUES
('2015-01-13 18:44:43.557',1,NULL),
('2015-03-27 18:44:43.557',1,NULL),
('2015-04-02 18:44:43.557',1,NULL),
('2015-01-21 18:44:43.557',2,NULL),
('2015-03-10 18:44:43.557',2,NULL),
('2014-01-23 18:44:43.557',3,NULL),
('2015-01-13 18:44:43.557',3,NULL),
('2015-04-30 18:44:43.557',4,NULL),
('2015-04-30 18:44:43.557',4,NULL)

INSERT INTO dbo.Visit_Treatment
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,3),
(6,1),
(7,1),
(8,5),
(9,6)

INSERT INTO dbo.PetType_Treatment_Price
VALUES
(1,1,300),
(2,1,240)

INSERT INTO dbo.Invoice
VALUES ('2015-01-31 08:00:00.000', 0);

-- Link above invoice to visits.
UPDATE dbo.Visit
SET InvoiceId = 1
WHERE VisitDate = '2015-01-13 18:44:43.557'