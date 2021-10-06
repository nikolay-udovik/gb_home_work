/*
1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello()
RETURNS VARCHAR(30) READS SQL DATA
BEGIN
	CASE  
		WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN RETURN 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND '18:00"00' THEN RETURN 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN RETURN 'Добрый вечер';   -- SOME KING OF PROBLEM WITH 00:00:00
		WHEN CURTIME() BETWEEN '00:00:00' AND '06:00:00' THEN RETURN 'Доброй ночи';
	END CASE;
END//
DELIMITER ;


SELECT hello();


/*
2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
Допустимо присутствие обоих полей или одно из них. 
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/

DELIMITER //
DROP TRIGGER IF EXISTS update_trigger;
CREATE TRIGGER update_trigger BEFORE UPDATE ON products
FOR EACH ROW BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'wooork pls';
		-- RAISEERROR('exception: name and description are emptry');
		-- ROLLBACK TRANSACTION;
	END IF;
END//
DELIMITER ;



/*
3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
Вызов функции FIBONACCI(10) должен возвращать число 55.
0  1  2  3  4  5  6  7   8   9   10
0  1  1  2  3  5  8  13  21  34  55
*/


