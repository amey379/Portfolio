--Supportiv Take Home Challenge
use challenge;
select * from moderator_performance;
select * from recommendation;
select * from user_activity;

select * from user_activity where feedback_rating=6;

select u.user_id, count(*) from user_activity u 
join recommendation r on u.user_id= r.user_id
group by u.user_id
order by count(*) desc;

select u.user_id, timestamp, u.session_length, u.messages_sent, u.feedback_rating, u.resources_clicked, r.* from user_activity u 
join recommendation r on u.user_id= r.user_id
--where u.user_id ='e79196f3-6bd7-4128-8a02-7859e54d94f3';
order by u.user_id;
-- 7f9bcfda-5f88-4957-87e5-52149db076a1


use challenge;
-- High Performing Morderator
WITH ranked_moderators AS (
    SELECT 
        moderator_id,
        AVG(user_satisfaction_score) AS avg_satisfaction,
        AVG(avg_response_time) AS avg_response_time,
        SUM(chat_sessions_moderated) AS total_sessions,
        RANK() OVER (ORDER BY AVG(user_satisfaction_score) DESC,SUM(chat_sessions_moderated) desc, AVG(avg_response_time) asc) AS rank_high
    FROM moderator_performance
    GROUP BY moderator_id
)
SELECT 
    moderator_id,
    avg_satisfaction,
    avg_response_time,
    total_sessions
FROM ranked_moderators
WHERE rank_high <= 5
ORDER BY rank_high;

--Low Performng Moderator
WITH ranked_moderators AS (
    SELECT 
        moderator_id,
        AVG(user_satisfaction_score) AS avg_satisfaction,
        AVG(avg_response_time) AS avg_response_time,
        SUM(chat_sessions_moderated) AS total_sessions,
        RANK() OVER (ORDER BY AVG(user_satisfaction_score) ASC, AVG(avg_response_time) desc,SUM(chat_sessions_moderated) asc ) AS rank_low
    FROM moderator_performance
    GROUP BY moderator_id
)
SELECT 
    moderator_id,
    avg_satisfaction,
    avg_response_time,
    total_sessions
FROM ranked_moderators
WHERE rank_low <= 5
ORDER BY rank_low;

-- Analyze Response Time and User Satisfaction
WITH response_time_bins AS (
    SELECT 
        moderator_id,
        user_satisfaction_score,
        chat_sessions_moderated,
        avg_response_time,
        CASE 
            WHEN avg_response_time <= 5 THEN '0-5 mins'
            WHEN avg_response_time <= 10 THEN '5-10 mins'
            WHEN avg_response_time <= 15 THEN '10-15 mins'
            WHEN avg_response_time <= 20 THEN '15-20 mins'
            ELSE '20+ mins'
        END AS response_time_range
    FROM moderator_performance
)
SELECT 
    response_time_range,
    AVG(user_satisfaction_score) AS avg_satisfaction,
    SUM(chat_sessions_moderated) AS total_sessions
FROM response_time_bins
GROUP BY response_time_range
ORDER BY response_time_range;


-- user activity and recommendation
use challenge;

with lead_recommedation
as
(
select u.user_id,r.feedback_score, u.timestamp, r.recommendation_type,
Lead(r.recommendation_type) over (order by u.timestamp asc) as next_recommendation_type,
r.click_through_rate, 
Lead(r.click_through_rate) over (order by u.timestamp asc) as next_click  from user_activity u 
join recommendation r on u.user_id= r.user_id
),
get_users as
(
	select user_id from recommendation group by user_id having count(*)>1
),

grouped_podcast as 
(
	select recommendation_type,next_recommendation_type, DATENAME(WEEKDAY, timestamp) as day, avg(next_click-click_through_rate) as diff
	from lead_recommedation l join get_users g on l.user_id=g.user_id
	group by recommendation_type,next_recommendation_type,DATENAME(WEEKDAY, timestamp)

)
select * from grouped_podcast
--where recommendation_type='Podcast' and next_recommendation_type='Podcast'
order by day,diff desc ;
/*
select u.timestamp,  r.recommendation_type, r.click_through_rate, r.feedback_score from user_activity u 
join recommendation r on u.user_id= r.user_id
where u.user_id ='e79196f3-6bd7-4128-8a02-7859e54d94f3';
*/


with lead_recommedation
as
(
select u.user_id,r.feedback_score, u.timestamp, r.recommendation_type,
Lead(r.recommendation_type) over (order by u.timestamp asc) as next_recommendation_type,
r.click_through_rate, 
Lead(r.click_through_rate) over (order by u.timestamp asc) as next_click  from user_activity u 
join recommendation r on u.user_id= r.user_id
),
get_users as
(
	select user_id from recommendation group by user_id having count(*)>1
),

grouped_podcast as 
(
	select recommendation_type,next_recommendation_type, avg(next_click-click_through_rate) as diff
	from lead_recommedation l join get_users g on l.user_id=g.user_id
	group by recommendation_type,next_recommendation_type

)
select * from grouped_podcast
order by diff desc ;

/*
Insights: 
Video → Video and Blog → Video transitions drive strong CTR, especially on Fridays and Tuesdays. 
Video → Blog and Podcast → Blog consistently show negative CTR, disrupting engagement. 
Same-type transitions (e.g., Video → Video) maintain high engagement across all days. 
Fridays show strong performance across transitions, while Wednesdays favor Video-first flows. 
Recommendations: 
Focus on Video-first recommendations, avoid Video → Blog, and optimize high-engagement days like Fridays for better transitions.
Scope:
Validate timestamps by ensuring standardized time zones, addressing session overlaps (e.g., late-night sessions), and analyzing time gaps between transitions. 
Check for peak activity hours (morning vs. evening) and data completeness to ensure transitions are accurate and reflective of user behavior.

*/