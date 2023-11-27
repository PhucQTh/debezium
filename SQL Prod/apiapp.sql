/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - apiv2_apiapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`apiv2_apiapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `apiv2_apiapp`;

/*Table structure for table `tbl_applications` */

DROP TABLE IF EXISTS `tbl_applications`;

CREATE TABLE `tbl_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(255) DEFAULT NULL,
  `application_icon` varchar(255) DEFAULT NULL,
  `application_name` varchar(255) DEFAULT NULL,
  `application_url` varchar(255) DEFAULT NULL,
  `app_rank` tinyint(2) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 12,
  `application_vn` int(2) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_assistants` */

DROP TABLE IF EXISTS `tbl_assistants`;

CREATE TABLE `tbl_assistants` (
  `owner_id` int(11) NOT NULL,
  `assistant_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_configurations` */

DROP TABLE IF EXISTS `tbl_configurations`;

CREATE TABLE `tbl_configurations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) DEFAULT NULL,
  `value` varchar(300) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_department` */

DROP TABLE IF EXISTS `tbl_department`;

CREATE TABLE `tbl_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `displayed_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_document_access` */

DROP TABLE IF EXISTS `tbl_document_access`;

CREATE TABLE `tbl_document_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(200) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `read` tinyint(4) NOT NULL,
  `rename` tinyint(4) NOT NULL,
  `upload` tinyint(4) NOT NULL,
  `allow_all` tinyint(4) DEFAULT 1,
  `admin_folder` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_emailtemplates` */

DROP TABLE IF EXISTS `tbl_emailtemplates`;

CREATE TABLE `tbl_emailtemplates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `changed_by` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_group_user` */

DROP TABLE IF EXISTS `tbl_group_user`;

CREATE TABLE `tbl_group_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(10) DEFAULT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `view_rank` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  KEY `group_user_id` (`group_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9563 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_locations` */

DROP TABLE IF EXISTS `tbl_locations`;

CREATE TABLE `tbl_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_pagegroups` */

DROP TABLE IF EXISTS `tbl_pagegroups`;

CREATE TABLE `tbl_pagegroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `displayed_order` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_pages` */

DROP TABLE IF EXISTS `tbl_pages`;

CREATE TABLE `tbl_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_path` varchar(255) NOT NULL,
  `displayed_order` bigint(20) DEFAULT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `showed_in_menu` smallint(6) DEFAULT NULL,
  `application_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_position` */

DROP TABLE IF EXISTS `tbl_position`;

CREATE TABLE `tbl_position` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_role_permission` */

DROP TABLE IF EXISTS `tbl_role_permission`;

CREATE TABLE `tbl_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_short_name` varchar(50) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `action_name` varchar(50) DEFAULT NULL,
  `is_allowed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_roles` */

DROP TABLE IF EXISTS `tbl_roles`;

CREATE TABLE `tbl_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `view_rank` tinyint(4) DEFAULT NULL,
  `application_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `short_name` (`short_name`),
  KEY `application_id` (`application_id`),
  KEY `2_cols` (`short_name`,`application_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1476 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_roles_pages` */

DROP TABLE IF EXISTS `tbl_roles_pages`;

CREATE TABLE `tbl_roles_pages` (
  `page_id` int(10) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`page_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_salegroups` */

DROP TABLE IF EXISTS `tbl_salegroups`;

CREATE TABLE `tbl_salegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salegroup_name` varchar(250) NOT NULL,
  `salegroup_number` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `group_color` varchar(20) NOT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_users` */

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_code` varchar(6) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `activated` smallint(5) unsigned zerofill NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `registered_date` datetime DEFAULT NULL,
  `smtp_user` varchar(250) DEFAULT NULL,
  `smtp_password` varchar(250) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT 'images/avatar/avatar_1.gif',
  `avatar_full` varchar(250) NOT NULL DEFAULT 'images/avatar/avatar_1.gif',
  `avatar_flg` tinyint(4) DEFAULT NULL,
  `changepass_date` datetime DEFAULT NULL,
  `ccts_flg` tinyint(1) NOT NULL DEFAULT 0,
  `date_requested` datetime DEFAULT NULL,
  `check_activated` smallint(1) unsigned zerofill NOT NULL,
  `additional_information` text DEFAULT NULL,
  `is_testing` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=1939 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_users_applications` */

DROP TABLE IF EXISTS `tbl_users_applications`;

CREATE TABLE `tbl_users_applications` (
  `application_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `id_users_applications` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_users_applications`),
  KEY `4_cols` (`application_id`,`user_id`,`role_id`,`group_id`),
  KEY `application_id` (`application_id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  KEY `group_id` (`group_id`),
  KEY `2_cols_1` (`application_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71589 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_users_department` */

DROP TABLE IF EXISTS `tbl_users_department`;

CREATE TABLE `tbl_users_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `position_id` int(11) DEFAULT 1,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`department_id`,`user_id`),
  KEY `application_id` (`department_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_users_position` */

DROP TABLE IF EXISTS `tbl_users_position`;

CREATE TABLE `tbl_users_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `displayed_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `view_users_info` */

DROP TABLE IF EXISTS `view_users_info`;

/*!50001 DROP VIEW IF EXISTS `view_users_info` */;
/*!50001 DROP TABLE IF EXISTS `view_users_info` */;

/*!50001 CREATE TABLE  `view_users_info`(
 `user_id` bigint(20) ,
 `first_name` varchar(100) ,
 `last_name` varchar(100) ,
 `email` varchar(100) ,
 `role_id` bigint(20) ,
 `role_name` varchar(100) ,
 `short_name` varchar(255) ,
 `view_rank` tinyint(4) ,
 `application_id` bigint(20) ,
 `display_name` varchar(255) ,
 `app_rank` tinyint(2) ,
 `activated` smallint(5) unsigned zerofill 
)*/;

/*Table structure for table `view_user` */

DROP TABLE IF EXISTS `view_user`;

/*!50001 DROP VIEW IF EXISTS `view_user` */;
/*!50001 DROP TABLE IF EXISTS `view_user` */;

/*!50001 CREATE TABLE  `view_user`(
 `user_id` bigint(20) ,
 `first_name` varchar(100) ,
 `last_name` varchar(100) ,
 `email` varchar(100) ,
 `role_id` bigint(20) ,
 `role_name` varchar(100) ,
 `short_name` varchar(255) ,
 `view_rank` tinyint(4) ,
 `application_id` bigint(20) ,
 `display_name` varchar(255) ,
 `app_rank` tinyint(2) ,
 `activated` smallint(5) unsigned zerofill 
)*/;

/*Table structure for table `view_users` */

DROP TABLE IF EXISTS `view_users`;

/*!50001 DROP VIEW IF EXISTS `view_users` */;
/*!50001 DROP TABLE IF EXISTS `view_users` */;

/*!50001 CREATE TABLE  `view_users`(
 `user_id` bigint(20) ,
 `first_name` varchar(100) ,
 `last_name` varchar(100) ,
 `email` varchar(100) ,
 `role_id` bigint(20) ,
 `role_name` varchar(100) ,
 `short_name` varchar(255) ,
 `view_rank` tinyint(4) ,
 `application_id` bigint(20) ,
 `display_name` varchar(255) ,
 `app_rank` tinyint(2) ,
 `department_id` int(11) ,
 `department_short_name` varchar(50) ,
 `department_name` varchar(50) ,
 `position_id` int(11) ,
 `position_name` varchar(100) 
)*/;

/*View structure for view view_users_info */

/*!50001 DROP TABLE IF EXISTS `view_users_info` */;
/*!50001 DROP VIEW IF EXISTS `view_users_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_users_info` AS (select `ua`.`user_id` AS `user_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`email` AS `email`,`ua`.`role_id` AS `role_id`,`r`.`role_name` AS `role_name`,`r`.`short_name` AS `short_name`,`r`.`view_rank` AS `view_rank`,`ua`.`application_id` AS `application_id`,`a`.`display_name` AS `display_name`,`a`.`app_rank` AS `app_rank`,`u`.`activated` AS `activated` from (((`tbl_users_applications` `ua` join `tbl_users` `u` on(`u`.`id` = `ua`.`user_id`)) left join `tbl_roles` `r` on(`r`.`id` = `ua`.`role_id`)) left join `tbl_applications` `a` on(`a`.`id` = `ua`.`application_id`))) */;

/*View structure for view view_user */

/*!50001 DROP TABLE IF EXISTS `view_user` */;
/*!50001 DROP VIEW IF EXISTS `view_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_user` AS (select `ua`.`user_id` AS `user_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`email` AS `email`,`ua`.`role_id` AS `role_id`,`r`.`role_name` AS `role_name`,`r`.`short_name` AS `short_name`,`r`.`view_rank` AS `view_rank`,`ua`.`application_id` AS `application_id`,`a`.`display_name` AS `display_name`,`a`.`app_rank` AS `app_rank`,`u`.`activated` AS `activated` from (((`tbl_users_applications` `ua` join `tbl_users` `u` on(`u`.`id` = `ua`.`user_id`)) left join `tbl_roles` `r` on(`r`.`id` = `ua`.`role_id`)) left join `tbl_applications` `a` on(`a`.`id` = `ua`.`application_id`))) */;

/*View structure for view view_users */

/*!50001 DROP TABLE IF EXISTS `view_users` */;
/*!50001 DROP VIEW IF EXISTS `view_users` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_users` AS (select `ua`.`user_id` AS `user_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`email` AS `email`,`ua`.`role_id` AS `role_id`,`r`.`role_name` AS `role_name`,`r`.`short_name` AS `short_name`,`r`.`view_rank` AS `view_rank`,`ua`.`application_id` AS `application_id`,`a`.`display_name` AS `display_name`,`a`.`app_rank` AS `app_rank`,`ud`.`department_id` AS `department_id`,`d`.`short_name` AS `department_short_name`,`d`.`department_name` AS `department_name`,`ud`.`position_id` AS `position_id`,`p`.`position_name` AS `position_name` from ((((((`tbl_users_applications` `ua` join `tbl_users` `u` on(`u`.`id` = `ua`.`user_id`)) left join `tbl_roles` `r` on(`r`.`id` = `ua`.`role_id`)) left join `tbl_applications` `a` on(`a`.`id` = `ua`.`application_id`)) left join `tbl_users_department` `ud` on(`u`.`id` = `ud`.`user_id`)) left join `tbl_department` `d` on(`d`.`id` = `ud`.`department_id`)) left join `tbl_position` `p` on(`p`.`id` = `ud`.`position_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
