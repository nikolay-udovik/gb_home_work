/*
Структура:
- Таблица instances_ids используется как генератор уникальных идентификаторов для сущностей содержащих контент, таких как media posts photo и др.
  - Все эти таблицы должны добавить внешний ключ к своему атбрибуту id указывающий на instances_ids(id).

- Таблица likes указывает на user_id поставившего лайк, и на контент, на который поставили лайк.

- Помоему нет смысла держать информацию created_at и updated_at для лайков. 

Заметки:
- Добавление внешнего ключа для контента: 
  `ALTER TABLE media ADD CONSTRAINT media_instance_id FOREIGN KEY (id) REFERENCES instances_ids(id);`

- Сгенерировать новый id
  `insert into instances_ids (id) values (null);

- Узнать на какой контент ставил лайки user = <id>
  `select content_id from likes where user_id = 25;`
*/


CREATE TABLE instances_ids (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'content_id' 
) COMMENT 'unique identifier for all content';


CREATE TABLE likes (
	user_id INT UNSIGNED NOT NULL COMMENT 'who liked?',
	content_id INT UNSIGNED NOT NULL COMMENT 'what liked?',
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (content_id) REFERENCES instances_ids(id),
	PRIMARY KEY (user_id, content_id)
) COMMENT 'LIKES';

ALTER TABLE media ADD CONSTRAINT media_instance_id FOREIGN KEY (id) REFERENCES instances_ids(id);
