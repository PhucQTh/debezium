/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - acca_checkin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acca_checkin` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `acca_checkin`;

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
) ENGINE=InnoDB AUTO_INCREMENT=624 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_configurations` */

DROP TABLE IF EXISTS `tbl_configurations`;

CREATE TABLE `tbl_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(150) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_ddl` */

DROP TABLE IF EXISTS `tbl_ddl`;

CREATE TABLE `tbl_ddl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `display_order` float DEFAULT 0,
  `in_use` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ddl_cate` */

DROP TABLE IF EXISTS `tbl_ddl_cate`;

CREATE TABLE `tbl_ddl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_list_cate` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_form_number` */

DROP TABLE IF EXISTS `tbl_form_number`;

CREATE TABLE `tbl_form_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_type` int(5) DEFAULT NULL,
  `year_no` int(5) DEFAULT NULL,
  `month_no` int(5) DEFAULT NULL,
  `current_no` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_locator` */

DROP TABLE IF EXISTS `tbl_locator`;

CREATE TABLE `tbl_locator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locator_name` varchar(250) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_checkin` */

DROP TABLE IF EXISTS `tbl_request_checkin`;

CREATE TABLE `tbl_request_checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `request_status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `estimated_time` varchar(50) DEFAULT NULL,
  `is_lunch` int(11) DEFAULT 1,
  `lunch_quantity` int(11) DEFAULT 0,
  `notes` varchar(100) DEFAULT NULL,
  `is_archived` int(11) DEFAULT NULL,
  `archived_by` int(11) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  `request_type` int(11) DEFAULT NULL COMMENT '1 khach hang, 2 nha thau',
  `date_of_form` datetime DEFAULT NULL,
  `contractor_name` varchar(500) DEFAULT NULL,
  `cmnd` varchar(500) DEFAULT NULL,
  `company_name` varchar(500) DEFAULT NULL,
  `purpose` int(11) DEFAULT NULL COMMENT '1 tham quan, 2 làm việc, 3 khác',
  `purpose_other_note` longtext DEFAULT NULL COMMENT 'nhập lý do nếu chọn khác',
  `areas_for_working` varchar(500) DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `compliance_requirement` int(11) DEFAULT 2 COMMENT 'phần yêu cầu tuân thủ (1 là có, 2 là không)',
  `declaration_fever` int(11) DEFAULT 2 COMMENT 'sốt',
  `declaration_cough` int(11) DEFAULT 2 COMMENT 'ho, sổ mũi',
  `declaration_diarrhea` int(11) DEFAULT 2 COMMENT 'đau bụng, tiêu chảy',
  `declaration_eyes` int(11) DEFAULT 2 COMMENT 'đau mắt',
  `declaration_skin` int(11) DEFAULT 2 COMMENT 'bệnh ngoài da',
  `declaration_tuberculosis` int(11) DEFAULT 2 COMMENT 'ho lao',
  `declaration_contact_seven_day` int(11) DEFAULT 2 COMMENT 'tiếp xúc với ai trong 7 day',
  `declaration_chemicals` int(11) DEFAULT 2 COMMENT 'hóa chất',
  `declaration_chemicals_note` varchar(500) DEFAULT NULL COMMENT 'hóa chất, nếu có điền vào',
  `is_camara` int(11) DEFAULT 1,
  `is_camara_checkout` int(11) DEFAULT 1,
  `time_confirm` datetime DEFAULT NULL,
  `language` varchar(50) DEFAULT 'VN',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_checkin_info` */

DROP TABLE IF EXISTS `tbl_request_checkin_info`;

CREATE TABLE `tbl_request_checkin_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkin_id` int(11) DEFAULT NULL,
  `name_of_tool` varchar(500) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `quantity_in` float DEFAULT NULL,
  `intact_status_in` varchar(50) DEFAULT NULL COMMENT '1 có, 2 không',
  `hygiene_status_in` varchar(50) DEFAULT NULL COMMENT '1 có, 2 không',
  `intact_status_out` varchar(50) DEFAULT NULL,
  `quantity_out` float DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkin_id` (`checkin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_checkin_notes` */

DROP TABLE IF EXISTS `tbl_request_checkin_notes`;

CREATE TABLE `tbl_request_checkin_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `checkin_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_checkin_review` */

DROP TABLE IF EXISTS `tbl_request_checkin_review`;

CREATE TABLE `tbl_request_checkin_review` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `review_department` int(11) DEFAULT NULL,
  `review_status` int(1) DEFAULT 0,
  `review_comment` text DEFAULT NULL,
  `review_by` int(11) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_role_matrix` */

DROP TABLE IF EXISTS `tbl_role_matrix`;

CREATE TABLE `tbl_role_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_key` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `column_hide` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
