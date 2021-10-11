/*
1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

-- INNER JOIN fits
-- users with the same name name will be displayed.
-- users that did few orders will be displayed once. 
SELECT 
	u.id AS user_id,
	u.name AS customer_name
FROM 
	users AS u
JOIN 
	orders AS o
ON u.id = o.user_id 
GROUP BY user_id;


/*
2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

SELECT 
	p.name AS product, 
	c.name AS catalog_name
FROM 
	products AS p 
LEFT JOIN -- INNER should be ok too
	catalogs AS c 
ON c.id = p.catalog_id;


/*
3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.
*/

SELECT 
	flights.id AS flight_id,
	from_rus.name AS `from`,
	to_rus.name AS `to`
FROM flights
LEFT JOIN cities AS from_rus ON flights.`from` = from_rus.`label`
LEFT JOIN cities AS to_rus ON flights.`to` = to_rus.`label`;
