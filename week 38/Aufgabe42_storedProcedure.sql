ALTER PROC spGetVisitsByPetType (
  @petType VARCHAR(255)
)
AS
BEGIN
BEGIN TRY
SELECT VisitDateTime, PetName, LOWER(PetType) Type, DateBirth, Firstname, Lastname, Phone, Email
FROM Visit
LEFT JOIN Pet
  ON Pet.ID = Visit.PetID
  LEFT JOIN PetOwner
    ON PetOwner.ID = Pet.PetOwnerID
	LEFT JOIN PetType
	  ON Pet.PetTypeID = PetType.ID
WHERE PetType = LOWER(@petType)
IF @@ROWCOUNT < 1
  PRINT N'No Animals of type: ' + @petType
END TRY
BEGIN CATCH
  PRINT ERROR_MESSAGE();
END CATCH
END