/*
1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/

show tables;
select * from users;
select * from orders;

/*
2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/

select * from catalogs;
select * from products;

/*
3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.
*/

