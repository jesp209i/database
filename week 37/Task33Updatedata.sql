USE PetHospital;

SELECT * FROM TreatmentPrice -- normal query

UPDATE TreatmentPrice
	SET Price = 430
WHERE TreatmentID = 1 AND PetTypeID = 1

UPDATE TreatmentPrice
	SET Price = 320
WHERE TreatmentID = 1 AND PetTypeID = 2

UPDATE TreatmentPrice
	SET Price = 290
WHERE TreatmentID = 1 AND PetTypeID = 3

UPDATE TreatmentPrice
	SET Price = 43
WHERE TreatmentID = 2 AND PetTypeID = 1

UPDATE TreatmentPrice
	SET Price = 32
WHERE TreatmentID = 2 AND PetTypeID = 2

SELECT * FROM TreatmentPrice FOR SYSTEM_TIME ALL --time travelling query