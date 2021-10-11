На момент работы над дз мы имели следующую картину

```
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "идентификатор строки",
    first_name VARCHAR(100) NOT NULL COMMENT "имя пользователя",
    last_name VARCHAR(100) NOT NULL COMMENT "фамилия пользователя",
    email VARCHAR(100) NOT NULL UNIQUE COMMENT "почта",
    phone CHAR(11) NOT NULL UNIQUE COMMENT "телефон",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "время создания",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "время обновления"
) COMMENT "Пользователи";

CREATE TABLE profiles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "идентификатор строки",
    user_id INT UNSIGNED NOT NULL COMMENT "ссылка на пользователя",
    gender CHAR(1) NOT NULL COMMENT "пол",
    birthday DATE COMMENT "дата рождения",
    photo_id INT UNSIGNED COMMENT "ссылка на аватар",
    `status` VARCHAR(30) COMMENT "текущий статус",
    country VARCHAR(130) COMMENT "страна проживания",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "время создания",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "время обновления"
) COMMENT "Профили";

ALTER TABLE profiles ADD CONSTRAINT profiles_user_id FOREIGN KEY (user_id) REFERENCES users(id);
```

# Анализ
Я заметил что обе таблицы соответствуют 2NF так как:
1. Присутсвует первичный ключ и атомарность
2. Каждый атрибут зависит только от первичного ключа.


#### Проблемы которые я обнаружил/подозреваю:
- Если я правильно понял 3NF то, таблица users ей не соответствует, так как имеется тразитивная зависимость. Зная уникальный email или phone мы можем узнать и first_name и last_name. Таким образом оба эти атрибута транзитивно зависят от первичного ключа и должны быть вынесены в отдельную таблицу, или возможно в ту же таблицу profiles.
  - Так как телефон и почта могут поменять значение, новая таблица не сможет иметь внещний ключ ссылающийся на почту или телефон.
- Заметил что на данный момент использование FOREIGN_KEY в таблице profiles допускает создание нескольких линий ссылающихся на один и тот же ключ. 
  - Таким образом можно случайно/специаильно создать две и более записи ссылающихся на тот же user_id при этом остальная информация может отличаться, что может вызвать проблемы.
  - Это риск получить **аномалию обновления**.

  
# Предложения:
- атрибут status - я так понимаю речь о online или offline... Эта информация будет обновляться довольно часто, к тому же этот атрибут в описании профиля пользователя определенно лишний.
  - Решение: следует подумать вывести это куда нибудь в другую таблицу. Например user_status. 
    - Так-же эта таблица могла бы содержать информацию о текущем подключении такую как first_login, last_login, source_ip.
- тип данных в атрибутах таких как status, country ... следовало бы заменить на CHAR, чтобы оптимизировать скорость поиска.
- в таблице users отсутствует атрибут password.
  - надо понять как хранить и шифровать пароли в базе данных.
