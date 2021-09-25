/*
1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

-- INNER JOIN fits

SELECT
	u.name AS customer_name
FROM 
	users AS u
JOIN 
	orders AS o
ON u.id = o.user_id 
GROUP BY customer_name;


/*
2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

select * from catalogs;
select * from products;

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

