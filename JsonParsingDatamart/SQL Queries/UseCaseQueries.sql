/*Show Category wise, title/movie name who has more than 4 wirters and 3 Actors . Include the counts*/
select c.category, dm.name,m.no_of_writers, m.no_of_actors  from fct_movie m 
join movie_category_bridge mcb on m.moviesk=mcb.moviesk
join dim_category c on  mcb.categorysk=c.categorysk
join dim_movie_scd dm on m.moviesk=dm.moviesk 
where m.no_of_writers>4 and m.no_of_actors>3
order by dm.name;

select c.category, count(*) no_of_movies from fct_movie m 
join movie_category_bridge mcb on m.moviesk=mcb.moviesk
join dim_category c on  mcb.categorysk=c.categorysk
join dim_movie_scd dm on m.moviesk=dm.moviesk 
where m.no_of_writers>4 and m.no_of_actors>3
group by c.category
order by category;

SELECT 
    GROUP_CONCAT(category SEPARATOR '|') AS all_categories,
    name,
    no_of_writers,
    no_of_actors
FROM 
    (select c.category, dm.name,m.no_of_writers, m.no_of_actors  from fct_movie m 
join movie_category_bridge mcb on m.moviesk=mcb.moviesk
join dim_category c on  mcb.categorysk=c.categorysk
join dim_movie_scd dm on m.moviesk=dm.moviesk 
where m.no_of_writers>4 and m.no_of_actors>3) a
GROUP BY
    name, no_of_writers, no_of_actors;

select * from fct_movie m where m.no_of_writers>4 and m.no_of_actors>3;
/*List year wise titles*/
select year,name from dim_movie_scd order by year;

select year,count(*) from dim_movie_scd group by year order by year;
