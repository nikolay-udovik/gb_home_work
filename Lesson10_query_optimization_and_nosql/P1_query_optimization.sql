/*
1. Создайте таблицу logs типа Archive. 
Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
название таблицы, идентификатор первичного ключа и содержимое поля name.
*/


DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	id SERIAL, 
	pk BIGINT UNSIGNED NOT NULL COMMENT 'pk of ext table',
	src_table VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL COMMENT 'src_table name field',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP()
	-- INDEX log_find (pk, source_table)        -- not supported in archive engine
	-- PRIMARY KEY (primary_key, source_table)  -- max key supported 8bytes?? :(
) ENGINE=Archive

-- note: it's not requested to alter users, catalog and products fields. 
-- so my sollution is just to create 'after trigger'


DELIMITER //
DROP TRIGGER IF EXISTS users_insert//
CREATE TRIGGER users_insert AFTER INSERT ON users 
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (src_table, pk, name) VALUES ('users', NEW.id, NEW.name);
END//

DROP TRIGGER IF EXISTS catalogs_insert//
CREATE TRIGGER catalogs_insert AFTER INSERT ON catalogs 
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (src_table, pk, name) VALUES ('catalogs', NEW.id, NEW.name);
END//

DROP TRIGGER IF EXISTS products_insert//
CREATE TRIGGER products_insert AFTER INSERT ON products
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (src_table, pk, name) VALUES ('products', NEW.id, NEW.name);
END//
DELIMITER ;


INSERT INTO users (name) VALUES ('John Smith');
INSERT INTO products (name) VALUES ('iphone3');
INSERT INTO catalogs (name) VALUES ('phones');

SELECT * FROM logs;
