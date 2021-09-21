show tables;

/*
2. Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
*/


-- set target user here
SET @target_user := FLOOR(1 + 5 * RAND());
SELECT @target_user;



select * from friendship;

SELECT 
	user_id, friend_id 
FROM 
	friendship
WHERE 
	request_type_id = 1
	AND confirmed_at IS NOT NULL 
	AND user_id = @target_user
UNION -- NOTE: UNION does SELECT DISCTINCT. Use UNION ALL to override.
SELECT 
	friend_id AS user_id, user_id AS friend_id 
FROM
	friendship
WHERE 
	request_type_id = 1
	AND confirmed_at IS NOT NULL 
	AND friend_id = @target_user;

SELECT 
	user_id, friend_id 
FROM 
	friendship
WHERE 
	request_type_id = 2
	AND confirmed_at IS NOT NULL 
	AND user_id = @target_user
UNION -- NOTE: UNION does SELECT DISCTINCT. Use UNION ALL to override.
SELECT 
	friend_id AS user_id, user_id AS friend_id 
FROM
	friendship
WHERE 
	request_type_id = 2
	AND confirmed_at IS NOT NULL 
	AND friend_id = @target_user;
	
SELECT DISTINCT 
	IF(user_id = @target_user, user_id, friend_id) as user_id,
	IF(user_id = @target_user, friend_id, user_id) AS friend_id 
FROM 
	friendship
WHERE 
	request_type_id = 1
	AND confirmed_at IS NOT NULL 
	AND ( user_id = @target_user OR friend_id = @target_user);
	
SELECT DISTINCT  
	IF(user_id = @target_user, user_id, friend_id) as user_id,
	IF(user_id = @target_user, friend_id, user_id) AS friend_id 
FROM 
	friendship
WHERE 
	request_type_id = 2
	AND confirmed_at IS NOT NULL 
	AND ( user_id = @target_user OR friend_id = @target_user);
	
select * from friendship where request_type_id = 2;

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
);