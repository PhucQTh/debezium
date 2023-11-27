/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - acca_dms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acca_dms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `acca_dms`;

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL DEFAULT 0,
  `language` varchar(16) NOT NULL DEFAULT '',
  `translation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `FK_Message_SourceMessage` FOREIGN KEY (`id`) REFERENCES `sourcemessage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `sourcemessage` */

DROP TABLE IF EXISTS `sourcemessage`;

CREATE TABLE `sourcemessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) DEFAULT NULL,
  `message` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_attachedfiles` */

DROP TABLE IF EXISTS `tbl_attachedfiles`;

CREATE TABLE `tbl_attachedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `system_file_name` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_categories` */

DROP TABLE IF EXISTS `tbl_categories`;

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT 0,
  `category` varchar(250) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tbl_ddl` */

DROP TABLE IF EXISTS `tbl_ddl`;

CREATE TABLE `tbl_ddl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL,
  `color_alert` varchar(20) DEFAULT NULL,
  `label_grid` varchar(20) DEFAULT NULL,
  `display_order` float DEFAULT 0,
  `in_use` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ddl_cate` */

DROP TABLE IF EXISTS `tbl_ddl_cate`;

CREATE TABLE `tbl_ddl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_list_cate` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_devices` */

DROP TABLE IF EXISTS `tbl_devices`;

CREATE TABLE `tbl_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_status` int(11) DEFAULT 1,
  `expresss_code` varchar(500) DEFAULT NULL,
  `device_model` varchar(500) DEFAULT NULL,
  `device_categorie` int(11) DEFAULT NULL,
  `device_serial_number` varchar(500) DEFAULT NULL,
  `device_manufacturer` int(11) DEFAULT NULL,
  `device_tech_spec` text DEFAULT NULL,
  `device_warranty_start_date` date DEFAULT NULL,
  `device_warranty_end_date` date DEFAULT NULL,
  `device_received_date` datetime DEFAULT NULL,
  `device_description` text DEFAULT NULL,
  `device_supplier` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=586 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_devices_assigned` */

DROP TABLE IF EXISTS `tbl_devices_assigned`;

CREATE TABLE `tbl_devices_assigned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `device_status` int(11) DEFAULT NULL,
  `device_user` int(11) DEFAULT NULL,
  `device_department` int(11) DEFAULT NULL,
  `device_location` int(11) DEFAULT NULL,
  `device_date_assigned` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=586 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_history` */

DROP TABLE IF EXISTS `tbl_history`;

CREATE TABLE `tbl_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `history_date` date DEFAULT NULL,
  `history_status` int(1) DEFAULT NULL,
  `history_users` int(11) DEFAULT NULL,
  `history_deparment` int(11) DEFAULT NULL,
  `history_location` int(11) DEFAULT NULL,
  `history_description` text DEFAULT NULL,
  `history_date_created` datetime DEFAULT NULL,
  `history_created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1235 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_locator` */

DROP TABLE IF EXISTS `tbl_locator`;

CREATE TABLE `tbl_locator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locator_name` varchar(250) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tbl_manufacturer` */

DROP TABLE IF EXISTS `tbl_manufacturer`;

CREATE TABLE `tbl_manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tbl_role_matrix` */

DROP TABLE IF EXISTS `tbl_role_matrix`;

CREATE TABLE `tbl_role_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_supplier` */

DROP TABLE IF EXISTS `tbl_supplier`;

CREATE TABLE `tbl_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tbl_vdi_client` */

DROP TABLE IF EXISTS `tbl_vdi_client`;

CREATE TABLE `tbl_vdi_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `account` varchar(250) DEFAULT NULL,
  `machine` varchar(250) DEFAULT NULL,
  `desktop_pool` varchar(250) DEFAULT NULL,
  `dns_name` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tbl_vdi_server` */

DROP TABLE IF EXISTS `tbl_vdi_server`;

CREATE TABLE `tbl_vdi_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_name` varchar(250) DEFAULT NULL,
  `local_admin` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `Os` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_key` varchar(50) DEFAULT NULL,
  `column_hide` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `view_device_info` */

DROP TABLE IF EXISTS `view_device_info`;

/*!50001 DROP VIEW IF EXISTS `view_device_info` */;
/*!50001 DROP TABLE IF EXISTS `view_device_info` */;

/*!50001 CREATE TABLE  `view_device_info`(
 `id` int(11) ,
 `expresss_code` varchar(500) ,
 `device_model` varchar(500) ,
 `device_categorie` int(11) ,
 `device_serial_number` varchar(500) ,
 `device_manufacturer` int(11) ,
 `device_tech_spec` text ,
 `device_warranty_start_date` date ,
 `device_warranty_end_date` date ,
 `device_received_date` datetime ,
 `device_supplier` int(11) ,
 `supplier_name` varchar(500) ,
 `device_description` text ,
 `date_created` datetime ,
 `date_modified` datetime ,
 `created_by` int(11) ,
 `modified_user_id` int(11) ,
 `device_status` int(11) ,
 `user_assigned` int(11) ,
 `dept_assigned` int(11) ,
 `location_assigned` int(11) ,
 `locator_name` varchar(250) ,
 `manufacturer_name` varchar(500) ,
 `category_name` varchar(250) 
)*/;

/*View structure for view view_device_info */

/*!50001 DROP TABLE IF EXISTS `view_device_info` */;
/*!50001 DROP VIEW IF EXISTS `view_device_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_device_info` AS (select `dv`.`id` AS `id`,`dv`.`expresss_code` AS `expresss_code`,`dv`.`device_model` AS `device_model`,`dv`.`device_categorie` AS `device_categorie`,`dv`.`device_serial_number` AS `device_serial_number`,`dv`.`device_manufacturer` AS `device_manufacturer`,`dv`.`device_tech_spec` AS `device_tech_spec`,`dv`.`device_warranty_start_date` AS `device_warranty_start_date`,`dv`.`device_warranty_end_date` AS `device_warranty_end_date`,`dv`.`device_received_date` AS `device_received_date`,`dv`.`device_supplier` AS `device_supplier`,`su`.`supplier_name` AS `supplier_name`,`dv`.`device_description` AS `device_description`,`dv`.`date_created` AS `date_created`,`dv`.`date_modified` AS `date_modified`,`dv`.`created_by` AS `created_by`,`dv`.`modified_user_id` AS `modified_user_id`,`da`.`device_status` AS `device_status`,`da`.`device_user` AS `user_assigned`,`da`.`device_department` AS `dept_assigned`,`da`.`device_location` AS `location_assigned`,`lo`.`locator_name` AS `locator_name`,`ma`.`manufacturer_name` AS `manufacturer_name`,`ca`.`category` AS `category_name` from (((((`tbl_devices` `dv` left join `tbl_manufacturer` `ma` on(`ma`.`id` = `dv`.`device_manufacturer`)) left join `tbl_supplier` `su` on(`su`.`id` = `dv`.`device_supplier`)) left join `tbl_categories` `ca` on(`ca`.`id` = `dv`.`device_categorie`)) left join `tbl_devices_assigned` `da` on(`dv`.`id` = `da`.`device_id`)) left join `tbl_locator` `lo` on(`lo`.`id` = `da`.`device_location`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
