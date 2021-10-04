/*
1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
*/


-- NOTE:  my shop table called l9

-- create db sample with table users
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
CREATE TABLE sample.users (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Покупатели'

-- let's begin


DELIMITER //
DROP PROCEDURE IF EXISTS move_one_record //
CREATE PROCEDURE move_one_record (IN n_id INT)
BEGIN
	DECLARE n_name VARCHAR(255);
	DECLARE n_birthday DATE; 
	DECLARE n_created DATETIME;
	DECLARE n_updated DATETIME;
	SELECT name INTO n_name FROM l9.users WHERE id = n_id ; 
	SELECT birthday_at INTO n_birthday FROM l9.users WHERE id =n_id ; 
	SELECT created_at  INTO n_created FROM l9.users WHERE id = n_id; 
	SELECT updated_at INTO n_updated FROM l9.users WHERE id = n_id ; 
	START TRANSACTION;
	INSERT INTO sample.users (id, name, birthday_at, created_at, updated_at)
	VALUES (n_id, n_name, n_birthday, n_created, n_updated );
	
END//
DELIMITER  ;

START TRANSACTION;
CALL fetch_users_fields(1);

SELECT * FROM sample.users;

DROP PROCEDURE IF EXISTS move_one_record;
COMMIT;

/*
2. Создайте представление, которое выводит название name товарной позиции из таблицы products 
и соответствующее название каталога name из таблицы catalogs.
*/





/*
3. (по желанию) Пусть имеется таблица с календарным полем created_at. 
В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
если дата присутствует в исходном таблице и 0, если она отсутствует.
*/




/*
4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
*/