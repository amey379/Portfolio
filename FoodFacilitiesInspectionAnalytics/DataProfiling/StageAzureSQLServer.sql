CREATE TABLE stg_azure_food_inspections (
    BusinessId varchar(9) NULL,
    Name varchar(70) NULL,
    Address varchar(32) NULL,
    City varchar(17) NULL,
    State varchar(2) NULL,
    ZipCode varchar(10) NULL,
    PhoneNumber varchar(12) NULL,
    InspectionId varchar(9) NULL,
    Date datetime2 NULL,
    InspectionType varchar(9) NULL,
    ViolationCodes varchar(109) NULL,
    ViolationDescriptions varchar(2000) NULL,
    Latitude float(20) NULL,
    Longitude float(20) NULL,
    DI_CreatedDate datetime2 NULL,
    DI_WorkflowFileName varchar(2000) NULL,
    DI_Workflow_ProcessID varchar(20) NULL
);
