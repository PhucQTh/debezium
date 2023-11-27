/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - acca_citicket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acca_citicket` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `acca_citicket`;

/*Table structure for table `tbl_archive` */

DROP TABLE IF EXISTS `tbl_archive`;

CREATE TABLE `tbl_archive` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `update_date` datetime NOT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `assigned_to` bigint(20) DEFAULT NULL,
  `waiting_for` bigint(20) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 5,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_attachedfiles` */

DROP TABLE IF EXISTS `tbl_attachedfiles`;

CREATE TABLE `tbl_attachedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `system_file_name` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_configurations` */

DROP TABLE IF EXISTS `tbl_configurations`;

CREATE TABLE `tbl_configurations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) DEFAULT NULL,
  `value` varchar(300) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_emailtemplates` */

DROP TABLE IF EXISTS `tbl_emailtemplates`;

CREATE TABLE `tbl_emailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(250) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `email_content` mediumtext DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `listuser_id` varchar(250) DEFAULT NULL,
  `mailto` varchar(500) DEFAULT NULL,
  `mailcc` varchar(500) DEFAULT NULL,
  `mailbcc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_maillog` */

DROP TABLE IF EXISTS `tbl_maillog`;

CREATE TABLE `tbl_maillog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_key` varchar(100) DEFAULT NULL,
  `mail_subject` varchar(500) DEFAULT NULL,
  `mail_content` longtext DEFAULT NULL,
  `mail_to` text DEFAULT NULL,
  `mail_cc` text DEFAULT NULL,
  `mail_bcc` text DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `mail_status` tinyint(2) DEFAULT 0 COMMENT '0 Pending 1-5 re_send 6-9 bug 10 ok',
  `status_value` varchar(500) DEFAULT 'Pending',
  `date_done` datetime DEFAULT NULL,
  `attachment_file` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3686 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_messages` */

DROP TABLE IF EXISTS `tbl_messages`;

CREATE TABLE `tbl_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `responsed_by` bigint(20) DEFAULT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ticket_id` bigint(20) NOT NULL,
  `attach_file` varchar(255) DEFAULT NULL,
  `attach_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_msg_attachedfiles` */

DROP TABLE IF EXISTS `tbl_msg_attachedfiles`;

CREATE TABLE `tbl_msg_attachedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_id` bigint(20) NOT NULL DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `system_file_name` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_pagegroups` */

DROP TABLE IF EXISTS `tbl_pagegroups`;

CREATE TABLE `tbl_pagegroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `displayed_order` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_pages` */

DROP TABLE IF EXISTS `tbl_pages`;

CREATE TABLE `tbl_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_path` varchar(255) NOT NULL,
  `displayed_order` bigint(20) DEFAULT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `showed_in_menu` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_profile` */

DROP TABLE IF EXISTS `tbl_profile`;

CREATE TABLE `tbl_profile` (
  `profile_id` int(11) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `cell_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_role_matrix` */

DROP TABLE IF EXISTS `tbl_role_matrix`;

CREATE TABLE `tbl_role_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_roles` */

DROP TABLE IF EXISTS `tbl_roles`;

CREATE TABLE `tbl_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `sort_name` varchar(255) DEFAULT NULL,
  `view_rank` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_roles_pages` */

DROP TABLE IF EXISTS `tbl_roles_pages`;

CREATE TABLE `tbl_roles_pages` (
  `page_id` int(10) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`page_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_tickets` */

DROP TABLE IF EXISTS `tbl_tickets`;

CREATE TABLE `tbl_tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `update_date` datetime NOT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `waiting_for` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 5,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ticketsddl` */

DROP TABLE IF EXISTS `tbl_ticketsddl`;

CREATE TABLE `tbl_ticketsddl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL,
  `color_alert` varchar(20) DEFAULT NULL,
  `label_grid` varchar(20) DEFAULT NULL,
  `display_order` float DEFAULT 0,
  `in_use` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ticketsemail` */

DROP TABLE IF EXISTS `tbl_ticketsemail`;

CREATE TABLE `tbl_ticketsemail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ddl_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_ticketshares` */

DROP TABLE IF EXISTS `tbl_ticketshares`;

CREATE TABLE `tbl_ticketshares` (
  `tickets_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_ticketstatus` */

DROP TABLE IF EXISTS `tbl_ticketstatus`;

CREATE TABLE `tbl_ticketstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_user_reply_emails` */

DROP TABLE IF EXISTS `tbl_user_reply_emails`;

CREATE TABLE `tbl_user_reply_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_from` varchar(100) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_content` varchar(255) DEFAULT NULL,
  `auto_cmt` int(1) DEFAULT 0,
  `is_deleted` int(1) DEFAULT 0,
  `attachments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_key` varchar(50) DEFAULT NULL,
  `column_hide` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `view_ticketsnoarchive` */

DROP TABLE IF EXISTS `view_ticketsnoarchive`;

CREATE TABLE `view_ticketsnoarchive` (
  `id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `assigned_to` bigint(20) DEFAULT NULL,
  `waiting_for` bigint(20) DEFAULT NULL,
  `ticket_id` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `archived` varchar(12) DEFAULT NULL,
  `ticket_no` varchar(21) DEFAULT NULL,
  `assigned_name` varchar(201) DEFAULT NULL,
  `posted_name` varchar(201) DEFAULT NULL,
  `updated_name` varchar(201) DEFAULT NULL,
  `waiting_name` varchar(201) DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `view_tickets` */

DROP TABLE IF EXISTS `view_tickets`;

/*!50001 DROP VIEW IF EXISTS `view_tickets` */;
/*!50001 DROP TABLE IF EXISTS `view_tickets` */;

/*!50001 CREATE TABLE  `view_tickets`(
 `id` bigint(20) ,
 `name` varchar(255) ,
 `email` varchar(255) ,
 `phone` varchar(50) ,
 `description` varchar(255) ,
 `detail` mediumtext ,
 `create_date` datetime ,
 `creator_id` bigint(20) ,
 `status_id` bigint(20) ,
 `update_date` datetime ,
 `update_by` bigint(20) ,
 `assigned_to` bigint(20) ,
 `waiting_for` bigint(20) ,
 `ticket_id` bigint(20) ,
 `priority` int(11) ,
 `location_name` varchar(255) ,
 `status_name` varchar(255) ,
 `archived` varchar(12) ,
 `ticket_no` varchar(21) ,
 `assigned_name` varchar(201) ,
 `posted_name` varchar(201) ,
 `updated_name` varchar(201) ,
 `waiting_name` varchar(201) ,
 `type` int(11) 
)*/;

/*Table structure for table `view_app_user` */

DROP TABLE IF EXISTS `view_app_user`;

/*!50001 DROP VIEW IF EXISTS `view_app_user` */;
/*!50001 DROP TABLE IF EXISTS `view_app_user` */;

/*!50001 CREATE TABLE  `view_app_user`(
 `id` bigint(20) ,
 `first_name` varchar(100) ,
 `last_name` varchar(100) ,
 `full_name` varchar(201) ,
 `role_name` varchar(100) ,
 `short_name` varchar(255) ,
 `email` varchar(100) ,
 `application_id` bigint(20) ,
 `activated` smallint(5) unsigned zerofill 
)*/;

/*View structure for view view_tickets */

/*!50001 DROP TABLE IF EXISTS `view_tickets` */;
/*!50001 DROP VIEW IF EXISTS `view_tickets` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_tickets` AS select `t`.`id` AS `id`,`t`.`name` AS `name`,`t`.`email` AS `email`,`t`.`phone` AS `phone`,`t`.`description` AS `description`,`t`.`detail` AS `detail`,`t`.`create_date` AS `create_date`,`t`.`creator_id` AS `creator_id`,`t`.`status_id` AS `status_id`,`t`.`update_date` AS `update_date`,`t`.`update_by` AS `update_by`,`t`.`assigned_to` AS `assigned_to`,`t`.`waiting_for` AS `waiting_for`,`t`.`id` AS `ticket_id`,`t`.`priority` AS `priority`,`l`.`location_name` AS `location_name`,`ts`.`status_name` AS `status_name`,'archived' AS `archived`,concat('#',`t`.`id`) AS `ticket_no`,concat(`ua`.`first_name`,' ',`ua`.`last_name`) AS `assigned_name`,concat(`up`.`first_name`,' ',`up`.`last_name`) AS `posted_name`,concat(`uu`.`first_name`,' ',`uu`.`last_name`) AS `updated_name`,concat(`uw`.`first_name`,' ',`uw`.`last_name`) AS `waiting_name`,`t`.`type` AS `type` from ((((((`acca_citicket`.`tbl_archive` `t` left join `acca_citicket`.`tbl_ticketstatus` `ts` on(`t`.`status_id` = `ts`.`id`)) join `apiv2_apiapp`.`tbl_users` `up` on(`t`.`creator_id` = `up`.`id`)) left join `apiv2_apiapp`.`tbl_users` `ua` on(`t`.`assigned_to` = `ua`.`id`)) left join `apiv2_apiapp`.`tbl_users` `uu` on(`t`.`update_by` = `uu`.`id`)) left join `apiv2_apiapp`.`tbl_users` `uw` on(`t`.`waiting_for` = `uw`.`id`)) left join `apiv2_apiapp`.`tbl_locations` `l` on(`l`.`id` = `up`.`location`)) union select `t`.`id` AS `id`,`t`.`name` AS `name`,`t`.`email` AS `email`,`t`.`phone` AS `phone`,`t`.`description` AS `description`,`t`.`detail` AS `detail`,`t`.`create_date` AS `create_date`,`t`.`creator_id` AS `creator_id`,`t`.`status_id` AS `status_id`,`t`.`update_date` AS `update_date`,`t`.`update_by` AS `update_by`,`t`.`assigned_to` AS `assigned_to`,`t`.`waiting_for` AS `waiting_for`,`t`.`id` AS `ticket_id`,`t`.`priority` AS `priority`,`l`.`location_name` AS `location_name`,`ts`.`status_name` AS `status_name`,'non-archived' AS `archived`,concat('#',`t`.`id`) AS `ticket_no`,concat(`ua`.`first_name`,' ',`ua`.`last_name`) AS `assigned_name`,concat(`up`.`first_name`,' ',`up`.`last_name`) AS `posted_name`,concat(`uu`.`first_name`,' ',`uu`.`last_name`) AS `updated_name`,concat(`uw`.`first_name`,' ',`uw`.`last_name`) AS `waiting_name`,`t`.`type` AS `type` from ((((((`acca_citicket`.`tbl_tickets` `t` left join `acca_citicket`.`tbl_ticketstatus` `ts` on(`t`.`status_id` = `ts`.`id`)) join `apiv2_apiapp`.`tbl_users` `up` on(`t`.`creator_id` = `up`.`id`)) left join `apiv2_apiapp`.`tbl_users` `ua` on(`t`.`assigned_to` = `ua`.`id`)) left join `apiv2_apiapp`.`tbl_users` `uu` on(`t`.`update_by` = `uu`.`id`)) left join `apiv2_apiapp`.`tbl_users` `uw` on(`t`.`waiting_for` = `uw`.`id`)) left join `apiv2_apiapp`.`tbl_locations` `l` on(`l`.`id` = `up`.`location`)) */;

/*View structure for view view_app_user */

/*!50001 DROP TABLE IF EXISTS `view_app_user` */;
/*!50001 DROP VIEW IF EXISTS `view_app_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_app_user` AS (select `u`.`user_id` AS `id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,concat(`u`.`first_name`,' ',`u`.`last_name`) AS `full_name`,`u`.`role_name` AS `role_name`,`u`.`short_name` AS `short_name`,`u`.`email` AS `email`,`u`.`application_id` AS `application_id`,`u`.`activated` AS `activated` from `apiv2_apiapp`.`view_user` `u` where `u`.`application_id` = 55 order by concat(`u`.`first_name`,' ',`u`.`last_name`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
