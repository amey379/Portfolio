truncate table actors;
truncate table directors;


truncate table stg_movie_dtl;
truncate table stg_actor;
truncate table stg_category;
truncate table stg_writer;
truncate table stg_director;


truncate table movie_writer_bridge;
truncate table movie_director_bridge;
truncate table movie_category_bridge;
truncate table movie_actor_bridge;
truncate table dim_directors;
truncate table dim_actors;
truncate table dim_date;
truncate table dim_writer;
truncate table dim_category;
truncate table fct_movie;
truncate table dim_movie_scd;

drop table movie_writer_bridge;
drop table movie_director_bridge;
drop table movie_category_bridge;
drop table movie_actor_bridge;
drop table dim_directors;
drop table dim_actors;
drop table dim_writer;
drop table dim_category;
drop table fct_movie;
drop table dim_movie_scd;


delete from movie_writer_bridge;
delete from movie_director_bridge;
delete from movie_category_bridge;
delete from movie_actor_bridge;
delete from dim_directors;
delete from dim_actors;
delete from dim_writer;
delete from dim_category;
delete from fct_movie;
delete from dim_movie_scd;