CREATE TABLE IF NOT EXISTS Users (
    Id SERIAL PRIMARY KEY,
    Email VARCHAR(255) UNIQUE NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    SurName VARCHAR(100) NOT NULL,
    Avatar VARCHAR(100) NOT NULL,
    Active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Profiles
(
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS UsersProfiles
(
    Id SERIAL PRIMARY KEY,
    IdUsers INT NOT NULL,
    IdProfiles INT NOT NULL,
    Active INT NOT NULL,
    FOREIGN KEY (IdUsers) REFERENCES Users (Id),
    FOREIGN KEY (IdProfiles) REFERENCES Profiles (Id)
);

CREATE TABLE IF NOT EXISTS Permissions
(
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ProfilesPermissions
(
    Id SERIAL PRIMARY KEY,
    IdProfiles INT NOT NULL,
    IdPermissions INT NOT NULL,
    Active INT NOT NULL,
    FOREIGN KEY (IdProfiles) REFERENCES Profiles (Id),
    FOREIGN KEY (IdPermissions) REFERENCES Permissions (Id)
);

CREATE TABLE IF NOT EXISTS FormsOrigins
(
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Forms
(
    Id SERIAL PRIMARY KEY,
    IdFormsOrigins INT NOT NULL,
    Code VARCHAR(50) UNIQUE NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    DtCreation TIMESTAMP NOT NULL DEFAULT NOW(),
    Active INT NOT NULL,
    FOREIGN KEY (IdFormsOrigins) REFERENCES FormsOrigins (Id)
);

CREATE TABLE IF NOT EXISTS FieldsDataTypes
(
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    Active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Fields
(
    Id SERIAL PRIMARY KEY,
    IdFieldsDataTypes INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    FillingClue VARCHAR(100) NOT NULL,
    Active INT NOT NULL,
    FOREIGN KEY (IdFieldsDataTypes) REFERENCES FieldsDataTypes (Id)
);

CREATE TABLE IF NOT EXISTS FormsFields
(
    Id SERIAL PRIMARY KEY,
    IdForms INT NOT NULL,
    IdFields INT NOT NULL,
    Active INT NOT NULL,
    FOREIGN KEY (IdForms) REFERENCES Forms (Id),
    FOREIGN KEY (IdFields) REFERENCES Fields (Id)
);

CREATE TABLE IF NOT EXISTS Alternatives
(
    Id SERIAL PRIMARY KEY,
    Response VARCHAR(100) NOT NULL,
    ShortResponse VARCHAR(100) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    Active INT NOT NULL
);

CREATE TABLE IF NOT EXISTS FieldsAlternatives
(
    Id SERIAL PRIMARY KEY,
    IdFields INT NOT NULL,
    IdAlternatives INT NOT NULL,
    Active INT NOT NULL,
    FOREIGN KEY (IdFields) REFERENCES Fields (Id),
    FOREIGN KEY (IdAlternatives) REFERENCES Alternatives (Id)
);

CREATE TABLE IF NOT EXISTS FieldsAnswers
(
    Id SERIAL PRIMARY KEY,
    IdFields INT NOT NULL,
    IdUsersInformer INT NOT NULL,
    Value VARCHAR(100) NOT NULL,
    DtFilling TIMESTAMP NOT NULL,
    Latitude NUMERIC NULL,
    Longitude NUMERIC NULL,
    Active INT NOT NULL,
    FOREIGN KEY (IdFields) REFERENCES Fields (Id),
    FOREIGN KEY (IdUsersInformer) REFERENCES Users (Id)
);

CREATE TABLE IF NOT EXISTS UsersEndorsementFieldsAnswers
(
    Id SERIAL PRIMARY KEY,
    IdUsersEndorsement INT NOT NULL,
    IdFieldsAnswers INT NOT NULL,
    Latitude NUMERIC NULL,
    Longitude NUMERIC NULL,
    IsTrustable INT NOT NULL,
    Active INT NOT NULL,
    FOREIGN KEY (IdUsersEndorsement) REFERENCES Users (Id),
    FOREIGN KEY (IdFieldsAnswers) REFERENCES FieldsAnswers (Id)
);

CREATE TABLE IF NOT EXISTS PreliminaryData
(
    Id SERIAL PRIMARY KEY,
    IdFieldsAnswers INT NOT NULL,
    DtInsert TIMESTAMP NOT NULL,
    Active INT NOT NULL,
    FOREIGN KEY (IdFieldsAnswers) REFERENCES FieldsAnswers (Id)
);

CREATE TABLE IF NOT EXISTS TrustedData
(
    Id SERIAL PRIMARY KEY,
    IdFieldsAnswers INT NOT NULL,
    DtInsert TIMESTAMP NOT NULL,
    Active INT NOT NULL,
    FOREIGN KEY (IdFieldsAnswers) REFERENCES FieldsAnswers (Id)
);
