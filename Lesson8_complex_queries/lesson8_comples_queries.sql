/*
1. Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
*/

SET @target_user := FLOOR(1 + 5 * RAND());
SELECT @target_user;


-- select from_user_id, count(1) as total from messages where is_delivered = 1 and to_user_id = @target_user group by from_user_id order by total desc;

SELECT 
	u.id,
	CONCAT_WS(' ', u.first_name, u.last_name) AS name,
	COUNT(1) AS total
FROM messages m1
-- left - if user has been deleted we still want to see his id. for example if our fk constraint do nothing on update.
LEFT JOIN users u ON (
	m1.from_user_id = u.id
)
WHERE
	is_delivered = 1 
	AND to_user_id = @target_user
GROUP BY 
	from_user_id 
ORDER BY total DESC LIMIT 1;



/*
2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/

-- sollution 1

SELECT 	
 	CASE 
		WHEN l.target_id IS NULL THEN 'Total'
		ELSE l.target_id 
	END AS user_id,
	COUNT(1) AS likes
FROM profiles p 
INNER JOIN likes l ON 
	(p.user_id = l.target_id)
WHERE 
	FLOOR(TIMESTAMPDIFF(YEAR, p.birthday, NOW())) < 10 
GROUP BY 
	l.target_id
WITH ROLLUP;



-- sollution 2 - i think it should be faster

SELECT 
	CASE 
		WHEN l.target_id IS NULL THEN 'Total'
		ELSE l.target_id 
	END AS user_id,
	COUNT(1) AS likes
FROM 
	(
		SELECT 
			user_id 
		FROM profiles 
		WHERE 
			FLOOR(TIMESTAMPDIFF(YEAR, birthday, NOW())) BETWEEN 0 AND 10
	) AS y10
INNER JOIN 
	likes l ON (
		y10.user_id = l.target_id
	)
GROUP BY 
	l.target_id
WITH ROLLUP;




/*
3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

SELECT 
	u.gender,
	COUNT(1)
FROM 
	likes l 
INNER JOIN
	users u 
ON (l.user_id = u.id)
GROUP BY gender;
