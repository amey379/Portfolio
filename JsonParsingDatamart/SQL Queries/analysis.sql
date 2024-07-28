select * from stg_movie_dtl ;
select * from stg_actor;
select * from stg_category order by Movie_dtl_id;
select * from stg_writer ;
select * from stg_director ;
select * from actors;
select * from directors;

select * from dim_actors order by name;
-- delete from dim_actors;
select *  from dim_directors;
select *  from dim_date;
select *  from dim_writer;
select *  from dim_category;
select *  from dim_movie_scd;
select *  from fct_movie;
select * from movie_writer_bridge ;
select * from movie_actor_bridge ;
select * from movie_category_bridge;
select * from movie_director_bridge;

select * from stg_category where Categories="" or Categories is null;
select * from stg_actor where actors="" or actors is null;
select count(*) from stg_writer where Writers is null or Writers='';
select * from stg_director where directors is null or directors='';
select Name,count(*) from dim_movie_scd group by Name having count(*)>1;
select MovieSK,count(*) from fct_movie group by MovieSK having count(*)>1;
select * from dim_movie_scd where name='THE PUNISHER';

select * from stg_movie_dtl where name='THE PUNISHER';
select Name,count(*) from directors group by Name having count(*)>1;
select Categories,count(*) from stg_category group by Categories having count(*)<2;
select * from stg_category;
select * from stg_movie_dtl where name='The Punisher';

select * from stg_movie_dtl order by release_date desc;
select * from stg_director where Movie_dtl_id='122';
select * from stg_movie_dtl where Movie_dtl_id='217';

/*actor bridge*/
select * from stg_actor where Movie_dtl_id=217;

select * from dim_actors where Name = '%WISEMAN%';

SELECT 
  distinct s.Directors
FROM `stg_director` s left join dim_directors a on s.Directors=a.name where a.name is null;

select * from dim_movie_scd where moviesk=342;
select * from stg_movie_dtl   where Movie_dtl_id= 342;
select * from stg_actor where Movie_dtl_id= 342;
select * from stg_category where Movie_dtl_id= 342;
select * from stg_writer where Movie_dtl_id= 342;
select * from stg_director where Movie_dtl_id= 342;
select * from fct_movie where moviesk= 342;
select * from dim_actors where name='LUIS TOSAR';
select * from movie_actor_bridge where moviesk= 342; ;

update fct_movie set no_of_actors=4,no_of_directors=1,no_of_writers=2   where moviesk=342;
 select m.MovieSK, count(*)  from movie_actor_bridge m group by m.MovieSK;
select f.MovieSK, f.no_of_directors, s.no_of_directors from fct_movie f join 
( select m.MovieSK, count(*) as no_of_directors from movie_director_bridge m group by m.MovieSK ) s
on  s.MovieSK=f.MovieSK and  f.no_of_directors = s.no_of_directors ;