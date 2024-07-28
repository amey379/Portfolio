/*Json Load*/
select * from actors;
select count(*) from actors;
select * from directors;
select count(*) from directors;

/*Datamart Load*/
/*---------Staging---------*/
select * from stg_movie_dtl ;
select count(*) from stg_movie_dtl;
select * from stg_actor;
select count(*) from stg_actor;
select * from stg_category;
select count(*) from stg_category;
select * from stg_writer ;
select count(*) from stg_writer;
select * from stg_director ;
select count(*) from stg_director;
select * from movie_writer_bridge where MovieSK=110;
select count(*) from movie_writer_bridge;
select * from movie_actor_bridge where MovieSK=110;
select count(*) from movie_actor_bridge;
select * from movie_category_bridge where MovieSK=110;
select count(*) from movie_category_bridge;
select * from movie_director_bridge where MovieSK=110;
select count(*) from movie_director_bridge;
/*-----dim------*/
select * from dim_movie_scd where name='THE LOST WORLD: JURASSIC PARK' order by release_version desc;
select * from dim_movie_scd where year=2003;
select count(*) from dim_movie_scd;
select * from fct_movie;
select count(*) from fct_movie;
select * from dim_actors ;
select count(*) from dim_actors;
select * from dim_directors;
select count(*) from dim_directors;
select * from dim_category;
select count(*) from dim_category;
select * from dim_writer;
select count(*) from dim_writer;