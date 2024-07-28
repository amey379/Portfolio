select moviesk, count(*) actor from movie_actor_bridge group by moviesk;
 select moviesk, count(*) writer from movie_writer_bridge  group by moviesk;
 
 /*Verify*/
 select a.moviesk,actor,writer from (
 select moviesk, count(*) actor from movie_actor_bridge group by moviesk) a join (
 select moviesk, count(*) writer from movie_writer_bridge  group by moviesk) b on a.moviesk=b.moviesk
 where writer>4 and actor>3;
 
 select * from stg_actor;
 select * from stg_movie_dtl where release_date is null;
  select s.Categories, a.Movie_dtl_id,actor,writer from (
 select Movie_dtl_id, count(*) actor from stg_actor group by Movie_dtl_id) a join (
 select Movie_dtl_id, count(*) writer from stg_writer  group by Movie_dtl_id) b on a.Movie_dtl_id=b.Movie_dtl_id
 join stg_category s on a.Movie_dtl_id=s.Movie_dtl_id
 where writer>=4 and actor>3;
 
 select * from  movie_category_bridge m where m.MovieSK in (
 67,
110,
141,
221,
246,
254,
280,
294,
329);

select * from stg_movie_dtl where Movie_dtl_id in ( 67,
110,
141,
221,
246,
254,
280,
294,
329);

select year, count(*) from stg_movie_dtl group by year;