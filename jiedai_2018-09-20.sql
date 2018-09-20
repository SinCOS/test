# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.3.9-MariaDB)
# Database: jiedai
# Generation Time: 2018-09-20 15:36:58 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `created_at`, `updated_at`)
VALUES
	(1,0,1,'Index','fa-bar-chart','/',NULL,NULL),
	(2,0,6,'Admin','fa-tasks','',NULL,'2018-09-15 08:03:32'),
	(3,2,7,'Users','fa-users','auth/users',NULL,'2018-09-15 08:03:32'),
	(4,2,8,'Roles','fa-user','auth/roles',NULL,'2018-09-15 08:03:32'),
	(5,2,9,'Permission','fa-ban','auth/permissions',NULL,'2018-09-15 08:03:32'),
	(6,2,10,'Menu','fa-bars','auth/menu',NULL,'2018-09-15 08:03:32'),
	(7,2,11,'Operation log','fa-history','auth/logs',NULL,'2018-09-15 08:03:32'),
	(8,0,3,'用户管理','fa-bars','users','2018-09-09 10:47:57','2018-09-15 04:48:43'),
	(9,0,4,'借贷审核','fa-money','debit-credit','2018-09-09 12:59:51','2018-09-15 04:48:43'),
	(10,0,2,'轮播图','fa-image','banner','2018-09-10 11:29:32','2018-09-15 04:48:43'),
	(11,0,5,'人工操作','fa-hand-o-up',NULL,'2018-09-15 08:03:24','2018-09-15 08:13:27'),
	(12,11,0,'充值','fa-arrow-up','/manual/charge','2018-09-15 08:14:25','2018-09-15 08:41:17'),
	(13,11,0,'扣款','fa-arrow-down','/manual/refund','2018-09-15 08:41:39','2018-09-15 08:41:39');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin','GET','127.0.0.1','[]','2018-09-09 10:38:54','2018-09-09 10:38:54'),
	(2,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:39:02','2018-09-09 10:39:02'),
	(3,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:39:05','2018-09-09 10:39:05'),
	(4,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:39:08','2018-09-09 10:39:08'),
	(5,1,'admin','GET','127.0.0.1','[]','2018-09-09 10:41:15','2018-09-09 10:41:15'),
	(6,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:41:20','2018-09-09 10:41:20'),
	(7,1,'admin','GET','127.0.0.1','[]','2018-09-09 10:41:23','2018-09-09 10:41:23'),
	(8,1,'admin','GET','127.0.0.1','[]','2018-09-09 10:41:33','2018-09-09 10:41:33'),
	(9,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:41:34','2018-09-09 10:41:34'),
	(10,1,'admin','GET','127.0.0.1','[]','2018-09-09 10:41:41','2018-09-09 10:41:41'),
	(11,1,'admin','GET','127.0.0.1','[]','2018-09-09 10:41:57','2018-09-09 10:41:57'),
	(12,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:42:00','2018-09-09 10:42:00'),
	(13,1,'admin/auth/setting','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:42:26','2018-09-09 10:42:26'),
	(14,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:42:55','2018-09-09 10:42:55'),
	(15,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:43:05','2018-09-09 10:43:05'),
	(16,1,'admin/auth/roles','GET','127.0.0.1','[]','2018-09-09 10:43:10','2018-09-09 10:43:10'),
	(17,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:43:12','2018-09-09 10:43:12'),
	(18,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:43:14','2018-09-09 10:43:14'),
	(19,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:43:18','2018-09-09 10:43:18'),
	(20,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:43:21','2018-09-09 10:43:21'),
	(21,1,'admin','GET','127.0.0.1','[]','2018-09-09 10:44:07','2018-09-09 10:44:07'),
	(22,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:44:13','2018-09-09 10:44:13'),
	(23,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:44:14','2018-09-09 10:44:14'),
	(24,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:44:15','2018-09-09 10:44:15'),
	(25,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:44:31','2018-09-09 10:44:31'),
	(26,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:45:25','2018-09-09 10:45:25'),
	(27,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:45:29','2018-09-09 10:45:29'),
	(28,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:45:34','2018-09-09 10:45:34'),
	(29,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:46:59','2018-09-09 10:46:59'),
	(30,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:47:02','2018-09-09 10:47:02'),
	(31,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:47:19','2018-09-09 10:47:19'),
	(32,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\",\"icon\":\"fa-bars\",\"uri\":\"demo\\/users\",\"roles\":[null],\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\"}','2018-09-09 10:47:57','2018-09-09 10:47:57'),
	(33,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:47:57','2018-09-09 10:47:57'),
	(34,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:48:01','2018-09-09 10:48:01'),
	(35,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:48:25','2018-09-09 10:48:25'),
	(36,1,'admin/auth/menu/8/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:48:32','2018-09-09 10:48:32'),
	(37,1,'admin/auth/menu/8','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\",\"icon\":\"fa-bars\",\"uri\":\"demo\\/users\",\"roles\":[null],\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2018-09-09 10:48:48','2018-09-09 10:48:48'),
	(38,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:48:48','2018-09-09 10:48:48'),
	(39,1,'admin/auth/menu/8/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:50:30','2018-09-09 10:50:30'),
	(40,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:50:36','2018-09-09 10:50:36'),
	(41,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:50:38','2018-09-09 10:50:38'),
	(42,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:50:41','2018-09-09 10:50:41'),
	(43,1,'admin/auth/menu/8/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:51:08','2018-09-09 10:51:08'),
	(44,1,'admin/auth/menu/8','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\",\"icon\":\"fa-bars\",\"uri\":\"demo\\/users\",\"roles\":[\"1\",null],\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2018-09-09 10:51:11','2018-09-09 10:51:11'),
	(45,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:51:11','2018-09-09 10:51:11'),
	(46,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:51:13','2018-09-09 10:51:13'),
	(47,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:51:19','2018-09-09 10:51:19'),
	(48,1,'admin/auth/menu/8/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:51:22','2018-09-09 10:51:22'),
	(49,1,'admin/auth/menu/8/edit','GET','127.0.0.1','[]','2018-09-09 10:54:27','2018-09-09 10:54:27'),
	(50,1,'admin/auth/menu/8/edit','GET','127.0.0.1','[]','2018-09-09 10:54:31','2018-09-09 10:54:31'),
	(51,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:54:36','2018-09-09 10:54:36'),
	(52,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:54:40','2018-09-09 10:54:40'),
	(53,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 10:55:14','2018-09-09 10:55:14'),
	(54,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:55:34','2018-09-09 10:55:34'),
	(55,1,'admin/auth/menu/8/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:55:39','2018-09-09 10:55:39'),
	(56,1,'admin/auth/menu/8','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"users\",\"roles\":[\"1\",null],\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2018-09-09 10:55:52','2018-09-09 10:55:52'),
	(57,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:55:52','2018-09-09 10:55:52'),
	(58,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:55:56','2018-09-09 10:55:56'),
	(59,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:56:03','2018-09-09 10:56:03'),
	(60,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2018-09-09 10:56:08','2018-09-09 10:56:08'),
	(61,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:56:08','2018-09-09 10:56:08'),
	(62,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 10:56:10','2018-09-09 10:56:10'),
	(63,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:56:13','2018-09-09 10:56:13'),
	(64,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 10:56:30','2018-09-09 10:56:30'),
	(65,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:56:39','2018-09-09 10:56:39'),
	(66,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 10:56:41','2018-09-09 10:56:41'),
	(67,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 10:59:45','2018-09-09 10:59:45'),
	(68,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 11:00:04','2018-09-09 11:00:04'),
	(69,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:00:46','2018-09-09 11:00:46'),
	(70,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:00:48','2018-09-09 11:00:48'),
	(71,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}','2018-09-09 11:00:52','2018-09-09 11:00:52'),
	(72,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:01:05','2018-09-09 11:01:05'),
	(73,1,'admin/users/1/edit','GET','127.0.0.1','[]','2018-09-09 11:01:40','2018-09-09 11:01:40'),
	(74,1,'admin/users/1','PUT','127.0.0.1','{\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}','2018-09-09 11:01:45','2018-09-09 11:01:45'),
	(75,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 11:01:45','2018-09-09 11:01:45'),
	(76,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:01:47','2018-09-09 11:01:47'),
	(77,1,'admin/users/1/edit','GET','127.0.0.1','[]','2018-09-09 11:02:33','2018-09-09 11:02:33'),
	(78,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:02:35','2018-09-09 11:02:35'),
	(79,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:05:11','2018-09-09 11:05:11'),
	(80,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:05:13','2018-09-09 11:05:13'),
	(81,1,'admin/auth/setting','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:06:29','2018-09-09 11:06:29'),
	(82,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:06:39','2018-09-09 11:06:39'),
	(83,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:06:40','2018-09-09 11:06:40'),
	(84,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:06:44','2018-09-09 11:06:44'),
	(85,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:06:45','2018-09-09 11:06:45'),
	(86,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:06:46','2018-09-09 11:06:46'),
	(87,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:08:39','2018-09-09 11:08:39'),
	(88,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:08:41','2018-09-09 11:08:41'),
	(89,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:08:44','2018-09-09 11:08:44'),
	(90,1,'admin/users','POST','127.0.0.1','{\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}','2018-09-09 11:09:36','2018-09-09 11:09:36'),
	(91,1,'admin/users/create','GET','127.0.0.1','[]','2018-09-09 11:09:36','2018-09-09 11:09:36'),
	(92,1,'admin/users/create','GET','127.0.0.1','[]','2018-09-09 11:10:32','2018-09-09 11:10:32'),
	(93,1,'admin/users/create','GET','127.0.0.1','[]','2018-09-09 11:11:42','2018-09-09 11:11:42'),
	(94,1,'admin/users/create','GET','127.0.0.1','[]','2018-09-09 11:11:52','2018-09-09 11:11:52'),
	(95,1,'admin/users/create','GET','127.0.0.1','[]','2018-09-09 11:11:56','2018-09-09 11:11:56'),
	(96,1,'admin/users','POST','127.0.0.1','{\"name\":\"ddddd\",\"email\":\"790407626@qq.com\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\"}','2018-09-09 11:12:02','2018-09-09 11:12:02'),
	(97,1,'admin/users/create','GET','127.0.0.1','[]','2018-09-09 11:12:02','2018-09-09 11:12:02'),
	(98,1,'admin/users/create','GET','127.0.0.1','[]','2018-09-09 11:12:32','2018-09-09 11:12:32'),
	(99,1,'admin/users','POST','127.0.0.1','{\"name\":\"ddddd\",\"password\":\"666666\",\"email\":\"790407626@qq.com\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\"}','2018-09-09 11:12:40','2018-09-09 11:12:40'),
	(100,1,'admin/users/create','GET','127.0.0.1','[]','2018-09-09 11:12:40','2018-09-09 11:12:40'),
	(101,1,'admin/users','POST','127.0.0.1','{\"name\":\"ddddd\",\"password\":\"666666\",\"email\":\"790407627@qq.com\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\"}','2018-09-09 11:12:58','2018-09-09 11:12:58'),
	(102,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 11:12:58','2018-09-09 11:12:58'),
	(103,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:13:02','2018-09-09 11:13:02'),
	(104,1,'admin/users/1','PUT','127.0.0.1','{\"name\":\"test\",\"password\":\"123456\",\"email\":\"790407626@qq.com\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}','2018-09-09 11:13:12','2018-09-09 11:13:12'),
	(105,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 11:13:12','2018-09-09 11:13:12'),
	(106,1,'admin/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:13:51','2018-09-09 11:13:51'),
	(107,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:13:53','2018-09-09 11:13:53'),
	(108,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:15:52','2018-09-09 11:15:52'),
	(109,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:15:52','2018-09-09 11:15:52'),
	(110,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:15:57','2018-09-09 11:15:57'),
	(111,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:16:02','2018-09-09 11:16:02'),
	(112,1,'admin/auth/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:16:04','2018-09-09 11:16:04'),
	(113,1,'admin/auth/users/1','PUT','127.0.0.1','{\"username\":\"admin\",\"name\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\\u5458\",\"password\":\"$2y$10$FDI1vRmvW\\/xit0RnJUK6duL2WgYdA.uf.Ux1FNxc7HbCEqucsUatu\",\"password_confirmation\":\"$2y$10$FDI1vRmvW\\/xit0RnJUK6duL2WgYdA.uf.Ux1FNxc7HbCEqucsUatu\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/users\"}','2018-09-09 11:16:22','2018-09-09 11:16:22'),
	(114,1,'admin/auth/users','GET','127.0.0.1','[]','2018-09-09 11:16:22','2018-09-09 11:16:22'),
	(115,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:16:26','2018-09-09 11:16:26'),
	(116,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:16:27','2018-09-09 11:16:27'),
	(117,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:16:29','2018-09-09 11:16:29'),
	(118,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 11:16:30','2018-09-09 11:16:30'),
	(119,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:26:16','2018-09-09 11:26:16'),
	(120,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:26:17','2018-09-09 11:26:17'),
	(121,1,'admin/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:26:21','2018-09-09 11:26:21'),
	(122,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:26:26','2018-09-09 11:26:26'),
	(123,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:26:28','2018-09-09 11:26:28'),
	(124,1,'admin/users/create','GET','127.0.0.1','[]','2018-09-09 11:41:30','2018-09-09 11:41:30'),
	(125,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:41:31','2018-09-09 11:41:31'),
	(126,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:41:33','2018-09-09 11:41:33'),
	(127,1,'admin/auth/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:41:58','2018-09-09 11:41:58'),
	(128,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 11:42:07','2018-09-09 11:42:07'),
	(129,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 12:59:12','2018-09-09 12:59:12'),
	(130,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u501f\\u8d37\\u5ba1\\u6838\",\"icon\":\"fa-money\",\"uri\":\"debit-credit\",\"roles\":[\"1\",null],\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\"}','2018-09-09 12:59:51','2018-09-09 12:59:51'),
	(131,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 12:59:51','2018-09-09 12:59:51'),
	(132,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 12:59:53','2018-09-09 12:59:53'),
	(133,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 12:59:55','2018-09-09 12:59:55'),
	(134,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 12:59:57','2018-09-09 12:59:57'),
	(135,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:00:06','2018-09-09 13:00:06'),
	(136,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:00:45','2018-09-09 13:00:45'),
	(137,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:01:24','2018-09-09 13:01:24'),
	(138,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:03:54','2018-09-09 13:03:54'),
	(139,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:04:07','2018-09-09 13:04:07'),
	(140,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:04:24','2018-09-09 13:04:24'),
	(141,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:04:51','2018-09-09 13:04:51'),
	(142,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:05:41','2018-09-09 13:05:41'),
	(143,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:06:33','2018-09-09 13:06:33'),
	(144,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:06:58','2018-09-09 13:06:58'),
	(145,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:07:02','2018-09-09 13:07:02'),
	(146,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:07:22','2018-09-09 13:07:22'),
	(147,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:07:55','2018-09-09 13:07:55'),
	(148,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:09:07','2018-09-09 13:09:07'),
	(149,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:09:38','2018-09-09 13:09:38'),
	(150,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:09:48','2018-09-09 13:09:48'),
	(151,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:10:50','2018-09-09 13:10:50'),
	(152,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:10:56','2018-09-09 13:10:56'),
	(153,1,'admin/debit-credit/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:11:45','2018-09-09 13:11:45'),
	(154,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:11:47','2018-09-09 13:11:47'),
	(155,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:14:37','2018-09-09 13:14:37'),
	(156,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"-1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:15:08','2018-09-09 13:15:08'),
	(157,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:15:11','2018-09-09 13:15:11'),
	(158,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:15:15','2018-09-09 13:15:15'),
	(159,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"0\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:15:35','2018-09-09 13:15:35'),
	(160,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:18:12','2018-09-09 13:18:12'),
	(161,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"0\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:18:18','2018-09-09 13:18:18'),
	(162,1,'admin/debit-credit/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:19:57','2018-09-09 13:19:57'),
	(163,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/debit-credit\"}','2018-09-09 13:20:00','2018-09-09 13:20:00'),
	(164,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:20:00','2018-09-09 13:20:00'),
	(165,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:20:03','2018-09-09 13:20:03'),
	(166,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"0\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:20:06','2018-09-09 13:20:06'),
	(167,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"-1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:20:26','2018-09-09 13:20:26'),
	(168,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:20:36','2018-09-09 13:20:36'),
	(169,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"-1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:21:07','2018-09-09 13:21:07'),
	(170,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:21:20','2018-09-09 13:21:20'),
	(171,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"-1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:21:47','2018-09-09 13:21:47'),
	(172,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:21:52','2018-09-09 13:21:52'),
	(173,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"-1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:21:58','2018-09-09 13:21:58'),
	(174,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:23:08','2018-09-09 13:23:08'),
	(175,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"-1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:23:11','2018-09-09 13:23:11'),
	(176,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:23:13','2018-09-09 13:23:13'),
	(177,1,'admin/debit-credit/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:23:16','2018-09-09 13:23:16'),
	(178,1,'admin/debit-credit/1/edit','GET','127.0.0.1','[]','2018-09-09 13:23:39','2018-09-09 13:23:39'),
	(179,1,'admin/debit-credit/1/edit','GET','127.0.0.1','[]','2018-09-09 13:24:08','2018-09-09 13:24:08'),
	(180,1,'admin/debit-credit/1/edit','GET','127.0.0.1','[]','2018-09-09 13:24:09','2018-09-09 13:24:09'),
	(181,1,'admin/debit-credit/1/edit','GET','127.0.0.1','[]','2018-09-09 13:24:19','2018-09-09 13:24:19'),
	(182,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\"}','2018-09-09 13:24:24','2018-09-09 13:24:24'),
	(183,1,'admin/debit-credit/1/edit','GET','127.0.0.1','[]','2018-09-09 13:24:24','2018-09-09 13:24:24'),
	(184,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:25:12','2018-09-09 13:25:12'),
	(185,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"-1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:25:15','2018-09-09 13:25:15'),
	(186,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:25:17','2018-09-09 13:25:17'),
	(187,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:25:21','2018-09-09 13:25:21'),
	(188,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:25:23','2018-09-09 13:25:23'),
	(189,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:25:34','2018-09-09 13:25:34'),
	(190,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"-1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:25:41','2018-09-09 13:25:41'),
	(191,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:26:38','2018-09-09 13:26:38'),
	(192,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:26:58','2018-09-09 13:26:58'),
	(193,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:27:05','2018-09-09 13:27:05'),
	(194,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:27:05','2018-09-09 13:27:05'),
	(195,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:28:07','2018-09-09 13:28:07'),
	(196,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:12','2018-09-09 13:28:12'),
	(197,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:13','2018-09-09 13:28:13'),
	(198,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:13','2018-09-09 13:28:13'),
	(199,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:28','2018-09-09 13:28:28'),
	(200,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2018-09-09 13:28:35','2018-09-09 13:28:35'),
	(201,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:35','2018-09-09 13:28:35'),
	(202,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-09 13:28:36','2018-09-09 13:28:36'),
	(203,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:39','2018-09-09 13:28:39'),
	(204,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:43','2018-09-09 13:28:43'),
	(205,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:46','2018-09-09 13:28:46'),
	(206,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:49','2018-09-09 13:28:49'),
	(207,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:52','2018-09-09 13:28:52'),
	(208,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:53','2018-09-09 13:28:53'),
	(209,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:56','2018-09-09 13:28:56'),
	(210,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:28:59','2018-09-09 13:28:59'),
	(211,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:29:00','2018-09-09 13:29:00'),
	(212,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:29:02','2018-09-09 13:29:02'),
	(213,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:07','2018-09-09 13:30:07'),
	(214,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:07','2018-09-09 13:30:07'),
	(215,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:12','2018-09-09 13:30:12'),
	(216,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:13','2018-09-09 13:30:13'),
	(217,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:14','2018-09-09 13:30:14'),
	(218,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:14','2018-09-09 13:30:14'),
	(219,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:34','2018-09-09 13:30:34'),
	(220,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:35','2018-09-09 13:30:35'),
	(221,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:36','2018-09-09 13:30:36'),
	(222,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:42','2018-09-09 13:30:42'),
	(223,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:43','2018-09-09 13:30:43'),
	(224,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:54','2018-09-09 13:30:54'),
	(225,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:30:56','2018-09-09 13:30:56'),
	(226,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:31:08','2018-09-09 13:31:08'),
	(227,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:31:09','2018-09-09 13:31:09'),
	(228,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:31:18','2018-09-09 13:31:18'),
	(229,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:31:27','2018-09-09 13:31:27'),
	(230,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:33:55','2018-09-09 13:33:55'),
	(231,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:33:56','2018-09-09 13:33:56'),
	(232,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:33:56','2018-09-09 13:33:56'),
	(233,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 13:43:41','2018-09-09 13:43:41'),
	(234,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 13:43:59','2018-09-09 13:43:59'),
	(235,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 13:44:17','2018-09-09 13:44:17'),
	(236,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:51:07','2018-09-09 13:51:07'),
	(237,1,'admin/users/1','PUT','127.0.0.1','{\"name\":\"test\",\"\\u5bc6\\u7801\":\"123456\",\"mobile\":\"790407626@qq.com\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}','2018-09-09 13:51:12','2018-09-09 13:51:12'),
	(238,1,'admin/users/1/edit','GET','127.0.0.1','[]','2018-09-09 13:51:12','2018-09-09 13:51:12'),
	(239,1,'admin/users/1','PUT','127.0.0.1','{\"name\":\"test\",\"\\u5bc6\\u7801\":\"123456\",\"mobile\":\"790407626@qq.com\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\"}','2018-09-09 13:54:19','2018-09-09 13:54:19'),
	(240,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 13:54:19','2018-09-09 13:54:19'),
	(241,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:54:27','2018-09-09 13:54:27'),
	(242,1,'admin/users/1','PUT','127.0.0.1','{\"name\":\"test\",\"password\":\"123456\",\"mobile\":\"790407626@qq.com\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}','2018-09-09 13:54:31','2018-09-09 13:54:31'),
	(243,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 13:54:31','2018-09-09 13:54:31'),
	(244,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:54:40','2018-09-09 13:54:40'),
	(245,1,'admin/users/1','PUT','127.0.0.1','{\"name\":\"test\",\"password\":\"123456\",\"mobile\":\"790407626@qq.com\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}','2018-09-09 13:54:46','2018-09-09 13:54:46'),
	(246,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 13:54:46','2018-09-09 13:54:46'),
	(247,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:55:18','2018-09-09 13:55:18'),
	(248,1,'admin/users/1','PUT','127.0.0.1','{\"name\":\"test\",\"password\":\"123456\",\"mobile\":\"790407626@qq.com\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}','2018-09-09 13:55:21','2018-09-09 13:55:21'),
	(249,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 13:55:21','2018-09-09 13:55:21'),
	(250,1,'admin/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:56:02','2018-09-09 13:56:02'),
	(251,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:56:45','2018-09-09 13:56:45'),
	(252,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:56:46','2018-09-09 13:56:46'),
	(253,1,'admin/debit-credit/1','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"LZRiuRPu03hDskJu4Qb7HrF2SYhQ0THvQpNxRE1d\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-09 13:56:52','2018-09-09 13:56:52'),
	(254,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-09 13:56:53','2018-09-09 13:56:53'),
	(255,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:57:37','2018-09-09 13:57:37'),
	(256,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:57:37','2018-09-09 13:57:37'),
	(257,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:57:39','2018-09-09 13:57:39'),
	(258,1,'admin/auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:57:41','2018-09-09 13:57:41'),
	(259,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-09 13:58:10','2018-09-09 13:58:10'),
	(260,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 13:58:11','2018-09-09 13:58:11'),
	(261,1,'admin/users','GET','127.0.0.1','[]','2018-09-09 15:01:21','2018-09-09 15:01:21'),
	(262,1,'admin/users','GET','127.0.0.1','[]','2018-09-10 11:28:58','2018-09-10 11:28:58'),
	(263,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:29:01','2018-09-10 11:29:01'),
	(264,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u8f6e\\u64ad\\u56fe\",\"icon\":\"fa-image\",\"uri\":\"banner\",\"roles\":[\"1\",null],\"_token\":\"rLOvgy2C0BbbH5yVPTe2I32JMdOFwlRHRcuTClIw\"}','2018-09-10 11:29:32','2018-09-10 11:29:32'),
	(265,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-10 11:29:32','2018-09-10 11:29:32'),
	(266,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-10 11:29:34','2018-09-10 11:29:34'),
	(267,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:30:09','2018-09-10 11:30:09'),
	(268,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:30:11','2018-09-10 11:30:11'),
	(269,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:30:31','2018-09-10 11:30:31'),
	(270,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:30:36','2018-09-10 11:30:36'),
	(271,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:30:54','2018-09-10 11:30:54'),
	(272,1,'admin/banner/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:30:56','2018-09-10 11:30:56'),
	(273,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:32:57','2018-09-10 11:32:57'),
	(274,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:33:11','2018-09-10 11:33:11'),
	(275,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:33:21','2018-09-10 11:33:21'),
	(276,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:33:24','2018-09-10 11:33:24'),
	(277,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:35:38','2018-09-10 11:35:38'),
	(278,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:36:02','2018-09-10 11:36:02'),
	(279,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:36:03','2018-09-10 11:36:03'),
	(280,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:36:20','2018-09-10 11:36:20'),
	(281,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:36:22','2018-09-10 11:36:22'),
	(282,1,'admin/banner/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:36:27','2018-09-10 11:36:27'),
	(283,1,'admin/banner','POST','127.0.0.1','{\"link\":\"http:\\/\\/www.baidu.com\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"rLOvgy2C0BbbH5yVPTe2I32JMdOFwlRHRcuTClIw\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banner\"}','2018-09-10 11:36:41','2018-09-10 11:36:41'),
	(284,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:36:41','2018-09-10 11:36:41'),
	(285,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:41:04','2018-09-10 11:41:04'),
	(286,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:41:07','2018-09-10 11:41:07'),
	(287,1,'admin/banner','POST','127.0.0.1','{\"link\":\"http:\\/\\/www.baidu.com\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"rLOvgy2C0BbbH5yVPTe2I32JMdOFwlRHRcuTClIw\"}','2018-09-10 11:43:10','2018-09-10 11:43:10'),
	(288,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:43:10','2018-09-10 11:43:10'),
	(289,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:43:12','2018-09-10 11:43:12'),
	(290,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:44:55','2018-09-10 11:44:55'),
	(291,1,'admin/banner/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:44:57','2018-09-10 11:44:57'),
	(292,1,'admin/banner','POST','127.0.0.1','{\"link\":\"ddd\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"rLOvgy2C0BbbH5yVPTe2I32JMdOFwlRHRcuTClIw\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/banner\"}','2018-09-10 11:45:05','2018-09-10 11:45:05'),
	(293,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-10 11:45:05','2018-09-10 11:45:05'),
	(294,1,'admin/banner','POST','127.0.0.1','{\"link\":\"ddd\",\"sort\":\"0\",\"status\":\"on\",\"_token\":\"rLOvgy2C0BbbH5yVPTe2I32JMdOFwlRHRcuTClIw\"}','2018-09-10 11:45:17','2018-09-10 11:45:17'),
	(295,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:45:17','2018-09-10 11:45:17'),
	(296,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:45:27','2018-09-10 11:45:27'),
	(297,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:51:21','2018-09-10 11:51:21'),
	(298,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:51:22','2018-09-10 11:51:22'),
	(299,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:51:43','2018-09-10 11:51:43'),
	(300,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:53:08','2018-09-10 11:53:08'),
	(301,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:53:46','2018-09-10 11:53:46'),
	(302,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:54:00','2018-09-10 11:54:00'),
	(303,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:54:01','2018-09-10 11:54:01'),
	(304,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:55:39','2018-09-10 11:55:39'),
	(305,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:55:46','2018-09-10 11:55:46'),
	(306,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:56:15','2018-09-10 11:56:15'),
	(307,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:56:30','2018-09-10 11:56:30'),
	(308,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:56:31','2018-09-10 11:56:31'),
	(309,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:56:39','2018-09-10 11:56:39'),
	(310,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:56:49','2018-09-10 11:56:49'),
	(311,1,'admin/banner','GET','127.0.0.1','[]','2018-09-10 11:57:03','2018-09-10 11:57:03'),
	(312,1,'admin/banner/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:57:06','2018-09-10 11:57:06'),
	(313,1,'admin/banner/1/edit','GET','127.0.0.1','[]','2018-09-10 11:57:20','2018-09-10 11:57:20'),
	(314,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:57:22','2018-09-10 11:57:22'),
	(315,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:57:25','2018-09-10 11:57:25'),
	(316,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:57:25','2018-09-10 11:57:25'),
	(317,1,'admin','GET','127.0.0.1','[]','2018-09-15 04:45:30','2018-09-15 04:45:30'),
	(318,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:45:32','2018-09-15 04:45:32'),
	(319,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:45:34','2018-09-15 04:45:34'),
	(320,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:45:35','2018-09-15 04:45:35'),
	(321,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:45:37','2018-09-15 04:45:37'),
	(322,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:45:37','2018-09-15 04:45:37'),
	(323,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:45:38','2018-09-15 04:45:38'),
	(324,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:45:42','2018-09-15 04:45:42'),
	(325,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:46:09','2018-09-15 04:46:09'),
	(326,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:46:10','2018-09-15 04:46:10'),
	(327,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:46:21','2018-09-15 04:46:21'),
	(328,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:46:32','2018-09-15 04:46:32'),
	(329,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:46:33','2018-09-15 04:46:33'),
	(330,1,'admin/debit-credit/1','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 04:46:49','2018-09-15 04:46:49'),
	(331,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:46:49','2018-09-15 04:46:49'),
	(332,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 04:47:13','2018-09-15 04:47:13'),
	(333,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:47:16','2018-09-15 04:47:16'),
	(334,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:47:16','2018-09-15 04:47:16'),
	(335,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:47:17','2018-09-15 04:47:17'),
	(336,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:47:20','2018-09-15 04:47:20'),
	(337,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:09','2018-09-15 04:48:09'),
	(338,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:10','2018-09-15 04:48:10'),
	(339,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:11','2018-09-15 04:48:11'),
	(340,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:12','2018-09-15 04:48:12'),
	(341,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:13','2018-09-15 04:48:13'),
	(342,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:13','2018-09-15 04:48:13'),
	(343,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:29','2018-09-15 04:48:29'),
	(344,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:30','2018-09-15 04:48:30'),
	(345,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:31','2018-09-15 04:48:31'),
	(346,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:33','2018-09-15 04:48:33'),
	(347,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:33','2018-09-15 04:48:33'),
	(348,1,'admin/banner','GET','127.0.0.1','[]','2018-09-15 04:48:36','2018-09-15 04:48:36'),
	(349,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:39','2018-09-15 04:48:39'),
	(350,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2018-09-15 04:48:43','2018-09-15 04:48:43'),
	(351,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:43','2018-09-15 04:48:43'),
	(352,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-15 04:48:45','2018-09-15 04:48:45'),
	(353,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:47','2018-09-15 04:48:47'),
	(354,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:47','2018-09-15 04:48:47'),
	(355,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:48:48','2018-09-15 04:48:48'),
	(356,1,'admin/debit-credit/2','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"1\",\"pk\":\"2\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-15 04:48:59','2018-09-15 04:48:59'),
	(357,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 04:49:01','2018-09-15 04:49:01'),
	(358,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:54:22','2018-09-15 04:54:22'),
	(359,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 04:54:23','2018-09-15 04:54:23'),
	(360,1,'admin/debit-credit/12','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"1\",\"pk\":\"12\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-15 04:54:30','2018-09-15 04:54:30'),
	(361,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:00:35','2018-09-15 05:00:35'),
	(362,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:00:44','2018-09-15 05:00:44'),
	(363,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:01:10','2018-09-15 05:01:10'),
	(364,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:01:45','2018-09-15 05:01:45'),
	(365,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:01:46','2018-09-15 05:01:46'),
	(366,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:01:59','2018-09-15 05:01:59'),
	(367,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:02:59','2018-09-15 05:02:59'),
	(368,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:03:28','2018-09-15 05:03:28'),
	(369,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:03:48','2018-09-15 05:03:48'),
	(370,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:03:57','2018-09-15 05:03:57'),
	(371,1,'admin/debit-credit/11','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"1\",\"pk\":\"11\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-15 05:04:49','2018-09-15 05:04:49'),
	(372,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:16:55','2018-09-15 05:16:55'),
	(373,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:16:57','2018-09-15 05:16:57'),
	(374,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:17:55','2018-09-15 05:17:55'),
	(375,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:20:04','2018-09-15 05:20:04'),
	(376,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:20:14','2018-09-15 05:20:14'),
	(377,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:20:24','2018-09-15 05:20:24'),
	(378,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:20:28','2018-09-15 05:20:28'),
	(379,1,'admin/users/1/edit','GET','127.0.0.1','[]','2018-09-15 05:20:47','2018-09-15 05:20:47'),
	(380,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:20:52','2018-09-15 05:20:52'),
	(381,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:20:54','2018-09-15 05:20:54'),
	(382,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:20:54','2018-09-15 05:20:54'),
	(383,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:20:56','2018-09-15 05:20:56'),
	(384,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 05:23:52','2018-09-15 05:23:52'),
	(385,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:23:54','2018-09-15 05:23:54'),
	(386,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:23:56','2018-09-15 05:23:56'),
	(387,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:23:59','2018-09-15 05:23:59'),
	(388,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:24:00','2018-09-15 05:24:00'),
	(389,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:24:33','2018-09-15 05:24:33'),
	(390,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:24:34','2018-09-15 05:24:34'),
	(391,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:24:35','2018-09-15 05:24:35'),
	(392,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:24:36','2018-09-15 05:24:36'),
	(393,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:24:42','2018-09-15 05:24:42'),
	(394,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:24:43','2018-09-15 05:24:43'),
	(395,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:24:44','2018-09-15 05:24:44'),
	(396,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:24:45','2018-09-15 05:24:45'),
	(397,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:24:45','2018-09-15 05:24:45'),
	(398,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:24:51','2018-09-15 05:24:51'),
	(399,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:25:06','2018-09-15 05:25:06'),
	(400,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:25:06','2018-09-15 05:25:06'),
	(401,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 05:25:07','2018-09-15 05:25:07'),
	(402,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:25:08','2018-09-15 05:25:08'),
	(403,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:25:10','2018-09-15 05:25:10'),
	(404,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:25:10','2018-09-15 05:25:10'),
	(405,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:25:11','2018-09-15 05:25:11'),
	(406,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:25:12','2018-09-15 05:25:12'),
	(407,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:25:13','2018-09-15 05:25:13'),
	(408,1,'admin/banner','GET','127.0.0.1','[]','2018-09-15 05:25:26','2018-09-15 05:25:26'),
	(409,1,'admin/banner','GET','127.0.0.1','[]','2018-09-15 05:25:27','2018-09-15 05:25:27'),
	(410,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 05:25:29','2018-09-15 05:25:29'),
	(411,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":\"3\"}','2018-09-15 05:25:46','2018-09-15 05:25:46'),
	(412,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null}','2018-09-15 05:25:54','2018-09-15 05:25:54'),
	(413,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 07:05:36','2018-09-15 07:05:36'),
	(414,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 07:09:38','2018-09-15 07:09:38'),
	(415,1,'admin/debit-credit/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 07:09:39','2018-09-15 07:09:39'),
	(416,1,'admin/debit-credit/2/edit','GET','127.0.0.1','[]','2018-09-15 07:09:50','2018-09-15 07:09:50'),
	(417,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 07:09:54','2018-09-15 07:09:54'),
	(418,1,'admin/debit-credit/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 07:09:56','2018-09-15 07:09:56'),
	(419,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:10:16','2018-09-15 07:10:16'),
	(420,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:12:58','2018-09-15 07:12:58'),
	(421,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:14:53','2018-09-15 07:14:53'),
	(422,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:15:04','2018-09-15 07:15:04'),
	(423,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:16:32','2018-09-15 07:16:32'),
	(424,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:19:27','2018-09-15 07:19:27'),
	(425,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:19:53','2018-09-15 07:19:53'),
	(426,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:20:24','2018-09-15 07:20:24'),
	(427,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:20:48','2018-09-15 07:20:48'),
	(428,1,'admin/debit-credit/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 07:20:58','2018-09-15 07:20:58'),
	(429,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:21:00','2018-09-15 07:21:00'),
	(430,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:21:13','2018-09-15 07:21:13'),
	(431,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:23:32','2018-09-15 07:23:32'),
	(432,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:24:33','2018-09-15 07:24:33'),
	(433,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:25:11','2018-09-15 07:25:11'),
	(434,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:26:03','2018-09-15 07:26:03'),
	(435,1,'admin/debit-credit/6','PUT','127.0.0.1','{\"lv\":\"10\",\"status\":\"on\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_method\":\"PUT\"}','2018-09-15 07:27:17','2018-09-15 07:27:17'),
	(436,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:27:17','2018-09-15 07:27:17'),
	(437,1,'admin/debit-credit/6/edit','GET','127.0.0.1','[]','2018-09-15 07:27:31','2018-09-15 07:27:31'),
	(438,1,'admin/debit-credit/6','PUT','127.0.0.1','{\"ll\":\"10\",\"status\":\"on\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_method\":\"PUT\"}','2018-09-15 07:27:36','2018-09-15 07:27:36'),
	(439,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 07:27:36','2018-09-15 07:27:36'),
	(440,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 07:32:51','2018-09-15 07:32:51'),
	(441,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 07:33:15','2018-09-15 07:33:15'),
	(442,1,'admin/debit-credit','GET','127.0.0.1','{\"id\":null,\"status\":\"0\",\"_pjax\":\"#pjax-container\"}','2018-09-15 07:33:20','2018-09-15 07:33:20'),
	(443,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"1\"}','2018-09-15 07:33:27','2018-09-15 07:33:27'),
	(444,1,'admin/debit-credit','GET','127.0.0.1','{\"id\":null,\"status\":\"1\"}','2018-09-15 07:34:14','2018-09-15 07:34:14'),
	(445,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 07:34:16','2018-09-15 07:34:16'),
	(446,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 07:34:18','2018-09-15 07:34:18'),
	(447,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 07:34:19','2018-09-15 07:34:19'),
	(448,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 07:34:29','2018-09-15 07:34:29'),
	(449,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 07:34:58','2018-09-15 07:34:58'),
	(450,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 07:36:01','2018-09-15 07:36:01'),
	(451,1,'admin/debit-credit','GET','127.0.0.1','{\"id\":null,\"status\":\"1\",\"_pjax\":\"#pjax-container\"}','2018-09-15 07:36:09','2018-09-15 07:36:09'),
	(452,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"0\"}','2018-09-15 07:36:18','2018-09-15 07:36:18'),
	(453,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"-1\"}','2018-09-15 07:36:24','2018-09-15 07:36:24'),
	(454,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"1\"}','2018-09-15 07:36:27','2018-09-15 07:36:27'),
	(455,1,'admin/debit-credit','GET','127.0.0.1','{\"id\":null,\"status\":\"1\"}','2018-09-15 07:36:51','2018-09-15 07:36:51'),
	(456,1,'admin/debit-credit','GET','127.0.0.1','{\"id\":null,\"status\":\"-1\",\"_pjax\":\"#pjax-container\"}','2018-09-15 07:37:11','2018-09-15 07:37:11'),
	(457,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"0\"}','2018-09-15 07:37:15','2018-09-15 07:37:15'),
	(458,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:02:48','2018-09-15 08:02:48'),
	(459,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u4eba\\u5de5\\u64cd\\u4f5c\",\"icon\":\"fa-hand-o-up\",\"uri\":\"manual\",\"roles\":[\"1\",null],\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:03:24','2018-09-15 08:03:24'),
	(460,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-15 08:03:24','2018-09-15 08:03:24'),
	(461,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":11},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2018-09-15 08:03:32','2018-09-15 08:03:32'),
	(462,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:03:32','2018-09-15 08:03:32'),
	(463,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-15 08:03:34','2018-09-15 08:03:34'),
	(464,1,'admin/manual','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:03:37','2018-09-15 08:03:37'),
	(465,1,'admin/manual/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:03:44','2018-09-15 08:03:44'),
	(466,1,'admin/manual','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:03:50','2018-09-15 08:03:50'),
	(467,1,'admin/manual/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:04:02','2018-09-15 08:04:02'),
	(468,1,'admin/manual/0/edit','GET','127.0.0.1','[]','2018-09-15 08:04:06','2018-09-15 08:04:06'),
	(469,1,'admin/manual/1/edit','GET','127.0.0.1','[]','2018-09-15 08:04:09','2018-09-15 08:04:09'),
	(470,1,'admin/manual','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:04:10','2018-09-15 08:04:10'),
	(471,1,'admin/manual','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:04:21','2018-09-15 08:04:21'),
	(472,1,'admin/manual/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:04:26','2018-09-15 08:04:26'),
	(473,1,'admin/manual','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:04:34','2018-09-15 08:04:34'),
	(474,1,'admin/manual/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:04:36','2018-09-15 08:04:36'),
	(475,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:05:41','2018-09-15 08:05:41'),
	(476,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:05:47','2018-09-15 08:05:47'),
	(477,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:05:51','2018-09-15 08:05:51'),
	(478,1,'admin','GET','127.0.0.1','[]','2018-09-15 08:13:13','2018-09-15 08:13:13'),
	(479,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:13:16','2018-09-15 08:13:16'),
	(480,1,'admin/auth/menu/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:13:22','2018-09-15 08:13:22'),
	(481,1,'admin/auth/menu/11','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u4eba\\u5de5\\u64cd\\u4f5c\",\"icon\":\"fa-hand-o-up\",\"uri\":null,\"roles\":[\"1\",null],\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2018-09-15 08:13:27','2018-09-15 08:13:27'),
	(482,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-15 08:13:27','2018-09-15 08:13:27'),
	(483,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"11\",\"title\":\"\\u5145\\u503c\",\"icon\":\"fa-amazon\",\"uri\":\"\\/manual\\/charge\",\"roles\":[\"1\",null],\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:14:25','2018-09-15 08:14:25'),
	(484,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-15 08:14:25','2018-09-15 08:14:25'),
	(485,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-15 08:14:28','2018-09-15 08:14:28'),
	(486,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:14:30','2018-09-15 08:14:30'),
	(487,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:14:59','2018-09-15 08:14:59'),
	(488,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:15:20','2018-09-15 08:15:20'),
	(489,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:15:41','2018-09-15 08:15:41'),
	(490,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:15:46','2018-09-15 08:15:46'),
	(491,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:15:51','2018-09-15 08:15:51'),
	(492,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:16:39','2018-09-15 08:16:39'),
	(493,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:18:57','2018-09-15 08:18:57'),
	(494,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:19:01','2018-09-15 08:19:01'),
	(495,1,'admin/banner/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:19:03','2018-09-15 08:19:03'),
	(496,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-15 08:19:05','2018-09-15 08:19:05'),
	(497,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:22:50','2018-09-15 08:22:50'),
	(498,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"4\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:22:56','2018-09-15 08:22:56'),
	(499,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:22:57','2018-09-15 08:22:57'),
	(500,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"4\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:24:25','2018-09-15 08:24:25'),
	(501,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:24:25','2018-09-15 08:24:25'),
	(502,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test001\",\"money\":\"0\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:26:00','2018-09-15 08:26:00'),
	(503,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:26:00','2018-09-15 08:26:00'),
	(504,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test001\",\"money\":\"0\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:26:10','2018-09-15 08:26:10'),
	(505,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:26:10','2018-09-15 08:26:10'),
	(506,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test001\",\"money\":\"0\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:27:09','2018-09-15 08:27:09'),
	(507,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:27:09','2018-09-15 08:27:09'),
	(508,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"0\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:27:57','2018-09-15 08:27:57'),
	(509,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:27:57','2018-09-15 08:27:57'),
	(510,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"0\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:28:02','2018-09-15 08:28:02'),
	(511,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:28:02','2018-09-15 08:28:02'),
	(512,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"1\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:29:12','2018-09-15 08:29:12'),
	(513,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:29:12','2018-09-15 08:29:12'),
	(514,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"0\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:29:41','2018-09-15 08:29:41'),
	(515,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:29:41','2018-09-15 08:29:41'),
	(516,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"1\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:29:44','2018-09-15 08:29:44'),
	(517,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:29:44','2018-09-15 08:29:44'),
	(518,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:30:00','2018-09-15 08:30:00'),
	(519,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:30:01','2018-09-15 08:30:01'),
	(520,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null,\"status\":\"0\"}','2018-09-15 08:30:08','2018-09-15 08:30:08'),
	(521,1,'admin/debit-credit/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:30:12','2018-09-15 08:30:12'),
	(522,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:30:20','2018-09-15 08:30:20'),
	(523,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:30:25','2018-09-15 08:30:25'),
	(524,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:30:26','2018-09-15 08:30:26'),
	(525,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:30:28','2018-09-15 08:30:28'),
	(526,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"1\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:31:39','2018-09-15 08:31:39'),
	(527,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:32:59','2018-09-15 08:32:59'),
	(528,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"1\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:33:05','2018-09-15 08:33:05'),
	(529,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:33:07','2018-09-15 08:33:07'),
	(530,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"100\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:33:19','2018-09-15 08:33:19'),
	(531,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:33:21','2018-09-15 08:33:21'),
	(532,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:34:52','2018-09-15 08:34:52'),
	(533,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":null,\"money\":\"-5\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:34:56','2018-09-15 08:34:56'),
	(534,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:34:56','2018-09-15 08:34:56'),
	(535,1,'admin/banner/create','GET','127.0.0.1','[]','2018-09-15 08:35:42','2018-09-15 08:35:42'),
	(536,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:35:44','2018-09-15 08:35:44'),
	(537,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:35:50','2018-09-15 08:35:50'),
	(538,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:35:52','2018-09-15 08:35:52'),
	(539,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:36:08','2018-09-15 08:36:08'),
	(540,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:36:17','2018-09-15 08:36:17'),
	(541,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:36:30','2018-09-15 08:36:30'),
	(542,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:37:02','2018-09-15 08:37:02'),
	(543,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"d\",\"money\":\"0\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:37:05','2018-09-15 08:37:05'),
	(544,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:37:05','2018-09-15 08:37:05'),
	(545,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:37:10','2018-09-15 08:37:10'),
	(546,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"min\",\"money\":\"0\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:37:18','2018-09-15 08:37:18'),
	(547,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:37:18','2018-09-15 08:37:18'),
	(548,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:37:45','2018-09-15 08:37:45'),
	(549,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:38:01','2018-09-15 08:38:01'),
	(550,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"100\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:38:06','2018-09-15 08:38:06'),
	(551,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:38:07','2018-09-15 08:38:07'),
	(552,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:38:08','2018-09-15 08:38:08'),
	(553,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:38:09','2018-09-15 08:38:09'),
	(554,1,'admin/manual/charge','GET','127.0.0.1','[]','2018-09-15 08:40:44','2018-09-15 08:40:44'),
	(555,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:41:03','2018-09-15 08:41:03'),
	(556,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:41:07','2018-09-15 08:41:07'),
	(557,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"11\",\"title\":\"\\u5145\\u503c\",\"icon\":\"fa-arrow-up\",\"uri\":\"\\/manual\\/charge\",\"roles\":[\"1\",null],\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2018-09-15 08:41:17','2018-09-15 08:41:17'),
	(558,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-15 08:41:17','2018-09-15 08:41:17'),
	(559,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"11\",\"title\":\"\\u6263\\u6b3e\",\"icon\":\"fa-arrow-down\",\"uri\":\"\\/manual\\/refund\",\"roles\":[\"1\",null],\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:41:39','2018-09-15 08:41:39'),
	(560,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-15 08:41:39','2018-09-15 08:41:39'),
	(561,1,'admin/auth/menu','GET','127.0.0.1','[]','2018-09-15 08:41:44','2018-09-15 08:41:44'),
	(562,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:42:13','2018-09-15 08:42:13'),
	(563,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:42:27','2018-09-15 08:42:27'),
	(564,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:43:03','2018-09-15 08:43:03'),
	(565,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:43:09','2018-09-15 08:43:09'),
	(566,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:43:38','2018-09-15 08:43:38'),
	(567,1,'admin/manual/refund','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"-4\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:43:54','2018-09-15 08:43:54'),
	(568,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:43:54','2018-09-15 08:43:54'),
	(569,1,'admin/manual/refund','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"-4\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:44:11','2018-09-15 08:44:11'),
	(570,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:44:11','2018-09-15 08:44:11'),
	(571,1,'admin/manual/refund','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"-4\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:44:26','2018-09-15 08:44:26'),
	(572,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:44:27','2018-09-15 08:44:27'),
	(573,1,'admin/manual/refund','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"99\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:44:47','2018-09-15 08:44:47'),
	(574,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:44:47','2018-09-15 08:44:47'),
	(575,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:47:26','2018-09-15 08:47:26'),
	(576,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:47:27','2018-09-15 08:47:27'),
	(577,1,'admin/manual/refund','POST','127.0.0.1','{\"name\":null,\"money\":\"0\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:47:33','2018-09-15 08:47:33'),
	(578,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:47:33','2018-09-15 08:47:33'),
	(579,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:48:30','2018-09-15 08:48:30'),
	(580,1,'admin/manual/refund','POST','127.0.0.1','{\"name\":\"test\",\"money\":\"-100.00\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 08:48:42','2018-09-15 08:48:42'),
	(581,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:48:43','2018-09-15 08:48:43'),
	(582,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:49:07','2018-09-15 08:49:07'),
	(583,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:49:08','2018-09-15 08:49:08'),
	(584,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:49:10','2018-09-15 08:49:10'),
	(585,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:49:12','2018-09-15 08:49:12'),
	(586,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:49:20','2018-09-15 08:49:20'),
	(587,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:49:22','2018-09-15 08:49:22'),
	(588,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:49:24','2018-09-15 08:49:24'),
	(589,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:49:25','2018-09-15 08:49:25'),
	(590,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:50:48','2018-09-15 08:50:48'),
	(591,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:51:15','2018-09-15 08:51:15'),
	(592,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:51:22','2018-09-15 08:51:22'),
	(593,1,'admin/manual/refund','GET','127.0.0.1','[]','2018-09-15 08:51:41','2018-09-15 08:51:41'),
	(594,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:51:44','2018-09-15 08:51:44'),
	(595,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:51:45','2018-09-15 08:51:45'),
	(596,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:51:46','2018-09-15 08:51:46'),
	(597,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:51:48','2018-09-15 08:51:48'),
	(598,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:53:20','2018-09-15 08:53:20'),
	(599,1,'admin/debit-credit/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:53:24','2018-09-15 08:53:24'),
	(600,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:53:27','2018-09-15 08:53:27'),
	(601,1,'admin/debit-credit/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:53:30','2018-09-15 08:53:30'),
	(602,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:53:37','2018-09-15 08:53:37'),
	(603,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:53:37','2018-09-15 08:53:37'),
	(604,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:55:59','2018-09-15 08:55:59'),
	(605,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:56:05','2018-09-15 08:56:05'),
	(606,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:56:07','2018-09-15 08:56:07'),
	(607,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:56:38','2018-09-15 08:56:38'),
	(608,1,'admin','GET','127.0.0.1','[]','2018-09-15 08:56:44','2018-09-15 08:56:44'),
	(609,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:56:45','2018-09-15 08:56:45'),
	(610,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 08:56:47','2018-09-15 08:56:47'),
	(611,1,'admin','GET','127.0.0.1','[]','2018-09-15 09:01:31','2018-09-15 09:01:31'),
	(612,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 09:01:34','2018-09-15 09:01:34'),
	(613,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 09:01:36','2018-09-15 09:01:36'),
	(614,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 09:01:37','2018-09-15 09:01:37'),
	(615,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 09:01:39','2018-09-15 09:01:39'),
	(616,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 09:05:36','2018-09-15 09:05:36'),
	(617,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 09:06:39','2018-09-15 09:06:39'),
	(618,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 09:06:58','2018-09-15 09:06:58'),
	(619,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 17:08:39','2018-09-15 17:08:39'),
	(620,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 17:09:02','2018-09-15 17:09:02'),
	(621,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 17:09:03','2018-09-15 17:09:03'),
	(622,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 17:09:03','2018-09-15 17:09:03'),
	(623,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 17:09:35','2018-09-15 17:09:35'),
	(624,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 17:09:36','2018-09-15 17:09:36'),
	(625,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 17:10:09','2018-09-15 17:10:09'),
	(626,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 17:10:18','2018-09-15 17:10:18'),
	(627,1,'admin/debit-credit/20/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:10:36','2018-09-15 17:10:36'),
	(628,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:10:44','2018-09-15 17:10:44'),
	(629,1,'admin/debit-credit/4','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 17:10:50','2018-09-15 17:10:50'),
	(630,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:10:50','2018-09-15 17:10:50'),
	(631,1,'admin/debit-credit/7','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 17:10:52','2018-09-15 17:10:52'),
	(632,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:10:52','2018-09-15 17:10:52'),
	(633,1,'admin/debit-credit/9','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 17:10:58','2018-09-15 17:10:58'),
	(634,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:10:58','2018-09-15 17:10:58'),
	(635,1,'admin/debit-credit/10','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 17:11:01','2018-09-15 17:11:01'),
	(636,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:11:01','2018-09-15 17:11:01'),
	(637,1,'admin/debit-credit/8','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 17:11:04','2018-09-15 17:11:04'),
	(638,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:11:04','2018-09-15 17:11:04'),
	(639,1,'admin/debit-credit/3','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 17:11:08','2018-09-15 17:11:08'),
	(640,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:11:08','2018-09-15 17:11:08'),
	(641,1,'admin/debit-credit/2','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\"}','2018-09-15 17:11:12','2018-09-15 17:11:12'),
	(642,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:11:12','2018-09-15 17:11:12'),
	(643,1,'admin/debit-credit/20','PUT','127.0.0.1','{\"name\":\"status\",\"value\":\"1\",\"pk\":\"20\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_editable\":\"1\",\"_method\":\"PUT\"}','2018-09-15 17:11:19','2018-09-15 17:11:19'),
	(644,1,'admin/debit-credit/20/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:11:21','2018-09-15 17:11:21'),
	(645,1,'admin/debit-credit/20','PUT','127.0.0.1','{\"ll\":\"10\",\"status\":\"on\",\"_token\":\"uRlQWWA1IP9p0MzUhdUUxvmN7pnHKczCY3Ioe5fj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/debit-credit\"}','2018-09-15 17:11:26','2018-09-15 17:11:26'),
	(646,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-15 17:11:26','2018-09-15 17:11:26'),
	(647,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:00','2018-09-15 17:19:00'),
	(648,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:03','2018-09-15 17:19:03'),
	(649,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:04','2018-09-15 17:19:04'),
	(650,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:05','2018-09-15 17:19:05'),
	(651,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:06','2018-09-15 17:19:06'),
	(652,1,'admin/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:08','2018-09-15 17:19:08'),
	(653,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:10','2018-09-15 17:19:10'),
	(654,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:11','2018-09-15 17:19:11'),
	(655,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:12','2018-09-15 17:19:12'),
	(656,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-15 17:19:12','2018-09-15 17:19:12'),
	(657,1,'admin/users','GET','127.0.0.1','[]','2018-09-15 17:21:56','2018-09-15 17:21:56'),
	(658,1,'admin','GET','127.0.0.1','[]','2018-09-19 22:16:25','2018-09-19 22:16:25'),
	(659,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:16:27','2018-09-19 22:16:27'),
	(660,1,'admin/debit-credit/22/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:16:33','2018-09-19 22:16:33'),
	(661,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:20:37','2018-09-19 22:20:37'),
	(662,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:22:48','2018-09-19 22:22:48'),
	(663,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:24:58','2018-09-19 22:24:58'),
	(664,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:25:03','2018-09-19 22:25:03'),
	(665,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:25:26','2018-09-19 22:25:26'),
	(666,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:25:31','2018-09-19 22:25:31'),
	(667,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:28:49','2018-09-19 22:28:49'),
	(668,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:29:07','2018-09-19 22:29:07'),
	(669,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:29:35','2018-09-19 22:29:35'),
	(670,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:29:42','2018-09-19 22:29:42'),
	(671,1,'admin/debit-credit/22/edit','GET','127.0.0.1','[]','2018-09-19 22:29:51','2018-09-19 22:29:51'),
	(672,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"ll\":\"0\",\"status\":\"1\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:30:01','2018-09-19 22:30:01'),
	(673,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-19 22:30:01','2018-09-19 22:30:01'),
	(674,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-19 22:30:17','2018-09-19 22:30:17'),
	(675,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-19 22:30:18','2018-09-19 22:30:18'),
	(676,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-19 22:30:28','2018-09-19 22:30:28'),
	(677,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-19 22:32:12','2018-09-19 22:32:12'),
	(678,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:14','2018-09-19 22:32:14'),
	(679,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:15','2018-09-19 22:32:15'),
	(680,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:25','2018-09-19 22:32:25'),
	(681,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:25','2018-09-19 22:32:25'),
	(682,1,'admin/debit-credit/21','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:26','2018-09-19 22:32:26'),
	(683,1,'admin/debit-credit/21','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:27','2018-09-19 22:32:27'),
	(684,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:28','2018-09-19 22:32:28'),
	(685,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:29','2018-09-19 22:32:29'),
	(686,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:32','2018-09-19 22:32:32'),
	(687,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:32:36','2018-09-19 22:32:36'),
	(688,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:33:11','2018-09-19 22:33:11'),
	(689,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\"}','2018-09-19 22:33:14','2018-09-19 22:33:14'),
	(690,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-19 22:33:45','2018-09-19 22:33:45'),
	(691,1,'admin/debit-credit/22/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:34:09','2018-09-19 22:34:09'),
	(692,1,'admin/debit-credit/22','PUT','127.0.0.1','{\"ll\":\"10\",\"status\":\"1\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/debit-credit\"}','2018-09-19 22:34:41','2018-09-19 22:34:41'),
	(693,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-19 22:34:41','2018-09-19 22:34:41'),
	(694,1,'admin/debit-credit/21','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\"}','2018-09-19 22:34:55','2018-09-19 22:34:55'),
	(695,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:34:55','2018-09-19 22:34:55'),
	(696,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-19 22:35:07','2018-09-19 22:35:07'),
	(697,1,'admin/debit-credit/20,14,16,15,6,19,18,11,17,12,13','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\"}','2018-09-19 22:35:19','2018-09-19 22:35:19'),
	(698,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:35:19','2018-09-19 22:35:19'),
	(699,1,'admin/debit-credit','GET','127.0.0.1','[]','2018-09-19 22:35:22','2018-09-19 22:35:22'),
	(700,1,'admin/debit-credit/22/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:35:31','2018-09-19 22:35:31'),
	(701,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:35:34','2018-09-19 22:35:34'),
	(702,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:35:35','2018-09-19 22:35:35'),
	(703,1,'admin/users/5/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:35:41','2018-09-19 22:35:41'),
	(704,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:35:45','2018-09-19 22:35:45'),
	(705,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:36:28','2018-09-19 22:36:28'),
	(706,1,'admin/manual/charge','POST','127.0.0.1','{\"name\":\"user001\",\"money\":\"100000.00\",\"_token\":\"mSREAHhWvw3753Ov3Y0mVZQdoB7e1AfeTUt0sRJ8\"}','2018-09-19 22:36:35','2018-09-19 22:36:35'),
	(707,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:36:37','2018-09-19 22:36:37'),
	(708,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:36:38','2018-09-19 22:36:38'),
	(709,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:36:39','2018-09-19 22:36:39'),
	(710,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:36:40','2018-09-19 22:36:40'),
	(711,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:36:43','2018-09-19 22:36:43'),
	(712,1,'admin/manual/refund','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:36:46','2018-09-19 22:36:46'),
	(713,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 22:36:48','2018-09-19 22:36:48'),
	(714,1,'admin/users','GET','127.0.0.1','[]','2018-09-19 23:02:46','2018-09-19 23:02:46'),
	(715,1,'admin/debit-credit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 23:02:48','2018-09-19 23:02:48'),
	(716,1,'admin/manual/charge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 23:02:50','2018-09-19 23:02:50'),
	(717,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-19 23:02:51','2018-09-19 23:02:51');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`)
VALUES
	(1,'All permission','*','','*',NULL,NULL),
	(2,'Dashboard','dashboard','GET','/',NULL,NULL),
	(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),
	(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),
	(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL);

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL),
	(1,8,NULL,NULL),
	(1,9,NULL,NULL),
	(1,10,NULL,NULL),
	(1,11,NULL,NULL),
	(1,12,NULL,NULL),
	(1,13,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','administrator','2018-09-09 10:37:56','2018-09-09 10:37:56');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','$2y$10$FDI1vRmvW/xit0RnJUK6duL2WgYdA.uf.Ux1FNxc7HbCEqucsUatu','系统管理员',NULL,NULL,'2018-09-09 10:37:56','2018-09-09 11:16:22');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL DEFAULT '',
  `pic` varchar(1024) NOT NULL DEFAULT '',
  `sort` int(2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;

INSERT INTO `banner` (`id`, `link`, `pic`, `sort`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'ddd','images/黄老师毛笔.png',0,1,'2018-09-10 11:45:17','2018-09-10 11:45:17');

/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table DC
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DC`;

CREATE TABLE `DC` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `jkje` double(11,2) DEFAULT NULL,
  `jkqx` varchar(32) DEFAULT NULL,
  `dyxx` varchar(255) DEFAULT NULL COMMENT '抵押信息',
  `hkfs` varchar(255) DEFAULT NULL COMMENT '还款方式',
  `jkms` varchar(255) DEFAULT NULL COMMENT '借款描述',
  `sex` varchar(32) DEFAULT NULL,
  `hyzk` varchar(255) DEFAULT NULL COMMENT '婚姻状况',
  `zgxl` varchar(255) DEFAULT '' COMMENT '最高学历',
  `address` varchar(255) DEFAULT NULL,
  `yjsr` varchar(255) DEFAULT NULL COMMENT '月均收入',
  `njsr` varchar(255) DEFAULT NULL COMMENT '年均收入',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fcz` varchar(255) DEFAULT NULL,
  `tdz` varchar(255) DEFAULT NULL,
  `xsz` varchar(255) DEFAULT NULL,
  `sfzz` varchar(255) DEFAULT NULL,
  `ll` double unsigned DEFAULT 0,
  `sfzf` varchar(255) DEFAULT NULL,
  `hkb` varchar(255) DEFAULT NULL,
  `jsz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `DC` WRITE;
/*!40000 ALTER TABLE `DC` DISABLE KEYS */;

INSERT INTO `DC` (`id`, `uid`, `jkje`, `jkqx`, `dyxx`, `hkfs`, `jkms`, `sex`, `hyzk`, `zgxl`, `address`, `yjsr`, `njsr`, `description`, `created_at`, `status`, `updated_at`, `fcz`, `tdz`, `xsz`, `sfzz`, `ll`, `sfzf`, `hkb`, `jsz`)
VALUES
	(22,1,1200.00,'12','信用借款','按月付息，到期还本金','安师大发水电费','男','未婚','小学','统计数据','1200','24000',NULL,'2018-09-19 22:16:06',1,'2018-09-19 22:34:41','/images/sMLJMCr5WjE6rRgwxq.jpeg','/images/v9o4Okpk05b0HjwFLP.jpeg','/images/CPKZCqENDJdn4AfvkL.jpeg','/images/gHGK6Sw5uGbdOUyiRs.jpeg',10,'/images/tr9cnWnbzjCudCw6wb.jpeg','/images/lCCbrx8jpuggf5pkqb.jpeg','/images/LmjSkvsuGzUvcAsxex.jpeg');

/*!40000 ALTER TABLE `DC` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_01_04_173148_create_admin_tables',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  `vip` tinyint(1) DEFAULT 0,
  `avatar` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `mobile`, `password`, `remember_token`, `money`, `vip`, `avatar`, `created_at`, `updated_at`)
VALUES
	(1,'test','13067675909','$2y$10$W4agxRgHZi2iAv1aAvM88ubjRPRlkM3bGRW99Zf2o7IfwqQSD.LGm',NULL,18097.00,NULL,NULL,NULL,'2018-09-15 08:48:42'),
	(3,'ddddd','13067675908','666666',NULL,18000.00,NULL,NULL,'2018-09-09 11:12:58','2018-09-09 11:12:58'),
	(5,'user001','13067675907','$2y$10$2EwDYAWp8ynNxQyQcAZ9OORIInefx0kefYJ5OGDNtOLgJE56NeBDy',NULL,100000.00,NULL,NULL,'2018-09-15 09:04:14','2018-09-19 22:36:35');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
