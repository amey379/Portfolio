CREATE TABLE dim_product_cost_history_scd(
    SK_ID                 INT     auto_increment      NOT NULL,
    Product_id            INT,
    ProductName           VARCHAR(32),
    CostPrice             FLOAT(10)    NOT NULL,
    SCD_StartDate         DATETIME,
    SCD_EndDate           DATETIME,
    SCD_Version           VARCHAR(10),
    IsActive              int,
    DI_DateToWarehouse    DATETIME,
    DI_JobID              VARCHAR(10),
    PRIMARY KEY (SK_ID)
)ENGINE=MYISAM
;
drop table dim_product_price_history_scd;
CREATE TABLE dim_product_price_history_scd(
    SK_ID                 INT     auto_increment      NOT NULL,
    Product_id            INT,
    ProductName           VARCHAR(32),
    ListPrice             FLOAT(10)    NOT NULL,
    Start_date    Date,
    Previous_Start_date date,
    SCD_StartDate         DATETIME,
    SCD_EndDate           DATETIME,
    SCD_Version           VARCHAR(10),
    IsActive              int,
    DI_DateToWarehouse    DATETIME,
    DI_JobID              VARCHAR(10),
    PRIMARY KEY (SK_ID)
)
;

CREATE TABLE etl_job(
    job_id                 INT       AUTO_INCREMENT     NOT NULL,
    job_name           VARCHAR(100),
    table_name           VARCHAR(100),
    schedule         VARCHAR(30),
    created_by           VARCHAR(30),
    created_date           DATETIME,
    PRIMARY KEY (job_id)
)ENGINE=MYISAM
;

CREATE TABLE etl_job_log(
    job_log_id                 INT       AUTO_INCREMENT     NOT NULL,
    job_id                 INT       NOT NULL,
    job_status           VARCHAR(20),
    created_by           VARCHAR(30),
    created_date           DATETIME,
    PRIMARY KEY (job_log_id)
)ENGINE=MYISAM
;

ALTER TABLE etl_job_log
ADD CONSTRAINT fk_job_id
FOREIGN KEY (job_id)
REFERENCES etl_job(job_id);

INSERT INTO etl_job(job_name,table_name,schedule,created_by,created_date) 
VALUES('wf_load_dim_product_price_hist_scd',"dim_product_price_history_scd","DAILY",user(),current_timestamp());

INSERT INTO etl_job(job_name,table_name,schedule,created_by,created_date) 
VALUES('wf_load_dim_product_cost_history_scd',"dim_product_cost_history_scd","DAILY",user(),current_timestamp());