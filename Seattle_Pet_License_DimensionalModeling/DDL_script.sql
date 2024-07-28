--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      SeattlePetLicenseModel.DM1
--
-- Date Created : Tuesday, October 24, 2023 02:47:56
-- Target DBMS : MySQL 8.x
--

-- 
-- TABLE: Dim_Breed 
--

CREATE TABLE Dim_Breed(
    BreedSK                 INT            NOT NULL,
    Species_Name            VARCHAR(4),
    Primary_Breed_Name      VARCHAR(46),
    Secondary_Breed_Name    VARCHAR(46),
    DI_JobID                VARCHAR(10),
    Date_To_Warehouse       DATETIME,
    PRIMARY KEY (BreedSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_date 
--

CREATE TABLE Dim_date(
    DateSK               INT            NOT NULL,
    Date                 DATE,
    DayNum               VARCHAR(4),
    Month_Num            VARCHAR(10),
    Qtr_Num              VARCHAR(2),
    Year_Num             INT,
    Date_Str             VARCHAR(9),
    MonthStr             VARCHAR(10),
    Qtr_Str              VARCHAR(2),
    Year_Str             VARCHAR(4),
    Is_weekend           VARCHAR(3),
    Date_To_Warehouse    DATETIME,
    DI_JobID             VARCHAR(20),
    PRIMARY KEY (DateSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Location 
--

CREATE TABLE Dim_Location(
    LocationSK           INT            NOT NULL,
    Zip_code             VARCHAR(10),
    City                 VARCHAR(50),
    State                VARCHAR(50),
    Date_to_Warehouse    DATETIME,
    DI_JobId             VARCHAR(10),
    PRIMARY KEY (LocationSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fct_License 
--

CREATE TABLE Fct_License(
    LincensesSK          INT            NOT NULL,
    LocationSK           INT,
    BreedSK              INT            NOT NULL,
    DateSK               INT,
    No_of_License        INT,
    Date_To_Warehouse    DATETIME,
    DI_JobID             VARCHAR(10),
    PRIMARY KEY (LincensesSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fct_License 
--

ALTER TABLE Fct_License ADD CONSTRAINT RefDim_Location4 
    FOREIGN KEY (LocationSK)
    REFERENCES Dim_Location(LocationSK)
;

ALTER TABLE Fct_License ADD CONSTRAINT RefDim_Breed9 
    FOREIGN KEY (BreedSK)
    REFERENCES Dim_Breed(BreedSK)
;

ALTER TABLE Fct_License ADD CONSTRAINT RefDim_date10 
    FOREIGN KEY (DateSK)
    REFERENCES Dim_date(DateSK)
;


