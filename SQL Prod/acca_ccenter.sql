/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - acca_ccenter
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acca_ccenter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `acca_ccenter`;

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
) ENGINE=MyISAM AUTO_INCREMENT=800 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_approval_groups` */

DROP TABLE IF EXISTS `tbl_approval_groups`;

CREATE TABLE `tbl_approval_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `approval_name` varchar(200) DEFAULT NULL,
  `approval_desc` varchar(500) DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `history_price` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22723 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_configurations` */

DROP TABLE IF EXISTS `tbl_configurations`;

CREATE TABLE `tbl_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(150) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `key` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_short_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `listuser_id` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mailto` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mailcc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mailbcc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_maillog` */

DROP TABLE IF EXISTS `tbl_maillog`;

CREATE TABLE `tbl_maillog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail_subject` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail_to` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail_cc` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail_bcc` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `mail_status` tinyint(2) DEFAULT 0 COMMENT '0 Pending 1-5 re_send 6-9 bug 10 ok',
  `status_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Pending',
  `date_done` datetime DEFAULT NULL,
  `attachment_file` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17366 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_maillog_20220728` */

DROP TABLE IF EXISTS `tbl_maillog_20220728`;

CREATE TABLE `tbl_maillog_20220728` (
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
) ENGINE=InnoDB AUTO_INCREMENT=36421 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_maillog_20230808` */

DROP TABLE IF EXISTS `tbl_maillog_20230808`;

CREATE TABLE `tbl_maillog_20230808` (
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
) ENGINE=InnoDB AUTO_INCREMENT=51319 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_price_approval_invited` */

DROP TABLE IF EXISTS `tbl_price_approval_invited`;

CREATE TABLE `tbl_price_approval_invited` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_purchase` */

DROP TABLE IF EXISTS `tbl_purchase`;

CREATE TABLE `tbl_purchase` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_name` varchar(500) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_purchase_user` */

DROP TABLE IF EXISTS `tbl_purchase_user`;

CREATE TABLE `tbl_purchase_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ddl_purchase_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval` */

DROP TABLE IF EXISTS `tbl_request_approval`;

CREATE TABLE `tbl_request_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `form_type` int(5) DEFAULT NULL,
  `request_title` varchar(500) DEFAULT NULL,
  `request_desc` longtext DEFAULT NULL,
  `request_status` int(5) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_archived` int(1) DEFAULT 0,
  `archived_by` int(11) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`,`form_type`,`request_status`)
) ENGINE=InnoDB AUTO_INCREMENT=33329 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccr_attachedfiles` */

DROP TABLE IF EXISTS `tbl_request_approval_ccr_attachedfiles`;

CREATE TABLE `tbl_request_approval_ccr_attachedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `section` int(1) DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `system_file_name` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccr_result_confirm` */

DROP TABLE IF EXISTS `tbl_request_approval_ccr_result_confirm`;

CREATE TABLE `tbl_request_approval_ccr_result_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `confirm_department` int(11) DEFAULT NULL,
  `confirm_status` int(1) DEFAULT 0,
  `confirm_comment` text DEFAULT NULL,
  `confirm_by` int(11) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8358 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccr_result_info` */

DROP TABLE IF EXISTS `tbl_request_approval_ccr_result_info`;

CREATE TABLE `tbl_request_approval_ccr_result_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `ccr_code` varchar(200) DEFAULT NULL,
  `ccr_scope_of_change` varchar(200) DEFAULT NULL,
  `ccr_scope_of_change_other` varchar(200) DEFAULT NULL,
  `ccr_customer` varchar(500) DEFAULT NULL,
  `ccr_job_jacket` varchar(200) DEFAULT NULL,
  `ccr_quantity` varchar(200) DEFAULT NULL,
  `ccr_structure` varchar(200) DEFAULT NULL,
  `ccr_note` text DEFAULT NULL,
  `ccr_relative_dept` varchar(200) DEFAULT NULL,
  `ccr_relative_dept_other` varchar(200) DEFAULT NULL,
  `ccr_user_answer_one` int(11) DEFAULT NULL,
  `ccr_user_answer_two` int(11) DEFAULT NULL,
  `ccr_user_answer_three` int(11) DEFAULT NULL,
  `ccr_answer_question_one` int(2) DEFAULT NULL,
  `ccr_answer_question_two` int(2) DEFAULT NULL,
  `ccr_answer_question_three` int(2) DEFAULT NULL,
  `ccr_note_question_one` text DEFAULT NULL,
  `ccr_note_question_two` text DEFAULT NULL,
  `ccr_note_question_three` text DEFAULT NULL,
  `ccr_change_requirements_by_customer` int(1) DEFAULT NULL,
  `ccr_change_for_improvement` int(1) DEFAULT NULL,
  `ccr_change_other` int(11) DEFAULT NULL,
  `ccr_change_other_value` varchar(200) DEFAULT NULL,
  `ccr_issue_copy_form_to_dept` varchar(200) DEFAULT NULL,
  `cc_verification_by` int(11) DEFAULT NULL,
  `cc_issue_validation_plan` int(11) DEFAULT NULL,
  `cc_verification_date` datetime DEFAULT NULL,
  `ccr_verify_result` varchar(50) DEFAULT NULL,
  `ccr_verify_result_solution` varchar(500) DEFAULT NULL,
  `ccr_verify_result_user_id` int(11) DEFAULT NULL,
  `ccr_verify_result_date` varchar(50) DEFAULT NULL,
  `ccr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1136 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccr_result_invited` */

DROP TABLE IF EXISTS `tbl_request_approval_ccr_result_invited`;

CREATE TABLE `tbl_request_approval_ccr_result_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3300 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccr_result_notes` */

DROP TABLE IF EXISTS `tbl_request_approval_ccr_result_notes`;

CREATE TABLE `tbl_request_approval_ccr_result_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1124 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccr_result_verify` */

DROP TABLE IF EXISTS `tbl_request_approval_ccr_result_verify`;

CREATE TABLE `tbl_request_approval_ccr_result_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `ccr_result_checklist` varchar(500) DEFAULT NULL,
  `ccr_result_status` int(1) DEFAULT NULL COMMENT 'Kết quả [pass/ fail]',
  `ccr_result_type` varchar(200) DEFAULT NULL COMMENT 'Chuẩn SOP/ SOM',
  `ccr_result_action_by` varchar(50) DEFAULT NULL,
  `ccr_result_reviewed_by` varchar(50) DEFAULT NULL,
  `ccr_result_note` text DEFAULT NULL,
  `ccr_result_date` date DEFAULT NULL,
  `ccr_evaluation` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6499 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccrconfirm` */

DROP TABLE IF EXISTS `tbl_request_approval_ccrconfirm`;

CREATE TABLE `tbl_request_approval_ccrconfirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `confirm_department` int(11) DEFAULT NULL,
  `confirm_status` int(1) DEFAULT 0,
  `confirm_comment` text DEFAULT NULL,
  `confirm_by` int(11) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24585 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccrdepartment` */

DROP TABLE IF EXISTS `tbl_request_approval_ccrdepartment`;

CREATE TABLE `tbl_request_approval_ccrdepartment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `displayed_order` int(11) DEFAULT NULL,
  `ccr` int(2) DEFAULT 0,
  `ccr_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_request_approval_ccrdepartment_user` */

DROP TABLE IF EXISTS `tbl_request_approval_ccrdepartment_user`;

CREATE TABLE `tbl_request_approval_ccrdepartment_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id` (`department_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccrinfo` */

DROP TABLE IF EXISTS `tbl_request_approval_ccrinfo`;

CREATE TABLE `tbl_request_approval_ccrinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `ccr_code` varchar(200) DEFAULT NULL,
  `ccr_scope_of_change` varchar(200) DEFAULT NULL,
  `ccr_scope_of_change_other` varchar(200) DEFAULT NULL,
  `ccr_customer` varchar(500) DEFAULT NULL,
  `ccr_job_jacket` varchar(200) DEFAULT NULL,
  `ccr_quantity` varchar(200) DEFAULT NULL,
  `ccr_structure` varchar(200) DEFAULT NULL,
  `ccr_note` text DEFAULT NULL,
  `ccr_relative_dept` varchar(200) DEFAULT NULL,
  `ccr_relative_dept_other` varchar(200) DEFAULT NULL,
  `ccr_user_answer_one` int(11) DEFAULT NULL,
  `ccr_user_answer_two` int(11) DEFAULT NULL,
  `ccr_user_answer_three` int(11) DEFAULT NULL,
  `ccr_answer_question_one` int(2) DEFAULT NULL,
  `ccr_answer_question_two` int(2) DEFAULT NULL,
  `ccr_answer_question_three` int(2) DEFAULT NULL,
  `ccr_note_question_one` text DEFAULT NULL,
  `ccr_note_question_two` text DEFAULT NULL,
  `ccr_note_question_three` text DEFAULT NULL,
  `ccr_change_requirements_by_customer` int(1) DEFAULT NULL,
  `ccr_change_for_improvement` int(1) DEFAULT NULL,
  `ccr_change_other` int(11) DEFAULT NULL,
  `ccr_change_other_value` varchar(200) DEFAULT NULL,
  `ccr_issue_copy_form_to_dept` varchar(200) DEFAULT NULL,
  `cc_verification_by` int(11) DEFAULT NULL,
  `cc_issue_validation_plan` int(11) DEFAULT NULL,
  `cc_verification_date` datetime DEFAULT NULL,
  `ccr_verify_result` varchar(50) DEFAULT NULL,
  `ccr_verify_result_solution` varchar(500) DEFAULT NULL,
  `ccr_verify_result_user_id` int(11) DEFAULT NULL,
  `ccr_verify_result_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1897 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccrinfo_20210602` */

DROP TABLE IF EXISTS `tbl_request_approval_ccrinfo_20210602`;

CREATE TABLE `tbl_request_approval_ccrinfo_20210602` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `ccr_code` varchar(200) DEFAULT NULL,
  `ccr_scope_of_change` varchar(200) DEFAULT NULL,
  `ccr_scope_of_change_other` varchar(200) DEFAULT NULL,
  `ccr_customer` varchar(500) DEFAULT NULL,
  `ccr_job_jacket` varchar(200) DEFAULT NULL,
  `ccr_quantity` varchar(200) DEFAULT NULL,
  `ccr_structure` varchar(200) DEFAULT NULL,
  `ccr_note` text DEFAULT NULL,
  `ccr_relative_dept` varchar(200) DEFAULT NULL,
  `ccr_relative_dept_other` varchar(200) DEFAULT NULL,
  `ccr_user_answer_one` int(11) DEFAULT NULL,
  `ccr_user_answer_two` int(11) DEFAULT NULL,
  `ccr_user_answer_three` int(11) DEFAULT NULL,
  `ccr_answer_question_one` int(2) DEFAULT 0,
  `ccr_answer_question_two` int(2) DEFAULT 0,
  `ccr_answer_question_three` int(2) DEFAULT 0,
  `ccr_note_question_one` text DEFAULT NULL,
  `ccr_note_question_two` text DEFAULT NULL,
  `ccr_note_question_three` text DEFAULT NULL,
  `ccr_change_requirements_by_customer` int(1) DEFAULT NULL,
  `ccr_change_for_improvement` int(1) DEFAULT NULL,
  `ccr_issue_copy_form_to_dept` varchar(200) DEFAULT NULL,
  `cc_verification_by` int(11) DEFAULT NULL,
  `cc_issue_validation_plan` int(11) DEFAULT NULL,
  `cc_verification_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccrinfo_follow_actions` */

DROP TABLE IF EXISTS `tbl_request_approval_ccrinfo_follow_actions`;

CREATE TABLE `tbl_request_approval_ccrinfo_follow_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `ccr_follow_process` varchar(200) DEFAULT NULL,
  `follow_up` varchar(500) DEFAULT NULL,
  `ccr_follow_deadline` date DEFAULT NULL,
  `ccr_process_name` varchar(200) DEFAULT NULL,
  `user_pic` varchar(200) DEFAULT NULL,
  `user_sign_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3438 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccrinvited` */

DROP TABLE IF EXISTS `tbl_request_approval_ccrinvited`;

CREATE TABLE `tbl_request_approval_ccrinvited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15709 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccrnotes` */

DROP TABLE IF EXISTS `tbl_request_approval_ccrnotes`;

CREATE TABLE `tbl_request_approval_ccrnotes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5072 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_ccrverify_result` */

DROP TABLE IF EXISTS `tbl_request_approval_ccrverify_result`;

CREATE TABLE `tbl_request_approval_ccrverify_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) NOT NULL,
  `review_by` int(11) DEFAULT NULL,
  `verify_head` int(11) DEFAULT NULL,
  `verify_head_by` int(11) DEFAULT NULL,
  `verify_head_status` int(1) DEFAULT 0,
  `verify_head_date` datetime DEFAULT NULL,
  `verify_manager` int(11) DEFAULT NULL,
  `verify_manager_status` int(1) DEFAULT 0,
  `verify_manager_by` int(11) DEFAULT NULL,
  `verify_manager_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `ccr_result_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_cylinde_attachedfiles` */

DROP TABLE IF EXISTS `tbl_request_approval_cylinde_attachedfiles`;

CREATE TABLE `tbl_request_approval_cylinde_attachedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `section` int(1) DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `system_file_name` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8882 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_cylinder_confirm` */

DROP TABLE IF EXISTS `tbl_request_approval_cylinder_confirm`;

CREATE TABLE `tbl_request_approval_cylinder_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `confirm_status` int(1) DEFAULT 0,
  `confirm_comment` text DEFAULT NULL,
  `confirm_by` int(11) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `confirm_department` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2237 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_cylinder_ddl` */

DROP TABLE IF EXISTS `tbl_request_approval_cylinder_ddl`;

CREATE TABLE `tbl_request_approval_cylinder_ddl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `section` varchar(20) DEFAULT NULL,
  `display_order` float DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_cylinder_ddl_cate` */

DROP TABLE IF EXISTS `tbl_request_approval_cylinder_ddl_cate`;

CREATE TABLE `tbl_request_approval_cylinder_ddl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cate_name_vn` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_cylinder_info` */

DROP TABLE IF EXISTS `tbl_request_approval_cylinder_info`;

CREATE TABLE `tbl_request_approval_cylinder_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `cylinder_code` varchar(200) DEFAULT NULL,
  `supplier` int(5) DEFAULT NULL,
  `QCSP` varchar(250) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  `cylinder_status` int(5) DEFAULT NULL,
  `quantity` varchar(10) DEFAULT NULL,
  `cylinder_type` int(5) DEFAULT NULL,
  `cylinder_type_other` varchar(100) DEFAULT NULL,
  `size_perimeter` varchar(100) DEFAULT NULL,
  `size_length` varchar(100) DEFAULT NULL,
  `size_note` varchar(100) DEFAULT NULL,
  `print_material` varchar(250) DEFAULT NULL,
  `film_size` varchar(250) DEFAULT NULL,
  `print_area` int(5) DEFAULT NULL,
  `effective_proof` int(1) DEFAULT 0,
  `effective_file` int(1) DEFAULT 0,
  `effective_sample_bag` int(1) DEFAULT 0,
  `effective_other` int(1) DEFAULT 0,
  `effective_other_value` varchar(100) DEFAULT NULL,
  `company_logo` int(1) DEFAULT 0,
  `color_name_1` varchar(50) DEFAULT NULL,
  `color_name_2` varchar(50) DEFAULT NULL,
  `color_name_3` varchar(50) DEFAULT NULL,
  `color_name_4` varchar(50) DEFAULT NULL,
  `color_name_5` varchar(50) DEFAULT NULL,
  `color_name_6` varchar(50) DEFAULT NULL,
  `color_name_7` varchar(50) DEFAULT NULL,
  `color_name_8` varchar(50) DEFAULT NULL,
  `color_name_9` varchar(50) DEFAULT NULL,
  `color_name_10` varchar(50) DEFAULT NULL,
  `cylinder_key_1` varchar(50) DEFAULT NULL,
  `cylinder_key_2` varchar(50) DEFAULT NULL,
  `cylinder_key_3` varchar(50) DEFAULT NULL,
  `cylinder_key_4` varchar(50) DEFAULT NULL,
  `cylinder_key_5` varchar(50) DEFAULT NULL,
  `cylinder_key_6` varchar(50) DEFAULT NULL,
  `cylinder_key_7` varchar(50) DEFAULT NULL,
  `cylinder_key_8` varchar(50) DEFAULT NULL,
  `cylinder_key_9` varchar(50) DEFAULT NULL,
  `cylinder_key_10` varchar(50) DEFAULT NULL,
  `product_width` varchar(50) DEFAULT NULL,
  `product_height` varchar(50) DEFAULT NULL,
  `page_number_width` varchar(50) DEFAULT NULL,
  `page_number_height` varchar(50) DEFAULT NULL,
  `file_info_cromalin` int(1) DEFAULT 0,
  `file_info_proof` int(1) DEFAULT 0,
  `file_info_layout` int(1) DEFAULT 0,
  `file_info_color` int(1) DEFAULT 0,
  `page_layout` varchar(250) DEFAULT NULL,
  `other_note` text DEFAULT NULL,
  `ink_type` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2274 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_cylinder_invited` */

DROP TABLE IF EXISTS `tbl_request_approval_cylinder_invited`;

CREATE TABLE `tbl_request_approval_cylinder_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19972 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_cylinder_notes` */

DROP TABLE IF EXISTS `tbl_request_approval_cylinder_notes`;

CREATE TABLE `tbl_request_approval_cylinder_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5585 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_invited` */

DROP TABLE IF EXISTS `tbl_request_approval_invited`;

CREATE TABLE `tbl_request_approval_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invited_index` (`request_approval_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29594 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_invited_20210615` */

DROP TABLE IF EXISTS `tbl_request_approval_invited_20210615`;

CREATE TABLE `tbl_request_approval_invited_20210615` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6004 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_jj_confirm` */

DROP TABLE IF EXISTS `tbl_request_approval_jj_confirm`;

CREATE TABLE `tbl_request_approval_jj_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `confirm_department` int(11) DEFAULT NULL,
  `confirm_status` int(1) DEFAULT 0,
  `confirm_comment` text DEFAULT NULL,
  `confirm_by` int(11) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jj_confirm` (`request_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52499 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_jj_invited` */

DROP TABLE IF EXISTS `tbl_request_approval_jj_invited`;

CREATE TABLE `tbl_request_approval_jj_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jj_invited` (`request_approval_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9162 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_jjinfo` */

DROP TABLE IF EXISTS `tbl_request_approval_jjinfo`;

CREATE TABLE `tbl_request_approval_jjinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `jj_number` varchar(32) DEFAULT NULL,
  `jj_job_jacket` varchar(32) DEFAULT NULL,
  `jj_version` varchar(2) DEFAULT NULL,
  `jj_fg_code` varchar(32) DEFAULT NULL,
  `jj_product_name` varchar(255) DEFAULT NULL,
  `jj_type` char(1) DEFAULT NULL,
  `jj_type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15798 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_notes` */

DROP TABLE IF EXISTS `tbl_request_approval_notes`;

CREATE TABLE `tbl_request_approval_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28745 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo`;

CREATE TABLE `tbl_request_approval_npdinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `npd_number` varchar(200) DEFAULT NULL,
  `npd_code` varchar(200) DEFAULT NULL,
  `npd_job_jacket` varchar(200) DEFAULT NULL,
  `npd_fg_code` varchar(200) DEFAULT NULL,
  `npd_purpose` varchar(200) DEFAULT NULL,
  `npd_purpose_other` varchar(200) DEFAULT NULL,
  `npd_customer` varchar(500) DEFAULT NULL,
  `npd_structure` varchar(200) DEFAULT NULL,
  `npd_received_date` datetime DEFAULT NULL,
  `npd_bl_blown` int(1) DEFAULT 0,
  `npd_bl_fg_code` varchar(200) DEFAULT NULL,
  `npd_bl_job_jacket` varchar(200) DEFAULT NULL,
  `npd_bl_corona_treatment` varchar(500) DEFAULT NULL,
  `npd_bl_ratio_mixing` varchar(500) DEFAULT NULL,
  `npd_bl_note` text DEFAULT NULL,
  `npd_bl_class` int(11) DEFAULT NULL,
  `npd_pr_printing` int(1) DEFAULT 0,
  `npd_pr_note` text DEFAULT NULL,
  `npd_la_laminating` int(1) DEFAULT 0,
  `npd_la_note` text DEFAULT NULL,
  `npd_rw_rewinding` int(1) DEFAULT 0,
  `npd_rw_note` text DEFAULT NULL,
  `npd_sl_slitting` int(1) DEFAULT 0,
  `npd_sl_note` text DEFAULT NULL,
  `npd_bm_bag_making` int(1) DEFAULT 0,
  `npd_bm_note` text DEFAULT NULL,
  `npd_review_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `npd_index` (`request_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3275 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo_20211125` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo_20211125`;

CREATE TABLE `tbl_request_approval_npdinfo_20211125` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `npd_number` varchar(200) DEFAULT NULL,
  `npd_code` varchar(200) DEFAULT NULL,
  `npd_job_jacket` varchar(200) DEFAULT NULL,
  `npd_fg_code` varchar(200) DEFAULT NULL,
  `npd_purpose` varchar(200) DEFAULT NULL,
  `npd_purpose_other` varchar(200) DEFAULT NULL,
  `npd_customer` varchar(500) DEFAULT NULL,
  `npd_structure` varchar(200) DEFAULT NULL,
  `npd_received_date` datetime DEFAULT NULL,
  `npd_bl_blown` int(1) DEFAULT 0,
  `npd_bl_fg_code` varchar(200) DEFAULT NULL,
  `npd_bl_job_jacket` varchar(200) DEFAULT NULL,
  `npd_bl_corona_treatment` varchar(500) DEFAULT NULL,
  `npd_bl_ratio_mixing` varchar(500) DEFAULT NULL,
  `npd_bl_note` text DEFAULT NULL,
  `npd_pr_printing` int(1) DEFAULT 0,
  `npd_pr_note` text DEFAULT NULL,
  `npd_la_laminating` int(1) DEFAULT 0,
  `npd_la_note` text DEFAULT NULL,
  `npd_rw_rewinding` int(1) DEFAULT 0,
  `npd_rw_note` text DEFAULT NULL,
  `npd_sl_slitting` int(1) DEFAULT 0,
  `npd_sl_note` text DEFAULT NULL,
  `npd_bm_bag_making` int(1) DEFAULT 0,
  `npd_bm_note` text DEFAULT NULL,
  `npd_review_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `npd_index` (`request_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1150 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo_bl` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo_bl`;

CREATE TABLE `tbl_request_approval_npdinfo_bl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `bl_type` int(1) DEFAULT 0,
  `bl_fomula_name` varchar(250) DEFAULT NULL,
  `bl_reversion` varchar(250) DEFAULT NULL,
  `bl_material_code` varchar(50) DEFAULT NULL,
  `bl_material_name` varchar(500) DEFAULT NULL,
  `bl_screw_a` varchar(100) DEFAULT NULL,
  `bl_screw_b` varchar(100) DEFAULT NULL,
  `bl_screw_c` varchar(100) DEFAULT NULL,
  `bl_screw_d` varchar(100) DEFAULT NULL,
  `bl_screw_e` varchar(100) DEFAULT NULL,
  `bl_unit` varchar(10) DEFAULT NULL,
  `bl_quantity` int(11) DEFAULT NULL,
  `bl_warehouse` varchar(10) DEFAULT NULL,
  `bl_remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4618 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo_bm` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo_bm`;

CREATE TABLE `tbl_request_approval_npdinfo_bm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `bm_quantity` int(11) DEFAULT NULL,
  `bm_size` varchar(500) DEFAULT NULL,
  `bm_remark` varchar(500) DEFAULT NULL,
  `bm_type_of_bag` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo_la` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo_la`;

CREATE TABLE `tbl_request_approval_npdinfo_la` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `la_material_code` varchar(50) DEFAULT NULL,
  `la_material_name` varchar(500) DEFAULT NULL,
  `la_unit` varchar(10) DEFAULT NULL,
  `la_quantity` int(11) DEFAULT NULL,
  `la_warehouse` varchar(10) DEFAULT NULL,
  `la_remark` varchar(500) DEFAULT NULL,
  `la_manufacturer` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19481 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo_label` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo_label`;

CREATE TABLE `tbl_request_approval_npdinfo_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(500) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `printed_date` datetime DEFAULT NULL,
  `reprinted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo_label_details` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo_label_details`;

CREATE TABLE `tbl_request_approval_npdinfo_label_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `print_label_id` int(11) DEFAULT NULL,
  `label_code` varchar(200) DEFAULT NULL,
  `label_job_jacket` varchar(200) DEFAULT NULL,
  `label_fg_code` varchar(200) DEFAULT NULL,
  `label_customer` varchar(200) DEFAULT NULL,
  `label_quantity_copy` int(10) DEFAULT NULL,
  `label_product_name` varchar(200) DEFAULT NULL,
  `label_quantity_bag_roll` int(11) DEFAULT NULL,
  `label_dimension` varchar(200) DEFAULT NULL,
  `label_net_weight` varchar(200) DEFAULT NULL,
  `label_gross_weight` varchar(200) DEFAULT NULL,
  `label_manfacturing_date` date DEFAULT NULL,
  `request_approval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo_pr` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo_pr`;

CREATE TABLE `tbl_request_approval_npdinfo_pr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `pr_material_code` varchar(50) DEFAULT NULL,
  `pr_material_name` varchar(500) DEFAULT NULL,
  `pr_unit` varchar(10) DEFAULT NULL,
  `pr_quantity` int(11) DEFAULT NULL,
  `pr_warehouse` varchar(10) DEFAULT NULL,
  `pr_remark` varchar(500) DEFAULT NULL,
  `pr_manufacturer` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32421 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo_rw` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo_rw`;

CREATE TABLE `tbl_request_approval_npdinfo_rw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `rw_quantity` int(11) DEFAULT NULL,
  `rw_width` varchar(200) DEFAULT NULL,
  `rw_length` varchar(200) DEFAULT NULL,
  `rw_unwinding_direction` varchar(500) DEFAULT NULL,
  `rw_remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdinfo_sl` */

DROP TABLE IF EXISTS `tbl_request_approval_npdinfo_sl`;

CREATE TABLE `tbl_request_approval_npdinfo_sl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `sl_quantity` int(11) DEFAULT NULL,
  `sl_width` varchar(200) DEFAULT NULL,
  `sl_length` varchar(200) DEFAULT NULL,
  `sl_unwinding_direction` varchar(500) DEFAULT NULL,
  `sl_remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1215 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_npdreview_bl` */

DROP TABLE IF EXISTS `tbl_request_approval_npdreview_bl`;

CREATE TABLE `tbl_request_approval_npdreview_bl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT 0,
  `bl_type` int(1) DEFAULT 0,
  `bl_fomula_name` varchar(250) DEFAULT NULL,
  `bl_reversion` varchar(250) DEFAULT NULL,
  `bl_material_code` varchar(50) DEFAULT NULL,
  `bl_material_name` varchar(500) DEFAULT NULL,
  `bl_screw_a` varchar(100) DEFAULT NULL,
  `bl_screw_b` varchar(100) DEFAULT NULL,
  `bl_screw_c` varchar(100) DEFAULT NULL,
  `bl_unit` varchar(10) DEFAULT NULL,
  `bl_quantity` int(11) DEFAULT NULL,
  `bl_warehouse` varchar(10) DEFAULT NULL,
  `bl_remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_price_attachedfiles` */

DROP TABLE IF EXISTS `tbl_request_approval_price_attachedfiles`;

CREATE TABLE `tbl_request_approval_price_attachedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `note_id` bigint(20) DEFAULT 0,
  `step_id` bigint(20) NOT NULL DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `system_file_name` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11646 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_price_confirm` */

DROP TABLE IF EXISTS `tbl_request_approval_price_confirm`;

CREATE TABLE `tbl_request_approval_price_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `confirm_status` int(1) DEFAULT 0,
  `confirm_comment` text DEFAULT NULL,
  `confirm_by` int(11) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`,`confirm_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_price_info` */

DROP TABLE IF EXISTS `tbl_request_approval_price_info`;

CREATE TABLE `tbl_request_approval_price_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `pr_form_type` int(11) DEFAULT NULL,
  `pr_code` varchar(200) DEFAULT NULL,
  `pr_no` varchar(200) DEFAULT NULL,
  `pr_total_price` varchar(200) DEFAULT NULL,
  `pr_activiti_price` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `pr_purpose` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_approval_id` (`request_approval_id`,`pr_form_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4705 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_price_invited` */

DROP TABLE IF EXISTS `tbl_request_approval_price_invited`;

CREATE TABLE `tbl_request_approval_price_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`request_approval_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9201 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_price_material_items` */

DROP TABLE IF EXISTS `tbl_request_approval_price_material_items`;

CREATE TABLE `tbl_request_approval_price_material_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `manufacturer_code` varchar(50) DEFAULT NULL,
  `suplier` varchar(200) DEFAULT NULL,
  `price_term` varchar(200) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `price_note` text DEFAULT NULL,
  `delivery` varchar(100) DEFAULT NULL,
  `pallet_type` varchar(100) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `payment` varchar(200) DEFAULT NULL,
  `is_archived` int(11) DEFAULT NULL,
  `created_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5066 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_price_material_items_detail` */

DROP TABLE IF EXISTS `tbl_request_approval_price_material_items_detail`;

CREATE TABLE `tbl_request_approval_price_material_items_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL,
  `material_code` varchar(50) DEFAULT NULL,
  `material_name` varchar(200) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `material_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2695 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_price_notes` */

DROP TABLE IF EXISTS `tbl_request_approval_price_notes`;

CREATE TABLE `tbl_request_approval_price_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10254 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_purchase_attachedfiles` */

DROP TABLE IF EXISTS `tbl_request_approval_purchase_attachedfiles`;

CREATE TABLE `tbl_request_approval_purchase_attachedfiles` (
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
) ENGINE=InnoDB AUTO_INCREMENT=881 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_purchase_confirm` */

DROP TABLE IF EXISTS `tbl_request_approval_purchase_confirm`;

CREATE TABLE `tbl_request_approval_purchase_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `confirm_status` int(1) DEFAULT 0,
  `confirm_comment` text DEFAULT NULL,
  `confirm_by` int(11) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `estimated_delivery_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6386 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_purchase_form` */

DROP TABLE IF EXISTS `tbl_request_approval_purchase_form`;

CREATE TABLE `tbl_request_approval_purchase_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `estimated_date` date DEFAULT NULL,
  `purpose` varchar(1000) DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_approval_id` int(11) DEFAULT NULL,
  `pr_code` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10838 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_request_approval_purchase_info` */

DROP TABLE IF EXISTS `tbl_request_approval_purchase_info`;

CREATE TABLE `tbl_request_approval_purchase_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `pr_number` varchar(32) DEFAULT NULL,
  `pr_type` int(1) DEFAULT NULL,
  `pr_phone` varchar(32) DEFAULT NULL,
  `pr_notes` varchar(500) DEFAULT NULL,
  `estimated_delivery_by` int(11) DEFAULT NULL,
  `estimated_delivery_date` date DEFAULT NULL,
  `department_end_user` int(11) DEFAULT NULL,
  `ps_no` varchar(32) DEFAULT NULL,
  `NguoiYeuCau` varchar(200) DEFAULT NULL,
  `TenBoPhan` varchar(200) DEFAULT NULL,
  `NgayPsNhap` varchar(200) DEFAULT NULL,
  `DienGiaiChung` varchar(500) DEFAULT NULL,
  `NgayGetPs` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2763 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_purchase_invited` */

DROP TABLE IF EXISTS `tbl_request_approval_purchase_invited`;

CREATE TABLE `tbl_request_approval_purchase_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1937 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_purchase_notes` */

DROP TABLE IF EXISTS `tbl_request_approval_purchase_notes`;

CREATE TABLE `tbl_request_approval_purchase_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5402 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_spec_attachedfiles` */

DROP TABLE IF EXISTS `tbl_request_approval_spec_attachedfiles`;

CREATE TABLE `tbl_request_approval_spec_attachedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `section` int(1) DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `system_file_name` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2216 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_spec_confirm` */

DROP TABLE IF EXISTS `tbl_request_approval_spec_confirm`;

CREATE TABLE `tbl_request_approval_spec_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `confirm_status` int(1) DEFAULT 0,
  `confirm_comment` text DEFAULT NULL,
  `confirm_by` int(11) DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `confirm_department` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2041 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_spec_info` */

DROP TABLE IF EXISTS `tbl_request_approval_spec_info`;

CREATE TABLE `tbl_request_approval_spec_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `spec_code` varchar(200) DEFAULT NULL,
  `spec_version` varchar(50) DEFAULT NULL,
  `QCSP` varchar(250) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  `spec_status` int(5) DEFAULT NULL,
  `spec_notes` varchar(500) DEFAULT '0',
  `customer_short_name` varchar(200) DEFAULT NULL,
  `checkbox_bom` int(11) DEFAULT NULL,
  `checkbox_qcsp` int(11) DEFAULT NULL,
  `checkbox_blow` int(11) DEFAULT NULL,
  `checkbox_lamination` int(11) DEFAULT NULL,
  `checkbox_slitting` int(11) DEFAULT NULL,
  `checkbox_bag` int(11) DEFAULT NULL,
  `checkbox_print` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2032 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_spec_invited` */

DROP TABLE IF EXISTS `tbl_request_approval_spec_invited`;

CREATE TABLE `tbl_request_approval_spec_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_spec_notes` */

DROP TABLE IF EXISTS `tbl_request_approval_spec_notes`;

CREATE TABLE `tbl_request_approval_spec_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2096 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  PRIMARY KEY (`id`),
  KEY `approval_step` (`request_approval_id`),
  KEY `approval_step_number` (`approval_step_number`,`approval_group`,`approval_status`)
) ENGINE=InnoDB AUTO_INCREMENT=75105 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  KEY `confirm_index` (`request_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1421 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_role_matrix` */

DROP TABLE IF EXISTS `tbl_role_matrix`;

CREATE TABLE `tbl_role_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_key` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `column_hide` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/* Procedure structure for procedure `st_clone_ccrresult` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_clone_ccrresult` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_clone_ccrresult`(
	IN `user_id` INT(11),
	IN `ccr_id` INT(11),
	OUT `ccr_result_id` INT(11)
)
BEGIN
  CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_temp AS (SELECT * FROM tbl_request_approval WHERE id=ccr_id);
  UPDATE tbl_request_approval_temp SET id= 0,request_status =1,due_date=NULL,form_type=42,created_by = user_id,created_date=DATE_FORMAT(NOW(), '%Y-%m-%d %T.%f'),updated_date=DATE_FORMAT(NOW(), '%Y-%m-%d %T.%f')  WHERE id=ccr_id; ## Change the unique key
  ## Duplicate request approval and get new request approval ID
  INSERT INTO tbl_request_approval SELECT * FROM tbl_request_approval_temp;
  SET ccr_result_id = LAST_INSERT_ID();
  SELECT ccr_result_id;
  DROP TABLE tbl_request_approval_temp;
		## Duplicate request approval info and update new 
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_ccrinfo_temp AS (SELECT *, 0 AS ccr_id  FROM tbl_request_approval_ccrinfo WHERE request_approval_id=ccr_id);
		UPDATE tbl_request_approval_ccrinfo_temp SET id= 0,request_approval_id =ccr_result_id,ccr_id = ccr_id, ccr_user_answer_one = user_id, ccr_user_answer_two = user_id, ccr_user_answer_three = user_id WHERE request_approval_id=ccr_id; ## Change the unique key
		INSERT INTO `tbl_request_approval_ccr_result_info` SELECT * FROM tbl_request_approval_ccrinfo_temp;
		DROP TABLE tbl_request_approval_ccrinfo_temp;
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_clone_npd` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_clone_npd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_clone_npd`(
    IN npd_id INT(11),
    OUT new_npd_id INT(11)
    )
BEGIN
  CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_temp AS (SELECT * FROM tbl_request_approval WHERE id=npd_id);
  UPDATE tbl_request_approval_temp SET id= 0,request_status =1,due_date=NULL,created_date=DATE_FORMAT(NOW(), '%Y-%m-%d %T.%f'),updated_date=DATE_FORMAT(NOW(), '%Y-%m-%d %T.%f')  WHERE id=npd_id; ## Change the unique key
  ## Duplicate request approval and get new request approval ID
  INSERT INTO tbl_request_approval SELECT * FROM tbl_request_approval_temp;
  SET new_npd_id = LAST_INSERT_ID();
  SELECT new_npd_id;
  DROP TABLE tbl_request_approval_temp;
		## Duplicate request approval info and update new 
		UPDATE `tbl_form_number` SET `current_no` = current_no + 1 WHERE `form_type` = 12;
		SET @CURCODE 		= (SELECT current_no FROM `tbl_form_number` WHERE `form_type` = 12);
		SET @npd_number 	= LPAD(@CURCODE,6,0);
		SET @new_npd_code 	= CONCAT('.',@npd_number ,'.');
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_npdinfo_temp AS (SELECT * FROM tbl_request_approval_npdinfo WHERE request_approval_id=npd_id);
		UPDATE tbl_request_approval_npdinfo_temp SET id= 0, request_approval_id =new_npd_id,npd_number = @npd_number ,npd_code = @new_npd_code,npd_received_date=NULL WHERE request_approval_id=npd_id; ## Change the unique key
		INSERT INTO tbl_request_approval_npdinfo SELECT * FROM tbl_request_approval_npdinfo_temp;
		DROP TABLE tbl_request_approval_npdinfo_temp;
		
		## Duplicate npdinfo (BL) info and update new 
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_npdinfo_bl_temp AS (SELECT * FROM tbl_request_approval_npdinfo_bl WHERE request_approval_id=npd_id);
		UPDATE tbl_request_approval_npdinfo_bl_temp SET id= 0, request_approval_id =new_npd_id WHERE request_approval_id=npd_id; ## Change the unique key
		INSERT INTO tbl_request_approval_npdinfo_bl SELECT * FROM tbl_request_approval_npdinfo_bl_temp;
		DROP TABLE tbl_request_approval_npdinfo_bl_temp;
		
		## Duplicate npdinfo (PR) info and update new 
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_npdinfo_pr_temp AS (SELECT * FROM tbl_request_approval_npdinfo_pr WHERE request_approval_id=npd_id);
		UPDATE tbl_request_approval_npdinfo_pr_temp SET id= 0, request_approval_id =new_npd_id WHERE request_approval_id=npd_id; ## Change the unique key
		INSERT INTO tbl_request_approval_npdinfo_pr SELECT * FROM tbl_request_approval_npdinfo_pr_temp;
		DROP TABLE tbl_request_approval_npdinfo_pr_temp;
		
		## Duplicate npdinfo (LA) info and update new 
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_npdinfo_la_temp AS (SELECT * FROM tbl_request_approval_npdinfo_la WHERE request_approval_id=npd_id);
		UPDATE tbl_request_approval_npdinfo_la_temp SET id= 0, request_approval_id =new_npd_id WHERE request_approval_id=npd_id; ## Change the unique key
		INSERT INTO tbl_request_approval_npdinfo_la SELECT * FROM tbl_request_approval_npdinfo_la_temp;
		DROP TABLE tbl_request_approval_npdinfo_la_temp;
		
		## Duplicate npdinfo (RW) info and update new 
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_npdinfo_rw_temp AS (SELECT * FROM tbl_request_approval_npdinfo_rw WHERE request_approval_id=npd_id);
		UPDATE tbl_request_approval_npdinfo_rw_temp SET id= 0, request_approval_id =new_npd_id WHERE request_approval_id=npd_id; ## Change the unique key
		INSERT INTO tbl_request_approval_npdinfo_rw SELECT * FROM tbl_request_approval_npdinfo_rw_temp;
		DROP TABLE tbl_request_approval_npdinfo_rw_temp;
		
		## Duplicate npdinfo (SL) info and update new 
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_npdinfo_sl_temp AS (SELECT * FROM tbl_request_approval_npdinfo_sl WHERE request_approval_id=npd_id);
		UPDATE tbl_request_approval_npdinfo_sl_temp SET id= 0, request_approval_id =new_npd_id WHERE request_approval_id=npd_id; ## Change the unique key
		INSERT INTO tbl_request_approval_npdinfo_sl SELECT * FROM tbl_request_approval_npdinfo_sl_temp;
		DROP TABLE tbl_request_approval_npdinfo_sl_temp;
		
		## Duplicate npdinfo (BM) info and update new 
		CREATE TEMPORARY TABLE IF NOT EXISTS tbl_request_approval_npdinfo_bm_temp AS (SELECT * FROM tbl_request_approval_npdinfo_bm WHERE request_approval_id=npd_id);
		UPDATE tbl_request_approval_npdinfo_bm_temp SET id= 0, request_approval_id =new_npd_id WHERE request_approval_id=npd_id; ## Change the unique key
		INSERT INTO tbl_request_approval_npdinfo_bm SELECT * FROM tbl_request_approval_npdinfo_bm_temp;
		DROP TABLE tbl_request_approval_npdinfo_bm_temp;
END */$$
DELIMITER ;

/*Table structure for table `vlistjj_cancelled20230728` */

DROP TABLE IF EXISTS `vlistjj_cancelled20230728`;

/*!50001 DROP VIEW IF EXISTS `vlistjj_cancelled20230728` */;
/*!50001 DROP TABLE IF EXISTS `vlistjj_cancelled20230728` */;

/*!50001 CREATE TABLE  `vlistjj_cancelled20230728`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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
 `confirm_group` int(11) ,
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) 
)*/;

/*Table structure for table `vlistreportplaning` */

DROP TABLE IF EXISTS `vlistreportplaning`;

/*!50001 DROP VIEW IF EXISTS `vlistreportplaning` */;
/*!50001 DROP TABLE IF EXISTS `vlistreportplaning` */;

/*!50001 CREATE TABLE  `vlistreportplaning`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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
 `confirm_group` int(11) ,
 `confirm_status` int(1) ,
 `ccr_code` varchar(200) ,
 `ccr_job_jacket` varchar(200) 
)*/;

/*Table structure for table `vlistjj_awatting20230728` */

DROP TABLE IF EXISTS `vlistjj_awatting20230728`;

/*!50001 DROP VIEW IF EXISTS `vlistjj_awatting20230728` */;
/*!50001 DROP TABLE IF EXISTS `vlistjj_awatting20230728` */;

/*!50001 CREATE TABLE  `vlistjj_awatting20230728`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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
 `confirm_group` int(11) ,
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) 
)*/;

/*Table structure for table `vlistccr_approval_sendmail` */

DROP TABLE IF EXISTS `vlistccr_approval_sendmail`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_approval_sendmail` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_approval_sendmail` */;

/*!50001 CREATE TABLE  `vlistccr_approval_sendmail`(
 `id` int(11) ,
 `form_type` int(5) ,
 `department_id` int(11) ,
 `request_desc` longtext ,
 `created_by` int(11) ,
 `submit_date` datetime ,
 `request_title` varchar(500) ,
 `ccr_customer` varchar(500) ,
 `ccr_quantity` varchar(200) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_code` varchar(200) ,
 `approval_step_number` int(2) ,
 `approval_status` int(1) ,
 `approval_date` datetime ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vlistjjapproval20230728` */

DROP TABLE IF EXISTS `vlistjjapproval20230728`;

/*!50001 DROP VIEW IF EXISTS `vlistjjapproval20230728` */;
/*!50001 DROP TABLE IF EXISTS `vlistjjapproval20230728` */;

/*!50001 CREATE TABLE  `vlistjjapproval20230728`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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
 `confirm_group` int(11) ,
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) 
)*/;

/*Table structure for table `vlistcylinder_inprogress` */

DROP TABLE IF EXISTS `vlistcylinder_inprogress`;

/*!50001 DROP VIEW IF EXISTS `vlistcylinder_inprogress` */;
/*!50001 DROP TABLE IF EXISTS `vlistcylinder_inprogress` */;

/*!50001 CREATE TABLE  `vlistcylinder_inprogress`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `cylinder_code` varchar(200) ,
 `product_name` varchar(500) ,
 `approval_group` int(11) ,
 `approval_date` datetime ,
 `confirm_by` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistccr_result_confirmluser` */

DROP TABLE IF EXISTS `vlistccr_result_confirmluser`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_result_confirmluser` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_result_confirmluser` */;

/*!50001 CREATE TABLE  `vlistccr_result_confirmluser`(
 `request_approval_id` int(11) ,
 `confirm_department` int(11) ,
 `confirm_status` int(1) ,
 `confirm_by` int(11) ,
 `confirm_date` datetime ,
 `confirm_user` int(11) 
)*/;

/*Table structure for table `vlistccr_inprogress` */

DROP TABLE IF EXISTS `vlistccr_inprogress`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_inprogress` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_inprogress` */;

/*!50001 CREATE TABLE  `vlistccr_inprogress`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `ccr_code` varchar(200) ,
 `ccr_scope_of_change` varchar(200) ,
 `ccr_scope_of_change_other` varchar(200) ,
 `ccr_customer` varchar(500) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_quantity` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_change_requirements_by_customer` int(1) ,
 `ccr_change_for_improvement` int(1) 
)*/;

/*Table structure for table `vliststandardapproval` */

DROP TABLE IF EXISTS `vliststandardapproval`;

/*!50001 DROP VIEW IF EXISTS `vliststandardapproval` */;
/*!50001 DROP TABLE IF EXISTS `vliststandardapproval` */;

/*!50001 CREATE TABLE  `vliststandardapproval`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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

/*Table structure for table `vlistpurchaseawaiting20230807` */

DROP TABLE IF EXISTS `vlistpurchaseawaiting20230807`;

/*!50001 DROP VIEW IF EXISTS `vlistpurchaseawaiting20230807` */;
/*!50001 DROP TABLE IF EXISTS `vlistpurchaseawaiting20230807` */;

/*!50001 CREATE TABLE  `vlistpurchaseawaiting20230807`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `pr_number` varchar(32) ,
 `pr_notes` varchar(500) ,
 `approval_group` int(11) ,
 `ps_no` varchar(32) ,
 `confirm_by` int(11) ,
 `user_id` int(11) ,
 `approval_date` datetime 
)*/;

/*Table structure for table `vlistnpdapproval` */

DROP TABLE IF EXISTS `vlistnpdapproval`;

/*!50001 DROP VIEW IF EXISTS `vlistnpdapproval` */;
/*!50001 DROP TABLE IF EXISTS `vlistnpdapproval` */;

/*!50001 CREATE TABLE  `vlistnpdapproval`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `npd_code` varchar(200) ,
 `npd_job_jacket` varchar(200) ,
 `npd_fg_code` varchar(200) ,
 `npd_purpose` varchar(200) ,
 `npd_purpose_other` varchar(200) ,
 `npd_customer` varchar(500) ,
 `npd_structure` varchar(200) ,
 `npd_received_date` datetime ,
 `npd_bl_fg_code` varchar(200) ,
 `npd_bl_job_jacket` varchar(200) 
)*/;

/*Table structure for table `vlistspec_inprogress` */

DROP TABLE IF EXISTS `vlistspec_inprogress`;

/*!50001 DROP VIEW IF EXISTS `vlistspec_inprogress` */;
/*!50001 DROP TABLE IF EXISTS `vlistspec_inprogress` */;

/*!50001 CREATE TABLE  `vlistspec_inprogress`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `spec_code` varchar(200) ,
 `product_name` varchar(500) ,
 `spec_version` varchar(50) ,
 `QCSP` varchar(250) ,
 `approval_group` int(11) ,
 `approval_date` datetime ,
 `confirm_by` int(11) ,
 `confirm_date` datetime ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistjj_confirm_user` */

DROP TABLE IF EXISTS `vlistjj_confirm_user`;

/*!50001 DROP VIEW IF EXISTS `vlistjj_confirm_user` */;
/*!50001 DROP TABLE IF EXISTS `vlistjj_confirm_user` */;

/*!50001 CREATE TABLE  `vlistjj_confirm_user`(
 `request_approval_id` int(11) ,
 `confirm_department` int(11) ,
 `confirm_status` int(1) ,
 `confirm_by` int(11) ,
 `confirm_date` datetime ,
 `confirm_user` int(11) 
)*/;

/*Table structure for table `vlistprice_pending` */

DROP TABLE IF EXISTS `vlistprice_pending`;

/*!50001 DROP VIEW IF EXISTS `vlistprice_pending` */;
/*!50001 DROP TABLE IF EXISTS `vlistprice_pending` */;

/*!50001 CREATE TABLE  `vlistprice_pending`(
 `id` int(11) ,
 `department_id` int(11) ,
 `count_date` int(7) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `pr_code` varchar(200) ,
 `pr_total_price` varchar(200) ,
 `approval_group` int(11) ,
 `approval_step_number` int(2) ,
 `approval_date` datetime ,
 `approval_by` int(11) ,
 `confirm_by` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistccr_report` */

DROP TABLE IF EXISTS `vlistccr_report`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_report` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_report` */;

/*!50001 CREATE TABLE  `vlistccr_report`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `ccr_code` varchar(200) ,
 `ccr_change_other_value` varchar(200) ,
 `ccr_scope_of_change` varchar(200) ,
 `ccr_scope_of_change_other` varchar(200) ,
 `ccr_customer` varchar(500) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_quantity` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_change_requirements_by_customer` int(1) ,
 `ccr_change_for_improvement` int(1) ,
 `approval_group` int(11) ,
 `confirm_group` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistpurchaseinprogress` */

DROP TABLE IF EXISTS `vlistpurchaseinprogress`;

/*!50001 DROP VIEW IF EXISTS `vlistpurchaseinprogress` */;
/*!50001 DROP TABLE IF EXISTS `vlistpurchaseinprogress` */;

/*!50001 CREATE TABLE  `vlistpurchaseinprogress`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `pr_notes` varchar(500) ,
 `pr_number` varchar(32) ,
 `approval_group` int(11) ,
 `ps_no` varchar(32) ,
 `approval_date` datetime ,
 `confirm_by` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistprice_report` */

DROP TABLE IF EXISTS `vlistprice_report`;

/*!50001 DROP VIEW IF EXISTS `vlistprice_report` */;
/*!50001 DROP TABLE IF EXISTS `vlistprice_report` */;

/*!50001 CREATE TABLE  `vlistprice_report`(
 `id` int(11) ,
 `department_id` int(11) ,
 `count_date` int(7) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
 `request_desc` binary(0) ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `archived_date` datetime ,
 `pr_code` varchar(200) ,
 `pr_total_price` varchar(200) 
)*/;

/*Table structure for table `vlistccr_result_inprogress` */

DROP TABLE IF EXISTS `vlistccr_result_inprogress`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_result_inprogress` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_result_inprogress` */;

/*!50001 CREATE TABLE  `vlistccr_result_inprogress`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `ccr_code` varchar(200) ,
 `ccr_scope_of_change` varchar(200) ,
 `ccr_scope_of_change_other` varchar(200) ,
 `ccr_customer` varchar(500) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_quantity` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_change_requirements_by_customer` int(1) ,
 `ccr_change_for_improvement` int(1) 
)*/;

/*Table structure for table `vlistprice_pending_Khang` */

DROP TABLE IF EXISTS `vlistprice_pending_Khang`;

/*!50001 DROP VIEW IF EXISTS `vlistprice_pending_Khang` */;
/*!50001 DROP TABLE IF EXISTS `vlistprice_pending_Khang` */;

/*!50001 CREATE TABLE  `vlistprice_pending_Khang`(
 `id` int(11) ,
 `department_id` int(11) ,
 `count_date` int(7) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `pr_code` varchar(200) ,
 `pr_total_price` varchar(200) ,
 `approval_group` int(11) ,
 `approval_step_number` int(2) ,
 `approval_date` datetime ,
 `approval_by` int(11) ,
 `confirm_by` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistjjapprovalall` */

DROP TABLE IF EXISTS `vlistjjapprovalall`;

/*!50001 DROP VIEW IF EXISTS `vlistjjapprovalall` */;
/*!50001 DROP TABLE IF EXISTS `vlistjjapprovalall` */;

/*!50001 CREATE TABLE  `vlistjjapprovalall`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) ,
 `jj_type` char(1) ,
 `jj_type_name` varchar(100) 
)*/;

/*Table structure for table `vlistnpdarchived` */

DROP TABLE IF EXISTS `vlistnpdarchived`;

/*!50001 DROP VIEW IF EXISTS `vlistnpdarchived` */;
/*!50001 DROP TABLE IF EXISTS `vlistnpdarchived` */;

/*!50001 CREATE TABLE  `vlistnpdarchived`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `group_approval` mediumtext ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `archived_date` datetime ,
 `npd_code` varchar(200) ,
 `npd_job_jacket` varchar(200) ,
 `npd_fg_code` varchar(200) ,
 `npd_purpose` varchar(200) ,
 `npd_purpose_other` varchar(200) ,
 `npd_customer` varchar(500) ,
 `npd_structure` varchar(200) ,
 `npd_received_date` datetime ,
 `npd_bl_fg_code` varchar(200) ,
 `npd_bl_job_jacket` varchar(200) ,
 `approval_group` int(11) 
)*/;

/*Table structure for table `vlistcylinder_awaiting` */

DROP TABLE IF EXISTS `vlistcylinder_awaiting`;

/*!50001 DROP VIEW IF EXISTS `vlistcylinder_awaiting` */;
/*!50001 DROP TABLE IF EXISTS `vlistcylinder_awaiting` */;

/*!50001 CREATE TABLE  `vlistcylinder_awaiting`(
 `id` int(11) ,
 `department_id` int(11) ,
 `count_date` int(7) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `cylinder_code` varchar(200) ,
 `QCSP` varchar(250) ,
 `cylinder_type_other` varchar(100) ,
 `quantity` varchar(10) ,
 `product_name` varchar(500) ,
 `approval_group` int(11) ,
 `approval_date` datetime ,
 `confirm_by` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistccr_result_awaiting` */

DROP TABLE IF EXISTS `vlistccr_result_awaiting`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_result_awaiting` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_result_awaiting` */;

/*!50001 CREATE TABLE  `vlistccr_result_awaiting`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `ccr_code` varchar(200) ,
 `ccr_scope_of_change` varchar(200) ,
 `ccr_scope_of_change_other` varchar(200) ,
 `ccr_customer` varchar(500) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_quantity` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_change_requirements_by_customer` int(1) ,
 `ccr_change_for_improvement` int(1) ,
 `approval_group` int(11) ,
 `confirm_group` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistccr_info` */

DROP TABLE IF EXISTS `vlistccr_info`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_info` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_info` */;

/*!50001 CREATE TABLE  `vlistccr_info`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `ccr_code` varchar(200) ,
 `ccr_scope_of_change` varchar(200) ,
 `ccr_scope_of_change_other` varchar(200) ,
 `ccr_customer` varchar(500) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_quantity` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_change_requirements_by_customer` int(1) ,
 `ccr_change_for_improvement` int(1) ,
 `ccr_id` int(11) 
)*/;

/*Table structure for table `vlistnpd_approved` */

DROP TABLE IF EXISTS `vlistnpd_approved`;

/*!50001 DROP VIEW IF EXISTS `vlistnpd_approved` */;
/*!50001 DROP TABLE IF EXISTS `vlistnpd_approved` */;

/*!50001 CREATE TABLE  `vlistnpd_approved`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `npd_code` varchar(200) ,
 `npd_job_jacket` varchar(200) ,
 `npd_fg_code` varchar(200) ,
 `npd_purpose` varchar(200) ,
 `npd_purpose_other` varchar(200) ,
 `npd_customer` varchar(500) ,
 `npd_structure` varchar(200) ,
 `npd_received_date` datetime ,
 `npd_bl_fg_code` varchar(200) ,
 `npd_bl_job_jacket` varchar(200) ,
 `approval_group` int(11) ,
 `user_id` int(11) ,
 `confirm_by` int(11) 
)*/;

/*Table structure for table `vlistprice_waitingforyourapproval` */

DROP TABLE IF EXISTS `vlistprice_waitingforyourapproval`;

/*!50001 DROP VIEW IF EXISTS `vlistprice_waitingforyourapproval` */;
/*!50001 DROP TABLE IF EXISTS `vlistprice_waitingforyourapproval` */;

/*!50001 CREATE TABLE  `vlistprice_waitingforyourapproval`(
 `id` int(11) ,
 `department_id` int(11) ,
 `count_date` int(7) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `pr_code` varchar(200) ,
 `pr_total_price` varchar(200) ,
 `approval_group` int(11) ,
 `approval_step_number` int(2) ,
 `approval_date` datetime ,
 `approval_by` int(11) 
)*/;

/*Table structure for table `vlistccr_result_completed` */

DROP TABLE IF EXISTS `vlistccr_result_completed`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_result_completed` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_result_completed` */;

/*!50001 CREATE TABLE  `vlistccr_result_completed`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `ccr_code` varchar(200) ,
 `ccr_scope_of_change` varchar(200) ,
 `ccr_scope_of_change_other` varchar(200) ,
 `ccr_customer` varchar(500) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_quantity` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_change_requirements_by_customer` int(1) ,
 `ccr_change_for_improvement` int(1) ,
 `approval_group` int(11) ,
 `confirm_group` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlist_purchase_user` */

DROP TABLE IF EXISTS `vlist_purchase_user`;

/*!50001 DROP VIEW IF EXISTS `vlist_purchase_user` */;
/*!50001 DROP TABLE IF EXISTS `vlist_purchase_user` */;

/*!50001 CREATE TABLE  `vlist_purchase_user`(
 `request_approval_id` int(11) ,
 `confirm_status` int(1) ,
 `confirm_by` int(11) ,
 `confirm_date` datetime ,
 `confirm_user` int(11) 
)*/;

/*Table structure for table `vlistjjapprovalall20230728` */

DROP TABLE IF EXISTS `vlistjjapprovalall20230728`;

/*!50001 DROP VIEW IF EXISTS `vlistjjapprovalall20230728` */;
/*!50001 DROP TABLE IF EXISTS `vlistjjapprovalall20230728` */;

/*!50001 CREATE TABLE  `vlistjjapprovalall20230728`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) 
)*/;

/*Table structure for table `vlistprice_inprogress` */

DROP TABLE IF EXISTS `vlistprice_inprogress`;

/*!50001 DROP VIEW IF EXISTS `vlistprice_inprogress` */;
/*!50001 DROP TABLE IF EXISTS `vlistprice_inprogress` */;

/*!50001 CREATE TABLE  `vlistprice_inprogress`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `pr_code` varchar(200) ,
 `approval_by` int(11) ,
 `pr_total_price` varchar(200) 
)*/;

/*Table structure for table `vlistnpd_inprogress` */

DROP TABLE IF EXISTS `vlistnpd_inprogress`;

/*!50001 DROP VIEW IF EXISTS `vlistnpd_inprogress` */;
/*!50001 DROP TABLE IF EXISTS `vlistnpd_inprogress` */;

/*!50001 CREATE TABLE  `vlistnpd_inprogress`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `npd_code` varchar(200) ,
 `npd_job_jacket` varchar(200) ,
 `npd_fg_code` varchar(200) ,
 `npd_purpose` varchar(200) ,
 `npd_purpose_other` varchar(200) ,
 `npd_customer` varchar(500) ,
 `npd_structure` varchar(200) ,
 `npd_received_date` datetime ,
 `npd_bl_fg_code` varchar(200) ,
 `npd_bl_job_jacket` varchar(200) 
)*/;

/*Table structure for table `vlistspec_awaiting` */

DROP TABLE IF EXISTS `vlistspec_awaiting`;

/*!50001 DROP VIEW IF EXISTS `vlistspec_awaiting` */;
/*!50001 DROP TABLE IF EXISTS `vlistspec_awaiting` */;

/*!50001 CREATE TABLE  `vlistspec_awaiting`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `spec_code` varchar(200) ,
 `product_name` varchar(500) ,
 `spec_version` varchar(50) ,
 `QCSP` varchar(250) ,
 `approval_group` int(11) ,
 `approval_date` datetime ,
 `confirm_by` int(11) ,
 `confirm_date` datetime ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistapprovalreview` */

DROP TABLE IF EXISTS `vlistapprovalreview`;

/*!50001 DROP VIEW IF EXISTS `vlistapprovalreview` */;
/*!50001 DROP TABLE IF EXISTS `vlistapprovalreview` */;

/*!50001 CREATE TABLE  `vlistapprovalreview`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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

/*Table structure for table `vlistccr_result_approval` */

DROP TABLE IF EXISTS `vlistccr_result_approval`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_result_approval` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_result_approval` */;

/*!50001 CREATE TABLE  `vlistccr_result_approval`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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
 `confirm_group` int(11) 
)*/;

/*Table structure for table `vlistnpd_report` */

DROP TABLE IF EXISTS `vlistnpd_report`;

/*!50001 DROP VIEW IF EXISTS `vlistnpd_report` */;
/*!50001 DROP TABLE IF EXISTS `vlistnpd_report` */;

/*!50001 CREATE TABLE  `vlistnpd_report`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
 `request_desc` longtext ,
 `request_status` int(5) ,
 `group_approval` mediumtext ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `archived_date` datetime ,
 `npd_code` varchar(200) ,
 `npd_job_jacket` varchar(200) ,
 `npd_fg_code` varchar(200) ,
 `npd_purpose` varchar(200) ,
 `npd_purpose_other` varchar(200) ,
 `npd_customer` varchar(500) ,
 `npd_structure` varchar(200) ,
 `npd_received_date` datetime ,
 `npd_bl_fg_code` varchar(200) ,
 `npd_bl_job_jacket` varchar(200) 
)*/;

/*Table structure for table `vlistprice_awaiting` */

DROP TABLE IF EXISTS `vlistprice_awaiting`;

/*!50001 DROP VIEW IF EXISTS `vlistprice_awaiting` */;
/*!50001 DROP TABLE IF EXISTS `vlistprice_awaiting` */;

/*!50001 CREATE TABLE  `vlistprice_awaiting`(
 `id` int(11) ,
 `department_id` int(11) ,
 `count_date` int(7) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
 `request_desc` binary(0) ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `archived_date` datetime ,
 `pr_code` varchar(200) ,
 `pr_total_price` varchar(200) ,
 `approval_group` int(11) ,
 `approval_date` datetime ,
 `approval_by` int(11) ,
 `confirm_by` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistccr_confirmluser` */

DROP TABLE IF EXISTS `vlistccr_confirmluser`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_confirmluser` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_confirmluser` */;

/*!50001 CREATE TABLE  `vlistccr_confirmluser`(
 `request_approval_id` int(11) ,
 `confirm_department` int(11) ,
 `confirm_status` int(1) ,
 `confirm_by` int(11) ,
 `confirm_date` datetime ,
 `confirm_user` int(11) 
)*/;

/*Table structure for table `vlistjj_cancelled` */

DROP TABLE IF EXISTS `vlistjj_cancelled`;

/*!50001 DROP VIEW IF EXISTS `vlistjj_cancelled` */;
/*!50001 DROP TABLE IF EXISTS `vlistjj_cancelled` */;

/*!50001 CREATE TABLE  `vlistjj_cancelled`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
 `request_desc` longtext ,
 `form_type` int(5) ,
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
 `confirm_group` int(11) ,
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) ,
 `jj_type` char(1) ,
 `jj_type_name` varchar(100) 
)*/;

/*Table structure for table `vlistnpd_awaiting` */

DROP TABLE IF EXISTS `vlistnpd_awaiting`;

/*!50001 DROP VIEW IF EXISTS `vlistnpd_awaiting` */;
/*!50001 DROP TABLE IF EXISTS `vlistnpd_awaiting` */;

/*!50001 CREATE TABLE  `vlistnpd_awaiting`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `npd_code` varchar(200) ,
 `npd_job_jacket` varchar(200) ,
 `npd_fg_code` varchar(200) ,
 `npd_purpose` varchar(200) ,
 `npd_purpose_other` varchar(200) ,
 `npd_customer` varchar(500) ,
 `npd_structure` varchar(200) ,
 `npd_received_date` datetime ,
 `npd_bl_fg_code` varchar(200) ,
 `npd_bl_job_jacket` varchar(200) ,
 `approval_group` int(11) ,
 `user_id` int(11) ,
 `confirm_by` int(11) 
)*/;

/*Table structure for table `vlistjj_awatting` */

DROP TABLE IF EXISTS `vlistjj_awatting`;

/*!50001 DROP VIEW IF EXISTS `vlistjj_awatting` */;
/*!50001 DROP TABLE IF EXISTS `vlistjj_awatting` */;

/*!50001 CREATE TABLE  `vlistjj_awatting`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
 `request_desc` longtext ,
 `form_type` int(5) ,
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
 `confirm_group` int(11) ,
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) ,
 `jj_type` char(1) ,
 `jj_type_name` varchar(100) 
)*/;

/*Table structure for table `vlistpurchaseawaiting` */

DROP TABLE IF EXISTS `vlistpurchaseawaiting`;

/*!50001 DROP VIEW IF EXISTS `vlistpurchaseawaiting` */;
/*!50001 DROP TABLE IF EXISTS `vlistpurchaseawaiting` */;

/*!50001 CREATE TABLE  `vlistpurchaseawaiting`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `pr_number` varchar(32) ,
 `pr_notes` varchar(500) ,
 `approval_group` int(11) ,
 `ps_no` varchar(32) ,
 `confirm_by` int(11) ,
 `user_id` int(11) ,
 `approval_date` datetime 
)*/;

/*Table structure for table `vlistccr_result_waitingfor` */

DROP TABLE IF EXISTS `vlistccr_result_waitingfor`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_result_waitingfor` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_result_waitingfor` */;

/*!50001 CREATE TABLE  `vlistccr_result_waitingfor`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `ccr_code` varchar(200) ,
 `ccr_scope_of_change` varchar(200) ,
 `ccr_scope_of_change_other` varchar(200) ,
 `ccr_customer` varchar(500) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_quantity` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_change_requirements_by_customer` int(1) ,
 `ccr_change_for_improvement` int(1) ,
 `approval_group` int(11) ,
 `confirm_group` int(11) ,
 `user_id` int(11) ,
 `approval_step_number` int(2) ,
 `approval_status` int(1) 
)*/;

/*Table structure for table `vlistccr_awaiting` */

DROP TABLE IF EXISTS `vlistccr_awaiting`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_awaiting` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_awaiting` */;

/*!50001 CREATE TABLE  `vlistccr_awaiting`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `ccr_code` varchar(200) ,
 `ccr_scope_of_change` varchar(200) ,
 `ccr_scope_of_change_other` varchar(200) ,
 `ccr_customer` varchar(500) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_quantity` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_change_requirements_by_customer` int(1) ,
 `ccr_change_for_improvement` int(1) ,
 `approval_group` int(11) ,
 `confirm_group` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistuserplaning` */

DROP TABLE IF EXISTS `vlistuserplaning`;

/*!50001 DROP VIEW IF EXISTS `vlistuserplaning` */;
/*!50001 DROP TABLE IF EXISTS `vlistuserplaning` */;

/*!50001 CREATE TABLE  `vlistuserplaning`(
 `request_approval_id` int(11) ,
 `confirm_department` int(11) ,
 `confirm_status` int(1) ,
 `confirm_by` int(11) ,
 `confirm_date` datetime ,
 `confirm_user` int(11) 
)*/;

/*Table structure for table `vlist_ccrconfirm_sendmail` */

DROP TABLE IF EXISTS `vlist_ccrconfirm_sendmail`;

/*!50001 DROP VIEW IF EXISTS `vlist_ccrconfirm_sendmail` */;
/*!50001 DROP TABLE IF EXISTS `vlist_ccrconfirm_sendmail` */;

/*!50001 CREATE TABLE  `vlist_ccrconfirm_sendmail`(
 `id` int(11) ,
 `form_type` int(5) ,
 `department_id` int(11) ,
 `request_desc` longtext ,
 `created_by` int(11) ,
 `submit_date` datetime ,
 `request_title` varchar(500) ,
 `ccr_customer` varchar(500) ,
 `ccr_quantity` varchar(200) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_code` varchar(200) ,
 `approval_step_number` int(2) ,
 `approval_status` int(1) ,
 `approval_date` datetime ,
 `confirm_date` datetime 
)*/;

/*Table structure for table `vlistccrapproval` */

DROP TABLE IF EXISTS `vlistccrapproval`;

/*!50001 DROP VIEW IF EXISTS `vlistccrapproval` */;
/*!50001 DROP TABLE IF EXISTS `vlistccrapproval` */;

/*!50001 CREATE TABLE  `vlistccrapproval`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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
 `confirm_group` int(11) 
)*/;

/*Table structure for table `vlistprice_awaiting20230804` */

DROP TABLE IF EXISTS `vlistprice_awaiting20230804`;

/*!50001 DROP VIEW IF EXISTS `vlistprice_awaiting20230804` */;
/*!50001 DROP TABLE IF EXISTS `vlistprice_awaiting20230804` */;

/*!50001 CREATE TABLE  `vlistprice_awaiting20230804`(
 `id` int(11) ,
 `department_id` int(11) ,
 `count_date` int(7) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
 `request_desc` binary(0) ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `archived_date` datetime ,
 `pr_code` varchar(200) ,
 `pr_total_price` varchar(200) ,
 `approval_group` int(11) ,
 `approval_date` datetime ,
 `approval_by` int(11) ,
 `confirm_by` int(11) ,
 `user_id` int(11) 
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

/*Table structure for table `vlistcylinder_user` */

DROP TABLE IF EXISTS `vlistcylinder_user`;

/*!50001 DROP VIEW IF EXISTS `vlistcylinder_user` */;
/*!50001 DROP TABLE IF EXISTS `vlistcylinder_user` */;

/*!50001 CREATE TABLE  `vlistcylinder_user`(
 `request_approval_id` int(11) ,
 `confirm_department` int(11) ,
 `confirm_status` int(1) ,
 `confirm_by` int(11) ,
 `confirm_date` datetime ,
 `confirm_user` int(11) 
)*/;

/*Table structure for table `vlistjjapproval` */

DROP TABLE IF EXISTS `vlistjjapproval`;

/*!50001 DROP VIEW IF EXISTS `vlistjjapproval` */;
/*!50001 DROP TABLE IF EXISTS `vlistjjapproval` */;

/*!50001 CREATE TABLE  `vlistjjapproval`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
 `request_desc` longtext ,
 `form_type` int(5) ,
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
 `confirm_group` int(11) ,
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) ,
 `jj_type` char(1) ,
 `jj_type_name` varchar(100) 
)*/;

/*Table structure for table `vlistccr_completed` */

DROP TABLE IF EXISTS `vlistccr_completed`;

/*!50001 DROP VIEW IF EXISTS `vlistccr_completed` */;
/*!50001 DROP TABLE IF EXISTS `vlistccr_completed` */;

/*!50001 CREATE TABLE  `vlistccr_completed`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
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
 `ccr_code` varchar(200) ,
 `ccr_scope_of_change` varchar(200) ,
 `ccr_scope_of_change_other` varchar(200) ,
 `ccr_customer` varchar(500) ,
 `ccr_job_jacket` varchar(200) ,
 `ccr_quantity` varchar(200) ,
 `ccr_structure` varchar(200) ,
 `ccr_change_requirements_by_customer` int(1) ,
 `ccr_change_for_improvement` int(1) ,
 `approval_group` int(11) ,
 `confirm_group` int(11) ,
 `user_id` int(11) 
)*/;

/*Table structure for table `vlistpurchaseafullview` */

DROP TABLE IF EXISTS `vlistpurchaseafullview`;

/*!50001 DROP VIEW IF EXISTS `vlistpurchaseafullview` */;
/*!50001 DROP TABLE IF EXISTS `vlistpurchaseafullview` */;

/*!50001 CREATE TABLE  `vlistpurchaseafullview`(
 `id` int(11) ,
 `department_id` int(11) ,
 `form_type` int(5) ,
 `request_title` varchar(500) ,
 `request_desc` binary(0) ,
 `request_status` int(5) ,
 `due_date` datetime ,
 `created_by` int(11) ,
 `created_date` datetime ,
 `submit_date` datetime ,
 `updated_date` datetime ,
 `is_archived` int(1) ,
 `archived_by` int(11) ,
 `archived_date` datetime ,
 `pr_number` varchar(32) ,
 `pr_notes` varchar(500) ,
 `ps_no` varchar(32) ,
 `approval_date` datetime 
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

/*Table structure for table `vlistreportjj` */

DROP TABLE IF EXISTS `vlistreportjj`;

/*!50001 DROP VIEW IF EXISTS `vlistreportjj` */;
/*!50001 DROP TABLE IF EXISTS `vlistreportjj` */;

/*!50001 CREATE TABLE  `vlistreportjj`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
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
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) ,
 `notes` text 
)*/;

/*Table structure for table `vlistjjinprogress` */

DROP TABLE IF EXISTS `vlistjjinprogress`;

/*!50001 DROP VIEW IF EXISTS `vlistjjinprogress` */;
/*!50001 DROP TABLE IF EXISTS `vlistjjinprogress` */;

/*!50001 CREATE TABLE  `vlistjjinprogress`(
 `id` int(11) ,
 `department_id` int(11) ,
 `request_title` varchar(500) ,
 `request_desc` longtext ,
 `form_type` int(5) ,
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
 `confirm_group` int(11) ,
 `jj_number` varchar(32) ,
 `jj_job_jacket` varchar(32) ,
 `jj_version` varchar(2) ,
 `jj_fg_code` varchar(32) ,
 `jj_product_name` varchar(255) ,
 `jj_type` char(1) ,
 `jj_type_name` varchar(100) 
)*/;

/*View structure for view vlistjj_cancelled20230728 */

/*!50001 DROP TABLE IF EXISTS `vlistjj_cancelled20230728` */;
/*!50001 DROP VIEW IF EXISTS `vlistjj_cancelled20230728` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistjj_cancelled20230728` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`jj_confirm`.`confirm_department` AS `confirm_group`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name` from ((((`tbl_request_approval` `treq_apr` left join (select `tbl_request_approval_steps`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_steps`.`approval_group` AS `approval_group` from `tbl_request_approval_steps`) `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join (select `tbl_request_approval_jj_invited`.`user_id` AS `user_id`,`tbl_request_approval_jj_invited`.`request_approval_id` AS `request_approval_id` from `tbl_request_approval_jj_invited`) `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join (select `tbl_request_approval_jj_confirm`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jj_confirm`.`confirm_department` AS `confirm_department` from `tbl_request_approval_jj_confirm`) `jj_confirm` on(`treq_apr`.`id` = `jj_confirm`.`request_approval_id`)) left join (select `tbl_request_approval_jjinfo`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jjinfo`.`jj_number` AS `jj_number`,`tbl_request_approval_jjinfo`.`jj_job_jacket` AS `jj_job_jacket`,`tbl_request_approval_jjinfo`.`jj_version` AS `jj_version`,`tbl_request_approval_jjinfo`.`jj_fg_code` AS `jj_fg_code`,`tbl_request_approval_jjinfo`.`jj_product_name` AS `jj_product_name` from `tbl_request_approval_jjinfo`) `jj_info` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) where `treq_apr`.`request_status` = 41 and `treq_apr`.`form_type` = 40 and `treq_apr`.`id` > 19000 */;

/*View structure for view vlistreportplaning */

/*!50001 DROP TABLE IF EXISTS `vlistreportplaning` */;
/*!50001 DROP VIEW IF EXISTS `vlistreportplaning` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistreportplaning` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`ccr_confirm`.`confirm_department` AS `confirm_group`,`ccr_confirm`.`confirm_status` AS `confirm_status`,`ccr_info`.`ccr_code` AS `ccr_code`,`ccr_info`.`ccr_job_jacket` AS `ccr_job_jacket` from ((((`tbl_request_approval` `treq_apr` left join `tbl_request_approval_steps` `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join `tbl_request_approval_ccrinfo` `ccr_info` on(`treq_apr`.`id` = `ccr_info`.`request_approval_id`)) left join `tbl_request_approval_invited` `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join `tbl_request_approval_ccrconfirm` `ccr_confirm` on(`treq_apr`.`id` = `ccr_confirm`.`request_approval_id`)) where `treq_apr`.`request_status` in (37,5) and `treq_apr`.`form_type` = 19 and `ccr_confirm`.`confirm_department` = 9 */;

/*View structure for view vlistjj_awatting20230728 */

/*!50001 DROP TABLE IF EXISTS `vlistjj_awatting20230728` */;
/*!50001 DROP VIEW IF EXISTS `vlistjj_awatting20230728` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistjj_awatting20230728` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`jj_confirm`.`confirm_department` AS `confirm_group`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name` from ((((`tbl_request_approval` `treq_apr` left join (select `tbl_request_approval_steps`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_steps`.`approval_group` AS `approval_group` from `tbl_request_approval_steps`) `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join (select `tbl_request_approval_jj_invited`.`user_id` AS `user_id`,`tbl_request_approval_jj_invited`.`request_approval_id` AS `request_approval_id` from `tbl_request_approval_jj_invited`) `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join (select `tbl_request_approval_jj_confirm`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jj_confirm`.`confirm_department` AS `confirm_department` from `tbl_request_approval_jj_confirm`) `jj_confirm` on(`treq_apr`.`id` = `jj_confirm`.`request_approval_id`)) left join (select `tbl_request_approval_jjinfo`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jjinfo`.`jj_number` AS `jj_number`,`tbl_request_approval_jjinfo`.`jj_job_jacket` AS `jj_job_jacket`,`tbl_request_approval_jjinfo`.`jj_version` AS `jj_version`,`tbl_request_approval_jjinfo`.`jj_fg_code` AS `jj_fg_code`,`tbl_request_approval_jjinfo`.`jj_product_name` AS `jj_product_name` from `tbl_request_approval_jjinfo`) `jj_info` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) where `treq_apr`.`request_status` in (2,3) and `treq_apr`.`form_type` = 40 */;

/*View structure for view vlistccr_approval_sendmail */

/*!50001 DROP TABLE IF EXISTS `vlistccr_approval_sendmail` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_approval_sendmail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistccr_approval_sendmail` AS (select `tbl_approval`.`id` AS `id`,`tbl_approval`.`form_type` AS `form_type`,`tbl_approval`.`department_id` AS `department_id`,`tbl_approval`.`request_desc` AS `request_desc`,`tbl_approval`.`created_by` AS `created_by`,`tbl_approval`.`submit_date` AS `submit_date`,`tbl_approval`.`request_title` AS `request_title`,`tbl_info`.`ccr_customer` AS `ccr_customer`,`tbl_info`.`ccr_quantity` AS `ccr_quantity`,`tbl_info`.`ccr_job_jacket` AS `ccr_job_jacket`,`tbl_info`.`ccr_structure` AS `ccr_structure`,`tbl_info`.`ccr_code` AS `ccr_code`,`tbl_steps`.`approval_step_number` AS `approval_step_number`,`tbl_steps`.`approval_status` AS `approval_status`,`tbl_steps`.`approval_date` AS `approval_date`,`tbl_steps`.`approval_group` AS `approval_group` from (((select `tbl_request_approval_steps`.`request_approval_id` AS `request_approval_id`,max(`tbl_request_approval_steps`.`approval_step_number`) AS `approval_step_number`,`tbl_request_approval_steps`.`approval_date` AS `approval_date`,`tbl_request_approval_steps`.`approval_status` AS `approval_status`,`tbl_request_approval_steps`.`approval_group` AS `approval_group` from `tbl_request_approval_steps` where `tbl_request_approval_steps`.`approval_date` > '2021-09-02' group by `tbl_request_approval_steps`.`request_approval_id`)) `tbl_steps` left join (`tbl_request_approval` `tbl_approval` left join (select `tbl_request_approval_ccrinfo`.`ccr_customer` AS `ccr_customer`,`tbl_request_approval_ccrinfo`.`ccr_quantity` AS `ccr_quantity`,`tbl_request_approval_ccrinfo`.`ccr_job_jacket` AS `ccr_job_jacket`,`tbl_request_approval_ccrinfo`.`ccr_structure` AS `ccr_structure`,`tbl_request_approval_ccrinfo`.`ccr_code` AS `ccr_code`,`tbl_request_approval_ccrinfo`.`request_approval_id` AS `request_approval_id` from `tbl_request_approval_ccrinfo`) `tbl_info` on(`tbl_info`.`request_approval_id` = `tbl_approval`.`id`)) on(`tbl_steps`.`request_approval_id` = `tbl_approval`.`id`)) where `tbl_approval`.`form_type` = 19 and `tbl_approval`.`department_id` > 0 and `tbl_steps`.`approval_date` is not null and `tbl_steps`.`approval_status` = 5) */;

/*View structure for view vlistjjapproval20230728 */

/*!50001 DROP TABLE IF EXISTS `vlistjjapproval20230728` */;
/*!50001 DROP VIEW IF EXISTS `vlistjjapproval20230728` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistjjapproval20230728` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`jj_confirm`.`confirm_department` AS `confirm_group`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name` from ((((`tbl_request_approval` `treq_apr` left join (select `tbl_request_approval_steps`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_steps`.`approval_group` AS `approval_group` from `tbl_request_approval_steps`) `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join (select `tbl_request_approval_jj_invited`.`user_id` AS `user_id`,`tbl_request_approval_jj_invited`.`request_approval_id` AS `request_approval_id` from `tbl_request_approval_jj_invited`) `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join (select `tbl_request_approval_jj_confirm`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jj_confirm`.`confirm_department` AS `confirm_department` from `tbl_request_approval_jj_confirm`) `jj_confirm` on(`treq_apr`.`id` = `jj_confirm`.`request_approval_id`)) left join (select `tbl_request_approval_jjinfo`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jjinfo`.`jj_number` AS `jj_number`,`tbl_request_approval_jjinfo`.`jj_job_jacket` AS `jj_job_jacket`,`tbl_request_approval_jjinfo`.`jj_version` AS `jj_version`,`tbl_request_approval_jjinfo`.`jj_fg_code` AS `jj_fg_code`,`tbl_request_approval_jjinfo`.`jj_product_name` AS `jj_product_name` from `tbl_request_approval_jjinfo`) `jj_info` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) where `treq_apr`.`request_status` = 5 and `treq_apr`.`form_type` = 40 and `treq_apr`.`id` > 19000 */;

/*View structure for view vlistcylinder_inprogress */

/*!50001 DROP TABLE IF EXISTS `vlistcylinder_inprogress` */;
/*!50001 DROP VIEW IF EXISTS `vlistcylinder_inprogress` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistcylinder_inprogress` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`cylinder`.`cylinder_code` AS `cylinder_code`,`cylinder`.`product_name` AS `product_name`,`cylinder_step`.`approval_group` AS `approval_group`,`cylinder_step`.`approval_date` AS `approval_date`,`cylinder_confirm`.`confirm_by` AS `confirm_by`,`cylinder_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_cylinder_info` `cylinder` on(`ra`.`id` = `cylinder`.`request_approval_id`)) left join `tbl_request_approval_steps` `cylinder_step` on(`ra`.`id` = `cylinder_step`.`request_approval_id`)) left join `tbl_request_approval_cylinder_confirm` `cylinder_confirm` on(`ra`.`id` = `cylinder_confirm`.`request_approval_id`)) left join `tbl_request_approval_cylinder_invited` `cylinder_inv` on(`ra`.`id` = `cylinder_inv`.`request_approval_id`)) where `ra`.`request_status` in (1,4) and `ra`.`form_type` = 45) */;

/*View structure for view vlistccr_result_confirmluser */

/*!50001 DROP TABLE IF EXISTS `vlistccr_result_confirmluser` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_result_confirmluser` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_result_confirmluser` AS (select `ccr_confirm`.`request_approval_id` AS `request_approval_id`,`ccr_confirm`.`confirm_department` AS `confirm_department`,`ccr_confirm`.`confirm_status` AS `confirm_status`,`ccr_confirm`.`confirm_by` AS `confirm_by`,`ccr_confirm`.`confirm_date` AS `confirm_date`,`ccr_deptuser`.`user_id` AS `confirm_user` from (`tbl_request_approval_ccr_result_confirm` `ccr_confirm` left join `tbl_request_approval_ccrdepartment_user` `ccr_deptuser` on(`ccr_confirm`.`confirm_department` = `ccr_deptuser`.`department_id`))) */;

/*View structure for view vlistccr_inprogress */

/*!50001 DROP TABLE IF EXISTS `vlistccr_inprogress` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_inprogress` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_inprogress` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`ccr`.`ccr_code` AS `ccr_code`,`ccr`.`ccr_scope_of_change` AS `ccr_scope_of_change`,`ccr`.`ccr_scope_of_change_other` AS `ccr_scope_of_change_other`,`ccr`.`ccr_customer` AS `ccr_customer`,`ccr`.`ccr_job_jacket` AS `ccr_job_jacket`,`ccr`.`ccr_quantity` AS `ccr_quantity`,`ccr`.`ccr_structure` AS `ccr_structure`,`ccr`.`ccr_change_requirements_by_customer` AS `ccr_change_requirements_by_customer`,`ccr`.`ccr_change_for_improvement` AS `ccr_change_for_improvement` from (`tbl_request_approval` `ra` left join `tbl_request_approval_ccrinfo` `ccr` on(`ra`.`id` = `ccr`.`request_approval_id`)) where `ra`.`request_status` in (1,4) and `ra`.`form_type` = 19) */;

/*View structure for view vliststandardapproval */

/*!50001 DROP TABLE IF EXISTS `vliststandardapproval` */;
/*!50001 DROP VIEW IF EXISTS `vliststandardapproval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vliststandardapproval` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`treq_apr_cof`.`confirm_by` AS `confirm_by` from (((`tbl_request_approval` `treq_apr` left join `tbl_request_approval_steps` `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join `tbl_request_approval_invited` `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join `tbl_request_confirm` `treq_apr_cof` on(`treq_apr`.`id` = `treq_apr_cof`.`request_approval_id`)) where `treq_apr`.`request_status` not in (1,4) and `treq_apr`.`form_type` = 11 */;

/*View structure for view vlistpurchaseawaiting20230807 */

/*!50001 DROP TABLE IF EXISTS `vlistpurchaseawaiting20230807` */;
/*!50001 DROP VIEW IF EXISTS `vlistpurchaseawaiting20230807` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistpurchaseawaiting20230807` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`purchase`.`pr_number` AS `pr_number`,`purchase`.`pr_notes` AS `pr_notes`,`purchase_step`.`approval_group` AS `approval_group`,`purchase`.`ps_no` AS `ps_no`,`purchase_confirm`.`confirm_by` AS `confirm_by`,`purchase_inv`.`user_id` AS `user_id`,(select max(`step`.`approval_date`) from `tbl_request_approval_steps` `step` where `step`.`request_approval_id` = `ra`.`id`) AS `approval_date` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_purchase_info` `purchase` on(`ra`.`id` = `purchase`.`request_approval_id`)) left join `tbl_request_approval_steps` `purchase_step` on(`ra`.`id` = `purchase_step`.`request_approval_id`)) left join `tbl_request_approval_purchase_confirm` `purchase_confirm` on(`ra`.`id` = `purchase_confirm`.`request_approval_id`)) left join `tbl_request_approval_purchase_invited` `purchase_inv` on(`ra`.`id` = `purchase_inv`.`request_approval_id`)) where `ra`.`request_status` not in (1,4) and `ra`.`form_type` = 49) */;

/*View structure for view vlistnpdapproval */

/*!50001 DROP TABLE IF EXISTS `vlistnpdapproval` */;
/*!50001 DROP VIEW IF EXISTS `vlistnpdapproval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistnpdapproval` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`npd`.`npd_code` AS `npd_code`,`npd`.`npd_job_jacket` AS `npd_job_jacket`,`npd`.`npd_fg_code` AS `npd_fg_code`,`npd`.`npd_purpose` AS `npd_purpose`,`npd`.`npd_purpose_other` AS `npd_purpose_other`,`npd`.`npd_customer` AS `npd_customer`,`npd`.`npd_structure` AS `npd_structure`,`npd`.`npd_received_date` AS `npd_received_date`,`npd`.`npd_bl_fg_code` AS `npd_bl_fg_code`,`npd`.`npd_bl_job_jacket` AS `npd_bl_job_jacket` from (`tbl_request_approval` `ra` left join `tbl_request_approval_npdinfo` `npd` on(`ra`.`id` = `npd`.`request_approval_id`)) where `ra`.`form_type` = 12) */;

/*View structure for view vlistspec_inprogress */

/*!50001 DROP TABLE IF EXISTS `vlistspec_inprogress` */;
/*!50001 DROP VIEW IF EXISTS `vlistspec_inprogress` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistspec_inprogress` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`spec`.`spec_code` AS `spec_code`,`spec`.`product_name` AS `product_name`,`spec`.`spec_version` AS `spec_version`,`spec`.`QCSP` AS `QCSP`,`spec_step`.`approval_group` AS `approval_group`,`spec_step`.`approval_date` AS `approval_date`,`spec_confirm`.`confirm_by` AS `confirm_by`,`spec_confirm`.`confirm_date` AS `confirm_date`,`spec_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_spec_info` `spec` on(`ra`.`id` = `spec`.`request_approval_id`)) left join `tbl_request_approval_steps` `spec_step` on(`ra`.`id` = `spec_step`.`request_approval_id`)) left join `tbl_request_approval_spec_confirm` `spec_confirm` on(`ra`.`id` = `spec_confirm`.`request_approval_id`)) left join `tbl_request_approval_spec_invited` `spec_inv` on(`ra`.`id` = `spec_inv`.`request_approval_id`)) where `ra`.`request_status` in (1,4) and `ra`.`form_type` = 47) */;

/*View structure for view vlistjj_confirm_user */

/*!50001 DROP TABLE IF EXISTS `vlistjj_confirm_user` */;
/*!50001 DROP VIEW IF EXISTS `vlistjj_confirm_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistjj_confirm_user` AS (select `jj_confirm`.`request_approval_id` AS `request_approval_id`,`jj_confirm`.`confirm_department` AS `confirm_department`,`jj_confirm`.`confirm_status` AS `confirm_status`,`jj_confirm`.`confirm_by` AS `confirm_by`,`jj_confirm`.`confirm_date` AS `confirm_date`,`ccr_deptuser`.`user_id` AS `confirm_user` from (`tbl_request_approval_jj_confirm` `jj_confirm` left join `tbl_request_approval_ccrdepartment_user` `ccr_deptuser` on(`jj_confirm`.`confirm_department` = `ccr_deptuser`.`department_id`))) */;

/*View structure for view vlistprice_pending */

/*!50001 DROP TABLE IF EXISTS `vlistprice_pending` */;
/*!50001 DROP VIEW IF EXISTS `vlistprice_pending` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistprice_pending` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,if(`ra`.`due_date` <> '',to_days(`ra`.`due_date`) - to_days(current_timestamp()),9999) AS `count_date`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`pr`.`pr_code` AS `pr_code`,`pr`.`pr_total_price` AS `pr_total_price`,`pr_step`.`approval_group` AS `approval_group`,`pr_step`.`approval_step_number` AS `approval_step_number`,`pr_step`.`approval_date` AS `approval_date`,`pr_step`.`approval_by` AS `approval_by`,`pr_confirm`.`confirm_by` AS `confirm_by`,`pr_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_price_info` `pr` on(`ra`.`id` = `pr`.`request_approval_id`)) left join `tbl_request_approval_steps` `pr_step` on(`ra`.`id` = `pr_step`.`request_approval_id`)) left join `tbl_request_approval_price_confirm` `pr_confirm` on(`ra`.`id` = `pr_confirm`.`request_approval_id`)) left join `tbl_request_approval_price_invited` `pr_inv` on(`ra`.`id` = `pr_inv`.`request_approval_id`)) where `ra`.`request_status` = 2 and `ra`.`form_type` = 43 and `pr_step`.`approval_by` is null) */;

/*View structure for view vlistccr_report */

/*!50001 DROP TABLE IF EXISTS `vlistccr_report` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_report` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistccr_report` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`ccr`.`ccr_code` AS `ccr_code`,`ccr`.`ccr_change_other_value` AS `ccr_change_other_value`,`ccr`.`ccr_scope_of_change` AS `ccr_scope_of_change`,`ccr`.`ccr_scope_of_change_other` AS `ccr_scope_of_change_other`,`ccr`.`ccr_customer` AS `ccr_customer`,`ccr`.`ccr_job_jacket` AS `ccr_job_jacket`,`ccr`.`ccr_quantity` AS `ccr_quantity`,`ccr`.`ccr_structure` AS `ccr_structure`,`ccr`.`ccr_change_requirements_by_customer` AS `ccr_change_requirements_by_customer`,`ccr`.`ccr_change_for_improvement` AS `ccr_change_for_improvement`,`ccr_step`.`approval_group` AS `approval_group`,`ccr_confirm`.`confirm_department` AS `confirm_group`,`ccr_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_ccrinfo` `ccr` on(`ra`.`id` = `ccr`.`request_approval_id`)) left join `tbl_request_approval_steps` `ccr_step` on(`ra`.`id` = `ccr_step`.`request_approval_id`)) left join `tbl_request_approval_ccrconfirm` `ccr_confirm` on(`ra`.`id` = `ccr_confirm`.`request_approval_id`)) left join `tbl_request_approval_ccrinvited` `ccr_inv` on(`ra`.`id` = `ccr_inv`.`request_approval_id`)) where `ra`.`request_status` not in (1,4) and `ra`.`form_type` = 19) */;

/*View structure for view vlistpurchaseinprogress */

/*!50001 DROP TABLE IF EXISTS `vlistpurchaseinprogress` */;
/*!50001 DROP VIEW IF EXISTS `vlistpurchaseinprogress` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistpurchaseinprogress` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`purchase`.`pr_notes` AS `pr_notes`,`purchase`.`pr_number` AS `pr_number`,`purchase_step`.`approval_group` AS `approval_group`,`purchase`.`ps_no` AS `ps_no`,`purchase_step`.`approval_date` AS `approval_date`,`purchase_confirm`.`confirm_by` AS `confirm_by`,`purchase_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_purchase_info` `purchase` on(`ra`.`id` = `purchase`.`request_approval_id`)) left join `tbl_request_approval_steps` `purchase_step` on(`ra`.`id` = `purchase_step`.`request_approval_id`)) left join `tbl_request_approval_purchase_confirm` `purchase_confirm` on(`ra`.`id` = `purchase_confirm`.`request_approval_id`)) left join `tbl_request_approval_purchase_invited` `purchase_inv` on(`ra`.`id` = `purchase_inv`.`request_approval_id`)) where `ra`.`request_status` in (1,4) and `ra`.`form_type` = 49) */;

/*View structure for view vlistprice_report */

/*!50001 DROP TABLE IF EXISTS `vlistprice_report` */;
/*!50001 DROP VIEW IF EXISTS `vlistprice_report` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistprice_report` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,if(`ra`.`due_date` <> '',to_days(`ra`.`due_date`) - to_days(current_timestamp()),9999) AS `count_date`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,NULL AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`pr`.`pr_code` AS `pr_code`,`pr`.`pr_total_price` AS `pr_total_price` from (`tbl_request_approval_price_info` `pr` join `tbl_request_approval` `ra` on(`ra`.`id` = `pr`.`request_approval_id`)) where `ra`.`request_status` not in (1,4) and `ra`.`form_type` = 43) */;

/*View structure for view vlistccr_result_inprogress */

/*!50001 DROP TABLE IF EXISTS `vlistccr_result_inprogress` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_result_inprogress` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_result_inprogress` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`ccr`.`ccr_code` AS `ccr_code`,`ccr`.`ccr_scope_of_change` AS `ccr_scope_of_change`,`ccr`.`ccr_scope_of_change_other` AS `ccr_scope_of_change_other`,`ccr`.`ccr_customer` AS `ccr_customer`,`ccr`.`ccr_job_jacket` AS `ccr_job_jacket`,`ccr`.`ccr_quantity` AS `ccr_quantity`,`ccr`.`ccr_structure` AS `ccr_structure`,`ccr`.`ccr_change_requirements_by_customer` AS `ccr_change_requirements_by_customer`,`ccr`.`ccr_change_for_improvement` AS `ccr_change_for_improvement` from (`tbl_request_approval` `ra` left join `tbl_request_approval_ccr_result_info` `ccr` on(`ra`.`id` = `ccr`.`request_approval_id`)) where `ra`.`request_status` in (1,4) and `ra`.`form_type` = 42) */;

/*View structure for view vlistprice_pending_Khang */

/*!50001 DROP TABLE IF EXISTS `vlistprice_pending_Khang` */;
/*!50001 DROP VIEW IF EXISTS `vlistprice_pending_Khang` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistprice_pending_Khang` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,if(`ra`.`due_date` <> '',to_days(`ra`.`due_date`) - to_days(current_timestamp()),9999) AS `count_date`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`pr`.`pr_code` AS `pr_code`,`pr`.`pr_total_price` AS `pr_total_price`,`pr_step`.`approval_group` AS `approval_group`,min(`pr_step`.`approval_step_number`) AS `approval_step_number`,`pr_step`.`approval_date` AS `approval_date`,`pr_step`.`approval_by` AS `approval_by`,`pr_confirm`.`confirm_by` AS `confirm_by`,`pr_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_price_info` `pr` on(`ra`.`id` = `pr`.`request_approval_id`)) left join `tbl_request_approval_steps` `pr_step` on(`ra`.`id` = `pr_step`.`request_approval_id`)) left join `tbl_request_approval_price_confirm` `pr_confirm` on(`ra`.`id` = `pr_confirm`.`request_approval_id`)) left join `tbl_request_approval_price_invited` `pr_inv` on(`ra`.`id` = `pr_inv`.`request_approval_id`)) where `ra`.`request_status` = 2 and `ra`.`form_type` = 43 and `pr_step`.`approval_by` is null group by `pr_step`.`request_approval_id`) */;

/*View structure for view vlistjjapprovalall */

/*!50001 DROP TABLE IF EXISTS `vlistjjapprovalall` */;
/*!50001 DROP VIEW IF EXISTS `vlistjjapprovalall` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`#` SQL SECURITY DEFINER VIEW `vlistjjapprovalall` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name`,`jj_info`.`jj_type` AS `jj_type`,`jj_info`.`jj_type_name` AS `jj_type_name` from (`tbl_request_approval_jjinfo` `jj_info` join (select `tbl_request_approval`.`id` AS `id`,`tbl_request_approval`.`department_id` AS `department_id`,`tbl_request_approval`.`request_title` AS `request_title`,`tbl_request_approval`.`request_desc` AS `request_desc`,`tbl_request_approval`.`form_type` AS `form_type`,`tbl_request_approval`.`request_status` AS `request_status`,`tbl_request_approval`.`due_date` AS `due_date`,`tbl_request_approval`.`created_by` AS `created_by`,`tbl_request_approval`.`created_date` AS `created_date`,`tbl_request_approval`.`submit_date` AS `submit_date`,`tbl_request_approval`.`updated_date` AS `updated_date`,`tbl_request_approval`.`is_archived` AS `is_archived`,`tbl_request_approval`.`archived_by` AS `archived_by`,`tbl_request_approval`.`archived_date` AS `archived_date` from `tbl_request_approval`) `treq_apr` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) where `treq_apr`.`form_type` = 40 and `treq_apr`.`request_status` = 5 */;

/*View structure for view vlistnpdarchived */

/*!50001 DROP TABLE IF EXISTS `vlistnpdarchived` */;
/*!50001 DROP VIEW IF EXISTS `vlistnpdarchived` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistnpdarchived` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,(select group_concat(`tbl_request_approval_steps`.`approval_group` separator ',') from `tbl_request_approval_steps` where `tbl_request_approval_steps`.`request_approval_id` = `ra`.`id`) AS `group_approval`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`npd`.`npd_code` AS `npd_code`,`npd`.`npd_job_jacket` AS `npd_job_jacket`,`npd`.`npd_fg_code` AS `npd_fg_code`,`npd`.`npd_purpose` AS `npd_purpose`,`npd`.`npd_purpose_other` AS `npd_purpose_other`,`npd`.`npd_customer` AS `npd_customer`,`npd`.`npd_structure` AS `npd_structure`,`npd`.`npd_received_date` AS `npd_received_date`,`npd`.`npd_bl_fg_code` AS `npd_bl_fg_code`,`npd`.`npd_bl_job_jacket` AS `npd_bl_job_jacket`,`treq_apr_stp`.`approval_group` AS `approval_group` from ((`tbl_request_approval` `ra` left join `tbl_request_approval_npdinfo` `npd` on(`ra`.`id` = `npd`.`request_approval_id`)) left join `tbl_request_approval_steps` `treq_apr_stp` on(`ra`.`id` = `treq_apr_stp`.`request_approval_id`)) where `ra`.`is_archived` = 1 and `ra`.`form_type` = 12) */;

/*View structure for view vlistcylinder_awaiting */

/*!50001 DROP TABLE IF EXISTS `vlistcylinder_awaiting` */;
/*!50001 DROP VIEW IF EXISTS `vlistcylinder_awaiting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistcylinder_awaiting` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,if(`ra`.`due_date` <> '',to_days(`ra`.`due_date`) - to_days(current_timestamp()),9999) AS `count_date`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`cylinder`.`cylinder_code` AS `cylinder_code`,`cylinder`.`QCSP` AS `QCSP`,`cylinder`.`cylinder_type_other` AS `cylinder_type_other`,`cylinder`.`quantity` AS `quantity`,`cylinder`.`product_name` AS `product_name`,`cylinder_step`.`approval_group` AS `approval_group`,`cylinder_step`.`approval_date` AS `approval_date`,`cylinder_confirm`.`confirm_by` AS `confirm_by`,`cylinder_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_cylinder_info` `cylinder` on(`ra`.`id` = `cylinder`.`request_approval_id`)) left join `tbl_request_approval_steps` `cylinder_step` on(`ra`.`id` = `cylinder_step`.`request_approval_id`)) left join `tbl_request_approval_cylinder_confirm` `cylinder_confirm` on(`ra`.`id` = `cylinder_confirm`.`request_approval_id`)) left join `tbl_request_approval_cylinder_invited` `cylinder_inv` on(`ra`.`id` = `cylinder_inv`.`request_approval_id`)) where `ra`.`request_status` not in (1,4) and `ra`.`form_type` = 45) */;

/*View structure for view vlistccr_result_awaiting */

/*!50001 DROP TABLE IF EXISTS `vlistccr_result_awaiting` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_result_awaiting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_result_awaiting` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`ccr`.`ccr_code` AS `ccr_code`,`ccr`.`ccr_scope_of_change` AS `ccr_scope_of_change`,`ccr`.`ccr_scope_of_change_other` AS `ccr_scope_of_change_other`,`ccr`.`ccr_customer` AS `ccr_customer`,`ccr`.`ccr_job_jacket` AS `ccr_job_jacket`,`ccr`.`ccr_quantity` AS `ccr_quantity`,`ccr`.`ccr_structure` AS `ccr_structure`,`ccr`.`ccr_change_requirements_by_customer` AS `ccr_change_requirements_by_customer`,`ccr`.`ccr_change_for_improvement` AS `ccr_change_for_improvement`,`ccr_step`.`approval_group` AS `approval_group`,`ccr_confirm`.`confirm_department` AS `confirm_group`,`ccr_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_ccr_result_info` `ccr` on(`ra`.`id` = `ccr`.`request_approval_id`)) left join `tbl_request_approval_steps` `ccr_step` on(`ra`.`id` = `ccr_step`.`request_approval_id`)) left join `tbl_request_approval_ccr_result_confirm` `ccr_confirm` on(`ra`.`id` = `ccr_confirm`.`request_approval_id`)) left join `tbl_request_approval_ccr_result_invited` `ccr_inv` on(`ra`.`id` = `ccr_inv`.`request_approval_id`)) where `ra`.`request_status` not in (1,4,5) and `ra`.`form_type` = 42) */;

/*View structure for view vlistccr_info */

/*!50001 DROP TABLE IF EXISTS `vlistccr_info` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_info` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`ccr`.`ccr_code` AS `ccr_code`,`ccr`.`ccr_scope_of_change` AS `ccr_scope_of_change`,`ccr`.`ccr_scope_of_change_other` AS `ccr_scope_of_change_other`,`ccr`.`ccr_customer` AS `ccr_customer`,`ccr`.`ccr_job_jacket` AS `ccr_job_jacket`,`ccr`.`ccr_quantity` AS `ccr_quantity`,`ccr`.`ccr_structure` AS `ccr_structure`,`ccr`.`ccr_change_requirements_by_customer` AS `ccr_change_requirements_by_customer`,`ccr`.`ccr_change_for_improvement` AS `ccr_change_for_improvement`,`ccr_r`.`id` AS `ccr_id` from ((`tbl_request_approval` `ra` left join `tbl_request_approval_ccrinfo` `ccr` on(`ra`.`id` = `ccr`.`request_approval_id`)) left join `tbl_request_approval_ccr_result_info` `ccr_r` on(`ra`.`id` = `ccr_r`.`ccr_id`)) where `ra`.`request_status` not in (1,4) and `ra`.`form_type` = 19) */;

/*View structure for view vlistnpd_approved */

/*!50001 DROP TABLE IF EXISTS `vlistnpd_approved` */;
/*!50001 DROP VIEW IF EXISTS `vlistnpd_approved` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistnpd_approved` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`npd`.`npd_code` AS `npd_code`,`npd`.`npd_job_jacket` AS `npd_job_jacket`,`npd`.`npd_fg_code` AS `npd_fg_code`,`npd`.`npd_purpose` AS `npd_purpose`,`npd`.`npd_purpose_other` AS `npd_purpose_other`,`npd`.`npd_customer` AS `npd_customer`,`npd`.`npd_structure` AS `npd_structure`,`npd`.`npd_received_date` AS `npd_received_date`,`npd`.`npd_bl_fg_code` AS `npd_bl_fg_code`,`npd`.`npd_bl_job_jacket` AS `npd_bl_job_jacket`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`treq_apr_cof`.`confirm_by` AS `confirm_by` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_npdinfo` `npd` on(`ra`.`id` = `npd`.`request_approval_id`)) left join `tbl_request_approval_steps` `treq_apr_stp` on(`ra`.`id` = `treq_apr_stp`.`request_approval_id`)) left join `tbl_request_approval_invited` `treq_apr_inv` on(`ra`.`id` = `treq_apr_inv`.`request_approval_id`)) left join `tbl_request_confirm` `treq_apr_cof` on(`ra`.`id` = `treq_apr_cof`.`request_approval_id`)) where `ra`.`request_status` = 5 and `ra`.`is_archived` = 0 and `ra`.`form_type` = 12) */;

/*View structure for view vlistprice_waitingforyourapproval */

/*!50001 DROP TABLE IF EXISTS `vlistprice_waitingforyourapproval` */;
/*!50001 DROP VIEW IF EXISTS `vlistprice_waitingforyourapproval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistprice_waitingforyourapproval` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,if(`ra`.`due_date` <> '',to_days(`ra`.`due_date`) - to_days(current_timestamp()),9999) AS `count_date`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`pr`.`pr_code` AS `pr_code`,`pr`.`pr_total_price` AS `pr_total_price`,`pr_step`.`approval_group` AS `approval_group`,min(`pr_step`.`approval_step_number`) AS `approval_step_number`,`pr_step`.`approval_date` AS `approval_date`,`pr_step`.`approval_by` AS `approval_by` from ((`tbl_request_approval_price_info` `pr` join `tbl_request_approval` `ra` on(`ra`.`id` = `pr`.`request_approval_id`)) left join `tbl_request_approval_steps` `pr_step` on(`ra`.`id` = `pr_step`.`request_approval_id`)) where `ra`.`request_status` = 2 and `ra`.`form_type` = 43 and `pr_step`.`approval_by` is null and `ra`.`id` > 27000 group by `ra`.`id`) */;

/*View structure for view vlistccr_result_completed */

/*!50001 DROP TABLE IF EXISTS `vlistccr_result_completed` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_result_completed` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_result_completed` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`ccr`.`ccr_code` AS `ccr_code`,`ccr`.`ccr_scope_of_change` AS `ccr_scope_of_change`,`ccr`.`ccr_scope_of_change_other` AS `ccr_scope_of_change_other`,`ccr`.`ccr_customer` AS `ccr_customer`,`ccr`.`ccr_job_jacket` AS `ccr_job_jacket`,`ccr`.`ccr_quantity` AS `ccr_quantity`,`ccr`.`ccr_structure` AS `ccr_structure`,`ccr`.`ccr_change_requirements_by_customer` AS `ccr_change_requirements_by_customer`,`ccr`.`ccr_change_for_improvement` AS `ccr_change_for_improvement`,`ccr_step`.`approval_group` AS `approval_group`,`ccr_confirm`.`confirm_department` AS `confirm_group`,`ccr_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_ccr_result_info` `ccr` on(`ra`.`id` = `ccr`.`request_approval_id`)) left join `tbl_request_approval_steps` `ccr_step` on(`ra`.`id` = `ccr_step`.`request_approval_id`)) left join `tbl_request_approval_ccr_result_confirm` `ccr_confirm` on(`ra`.`id` = `ccr_confirm`.`request_approval_id`)) left join `tbl_request_approval_ccr_result_invited` `ccr_inv` on(`ra`.`id` = `ccr_inv`.`request_approval_id`)) where `ra`.`request_status` = 5 and `ra`.`form_type` = 42) */;

/*View structure for view vlist_purchase_user */

/*!50001 DROP TABLE IF EXISTS `vlist_purchase_user` */;
/*!50001 DROP VIEW IF EXISTS `vlist_purchase_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlist_purchase_user` AS (select `purchase_confirm`.`request_approval_id` AS `request_approval_id`,`purchase_confirm`.`confirm_status` AS `confirm_status`,`purchase_confirm`.`confirm_by` AS `confirm_by`,`purchase_confirm`.`confirm_date` AS `confirm_date`,`purchase_confirm`.`confirm_by` AS `confirm_user` from `tbl_request_approval_purchase_confirm` `purchase_confirm`) */;

/*View structure for view vlistjjapprovalall20230728 */

/*!50001 DROP TABLE IF EXISTS `vlistjjapprovalall20230728` */;
/*!50001 DROP VIEW IF EXISTS `vlistjjapprovalall20230728` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`#` SQL SECURITY DEFINER VIEW `vlistjjapprovalall20230728` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name` from (`tbl_request_approval_jjinfo` `jj_info` join (select `tbl_request_approval`.`id` AS `id`,`tbl_request_approval`.`department_id` AS `department_id`,`tbl_request_approval`.`request_title` AS `request_title`,`tbl_request_approval`.`request_desc` AS `request_desc`,`tbl_request_approval`.`form_type` AS `form_type`,`tbl_request_approval`.`request_status` AS `request_status`,`tbl_request_approval`.`due_date` AS `due_date`,`tbl_request_approval`.`created_by` AS `created_by`,`tbl_request_approval`.`created_date` AS `created_date`,`tbl_request_approval`.`submit_date` AS `submit_date`,`tbl_request_approval`.`updated_date` AS `updated_date`,`tbl_request_approval`.`is_archived` AS `is_archived`,`tbl_request_approval`.`archived_by` AS `archived_by`,`tbl_request_approval`.`archived_date` AS `archived_date` from `tbl_request_approval`) `treq_apr` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) where `treq_apr`.`form_type` = 40 and `treq_apr`.`request_status` = 5 */;

/*View structure for view vlistprice_inprogress */

/*!50001 DROP TABLE IF EXISTS `vlistprice_inprogress` */;
/*!50001 DROP VIEW IF EXISTS `vlistprice_inprogress` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistprice_inprogress` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`pr`.`pr_code` AS `pr_code`,`pr_steps`.`approval_by` AS `approval_by`,`pr`.`pr_total_price` AS `pr_total_price` from ((`tbl_request_approval` `ra` left join `tbl_request_approval_price_info` `pr` on(`ra`.`id` = `pr`.`request_approval_id`)) left join `tbl_request_approval_steps` `pr_steps` on(`ra`.`id` = `pr_steps`.`request_approval_id`)) where `ra`.`request_status` in (1,4) and `ra`.`form_type` = 43) */;

/*View structure for view vlistnpd_inprogress */

/*!50001 DROP TABLE IF EXISTS `vlistnpd_inprogress` */;
/*!50001 DROP VIEW IF EXISTS `vlistnpd_inprogress` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistnpd_inprogress` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`npd`.`npd_code` AS `npd_code`,`npd`.`npd_job_jacket` AS `npd_job_jacket`,`npd`.`npd_fg_code` AS `npd_fg_code`,`npd`.`npd_purpose` AS `npd_purpose`,`npd`.`npd_purpose_other` AS `npd_purpose_other`,`npd`.`npd_customer` AS `npd_customer`,`npd`.`npd_structure` AS `npd_structure`,`npd`.`npd_received_date` AS `npd_received_date`,`npd`.`npd_bl_fg_code` AS `npd_bl_fg_code`,`npd`.`npd_bl_job_jacket` AS `npd_bl_job_jacket` from (`tbl_request_approval` `ra` left join `tbl_request_approval_npdinfo` `npd` on(`ra`.`id` = `npd`.`request_approval_id`)) where `ra`.`request_status` in (1,4) and `ra`.`form_type` = 12) */;

/*View structure for view vlistspec_awaiting */

/*!50001 DROP TABLE IF EXISTS `vlistspec_awaiting` */;
/*!50001 DROP VIEW IF EXISTS `vlistspec_awaiting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistspec_awaiting` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`spec`.`spec_code` AS `spec_code`,`spec`.`product_name` AS `product_name`,`spec`.`spec_version` AS `spec_version`,`spec`.`QCSP` AS `QCSP`,`spec_step`.`approval_group` AS `approval_group`,`spec_step`.`approval_date` AS `approval_date`,`spec_confirm`.`confirm_by` AS `confirm_by`,`spec_confirm`.`confirm_date` AS `confirm_date`,`spec_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_spec_info` `spec` on(`ra`.`id` = `spec`.`request_approval_id`)) left join `tbl_request_approval_steps` `spec_step` on(`ra`.`id` = `spec_step`.`request_approval_id`)) left join `tbl_request_approval_spec_confirm` `spec_confirm` on(`ra`.`id` = `spec_confirm`.`request_approval_id`)) left join `tbl_request_approval_spec_invited` `spec_inv` on(`ra`.`id` = `spec_inv`.`request_approval_id`)) where `ra`.`request_status` not in (1,4) and `ra`.`form_type` = 47) */;

/*View structure for view vlistapprovalreview */

/*!50001 DROP TABLE IF EXISTS `vlistapprovalreview` */;
/*!50001 DROP VIEW IF EXISTS `vlistapprovalreview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistapprovalreview` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`treq_apr_cof`.`confirm_by` AS `confirm_by` from (((`tbl_request_approval` `treq_apr` left join `tbl_request_approval_steps` `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join `tbl_request_approval_invited` `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join `tbl_request_confirm` `treq_apr_cof` on(`treq_apr`.`id` = `treq_apr_cof`.`request_approval_id`)) where `treq_apr`.`request_status` not in (1,4) and `treq_apr`.`form_type` = 39 */;

/*View structure for view vlistccr_result_approval */

/*!50001 DROP TABLE IF EXISTS `vlistccr_result_approval` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_result_approval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_result_approval` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`ccr_confirm`.`confirm_department` AS `confirm_group` from (((`tbl_request_approval` `treq_apr` left join `tbl_request_approval_steps` `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join `tbl_request_approval_ccr_result_invited` `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join `tbl_request_approval_ccr_result_confirm` `ccr_confirm` on(`treq_apr`.`id` = `ccr_confirm`.`request_approval_id`)) where `treq_apr`.`request_status` not in (1,4) and `treq_apr`.`form_type` = 42 */;

/*View structure for view vlistnpd_report */

/*!50001 DROP TABLE IF EXISTS `vlistnpd_report` */;
/*!50001 DROP VIEW IF EXISTS `vlistnpd_report` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistnpd_report` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,(select group_concat(`tbl_request_approval_steps`.`approval_group` separator ',') from `tbl_request_approval_steps` where `tbl_request_approval_steps`.`request_approval_id` = `ra`.`id`) AS `group_approval`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`npd`.`npd_code` AS `npd_code`,`npd`.`npd_job_jacket` AS `npd_job_jacket`,`npd`.`npd_fg_code` AS `npd_fg_code`,`npd`.`npd_purpose` AS `npd_purpose`,`npd`.`npd_purpose_other` AS `npd_purpose_other`,`npd`.`npd_customer` AS `npd_customer`,`npd`.`npd_structure` AS `npd_structure`,`npd`.`npd_received_date` AS `npd_received_date`,`npd`.`npd_bl_fg_code` AS `npd_bl_fg_code`,`npd`.`npd_bl_job_jacket` AS `npd_bl_job_jacket` from (`tbl_request_approval` `ra` left join `tbl_request_approval_npdinfo` `npd` on(`ra`.`id` = `npd`.`request_approval_id`)) where `ra`.`request_status` not in (1,4) and `ra`.`is_archived` = 0 and `ra`.`form_type` = 12) */;

/*View structure for view vlistprice_awaiting */

/*!50001 DROP TABLE IF EXISTS `vlistprice_awaiting` */;
/*!50001 DROP VIEW IF EXISTS `vlistprice_awaiting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistprice_awaiting` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,if(`ra`.`due_date` <> '',to_days(`ra`.`due_date`) - to_days(current_timestamp()),9999) AS `count_date`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,NULL AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`pr`.`pr_code` AS `pr_code`,`pr`.`pr_total_price` AS `pr_total_price`,`pr_step`.`approval_group` AS `approval_group`,`pr_step`.`approval_date` AS `approval_date`,`pr_step`.`approval_by` AS `approval_by`,`pr_confirm`.`confirm_by` AS `confirm_by`,`pr_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval_price_info` `pr` join `tbl_request_approval` `ra` on(`ra`.`id` = `pr`.`request_approval_id`)) left join `tbl_request_approval_steps` `pr_step` on(`ra`.`id` = `pr_step`.`request_approval_id`)) left join `tbl_request_approval_price_confirm` `pr_confirm` on(`ra`.`id` = `pr_confirm`.`request_approval_id`)) left join `tbl_request_approval_price_invited` `pr_inv` on(`ra`.`id` = `pr_inv`.`request_approval_id`)) where `ra`.`request_status` not in (1,4,5) and `ra`.`form_type` = 43) */;

/*View structure for view vlistccr_confirmluser */

/*!50001 DROP TABLE IF EXISTS `vlistccr_confirmluser` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_confirmluser` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_confirmluser` AS (select `ccr_confirm`.`request_approval_id` AS `request_approval_id`,`ccr_confirm`.`confirm_department` AS `confirm_department`,`ccr_confirm`.`confirm_status` AS `confirm_status`,`ccr_confirm`.`confirm_by` AS `confirm_by`,`ccr_confirm`.`confirm_date` AS `confirm_date`,`ccr_deptuser`.`user_id` AS `confirm_user` from (`tbl_request_approval_ccrconfirm` `ccr_confirm` left join `tbl_request_approval_ccrdepartment_user` `ccr_deptuser` on(`ccr_confirm`.`confirm_department` = `ccr_deptuser`.`department_id`))) */;

/*View structure for view vlistjj_cancelled */

/*!50001 DROP TABLE IF EXISTS `vlistjj_cancelled` */;
/*!50001 DROP VIEW IF EXISTS `vlistjj_cancelled` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistjj_cancelled` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`form_type` AS `form_type`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`jj_confirm`.`confirm_department` AS `confirm_group`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name`,`jj_info`.`jj_type` AS `jj_type`,`jj_info`.`jj_type_name` AS `jj_type_name` from ((((`tbl_request_approval_jjinfo` `jj_info` join (select `tbl_request_approval`.`id` AS `id`,`tbl_request_approval`.`department_id` AS `department_id`,`tbl_request_approval`.`request_title` AS `request_title`,`tbl_request_approval`.`request_desc` AS `request_desc`,`tbl_request_approval`.`form_type` AS `form_type`,`tbl_request_approval`.`request_status` AS `request_status`,`tbl_request_approval`.`due_date` AS `due_date`,`tbl_request_approval`.`created_by` AS `created_by`,`tbl_request_approval`.`created_date` AS `created_date`,`tbl_request_approval`.`submit_date` AS `submit_date`,`tbl_request_approval`.`updated_date` AS `updated_date`,`tbl_request_approval`.`is_archived` AS `is_archived`,`tbl_request_approval`.`archived_by` AS `archived_by`,`tbl_request_approval`.`archived_date` AS `archived_date` from `tbl_request_approval`) `treq_apr` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) left join (select `tbl_request_approval_steps`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_steps`.`approval_group` AS `approval_group` from `tbl_request_approval_steps`) `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join (select `tbl_request_approval_jj_invited`.`user_id` AS `user_id`,`tbl_request_approval_jj_invited`.`request_approval_id` AS `request_approval_id` from `tbl_request_approval_jj_invited`) `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join (select `tbl_request_approval_jj_confirm`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jj_confirm`.`confirm_department` AS `confirm_department` from `tbl_request_approval_jj_confirm`) `jj_confirm` on(`treq_apr`.`id` = `jj_confirm`.`request_approval_id`)) where `treq_apr`.`request_status` = 41 and `treq_apr`.`form_type` = 40 and `treq_apr`.`id` > 19000 */;

/*View structure for view vlistnpd_awaiting */

/*!50001 DROP TABLE IF EXISTS `vlistnpd_awaiting` */;
/*!50001 DROP VIEW IF EXISTS `vlistnpd_awaiting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistnpd_awaiting` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`npd`.`npd_code` AS `npd_code`,`npd`.`npd_job_jacket` AS `npd_job_jacket`,`npd`.`npd_fg_code` AS `npd_fg_code`,`npd`.`npd_purpose` AS `npd_purpose`,`npd`.`npd_purpose_other` AS `npd_purpose_other`,`npd`.`npd_customer` AS `npd_customer`,`npd`.`npd_structure` AS `npd_structure`,`npd`.`npd_received_date` AS `npd_received_date`,`npd`.`npd_bl_fg_code` AS `npd_bl_fg_code`,`npd`.`npd_bl_job_jacket` AS `npd_bl_job_jacket`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`treq_apr_cof`.`confirm_by` AS `confirm_by` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_npdinfo` `npd` on(`ra`.`id` = `npd`.`request_approval_id`)) left join `tbl_request_approval_steps` `treq_apr_stp` on(`ra`.`id` = `treq_apr_stp`.`request_approval_id`)) left join `tbl_request_approval_invited` `treq_apr_inv` on(`ra`.`id` = `treq_apr_inv`.`request_approval_id`)) left join `tbl_request_confirm` `treq_apr_cof` on(`ra`.`id` = `treq_apr_cof`.`request_approval_id`)) where `ra`.`request_status` not in (1,4,5) and `ra`.`form_type` = 12) */;

/*View structure for view vlistjj_awatting */

/*!50001 DROP TABLE IF EXISTS `vlistjj_awatting` */;
/*!50001 DROP VIEW IF EXISTS `vlistjj_awatting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistjj_awatting` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`form_type` AS `form_type`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`jj_confirm`.`confirm_department` AS `confirm_group`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name`,`jj_info`.`jj_type` AS `jj_type`,`jj_info`.`jj_type_name` AS `jj_type_name` from ((((`tbl_request_approval_jjinfo` `jj_info` join (select `tbl_request_approval`.`id` AS `id`,`tbl_request_approval`.`department_id` AS `department_id`,`tbl_request_approval`.`request_title` AS `request_title`,`tbl_request_approval`.`request_desc` AS `request_desc`,`tbl_request_approval`.`form_type` AS `form_type`,`tbl_request_approval`.`request_status` AS `request_status`,`tbl_request_approval`.`due_date` AS `due_date`,`tbl_request_approval`.`created_by` AS `created_by`,`tbl_request_approval`.`created_date` AS `created_date`,`tbl_request_approval`.`submit_date` AS `submit_date`,`tbl_request_approval`.`updated_date` AS `updated_date`,`tbl_request_approval`.`is_archived` AS `is_archived`,`tbl_request_approval`.`archived_by` AS `archived_by`,`tbl_request_approval`.`archived_date` AS `archived_date` from `tbl_request_approval`) `treq_apr` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) left join (select `tbl_request_approval_steps`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_steps`.`approval_group` AS `approval_group` from `tbl_request_approval_steps`) `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join (select `tbl_request_approval_jj_invited`.`user_id` AS `user_id`,`tbl_request_approval_jj_invited`.`request_approval_id` AS `request_approval_id` from `tbl_request_approval_jj_invited`) `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join (select `tbl_request_approval_jj_confirm`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jj_confirm`.`confirm_department` AS `confirm_department` from `tbl_request_approval_jj_confirm`) `jj_confirm` on(`treq_apr`.`id` = `jj_confirm`.`request_approval_id`)) where `treq_apr`.`request_status` in (2,3) and `treq_apr`.`form_type` = 40 */;

/*View structure for view vlistpurchaseawaiting */

/*!50001 DROP TABLE IF EXISTS `vlistpurchaseawaiting` */;
/*!50001 DROP VIEW IF EXISTS `vlistpurchaseawaiting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistpurchaseawaiting` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`purchase`.`pr_number` AS `pr_number`,`purchase`.`pr_notes` AS `pr_notes`,`purchase_step`.`approval_group` AS `approval_group`,`purchase`.`ps_no` AS `ps_no`,`purchase_confirm`.`confirm_by` AS `confirm_by`,`purchase_inv`.`user_id` AS `user_id`,(select max(`step`.`approval_date`) from `tbl_request_approval_steps` `step` where `step`.`request_approval_id` = `ra`.`id`) AS `approval_date` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_purchase_info` `purchase` on(`ra`.`id` = `purchase`.`request_approval_id`)) left join `tbl_request_approval_steps` `purchase_step` on(`ra`.`id` = `purchase_step`.`request_approval_id`)) left join `tbl_request_approval_purchase_confirm` `purchase_confirm` on(`ra`.`id` = `purchase_confirm`.`request_approval_id`)) left join `tbl_request_approval_purchase_invited` `purchase_inv` on(`ra`.`id` = `purchase_inv`.`request_approval_id`)) where `ra`.`request_status` not in (1,4,62) and `ra`.`form_type` = 49) */;

/*View structure for view vlistccr_result_waitingfor */

/*!50001 DROP TABLE IF EXISTS `vlistccr_result_waitingfor` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_result_waitingfor` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistccr_result_waitingfor` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`ccr`.`ccr_code` AS `ccr_code`,`ccr`.`ccr_scope_of_change` AS `ccr_scope_of_change`,`ccr`.`ccr_scope_of_change_other` AS `ccr_scope_of_change_other`,`ccr`.`ccr_customer` AS `ccr_customer`,`ccr`.`ccr_job_jacket` AS `ccr_job_jacket`,`ccr`.`ccr_quantity` AS `ccr_quantity`,`ccr`.`ccr_structure` AS `ccr_structure`,`ccr`.`ccr_change_requirements_by_customer` AS `ccr_change_requirements_by_customer`,`ccr`.`ccr_change_for_improvement` AS `ccr_change_for_improvement`,`ccr_step`.`approval_group` AS `approval_group`,`ccr_confirm`.`confirm_department` AS `confirm_group`,`ccr_inv`.`user_id` AS `user_id`,min(`ccr_step`.`approval_step_number`) AS `approval_step_number`,`ccr_step`.`approval_status` AS `approval_status` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_ccr_result_info` `ccr` on(`ra`.`id` = `ccr`.`request_approval_id`)) left join `tbl_request_approval_steps` `ccr_step` on(`ra`.`id` = `ccr_step`.`request_approval_id`)) left join `tbl_request_approval_ccr_result_confirm` `ccr_confirm` on(`ra`.`id` = `ccr_confirm`.`request_approval_id`)) left join `tbl_request_approval_ccr_result_invited` `ccr_inv` on(`ra`.`id` = `ccr_inv`.`request_approval_id`)) where `ra`.`request_status` = 2 and `ccr_step`.`approval_status` = 2 and `ra`.`form_type` = 42 group by `ra`.`id`) */;

/*View structure for view vlistccr_awaiting */

/*!50001 DROP TABLE IF EXISTS `vlistccr_awaiting` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_awaiting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_awaiting` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`ccr`.`ccr_code` AS `ccr_code`,`ccr`.`ccr_scope_of_change` AS `ccr_scope_of_change`,`ccr`.`ccr_scope_of_change_other` AS `ccr_scope_of_change_other`,`ccr`.`ccr_customer` AS `ccr_customer`,`ccr`.`ccr_job_jacket` AS `ccr_job_jacket`,`ccr`.`ccr_quantity` AS `ccr_quantity`,`ccr`.`ccr_structure` AS `ccr_structure`,`ccr`.`ccr_change_requirements_by_customer` AS `ccr_change_requirements_by_customer`,`ccr`.`ccr_change_for_improvement` AS `ccr_change_for_improvement`,`ccr_step`.`approval_group` AS `approval_group`,`ccr_confirm`.`confirm_department` AS `confirm_group`,`ccr_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_ccrinfo` `ccr` on(`ra`.`id` = `ccr`.`request_approval_id`)) left join `tbl_request_approval_steps` `ccr_step` on(`ra`.`id` = `ccr_step`.`request_approval_id`)) left join `tbl_request_approval_ccrconfirm` `ccr_confirm` on(`ra`.`id` = `ccr_confirm`.`request_approval_id`)) left join `tbl_request_approval_ccrinvited` `ccr_inv` on(`ra`.`id` = `ccr_inv`.`request_approval_id`)) where `ra`.`request_status` not in (1,4,5) and `ra`.`form_type` = 19) */;

/*View structure for view vlistuserplaning */

/*!50001 DROP TABLE IF EXISTS `vlistuserplaning` */;
/*!50001 DROP VIEW IF EXISTS `vlistuserplaning` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistuserplaning` AS (select `spec_confirm`.`request_approval_id` AS `request_approval_id`,`spec_confirm`.`confirm_department` AS `confirm_department`,`spec_confirm`.`confirm_status` AS `confirm_status`,`spec_confirm`.`confirm_by` AS `confirm_by`,`spec_confirm`.`confirm_date` AS `confirm_date`,`spec_deptuser`.`user_id` AS `confirm_user` from (`tbl_request_approval_spec_confirm` `spec_confirm` left join `tbl_request_approval_ccrdepartment_user` `spec_deptuser` on(`spec_confirm`.`confirm_department` = `spec_deptuser`.`department_id`))) */;

/*View structure for view vlist_ccrconfirm_sendmail */

/*!50001 DROP TABLE IF EXISTS `vlist_ccrconfirm_sendmail` */;
/*!50001 DROP VIEW IF EXISTS `vlist_ccrconfirm_sendmail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlist_ccrconfirm_sendmail` AS select distinct `tbl_approval`.`id` AS `id`,`tbl_approval`.`form_type` AS `form_type`,`tbl_confirm`.`department_id` AS `department_id`,`tbl_approval`.`request_desc` AS `request_desc`,`tbl_approval`.`created_by` AS `created_by`,`tbl_approval`.`submit_date` AS `submit_date`,`tbl_approval`.`request_title` AS `request_title`,`tbl_info`.`ccr_customer` AS `ccr_customer`,`tbl_info`.`ccr_quantity` AS `ccr_quantity`,`tbl_info`.`ccr_job_jacket` AS `ccr_job_jacket`,`tbl_info`.`ccr_structure` AS `ccr_structure`,`tbl_info`.`ccr_code` AS `ccr_code`,`tbl_steps`.`approval_step_number` AS `approval_step_number`,`tbl_steps`.`approval_status` AS `approval_status`,`tbl_steps`.`approval_date` AS `approval_date`,`tbl_confirm`.`confirm_date` AS `confirm_date` from (((`tbl_request_approval` `tbl_approval` left join (select `tbl_request_approval_ccrinfo`.`ccr_customer` AS `ccr_customer`,`tbl_request_approval_ccrinfo`.`ccr_quantity` AS `ccr_quantity`,`tbl_request_approval_ccrinfo`.`ccr_job_jacket` AS `ccr_job_jacket`,`tbl_request_approval_ccrinfo`.`ccr_structure` AS `ccr_structure`,`tbl_request_approval_ccrinfo`.`ccr_code` AS `ccr_code`,`tbl_request_approval_ccrinfo`.`request_approval_id` AS `request_approval_id` from `tbl_request_approval_ccrinfo`) `tbl_info` on(`tbl_info`.`request_approval_id` = `tbl_approval`.`id`)) left join (select `tbl_request_approval_ccrconfirm`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_ccrconfirm`.`confirm_date` AS `confirm_date`,`tbl_request_approval_ccrconfirm`.`confirm_department` AS `department_id` from `tbl_request_approval_ccrconfirm` where `tbl_request_approval_ccrconfirm`.`confirm_status` = 0) `tbl_confirm` on(`tbl_confirm`.`request_approval_id` = `tbl_approval`.`id`)) left join (select `step1`.`request_approval_id` AS `request_approval_id`,`step1`.`approval_step_number` AS `approval_step_number`,`step1`.`approval_date` AS `approval_date`,`step1`.`approval_status` AS `approval_status` from `tbl_request_approval_steps` `step1` where `step1`.`approval_step_number` = (select max(`tbl_request_approval_steps`.`approval_step_number`) AS `approval_step_number` from `tbl_request_approval_steps` where `step1`.`request_approval_id` = `tbl_request_approval_steps`.`request_approval_id`)) `tbl_steps` on(`tbl_steps`.`request_approval_id` = `tbl_approval`.`id`)) where `tbl_approval`.`form_type` = 19 and `tbl_approval`.`request_status` = 37 and `tbl_confirm`.`department_id` > 0 and `tbl_steps`.`approval_date` is not null and `tbl_steps`.`approval_status` = 5 */;

/*View structure for view vlistccrapproval */

/*!50001 DROP TABLE IF EXISTS `vlistccrapproval` */;
/*!50001 DROP VIEW IF EXISTS `vlistccrapproval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistccrapproval` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`ccr_confirm`.`confirm_department` AS `confirm_group` from (((`tbl_request_approval` `treq_apr` left join `tbl_request_approval_steps` `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join `tbl_request_approval_invited` `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join `tbl_request_approval_ccrconfirm` `ccr_confirm` on(`treq_apr`.`id` = `ccr_confirm`.`request_approval_id`)) where `treq_apr`.`request_status` not in (1,4) and `treq_apr`.`form_type` = 19 */;

/*View structure for view vlistprice_awaiting20230804 */

/*!50001 DROP TABLE IF EXISTS `vlistprice_awaiting20230804` */;
/*!50001 DROP VIEW IF EXISTS `vlistprice_awaiting20230804` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistprice_awaiting20230804` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,if(`ra`.`due_date` <> '',to_days(`ra`.`due_date`) - to_days(current_timestamp()),9999) AS `count_date`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,NULL AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`pr`.`pr_code` AS `pr_code`,`pr`.`pr_total_price` AS `pr_total_price`,`pr_step`.`approval_group` AS `approval_group`,`pr_step`.`approval_date` AS `approval_date`,`pr_step`.`approval_by` AS `approval_by`,`pr_confirm`.`confirm_by` AS `confirm_by`,`pr_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval_price_info` `pr` join `tbl_request_approval` `ra` on(`ra`.`id` = `pr`.`request_approval_id`)) left join `tbl_request_approval_steps` `pr_step` on(`ra`.`id` = `pr_step`.`request_approval_id`)) left join `tbl_request_approval_price_confirm` `pr_confirm` on(`ra`.`id` = `pr_confirm`.`request_approval_id`)) left join `tbl_request_approval_price_invited` `pr_inv` on(`ra`.`id` = `pr_inv`.`request_approval_id`)) where `ra`.`request_status` not in (1,4) and `ra`.`form_type` = 43) */;

/*View structure for view vlistapprovaluser */

/*!50001 DROP TABLE IF EXISTS `vlistapprovaluser` */;
/*!50001 DROP VIEW IF EXISTS `vlistapprovaluser` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistapprovaluser` AS (select `rfa_s`.`id` AS `id`,`rfa_s`.`request_approval_id` AS `request_approval_id`,`rfa_s`.`approval_step_number` AS `approval_step_number`,`rfa_s`.`approval_group` AS `approval_group`,`rfa_s`.`approval_status` AS `approval_status`,`rfa_s`.`approval_comment` AS `approval_comment`,`rfa_s`.`approval_by` AS `approval_by`,`rfa_s`.`approval_date` AS `approval_date`,`ag_u`.`user_id` AS `approval_user` from (`tbl_request_approval_steps` `rfa_s` left join `tbl_approval_group_user` `ag_u` on(`rfa_s`.`approval_group` = `ag_u`.`approval_group_id`))) */;

/*View structure for view vlistcylinder_user */

/*!50001 DROP TABLE IF EXISTS `vlistcylinder_user` */;
/*!50001 DROP VIEW IF EXISTS `vlistcylinder_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistcylinder_user` AS (select `cylinder_confirm`.`request_approval_id` AS `request_approval_id`,`cylinder_confirm`.`confirm_department` AS `confirm_department`,`cylinder_confirm`.`confirm_status` AS `confirm_status`,`cylinder_confirm`.`confirm_by` AS `confirm_by`,`cylinder_confirm`.`confirm_date` AS `confirm_date`,`cylinder_deptuser`.`user_id` AS `confirm_user` from (`tbl_request_approval_cylinder_confirm` `cylinder_confirm` left join `tbl_request_approval_ccrdepartment_user` `cylinder_deptuser` on(`cylinder_confirm`.`confirm_department` = `cylinder_deptuser`.`department_id`))) */;

/*View structure for view vlistjjapproval */

/*!50001 DROP TABLE IF EXISTS `vlistjjapproval` */;
/*!50001 DROP VIEW IF EXISTS `vlistjjapproval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistjjapproval` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`form_type` AS `form_type`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`jj_confirm`.`confirm_department` AS `confirm_group`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name`,`jj_info`.`jj_type` AS `jj_type`,`jj_info`.`jj_type_name` AS `jj_type_name` from ((((`tbl_request_approval_jjinfo` `jj_info` join (select `tbl_request_approval`.`id` AS `id`,`tbl_request_approval`.`department_id` AS `department_id`,`tbl_request_approval`.`request_title` AS `request_title`,`tbl_request_approval`.`request_desc` AS `request_desc`,`tbl_request_approval`.`form_type` AS `form_type`,`tbl_request_approval`.`request_status` AS `request_status`,`tbl_request_approval`.`due_date` AS `due_date`,`tbl_request_approval`.`created_by` AS `created_by`,`tbl_request_approval`.`created_date` AS `created_date`,`tbl_request_approval`.`submit_date` AS `submit_date`,`tbl_request_approval`.`updated_date` AS `updated_date`,`tbl_request_approval`.`is_archived` AS `is_archived`,`tbl_request_approval`.`archived_by` AS `archived_by`,`tbl_request_approval`.`archived_date` AS `archived_date` from `tbl_request_approval`) `treq_apr` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) left join (select `tbl_request_approval_steps`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_steps`.`approval_group` AS `approval_group` from `tbl_request_approval_steps`) `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join (select `tbl_request_approval_jj_invited`.`user_id` AS `user_id`,`tbl_request_approval_jj_invited`.`request_approval_id` AS `request_approval_id` from `tbl_request_approval_jj_invited`) `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join (select `tbl_request_approval_jj_confirm`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jj_confirm`.`confirm_department` AS `confirm_department` from `tbl_request_approval_jj_confirm`) `jj_confirm` on(`treq_apr`.`id` = `jj_confirm`.`request_approval_id`)) where `treq_apr`.`request_status` = 5 and `treq_apr`.`form_type` = 40 and `treq_apr`.`id` > 19000 */;

/*View structure for view vlistccr_completed */

/*!50001 DROP TABLE IF EXISTS `vlistccr_completed` */;
/*!50001 DROP VIEW IF EXISTS `vlistccr_completed` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistccr_completed` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,`ra`.`request_desc` AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`ccr`.`ccr_code` AS `ccr_code`,`ccr`.`ccr_scope_of_change` AS `ccr_scope_of_change`,`ccr`.`ccr_scope_of_change_other` AS `ccr_scope_of_change_other`,`ccr`.`ccr_customer` AS `ccr_customer`,`ccr`.`ccr_job_jacket` AS `ccr_job_jacket`,`ccr`.`ccr_quantity` AS `ccr_quantity`,`ccr`.`ccr_structure` AS `ccr_structure`,`ccr`.`ccr_change_requirements_by_customer` AS `ccr_change_requirements_by_customer`,`ccr`.`ccr_change_for_improvement` AS `ccr_change_for_improvement`,`ccr_step`.`approval_group` AS `approval_group`,`ccr_confirm`.`confirm_department` AS `confirm_group`,`ccr_inv`.`user_id` AS `user_id` from ((((`tbl_request_approval` `ra` left join `tbl_request_approval_ccrinfo` `ccr` on(`ra`.`id` = `ccr`.`request_approval_id`)) left join `tbl_request_approval_steps` `ccr_step` on(`ra`.`id` = `ccr_step`.`request_approval_id`)) left join `tbl_request_approval_ccrconfirm` `ccr_confirm` on(`ra`.`id` = `ccr_confirm`.`request_approval_id`)) left join `tbl_request_approval_ccrinvited` `ccr_inv` on(`ra`.`id` = `ccr_inv`.`request_approval_id`)) where `ra`.`request_status` = 5 and `ra`.`form_type` = 19) */;

/*View structure for view vlistpurchaseafullview */

/*!50001 DROP TABLE IF EXISTS `vlistpurchaseafullview` */;
/*!50001 DROP VIEW IF EXISTS `vlistpurchaseafullview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistpurchaseafullview` AS (select `ra`.`id` AS `id`,`ra`.`department_id` AS `department_id`,`ra`.`form_type` AS `form_type`,`ra`.`request_title` AS `request_title`,NULL AS `request_desc`,`ra`.`request_status` AS `request_status`,`ra`.`due_date` AS `due_date`,`ra`.`created_by` AS `created_by`,`ra`.`created_date` AS `created_date`,`ra`.`submit_date` AS `submit_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`is_archived` AS `is_archived`,`ra`.`archived_by` AS `archived_by`,`ra`.`archived_date` AS `archived_date`,`purchase`.`pr_number` AS `pr_number`,`purchase`.`pr_notes` AS `pr_notes`,`purchase`.`ps_no` AS `ps_no`,(select max(`step`.`approval_date`) from `tbl_request_approval_steps` `step` where `step`.`request_approval_id` = `ra`.`id`) AS `approval_date` from (`tbl_request_approval_purchase_info` `purchase` join `tbl_request_approval` `ra` on(`ra`.`id` = `purchase`.`request_approval_id`)) where `ra`.`request_status` not in (1,4) and `ra`.`form_type` = 49) */;

/*View structure for view vlistawaitingapproval */

/*!50001 DROP TABLE IF EXISTS `vlistawaitingapproval` */;
/*!50001 DROP VIEW IF EXISTS `vlistawaitingapproval` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistawaitingapproval` AS (select `ra`.`id` AS `id`,`ra`.`form_type` AS `form_type`,`ra`.`request_status` AS `request_status`,min(`ras`.`approval_step_number`) AS `approval_step_number`,`ras`.`approval_status` AS `approval_status`,`ras`.`approval_group` AS `approval_group` from (`tbl_request_approval` `ra` join `tbl_request_approval_steps` `ras` on(`ra`.`id` = `ras`.`request_approval_id`)) where `ra`.`request_status` in (2,3) and `ras`.`approval_status` in (2,3) group by `ras`.`request_approval_id`) */;

/*View structure for view vlistreportjj */

/*!50001 DROP TABLE IF EXISTS `vlistreportjj` */;
/*!50001 DROP VIEW IF EXISTS `vlistreportjj` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vlistreportjj` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name`,`jj_notes`.`notes` AS `notes` from ((`tbl_request_approval` `treq_apr` left join (select `tbl_request_approval_jjinfo`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jjinfo`.`jj_number` AS `jj_number`,`tbl_request_approval_jjinfo`.`jj_job_jacket` AS `jj_job_jacket`,`tbl_request_approval_jjinfo`.`jj_version` AS `jj_version`,`tbl_request_approval_jjinfo`.`jj_fg_code` AS `jj_fg_code`,`tbl_request_approval_jjinfo`.`jj_product_name` AS `jj_product_name` from `tbl_request_approval_jjinfo`) `jj_info` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) left join (select `tbl_request_approval_notes`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_notes`.`notes` AS `notes` from `tbl_request_approval_notes`) `jj_notes` on(`treq_apr`.`id` = `jj_notes`.`request_approval_id` and `jj_notes`.`notes` like '%CANCELLED%')) where `treq_apr`.`request_status` not in (1,4) and `treq_apr`.`form_type` = 40 */;

/*View structure for view vlistjjinprogress */

/*!50001 DROP TABLE IF EXISTS `vlistjjinprogress` */;
/*!50001 DROP VIEW IF EXISTS `vlistjjinprogress` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vlistjjinprogress` AS select `treq_apr`.`id` AS `id`,`treq_apr`.`department_id` AS `department_id`,`treq_apr`.`request_title` AS `request_title`,`treq_apr`.`request_desc` AS `request_desc`,`treq_apr`.`form_type` AS `form_type`,`treq_apr`.`request_status` AS `request_status`,`treq_apr`.`due_date` AS `due_date`,`treq_apr`.`created_by` AS `created_by`,`treq_apr`.`created_date` AS `created_date`,`treq_apr`.`submit_date` AS `submit_date`,`treq_apr`.`updated_date` AS `updated_date`,`treq_apr`.`is_archived` AS `is_archived`,`treq_apr`.`archived_by` AS `archived_by`,`treq_apr`.`archived_date` AS `archived_date`,`treq_apr_stp`.`approval_group` AS `approval_group`,`treq_apr_inv`.`user_id` AS `user_id`,`jj_confirm`.`confirm_department` AS `confirm_group`,`jj_info`.`jj_number` AS `jj_number`,`jj_info`.`jj_job_jacket` AS `jj_job_jacket`,`jj_info`.`jj_version` AS `jj_version`,`jj_info`.`jj_fg_code` AS `jj_fg_code`,`jj_info`.`jj_product_name` AS `jj_product_name`,`jj_info`.`jj_type` AS `jj_type`,`jj_info`.`jj_type_name` AS `jj_type_name` from ((((`tbl_request_approval_jjinfo` `jj_info` join (select `tbl_request_approval`.`id` AS `id`,`tbl_request_approval`.`department_id` AS `department_id`,`tbl_request_approval`.`request_title` AS `request_title`,`tbl_request_approval`.`request_desc` AS `request_desc`,`tbl_request_approval`.`form_type` AS `form_type`,`tbl_request_approval`.`request_status` AS `request_status`,`tbl_request_approval`.`due_date` AS `due_date`,`tbl_request_approval`.`created_by` AS `created_by`,`tbl_request_approval`.`created_date` AS `created_date`,`tbl_request_approval`.`submit_date` AS `submit_date`,`tbl_request_approval`.`updated_date` AS `updated_date`,`tbl_request_approval`.`is_archived` AS `is_archived`,`tbl_request_approval`.`archived_by` AS `archived_by`,`tbl_request_approval`.`archived_date` AS `archived_date` from `tbl_request_approval`) `treq_apr` on(`treq_apr`.`id` = `jj_info`.`request_approval_id`)) left join (select `tbl_request_approval_steps`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_steps`.`approval_group` AS `approval_group` from `tbl_request_approval_steps`) `treq_apr_stp` on(`treq_apr`.`id` = `treq_apr_stp`.`request_approval_id`)) left join (select `tbl_request_approval_jj_invited`.`user_id` AS `user_id`,`tbl_request_approval_jj_invited`.`request_approval_id` AS `request_approval_id` from `tbl_request_approval_jj_invited`) `treq_apr_inv` on(`treq_apr`.`id` = `treq_apr_inv`.`request_approval_id`)) left join (select `tbl_request_approval_jj_confirm`.`request_approval_id` AS `request_approval_id`,`tbl_request_approval_jj_confirm`.`confirm_department` AS `confirm_department` from `tbl_request_approval_jj_confirm`) `jj_confirm` on(`treq_apr`.`id` = `jj_confirm`.`request_approval_id`)) where `treq_apr`.`request_status` in (1,4) and `treq_apr`.`form_type` = 40 */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
