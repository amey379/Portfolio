CREATE TABLE `Dim_Business`  (
  `BusinessSK` int NOT NULL AUTO_INCREMENT,
  `BusinessId` varchar(9) NOT NULL,
  `Name` varchar(70) NULL,
  `Address` varchar(32) NULL,
  `City` varchar(17) NULL,
  `State` varchar(2) NULL,
  `Zip` varchar(10) NULL,
  `Longitude` double NULL,
  `Latitude` double NULL,
  `PhoneNumber` varchar(12) NULL,
  `DI_CreatedDate` datetime NULL,
  `DI_WorkflowFileName` varchar(255) NULL,
  `DI_Workflow_ProcessID` varchar(10) NULL,
  PRIMARY KEY (`BusinessSK`)
);

CREATE TABLE `Dim_Date`  (
  `DateSK` varchar(8) NOT NULL,
  `Date` date NULL,
  `Year` varchar(4) NULL,
  `Month` varchar(9) NULL,
  `Quarter` varchar(2) NULL,
  `Day` varchar(9) NULL,
  `DI_CreatedDate` datetime NULL,
  `DI_WorkflowFileName` varchar(255) NULL,
  `DI_Workflow_ProcessID` varchar(20) NULL,
  PRIMARY KEY (`DateSK`)
);

CREATE TABLE `Dim_ViolationCodes`  (
  `ViolationCodeSK` int NOT NULL AUTO_INCREMENT,
  `ViolationCode` varchar(4) NULL,
  `ViolationDesc` varchar(255) NULL,
  `DI_CreatedDate` datetime NULL,
  `DI_WorkflowFileName` varchar(255) NULL,
  `DI_Workflow_ProcessID` varchar(20) NULL,
  PRIMARY KEY (`ViolationCodeSK`)
);

CREATE TABLE `Fct_Inspection`  (
  `InspectionSK` int NOT NULL AUTO_INCREMENT,
  `BusinessSK` int NOT NULL,
  `DateSK` varchar(8) NULL,
  `InspectionID` varchar(9) NULL,
  `InspectionType` varchar(9) NULL,
  `ViolationScore` int NULL,
  `InspectionResult` varchar(4) NULL,
  `DI_CreatedDate` datetime NULL,
  `DI_WorkflowFileName` varchar(255) NULL,
  `DI_Workflow_ProcessID` varchar(20) NULL,
  PRIMARY KEY (`InspectionSK`)
);

CREATE TABLE `Fct_Violation`  (
  `ViolationSK` int NOT NULL AUTO_INCREMENT,
  `InspectionSK` int NULL,
  `ViolationCodeSK` int NULL,
  `ViolationCategory` varchar(5) NULL,
  `CategoryScore` int NULL,
  `DI_CreatedDate` datetime NULL,
  `DI_WorkflowFileName` varchar(255) NULL,
  `DI_Workflow_ProcessID` varchar(20) NULL,
  PRIMARY KEY (`ViolationSK`)
);

ALTER TABLE `Fct_Inspection` ADD CONSTRAINT `BusinessSK` FOREIGN KEY (`BusinessSK`) REFERENCES `Dim_Business` (`BusinessSK`);
ALTER TABLE `Fct_Inspection` ADD CONSTRAINT `DateSK` FOREIGN KEY (`DateSK`) REFERENCES `Dim_Date` (`DateSK`);
ALTER TABLE `Fct_Violation` ADD CONSTRAINT `ViolationCodeSK` FOREIGN KEY (`ViolationCodeSK`) REFERENCES `Dim_ViolationCodes` (`ViolationCodeSK`);
ALTER TABLE `Fct_Violation` ADD CONSTRAINT `InspectionSK` FOREIGN KEY (`InspectionSK`) REFERENCES `Fct_Inspection` (`InspectionSK`);

