1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.
   - key type - hash
   - key - ip address
   - value - count
```
➜  ~ docker exec -it learn-redis redis-cli
127.0.0.1:6379> select 1
127.0.0.1:6379[1]> hmset conns "192.168.0.1" 1 "172.16.0.1" 1 "169.254.0.1" 1 "10.0.0.1" 1
OK
127.0.0.1:6379[1]> hkeys conns
1) "192.168.0.1"
2) "172.16.0.1"
3) "169.254.0.1"
4) "10.0.0.1"
```
help @hash says that:
  HINCRBY key field increment
  summary: Increment the integer value of a hash field by the given number
  since: 2.0.0

```
127.0.0.1:6379[1]> hget conns 192.168.0.1
"1"
127.0.0.1:6379[1]> hincrby conns 192.168.0.1 1
(integer) 2
127.0.0.1:6379[1]> hget conns 192.168.0.1
"2"
```

2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени.
```
127.0.0.1:6379[1]> hset email_to_user foo@example.com foo
(integer) 1
127.0.0.1:6379[1]> hset email_to_user bar@example.com bar
(integer) 1
127.0.0.1:6379[1]> 
127.0.0.1:6379[1]> hget email_to_user foo@example.com
"foo"
127.0.0.1:6379[1]> 

127.0.0.1:6379[1]> hset user_to_email foo foo@example.com
(integer) 1
127.0.0.1:6379[1]> hset user_to_email bar bar@example.com
(integer) 1
127.0.0.1:6379[1]> hget user_to_email bar
"bar@example.com"
127.0.0.1:6379[1]> 
```

