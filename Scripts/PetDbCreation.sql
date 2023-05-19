CREATE TABLE PetOwners (
    OwnerId INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    OwnerName TEXT,
    OwnerPhone NUMERIC,
    HasExotic BOOLEAN
);

CREATE TABLE Cats (
    CatId INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    CatName TEXT,
    Color TEXT,
    OwnerId INT,
    FOREIGN KEY (OwnerId) REFERENCES PetOwners (OwnerId)
);

CREATE TABLE Dogs (
    DogId INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    DogName TEXT,
    Color TEXT,
    OwnerId INT,
    FOREIGN KEY (OwnerId) REFERENCES PetOwners (OwnerId)
);

CREATE TABLE VetClinics (
    VetClinicId INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    ClinicName TEXT
);

CREATE TABLE VetClinicCustomers (
    VetClinicCustomerId INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    VetClinicId INT,
    CustomerId INT,
    FOREIGN KEY (VetClinicId) REFERENCES VetClinics (VetClinicId),
    FOREIGN KEY (CustomerId) REFERENCES PetOwners (OwnerId)
);

INSERT INTO PetOwners (OwnerName, OwnerPhone, HasExotic) VALUES ('Don Smith', 6155555555, FALSE);
INSERT INTO PetOwners (OwnerName, OwnerPhone, HasExotic) VALUES ('Heather Russel', 6155555555, TRUE);
INSERT INTO PetOwners (OwnerName, OwnerPhone, HasExotic) VALUES ('Ted Thompson', 6155555555, TRUE);
INSERT INTO PetOwners (OwnerName, OwnerPhone, HasExotic) VALUES ('Samantha Cox', 6155555555, FALSE);

-- SELECT * FROM PetOwners;

INSERT INTO Cats (CatName, Color, OWNERID) VALUES ('Fluffy', 'Gray', 1);
INSERT INTO Cats (CatName, Color, OWNERID) VALUES ('Snowball', 'White', 1);
INSERT INTO Cats (CatName, Color, OWNERID) VALUES ('Peanut', 'Orange', 3);
INSERT INTO Cats (CatName, Color, OWNERID) VALUES ('Felix', 'Tri-color', 4);

-- SELECT * FROM Cats;

INSERT INTO Dogs (DogName, Color, OWNERID) VALUES ('Lady', 'White', 2);
INSERT INTO Dogs (DogName, Color, OWNERID) VALUES ('Lucky', 'Brown', 1);
INSERT INTO Dogs (DogName, Color, OWNERID) VALUES ('Milo', 'Tan', 3);
INSERT INTO Dogs (DogName, Color, OWNERID) VALUES ('Charlie', 'Black', 4);

-- SELECT * FROM Dogs;

INSERT INTO VetClinics (ClinicName) VALUES ('Vet on the Go');
INSERT INTO VetClinics (ClinicName) VALUES ('All Types Veterinary Services');

-- SELECT * FROM VetClinics;

INSERT INTO VetClinicCustomers (VetClinicId, CustomerId) VALUES (1, 1);
INSERT INTO VetClinicCustomers (VetClinicId, CustomerId) VALUES (2, 1);
INSERT INTO VetClinicCustomers (VetClinicId, CustomerId) VALUES (1, 3);

-- SELECT * FROM VetClinicCustomers;