/*
1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.
 */
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(30) NOT NULL,
	created_at VARCHAR(20),
	updated_at VARCHAR(20)
);

INSERT INTO users (username, created_at, updated_at) 
VALUES ('banana', NOW(), NOW());

SELECT * FROM users;




/*
2. Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались 
значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, 
сохранив введённые ранее значения.
 */

-- Proceeding to work with table from exercise 1.

-- generate dummy data
INSERT INTO users (username, created_at, updated_at) 
VALUES ('orange', '12.05.2013 4:10', '20.10.2017 8:10'),
	   ('apple', '11.9.2004 10:40', '04.08.2013 4:30'),
	   ('mango', '30.11.2015 3:30', '24.01.2014 15:10');

-- SELECT 
SELECT STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'), 
	   STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i')
  FROM users 
 WHERE DATE(created_at) IS NULL 		-- if returned value is NULL it supposed to be in %d.%m.%Y %H:%i format. 
   AND DATE(updated_at) IS NULL;

-- update
UPDATE users
   SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
		updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i')
WHERE created_at NOT RLIKE '^([0-9]{4})-(1[0-2]|0[1-9])-(3[01]|0[1-9]|[12][0-9]) (2[0-3]|[01][0-9]):([0-5][0-9]):([0-5][0-9])$'
  AND updated_at NOT RLIKE '^([0-9]{4})-(1[0-2]|0[1-9])-(3[01]|0[1-9]|[12][0-9]) (2[0-3]|[01][0-9]):([0-5][0-9]):([0-5][0-9])$';
-- WHERE DATE(created_at) IS NULL
--  AND DATE(updated_at) IS NULL;
 
 
ALTER TABLE users CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users CHANGE updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
DESC users;
SELECT * FROM users;



/*
3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
0, если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако нулевые запасы должны выводиться в конце, после всех записей.
*/

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
	value INT
);

INSERT INTO storehouses_products 
VALUES (0), (2500), (0), (30), (500), (1);

-- Logic: If value eq 0 then value = NULL. Configure "NULL LAST" presentation. 
-- All magic is here https://stackoverflow.com/questions/2051602/mysql-orderby-a-number-nulls-last
SELECT value 
  FROM storehouses_products 
 ORDER BY CASE 
          WHEN value = 0 THEN NULL 
          ELSE -value 
          END DESC;




/*
4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий (may, august)
*/
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	username VARCHAR(30) NOT NULL,
	birthday DATETIME NOT NULL
);

-- generate dummy data using http://filldb.info
INSERT INTO `users` VALUES (1,'donato98','1996-05-27 00:03:22'),(2,'donna.waelchi','1971-06-23 21:42:35'),(3,'sabernathy','1987-11-06 18:42:01'),(4,'connie40','1993-02-24 03:05:55'),(5,'mvandervort','2020-05-12 00:09:02'),(6,'justice.hegmann','2017-08-12 15:32:20'),(7,'al79','1990-04-30 16:56:44'),(8,'toy.mcclure','2019-03-16 19:34:32'),(9,'konopelski.solon','1982-06-21 09:50:17'),(10,'susana.hodkiewicz','1978-08-20 21:26:17'),(11,'iharvey','1998-04-01 19:49:48'),(12,'maiya75','2014-07-02 18:52:32'),(13,'ndurgan','2011-06-11 05:08:43'),(14,'skub','1988-05-30 09:26:34'),(15,'xberge','2020-11-20 23:54:45');


SELECT username,birthday 
  FROM users 
 WHERE MONTHNAME(birthday) LIKE 'May' 
    OR  MONTHNAME(birthday) LIKE 'August';


/*
5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
Отсортируйте записи в порядке, заданном в списке IN.
*/

DROP TABLE IF EXISTS catalogs;   
CREATE TABLE catalogs (
	id INT
);
 
INSERT INTO catalogs VALUES (1), (2), (3), (4), (5), (6);
 
 
SELECT * 
  FROM catalogs 
 WHERE id IN (5, 1, 2) 
 ORDER BY CASE 
          WHEN id = 1 
          THEN 3 
          ELSE id 
          END DESC;
 
 
 
 
 
 
 
 
 
 
 
