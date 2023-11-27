/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - acca_ccts
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acca_ccts` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `acca_ccts`;

/*Table structure for table `tbl_approval_department` */

DROP TABLE IF EXISTS `tbl_approval_department`;

CREATE TABLE `tbl_approval_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `displayed_order` int(11) DEFAULT NULL,
  `ccts_hide` int(2) DEFAULT 0,
  `ccts_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_approval_department_user` */

DROP TABLE IF EXISTS `tbl_approval_department_user`;

CREATE TABLE `tbl_approval_department_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id` (`department_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_approval_group_user` */

DROP TABLE IF EXISTS `tbl_approval_group_user`;

CREATE TABLE `tbl_approval_group_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `approval_group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_approval_groups` */

DROP TABLE IF EXISTS `tbl_approval_groups`;

CREATE TABLE `tbl_approval_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `approval_name` varchar(200) DEFAULT NULL,
  `approval_desc` varchar(500) DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_attachedfiles` */

DROP TABLE IF EXISTS `tbl_attachedfiles`;

CREATE TABLE `tbl_attachedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `upload_type` varchar(50) DEFAULT NULL COMMENT 'action item, feedback',
  `upload_type_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `system_file_name` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `attached` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_configurations` */

DROP TABLE IF EXISTS `tbl_configurations`;

CREATE TABLE `tbl_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(150) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_customer_complain_info` */

DROP TABLE IF EXISTS `tbl_customer_complain_info`;

CREATE TABLE `tbl_customer_complain_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) DEFAULT NULL,
  `ccts_number` varchar(50) DEFAULT NULL,
  `ccts_version_number` int(11) DEFAULT 1,
  `ccts_version_list` varchar(500) DEFAULT NULL,
  `complaint_date` date DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  `request_complaint` text DEFAULT NULL,
  `quantity_of_complaint` varchar(50) DEFAULT NULL,
  `quantity_of_issue` varchar(50) DEFAULT NULL,
  `detail_of_issue` text DEFAULT NULL,
  `complaint_unit` varchar(50) DEFAULT NULL,
  `issue_unit` varchar(50) DEFAULT NULL,
  `quantity_inventory` float DEFAULT NULL,
  `quantity_inventory_customer` float DEFAULT NULL,
  `inventory_unit` varchar(50) DEFAULT NULL,
  `inventory_customer_unit` varchar(50) DEFAULT NULL,
  `job_jacket` varchar(50) DEFAULT NULL,
  `job_jacket_other` varchar(300) DEFAULT NULL,
  `request_issue` text DEFAULT NULL,
  `customer_request` text DEFAULT NULL,
  `sales_user_id` int(11) DEFAULT NULL,
  `sales_manager_id` int(11) DEFAULT NULL,
  `manager_approval_date` date DEFAULT NULL,
  `dept_related` varchar(50) DEFAULT NULL,
  `nc_type` int(11) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `request_info` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_customer_feedback` */

DROP TABLE IF EXISTS `tbl_customer_feedback`;

CREATE TABLE `tbl_customer_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) DEFAULT NULL,
  `customer_status` int(11) DEFAULT NULL COMMENT '0: Draf, 1: Done',
  `perform_result` text DEFAULT NULL,
  `perform_date` date DEFAULT NULL,
  `perform_user_id` int(11) DEFAULT NULL,
  `customer_satisfaction` int(11) DEFAULT NULL COMMENT '0: Thỏa mãn, 1: Tạm chấp nhận, 2: Không chấp nhận',
  `satisfaction_user_id` int(11) DEFAULT NULL,
  `satisfaction_date` date DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `satisfaction_created_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_feedback` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_customer_feedback_notes` */

DROP TABLE IF EXISTS `tbl_customer_feedback_notes`;

CREATE TABLE `tbl_customer_feedback_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `request_note` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ddl_cate` */

DROP TABLE IF EXISTS `tbl_ddl_cate`;

CREATE TABLE `tbl_ddl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_list_cate` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_defect_group` */

DROP TABLE IF EXISTS `tbl_defect_group`;

CREATE TABLE `tbl_defect_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vn` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_defect_name` */

DROP TABLE IF EXISTS `tbl_defect_name`;

CREATE TABLE `tbl_defect_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defect_name` varchar(50) DEFAULT NULL,
  `display_oder` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `defect_gruop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `mail_status` tinyint(4) DEFAULT 0 COMMENT '0 Pending 1-5 re_send 6-9 bug 10 ok',
  `status_value` varchar(500) DEFAULT 'Pending',
  `date_done` datetime DEFAULT NULL,
  `attachment_file` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2910 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_process` */

DROP TABLE IF EXISTS `tbl_process`;

CREATE TABLE `tbl_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_name` varchar(50) DEFAULT NULL,
  `process_name_en` varchar(50) DEFAULT NULL,
  `display` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_request` */

DROP TABLE IF EXISTS `tbl_request`;

CREATE TABLE `tbl_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_title` varchar(200) DEFAULT NULL,
  `request_description` text DEFAULT NULL,
  `request_status` int(11) DEFAULT NULL,
  `form_type` int(11) DEFAULT NULL,
  `is_archived` int(11) DEFAULT 0,
  `is_oldversion` int(11) DEFAULT 0,
  `submit_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_action` */

DROP TABLE IF EXISTS `tbl_request_action`;

CREATE TABLE `tbl_request_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) DEFAULT NULL,
  `action_status` int(11) DEFAULT 4 COMMENT '4:IDENTIFY PROBLEM ,5:PENDING INFO,6:SOLVING ACTION,7:PENDING APPROVAL (QM),13: APPROVED ACTION',
  `official` int(11) DEFAULT NULL COMMENT 'Yes, No',
  `official_receipt_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_quantity_of_fg` float DEFAULT NULL,
  `delivery_unit` varchar(50) DEFAULT NULL,
  `identify_problem` text DEFAULT NULL,
  `accepted_complaint` int(11) DEFAULT NULL COMMENT '0: No, 1: Yes, 2: Improved, 3: Noted, 4: Returned',
  `accepted_comment` text DEFAULT NULL,
  `action_created_id` int(11) DEFAULT NULL,
  `action_updated_id` int(11) DEFAULT NULL,
  `action_created_date` date DEFAULT NULL,
  `action_updated_date` date DEFAULT NULL,
  `action_accepted_id` int(11) DEFAULT NULL COMMENT 'Manager',
  `action_accepted_date` date DEFAULT NULL,
  `returned_fgs` int(11) DEFAULT NULL COMMENT '1:Yes,2:No',
  `nc_internal` int(11) DEFAULT NULL COMMENT '1:Yes,2:No',
  `nc_internal_related` varchar(200) DEFAULT NULL,
  `po_type` int(11) DEFAULT NULL COMMENT 'Repeated, New',
  `defect_name` varchar(200) DEFAULT NULL,
  `defect_group_id` int(11) DEFAULT NULL,
  `defect_repeated` int(11) DEFAULT NULL COMMENT '1:Repeated,2:New',
  `defect_related` varchar(200) DEFAULT NULL,
  `complaint_level` varchar(50) DEFAULT NULL COMMENT '1:Minor,2:Major,3:Critical',
  `responsibility_dept` varchar(200) DEFAULT NULL,
  `influence_food_safety` int(11) DEFAULT NULL COMMENT '1:Yes,2:No',
  `influence_performance` int(11) DEFAULT NULL COMMENT '1:Yes,2:No',
  `feedback_card_inc` int(11) DEFAULT NULL COMMENT '1:CAR,2:INC',
  `action_accepted_step2_id` int(10) DEFAULT NULL,
  `action_accepted_step2_date` date DEFAULT NULL,
  `action_confirm_id` int(11) DEFAULT NULL,
  `action_confirm_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `request_action` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_action_items` */

DROP TABLE IF EXISTS `tbl_request_action_items`;

CREATE TABLE `tbl_request_action_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) DEFAULT NULL,
  `request_action_id` bigint(20) DEFAULT NULL,
  `action_status` int(11) DEFAULT 0 COMMENT '0: Pending, 1:Waiting, 2: Done',
  `action_item_status` int(11) DEFAULT 0 COMMENT '0: Pending, 1: Waiting, 2: REJECTED, 3:Approved,4 :confirmed',
  `action_desc` varchar(200) DEFAULT NULL,
  `performer_group_id` varchar(100) DEFAULT NULL,
  `action_duedate` date DEFAULT NULL,
  `action_result` text DEFAULT NULL,
  `action_result_status` int(11) DEFAULT NULL COMMENT '0: Pending,1: Done,2: Cancel',
  `action_completed_date` date DEFAULT NULL,
  `perform_user_id` int(11) DEFAULT NULL,
  `perform_user_date` datetime DEFAULT NULL,
  `perform_status` int(11) DEFAULT 0 COMMENT '0: Pending, 1:Done',
  `action_approval_id` int(11) DEFAULT NULL,
  `action_approval_date` datetime DEFAULT NULL,
  `action_approval_comment` text DEFAULT NULL,
  `action_approval_id_step_2` int(10) NOT NULL DEFAULT 0 COMMENT '0: Pending, 1:Done',
  `action_approval_date_step_2` datetime DEFAULT NULL,
  `action_approval_comment_step_2` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `action_confirm_id` int(11) DEFAULT NULL,
  `action_confirm_date` timestamp NULL DEFAULT NULL,
  `action_confirm_note` varchar(100) DEFAULT NULL,
  `number_kppn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `request_action_item` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_department` */

DROP TABLE IF EXISTS `tbl_request_department`;

CREATE TABLE `tbl_request_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invited_index` (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_invited` */

DROP TABLE IF EXISTS `tbl_request_invited`;

CREATE TABLE `tbl_request_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invited_by` int(11) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `invited_index` (`request_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_notes` */

DROP TABLE IF EXISTS `tbl_request_notes`;

CREATE TABLE `tbl_request_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_note` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_role_matrix` */

DROP TABLE IF EXISTS `tbl_role_matrix`;

CREATE TABLE `tbl_role_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_role_matrix_20220719` */

DROP TABLE IF EXISTS `tbl_role_matrix_20220719`;

CREATE TABLE `tbl_role_matrix_20220719` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_key` varchar(50) DEFAULT NULL,
  `column_hide` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `viewqmprocess` */

DROP TABLE IF EXISTS `viewqmprocess`;

/*!50001 DROP VIEW IF EXISTS `viewqmprocess` */;
/*!50001 DROP TABLE IF EXISTS `viewqmprocess` */;

/*!50001 CREATE TABLE  `viewqmprocess`(
 `id` bigint(20) ,
 `request_title` varchar(200) ,
 `request_description` text ,
 `request_status` int(11) ,
 `created_date` datetime ,
 `updated_date` datetime ,
 `created_by` int(11) ,
 `updated_by` int(11) ,
 `is_archived` int(11) ,
 `is_oldversion` int(11) ,
 `complaint_date` date ,
 `customer_code` varchar(50) ,
 `customer_name` varchar(200) ,
 `product_code` varchar(50) ,
 `product_name` varchar(500) ,
 `request_complaint` text ,
 `quantity_of_complaint` varchar(50) ,
 `quantity_of_issue` varchar(50) ,
 `complaint_unit` varchar(50) ,
 `issue_unit` varchar(50) ,
 `quantity_inventory` float ,
 `inventory_unit` varchar(50) ,
 `job_jacket` varchar(50) ,
 `request_issue` text ,
 `customer_request` text ,
 `sales_user_id` int(11) ,
 `ccts_number` varchar(50) ,
 `sales_manager_id` int(11) ,
 `ccts_version_number` int(11) ,
 `ccts_version_list` varchar(500) ,
 `dept_related` varchar(50) ,
 `user_id` int(11) ,
 `department_id` int(11) 
)*/;

/*Table structure for table `view_actionitem_pending` */

DROP TABLE IF EXISTS `view_actionitem_pending`;

/*!50001 DROP VIEW IF EXISTS `view_actionitem_pending` */;
/*!50001 DROP TABLE IF EXISTS `view_actionitem_pending` */;

/*!50001 CREATE TABLE  `view_actionitem_pending`(
 `id` bigint(20) ,
 `request_title` varchar(200) ,
 `request_description` text ,
 `request_status` int(11) ,
 `created_date` datetime ,
 `updated_date` datetime ,
 `created_by` int(11) ,
 `updated_by` int(11) ,
 `is_archived` int(11) ,
 `is_oldversion` int(11) ,
 `complaint_date` date ,
 `customer_code` varchar(50) ,
 `customer_name` varchar(200) ,
 `product_code` varchar(50) ,
 `product_name` varchar(500) ,
 `request_complaint` text ,
 `quantity_of_complaint` varchar(50) ,
 `quantity_of_issue` varchar(50) ,
 `complaint_unit` varchar(50) ,
 `issue_unit` varchar(50) ,
 `quantity_inventory` float ,
 `inventory_unit` varchar(50) ,
 `job_jacket` varchar(50) ,
 `request_issue` text ,
 `customer_request` text ,
 `sales_user_id` int(11) ,
 `sales_manager_id` int(11) ,
 `ccts_number` varchar(50) ,
 `ccts_version_number` int(11) ,
 `ccts_version_list` varchar(500) ,
 `performer_group_id` varchar(100) ,
 `user_id` int(11) ,
 `department_id` int(11) 
)*/;

/*Table structure for table `viewdashboard` */

DROP TABLE IF EXISTS `viewdashboard`;

/*!50001 DROP VIEW IF EXISTS `viewdashboard` */;
/*!50001 DROP TABLE IF EXISTS `viewdashboard` */;

/*!50001 CREATE TABLE  `viewdashboard`(
 `id` bigint(20) ,
 `request_title` varchar(200) ,
 `request_description` text ,
 `request_status` int(11) ,
 `created_date` datetime ,
 `updated_date` datetime ,
 `created_by` int(11) ,
 `updated_by` int(11) ,
 `is_archived` int(11) ,
 `is_oldversion` int(11) ,
 `complaint_date` date ,
 `customer_code` varchar(50) ,
 `customer_name` varchar(200) ,
 `product_code` varchar(50) ,
 `product_name` varchar(500) ,
 `request_complaint` text ,
 `quantity_of_complaint` varchar(50) ,
 `quantity_of_issue` varchar(50) ,
 `complaint_unit` varchar(50) ,
 `issue_unit` varchar(50) ,
 `quantity_inventory` float ,
 `inventory_unit` varchar(50) ,
 `job_jacket` varchar(50) ,
 `request_issue` text ,
 `customer_request` text ,
 `sales_user_id` int(11) ,
 `sales_manager_id` int(11) ,
 `ccts_number` varchar(50) ,
 `ccts_version_number` int(11) ,
 `ccts_version_list` varchar(500) ,
 `user_id` int(11) ,
 `department_id` int(11) ,
 `performer_group_id` varchar(100) 
)*/;

/*Table structure for table `viewfeedback` */

DROP TABLE IF EXISTS `viewfeedback`;

/*!50001 DROP VIEW IF EXISTS `viewfeedback` */;
/*!50001 DROP TABLE IF EXISTS `viewfeedback` */;

/*!50001 CREATE TABLE  `viewfeedback`(
 `id` bigint(20) ,
 `request_title` varchar(200) ,
 `request_description` text ,
 `request_status` int(11) ,
 `created_date` datetime ,
 `updated_date` datetime ,
 `created_by` int(11) ,
 `updated_by` int(11) ,
 `is_archived` int(11) ,
 `is_oldversion` int(11) ,
 `complaint_date` date ,
 `customer_code` varchar(50) ,
 `customer_name` varchar(200) ,
 `product_code` varchar(50) ,
 `product_name` varchar(500) ,
 `request_complaint` text ,
 `quantity_of_complaint` varchar(50) ,
 `quantity_of_issue` varchar(50) ,
 `complaint_unit` varchar(50) ,
 `issue_unit` varchar(50) ,
 `quantity_inventory` float ,
 `inventory_unit` varchar(50) ,
 `job_jacket` varchar(50) ,
 `request_issue` text ,
 `customer_request` text ,
 `sales_user_id` int(11) ,
 `sales_manager_id` int(11) ,
 `ccts_number` varchar(50) ,
 `ccts_version_number` int(11) ,
 `ccts_version_list` varchar(500) ,
 `user_id` int(11) ,
 `department_id` int(11) 
)*/;

/*Table structure for table `viewnewcc` */

DROP TABLE IF EXISTS `viewnewcc`;

/*!50001 DROP VIEW IF EXISTS `viewnewcc` */;
/*!50001 DROP TABLE IF EXISTS `viewnewcc` */;

/*!50001 CREATE TABLE  `viewnewcc`(
 `id` bigint(20) ,
 `request_title` varchar(200) ,
 `request_description` text ,
 `request_status` int(11) ,
 `created_date` datetime ,
 `updated_date` datetime ,
 `created_by` int(11) ,
 `updated_by` int(11) ,
 `is_archived` int(11) ,
 `is_oldversion` int(11) ,
 `complaint_date` date ,
 `customer_code` varchar(50) ,
 `customer_name` varchar(200) ,
 `product_code` varchar(50) ,
 `product_name` varchar(500) ,
 `request_complaint` text ,
 `quantity_of_complaint` varchar(50) ,
 `quantity_of_issue` varchar(50) ,
 `complaint_unit` varchar(50) ,
 `issue_unit` varchar(50) ,
 `quantity_inventory` float ,
 `inventory_unit` varchar(50) ,
 `job_jacket` varchar(50) ,
 `request_issue` text ,
 `customer_request` text ,
 `sales_user_id` int(11) ,
 `ccts_number` varchar(50) ,
 `sales_manager_id` int(11) ,
 `ccts_version_number` int(11) ,
 `ccts_version_list` varchar(500) ,
 `user_id` int(11) ,
 `department_id` int(11) 
)*/;

/*Table structure for table `viewyouraction` */

DROP TABLE IF EXISTS `viewyouraction`;

/*!50001 DROP VIEW IF EXISTS `viewyouraction` */;
/*!50001 DROP TABLE IF EXISTS `viewyouraction` */;

/*!50001 CREATE TABLE  `viewyouraction`(
 `id` bigint(20) ,
 `request_title` varchar(200) ,
 `request_description` text ,
 `request_status` int(11) ,
 `created_date` datetime ,
 `updated_date` datetime ,
 `created_by` int(11) ,
 `updated_by` int(11) ,
 `is_archived` int(11) ,
 `is_oldversion` int(11) ,
 `complaint_date` date ,
 `customer_code` varchar(50) ,
 `customer_name` varchar(200) ,
 `product_code` varchar(50) ,
 `product_name` varchar(500) ,
 `request_complaint` text ,
 `quantity_of_complaint` varchar(50) ,
 `quantity_of_issue` varchar(50) ,
 `complaint_unit` varchar(50) ,
 `issue_unit` varchar(50) ,
 `quantity_inventory` float ,
 `inventory_unit` varchar(50) ,
 `job_jacket` varchar(50) ,
 `request_issue` text ,
 `customer_request` text ,
 `sales_user_id` int(11) ,
 `sales_manager_id` int(11) ,
 `ccts_number` varchar(50) ,
 `ccts_version_number` int(11) ,
 `ccts_version_list` varchar(500) ,
 `action_desc` varchar(200) ,
 `action_item_status` int(11) ,
 `performer_group_id` varchar(100) ,
 `action_duedate` date ,
 `request_id` bigint(20) ,
 `action_completed_date` date ,
 `user_id` int(11) ,
 `department_id` int(11) 
)*/;

/*Table structure for table `viewclose` */

DROP TABLE IF EXISTS `viewclose`;

/*!50001 DROP VIEW IF EXISTS `viewclose` */;
/*!50001 DROP TABLE IF EXISTS `viewclose` */;

/*!50001 CREATE TABLE  `viewclose`(
 `id` bigint(20) ,
 `request_title` varchar(200) ,
 `request_description` text ,
 `request_status` int(11) ,
 `created_date` datetime ,
 `updated_date` datetime ,
 `created_by` int(11) ,
 `updated_by` int(11) ,
 `is_archived` int(11) ,
 `is_oldversion` int(11) ,
 `complaint_date` date ,
 `customer_code` varchar(50) ,
 `customer_name` varchar(200) ,
 `product_code` varchar(50) ,
 `product_name` varchar(500) ,
 `request_complaint` text ,
 `quantity_of_complaint` varchar(50) ,
 `quantity_of_issue` varchar(50) ,
 `complaint_unit` varchar(50) ,
 `issue_unit` varchar(50) ,
 `quantity_inventory` float ,
 `inventory_unit` varchar(50) ,
 `job_jacket` varchar(50) ,
 `request_issue` text ,
 `customer_request` text ,
 `sales_user_id` int(11) ,
 `sales_manager_id` int(11) ,
 `ccts_number` varchar(50) ,
 `ccts_version_number` int(11) ,
 `ccts_version_list` varchar(500) ,
 `user_id` int(11) ,
 `department_id` int(11) 
)*/;

/*Table structure for table `viewqmconfirm` */

DROP TABLE IF EXISTS `viewqmconfirm`;

/*!50001 DROP VIEW IF EXISTS `viewqmconfirm` */;
/*!50001 DROP TABLE IF EXISTS `viewqmconfirm` */;

/*!50001 CREATE TABLE  `viewqmconfirm`(
 `id` bigint(20) ,
 `request_title` varchar(200) ,
 `request_description` text ,
 `request_status` int(11) ,
 `created_date` datetime ,
 `updated_date` datetime ,
 `created_by` int(11) ,
 `updated_by` int(11) ,
 `is_archived` int(11) ,
 `is_oldversion` int(11) ,
 `complaint_date` date ,
 `customer_code` varchar(50) ,
 `customer_name` varchar(200) ,
 `product_code` varchar(50) ,
 `product_name` varchar(500) ,
 `request_complaint` text ,
 `quantity_of_complaint` varchar(50) ,
 `quantity_of_issue` varchar(50) ,
 `complaint_unit` varchar(50) ,
 `issue_unit` varchar(50) ,
 `quantity_inventory` float ,
 `inventory_unit` varchar(50) ,
 `job_jacket` varchar(50) ,
 `request_issue` text ,
 `customer_request` text ,
 `sales_user_id` int(11) ,
 `sales_manager_id` int(11) ,
 `ccts_number` varchar(50) ,
 `ccts_version_number` int(11) ,
 `ccts_version_list` varchar(500) ,
 `action_item_status` int(11) ,
 `user_id` int(11) ,
 `department_id` int(11) 
)*/;

/*Table structure for table `view_waiting_result` */

DROP TABLE IF EXISTS `view_waiting_result`;

/*!50001 DROP VIEW IF EXISTS `view_waiting_result` */;
/*!50001 DROP TABLE IF EXISTS `view_waiting_result` */;

/*!50001 CREATE TABLE  `view_waiting_result`(
 `id` bigint(20) ,
 `request_title` varchar(200) ,
 `request_description` text ,
 `request_status` int(11) ,
 `created_date` datetime ,
 `updated_date` datetime ,
 `created_by` int(11) ,
 `updated_by` int(11) ,
 `is_archived` int(11) ,
 `is_oldversion` int(11) ,
 `complaint_date` date ,
 `customer_code` varchar(50) ,
 `customer_name` varchar(200) ,
 `product_code` varchar(50) ,
 `product_name` varchar(500) ,
 `request_complaint` text ,
 `quantity_of_complaint` varchar(50) ,
 `quantity_of_issue` varchar(50) ,
 `complaint_unit` varchar(50) ,
 `issue_unit` varchar(50) ,
 `quantity_inventory` float ,
 `inventory_unit` varchar(50) ,
 `job_jacket` varchar(50) ,
 `request_issue` text ,
 `customer_request` text ,
 `sales_user_id` int(11) ,
 `sales_manager_id` int(11) ,
 `ccts_number` varchar(50) ,
 `ccts_version_number` int(11) ,
 `ccts_version_list` varchar(500) ,
 `performer_group_id` varchar(100) ,
 `action_item_status` int(11) ,
 `user_id` int(11) ,
 `department_id` int(11) 
)*/;

/*View structure for view viewqmprocess */

/*!50001 DROP TABLE IF EXISTS `viewqmprocess` */;
/*!50001 DROP VIEW IF EXISTS `viewqmprocess` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `viewqmprocess` AS (select `ra`.`id` AS `id`,`ra`.`request_title` AS `request_title`,`ra`.`request_description` AS `request_description`,`ra`.`request_status` AS `request_status`,`ra`.`created_date` AS `created_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`created_by` AS `created_by`,`ra`.`updated_by` AS `updated_by`,`ra`.`is_archived` AS `is_archived`,`ra`.`is_oldversion` AS `is_oldversion`,`info`.`complaint_date` AS `complaint_date`,`info`.`customer_code` AS `customer_code`,`info`.`customer_name` AS `customer_name`,`info`.`product_code` AS `product_code`,`info`.`product_name` AS `product_name`,`info`.`request_complaint` AS `request_complaint`,`info`.`quantity_of_complaint` AS `quantity_of_complaint`,`info`.`quantity_of_issue` AS `quantity_of_issue`,`info`.`complaint_unit` AS `complaint_unit`,`info`.`issue_unit` AS `issue_unit`,`info`.`quantity_inventory` AS `quantity_inventory`,`info`.`inventory_unit` AS `inventory_unit`,`info`.`job_jacket` AS `job_jacket`,`info`.`request_issue` AS `request_issue`,`info`.`customer_request` AS `customer_request`,`info`.`sales_user_id` AS `sales_user_id`,`info`.`ccts_number` AS `ccts_number`,`info`.`sales_manager_id` AS `sales_manager_id`,`info`.`ccts_version_number` AS `ccts_version_number`,`info`.`ccts_version_list` AS `ccts_version_list`,`info`.`dept_related` AS `dept_related`,`invited`.`user_id` AS `user_id`,`dept`.`department_id` AS `department_id` from (((`tbl_request` `ra` left join `tbl_customer_complain_info` `info` on(`ra`.`id` = `info`.`request_id`)) left join `tbl_request_invited` `invited` on(`ra`.`id` = `invited`.`request_id`)) left join `tbl_request_department` `dept` on(`ra`.`id` = `dept`.`request_id`)) where `ra`.`request_status` in (4,5,6,7) and `ra`.`is_oldversion` = 0 and `ra`.`is_archived` = 0) */;

/*View structure for view view_actionitem_pending */

/*!50001 DROP TABLE IF EXISTS `view_actionitem_pending` */;
/*!50001 DROP VIEW IF EXISTS `view_actionitem_pending` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_actionitem_pending` AS (select `ra`.`id` AS `id`,`ra`.`request_title` AS `request_title`,`ra`.`request_description` AS `request_description`,`ra`.`request_status` AS `request_status`,`ra`.`created_date` AS `created_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`created_by` AS `created_by`,`ra`.`updated_by` AS `updated_by`,`ra`.`is_archived` AS `is_archived`,`ra`.`is_oldversion` AS `is_oldversion`,`info`.`complaint_date` AS `complaint_date`,`info`.`customer_code` AS `customer_code`,`info`.`customer_name` AS `customer_name`,`info`.`product_code` AS `product_code`,`info`.`product_name` AS `product_name`,`info`.`request_complaint` AS `request_complaint`,`info`.`quantity_of_complaint` AS `quantity_of_complaint`,`info`.`quantity_of_issue` AS `quantity_of_issue`,`info`.`complaint_unit` AS `complaint_unit`,`info`.`issue_unit` AS `issue_unit`,`info`.`quantity_inventory` AS `quantity_inventory`,`info`.`inventory_unit` AS `inventory_unit`,`info`.`job_jacket` AS `job_jacket`,`info`.`request_issue` AS `request_issue`,`info`.`customer_request` AS `customer_request`,`info`.`sales_user_id` AS `sales_user_id`,`info`.`sales_manager_id` AS `sales_manager_id`,`info`.`ccts_number` AS `ccts_number`,`info`.`ccts_version_number` AS `ccts_version_number`,`info`.`ccts_version_list` AS `ccts_version_list`,`item`.`performer_group_id` AS `performer_group_id`,`invited`.`user_id` AS `user_id`,`dept`.`department_id` AS `department_id` from ((((`tbl_request` `ra` left join `tbl_customer_complain_info` `info` on(`ra`.`id` = `info`.`request_id`)) left join `tbl_request_invited` `invited` on(`ra`.`id` = `invited`.`request_id`)) left join `tbl_request_action_items` `item` on(`ra`.`id` = `item`.`request_id`)) left join `tbl_request_department` `dept` on(`ra`.`id` = `dept`.`request_id`)) where `ra`.`request_status` = 9 and `ra`.`is_oldversion` = 0 and `ra`.`is_archived` = 0) */;

/*View structure for view viewdashboard */

/*!50001 DROP TABLE IF EXISTS `viewdashboard` */;
/*!50001 DROP VIEW IF EXISTS `viewdashboard` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `viewdashboard` AS (select `ra`.`id` AS `id`,`ra`.`request_title` AS `request_title`,`ra`.`request_description` AS `request_description`,`ra`.`request_status` AS `request_status`,`ra`.`created_date` AS `created_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`created_by` AS `created_by`,`ra`.`updated_by` AS `updated_by`,`ra`.`is_archived` AS `is_archived`,`ra`.`is_oldversion` AS `is_oldversion`,`info`.`complaint_date` AS `complaint_date`,`info`.`customer_code` AS `customer_code`,`info`.`customer_name` AS `customer_name`,`info`.`product_code` AS `product_code`,`info`.`product_name` AS `product_name`,`info`.`request_complaint` AS `request_complaint`,`info`.`quantity_of_complaint` AS `quantity_of_complaint`,`info`.`quantity_of_issue` AS `quantity_of_issue`,`info`.`complaint_unit` AS `complaint_unit`,`info`.`issue_unit` AS `issue_unit`,`info`.`quantity_inventory` AS `quantity_inventory`,`info`.`inventory_unit` AS `inventory_unit`,`info`.`job_jacket` AS `job_jacket`,`info`.`request_issue` AS `request_issue`,`info`.`customer_request` AS `customer_request`,`info`.`sales_user_id` AS `sales_user_id`,`info`.`sales_manager_id` AS `sales_manager_id`,`info`.`ccts_number` AS `ccts_number`,`info`.`ccts_version_number` AS `ccts_version_number`,`info`.`ccts_version_list` AS `ccts_version_list`,`invited`.`user_id` AS `user_id`,`dept`.`department_id` AS `department_id`,`item`.`performer_group_id` AS `performer_group_id` from ((((`tbl_request` `ra` left join `tbl_customer_complain_info` `info` on(`ra`.`id` = `info`.`request_id`)) left join `tbl_request_invited` `invited` on(`ra`.`id` = `invited`.`request_id`)) left join `tbl_request_department` `dept` on(`ra`.`id` = `dept`.`request_id`)) left join `tbl_request_action_items` `item` on(`ra`.`id` = `item`.`request_id`)) where `ra`.`request_status` in (1,4,5,6,7,8,9,10,11) and `ra`.`is_oldversion` = 0 and `ra`.`is_archived` = 0) */;

/*View structure for view viewfeedback */

/*!50001 DROP TABLE IF EXISTS `viewfeedback` */;
/*!50001 DROP VIEW IF EXISTS `viewfeedback` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `viewfeedback` AS (select `ra`.`id` AS `id`,`ra`.`request_title` AS `request_title`,`ra`.`request_description` AS `request_description`,`ra`.`request_status` AS `request_status`,`ra`.`created_date` AS `created_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`created_by` AS `created_by`,`ra`.`updated_by` AS `updated_by`,`ra`.`is_archived` AS `is_archived`,`ra`.`is_oldversion` AS `is_oldversion`,`info`.`complaint_date` AS `complaint_date`,`info`.`customer_code` AS `customer_code`,`info`.`customer_name` AS `customer_name`,`info`.`product_code` AS `product_code`,`info`.`product_name` AS `product_name`,`info`.`request_complaint` AS `request_complaint`,`info`.`quantity_of_complaint` AS `quantity_of_complaint`,`info`.`quantity_of_issue` AS `quantity_of_issue`,`info`.`complaint_unit` AS `complaint_unit`,`info`.`issue_unit` AS `issue_unit`,`info`.`quantity_inventory` AS `quantity_inventory`,`info`.`inventory_unit` AS `inventory_unit`,`info`.`job_jacket` AS `job_jacket`,`info`.`request_issue` AS `request_issue`,`info`.`customer_request` AS `customer_request`,`info`.`sales_user_id` AS `sales_user_id`,`info`.`sales_manager_id` AS `sales_manager_id`,`info`.`ccts_number` AS `ccts_number`,`info`.`ccts_version_number` AS `ccts_version_number`,`info`.`ccts_version_list` AS `ccts_version_list`,`invited`.`user_id` AS `user_id`,`dept`.`department_id` AS `department_id` from (((`tbl_request` `ra` left join `tbl_customer_complain_info` `info` on(`ra`.`id` = `info`.`request_id`)) left join `tbl_request_invited` `invited` on(`ra`.`id` = `invited`.`request_id`)) left join `tbl_request_department` `dept` on(`ra`.`id` = `dept`.`request_id`)) where `ra`.`request_status` = 11 and `ra`.`is_oldversion` = 0 and `ra`.`is_archived` = 0) */;

/*View structure for view viewnewcc */

/*!50001 DROP TABLE IF EXISTS `viewnewcc` */;
/*!50001 DROP VIEW IF EXISTS `viewnewcc` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `viewnewcc` AS (select `ra`.`id` AS `id`,`ra`.`request_title` AS `request_title`,`ra`.`request_description` AS `request_description`,`ra`.`request_status` AS `request_status`,`ra`.`created_date` AS `created_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`created_by` AS `created_by`,`ra`.`updated_by` AS `updated_by`,`ra`.`is_archived` AS `is_archived`,`ra`.`is_oldversion` AS `is_oldversion`,`info`.`complaint_date` AS `complaint_date`,`info`.`customer_code` AS `customer_code`,`info`.`customer_name` AS `customer_name`,`info`.`product_code` AS `product_code`,`info`.`product_name` AS `product_name`,`info`.`request_complaint` AS `request_complaint`,`info`.`quantity_of_complaint` AS `quantity_of_complaint`,`info`.`quantity_of_issue` AS `quantity_of_issue`,`info`.`complaint_unit` AS `complaint_unit`,`info`.`issue_unit` AS `issue_unit`,`info`.`quantity_inventory` AS `quantity_inventory`,`info`.`inventory_unit` AS `inventory_unit`,`info`.`job_jacket` AS `job_jacket`,`info`.`request_issue` AS `request_issue`,`info`.`customer_request` AS `customer_request`,`info`.`sales_user_id` AS `sales_user_id`,`info`.`ccts_number` AS `ccts_number`,`info`.`sales_manager_id` AS `sales_manager_id`,`info`.`ccts_version_number` AS `ccts_version_number`,`info`.`ccts_version_list` AS `ccts_version_list`,`invited`.`user_id` AS `user_id`,`dept`.`department_id` AS `department_id` from (((`tbl_request` `ra` left join `tbl_customer_complain_info` `info` on(`ra`.`id` = `info`.`request_id`)) left join `tbl_request_invited` `invited` on(`ra`.`id` = `invited`.`request_id`)) left join `tbl_request_department` `dept` on(`ra`.`id` = `dept`.`request_id`)) where `ra`.`request_status` in (0,1,2,3)) */;

/*View structure for view viewyouraction */

/*!50001 DROP TABLE IF EXISTS `viewyouraction` */;
/*!50001 DROP VIEW IF EXISTS `viewyouraction` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`#` SQL SECURITY DEFINER VIEW `viewyouraction` AS (select `ra`.`id` AS `id`,`ra`.`request_title` AS `request_title`,`ra`.`request_description` AS `request_description`,`ra`.`request_status` AS `request_status`,`ra`.`created_date` AS `created_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`created_by` AS `created_by`,`ra`.`updated_by` AS `updated_by`,`ra`.`is_archived` AS `is_archived`,`ra`.`is_oldversion` AS `is_oldversion`,`info`.`complaint_date` AS `complaint_date`,`info`.`customer_code` AS `customer_code`,`info`.`customer_name` AS `customer_name`,`info`.`product_code` AS `product_code`,`info`.`product_name` AS `product_name`,`info`.`request_complaint` AS `request_complaint`,`info`.`quantity_of_complaint` AS `quantity_of_complaint`,`info`.`quantity_of_issue` AS `quantity_of_issue`,`info`.`complaint_unit` AS `complaint_unit`,`info`.`issue_unit` AS `issue_unit`,`info`.`quantity_inventory` AS `quantity_inventory`,`info`.`inventory_unit` AS `inventory_unit`,`info`.`job_jacket` AS `job_jacket`,`info`.`request_issue` AS `request_issue`,`info`.`customer_request` AS `customer_request`,`info`.`sales_user_id` AS `sales_user_id`,`info`.`sales_manager_id` AS `sales_manager_id`,`info`.`ccts_number` AS `ccts_number`,`info`.`ccts_version_number` AS `ccts_version_number`,`info`.`ccts_version_list` AS `ccts_version_list`,`item`.`action_desc` AS `action_desc`,`item`.`action_item_status` AS `action_item_status`,`item`.`performer_group_id` AS `performer_group_id`,`item`.`action_duedate` AS `action_duedate`,`item`.`request_id` AS `request_id`,`item`.`action_completed_date` AS `action_completed_date`,`invited`.`user_id` AS `user_id`,`dept`.`department_id` AS `department_id` from ((((`tbl_request` `ra` left join `tbl_customer_complain_info` `info` on(`ra`.`id` = `info`.`request_id`)) left join `tbl_request_action_items` `item` on(`ra`.`id` = `item`.`request_id`)) left join `tbl_request_invited` `invited` on(`ra`.`id` = `invited`.`request_id`)) left join `tbl_request_department` `dept` on(`ra`.`id` = `dept`.`request_id`)) where `ra`.`request_status` = 8 and `ra`.`is_oldversion` = 0 and `ra`.`is_archived` = 0 and (`item`.`action_item_status` = 0 or `item`.`action_item_status` = 1 or `item`.`action_item_status` = 2)) */;

/*View structure for view viewclose */

/*!50001 DROP TABLE IF EXISTS `viewclose` */;
/*!50001 DROP VIEW IF EXISTS `viewclose` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `viewclose` AS (select `ra`.`id` AS `id`,`ra`.`request_title` AS `request_title`,`ra`.`request_description` AS `request_description`,`ra`.`request_status` AS `request_status`,`ra`.`created_date` AS `created_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`created_by` AS `created_by`,`ra`.`updated_by` AS `updated_by`,`ra`.`is_archived` AS `is_archived`,`ra`.`is_oldversion` AS `is_oldversion`,`info`.`complaint_date` AS `complaint_date`,`info`.`customer_code` AS `customer_code`,`info`.`customer_name` AS `customer_name`,`info`.`product_code` AS `product_code`,`info`.`product_name` AS `product_name`,`info`.`request_complaint` AS `request_complaint`,`info`.`quantity_of_complaint` AS `quantity_of_complaint`,`info`.`quantity_of_issue` AS `quantity_of_issue`,`info`.`complaint_unit` AS `complaint_unit`,`info`.`issue_unit` AS `issue_unit`,`info`.`quantity_inventory` AS `quantity_inventory`,`info`.`inventory_unit` AS `inventory_unit`,`info`.`job_jacket` AS `job_jacket`,`info`.`request_issue` AS `request_issue`,`info`.`customer_request` AS `customer_request`,`info`.`sales_user_id` AS `sales_user_id`,`info`.`sales_manager_id` AS `sales_manager_id`,`info`.`ccts_number` AS `ccts_number`,`info`.`ccts_version_number` AS `ccts_version_number`,`info`.`ccts_version_list` AS `ccts_version_list`,`invited`.`user_id` AS `user_id`,`dept`.`department_id` AS `department_id` from (((`tbl_request` `ra` left join `tbl_customer_complain_info` `info` on(`ra`.`id` = `info`.`request_id`)) left join `tbl_request_invited` `invited` on(`ra`.`id` = `invited`.`request_id`)) left join `tbl_request_department` `dept` on(`ra`.`id` = `dept`.`request_id`)) where `ra`.`request_status` = 12 and `ra`.`is_oldversion` = 0 and `ra`.`is_archived` = 0) */;

/*View structure for view viewqmconfirm */

/*!50001 DROP TABLE IF EXISTS `viewqmconfirm` */;
/*!50001 DROP VIEW IF EXISTS `viewqmconfirm` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `viewqmconfirm` AS (select `ra`.`id` AS `id`,`ra`.`request_title` AS `request_title`,`ra`.`request_description` AS `request_description`,`ra`.`request_status` AS `request_status`,`ra`.`created_date` AS `created_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`created_by` AS `created_by`,`ra`.`updated_by` AS `updated_by`,`ra`.`is_archived` AS `is_archived`,`ra`.`is_oldversion` AS `is_oldversion`,`info`.`complaint_date` AS `complaint_date`,`info`.`customer_code` AS `customer_code`,`info`.`customer_name` AS `customer_name`,`info`.`product_code` AS `product_code`,`info`.`product_name` AS `product_name`,`info`.`request_complaint` AS `request_complaint`,`info`.`quantity_of_complaint` AS `quantity_of_complaint`,`info`.`quantity_of_issue` AS `quantity_of_issue`,`info`.`complaint_unit` AS `complaint_unit`,`info`.`issue_unit` AS `issue_unit`,`info`.`quantity_inventory` AS `quantity_inventory`,`info`.`inventory_unit` AS `inventory_unit`,`info`.`job_jacket` AS `job_jacket`,`info`.`request_issue` AS `request_issue`,`info`.`customer_request` AS `customer_request`,`info`.`sales_user_id` AS `sales_user_id`,`info`.`sales_manager_id` AS `sales_manager_id`,`info`.`ccts_number` AS `ccts_number`,`info`.`ccts_version_number` AS `ccts_version_number`,`info`.`ccts_version_list` AS `ccts_version_list`,`item`.`action_item_status` AS `action_item_status`,`invited`.`user_id` AS `user_id`,`dept`.`department_id` AS `department_id` from ((((`tbl_request` `ra` left join `tbl_customer_complain_info` `info` on(`ra`.`id` = `info`.`request_id`)) left join `tbl_request_action_items` `item` on(`ra`.`id` = `item`.`request_id`)) left join `tbl_request_invited` `invited` on(`ra`.`id` = `invited`.`request_id`)) left join `tbl_request_department` `dept` on(`ra`.`id` = `dept`.`request_id`)) where `ra`.`request_status` = 10 and `ra`.`is_oldversion` = 0 and `ra`.`is_archived` = 0) */;

/*View structure for view view_waiting_result */

/*!50001 DROP TABLE IF EXISTS `view_waiting_result` */;
/*!50001 DROP VIEW IF EXISTS `view_waiting_result` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_waiting_result` AS (select `ra`.`id` AS `id`,`ra`.`request_title` AS `request_title`,`ra`.`request_description` AS `request_description`,`ra`.`request_status` AS `request_status`,`ra`.`created_date` AS `created_date`,`ra`.`updated_date` AS `updated_date`,`ra`.`created_by` AS `created_by`,`ra`.`updated_by` AS `updated_by`,`ra`.`is_archived` AS `is_archived`,`ra`.`is_oldversion` AS `is_oldversion`,`info`.`complaint_date` AS `complaint_date`,`info`.`customer_code` AS `customer_code`,`info`.`customer_name` AS `customer_name`,`info`.`product_code` AS `product_code`,`info`.`product_name` AS `product_name`,`info`.`request_complaint` AS `request_complaint`,`info`.`quantity_of_complaint` AS `quantity_of_complaint`,`info`.`quantity_of_issue` AS `quantity_of_issue`,`info`.`complaint_unit` AS `complaint_unit`,`info`.`issue_unit` AS `issue_unit`,`info`.`quantity_inventory` AS `quantity_inventory`,`info`.`inventory_unit` AS `inventory_unit`,`info`.`job_jacket` AS `job_jacket`,`info`.`request_issue` AS `request_issue`,`info`.`customer_request` AS `customer_request`,`info`.`sales_user_id` AS `sales_user_id`,`info`.`sales_manager_id` AS `sales_manager_id`,`info`.`ccts_number` AS `ccts_number`,`info`.`ccts_version_number` AS `ccts_version_number`,`info`.`ccts_version_list` AS `ccts_version_list`,`item`.`performer_group_id` AS `performer_group_id`,`item`.`action_item_status` AS `action_item_status`,`invited`.`user_id` AS `user_id`,`dept`.`department_id` AS `department_id` from ((((`tbl_request` `ra` left join `tbl_customer_complain_info` `info` on(`ra`.`id` = `info`.`request_id`)) left join `tbl_request_action_items` `item` on(`ra`.`id` = `item`.`request_id`)) left join `tbl_request_invited` `invited` on(`ra`.`id` = `invited`.`request_id`)) left join `tbl_request_department` `dept` on(`ra`.`id` = `dept`.`request_id`)) where `ra`.`request_status` = 8 and `ra`.`is_oldversion` = 0 and `ra`.`is_archived` = 0 and (`item`.`action_item_status` = 0 or `item`.`action_item_status` = 1 or `item`.`action_item_status` = 2)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
