DROP DATABASE IF EXISTS MediConnect;
CREATE DATABASE MediConnect;
USE MediConnect;

CREATE TABLE Doctor (
    DocID INT PRIMARY KEY NOT NULL,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(100)
);

CREATE TABLE Patient (
    PID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    DOB DATE,
    Sex VARCHAR(6),
    CheckedIn INT Default 0,
    Insurance VARCHAR(100)
);

CREATE TABLE Nurse (
    NID INT PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL
);

CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE,
    Time TIME,
    Diagnosis VARCHAR(255),
    DoctorID INT,
    PatientID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DocID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PID)
);

CREATE TABLE Clerk (
    CID INT PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50)
);

CREATE TABLE Insurance (
    PolicyNo INT,
    Company VARCHAR(255),
    Plan VARCHAR(255),
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PID)
);

CREATE TABLE Treats (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    DoctorID INT,
    PatientID INT,
    Date DATE,
    Time TIME,
    Treatment VARCHAR(255),
    Drug VARCHAR(100),
    Dosage FLOAT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DocID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PID)
);

CREATE TABLE Cares_For (
    NurseID INT,
    PatientID INT,
    PRIMARY KEY (NurseID, PatientID),
    FOREIGN KEY (NurseID) REFERENCES Nurse(Nid),
    FOREIGN KEY (PatientID) REFERENCES Patient(PID)
);

CREATE TABLE Appointment (
    RelationshipID INT PRIMARY KEY AUTO_INCREMENT,
    DoctorID INT,
    ClerkID INT,
    PatientID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DocID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PID)
);

INSERT INTO Doctor (DocID, FName, LName, Specialty)
VALUES
    (1, 'Matthew', 'Rodriguez', 'Physician'),
    (2, 'Olivia', 'Perez', 'Dermatologist'),
    (3, 'Ethan', 'Torres', 'Anesthesiologist'),
    (4, 'Isabella', 'Flores', 'OBGYN'),
    (5, 'Andrew', 'Rivera', 'Physician'),
    (6, 'Sophia', 'Gomez', 'Cardiologist'),
    (7, 'James', 'Diaz', 'Pediatrician'),
    (8, 'Charlotte', 'Sanchez', 'Surgeon');
    
INSERT INTO Patient (PID, FName, LName, DOB, Sex, Insurance)
VALUES
	(1, 'Emma', 'Johnson', '1982-03-17', 'Female', 'Cigna'),
    (2, 'Daniel', 'Smith', '1979-09-05', 'Male', NULL),
    (3, 'Olivia', 'Taylor', '1994-06-28', 'Female', 'UnitedHealth Group'),
    (4, 'William', 'Lee', '1988-11-12', 'Male', 'Blue Cross Blue Shield'),
    (5, 'Sophia', 'Wong', '1985-02-09', 'Female', NULL),
    (6, 'James', 'Brown', '1991-08-03', 'Male', 'Aetna'),
    (7, 'Ella', 'Miller', '1976-04-23', 'Female', NULL),
    (8, 'Logan', 'Anderson', '1997-01-30', 'Male', 'UnitedHealth Group'),
    (9, 'Avery', 'Campbell', '1983-07-15', 'Female', 'Anthem'),
    (10, 'Evelyn', 'Martinez', '1989-05-19', 'Female', NULL),
    (11, 'Mason', 'Nguyen', '1980-12-02', 'Male', 'Humana'),
    (12, 'Harper', 'Johnson', '1995-10-08', 'Female', NULL),
    (13, 'Liam', 'Patel', '1986-09-14', 'Male', 'Aetna'),
    (14, 'Aria', 'Garcia', '1993-03-21', 'Female', NULL),
    (15, 'Jackson', 'Chen', '1978-11-25', 'Male', 'Blue Cross Blue Shield'),
    (16, 'Scarlett', 'Liu', '1984-08-18', 'Female', 'Anthem'),
    (17, 'Levi', 'Brown', '1990-06-10', 'Male', 'Humana'),
    (18, 'Addison', 'Kim', '1982-04-07', 'Female', NULL),
    (19, 'Madison', 'Khan', '1977-09-12', 'Female', 'UnitedHealth Group'),
    (20, 'Chloe', 'Gomez', '1996-12-05', 'Female', 'Blue Cross Blue Shield'),
    (21, 'Henry', 'Gonzalez', '1981-03-28', 'Male', 'Anthem'),
    (22, 'Grace', 'Wang', '1987-07-04', 'Female', NULL),
    (23, 'Wyatt', 'Singh', '1988-02-19', 'Male', 'Cigna'),
    (24, 'Amelia', 'Patel', '1995-11-22', 'Female', NULL),
    (25, 'Oliver', 'Li', '1983-05-16', 'Male', 'Blue Cross Blue Shield'),
    (26, 'Aubrey', 'Ng', '1989-09-03', 'Female', 'Anthem'),
    (27, 'Emma', 'Johnson', '1982-03-17', 'Female', 'Cigna'),
    (28, 'Daniel', 'Smith', '1979-09-05', 'Male', NULL),
    (29, 'Olivia', 'Taylor', '1994-06-28', 'Female', 'UnitedHealth Group'),
    (30, 'William', 'Lee', '1988-11-12', 'Male', 'Blue Cross Blue Shield'),
    (31, 'Sophia', 'Wong', '1985-02-09', 'Female', NULL);
    
INSERT INTO Nurse (Nid, FName, LName)
VALUES
    (1, 'Emily', 'Smith'),
    (2, 'Michael', 'Johnson'),
    (3, 'Emma', 'Williams'),
    (4, 'Christopher', 'Brown'),
    (5, 'Madison', 'Jones'),
    (6, 'Jacob', 'Miller'),
    (7, 'Olivia', 'Davis'),
    (8, 'William', 'Garcia'),
    (9, 'Ava', 'Rodriguez'),
    (10, 'Matthew', 'Wilson');
    
INSERT INTO MedicalRecords (Date, Time, Diagnosis, DoctorID, PatientID)
VALUES
    ('2024-04-17', '08:30:00', 'Arrythmia', 1, 9),
    ('2024-04-17', '09:45:00', 'Wart', 2, 26),
    ('2024-04-17', '10:30:00', 'Fractured Bone', 3, 11),
    ('2024-04-17', '11:15:00', 'Pneumonia', 4, 28),
    ('2024-04-17', '13:00:00', 'Ear Infection', 5, 13),
    ('2024-04-17', '14:30:00', 'Depression', 6, 22),
    ('2024-04-17', '15:45:00', 'Parkinsons', 7, 31),
    ('2024-04-17', '16:30:00', 'Gastritis', 8, 16),
    ('2024-04-18', '08:30:00', 'Hypertension', 1, 1),
    ('2024-04-18', '09:45:00', 'Acne', 2, 10),
    ('2024-04-18', '10:30:00', 'Torn Ligament', 3, 19),
    ('2024-04-18', '11:15:00', 'Pneumonia', 4, 20),
    ('2024-04-18', '13:00:00', 'Ear Infection', 5, 29),
    ('2024-04-18', '14:30:00', 'Depression', 6, 14),
    ('2024-04-18', '15:45:00', 'Migraine', 7, 15),
    ('2024-04-18', '16:30:00', 'Gastritis', 8, 24),
    ('2024-04-19', '08:30:00', 'Hypertension', 1, 25),
    ('2024-04-19', '09:45:00', 'Staph Infection', 2, 18),
    ('2024-04-19', '10:30:00', 'Broken Bone', 3, 27),
    ('2024-04-19', '11:15:00', 'Pneumonia', 4, 12),
    ('2024-04-19', '13:00:00', 'Ear Infection', 5, 21),
    ('2024-04-19', '14:30:00', 'Depression', 6, 30),
    ('2024-04-19', '15:45:00', 'Migraine', 7, 23),
    ('2024-04-19', '16:30:00', 'Gastritis', 8, 8);
    
    INSERT INTO Clerk (Cid, FName, LName)
VALUES
    (1, 'Alice', 'Smith'),
    (2, 'Bob', 'Johnson'),
    (3, 'Carol', 'Williams');
    
INSERT INTO Insurance (PolicyNo, PatientID, Company, Plan)
VALUES
    (12345, 1, 'Cigna', NULL),
    (NULL, 2, NULL, NULL),
    (67890, 3, 'UnitedHealth Group', NULL),
    (98765, 4, 'Blue Cross Blue Shield', NULL),
    (NULL, 5, NULL, NULL),
    (22222, 6, 'Aetna', NULL),
    (NULL, 7, NULL, NULL),
    (44444, 8, 'UnitedHealth Group', NULL),
    (55555, 9, 'Anthem', NULL),
    (NULL, 10, NULL, NULL),
    (77777, 11, 'Humana', NULL),
    (NULL, 12, NULL, NULL),
    (99999, 13, 'Aetna', NULL),
    (NULL, 14, NULL, NULL),
    (22223, 15, 'Blue Cross Blue Shield', NULL),
    (33334, 16, 'Anthem', NULL),
    (44445, 17, 'Humana', NULL),
    (NULL, 18, NULL, NULL),
    (66667, 19, 'UnitedHealth Group', NULL),
    (77778, 20, 'Blue Cross Blue Shield', NULL),
    (88889, 21, 'Anthem', NULL),
    (NULL, 22, NULL, NULL),
    (10101, 23, 'Cigna', NULL),
    (NULL, 24, NULL, NULL),
    (30303, 25, 'Blue Cross Blue Shield', NULL),
    (40404, 26, 'Anthem', NULL),
    (50505, 27, 'Cigna', NULL),
    (NULL, 28, NULL, NULL),
    (70707, 29, 'UnitedHealth Group', NULL),
    (80808, 30, 'Blue Cross Blue Shield', NULL),
    (NULL, 31, NULL, NULL);

    
INSERT INTO Treats (DoctorID, PatientID, Treatment, Drug, Dosage, Date, Time)
VALUES
    (1, 1, 'General checkup', 'Aspirin', 100.0, '2024-04-01', '08:00:00'),
    (2, 7, 'ECG', NULL, NULL, '2024-04-02', '09:15:00'),
    (3, 2, 'Skin examination', 'Tylenol', 250.0, '2024-04-03', '10:30:00'),
    (4, 19, 'X-ray examination', NULL, NULL, '2024-04-04', '11:45:00'),
    (5, 4, 'Vaccination', 'Ibuprofen', 200.0, '2024-04-05', '13:00:00'),
    (6, 9, 'Counseling session', NULL, NULL, '2024-04-06', '14:15:00'),
    (7, 6, 'Surgery', 'Acetaminophen', 300.0, '2024-04-07', '15:30:00'),
    (8, 25, 'General checkup', NULL, NULL, '2024-04-08', '16:45:00'),
    (1, 5, 'ECG', 'Codeine', 200.0, '2024-04-09', '08:00:00'),
    (2, 16, 'Skin examination', NULL, NULL, '2024-04-10', '09:15:00'),
    (3, 20, 'X-ray examination', 'Hydrocodone', 150.0, '2024-04-11', '10:30:00'),
    (4, 3, 'Vaccination', NULL, NULL, '2024-04-12', '11:45:00'),
    (5, 15, 'Counseling session', 'Naproxen', 100.0, '2024-04-13', '13:00:00'),
    (6, 11, 'Surgery', NULL, NULL, '2024-04-14', '14:15:00'),
    (7, 10, 'General checkup', 'Oxycodone', 250.0, '2024-04-15', '15:30:00'),
    (8, 8, 'ECG', NULL, NULL, '2024-04-16', '16:45:00'),
    (1, 12, 'Skin examination', 'Aspirin', 100.0, '2024-04-17', '08:00:00'),
    (2, 13, 'X-ray examination', NULL, NULL, '2024-04-18', '09:15:00'),
    (3, 31, 'Vaccination', 'Ibuprofen', 200.0, '2024-04-19', '10:30:00'),
    (4, 18, 'Counseling session', NULL, NULL, '2024-04-20', '11:45:00'),
    (5, 14, 'Surgery', 'Acetaminophen', 300.0, '2024-04-21', '13:00:00'),
    (6, 27, 'General checkup', NULL, NULL, '2024-04-22', '14:15:00'),
    (7, 21, 'ECG', 'Codeine', 200.0, '2024-04-23', '15:30:00'),
    (8, 17, 'Skin examination', NULL, NULL, '2024-04-24', '16:45:00'),
    (1, 23, 'X-ray examination', 'Hydrocodone', 150.0, '2024-04-25', '08:00:00'),
    (2, 28, 'Vaccination', NULL, NULL, '2024-04-26', '09:15:00'),
    (3, 30, 'Counseling session', 'Naproxen', 100.0, '2024-04-27', '10:30:00'),
    (4, 26, 'Surgery', NULL, NULL, '2024-04-28', '11:45:00'),
    (5, 22, 'General checkup', 'Oxycodone', 250.0, '2024-04-29', '13:00:00'),
    (6, 29, 'ECG', NULL, NULL, '2024-04-30', '14:15:00'),
    (7, 24, 'Skin examination', 'Aspirin', 100.0, '2024-05-01', '16:45:00');
    
INSERT INTO Cares_For (NurseID, PatientID)
VALUES
    (1, 5),
    (2, 7),
    (3, 9),
    (4, 11),
    (5, 13),
    (6, 15),
    (7, 17),
    (8, 19),
    (9, 21),
    (10, 23),
    (1, 6),
    (2, 8),
    (3, 10),
    (4, 12),
    (5, 14),
    (6, 16),
    (7, 18),
    (8, 20),
    (9, 22),
    (10, 24),
    (1, 7),
    (2, 9),
    (3, 11);
    
INSERT INTO Appointment (DoctorID, PatientID, Date, Time)
VALUES
    (3, 8, '2024-04-16', '08:00:00'),
    (7, 1, '2024-04-16', '09:00:00'),
    (1, 12, '2024-04-16', '10:00:00'),
    (4, 10, '2024-04-16', '11:00:00'),
    (2, 7, '2024-04-16', '12:00:00'),
    (5, 9, '2024-04-16', '13:00:00'),
    (8, 5, '2024-04-16', '14:00:00'),
    (6, 3, '2024-04-16', '15:00:00'),
    (5, 6, '2024-04-17', '08:00:00'),
    (1, 11, '2024-04-17', '09:00:00'),
    (3, 13, '2024-04-17', '10:00:00'),
    (2, 2, '2024-04-17', '11:00:00'),
    (7, 4, '2024-04-17', '12:00:00'),
    (4, 14, '2024-04-17', '13:00:00');
    
CREATE VIEW DoctorView AS
SELECT 
    MedicalRecords.RecordID AS MedicalRecordID,
    MedicalRecords.Date AS MedicalRecordDate,
    MedicalRecords.Time AS MedicalRecordTime,
    MedicalRecords.Diagnosis AS MedicalRecordDiagnosis,
    Patient.PID AS PatientID,
    Patient.FName AS PatientFirstName,
    Patient.LName AS PatientLastName,
    Patient.DOB AS PatientDOB,
    Patient.Sex AS PatientSex,
    Patient.Insurance AS PatientInsurance,
    Appointment.Date AS AppointmentDate,
    Appointment.Time AS AppointmentTime,
    Nurse.FName AS NurseFirstName,
    Nurse.LName AS NurseLastName
FROM 
    MedicalRecords
    INNER JOIN Patient ON MedicalRecords.PatientID = Patient.PID
    LEFT JOIN Nurse ON MedicalRecords.PatientID = Nurse.NID
    LEFT JOIN Appointment ON MedicalRecords.PatientID = Appointment.PatientID;
    
CREATE VIEW NurseView AS
SELECT *
FROM MedicalRecords
INNER JOIN Patient ON MedicalRecords.PatientID = Patient.PID;

CREATE VIEW ClerkView AS
SELECT 
    Patient.*,
    Insurance.PolicyNo,
    Insurance.Company AS InsuranceCompany,
    Insurance.Plan AS InsurancePlan,
    Treats.*
FROM 
    Patient
    LEFT JOIN Insurance ON Patient.PID = Insurance.PatientID
    LEFT JOIN Treats ON Patient.PID = Treats.PatientID;
    
CREATE VIEW PatientView AS
SELECT 
    Appointment.Date AS AppointmentDate,
    Appointment.Time AS AppointmentTime,
    CONCAT(Doctor.FName, ' ', Doctor.LName) AS DoctorName
FROM 
    Appointment
    INNER JOIN Doctor ON Appointment.DoctorID = Doctor.DocID;
