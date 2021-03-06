DROP DATABASE IF EXISTS l5_p2_nikolay;
CREATE DATABASE l5_p2_nikolay;
USE l5_p2_nikolay;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- INSERT INTO users (name, birthday_at) VALUES
--   ('Геннадий', '1990-10-05'),
--   ('Наталья', '1984-11-12'),
--   ('Александр', '1985-05-20'),
--   ('Сергей', '1988-02-14'),
--   ('Иван', '1998-01-12'),
--   ('Мария', '1992-08-29');
--  

-- more users!!!
INSERT INTO `users` VALUES (1,'deserunt','1980-01-09','1993-01-25 15:29:26','2001-05-28 09:44:18'),(2,'qui','2000-05-27','2014-03-01 20:44:57','2005-06-19 20:42:19'),(3,'nulla','1990-06-11','1979-12-06 02:55:00','1980-08-07 02:17:52'),(4,'in','1976-10-24','2021-09-18 16:13:31','2004-08-26 16:02:03'),(5,'repudiandae','1980-12-27','1979-04-13 15:39:26','2019-01-30 18:12:57'),(6,'qui','2021-07-07','1996-12-25 05:17:35','1997-03-04 21:27:02'),(7,'iusto','2000-06-26','1978-05-27 15:52:25','2011-01-21 08:07:48'),(8,'exercitationem','1988-10-10','2013-08-17 18:21:01','2014-12-29 01:00:34'),(9,'accusamus','1997-05-30','2012-02-22 00:21:04','1988-11-29 16:19:06'),(10,'similique','2018-07-12','1989-08-27 05:02:27','1984-09-03 20:43:33'),(11,'non','1988-02-13','1997-07-05 21:55:42','1988-02-05 09:15:07'),(12,'necessitatibus','2019-08-14','2012-07-25 20:12:07','2004-07-30 09:29:26'),(13,'corrupti','2021-03-15','2012-10-26 21:24:03','1972-08-30 06:03:36'),(14,'sit','1979-08-20','2011-10-21 06:10:24','1979-11-04 16:32:37'),(15,'ratione','1975-09-10','2001-07-27 20:54:47','2001-09-19 05:27:13'),(16,'quaerat','1998-12-19','1985-09-13 12:06:28','1983-08-23 20:44:12'),(17,'ea','1980-06-05','1985-04-06 00:46:36','1985-01-26 06:26:11'),(18,'eos','1986-06-07','1994-03-09 08:37:52','2014-12-03 22:03:17'),(19,'dolor','2004-05-10','1986-06-15 01:14:27','2020-06-06 14:02:06'),(20,'libero','2001-06-25','1998-05-02 11:36:05','1990-08-11 12:33:02'),(21,'sed','2020-09-11','1989-05-11 10:36:34','1995-06-24 16:26:31'),(22,'enim','2021-03-13','1987-08-17 22:06:28','1996-08-10 07:40:36'),(23,'unde','1976-10-15','1980-01-22 05:13:24','1972-03-02 17:50:57'),(24,'voluptatem','2008-04-22','2001-06-16 16:29:16','1999-05-06 01:40:54'),(25,'aliquid','2001-08-19','1992-11-08 03:13:24','1971-05-05 05:12:50'),(26,'dolorem','1977-09-10','1983-10-28 01:33:17','2000-05-15 23:10:22'),(27,'dolorum','1997-12-31','1985-06-28 16:53:20','1982-09-26 05:22:44'),(28,'atque','2011-12-15','1986-05-10 01:50:32','2005-07-25 07:11:33'),(29,'ea','1988-06-19','1990-12-14 20:36:46','1984-12-11 12:38:23'),(30,'et','1976-05-28','1972-01-07 03:45:53','2009-02-16 20:07:56'),(31,'cum','1987-10-19','1976-03-15 20:08:30','2006-01-17 17:26:23'),(32,'asperiores','2020-08-02','1974-07-22 01:48:05','1979-02-12 04:54:40'),(33,'error','1993-09-04','1996-10-18 20:10:15','1985-02-25 18:45:30'),(34,'alias','2000-06-16','2017-11-06 13:04:03','2006-06-25 22:02:33'),(35,'sequi','1985-05-08','2019-06-06 08:54:45','2015-03-20 09:23:21'),(36,'porro','2014-12-19','2007-08-13 02:05:40','1984-03-15 18:24:31'),(37,'odio','1999-08-29','2002-04-18 03:53:25','1975-01-25 21:04:05'),(38,'et','1999-12-29','2007-10-03 10:00:43','2018-03-24 03:54:08'),(39,'et','1988-01-28','1970-01-30 16:46:15','1982-11-17 21:04:59'),(40,'repellendus','1981-05-05','2002-04-21 18:41:59','2000-01-30 15:14:25'),(41,'nisi','1980-08-26','1999-04-24 19:47:53','2004-11-26 08:57:52'),(42,'voluptas','2012-11-26','1983-12-15 05:05:47','1984-05-24 21:48:04'),(43,'repellendus','1986-03-25','1984-03-26 06:35:08','2007-01-25 08:07:01'),(44,'aut','1981-03-05','1983-07-02 06:17:13','1979-03-02 15:32:40'),(45,'nam','1989-10-29','2006-07-24 11:22:33','1990-02-08 20:16:49'),(46,'ipsam','1996-12-20','2018-10-24 17:02:00','1979-06-30 17:32:59'),(47,'voluptates','1978-01-14','1999-10-29 15:48:57','1989-07-04 11:31:23'),(48,'quia','2005-01-01','2011-10-05 21:52:25','2005-11-17 09:53:33'),(49,'dolorum','1970-12-03','1999-03-11 02:29:02','1993-10-26 18:26:49'),(50,'incidunt','2019-06-28','2003-08-03 02:10:39','1979-06-30 19:57:38');

/*
1. Подсчитайте средний возраст пользователей в таблице users.
 */

 SELECT COUNT(1) AS total_users,	-- duplicates warning
        FLOOR(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW()))) AS age 
   FROM users;


/*
2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */

-- my notes - pls ignore it
-- Change year to the current year:
--   SELECT name, DATE_ADD(birthday_at, INTERVAL YEAR(CURDATE())-YEAR(birthday_at) YEAR) AS YEAR FROM users;
--   SELECT name, STR_TO_DATE(CONCAT(YEAR(NOW()), DATE_FORMAT(birthday_at, '-%m-%d')),'%Y-%m-%d') AS YEAR FROM users; -- leap year???
-- Date Calculatiom:
-- select DATE(NOW()) - STR_TO_DATE('2021-9-10', '%Y-%m-%d');



-- plan: Update year to the current year -> find day of the week -> group
SELECT ANY_VALUE(name) AS user_example,
       DAYOFWEEK(
         	DATE_ADD(birthday_at, INTERVAL YEAR(CURRENT_DATE())-YEAR(birthday_at) YEAR)) 
         	AS day_of_the_week, 
       COUNT(1) AS total_users		-- duplicates warning
  FROM users
 GROUP BY day_of_the_week
 ORDER BY day_of_the_week;
;
  

-- verification query
-- SELECT birthday_at,
-- 	   DATE_ADD(birthday_at, INTERVAL YEAR(CURDATE())-YEAR(birthday_at) YEAR) as added_year,
-- 	   DAYOFWEEK( DATE_ADD(birthday_at, INTERVAL YEAR(CURRENT_DATE())-YEAR(birthday_at) YEAR)) AS day_of_the_week
-- FROM users WHERE name = 'nulla';



/*
3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.
*/

DROP TABLE IF EXISTS summary;
CREATE TABLE summary(
	num INT
);

INSERT INTO summary VALUES (1), (1), (2), (4), (8), (16), (32), (64), (128);

SELECT SUM(num) FROM summary;

 
 
 
 
 
 
 
 
