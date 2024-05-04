-- Gets the number of patients each nurse is caring for
SELECT Nurse.FName AS NurseFirstName, Nurse.LName AS NurseLastName, COUNT(Cares_For.PatientID) AS PatientCount
FROM Nurse
LEFT JOIN Cares_For ON Nurse.NID = Cares_For.NurseID
GROUP BY Nurse.NID;

-- Gets most common treatment given to patients
SELECT Treatment, COUNT(*) AS Treatment_Count
FROM Treats
GROUP BY Treatment
ORDER BY Treatment_Count DESC
LIMIT 1;

-- List all patients with insurance info
SELECT p.FName, p.LName, i.PolicyNo, i.Company, i.Plan
FROM Patient p
LEFT JOIN Insurance i ON p.PID = i.PatientID;


-- Select most commonly used dugs form clerk
SELECT Drug, COUNT(*) AS PrescriptionCount
FROM ClerkView
WHERE Drug IS NOT NULL
GROUP BY Drug
ORDER BY PrescriptionCount DESC;

-- Clerk viewing most common insurance providers
SELECT InsuranceCompany, COUNT(*) AS InsuranceCount
FROM ClerkView
WHERE InsuranceCompany IS NOT NULL
GROUP BY InsuranceCompany
ORDER BY InsuranceCount DESC
LIMIT 3;

-- Patient viewing appointment date
SELECT * FROM PatientView;

-- get all active patients from NurseView
SELECT DISTINCT PatientID, FName, LName
FROM NurseView;

-- Gets average dosage of each drug
SELECT Drug, AVG(Dosage) AS AvgDosage
FROM Treats
WHERE Drug IS NOT NULL
GROUP BY Drug;

-- Get average age of patients
SELECT AVG(YEAR(CURRENT_DATE()) - YEAR(DOB)) AS AverageAge
FROM Patient;

-- All doctors who have prescribed aspirin
SELECT DISTINCT Doctor.DocID, Doctor.FName, Doctor.LName
FROM Doctor
INNER JOIN Treats ON Doctor.DocID = Treats.DoctorID
WHERE Treats.Drug = 'Aspirin';
