-- pls ignore this script

-- run again if there are duplicates

-- 5 users have friends
TRUNCATE friendship;
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (1, 1, '1975-08-02 00:11:15', '2013-08-13 20:43:52', '1975-10-07 15:41:55', '1972-08-13 06:54:14', 1);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (2, 2, '2006-06-10 14:13:34', '2015-04-27 08:11:27', '2018-02-26 00:26:54', '2012-09-20 02:51:21', 1);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (3, 3, '1980-06-10 12:50:49', '1970-11-21 07:59:11', '2002-04-25 10:59:10', '2001-06-18 20:58:02', 1);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (4, 4, '1976-12-30 06:48:24', '2006-10-26 08:46:22', '1988-11-11 22:28:20', '2001-03-03 06:10:16', 1);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (5, 5, '1982-02-22 14:21:49', '1993-05-16 09:24:55', '2003-04-13 04:06:06', '1995-09-09 17:17:42', 1);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (1, 6, '1974-06-29 08:14:53', '2021-08-28 20:18:53', '1992-05-20 09:23:03', '1970-07-15 22:04:21', 1);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (2, 7, '1980-11-18 16:25:36', '2012-07-26 08:46:51', '2012-07-23 20:28:12', '1993-12-18 00:48:37', 1);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (3, 8, '1996-07-06 06:08:06', '2008-05-26 17:25:33', '2015-12-25 19:37:07', '2012-10-21 13:29:10', 1);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (4, 9, '1974-08-05 23:22:06', '2008-07-07 00:49:23', '2001-08-30 08:45:51', '2009-09-01 15:28:24', 1);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (5, 10, '2020-10-17 14:28:18', '2013-02-22 21:28:53', '1973-08-09 17:21:43', '1978-08-13 22:05:51', 1);



update friendship 
	set 
		friend_id = FLOOR(1 + 5 * RAND())
where 1 = 1;

INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (1, 40, '1996-07-06 06:08:06', '2008-05-26 17:25:33', '2015-12-25 19:37:07', '2012-10-21 13:29:10', 2);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (1, 40, '1974-08-05 23:22:06', '2008-07-07 00:49:23', '2001-08-30 08:45:51', '2009-09-01 15:28:24', 2);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (1, 40, '2020-10-17 14:28:18', '2013-02-22 21:28:53', '1973-08-09 17:21:43', '1978-08-13 22:05:51', 2);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (1, 40, '2020-10-17 14:28:18', '2013-02-22 21:28:53', '1973-08-09 17:21:43', '1978-08-13 22:05:51', 2);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (1, 40, '2020-10-17 14:28:18', '2013-02-22 21:28:53', '1973-08-09 17:21:43', '1978-08-13 22:05:51', 2);
INSERT INTO `friendship` (`user_id`, `friend_id`, `requested_at`, `confirmed_at`, `created_at`, `updated_at`, `request_type_id`) VALUES (1, 40, '2020-10-17 14:28:18', '2013-02-22 21:28:53', '1973-08-09 17:21:43', '1978-08-13 22:05:51', 2);

update friendship 
	set 
		friend_id = FLOOR(1 + 5 * RAND())
where 1 = 1;


-- 5 users that will contact to each other
update messages set to_user_id = FLOOR(1 + 5 * RAND()) where 1 = 1; 
update messages set from_user_id = FLOOR(1 + 5 * RAND()) where 1 = 1; 

select * from friendship;
select * from messages;
