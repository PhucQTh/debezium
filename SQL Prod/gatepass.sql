/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - acca_gatepass
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acca_gatepass` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `acca_gatepass`;

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL DEFAULT 0,
  `language` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `translation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `FK_Message_SourceMessage` FOREIGN KEY (`id`) REFERENCES `sourcemessage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `sourcemessage` */

DROP TABLE IF EXISTS `sourcemessage`;

CREATE TABLE `sourcemessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_activity` */

DROP TABLE IF EXISTS `tbl_activity`;

CREATE TABLE `tbl_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'index',
  `name` varchar(50) DEFAULT NULL,
  `user_id` varchar(200) NOT NULL COMMENT 'list current user',
  `user_name` varchar(500) DEFAULT NULL,
  `content` text NOT NULL,
  `created_date` datetime NOT NULL,
  `item_id` varchar(100) DEFAULT NULL,
  `related_item` text DEFAULT NULL,
  `undoable` tinyint(4) DEFAULT 0,
  `class_name` varchar(50) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `change_data` text DEFAULT NULL,
  `scenario` varchar(50) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_approval_group_user` */

DROP TABLE IF EXISTS `tbl_approval_group_user`;

CREATE TABLE `tbl_approval_group_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `approval_group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_approval_groups` */

DROP TABLE IF EXISTS `tbl_approval_groups`;

CREATE TABLE `tbl_approval_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `approval_name` varchar(200) DEFAULT NULL,
  `approval_desc` varchar(500) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `type_id` varchar(200) DEFAULT NULL,
  `default_select` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=1940 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `section` varchar(20) DEFAULT NULL,
  `color_alert` varchar(20) DEFAULT NULL,
  `label_grid` varchar(20) DEFAULT NULL,
  `display_order` float DEFAULT 0,
  `in_use` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ddl_cate` */

DROP TABLE IF EXISTS `tbl_ddl_cate`;

CREATE TABLE `tbl_ddl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_list_cate` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=22021 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval` */

DROP TABLE IF EXISTS `tbl_request_approval`;

CREATE TABLE `tbl_request_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `form_type` int(5) DEFAULT NULL,
  `request_title` text DEFAULT NULL,
  `request_desc` longtext DEFAULT NULL,
  `request_status` int(5) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_updated` int(1) DEFAULT 0,
  `is_archived` int(1) DEFAULT 0,
  `archived_by` int(11) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  `expected_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13988 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_20210319` */

DROP TABLE IF EXISTS `tbl_request_approval_20210319`;

CREATE TABLE `tbl_request_approval_20210319` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `form_type` int(5) DEFAULT NULL,
  `request_title` text DEFAULT NULL,
  `request_desc` longtext DEFAULT NULL,
  `request_status` int(5) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_updated` int(1) DEFAULT 0,
  `is_archived` int(1) DEFAULT 0,
  `archived_by` int(11) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  `expected_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_20220210` */

DROP TABLE IF EXISTS `tbl_request_approval_20220210`;

CREATE TABLE `tbl_request_approval_20220210` (
  `id` int(11) NOT NULL DEFAULT 0,
  `department_id` int(11) DEFAULT NULL,
  `form_type` int(5) DEFAULT NULL,
  `request_title` text DEFAULT NULL,
  `request_desc` longtext DEFAULT NULL,
  `request_status` int(5) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_updated` int(1) DEFAULT 0,
  `is_archived` int(1) DEFAULT 0,
  `archived_by` int(11) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  `expected_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_gpgconfirm` */

DROP TABLE IF EXISTS `tbl_request_approval_gpgconfirm`;

CREATE TABLE `tbl_request_approval_gpgconfirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `confirm_department` int(11) DEFAULT NULL,
  `confirm_status` int(1) DEFAULT 1,
  `confirm_comment` text DEFAULT NULL,
  `confirm_by` int(11) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3323 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_gpgdepartment` */

DROP TABLE IF EXISTS `tbl_request_approval_gpgdepartment`;

CREATE TABLE `tbl_request_approval_gpgdepartment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT NULL,
  `department_name` varchar(50) NOT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `return_user_id` varchar(250) DEFAULT NULL,
  `displayed_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tbl_request_approval_gpgdepartment_user` */

DROP TABLE IF EXISTS `tbl_request_approval_gpgdepartment_user`;

CREATE TABLE `tbl_request_approval_gpgdepartment_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tbl_request_approval_gpginfo` */

DROP TABLE IF EXISTS `tbl_request_approval_gpginfo`;

CREATE TABLE `tbl_request_approval_gpginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `gpg_type` int(11) DEFAULT NULL,
  `gpg_code` varchar(50) DEFAULT NULL,
  `gpg_number` varchar(50) DEFAULT NULL,
  `gpg_po_number` varchar(50) DEFAULT NULL,
  `gpg_transportation_company` varchar(200) DEFAULT NULL,
  `gpg_company_receiving` varchar(200) DEFAULT NULL,
  `gpg_driver` varchar(50) DEFAULT NULL,
  `gpg_truck_no` varchar(50) DEFAULT NULL,
  `gpg_request_return` int(1) DEFAULT 0,
  `gpg_security_code` int(11) DEFAULT NULL COMMENT 'id cua bao ve ra cong',
  `gpg_date_security_confirm` datetime DEFAULT NULL,
  `gpg_security_receiving_code` int(11) DEFAULT NULL COMMENT 'id cua bao ve nhan ve',
  `gpg_date_security_receiving_confirm` datetime DEFAULT NULL,
  `gpg_user_receiving` int(11) DEFAULT NULL COMMENT 'id cua nguoi nhan hang',
  `gpg_date_user_receiving` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14125 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_gpginfo_20210319` */

DROP TABLE IF EXISTS `tbl_request_approval_gpginfo_20210319`;

CREATE TABLE `tbl_request_approval_gpginfo_20210319` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `gpg_type` int(11) DEFAULT NULL,
  `gpg_code` varchar(50) DEFAULT NULL,
  `gpg_number` varchar(50) DEFAULT NULL,
  `gpg_po_number` varchar(50) DEFAULT NULL,
  `gpg_transportation_company` varchar(200) DEFAULT NULL,
  `gpg_company_receiving` varchar(200) DEFAULT NULL,
  `gpg_driver` varchar(50) DEFAULT NULL,
  `gpg_truck_no` varchar(50) DEFAULT NULL,
  `gpg_request_return` int(1) DEFAULT 0,
  `gpg_security_code` int(11) DEFAULT NULL COMMENT 'id cua bao ve ra cong',
  `gpg_date_security_confirm` datetime DEFAULT NULL,
  `gpg_security_receiving_code` int(11) DEFAULT NULL COMMENT 'id cua bao ve nhan ve',
  `gpg_date_security_receiving_confirm` datetime DEFAULT NULL,
  `gpg_user_receiving` int(11) DEFAULT NULL COMMENT 'id cua nguoi nhan hang',
  `gpg_date_user_receiving` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_gpginfo_detailedgoods` */

DROP TABLE IF EXISTS `tbl_request_approval_gpginfo_detailedgoods`;

CREATE TABLE `tbl_request_approval_gpginfo_detailedgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `dtg_code` varchar(50) DEFAULT NULL,
  `dtg_name` varchar(500) DEFAULT NULL,
  `dtg_unit` varchar(50) DEFAULT NULL,
  `dtg_quantity` double DEFAULT NULL,
  `dtg_remark` varchar(500) DEFAULT NULL,
  `dtg_created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6058 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_gpginfo_return_goods` */

DROP TABLE IF EXISTS `tbl_request_approval_gpginfo_return_goods`;

CREATE TABLE `tbl_request_approval_gpginfo_return_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dtg_id` int(11) DEFAULT NULL,
  `rtg_status` int(11) DEFAULT 0,
  `rtg_quantity` double DEFAULT NULL,
  `rtg_gatekeeper_code` varchar(50) DEFAULT NULL,
  `rtg_gatekeeper_remark` varchar(500) DEFAULT NULL,
  `rtg_gatekeeper_date_confirm` datetime DEFAULT NULL,
  `rtg_gatekeeper_date_created` datetime DEFAULT NULL,
  `rtg_user_confirm` int(11) DEFAULT NULL,
  `rtg_user_confirm_remark` varchar(500) DEFAULT NULL,
  `rtg_user_confirm_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_gpginvited` */

DROP TABLE IF EXISTS `tbl_request_approval_gpginvited`;

CREATE TABLE `tbl_request_approval_gpginvited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6459 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_gpgnotes` */

DROP TABLE IF EXISTS `tbl_request_approval_gpgnotes`;

CREATE TABLE `tbl_request_approval_gpgnotes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16588 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_gpgreview` */

DROP TABLE IF EXISTS `tbl_request_approval_gpgreview`;

CREATE TABLE `tbl_request_approval_gpgreview` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `review_department` int(11) DEFAULT NULL,
  `review_status` int(1) DEFAULT 0,
  `review_comment` text DEFAULT NULL,
  `review_by` int(11) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_invited` */

DROP TABLE IF EXISTS `tbl_request_approval_invited`;

CREATE TABLE `tbl_request_approval_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_notes` */

DROP TABLE IF EXISTS `tbl_request_approval_notes`;

CREATE TABLE `tbl_request_approval_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_steps` */

DROP TABLE IF EXISTS `tbl_request_approval_steps`;

CREATE TABLE `tbl_request_approval_steps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `approval_step_number` int(2) DEFAULT NULL,
  `approval_group` int(11) DEFAULT NULL,
  `approval_status` int(1) DEFAULT 2,
  `approval_comment` text DEFAULT NULL,
  `approval_by` int(11) DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18511 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_confirm` */

DROP TABLE IF EXISTS `tbl_request_confirm`;

CREATE TABLE `tbl_request_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `confirm_status` int(1) DEFAULT 0,
  `confirm_comment` text DEFAULT NULL,
  `confirm_by` int(11) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_leave` */

DROP TABLE IF EXISTS `tbl_request_leave`;

CREATE TABLE `tbl_request_leave` (
  `SortID` int(11) NOT NULL,
  `CodeEmp` varchar(10) DEFAULT NULL,
  `ProfileName` varchar(50) DEFAULT NULL,
  `OrgStructureName` varchar(250) DEFAULT NULL,
  `DateStart` datetime DEFAULT NULL,
  `DateEnd` datetime DEFAULT NULL,
  `Duration` varchar(250) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `LeaveDayTypeName` varchar(250) DEFAULT NULL,
  `LeaveDays` decimal(10,2) DEFAULT NULL,
  `LeaveHours` decimal(10,2) DEFAULT NULL,
  `Comment` varchar(250) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `StatusKey` varchar(50) DEFAULT NULL,
  `UserApprove1` varchar(50) DEFAULT NULL,
  `UserApprove2` varchar(50) DEFAULT NULL,
  `DateApprove` datetime DEFAULT NULL,
  `UserReject` varchar(50) DEFAULT NULL,
  `DateReject` datetime DEFAULT NULL,
  `DeclineReason` varchar(250) DEFAULT NULL,
  `is_checkin` int(1) DEFAULT 0,
  `is_checkout` int(1) DEFAULT 0,
  `is_confirm` int(1) DEFAULT 0,
  `confirmremark` varchar(250) DEFAULT NULL,
  `confirmdate` datetime DEFAULT NULL,
  `confirmby` int(11) DEFAULT NULL,
  `DateSyn` datetime DEFAULT NULL,
  PRIMARY KEY (`SortID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_request_leave_info` */

DROP TABLE IF EXISTS `tbl_request_leave_info`;

CREATE TABLE `tbl_request_leave_info` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SortID` int(11) DEFAULT NULL,
  `check_type` int(1) DEFAULT 0 COMMENT '0=in;1=out',
  `check_remark` varchar(250) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_role_matrix` */

DROP TABLE IF EXISTS `tbl_role_matrix`;

CREATE TABLE `tbl_role_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_type` */

DROP TABLE IF EXISTS `tbl_type`;

CREATE TABLE `tbl_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `in_use` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_key` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `column_hide` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `vliststandardapproval` */

DROP TABLE IF EXISTS `vliststandardapproval`;

/*!50001 DROP VIEW IF EXISTS `vliststandardapproval` */;
/*!50001 DROP TABLE IF EXISTS `vliststandardapproval` */;

/*!50001 CREATE TABLE  `vliststandardapproval`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `archived_date` datetime ,
 `approval_group` int(11) ,
 `user_id` int(11) ,
 `confirm_by` int(11) 
)*/;

/*Table structure for table `vgate_goodssecurity` */

DROP TABLE IF EXISTS `vgate_goodssecurity`;

/*!50001 DROP VIEW IF EXISTS `vgate_goodssecurity` */;
/*!50001 DROP TABLE IF EXISTS `vgate_goodssecurity` */;

/*!50001 CREATE TABLE  `vgate_goodssecurity`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `approved_date` datetime ,
 `completed_date` datetime ,
 `expected_date` datetime ,
 `gpg_type` int(11) ,
 `gpg_code` varchar(50) ,
 `gpg_number` varchar(50) ,
 `gpg_po_number` varchar(50) ,
 `gpg_transportation_company` varchar(200) ,
 `gpg_company_receiving` varchar(200) ,
 `gpg_driver` varchar(50) ,
 `gpg_truck_no` varchar(50) ,
 `gpg_request_return` int(1) ,
 `gpg_user_receiving` int(11) ,
 `gpg_security_code` int(11) ,
 `gpg_date_security_receiving_confirm` datetime ,
 `gpg_date_security_confirm` datetime ,
 `gpg_security_receiving_code` int(11) ,
 `gpg_date_user_receiving` datetime ,
 `confirm_group` int(11) ,
 `user_id` int(11) ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vgate_countrequest` */

DROP TABLE IF EXISTS `vgate_countrequest`;

/*!50001 DROP VIEW IF EXISTS `vgate_countrequest` */;
/*!50001 DROP TABLE IF EXISTS `vgate_countrequest` */;

/*!50001 CREATE TABLE  `vgate_countrequest`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_status` int(5) ,
 `form_type` int(5) ,
 `created_by` int(11) ,
 `is_archived` int(1) ,
 `confirm_group` int(11) ,
 `user_id` int(11) ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vgate_complated` */

DROP TABLE IF EXISTS `vgate_complated`;

/*!50001 DROP VIEW IF EXISTS `vgate_complated` */;
/*!50001 DROP TABLE IF EXISTS `vgate_complated` */;

/*!50001 CREATE TABLE  `vgate_complated`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `approved_date` datetime ,
 `completed_date` datetime ,
 `expected_date` datetime ,
 `gpg_type` int(11) ,
 `gpg_code` varchar(50) ,
 `gpg_number` varchar(50) ,
 `gpg_po_number` varchar(50) ,
 `gpg_transportation_company` varchar(200) ,
 `gpg_company_receiving` varchar(200) ,
 `gpg_driver` varchar(50) ,
 `gpg_truck_no` varchar(50) ,
 `gpg_request_return` int(1) ,
 `gpg_security_code` int(11) ,
 `gpg_date_security_confirm` datetime ,
 `gpg_security_receiving_code` int(11) ,
 `gpg_date_security_receiving_confirm` datetime ,
 `gpg_user_receiving` int(11) ,
 `gpg_date_user_receiving` datetime ,
 `confirm_group` int(11) ,
 `user_id` int(11) ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vgate_onhold` */

DROP TABLE IF EXISTS `vgate_onhold`;

/*!50001 DROP VIEW IF EXISTS `vgate_onhold` */;
/*!50001 DROP TABLE IF EXISTS `vgate_onhold` */;

/*!50001 CREATE TABLE  `vgate_onhold`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `approved_date` datetime ,
 `completed_date` datetime ,
 `expected_date` datetime ,
 `gpg_type` int(11) ,
 `gpg_code` varchar(50) ,
 `gpg_number` varchar(50) ,
 `gpg_po_number` varchar(50) ,
 `gpg_transportation_company` varchar(200) ,
 `gpg_company_receiving` varchar(200) ,
 `gpg_driver` varchar(50) ,
 `gpg_truck_no` varchar(50) ,
 `gpg_request_return` int(1) ,
 `gpg_security_code` int(11) ,
 `gpg_date_security_confirm` datetime ,
 `gpg_security_receiving_code` int(11) ,
 `gpg_date_security_receiving_confirm` datetime ,
 `gpg_user_receiving` int(11) ,
 `gpg_date_user_receiving` datetime ,
 `confirm_group` int(11) ,
 `user_id` int(11) ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vgate_returnedgoods` */

DROP TABLE IF EXISTS `vgate_returnedgoods`;

/*!50001 DROP VIEW IF EXISTS `vgate_returnedgoods` */;
/*!50001 DROP TABLE IF EXISTS `vgate_returnedgoods` */;

/*!50001 CREATE TABLE  `vgate_returnedgoods`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `approved_date` datetime ,
 `completed_date` datetime ,
 `expected_date` datetime ,
 `gpg_type` int(11) ,
 `gpg_code` varchar(50) ,
 `gpg_number` varchar(50) ,
 `gpg_po_number` varchar(50) ,
 `gpg_transportation_company` varchar(200) ,
 `gpg_company_receiving` varchar(200) ,
 `gpg_driver` varchar(50) ,
 `gpg_truck_no` varchar(50) ,
 `gpg_request_return` int(1) ,
 `gpg_security_code` int(11) ,
 `gpg_date_security_confirm` datetime ,
 `gpg_security_receiving_code` int(11) ,
 `gpg_date_security_receiving_confirm` datetime ,
 `gpg_user_receiving` int(11) ,
 `gpg_date_user_receiving` datetime ,
 `confirm_group` int(11) ,
 `user_id` int(11) ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vgate_review` */

DROP TABLE IF EXISTS `vgate_review`;

/*!50001 DROP VIEW IF EXISTS `vgate_review` */;
/*!50001 DROP TABLE IF EXISTS `vgate_review` */;

/*!50001 CREATE TABLE  `vgate_review`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `approved_date` datetime ,
 `completed_date` datetime ,
 `expected_date` datetime ,
 `gpg_type` int(11) ,
 `gpg_code` varchar(50) ,
 `gpg_number` varchar(50) ,
 `gpg_po_number` varchar(50) ,
 `gpg_transportation_company` varchar(200) ,
 `gpg_company_receiving` varchar(200) ,
 `gpg_driver` varchar(50) ,
 `gpg_truck_no` varchar(50) ,
 `gpg_request_return` int(1) ,
 `gpg_security_code` int(11) ,
 `gpg_date_security_confirm` datetime ,
 `gpg_security_receiving_code` int(11) ,
 `gpg_date_security_receiving_confirm` datetime ,
 `gpg_user_receiving` int(11) ,
 `gpg_date_user_receiving` datetime ,
 `confirm_group` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vgate_gatepass_report` */

DROP TABLE IF EXISTS `vgate_gatepass_report`;

/*!50001 DROP VIEW IF EXISTS `vgate_gatepass_report` */;
/*!50001 DROP TABLE IF EXISTS `vgate_gatepass_report` */;

/*!50001 CREATE TABLE  `vgate_gatepass_report`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `approved_date` datetime ,
 `completed_date` datetime ,
 `expected_date` datetime ,
 `gpg_type` int(11) ,
 `gpg_code` varchar(50) ,
 `gpg_number` varchar(50) ,
 `gpg_po_number` varchar(50) ,
 `gpg_transportation_company` varchar(200) ,
 `gpg_company_receiving` varchar(200) ,
 `gpg_driver` varchar(50) ,
 `gpg_truck_no` varchar(50) ,
 `gpg_request_return` int(1) ,
 `gpg_security_code` int(11) ,
 `gpg_date_security_confirm` datetime ,
 `gpg_security_receiving_code` int(11) ,
 `gpg_date_security_receiving_confirm` datetime ,
 `gpg_user_receiving` int(11) ,
 `gpg_date_user_receiving` datetime ,
 `confirm_group` int(11) ,
 `user_id` int(11) ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vlistapprovaluser` */

DROP TABLE IF EXISTS `vlistapprovaluser`;

/*!50001 DROP VIEW IF EXISTS `vlistapprovaluser` */;
/*!50001 DROP TABLE IF EXISTS `vlistapprovaluser` */;

/*!50001 CREATE TABLE  `vlistapprovaluser`(
 `id` int(11) unsigned ,
 `request_approval_id` int(11) ,
 `approval_step_number` int(2) ,
 `approval_group` int(11) ,
 `approval_status` int(1) ,
 `approval_comment` text ,
 `approval_by` int(11) ,
 `approval_date` datetime ,
 `approval_user` int(11) 
)*/;

/*Table structure for table `vlistawaitingreview` */

DROP TABLE IF EXISTS `vlistawaitingreview`;

/*!50001 DROP VIEW IF EXISTS `vlistawaitingreview` */;
/*!50001 DROP TABLE IF EXISTS `vlistawaitingreview` */;

/*!50001 CREATE TABLE  `vlistawaitingreview`(
 `id` int(11) ,
 `form_type` int(5) ,
 `request_status` int(5) ,
 `confirm_status` int(1) ,
 `confirm_department` int(11) 
)*/;

/*Table structure for table `vlistawaitingapproval` */

DROP TABLE IF EXISTS `vlistawaitingapproval`;

/*!50001 DROP VIEW IF EXISTS `vlistawaitingapproval` */;
/*!50001 DROP TABLE IF EXISTS `vlistawaitingapproval` */;

/*!50001 CREATE TABLE  `vlistawaitingapproval`(
 `id` int(11) ,
 `form_type` int(5) ,
 `request_status` int(5) ,
 `approval_step_number` int(2) ,
 `approval_status` int(1) ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vgate_approval` */

DROP TABLE IF EXISTS `vgate_approval`;

/*!50001 DROP VIEW IF EXISTS `vgate_approval` */;
/*!50001 DROP TABLE IF EXISTS `vgate_approval` */;

/*!50001 CREATE TABLE  `vgate_approval`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `approved_date` datetime ,
 `completed_date` datetime ,
 `expected_date` datetime ,
 `gpg_type` int(11) ,
 `gpg_code` varchar(50) ,
 `gpg_number` varchar(50) ,
 `gpg_po_number` varchar(50) ,
 `gpg_transportation_company` varchar(200) ,
 `gpg_company_receiving` varchar(200) ,
 `gpg_driver` varchar(50) ,
 `gpg_truck_no` varchar(50) ,
 `gpg_request_return` int(1) ,
 `gpg_security_code` int(11) ,
 `gpg_date_security_confirm` datetime ,
 `gpg_security_receiving_code` int(11) ,
 `gpg_date_security_receiving_confirm` datetime ,
 `gpg_user_receiving` int(11) ,
 `gpg_date_user_receiving` datetime ,
 `confirm_group` int(11) ,
 `user_id` int(11) ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vgate_inprogress` */

DROP TABLE IF EXISTS `vgate_inprogress`;

/*!50001 DROP VIEW IF EXISTS `vgate_inprogress` */;
/*!50001 DROP TABLE IF EXISTS `vgate_inprogress` */;

/*!50001 CREATE TABLE  `vgate_inprogress`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `approved_date` datetime ,
 `completed_date` datetime ,
 `expected_date` datetime ,
 `gpg_type` int(11) ,
 `gpg_code` varchar(50) ,
 `gpg_number` varchar(50) ,
 `gpg_po_number` varchar(50) ,
 `gpg_transportation_company` varchar(200) ,
 `gpg_company_receiving` varchar(200) ,
 `gpg_driver` varchar(50) ,
 `gpg_truck_no` varchar(50) ,
 `gpg_request_return` int(1) ,
 `gpg_security_code` int(11) ,
 `gpg_date_security_confirm` datetime ,
 `gpg_security_receiving_code` int(11) ,
 `gpg_date_security_receiving_confirm` datetime ,
 `gpg_user_receiving` int(11) ,
 `gpg_date_user_receiving` datetime 
)*/;

/*Table structure for table `vlistreportgate` */

DROP TABLE IF EXISTS `vlistreportgate`;

/*!50001 DROP VIEW IF EXISTS `vlistreportgate` */;
/*!50001 DROP TABLE IF EXISTS `vlistreportgate` */;

/*!50001 CREATE TABLE  `vlistreportgate`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` text ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `approved_date` datetime ,
 `completed_date` datetime ,
 `expected_date` datetime ,
 `gpg_type` int(11) ,
 `gpg_code` varchar(50) ,
 `gpg_number` varchar(50) ,
 `gpg_po_number` varchar(50) ,
 `gpg_transportation_company` varchar(200) ,
 `gpg_company_receiving` varchar(200) ,
 `gpg_driver` varchar(50) ,
 `gpg_truck_no` varchar(50) ,
 `gpg_request_return` int(1) ,
 `gpg_security_code` int(11) ,
 `gpg_date_security_confirm` datetime ,
 `gpg_security_receiving_code` int(11) ,
 `gpg_date_security_receiving_confirm` datetime ,
 `gpg_user_receiving` int(11) ,
 `gpg_date_user_receiving` datetime ,
 `confirm_group` int(11) ,
 `user_id` int(11) ,
 `approval_group` int(11) ,
 `dtg_code` varchar(50) ,
 `dtg_name` varchar(500) ,
 `dtg_unit` varchar(50) ,
 `dtg_quantity` double ,
 `dtg_remark` varchar(500) ,
 `dtg_created_date` datetime 
)*/;

/*View structure for view vliststandardapproval */

/*!50001 DROP TABLE IF EXISTS `vliststandardapproval` */;
/*!50001 DROP VIEW IF EXISTS `vliststandardapproval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vliststandardapproval` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`treq_apr_cof`.`confirm_by` AS `confirm_by` from (((`tbl_request_approval` `treq_apr` left join `tbl_request_approval_steps` `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join `tbl_request_approval_invited` `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join `tbl_request_confirm` `treq_apr_cof` on(`treq_apr`.`id` = `treq_apr_cof`.`request_approval_id`)) where `treq_apr`.`request_status` not in (1,4) and `treq_apr`.`form_type` = 11 */;

/*View structure for view vgate_goodssecurity */

/*!50001 DROP TABLE IF EXISTS `vgate_goodssecurity` */;
/*!50001 DROP VIEW IF EXISTS `vgate_goodssecurity` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgate_goodssecurity` AS select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`approved_date` AS `approved_date`,`ra`.`completed_date` AS `completed_date`,`ra`.`expected_date` AS `expected_date`,`gate`.`gpg_type` AS `gpg_type`,`gate`.`gpg_code` AS `gpg_code`,`gate`.`gpg_number` AS `gpg_number`,`gate`.`gpg_po_number` AS `gpg_po_number`,`gate`.`gpg_transportation_company` AS `gpg_transportation_company`,`gate`.`gpg_company_receiving` AS `gpg_company_receiving`,`gate`.`gpg_driver` AS `gpg_driver`,`gate`.`gpg_truck_no` AS `gpg_truck_no`,`gate`.`gpg_request_return` AS `gpg_request_return`,`gate`.`gpg_user_receiving` AS `gpg_user_receiving`,`gate`.`gpg_security_code` AS `gpg_security_code`,`gate`.`gpg_date_security_receiving_confirm` AS `gpg_date_security_receiving_confirm`,`gate`.`gpg_date_security_confirm` AS `gpg_date_security_confirm`,`gate`.`gpg_security_receiving_code` AS `gpg_security_receiving_code`,`gate`.`gpg_date_user_receiving` AS `gpg_date_user_receiving`,`gate_confirm`.`confirm_department` AS `confirm_group`,`gate_ivt`.`user_id` AS `user_id`,`gate_step`.`approval_group` AS `approval_group` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_gpginfo` `gate` on(`ra`.`id` = `gate`.`request_approval_id`)) left join `tbl_request_approval_gpgconfirm` `gate_confirm` on(`ra`.`id` = `gate_confirm`.`request_approval_id`)) left join `tbl_request_approval_gpginvited` `gate_ivt` on(`ra`.`id` = `gate_ivt`.`request_approval_id`)) left join `tbl_request_approval_steps` `gate_step` on(`ra`.`id` = `gate_step`.`request_approval_id`)) where `ra`.`request_status` = 6 and `ra`.`form_type` = 12 */;

/*View structure for view vgate_countrequest */

/*!50001 DROP TABLE IF EXISTS `vgate_countrequest` */;
/*!50001 DROP VIEW IF EXISTS `vgate_countrequest` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgate_countrequest` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`request_status` AS `request_status`,`ra`.`form_type` AS `form_type`,`ra`.`created_by` AS `created_by`,`ra`.`is_archived` AS `is_archived`,`gate_confirm`.`confirm_department` AS `confirm_group`,`gate_ivt`.`user_id` AS `user_id`,`gate_step`.`approval_group` AS `approval_group` from (((`tbl_request_approval` `ra` left join `tbl_request_approval_gpgconfirm` `gate_confirm` on(`ra`.`id` = `gate_confirm`.`request_approval_id`)) left join `tbl_request_approval_gpginvited` `gate_ivt` on(`ra`.`id` = `gate_ivt`.`request_approval_id`)) left join `tbl_request_approval_steps` `gate_step` on(`ra`.`id` = `gate_step`.`request_approval_id`)) where `ra`.`is_archived` = 0 and to_days(current_timestamp()) - to_days(`ra`.`created_date`) < 90 and `ra`.`form_type` = 12) */;

/*View structure for view vgate_complated */

/*!50001 DROP TABLE IF EXISTS `vgate_complated` */;
/*!50001 DROP VIEW IF EXISTS `vgate_complated` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgate_complated` AS select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`approved_date` AS `approved_date`,`ra`.`completed_date` AS `completed_date`,`ra`.`expected_date` AS `expected_date`,`gate`.`gpg_type` AS `gpg_type`,`gate`.`gpg_code` AS `gpg_code`,`gate`.`gpg_number` AS `gpg_number`,`gate`.`gpg_po_number` AS `gpg_po_number`,`gate`.`gpg_transportation_company` AS `gpg_transportation_company`,`gate`.`gpg_company_receiving` AS `gpg_company_receiving`,`gate`.`gpg_driver` AS `gpg_driver`,`gate`.`gpg_truck_no` AS `gpg_truck_no`,`gate`.`gpg_request_return` AS `gpg_request_return`,`gate`.`gpg_security_code` AS `gpg_security_code`,`gate`.`gpg_date_security_confirm` AS `gpg_date_security_confirm`,`gate`.`gpg_security_receiving_code` AS `gpg_security_receiving_code`,`gate`.`gpg_date_security_receiving_confirm` AS `gpg_date_security_receiving_confirm`,`gate`.`gpg_user_receiving` AS `gpg_user_receiving`,`gate`.`gpg_date_user_receiving` AS `gpg_date_user_receiving`,`gate_confirm`.`confirm_department` AS `confirm_group`,`gate_ivt`.`user_id` AS `user_id`,`gate_step`.`approval_group` AS `approval_group` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_gpginfo` `gate` on(`ra`.`id` = `gate`.`request_approval_id`)) left join `tbl_request_approval_gpgconfirm` `gate_confirm` on(`ra`.`id` = `gate_confirm`.`request_approval_id`)) left join `tbl_request_approval_gpginvited` `gate_ivt` on(`ra`.`id` = `gate_ivt`.`request_approval_id`)) left join `tbl_request_approval_steps` `gate_step` on(`ra`.`id` = `gate_step`.`request_approval_id`)) where `ra`.`request_status` = 8 and to_days(current_timestamp()) - to_days(`ra`.`created_date`) < 90 and `ra`.`form_type` = 12 */;

/*View structure for view vgate_onhold */

/*!50001 DROP TABLE IF EXISTS `vgate_onhold` */;
/*!50001 DROP VIEW IF EXISTS `vgate_onhold` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgate_onhold` AS select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`approved_date` AS `approved_date`,`ra`.`completed_date` AS `completed_date`,`ra`.`expected_date` AS `expected_date`,`gate`.`gpg_type` AS `gpg_type`,`gate`.`gpg_code` AS `gpg_code`,`gate`.`gpg_number` AS `gpg_number`,`gate`.`gpg_po_number` AS `gpg_po_number`,`gate`.`gpg_transportation_company` AS `gpg_transportation_company`,`gate`.`gpg_company_receiving` AS `gpg_company_receiving`,`gate`.`gpg_driver` AS `gpg_driver`,`gate`.`gpg_truck_no` AS `gpg_truck_no`,`gate`.`gpg_request_return` AS `gpg_request_return`,`gate`.`gpg_security_code` AS `gpg_security_code`,`gate`.`gpg_date_security_confirm` AS `gpg_date_security_confirm`,`gate`.`gpg_security_receiving_code` AS `gpg_security_receiving_code`,`gate`.`gpg_date_security_receiving_confirm` AS `gpg_date_security_receiving_confirm`,`gate`.`gpg_user_receiving` AS `gpg_user_receiving`,`gate`.`gpg_date_user_receiving` AS `gpg_date_user_receiving`,`gate_confirm`.`confirm_department` AS `confirm_group`,`gate_ivt`.`user_id` AS `user_id`,`gate_step`.`approval_group` AS `approval_group` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_gpginfo` `gate` on(`ra`.`id` = `gate`.`request_approval_id`)) left join `tbl_request_approval_gpgconfirm` `gate_confirm` on(`ra`.`id` = `gate_confirm`.`request_approval_id`)) left join `tbl_request_approval_gpginvited` `gate_ivt` on(`ra`.`id` = `gate_ivt`.`request_approval_id`)) left join `tbl_request_approval_steps` `gate_step` on(`ra`.`id` = `gate_step`.`request_approval_id`)) where `ra`.`request_status` = 4 and `ra`.`form_type` = 12 */;

/*View structure for view vgate_returnedgoods */

/*!50001 DROP TABLE IF EXISTS `vgate_returnedgoods` */;
/*!50001 DROP VIEW IF EXISTS `vgate_returnedgoods` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgate_returnedgoods` AS select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`approved_date` AS `approved_date`,`ra`.`completed_date` AS `completed_date`,`ra`.`expected_date` AS `expected_date`,`gate`.`gpg_type` AS `gpg_type`,`gate`.`gpg_code` AS `gpg_code`,`gate`.`gpg_number` AS `gpg_number`,`gate`.`gpg_po_number` AS `gpg_po_number`,`gate`.`gpg_transportation_company` AS `gpg_transportation_company`,`gate`.`gpg_company_receiving` AS `gpg_company_receiving`,`gate`.`gpg_driver` AS `gpg_driver`,`gate`.`gpg_truck_no` AS `gpg_truck_no`,`gate`.`gpg_request_return` AS `gpg_request_return`,`gate`.`gpg_security_code` AS `gpg_security_code`,`gate`.`gpg_date_security_confirm` AS `gpg_date_security_confirm`,`gate`.`gpg_security_receiving_code` AS `gpg_security_receiving_code`,`gate`.`gpg_date_security_receiving_confirm` AS `gpg_date_security_receiving_confirm`,`gate`.`gpg_user_receiving` AS `gpg_user_receiving`,`gate`.`gpg_date_user_receiving` AS `gpg_date_user_receiving`,`gate_confirm`.`confirm_department` AS `confirm_group`,`gate_ivt`.`user_id` AS `user_id`,`gate_step`.`approval_group` AS `approval_group` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_gpginfo` `gate` on(`ra`.`id` = `gate`.`request_approval_id`)) left join `tbl_request_approval_gpgconfirm` `gate_confirm` on(`ra`.`id` = `gate_confirm`.`request_approval_id`)) left join `tbl_request_approval_gpginvited` `gate_ivt` on(`ra`.`id` = `gate_ivt`.`request_approval_id`)) left join `tbl_request_approval_steps` `gate_step` on(`ra`.`id` = `gate_step`.`request_approval_id`)) where `ra`.`request_status` = 7 and `ra`.`form_type` = 12 */;

/*View structure for view vgate_review */

/*!50001 DROP TABLE IF EXISTS `vgate_review` */;
/*!50001 DROP VIEW IF EXISTS `vgate_review` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgate_review` AS select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`approved_date` AS `approved_date`,`ra`.`completed_date` AS `completed_date`,`ra`.`expected_date` AS `expected_date`,`gate`.`gpg_type` AS `gpg_type`,`gate`.`gpg_code` AS `gpg_code`,`gate`.`gpg_number` AS `gpg_number`,`gate`.`gpg_po_number` AS `gpg_po_number`,`gate`.`gpg_transportation_company` AS `gpg_transportation_company`,`gate`.`gpg_company_receiving` AS `gpg_company_receiving`,`gate`.`gpg_driver` AS `gpg_driver`,`gate`.`gpg_truck_no` AS `gpg_truck_no`,`gate`.`gpg_request_return` AS `gpg_request_return`,`gate`.`gpg_security_code` AS `gpg_security_code`,`gate`.`gpg_date_security_confirm` AS `gpg_date_security_confirm`,`gate`.`gpg_security_receiving_code` AS `gpg_security_receiving_code`,`gate`.`gpg_date_security_receiving_confirm` AS `gpg_date_security_receiving_confirm`,`gate`.`gpg_user_receiving` AS `gpg_user_receiving`,`gate`.`gpg_date_user_receiving` AS `gpg_date_user_receiving`,`gate_confirm`.`confirm_department` AS `confirm_group`,`gate_ivt`.`user_id` AS `user_id` from (((`tbl_request_approval` `ra` left join `tbl_request_approval_gpginfo` `gate` on(`ra`.`id` = `gate`.`request_approval_id`)) left join `tbl_request_approval_gpgconfirm` `gate_confirm` on(`ra`.`id` = `gate_confirm`.`request_approval_id`)) left join `tbl_request_approval_gpginvited` `gate_ivt` on(`ra`.`id` = `gate_ivt`.`request_approval_id`)) where `ra`.`request_status` = 2 and `ra`.`form_type` = 12 */;

/*View structure for view vgate_gatepass_report */

/*!50001 DROP TABLE IF EXISTS `vgate_gatepass_report` */;
/*!50001 DROP VIEW IF EXISTS `vgate_gatepass_report` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgate_gatepass_report` AS select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`approved_date` AS `approved_date`,`ra`.`completed_date` AS `completed_date`,`ra`.`expected_date` AS `expected_date`,`gate`.`gpg_type` AS `gpg_type`,`gate`.`gpg_code` AS `gpg_code`,`gate`.`gpg_number` AS `gpg_number`,`gate`.`gpg_po_number` AS `gpg_po_number`,`gate`.`gpg_transportation_company` AS `gpg_transportation_company`,`gate`.`gpg_company_receiving` AS `gpg_company_receiving`,`gate`.`gpg_driver` AS `gpg_driver`,`gate`.`gpg_truck_no` AS `gpg_truck_no`,`gate`.`gpg_request_return` AS `gpg_request_return`,`gate`.`gpg_security_code` AS `gpg_security_code`,`gate`.`gpg_date_security_confirm` AS `gpg_date_security_confirm`,`gate`.`gpg_security_receiving_code` AS `gpg_security_receiving_code`,`gate`.`gpg_date_security_receiving_confirm` AS `gpg_date_security_receiving_confirm`,`gate`.`gpg_user_receiving` AS `gpg_user_receiving`,`gate`.`gpg_date_user_receiving` AS `gpg_date_user_receiving`,`gate_confirm`.`confirm_department` AS `confirm_group`,`gate_ivt`.`user_id` AS `user_id`,`gate_step`.`approval_group` AS `approval_group` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_gpginfo` `gate` on(`ra`.`id` = `gate`.`request_approval_id`)) left join `tbl_request_approval_gpgconfirm` `gate_confirm` on(`ra`.`id` = `gate_confirm`.`request_approval_id`)) left join `tbl_request_approval_gpginvited` `gate_ivt` on(`ra`.`id` = `gate_ivt`.`request_approval_id`)) left join `tbl_request_approval_steps` `gate_step` on(`ra`.`id` = `gate_step`.`request_approval_id`)) where `ra`.`request_status` <> 1 and `ra`.`form_type` = 12 */;

/*View structure for view vlistapprovaluser */

/*!50001 DROP TABLE IF EXISTS `vlistapprovaluser` */;
/*!50001 DROP VIEW IF EXISTS `vlistapprovaluser` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistapprovaluser` AS (select `rfa_s`.`id` AS `id`,`rfa_s`.`request_approval_id` AS `request_approval_id`,`rfa_s`.`approval_step_number` AS `approval_step_number`,`rfa_s`.`approval_group` AS `approval_group`,`rfa_s`.`approval_status` AS `approval_status`,`rfa_s`.`approval_comment` AS `approval_comment`,`rfa_s`.`approval_by` AS `approval_by`,`rfa_s`.`approval_date` AS `approval_date`,`ag_u`.`user_id` AS `approval_user` from (`tbl_request_approval_steps` `rfa_s` left join `tbl_approval_group_user` `ag_u` on(`rfa_s`.`approval_group` = `ag_u`.`approval_group_id`))) */;

/*View structure for view vlistawaitingreview */

/*!50001 DROP TABLE IF EXISTS `vlistawaitingreview` */;
/*!50001 DROP VIEW IF EXISTS `vlistawaitingreview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistawaitingreview` AS (select `ra`.`id` AS `id`,`ra`.`form_type` AS `form_type`,`ra`.`request_status` AS `request_status`,`rv`.`confirm_status` AS `confirm_status`,`rv`.`confirm_department` AS `confirm_department` from (`tbl_request_approval` `ra` join `tbl_request_approval_gpgconfirm` `rv` on(`ra`.`id` = `rv`.`request_approval_id`)) where `ra`.`request_status` = 2 and `rv`.`confirm_status` = 1 group by `rv`.`request_approval_id`) */;

/*View structure for view vlistawaitingapproval */

/*!50001 DROP TABLE IF EXISTS `vlistawaitingapproval` */;
/*!50001 DROP VIEW IF EXISTS `vlistawaitingapproval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistawaitingapproval` AS (select `ra`.`id` AS `id`,`ra`.`form_type` AS `form_type`,`ra`.`request_status` AS `request_status`,min(`ras`.`approval_step_number`) AS `approval_step_number`,`ras`.`approval_status` AS `approval_status`,`ras`.`approval_group` AS `approval_group` from (`tbl_request_approval` `ra` join `tbl_request_approval_steps` `ras` on(`ra`.`id` = `ras`.`request_approval_id`)) where `ra`.`request_status` in (3,4) and `ras`.`approval_status` in (3,4) group by `ras`.`request_approval_id`) */;

/*View structure for view vgate_approval */

/*!50001 DROP TABLE IF EXISTS `vgate_approval` */;
/*!50001 DROP VIEW IF EXISTS `vgate_approval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgate_approval` AS select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`approved_date` AS `approved_date`,`ra`.`completed_date` AS `completed_date`,`ra`.`expected_date` AS `expected_date`,`gate`.`gpg_type` AS `gpg_type`,`gate`.`gpg_code` AS `gpg_code`,`gate`.`gpg_number` AS `gpg_number`,`gate`.`gpg_po_number` AS `gpg_po_number`,`gate`.`gpg_transportation_company` AS `gpg_transportation_company`,`gate`.`gpg_company_receiving` AS `gpg_company_receiving`,`gate`.`gpg_driver` AS `gpg_driver`,`gate`.`gpg_truck_no` AS `gpg_truck_no`,`gate`.`gpg_request_return` AS `gpg_request_return`,`gate`.`gpg_security_code` AS `gpg_security_code`,`gate`.`gpg_date_security_confirm` AS `gpg_date_security_confirm`,`gate`.`gpg_security_receiving_code` AS `gpg_security_receiving_code`,`gate`.`gpg_date_security_receiving_confirm` AS `gpg_date_security_receiving_confirm`,`gate`.`gpg_user_receiving` AS `gpg_user_receiving`,`gate`.`gpg_date_user_receiving` AS `gpg_date_user_receiving`,`gate_confirm`.`confirm_department` AS `confirm_group`,`gate_ivt`.`user_id` AS `user_id`,`gate_step`.`approval_group` AS `approval_group` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_gpginfo` `gate` on(`ra`.`id` = `gate`.`request_approval_id`)) left join `tbl_request_approval_gpgconfirm` `gate_confirm` on(`ra`.`id` = `gate_confirm`.`request_approval_id`)) left join `tbl_request_approval_gpginvited` `gate_ivt` on(`ra`.`id` = `gate_ivt`.`request_approval_id`)) left join `tbl_request_approval_steps` `gate_step` on(`ra`.`id` = `gate_step`.`request_approval_id`)) where `ra`.`request_status` = 3 and `ra`.`form_type` = 12 */;

/*View structure for view vgate_inprogress */

/*!50001 DROP TABLE IF EXISTS `vgate_inprogress` */;
/*!50001 DROP VIEW IF EXISTS `vgate_inprogress` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vgate_inprogress` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`approved_date` AS `approved_date`,`ra`.`completed_date` AS `completed_date`,`ra`.`expected_date` AS `expected_date`,`gate`.`gpg_type` AS `gpg_type`,`gate`.`gpg_code` AS `gpg_code`,`gate`.`gpg_number` AS `gpg_number`,`gate`.`gpg_po_number` AS `gpg_po_number`,`gate`.`gpg_transportation_company` AS `gpg_transportation_company`,`gate`.`gpg_company_receiving` AS `gpg_company_receiving`,`gate`.`gpg_driver` AS `gpg_driver`,`gate`.`gpg_truck_no` AS `gpg_truck_no`,`gate`.`gpg_request_return` AS `gpg_request_return`,`gate`.`gpg_security_code` AS `gpg_security_code`,`gate`.`gpg_date_security_confirm` AS `gpg_date_security_confirm`,`gate`.`gpg_security_receiving_code` AS `gpg_security_receiving_code`,`gate`.`gpg_date_security_receiving_confirm` AS `gpg_date_security_receiving_confirm`,`gate`.`gpg_user_receiving` AS `gpg_user_receiving`,`gate`.`gpg_date_user_receiving` AS `gpg_date_user_receiving` from (`tbl_request_approval` `ra` left join `tbl_request_approval_gpginfo` `gate` on(`ra`.`id` = `gate`.`request_approval_id`)) where `ra`.`request_status` in (1,5) and `ra`.`form_type` = 12) */;

/*View structure for view vlistreportgate */

/*!50001 DROP TABLE IF EXISTS `vlistreportgate` */;
/*!50001 DROP VIEW IF EXISTS `vlistreportgate` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistreportgate` AS select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`approved_date` AS `approved_date`,`ra`.`completed_date` AS `completed_date`,`ra`.`expected_date` AS `expected_date`,`gate`.`gpg_type` AS `gpg_type`,`gate`.`gpg_code` AS `gpg_code`,`gate`.`gpg_number` AS `gpg_number`,`gate`.`gpg_po_number` AS `gpg_po_number`,`gate`.`gpg_transportation_company` AS `gpg_transportation_company`,`gate`.`gpg_company_receiving` AS `gpg_company_receiving`,`gate`.`gpg_driver` AS `gpg_driver`,`gate`.`gpg_truck_no` AS `gpg_truck_no`,`gate`.`gpg_request_return` AS `gpg_request_return`,`gate`.`gpg_security_code` AS `gpg_security_code`,`gate`.`gpg_date_security_confirm` AS `gpg_date_security_confirm`,`gate`.`gpg_security_receiving_code` AS `gpg_security_receiving_code`,`gate`.`gpg_date_security_receiving_confirm` AS `gpg_date_security_receiving_confirm`,`gate`.`gpg_user_receiving` AS `gpg_user_receiving`,`gate`.`gpg_date_user_receiving` AS `gpg_date_user_receiving`,`gate_confirm`.`confirm_department` AS `confirm_group`,`gate_ivt`.`user_id` AS `user_id`,`gate_step`.`approval_group` AS `approval_group`,`gate_detail`.`dtg_code` AS `dtg_code`,`gate_detail`.`dtg_name` AS `dtg_name`,`gate_detail`.`dtg_unit` AS `dtg_unit`,`gate_detail`.`dtg_quantity` AS `dtg_quantity`,`gate_detail`.`dtg_remark` AS `dtg_remark`,`gate_detail`.`dtg_created_date` AS `dtg_created_date` from (((((`tbl_request_approval` `ra` left join `tbl_request_approval_gpginfo` `gate` on(`ra`.`id` = `gate`.`request_approval_id`)) left join `tbl_request_approval_gpgconfirm` `gate_confirm` on(`ra`.`id` = `gate_confirm`.`request_approval_id`)) left join `tbl_request_approval_gpginvited` `gate_ivt` on(`ra`.`id` = `gate_ivt`.`request_approval_id`)) left join `tbl_request_approval_steps` `gate_step` on(`ra`.`id` = `gate_step`.`request_approval_id`)) left join `tbl_request_approval_gpginfo_detailedgoods` `gate_detail` on(`ra`.`id` = `gate_detail`.`request_approval_id`)) where `ra`.`request_status` in (8,7,6,3,2) and `ra`.`form_type` = 12 */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
