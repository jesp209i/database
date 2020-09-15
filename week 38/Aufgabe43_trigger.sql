-- Change PetOwner table to reflect address info
ALTER TABLE PetOwner
ADD 
  Address VARCHAR(50) NOT NULL DEFAULT 'Unknown',
  City VARCHAR(100) NOT NULL DEFAULT 'Unknown',
  PostCode VARCHAR(10) NOT NULL DEFAULT 'Unknown',
  Changed DATETIME2 NOT NULL DEFAULT GETDATE()

-- Create table for historic addresses
CREATE TABLE Address_History(
  Id INT Identity(1,1) PRIMARY KEY,
  PetOwnerId INT NOT NULL FOREIGN KEY REFERENCES PetOwner(ID),
  Address VARCHAR(50) NOT NULL,
  City VARCHAR(100) NOT NULL,
  PostCode VARCHAR(10) NOT NULL,
  ValidFrom DATETIME2 NOT NULL,
  ValidTo DATETIME2 NOT NULL DEFAULT GETDATE()
)
GO

-- the trigger
CREATE TRIGGER tg_PetOwnerChange
ON PetOwner
AFTER UPDATE
AS
BEGIN
 DECLARE @curdate DATETIME2;
 SET @curdate = GETDATE();

  UPDATE PetOwner
  SET Changed = @curdate
  WHERE ID IN (SELECT DISTINCT ID FROM Inserted)

  INSERT INTO Address_History (PetOwnerId, Address, City, PostCode, ValidFrom)
  SELECT po.ID, po.Address, po.City, po.PostCode, po.Changed 
  FROM deleted po
  
END

UPDATE PetOwner
SET
	Address = 'Hest vej 42'
	Where ID = 2


SELECT * FROM PetOwner
SELECT * FROM Address_History