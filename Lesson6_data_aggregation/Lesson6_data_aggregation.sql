show tables;



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
SELECT friend_id FROM friends WHERE user_id = @target_user; -- get friends

select * from messages where from_user_id = @target_user or to_user_id = @target_user; -- get messages

/*
1. Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения (JOIN пока не применять).
 */

/*
2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
*/

-- loking for dialogs and not one way messages

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
SELECT
	to_user_id,
	from_user_id 
 	CASE @target_user
 		WHEN from_user_id THEN to_user_id
 		ELSE from_user_id 
 	END AS from_user_id
FROM messages
WHERE
	(
		to_user_id IN (SELECT friend_id FROM friends WHERE user_id = @target_user) AND from_user_id = @target_user
		OR 
		from_user_id IN (SELECT friend_id FROM friends WHERE user_id = @target_user) AND to_user_id = @target_user
	)		
;

SELECT
	(SELECT name FROM communities c WHERE cu.community_id)
FROM
	communities_users cu
WHERE cu.user_id IN (
	SELECT friend_id FROM friends
);
SELECT 
	from_user_id, 
	to_user_id, 
	COUNT(1) AS total
FROM messages 
WHERE from_user_id = @target_user
	OR to_user_id = @target_user
GROUP BY from_user_id, to_user_id
ORDER BY total DESC;


/*
3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
*/

/*
4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/

/*
5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
*/