/*
1. Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения (JOIN пока не применять).
 */

/*
2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
*/


-- set target user here
SET @target_user := 3; -- FLOOR(1 + 5 * RAND());
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
ß

WITH youngest_10 AS (
	SELECT 
		user_id 
	FROM profiles 
	ORDER BY birthday ASC LIMIT 10
)
-- select * from youngest_10;
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


-- correlated subquerry is not the best idea but i wanted to try :)
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

-- Top 10 'lazy' users are:
Metric
-- CA
-- 1. Account is NOT disabled.
-- 2. The user didn't like content/users
-- 3. The user doesn't send messages
-- 4. Time Interval - from creating.


metric is the summary of the fhese components:
- Amount of sent messages
- Amount of likes 
Another:
- Ignore disabled accounts

show tables;
desc posts;
select * from posts;
SELECT 
	user_id
FROM
	profiles p 
WHERE 
	status != 'disabled';

SELECT 
	user_id,
	COUNT(1) AS total_likes
FROM 
	likes
GROUP BY user_id
ORDER BY total_likes ASC;

SELECT 
	from_user_id,
	COUNT(1) AS total_messages
FROM 
	messages m
GROUP BY from_user_id
ORDER BY total_messages;


SELECT
	user_id,
	COUNT(1) AS total_posts
FROM 
	posts
GROUP BY user_id 
ORDER BY total_posts;

select * from posts where user_id = 34;
select * from likes where user_id = 53;
show tables;
select * from likes;
select * from users;
select * from profiles;
