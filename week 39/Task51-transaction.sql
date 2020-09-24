USE PetHospital;
DROP PROC spInsertPetVisit;
GO

CREATE PROC spInsertPetVisit (
  @petId INT,
  @treatmentId INT,
  @date SMALLDATETIME = NULL
)
AS
BEGIN TRY
  BEGIN TRANSACTION 
    DECLARE @visitID INT;
	IF (SELECT Count(*) as rows FROM Pet WHERE ID = @petId) <> 1
	BEGIN
		THROW 52010, 'Pet does not exist',1;
	END
	IF (SELECT Count(*) as rows FROM Treatment WHERE ID = @treatmentId) <> 1
	BEGIN
		THROW 52020, 'Treatment does not exist',1;
	END
	IF @date IS NULL
	BEGIN
	  SET @date = GETDATE();
	END

    INSERT INTO Visit (PetID, VisitDateTime)
    VALUES (@petId, @date);
	SET @visitID = SCOPE_IDENTITY();

	INSERT INTO VisitHasTreatment (VisitID , TreatmentID)
	VALUES (@visitId, @treatmentId);
  COMMIT TRANSACTION
END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0
  BEGIN
    ROLLBACK TRANSACTION;
  END
  PRINT ERROR_MESSAGE();
END CATCH
GO

EXEC spInsertPetVisit 1,1;				-- Works!
EXEC spInsertPetVisit 2,3,'2001-02-02'	-- Works! 
EXEC spInsertPetVisit 2,3,'2021-02-32'	-- Error! Date is invalid
EXEC spInsertPetVisit 5,7;				-- Error! treatment doesnt exist;
EXEC spInsertPetVisit 10,2;				-- Error! Pet doesnt exist;


-- Other Uses in PetHospital
-- When creating a new treatment, you would have to create a price for one of the treatment on one of the animals :D