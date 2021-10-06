/*
1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
*/

START TRANSACTION;

INSERT INTO l9.users 
SELECT * FROM l9.users WHERE id = 1;

DELETE FROM l9.users WHERE id = 1;

COMMIT;

SELECT * FROM sample.users;
SELECT * FROM l9.users;



/*
2. Создайте представление, которое выводит название name товарной позиции из таблицы products 
и соответствующее название каталога name из таблицы catalogs.
*/
select * from catalogs;
select * from products;

DROP VIEW IF EXISTS banana;
CREATE VIEW banana AS
SELECT 
	p.name AS product_name,
	c.name AS product_group
FROM products p
LEFT JOIN catalogs c ON (
p.catalog_id = c.id);

SELECT * FROM banana;



/*
3. (по желанию) Пусть имеется таблица с календарным полем created_at. 
В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
если дата присутствует в исходном таблице и 0, если она отсутствует.
*/

-- get ready.
START TRANSACTION;

DROP TABLE IF EXISTS august;
CREATE TABLE august (
	created_at DATE NOT NULL
);

DELIMITER //
DROP PROCEDURE IF EXISTS insert_nums2august//
CREATE PROCEDURE insert_nums2august()
BEGIN
	DECLARE num INT DEFAULT 1;
	WHILE num <= 31 DO
		INSERT INTO august (created_at) VALUES (CONCAT("2018-08-", num));
		SET num = num + 1;
	END WHILE;
END//
DELIMITER ;
CALL insert_nums2august();

-- 
DROP TABLE IF EXISTS dates;
CREATE TABLE dates (
	created_at DATE NOT NULL
);

INSERT INTO dates (created_at) VALUES ('2018-08-01'), ('2016-08-04'), ('2018-08-16'), ('2018-08-17');

COMMIT;

-- let's start
SELECT
	august.created_at,
	CASE 
		WHEN dates.created_at IS NULL THEN '0'
		ELSE '1'
	END AS value
FROM august 
LEFT JOIN dates ON (
august.created_at = dates.created_at); 



/*
4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. 
Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
*/

START TRANSACTION;
PREPARE delete_old_lines FROM 'DELETE FROM august WHERE 1 =1 ORDER BY created_at LIMIT ?';

SET @row_count = (SELECT COUNT(*) - 5 FROM august);
EXECUTE delete_old_lines USING @row_count;

SELECT * FROM august;
COMMIT;