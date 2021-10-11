-- 15 users
TRUNCATE users;
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('1', 'alias', '1977-10-08', '1989-01-19 20:29:32', '2013-10-13 20:25:36');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('2', 'ut', '1993-12-07', '1980-11-19 12:16:18', '2020-11-12 11:32:35');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('3', 'alias', '1983-01-24', '1976-04-27 08:08:38', '2019-10-21 09:51:27');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('4', 'quo', '2010-05-02', '1997-09-19 13:42:58', '1996-05-10 01:47:04');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('5', 'autem', '2007-07-23', '1998-10-30 11:40:07', '2001-10-08 09:15:48');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('6', 'est', '1987-06-14', '1997-01-26 17:29:58', '2017-06-25 07:14:30');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('7', 'vitae', '2018-11-06', '2018-02-08 21:01:35', '1991-08-06 00:40:52');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('8', 'vitae', '1990-08-18', '1995-07-14 09:33:29', '1989-12-04 08:48:34');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('9', 'et', '1970-08-07', '1984-05-11 00:03:48', '1970-09-25 23:54:17');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('10', 'tempora', '1974-10-15', '1992-02-13 22:45:22', '1990-02-21 19:11:35');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('11', 'enim', '1984-11-26', '2013-12-11 10:05:13', '2020-10-29 03:26:59');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('12', 'fugit', '2016-04-01', '1984-07-23 08:35:57', '1986-01-15 16:47:56');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('13', 'fuga', '1992-01-06', '1973-07-04 20:15:02', '1985-05-04 18:28:27');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('14', 'sit', '2005-11-15', '2008-05-03 08:08:25', '1993-09-25 13:48:38');
INSERT INTO `users` (`id`, `name`, `birthday_at`, `created_at`, `updated_at`) VALUES ('15', 'et', '1970-07-08', '1989-08-10 06:50:07', '2003-11-12 03:58:48');

-- 15 orders
TRUNCATE orders;
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('1', 1, '2002-10-10 18:22:56', '2004-07-22 17:35:46');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('2', 4, '1989-09-01 11:14:01', '1981-04-12 22:22:02');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('3', 3, '2021-07-27 06:09:34', '1970-02-26 23:10:43');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('4', 3, '2006-01-24 18:24:56', '1998-11-15 04:45:09');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('5', 5, '1977-04-01 11:50:55', '1974-09-02 11:09:49');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('6', 6, '2008-01-06 01:52:05', '1992-02-26 02:13:27');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('7', 7, '2019-04-27 11:36:38', '1988-09-29 17:42:47');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('8', 8, '1986-06-06 05:23:56', '2016-05-12 21:19:48');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('9', 5, '1988-12-17 20:24:02', '2013-09-10 02:49:58');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('10', 4, '1984-07-05 14:50:35', '2000-08-17 10:27:27');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('11', 3, '2017-10-22 20:11:28', '1973-02-26 16:07:50');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('12', 1, '1988-02-17 13:51:31', '1992-04-19 13:41:44');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('13', 7, '1970-08-02 07:04:22', '2011-06-26 23:19:41');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('14', 8, '1972-09-21 03:31:13', '2009-11-23 20:53:04');
INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES ('15', 5, '1993-10-04 16:29:37', '1974-09-05 16:49:26');




-- for task 3
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(100) NOT NULL,
	`to` VARCHAR(100) NOT NULL
);

INSERT INTO flights (`from`, `to`)
VALUES 
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label VARCHAR(100),
	name VARCHAR(100)
);

INSERT INTO cities (label, name) 
VALUES 
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');