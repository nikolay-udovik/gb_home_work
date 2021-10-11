1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
------------------------

#### Client Config
```
nicholas@thinkpad:~$ cat .my.cnf 
[client]
host=192.168.122.20
user="root"
password="1"
```
#### Server Status
```
mysql> \s

mysql  Ver 8.0.25-0ubuntu0.20.10.1 for Linux on x86_64 ((Ubuntu))

Connection id:		50
Current database:	
Current user:		root@gateway
SSL:			Cipher in use is ECDHE-RSA-AES128-GCM-SHA256
Current pager:		stdout
Using outfile:		''
Using delimiter:	;
Server version:		8.0.26 MySQL Community Server - GPL
Protocol version:	10
Connection:		192.168.122.20 via TCP/IP
Server characterset:	utf8mb4
Db     characterset:	utf8mb4
Client characterset:	utf8mb4
Conn.  characterset:	utf8mb4
TCP port:		3306
Binary data as:		Hexadecimal
Uptime:			1 day 22 hours 51 min 51 sec

Threads: 2  Questions: 1912  Slow queries: 0  Opens: 620  Flush tables: 3  Open tables: 530  Queries per second avg: 0.011
```



2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
------------------------
```
mysql> CREATE DATABASE IF NOT EXISTS example;
mysql> CREATE TABLE IF NOT EXISTS example.users ( id INT, name VARCHAR(255));
mysql> DESCRIBE example.users;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | YES  |     | NULL    |       |
| name  | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)
```



3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
------------------------

#### Dump 'example'
```nicholas@thinkpad:~$ mysqldump example > example_dump.sql```

#### Create 'sample'
```
nicholas@thinkpad:~$ mysql example
mysql> CREATE DATABASE IF NOT EXISTS sample;
```

#### Restore 'sample'
```
nicholas@thinkpad:~$ mysql sample < example_dump.sql
nicholas@thinkpad:~$ mysql sample
mysql> DESCRIBE users;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | YES  |     | NULL    |       |
| name  | varchar(255) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)
```



4. Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
------------------------


Не совсем понял задание. На уроке было сказано что линии расположены в хаотичном порядке, нет никаких гарантий что при операции select дважды получим тот же результат. Поэтому в первом варианте я просто сделал дамп первых полученных 100 линий, а во втором варианте отфильтровал по PRIMARY KEY.

#### Documentation

```
nicholas@thinkpad:~$ man mysqldump

--where='where_condition', -w 'where_condition' Dump only rows selected by the given WHERE condition.
--table, -t Display output in table format.
```


#### Solution: option 1

```
nicholas@thinkpad:~$ mysqldump mysql -t help_keyword --where="1 limit 100"  > mysql_help_keyword_dump.sql
```

#### Solution: option 2

Get rows sorted by help_keyword_id

```
nicholas@thinkpad:~$ mysqldump mysql -t help_keyword --where="help_keyword_id <= 99"  > mysql_help_keyword_dump_sorted.sql
```