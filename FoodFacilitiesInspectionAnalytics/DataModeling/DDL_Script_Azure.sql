-- Dim_Business Table
CREATE TABLE Dim_Business (
    BusinessSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    BusinessId varchar(9) NOT NULL,
    Name varchar(70) NULL,
    Address varchar(32) NULL,
    City varchar(17) NULL,
    State varchar(2) NULL,
    Zip varchar(10) NULL,
    Longitude float NULL,
    Latitude float NULL,
    PhoneNumber varchar(12) NULL,
    DI_CreatedDate datetime NULL,
    DI_WorkflowFileName varchar(255) NULL,
    DI_Workflow_ProcessID varchar(10) NULL
);

-- Dim_Date Table
CREATE TABLE Dim_Date (
    DateSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Date date NULL,
    Year varchar(4) NULL,
    Month varchar(9) NULL,
    Quarter varchar(2) NULL,
    Day varchar(9) NULL,
    DI_CreatedDate datetime NULL,
    DI_WorkflowFileName varchar(255) NULL,
    DI_Workflow_ProcessID varchar(10) NULL
);

-- Dim_ViolationCodes Table
CREATE TABLE Dim_ViolationCodes (
    ViolationCodeSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ViolationCode varchar(4) NULL,
    ViolationDesc varchar(255) NULL,
    DI_CreatedDate datetime NULL,
    DI_WorkflowFileName varchar(255) NULL,
    DI_Workflow_ProcessID varchar(20) NULL
);

-- Fct_Inspection Table
CREATE TABLE Fct_Inspection (
    InspectionSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    BusinessSK int NOT NULL,
    DateSK int NULL,
    InspectionID varchar(9) NULL,
    InspectionType varchar(9) NULL,
    ViolationScore int NULL,
    InspectionResult varchar(4) NULL,
    DI_CreatedDate datetime NULL,
    DI_WorkflowFileName varchar(255) NULL,
    DI_Workflow_ProcessID varchar(20) NULL
);

-- Fct_Violation Table
CREATE TABLE Fct_Violation (
    ViolationSK int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    InspectionSK int NULL,
    ViolationCodeSK int NULL,
    ViolationCategory varchar(5) NULL,
    CategoryScore int NULL,
    DI_CreatedDate datetime NULL,
    DI_WorkflowFileName varchar(255) NULL,
    DI_Workflow_ProcessID varchar(20) NULL
);

-- Add Foreign Key Constraints
ALTER TABLE Fct_Inspection
ADD CONSTRAINT FK_BusinessSK FOREIGN KEY (BusinessSK) REFERENCES Dim_Business (BusinessSK);

ALTER TABLE Fct_Inspection
ADD CONSTRAINT FK_DateSK FOREIGN KEY (DateSK) REFERENCES Dim_Date (DateSK);

ALTER TABLE Fct_Violation
ADD CONSTRAINT FK_ViolationCodeSK FOREIGN KEY (ViolationCodeSK) REFERENCES Dim_ViolationCodes (ViolationCodeSK);

ALTER TABLE Fct_Violation
ADD CONSTRAINT FK_InspectionSK FOREIGN KEY (InspectionSK) REFERENCES Fct_Inspection (InspectionSK);
