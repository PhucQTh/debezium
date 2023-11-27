/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - acca_qcs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acca_qcs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `acca_qcs`;

/*Table structure for table `child` */

DROP TABLE IF EXISTS `child`;

CREATE TABLE `child` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` char(80) DEFAULT NULL,
  PRIMARY KEY (`id`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `child_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `parent` */

DROP TABLE IF EXISTS `parent`;

CREATE TABLE `parent` (
  `id` int(11) NOT NULL,
  `name` char(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_attachedfiles` */

DROP TABLE IF EXISTS `tbl_attachedfiles`;

CREATE TABLE `tbl_attachedfiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `upload_type` varchar(50) DEFAULT NULL COMMENT '0=>DEFAULT, 1=> QC, 2=>LAB',
  `upload_type_id` int(11) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB AUTO_INCREMENT=49044 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ccr` */

DROP TABLE IF EXISTS `tbl_ccr`;

CREATE TABLE `tbl_ccr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lsx_input` varchar(100) DEFAULT NULL,
  `ccr_no` varchar(100) DEFAULT NULL,
  `ccr_customer` varchar(200) DEFAULT NULL,
  `ccr_lsx` varchar(300) DEFAULT NULL,
  `ccr_quantity` varchar(100) DEFAULT NULL,
  `ccr_product_name` varchar(300) DEFAULT NULL,
  `ccr_structure` varchar(100) DEFAULT NULL,
  `ccr_requested_by` int(11) DEFAULT NULL,
  `ccr_requested_date` datetime DEFAULT NULL,
  `ccr_description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_ccr_info` */

DROP TABLE IF EXISTS `tbl_ccr_info`;

CREATE TABLE `tbl_ccr_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ccr_job_id` int(10) unsigned NOT NULL,
  `ccr_no` varchar(100) DEFAULT NULL,
  `ccr_customer` varchar(200) DEFAULT NULL,
  `ccr_quantity` varchar(100) DEFAULT NULL,
  `ccr_product_name` varchar(500) DEFAULT NULL,
  `ccr_structure` varchar(100) DEFAULT NULL,
  `ccr_job_jacket` varchar(200) DEFAULT NULL,
  `ccr_requested_by` int(11) DEFAULT NULL,
  `ccr_department_id` int(11) DEFAULT NULL,
  `ccr_requested_date` datetime DEFAULT NULL,
  `ccr_description` longtext DEFAULT NULL,
  `ccr_scope_of_change` varchar(200) DEFAULT NULL,
  `ccr_scope_of_change_value` varchar(500) DEFAULT NULL,
  `ccr_answer_question_one` int(11) DEFAULT NULL,
  `ccr_answer_question_two` int(11) DEFAULT NULL,
  `ccr_answer_question_three` int(11) DEFAULT NULL,
  `ccr_change_requirements_by_customer` int(11) DEFAULT NULL,
  `ccr_change_for_improvement` int(11) DEFAULT NULL,
  `ccr_change_other` int(11) DEFAULT NULL,
  `ccr_change_other_value` varchar(500) DEFAULT NULL,
  `evaluate` varchar(200) DEFAULT NULL,
  `ccr_status` int(11) DEFAULT 59,
  `ccr_result` int(11) DEFAULT 20,
  `remark` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ccr_job_id` (`ccr_job_id`) USING BTREE,
  CONSTRAINT `tbl_ccr_info_ibfk_1` FOREIGN KEY (`ccr_job_id`) REFERENCES `tbl_ccr_jobjacket` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1872 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_ccr_jobjacket` */

DROP TABLE IF EXISTS `tbl_ccr_jobjacket`;

CREATE TABLE `tbl_ccr_jobjacket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_id` int(11) DEFAULT NULL,
  `ccr_status` int(11) DEFAULT 1 COMMENT '1=ACTIVED, 2- isUsed',
  `ccr_version` int(11) DEFAULT 0,
  `job_jacket_number` varchar(50) DEFAULT NULL,
  `job_type` varchar(50) DEFAULT NULL,
  `so_number` varchar(50) DEFAULT NULL,
  `po_name` varchar(200) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL,
  `number_order` decimal(18,4) DEFAULT NULL,
  `number_order_unit` varchar(50) DEFAULT NULL,
  `offer_delivery_date` datetime DEFAULT NULL,
  `quantity_finished_product` decimal(18,4) DEFAULT NULL,
  `po_customer` varchar(50) DEFAULT NULL,
  `yccp_code` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_name` varchar(500) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `submit_by` int(11) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approval_by` int(11) DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_comment` text DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_archived` int(11) DEFAULT 0,
  `archived_by` int(11) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  `evaluate` varchar(200) DEFAULT NULL,
  `status_comment` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1606 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_ccr_notes` */

DROP TABLE IF EXISTS `tbl_ccr_notes`;

CREATE TABLE `tbl_ccr_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ccr_job_id` int(10) unsigned NOT NULL,
  `workcenter_id` int(11) DEFAULT NULL,
  `ccr_list_id` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ccr_job_id` (`ccr_job_id`) USING BTREE,
  CONSTRAINT `tbl_ccr_notes_ibfk_1` FOREIGN KEY (`ccr_job_id`) REFERENCES `tbl_ccr_jobjacket` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_ccr_workcenter_notes` */

DROP TABLE IF EXISTS `tbl_ccr_workcenter_notes`;

CREATE TABLE `tbl_ccr_workcenter_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccr_id` int(11) DEFAULT NULL,
  `workcenter_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_checked_history` */

DROP TABLE IF EXISTS `tbl_checked_history`;

CREATE TABLE `tbl_checked_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `work_center_id` int(11) DEFAULT NULL,
  `machine_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `time_checked` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1080992 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `section` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `color_alert` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `label_grid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `display_order` float DEFAULT 0,
  `in_use` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_id` (`category_id`),
  CONSTRAINT `tbl_ddl_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tbl_ddl_cate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_ddl_cate` */

DROP TABLE IF EXISTS `tbl_ddl_cate`;

CREATE TABLE `tbl_ddl_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `drop_down_list_cate` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_fileqc` */

DROP TABLE IF EXISTS `tbl_fileqc`;

CREATE TABLE `tbl_fileqc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `test_result_id` int(11) DEFAULT NULL,
  `fileqc_no` varchar(50) DEFAULT NULL,
  `fileqc_type` int(1) DEFAULT 1 COMMENT '1 File by QC, 2 file NC, 3 CCR',
  `fileqc_status` int(1) DEFAULT 1 COMMENT '1 Public, 2 Private',
  `job_jacket_number` varchar(50) DEFAULT NULL,
  `job_type` varchar(50) DEFAULT NULL COMMENT 'New, Repeat',
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_name` varchar(500) DEFAULT NULL,
  `qcsp_code` varchar(50) DEFAULT NULL,
  `structure` varchar(200) DEFAULT NULL,
  `mfg_date` varchar(200) DEFAULT NULL,
  `work_center_id` int(11) DEFAULT NULL,
  `work_center_name` varchar(200) DEFAULT NULL COMMENT 'Bộ phận',
  `machine_id` int(11) DEFAULT NULL,
  `machine_name` varchar(200) DEFAULT NULL COMMENT 'Máy',
  `operator_no` varchar(200) DEFAULT NULL COMMENT 'Trưởng máy',
  `shift_id` int(11) DEFAULT NULL,
  `shift_name` varchar(200) DEFAULT NULL COMMENT 'Ca',
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_fileqc_detail` */

DROP TABLE IF EXISTS `tbl_fileqc_detail`;

CREATE TABLE `tbl_fileqc_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `fileqc_id` int(11) unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_desc` varchar(500) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `system_file_name` varchar(255) DEFAULT NULL,
  `location_path` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fileqc_id` (`fileqc_id`),
  CONSTRAINT `tbl_fileqc_detail_ibfk_1` FOREIGN KEY (`fileqc_id`) REFERENCES `tbl_fileqc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1694 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_fileqc_notes` */

DROP TABLE IF EXISTS `tbl_fileqc_notes`;

CREATE TABLE `tbl_fileqc_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `fileqc_id` int(11) unsigned NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_note` (`id`),
  KEY `fileqc_id` (`fileqc_id`),
  CONSTRAINT `tbl_fileqc_notes_ibfk_1` FOREIGN KEY (`fileqc_id`) REFERENCES `tbl_fileqc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

/*Table structure for table `tbl_frequency` */

DROP TABLE IF EXISTS `tbl_frequency`;

CREATE TABLE `tbl_frequency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `frequency_name` varchar(100) DEFAULT NULL,
  `frequency_name_us` varchar(100) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_gcqc` */

DROP TABLE IF EXISTS `tbl_gcqc`;

CREATE TABLE `tbl_gcqc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gc_status` int(11) DEFAULT NULL,
  `sopqc_id` int(11) DEFAULT NULL,
  `sopqc_code` varchar(50) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_name` varchar(500) DEFAULT NULL,
  `customer_other` varchar(200) DEFAULT NULL,
  `customer_other_info` varchar(500) DEFAULT NULL,
  `structure` varchar(200) DEFAULT NULL,
  `gcqc_note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_gcqc_detail` */

DROP TABLE IF EXISTS `tbl_gcqc_detail`;

CREATE TABLE `tbl_gcqc_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gc_id` int(11) unsigned NOT NULL,
  `gcqc_status` int(1) DEFAULT 0,
  `test_result_gc_cate_id` int(11) unsigned NOT NULL,
  `gcqc_number` int(11) DEFAULT NULL,
  `gcqc_number_unit` text DEFAULT NULL,
  `last_test_by` int(11) DEFAULT NULL,
  `last_test_job_id` int(11) DEFAULT NULL,
  `last_test_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbl_gcqc_detail_tbl_gcqc` (`gc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_gcqc_result` */

DROP TABLE IF EXISTS `tbl_gcqc_result`;

CREATE TABLE `tbl_gcqc_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gc_detail_id` int(11) unsigned NOT NULL,
  `test_result_gc_cate_id` int(11) unsigned NOT NULL,
  `test_result_gc_id` int(11) unsigned NOT NULL,
  `job_id` int(11) unsigned NOT NULL,
  `work_center_id` int(11) unsigned NOT NULL,
  `test_line` int(11) DEFAULT 1,
  `test_value` varchar(200) DEFAULT NULL,
  `test_remark` text DEFAULT NULL,
  `test_by` int(11) DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_tbl_gcqc_result_tbl_gcqc_detail` (`gc_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_gcqc_template` */

DROP TABLE IF EXISTS `tbl_gcqc_template`;

CREATE TABLE `tbl_gcqc_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `work_center_id` int(11) unsigned NOT NULL,
  `unit_id` int(11) unsigned NOT NULL,
  `frequency_id` int(11) unsigned NOT NULL,
  `gcqc_template_name` varchar(200) DEFAULT NULL,
  `gcqc_template_name_us` varchar(200) DEFAULT NULL,
  `gcqc_template_target` varchar(200) DEFAULT NULL COMMENT 'Default Value',
  `display_order` float DEFAULT NULL,
  `is_lab` tinyint(1) DEFAULT 0 COMMENT '0=> QC, 1=>LAB',
  `hardcode_key` int(11) DEFAULT 0 COMMENT 'DDL HARDCODE',
  `input_type` int(11) DEFAULT 12 COMMENT 'DDL INPUT TYPE',
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`),
  KEY `tbl_gcqc_template_ibfk_1` (`work_center_id`),
  CONSTRAINT `tbl_gcqc_template_ibfk_1` FOREIGN KEY (`work_center_id`) REFERENCES `tbl_work_center` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_gcqc_template_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `tbl_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_gcqc_template_detail` */

DROP TABLE IF EXISTS `tbl_gcqc_template_detail`;

CREATE TABLE `tbl_gcqc_template_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gcqc_template_id` int(11) unsigned NOT NULL,
  `gcqc_template_detail_name` varchar(200) DEFAULT NULL,
  `gcqc_template_detail_name_us` varchar(200) DEFAULT NULL,
  `gcqc_template_detail_target` varchar(200) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_gcqc_template_detail_ibfk_1` (`gcqc_template_id`),
  CONSTRAINT `tbl_gcqc_template_detail_ibfk_1` FOREIGN KEY (`gcqc_template_id`) REFERENCES `tbl_gcqc_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_iopqc_template` */

DROP TABLE IF EXISTS `tbl_iopqc_template`;

CREATE TABLE `tbl_iopqc_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `work_center_id` int(11) unsigned NOT NULL,
  `iopqc_template_name` varchar(200) DEFAULT NULL,
  `iopqc_template_name_us` varchar(200) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  `input_type` int(11) DEFAULT NULL COMMENT 'DDL Input type',
  `hardcode_key` int(11) DEFAULT 0 COMMENT 'DDL HARDCODE',
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_sopqc_template_ibfk_1` (`work_center_id`),
  CONSTRAINT `tbl_iopqc_template_ibfk_1` FOREIGN KEY (`work_center_id`) REFERENCES `tbl_work_center` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_iopqc_template_detail` */

DROP TABLE IF EXISTS `tbl_iopqc_template_detail`;

CREATE TABLE `tbl_iopqc_template_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iopqc_template_id` int(11) unsigned NOT NULL,
  `iopqc_template_detail_name` varchar(200) DEFAULT NULL,
  `iopqc_template_detail_name_us` varchar(200) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_sopqc_template_detail_ibfk_1` (`iopqc_template_id`),
  CONSTRAINT `tbl_iopqc_template_detail_ibfk_1` FOREIGN KEY (`iopqc_template_id`) REFERENCES `tbl_iopqc_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=33287 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ncrqc` */

DROP TABLE IF EXISTS `tbl_ncrqc`;

CREATE TABLE `tbl_ncrqc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `test_result_id` int(11) DEFAULT NULL,
  `ncr_no` varchar(50) DEFAULT NULL,
  `ncr_type` int(1) DEFAULT 1 COMMENT '1 = Quality Note; 2=Label Yellow',
  `ncr_status` int(1) DEFAULT 1 COMMENT '1 =DRAFT,2=ACTIVED',
  `ncr_version` int(1) DEFAULT 0,
  `job_jacket_number` varchar(50) DEFAULT NULL,
  `job_type` varchar(50) DEFAULT NULL COMMENT 'New, Repeat',
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(500) NOT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_name` varchar(500) DEFAULT NULL,
  `qcsp_code` varchar(50) DEFAULT NULL,
  `structure` varchar(200) DEFAULT NULL,
  `number_order` varchar(200) DEFAULT NULL,
  `number_order_unit` varchar(50) DEFAULT NULL,
  `number_order_pcs` varchar(200) DEFAULT NULL,
  `number_order_unit_pcs` varchar(50) DEFAULT NULL,
  `quantity_finished_product` varchar(200) DEFAULT NULL,
  `mfg_date` varchar(200) DEFAULT NULL,
  `work_center_id` int(11) DEFAULT NULL,
  `work_center_name` varchar(200) DEFAULT NULL COMMENT 'Bộ phận phát hiện',
  `machine_id` int(11) DEFAULT NULL,
  `machine_name` varchar(200) DEFAULT NULL COMMENT 'Máy phát hiện',
  `operator_no` varchar(200) DEFAULT NULL COMMENT 'Trưởng máy phát hiện',
  `shift_name` varchar(200) DEFAULT NULL COMMENT 'Ca phát hiện',
  `error_date` varchar(200) DEFAULT NULL COMMENT 'Ngày gây lỗi',
  `error_machine_name` varchar(200) DEFAULT NULL COMMENT 'Máy gây lỗi',
  `error_operator_no` varchar(200) DEFAULT NULL,
  `error_shift_name` varchar(200) DEFAULT NULL COMMENT 'Ca gây lỗi',
  `qc_shift_leader` varchar(200) DEFAULT NULL COMMENT 'Inspector by QC/ QC Shift Leader',
  `date_found_error` varchar(200) DEFAULT NULL COMMENT 'ngày tìm thấy lỗi',
  `note_of_detail_defect` text DEFAULT NULL,
  `note_of_quantity_defect` text DEFAULT NULL,
  `note_of_treatment_solution` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `submit_by` int(11) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approval_by` int(11) DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_comment` text DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_archived` int(1) DEFAULT 0,
  `archived_by` int(11) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  `update_version_date` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10609 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_ncrqc_detail` */

DROP TABLE IF EXISTS `tbl_ncrqc_detail`;

CREATE TABLE `tbl_ncrqc_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ncrqc_id` int(11) DEFAULT NULL,
  `checked_type` int(11) DEFAULT NULL COMMENT '1 qn, 2 yellow, 3 sub qn',
  `status` int(11) DEFAULT 1 COMMENT '1 active, 2 not active',
  `trace_id` varchar(200) DEFAULT NULL,
  `set_no` varchar(200) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL COMMENT 'nếu là tem vàng đơn vị là( 1 m2, 2 m, 3 pcs )',
  `detail_of_defect` text DEFAULT NULL,
  `quantity_defect` text DEFAULT NULL,
  `treatment_solution` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `countprint` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_prod_schedule` */

DROP TABLE IF EXISTS `tbl_prod_schedule`;

CREATE TABLE `tbl_prod_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_sop` int(11) DEFAULT NULL,
  `ccr_id` int(11) DEFAULT NULL,
  `job_status` int(11) DEFAULT 1 COMMENT '1 là active 2 InActive 3 là completed',
  `job_jacket_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sopqc_code` varchar(50) DEFAULT NULL,
  `soprd_code` varchar(500) DEFAULT NULL,
  `yccp_code` varchar(50) DEFAULT NULL,
  `ccr_number` varchar(50) DEFAULT NULL,
  `job_type` varchar(50) DEFAULT NULL COMMENT 'N=>new, R=>Repeat',
  `qcsp_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lsxthamchieu` varchar(50) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `offer_delivery_date` datetime DEFAULT NULL,
  `so_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `po_name` varchar(50) DEFAULT NULL,
  `po_customer` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_name` varchar(250) DEFAULT NULL,
  `structure` varchar(200) DEFAULT NULL,
  `number_order` decimal(18,4) DEFAULT NULL,
  `number_order_unit` varchar(50) DEFAULT NULL,
  `quantity_finished_product` decimal(18,4) DEFAULT NULL,
  `deviation` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_archived` int(1) DEFAULT NULL,
  `archived_by` int(11) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  `job_version` int(1) DEFAULT 0,
  `version_by` int(11) DEFAULT NULL,
  `version_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6912 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_role_matrix` */

DROP TABLE IF EXISTS `tbl_role_matrix`;

CREATE TABLE `tbl_role_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_sopqc` */

DROP TABLE IF EXISTS `tbl_sopqc`;

CREATE TABLE `tbl_sopqc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sop_status` int(11) unsigned NOT NULL,
  `sopqc_code` varchar(50) DEFAULT NULL,
  `soprd_code` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_name` varchar(500) DEFAULT NULL,
  `qcsp_code` varchar(50) DEFAULT NULL,
  `qcsp_name` varchar(500) DEFAULT NULL,
  `structure` varchar(200) DEFAULT NULL,
  `work_center_list` varchar(200) DEFAULT NULL,
  `sopqc_note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `submit_by` int(11) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_by` int(11) DEFAULT NULL,
  `approval_comment` text DEFAULT NULL,
  `cloned_from` int(11) DEFAULT NULL,
  `cloned_by` int(11) DEFAULT NULL,
  `cloned_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_archived` int(1) DEFAULT 0,
  `archived_by` int(11) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8796 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_sopqc_detail` */

DROP TABLE IF EXISTS `tbl_sopqc_detail`;

CREATE TABLE `tbl_sopqc_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sopqc_id` int(11) unsigned NOT NULL,
  `work_center_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `sopqc_template_id` int(11) NOT NULL,
  `sopqc_template_detail_id` int(11) DEFAULT NULL,
  `is_lab` tinyint(1) DEFAULT 0,
  `coa_target` varchar(200) DEFAULT NULL COMMENT 'Certificate of Analysis (COA)',
  `coa_min` double DEFAULT NULL,
  `coa_max` double DEFAULT NULL,
  `coa_remark` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`sopqc_id`),
  CONSTRAINT `tbl_sopqc_detail_ibfk_1` FOREIGN KEY (`sopqc_id`) REFERENCES `tbl_sopqc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2050587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_sopqc_detail_20230915` */

DROP TABLE IF EXISTS `tbl_sopqc_detail_20230915`;

CREATE TABLE `tbl_sopqc_detail_20230915` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sopqc_id` int(11) unsigned NOT NULL,
  `work_center_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `sopqc_template_id` int(11) NOT NULL,
  `sopqc_template_detail_id` int(11) DEFAULT NULL,
  `is_lab` tinyint(1) DEFAULT 0,
  `coa_target` varchar(200) DEFAULT NULL COMMENT 'Certificate of Analysis (COA)',
  `coa_min` double DEFAULT NULL,
  `coa_max` double DEFAULT NULL,
  `coa_remark` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`sopqc_id`),
  CONSTRAINT `tbl_sopqc_detail_20230915_ibfk_1` FOREIGN KEY (`sopqc_id`) REFERENCES `tbl_sopqc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1723081 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_sopqc_detail_gravure` */

DROP TABLE IF EXISTS `tbl_sopqc_detail_gravure`;

CREATE TABLE `tbl_sopqc_detail_gravure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sopqc_id` int(11) unsigned NOT NULL,
  `work_center_id` int(11) DEFAULT NULL,
  `sopqc_template_id` int(11) NOT NULL,
  `coa_gravure_no` int(11) DEFAULT NULL,
  `coa_target` varchar(200) DEFAULT NULL COMMENT 'Certificate of Analysis (COA)',
  `coa_remark` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`sopqc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189949 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_sopqc_detail_multi` */

DROP TABLE IF EXISTS `tbl_sopqc_detail_multi`;

CREATE TABLE `tbl_sopqc_detail_multi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sopqc_id` int(11) unsigned NOT NULL,
  `work_center_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `sopqc_template_id` int(11) NOT NULL,
  `sopqc_multi_name` varchar(200) DEFAULT NULL,
  `is_lab` tinyint(1) DEFAULT 0,
  `coa_period` int(11) DEFAULT NULL,
  `coa_waiting_time` int(11) DEFAULT NULL,
  `coa_target` varchar(200) DEFAULT NULL COMMENT 'Certificate of Analysis (COA)',
  `coa_min` double DEFAULT NULL,
  `coa_max` double DEFAULT NULL,
  `coa_remark` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`sopqc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=324587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_sopqc_detail_pallet` */

DROP TABLE IF EXISTS `tbl_sopqc_detail_pallet`;

CREATE TABLE `tbl_sopqc_detail_pallet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sopqc_id` int(11) unsigned NOT NULL,
  `work_center_id` int(11) NOT NULL,
  `qty_in_box` varchar(100) DEFAULT NULL,
  `qty_in_box_unit` int(11) DEFAULT NULL,
  `box_in_pallet` varchar(100) DEFAULT NULL,
  `box_in_pallet_unit` int(11) DEFAULT NULL,
  `qty_in_pallet` varchar(100) DEFAULT NULL,
  `qty_in_pallet_unit` int(11) DEFAULT NULL,
  `joint_number` varchar(100) DEFAULT NULL,
  `pallet_sample` int(11) DEFAULT 0,
  `pallet_size` varchar(100) DEFAULT NULL,
  `pallet_type` int(11) DEFAULT NULL,
  `pallet_type_other` varchar(100) DEFAULT NULL,
  `pallet_remark` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`sopqc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87093 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_sopqc_notes` */

DROP TABLE IF EXISTS `tbl_sopqc_notes`;

CREATE TABLE `tbl_sopqc_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `sopqc_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_note` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16176 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_sopqc_template` */

DROP TABLE IF EXISTS `tbl_sopqc_template`;

CREATE TABLE `tbl_sopqc_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `work_center_id` int(11) unsigned NOT NULL,
  `unit_id` int(11) unsigned NOT NULL,
  `frequency_id` int(11) unsigned NOT NULL,
  `sopqc_template_name` varchar(200) DEFAULT NULL,
  `sopqc_template_name_us` varchar(200) DEFAULT NULL,
  `sopqc_template_target` varchar(200) DEFAULT NULL COMMENT 'Default Value',
  `display_order` float DEFAULT NULL,
  `is_lab` tinyint(1) DEFAULT 0 COMMENT '0=> QC, 1=>LAB',
  `hardcode_key` int(11) DEFAULT 0 COMMENT 'DDL HARDCODE',
  `input_type` int(11) DEFAULT 12 COMMENT 'DDL INPUT TYPE',
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`),
  KEY `tbl_sopqc_template_ibfk_1` (`work_center_id`),
  CONSTRAINT `tbl_sopqc_template_ibfk_1` FOREIGN KEY (`work_center_id`) REFERENCES `tbl_work_center` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_sopqc_template_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `tbl_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_sopqc_template_detail` */

DROP TABLE IF EXISTS `tbl_sopqc_template_detail`;

CREATE TABLE `tbl_sopqc_template_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sopqc_template_id` int(11) unsigned NOT NULL,
  `sopqc_template_detail_name` varchar(200) DEFAULT NULL,
  `sopqc_template_detail_name_us` varchar(200) DEFAULT NULL,
  `sopqc_template_detail_target` varchar(200) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_sopqc_template_detail_ibfk_1` (`sopqc_template_id`),
  CONSTRAINT `tbl_sopqc_template_detail_ibfk_1` FOREIGN KEY (`sopqc_template_id`) REFERENCES `tbl_sopqc_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result` */

DROP TABLE IF EXISTS `tbl_test_result`;

CREATE TABLE `tbl_test_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prod_schedule_id` int(11) unsigned DEFAULT NULL,
  `work_center_id` int(11) unsigned DEFAULT NULL,
  `machine_center_id` int(11) unsigned DEFAULT NULL COMMENT 'work_center_detail_id',
  `shift_id` int(11) unsigned DEFAULT NULL,
  `operator_no` varchar(100) DEFAULT NULL,
  `mfg_date` datetime DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27680 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_gravure` */

DROP TABLE IF EXISTS `tbl_test_result_gravure`;

CREATE TABLE `tbl_test_result_gravure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_id` int(11) unsigned NOT NULL,
  `gravure_detail_id` int(11) DEFAULT NULL,
  `gravure_number` int(11) unsigned DEFAULT NULL,
  `qcsp_number` varchar(200) DEFAULT NULL,
  `sop_remark` text DEFAULT NULL,
  `test_real` varchar(200) DEFAULT NULL,
  `test_value` varchar(200) DEFAULT NULL,
  `test_remark` text DEFAULT NULL,
  `test_by` int(11) DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sopqc_id` (`test_result_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30843 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_iopqc` */

DROP TABLE IF EXISTS `tbl_test_result_iopqc`;

CREATE TABLE `tbl_test_result_iopqc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_id` int(11) unsigned NOT NULL,
  `iopqc_template_id` int(11) NOT NULL,
  `iopqc_template_detail_id` int(11) DEFAULT NULL,
  `test_value` varchar(200) DEFAULT NULL,
  `test_remark` text DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_id`),
  CONSTRAINT `tbl_test_result_iopqc_ibfk_1` FOREIGN KEY (`test_result_id`) REFERENCES `tbl_test_result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=612519 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_lab` */

DROP TABLE IF EXISTS `tbl_test_result_lab`;

CREATE TABLE `tbl_test_result_lab` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_sopqc_id` int(11) unsigned NOT NULL,
  `job_jacket_number` varchar(50) DEFAULT NULL,
  `rq_date` datetime DEFAULT NULL,
  `rc_date` datetime DEFAULT NULL,
  `is_active` int(1) DEFAULT 0,
  `sum_info` varchar(200) DEFAULT '{"lab_total":0,"lab_active":0,"soplab":[],"otherlab":[]}',
  `recall_info` varchar(200) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `approval_by` int(11) DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_comment` text DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_sopqc_id`),
  CONSTRAINT `tbl_test_result_lab_ibfk_1` FOREIGN KEY (`test_result_sopqc_id`) REFERENCES `tbl_test_result_sopqc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65626 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_lab20230921` */

DROP TABLE IF EXISTS `tbl_test_result_lab20230921`;

CREATE TABLE `tbl_test_result_lab20230921` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_sopqc_id` int(11) unsigned NOT NULL,
  `job_jacket_number` varchar(50) DEFAULT NULL,
  `rq_date` datetime DEFAULT NULL,
  `rc_date` datetime DEFAULT NULL,
  `is_active` int(1) DEFAULT 0,
  `sum_info` varchar(200) DEFAULT '{"lab_total":0,"lab_active":0,"soplab":[],"otherlab":[]}',
  `recall_info` varchar(200) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `approval_by` int(11) DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_comment` text DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_sopqc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51469 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_lab_detail` */

DROP TABLE IF EXISTS `tbl_test_result_lab_detail`;

CREATE TABLE `tbl_test_result_lab_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_lab_id` int(11) unsigned NOT NULL,
  `sopqc_template_id` int(11) NOT NULL,
  `sopqc_template_detail_id` int(11) DEFAULT NULL,
  `test_line` int(11) DEFAULT 1,
  `test_value` varchar(200) DEFAULT NULL,
  `test_remark` text DEFAULT NULL,
  `test_time` datetime DEFAULT NULL,
  `test_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_lab_id`),
  CONSTRAINT `tbl_test_result_lab_detail_ibfk_1` FOREIGN KEY (`test_result_lab_id`) REFERENCES `tbl_test_result_lab` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1604272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_lab_detail_multi` */

DROP TABLE IF EXISTS `tbl_test_result_lab_detail_multi`;

CREATE TABLE `tbl_test_result_lab_detail_multi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_lab_id` int(11) unsigned NOT NULL,
  `sopqc_template_id` int(11) NOT NULL,
  `sopqc_detail_multi_id` int(11) DEFAULT NULL,
  `test_line` int(11) DEFAULT 1,
  `test_value` varchar(200) DEFAULT NULL,
  `test_remark` text DEFAULT NULL,
  `test_time` datetime DEFAULT NULL,
  `test_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=486227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_lab_history` */

DROP TABLE IF EXISTS `tbl_test_result_lab_history`;

CREATE TABLE `tbl_test_result_lab_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_lab_id` int(11) unsigned NOT NULL,
  `test_result_lab_sum_info` longtext DEFAULT NULL,
  `test_result_lab_detail` longtext DEFAULT NULL,
  `test_result_lab_detail_multi` longtext DEFAULT NULL,
  `test_result_lab_other_detail` longtext DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_lab_other_detail` */

DROP TABLE IF EXISTS `tbl_test_result_lab_other_detail`;

CREATE TABLE `tbl_test_result_lab_other_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_lab_id` int(11) unsigned DEFAULT NULL,
  `test_result_other_id` int(11) unsigned NOT NULL,
  `test_value` varchar(200) DEFAULT NULL,
  `test_remark` text DEFAULT NULL,
  `test_line` int(11) DEFAULT 1,
  `test_time` datetime DEFAULT NULL,
  `test_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_other_id`),
  KEY `test_result_sopid_id` (`test_result_lab_id`),
  CONSTRAINT `tbl_test_result_lab_other_detail_ibfk_1` FOREIGN KEY (`test_result_lab_id`) REFERENCES `tbl_test_result_lab` (`id`),
  CONSTRAINT `tbl_test_result_lab_other_detail_ibfk_2` FOREIGN KEY (`test_result_other_id`) REFERENCES `tbl_test_result_other` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7923 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_other` */

DROP TABLE IF EXISTS `tbl_test_result_other`;

CREATE TABLE `tbl_test_result_other` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_id` int(11) unsigned NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `is_lab` tinyint(1) DEFAULT 0,
  `sopqc_template_id` int(11) DEFAULT NULL,
  `sopqc_template_detail_id` int(11) DEFAULT NULL,
  `test_other_info` varchar(250) DEFAULT NULL,
  `test_other_name` varchar(250) NOT NULL,
  `test_other_name_remark` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_id`),
  CONSTRAINT `tbl_test_result_other_ibfk_1` FOREIGN KEY (`test_result_id`) REFERENCES `tbl_test_result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_other_detail` */

DROP TABLE IF EXISTS `tbl_test_result_other_detail`;

CREATE TABLE `tbl_test_result_other_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_sopid_id` int(11) unsigned DEFAULT NULL,
  `test_result_other_id` int(11) unsigned NOT NULL,
  `test_line` int(11) DEFAULT 1,
  `test_value` varchar(200) DEFAULT NULL,
  `test_remark` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_other_id`),
  KEY `test_result_sopid_id` (`test_result_sopid_id`),
  CONSTRAINT `tbl_test_result_other_detail_ibfk_1` FOREIGN KEY (`test_result_other_id`) REFERENCES `tbl_test_result_other` (`id`),
  CONSTRAINT `tbl_test_result_other_detail_ibfk_2` FOREIGN KEY (`test_result_sopid_id`) REFERENCES `tbl_test_result_sopqc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2782 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_pallet` */

DROP TABLE IF EXISTS `tbl_test_result_pallet`;

CREATE TABLE `tbl_test_result_pallet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prod_schedule_id` int(11) unsigned DEFAULT NULL,
  `work_center_id` int(11) unsigned DEFAULT NULL,
  `trace_id` varchar(100) DEFAULT NULL COMMENT 'work_center_detail_id',
  `check_time` datetime DEFAULT NULL,
  `qty_in_box` varchar(100) DEFAULT NULL,
  `box_in_pallet` varchar(100) DEFAULT NULL,
  `qty_in_pallet` varchar(100) DEFAULT NULL,
  `joint_number` varchar(100) DEFAULT NULL,
  `pallet_sample` varchar(100) DEFAULT NULL,
  `pallet_size` varchar(100) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_sopqc` */

DROP TABLE IF EXISTS `tbl_test_result_sopqc`;

CREATE TABLE `tbl_test_result_sopqc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_id` int(11) unsigned NOT NULL,
  `trace_id` varchar(200) DEFAULT NULL,
  `test_result_setnum` varchar(200) DEFAULT NULL,
  `test_result_time` datetime DEFAULT NULL,
  `test_result_round` int(11) DEFAULT 30,
  `test_result_status` int(11) DEFAULT 20,
  `test_result_sample` int(11) DEFAULT 25,
  `test_result_remark` text DEFAULT NULL,
  `lab_sum_info` varchar(200) DEFAULT NULL,
  `lab_sum_note` text DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `is_waiting` int(11) DEFAULT 0,
  `waiting_by` int(11) DEFAULT NULL,
  `waiting_date` datetime DEFAULT NULL,
  `waiting_note` text DEFAULT NULL,
  `result_final` int(11) DEFAULT 0,
  `result_final_by` int(11) DEFAULT NULL,
  `result_final_date` datetime DEFAULT NULL,
  `result_final_note` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_id`),
  CONSTRAINT `tbl_test_result_sopqc_ibfk_1` FOREIGN KEY (`test_result_id`) REFERENCES `tbl_test_result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_sopqc_detail` */

DROP TABLE IF EXISTS `tbl_test_result_sopqc_detail`;

CREATE TABLE `tbl_test_result_sopqc_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_sopqc_id` int(11) unsigned NOT NULL,
  `sopqc_template_id` int(11) NOT NULL,
  `sopqc_template_detail_id` int(11) DEFAULT NULL,
  `test_line` int(11) DEFAULT 1,
  `test_value` varchar(200) DEFAULT NULL,
  `test_remark` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_sopqc_id`),
  CONSTRAINT `tbl_test_result_sopqc_detail_ibfk_1` FOREIGN KEY (`test_result_sopqc_id`) REFERENCES `tbl_test_result_sopqc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2907732 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_test_result_sopqc_detail_multi` */

DROP TABLE IF EXISTS `tbl_test_result_sopqc_detail_multi`;

CREATE TABLE `tbl_test_result_sopqc_detail_multi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_result_sopqc_id` int(11) unsigned NOT NULL,
  `sopqc_template_id` int(11) NOT NULL,
  `sopqc_detail_multi_id` int(11) DEFAULT NULL,
  `test_line` int(11) DEFAULT 1,
  `test_value` varchar(200) DEFAULT NULL,
  `test_remark` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sopqc_id` (`test_result_sopqc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=376014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_unit` */

DROP TABLE IF EXISTS `tbl_unit`;

CREATE TABLE `tbl_unit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_key` varchar(50) DEFAULT NULL,
  `column_hide` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_work_center` */

DROP TABLE IF EXISTS `tbl_work_center`;

CREATE TABLE `tbl_work_center` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `work_center_code` varchar(20) NOT NULL DEFAULT '',
  `work_center_name` varchar(50) NOT NULL DEFAULT '',
  `work_center_name_us` varchar(50) NOT NULL DEFAULT '',
  `display_order` float NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `work_center_remark` text DEFAULT NULL,
  `work_center_remark_us` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_work_center_detail` */

DROP TABLE IF EXISTS `tbl_work_center_detail`;

CREATE TABLE `tbl_work_center_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `work_center_id` int(11) unsigned DEFAULT NULL,
  `machine_code` varchar(10) DEFAULT NULL,
  `machine_name` varchar(50) DEFAULT NULL,
  `machine_name_us` varchar(50) DEFAULT NULL,
  `display_order` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `work_center_id` (`work_center_id`),
  CONSTRAINT `tbl_work_center_detail_ibfk_1` FOREIGN KEY (`work_center_id`) REFERENCES `tbl_work_center` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `tbl_working_shifts` */

DROP TABLE IF EXISTS `tbl_working_shifts`;

CREATE TABLE `tbl_working_shifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_code` int(11) DEFAULT NULL,
  `description` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shift_start_time` varchar(10) DEFAULT NULL,
  `shift_end_time` varchar(10) DEFAULT NULL,
  `plan_code` varchar(10) DEFAULT 'SL',
  `status` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
