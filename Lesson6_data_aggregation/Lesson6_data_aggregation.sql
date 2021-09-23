/*
1. Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения (JOIN пока не применять).
 */

-- Пересмотрел запись так и не нашел до чего придраться. Для себя вынес что стоит избегать кореляционные под-запросы, которые мы использовали немало.z



/*
2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
*/


-- set target user here
SET @target_user := FLOOR(1 + 5 * RAND());
SELECT @target_user;


WITH friends AS (
	SELECT
		IF(user_id = @target_user, user_id, friend_id) AS user_id,
		CASE @target_user
			WHEN friend_id THEN user_id
			ELSE friend_id
		END AS friend_id
	FROM
		friendship
	WHERE
		request_type_id = 1
		AND confirmed_at IS NOT NULL
		AND (user_id = @target_user OR friend_id = @target_user)
	UNION 
	SELECT
		user_id, friend_id
	FROM
		friendship
	WHERE
		request_type_id = 2
		AND user_id = @target_user
		AND friend_id IN (
			SELECT
				user_id
			FROM
				friendship
			WHERE
				request_type_id = 2
				AND friend_id = @target_user
	)
)
-- TODO: Think about how to lookup for dialogs and not for one way messages with no response. 
SELECT
 	CASE @target_user
 		WHEN from_user_id THEN to_user_id
 		ELSE from_user_id 
 	END AS friend_id,
 	COUNT(1) as total_messages
FROM messages
WHERE
	(
		to_user_id IN (SELECT friend_id FROM friends WHERE user_id = @target_user) AND from_user_id = @target_user
		OR 
		from_user_id IN (SELECT friend_id FROM friends WHERE user_id = @target_user) AND to_user_id = @target_user
	)
	AND
		is_delivered = 1
GROUP BY friend_id
ORDER BY total_messages DESC
LIMIT 1;



/*
3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
*/

WITH youngest_10 AS (
	SELECT 
		user_id 
	FROM profiles 
	ORDER BY birthday ASC LIMIT 10
)
SELECT 
	COUNT(1) AS likes,
	CASE 
		WHEN target_id IS NULL THEN 'Total'
		ELSE target_id
	END AS user_id
FROM 
	likes
WHERE 
	target_id IN (SELECT user_id FROM youngest_10)
	-- 	AND target_type_id = 1 -- no idea if i need to consider it...
GROUP BY target_id
WITH ROLLUP;






/*
4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/


-- maybe correlated subquerry is not the best idea but i wanted to try :)
SELECT 
	(SELECT gender FROM users u WHERE u.id = li.user_id AND gender IN('F', 'M')) AS gender,
	COUNT(1) AS total_likes
FROM 
	likes li
GROUP BY gender
ORDER BY total_likes DESC;


/*
5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
*/


/*
README!

score is:
- score this is the social rating
- score is a summary of all metrics
- profiles that are in a disabled state will be outside of this rate.

metric is:
- metric consists of the count of some action multiplied by the weight.

what is "weight"? :
- weight is a value assigned to each metric value and used as a multiplier for metrics.
- the size of the weight depends on the importance of the metric. 
  - For example, writing posts is costs time and describes user activity in the social networks much better than messages or likes
  - likes are considered more expensive than messages because liking content is public action and also describes the social activity
  - message is the cheapest. Users can send a lot of messages and stay inactive in the community, but we still should consider it.
  
metrics:
- Amount of sent messages * weight
- Amount of likes * weight
- Amount of posts * weight
*/


-- ---------------
-- Default weight values
-- message = 3
-- like = 10
-- post = 500
SET @weight_message := 3;
SET @weight_like := 10;
SET @weight_post := 500;

-- using derived table
-- ref https://dba.stackexchange.com/questions/90171/grouping-union-all
WITH score AS (
	SELECT 
		user_id, 
		SUM(metric) AS score 
	FROM 
	(
		SELECT 
			user_id,
			COUNT(1) * @weight_like AS metric 
		FROM 
			likes l
		GROUP BY user_id
		UNION ALL
		SELECT 
			from_user_id AS user_id,
			COUNT(1) * @weight_message AS metric
		FROM 
			messages m
		GROUP BY user_id 
		UNION ALL
		SELECT
			user_id,
			COUNT(1) * @weight_post AS metric
		FROM 
			posts
		GROUP BY user_id 
	) AS metrics
	GROUP BY user_id
)
-- now lets ask for 10 passive users :)
SELECT 
	user_id,
	score
FROM
	score
ORDER BY score ASC
LIMIT 10;

/*
-- verify
SELECT score FROM score WHERE user_id = 1; -- Score 1096
SELECT target_id FROM likes WHERE user_id = 1; -- 3 * weight = 30
SELECT from_user_id FROM messages WHERE from_user_id = 1; -- 22 * weight = 66
SELECT user_id FROM posts WHERE user_id = 1; -- 2 * weight = 1000
*/



