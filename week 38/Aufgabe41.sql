
CREATE FUNCTION udfFullname (
  @firstname VARCHAR(40), 
  @lastname VARCHAR(40)
)
RETURNS VARCHAR(255)
AS
BEGIN
	RETURN CONCAT(@firstname, ' ', @lastname);
END;

GO

SELECT dbo.udfFullname(Firstname, Lastname)as Fullname
FROM PetOwner
GO