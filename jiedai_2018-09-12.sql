# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.3.9-MariaDB)
# Database: jiedai
# Generation Time: 2018-09-12 15:36:17 +0000
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
	(2,0,4,'Admin','fa-tasks','',NULL,'2018-09-09 13:28:35'),
	(3,2,5,'Users','fa-users','auth/users',NULL,'2018-09-09 13:28:35'),
	(4,2,6,'Roles','fa-user','auth/roles',NULL,'2018-09-09 13:28:35'),
	(5,2,7,'Permission','fa-ban','auth/permissions',NULL,'2018-09-09 13:28:35'),
	(6,2,8,'Menu','fa-bars','auth/menu',NULL,'2018-09-09 13:28:35'),
	(7,2,9,'Operation log','fa-history','auth/logs',NULL,'2018-09-09 13:28:35'),
	(8,0,2,'用户管理','fa-bars','users','2018-09-09 10:47:57','2018-09-09 10:56:08'),
	(9,0,3,'借贷审核','fa-money','debit-credit','2018-09-09 12:59:51','2018-09-09 13:28:35'),
	(10,0,0,'轮播图','fa-image','banner','2018-09-10 11:29:32','2018-09-10 11:29:32');

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
	(316,1,'admin/banner','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2018-09-10 11:57:25','2018-09-10 11:57:25');

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
	(1,10,NULL,NULL);

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
  `vip_money` double(11,2) DEFAULT NULL,
  `money` double(11,2) DEFAULT NULL,
  `deadline` tinyint(2) DEFAULT NULL,
  `dyxx` varchar(255) DEFAULT NULL COMMENT '抵押信息',
  `hkfs` varchar(255) DEFAULT NULL COMMENT '还款方式',
  `jkms` varchar(255) DEFAULT NULL COMMENT '借款描述',
  `sex` tinyint(1) DEFAULT NULL,
  `hyzk` varchar(255) DEFAULT NULL COMMENT '婚姻状况',
  `zgxl` varchar(255) DEFAULT '' COMMENT '最高学历',
  `address` varchar(255) DEFAULT NULL,
  `yjsr` varchar(255) DEFAULT NULL COMMENT '月均收入',
  `njsr` varchar(255) DEFAULT NULL COMMENT '年均收入',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `DC` WRITE;
/*!40000 ALTER TABLE `DC` DISABLE KEYS */;

INSERT INTO `DC` (`id`, `uid`, `vip_money`, `money`, `deadline`, `dyxx`, `hkfs`, `jkms`, `sex`, `hyzk`, `zgxl`, `address`, `yjsr`, `njsr`, `description`, `created_at`, `status`, `updated_at`, `thumb`)
VALUES
	(1,1,1.00,100.00,12,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'0','0000-00-00 00:00:00',1,'2018-09-09 13:56:52','0');

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
  `money` double(11,2) DEFAULT NULL,
  `vip` tinyint(1) DEFAULT NULL,
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
	(1,'test','790407626@qq.com','$2y$10$W4agxRgHZi2iAv1aAvM88ubjRPRlkM3bGRW99Zf2o7IfwqQSD.LGm',NULL,0.00,NULL,NULL,NULL,'2018-09-09 13:55:21'),
	(3,'ddddd','790407627@qq.com','666666',NULL,NULL,NULL,NULL,'2018-09-09 11:12:58','2018-09-09 11:12:58');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
