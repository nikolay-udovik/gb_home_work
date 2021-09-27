-- my notes
-- \u l6

/*
1. Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
*/


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
FROM 
	profiles AS p 
INNER JOIN likes AS l ON 
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
		FROM 
			profiles 
		WHERE 
			FLOOR(TIMESTAMPDIFF(YEAR, birthday, NOW())) BETWEEN 0 AND 10
	) AS y10
INNER JOIN 
	likes AS l ON (
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
	likes AS l 
INNER JOIN
	users AS u 
ON (l.user_id = u.id)
GROUP BY gender;
