select count(*) from dim_product_cost_history_scd;
select count(*) from dim_product_price_history_scd;
select * from etl_job;
select * from etl_job_log;

truncate table  dim_product_cost_history_scd;
truncate table  dim_product_price_history_scd;
truncate table  etl_job_log;