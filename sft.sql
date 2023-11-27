/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.4.17-MariaDB-log : Database - apiv2_apisft
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`apiv2_apisft` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `apiv2_apisft`;

/*Table structure for table `federated_fgs_ddl` */

DROP TABLE IF EXISTS `federated_fgs_ddl`;

CREATE TABLE `federated_fgs_ddl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `is_exclude` tinyint(1) DEFAULT 0,
  `order` float DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CONNECTION='mysql://federated:apidb2015@192.168.5.121/apiv2_apifgsgr/tbl_drop_down_list';

/*Table structure for table `ps_activity` */

DROP TABLE IF EXISTS `ps_activity`;

CREATE TABLE `ps_activity` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1904049 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_boxed` */

DROP TABLE IF EXISTS `ps_boxed`;

CREATE TABLE `ps_boxed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_trace_id` bigint(20) DEFAULT NULL,
  `input_trace_id` bigint(20) DEFAULT NULL,
  `box_status` tinyint(1) DEFAULT 0 COMMENT '0 is Opened, 1 is Released',
  `date_time` datetime DEFAULT NULL,
  `sft_message_id` bigint(20) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `job_rework_id` int(11) DEFAULT NULL,
  `box_created_date` datetime DEFAULT NULL,
  `box_deleted` tinyint(1) DEFAULT 0 COMMENT 'check if the license pallet has been deleted',
  `box_deleted_by` varchar(10) DEFAULT NULL,
  `box_deleted_date` datetime DEFAULT NULL,
  `prod_order_no` varchar(10) DEFAULT NULL,
  `work_center_code` varchar(15) DEFAULT NULL,
  `machine_center_code` varchar(15) DEFAULT NULL,
  `is_pending_box` tinyint(1) DEFAULT 0,
  `rework_ticket` varchar(50) DEFAULT NULL,
  `is_printed` tinyint(2) DEFAULT 0,
  `gross_weight` decimal(18,1) DEFAULT NULL,
  `net_weight` decimal(18,1) DEFAULT NULL,
  `lane_no` tinyint(10) DEFAULT 0,
  `set_no` tinyint(10) DEFAULT 0,
  `shift` varchar(50) DEFAULT NULL,
  `joins_no` tinyint(10) DEFAULT 0,
  `constituent` varchar(500) DEFAULT NULL,
  `dimension` varchar(500) DEFAULT NULL,
  `thickness` varchar(500) DEFAULT NULL,
  `box_total_rolls` double DEFAULT 0,
  `box_weight` decimal(18,2) DEFAULT NULL,
  `box_date` date DEFAULT NULL,
  `box_label_date` date DEFAULT NULL,
  `HSD` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `job_output` (`job_id`),
  KEY `box_trace_id` (`box_trace_id`),
  KEY `box_status` (`box_status`)
) ENGINE=InnoDB AUTO_INCREMENT=832822 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_boxed_trace_id` */

DROP TABLE IF EXISTS `ps_boxed_trace_id`;

CREATE TABLE `ps_boxed_trace_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `box_id` int(11) DEFAULT NULL,
  `out_put_id` int(11) DEFAULT NULL,
  `out_put_trace_id` varchar(500) DEFAULT NULL,
  `add_date_time` datetime DEFAULT NULL,
  `is_deleted` int(2) DEFAULT 0,
  `deleted_by` varchar(10) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_output` (`box_id`,`out_put_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1173641 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_constituent` */

DROP TABLE IF EXISTS `ps_constituent`;

CREATE TABLE `ps_constituent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structure` varchar(500) DEFAULT NULL,
  `colorful` varchar(500) DEFAULT NULL,
  `no_color` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_error_stage` */

DROP TABLE IF EXISTS `ps_error_stage`;

CREATE TABLE `ps_error_stage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `in_put_id_old` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `reason_id` int(11) DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `error_note` varchar(500) DEFAULT NULL,
  `error_location_from` decimal(18,4) DEFAULT 0.0000,
  `error_location_to` decimal(18,4) DEFAULT 0.0000,
  `error_created_by` varchar(200) DEFAULT NULL,
  `error_created_date` datetime DEFAULT NULL,
  `error_is_deleted` int(1) DEFAULT 0,
  `error_is_printed` int(2) DEFAULT 0,
  `error_is_reprinted` int(2) DEFAULT 0,
  `error_shift` varchar(20) DEFAULT NULL,
  `error_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `error_comment` text DEFAULT NULL,
  `lane` text DEFAULT NULL,
  `error_is_delete_date` datetime DEFAULT NULL,
  `error_is_delete_by` varchar(20) DEFAULT NULL,
  `out_id` int(20) DEFAULT NULL,
  `total_scrap` double DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `defect_size` decimal(18,2) DEFAULT NULL,
  `no_of_flags` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_out_id` (`out_id`)
) ENGINE=MyISAM AUTO_INCREMENT=96459 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_extrusion_hopper` */

DROP TABLE IF EXISTS `ps_extrusion_hopper`;

CREATE TABLE `ps_extrusion_hopper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hopper_code` varchar(20) DEFAULT NULL,
  `hooper_name` text DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `display_other` int(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_extrusion_pipe` */

DROP TABLE IF EXISTS `ps_extrusion_pipe`;

CREATE TABLE `ps_extrusion_pipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pipe_code` varchar(20) DEFAULT NULL,
  `pipe_name` text DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `display_other` int(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_extrusion_scrap_stage` */

DROP TABLE IF EXISTS `ps_extrusion_scrap_stage`;

CREATE TABLE `ps_extrusion_scrap_stage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `reason_code` varchar(50) DEFAULT NULL COMMENT 'table ps_stage_reason',
  `reason_mbg_id` int(11) DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `type_scrap_id` int(11) DEFAULT NULL,
  `scrap_product_code` varchar(50) DEFAULT NULL,
  `scrap_reason_rework` text DEFAULT NULL,
  `scrap_note` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `scrap_trace_id` varchar(20) DEFAULT NULL,
  `scrap_width` decimal(18,4) DEFAULT NULL,
  `net_weight` decimal(18,4) DEFAULT 0.0000,
  `unit_weight` varchar(50) DEFAULT 'KG',
  `net_meter` decimal(18,4) DEFAULT 0.0000,
  `unit_meter` varchar(50) DEFAULT 'M',
  `scrap_created_by` varchar(200) DEFAULT NULL,
  `scrap_created_date` datetime DEFAULT NULL,
  `scrap_is_deleted` int(1) DEFAULT 0,
  `scrap_deleted_by` varchar(10) DEFAULT NULL,
  `scrap_deleted_date` datetime DEFAULT NULL,
  `scrap_is_printed` tinyint(2) DEFAULT 0,
  `scrap_is_reprinted` tinyint(2) DEFAULT 0,
  `scrap_shift` varchar(20) DEFAULT NULL,
  `scrap_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `scrap_weight` decimal(18,4) DEFAULT NULL,
  `scrap_material_id` int(1) DEFAULT 0,
  `scrap_material_redisual_id` int(1) DEFAULT 0,
  `id_error` bigint(20) DEFAULT NULL,
  `scrap_material` int(1) DEFAULT 0,
  `scrap_setup_process_material` varchar(50) DEFAULT NULL,
  `scrap_for_product_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job_output` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32070 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_extrusion_scrap_stage_details` */

DROP TABLE IF EXISTS `ps_extrusion_scrap_stage_details`;

CREATE TABLE `ps_extrusion_scrap_stage_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `scrap_id` bigint(20) DEFAULT NULL,
  `scrap_material_code` varchar(50) DEFAULT NULL,
  `scrap_ratio` decimal(18,4) DEFAULT 0.0000,
  `scrap_note` varchar(500) DEFAULT NULL,
  `net_weight` decimal(18,1) DEFAULT 0.0,
  `unit_weight` varchar(50) DEFAULT 'KG',
  `scrap_created_by` varchar(200) DEFAULT NULL,
  `scrap_created_date` datetime DEFAULT NULL,
  `scrap_is_deleted` int(1) DEFAULT 0,
  `scrap_deleted_by` varchar(10) DEFAULT NULL,
  `scrap_deleted_date` datetime DEFAULT NULL,
  `scrap_shift` varchar(20) DEFAULT NULL,
  `scrap_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24769 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_extrusion_tank` */

DROP TABLE IF EXISTS `ps_extrusion_tank`;

CREATE TABLE `ps_extrusion_tank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tank_code` varchar(20) DEFAULT NULL,
  `tank_name` text DEFAULT NULL,
  `is_active` int(1) DEFAULT 1,
  `display_other` int(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_extrusion_type_scrap` */

DROP TABLE IF EXISTS `ps_extrusion_type_scrap`;

CREATE TABLE `ps_extrusion_type_scrap` (
  `type_scrap_id` int(11) NOT NULL AUTO_INCREMENT,
  `in_product_code` varchar(200) DEFAULT NULL,
  `type_name` varchar(200) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `qcsp_number` varchar(200) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 0 COMMENT '0 la Ẩn, 1 Là Hiện',
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_scrap_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `ps_gen_traceid` */

DROP TABLE IF EXISTS `ps_gen_traceid`;

CREATE TABLE `ps_gen_traceid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `year_no` int(4) DEFAULT NULL,
  `month_no` int(2) DEFAULT NULL,
  `current_no` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_gen_traceid_history` */

DROP TABLE IF EXISTS `ps_gen_traceid_history`;

CREATE TABLE `ps_gen_traceid_history` (
  `trace_id` bigint(20) NOT NULL DEFAULT 0,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`trace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_input_adhesive` */

DROP TABLE IF EXISTS `ps_input_adhesive`;

CREATE TABLE `ps_input_adhesive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `general_id` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `glue_name` varchar(200) DEFAULT NULL,
  `glue_type` int(11) DEFAULT NULL COMMENT '1: keo, 2: đóng rắn, 3: dung môi',
  `glue_lot_no` varchar(50) DEFAULT NULL,
  `glue_quantity` float(18,4) DEFAULT NULL,
  `glue_spec_ratio` varchar(50) DEFAULT NULL,
  `glue_mixing_ratio` float(18,4) DEFAULT NULL,
  `glue_notes` varchar(200) DEFAULT NULL,
  `glue_is_deleted` int(11) DEFAULT 0,
  `glue_deleted_by` int(11) DEFAULT 0,
  `glue_deleted_date` datetime DEFAULT NULL,
  `glue_date_created` datetime DEFAULT NULL,
  `glue_created_by` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41300 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_input_adhesive_general` */

DROP TABLE IF EXISTS `ps_input_adhesive_general`;

CREATE TABLE `ps_input_adhesive_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `trace_id` varchar(50) DEFAULT NULL,
  `glue_no_of_mixing` int(11) DEFAULT NULL,
  `glue_mixing_time` datetime DEFAULT NULL,
  `glue_mixing_user` int(11) DEFAULT NULL,
  `viscosity` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0: chưa sử dụng, 1: đã sử dụng',
  `notes` varchar(200) DEFAULT NULL,
  `shift` varchar(3) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `machine_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15560 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_add_traceid_rework` */

DROP TABLE IF EXISTS `ps_job_add_traceid_rework`;

CREATE TABLE `ps_job_add_traceid_rework` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `job_no` varchar(50) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `out_id` bigint(20) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `out_width` decimal(18,4) DEFAULT NULL,
  `out_quantity` decimal(18,4) DEFAULT NULL,
  `out_set_no` tinyint(2) DEFAULT NULL,
  `out_lane_no` tinyint(2) DEFAULT NULL,
  `add_machine_code` varchar(20) DEFAULT NULL,
  `add_created_by` varchar(200) DEFAULT NULL,
  `add_created_date` datetime DEFAULT NULL,
  `add_is_deleted` int(1) DEFAULT 0,
  `add_deleted_by` varchar(10) DEFAULT NULL,
  `add_deleted_date` datetime DEFAULT NULL,
  `add_shift` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95104 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_add_traceid_rework_extrusion` */

DROP TABLE IF EXISTS `ps_job_add_traceid_rework_extrusion`;

CREATE TABLE `ps_job_add_traceid_rework_extrusion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `job_no` varchar(50) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `out_id` bigint(20) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `out_width` decimal(18,4) DEFAULT NULL,
  `out_quantity` decimal(18,4) DEFAULT NULL,
  `out_set_no` tinyint(2) DEFAULT NULL,
  `out_lane_no` tinyint(2) DEFAULT NULL,
  `add_machine_code` varchar(20) DEFAULT NULL,
  `add_created_by` varchar(200) DEFAULT NULL,
  `add_created_date` datetime DEFAULT NULL,
  `add_is_deleted` int(1) DEFAULT 0,
  `add_deleted_by` varchar(10) DEFAULT NULL,
  `add_deleted_date` datetime DEFAULT NULL,
  `add_shift` varchar(500) DEFAULT NULL,
  `type_machine` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47062 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ps_job_add_traceid_rework_pouching` */

DROP TABLE IF EXISTS `ps_job_add_traceid_rework_pouching`;

CREATE TABLE `ps_job_add_traceid_rework_pouching` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `job_no` varchar(50) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `out_id` bigint(20) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `out_width` decimal(18,4) DEFAULT NULL,
  `out_quantity` decimal(18,4) DEFAULT NULL,
  `out_set_no` tinyint(2) DEFAULT NULL,
  `out_line_no` tinyint(2) DEFAULT NULL,
  `add_machine_code` varchar(20) DEFAULT NULL,
  `add_created_by` varchar(200) DEFAULT NULL,
  `add_created_date` datetime DEFAULT NULL,
  `add_is_deleted` int(1) DEFAULT 0,
  `add_deleted_by` varchar(10) DEFAULT NULL,
  `add_deleted_date` datetime DEFAULT NULL,
  `add_shift` varchar(500) DEFAULT NULL,
  `out_producer` varchar(200) DEFAULT NULL,
  `out_box_no` int(10) DEFAULT NULL,
  `out_box_type` tinyint(2) DEFAULT NULL COMMENT '0 is target box; 1 is source box',
  `out_gross_weight` decimal(18,4) DEFAULT NULL,
  `out_net_weight` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_outtrace_op_rw` (`out_trace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21762 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_his_roll_rework` */

DROP TABLE IF EXISTS `ps_job_his_roll_rework`;

CREATE TABLE `ps_job_his_roll_rework` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `old_id` bigint(20) DEFAULT NULL,
  `old_trace_id` varchar(20) DEFAULT NULL,
  `new_id` bigint(20) DEFAULT NULL,
  `new_trace_id` varchar(20) DEFAULT NULL,
  `rw_id` bigint(20) DEFAULT NULL COMMENT 'id of table ps_job_rework',
  `his_rework_type` varchar(50) DEFAULT NULL,
  `his_created_by` varchar(200) DEFAULT NULL,
  `his_created_date` datetime DEFAULT NULL,
  `his_is_deleted` int(1) DEFAULT 0,
  `his_deleted_by` varchar(10) DEFAULT NULL,
  `his_deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79305 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input` */

DROP TABLE IF EXISTS `ps_job_input`;

CREATE TABLE `ps_job_input` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) NOT NULL,
  `in_product_code` varchar(50) DEFAULT NULL,
  `in_description` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `in_join` int(2) DEFAULT 0,
  `in_sub_trace_id` varchar(500) DEFAULT NULL,
  `in_width` decimal(18,4) DEFAULT NULL,
  `in_quantity` decimal(18,4) DEFAULT NULL,
  `in_quantity_real` decimal(18,4) DEFAULT NULL,
  `in_quantity_used` decimal(18,4) DEFAULT NULL,
  `ghep_in_weight` decimal(18,4) DEFAULT NULL,
  `ghep_ky` int(11) DEFAULT NULL,
  `ghep_option` int(11) DEFAULT NULL,
  `ghep_option_value` int(11) DEFAULT NULL,
  `in_uom` varchar(50) DEFAULT NULL,
  `in_created_by` varchar(10) DEFAULT NULL,
  `in_created_date` datetime DEFAULT NULL,
  `in_is_deleted` int(1) DEFAULT 0,
  `in_deleted_by` varchar(10) DEFAULT NULL,
  `in_deleted_date` datetime DEFAULT NULL,
  `in_set_no` tinyint(10) DEFAULT 0,
  `in_shift` varchar(500) DEFAULT NULL,
  `in_date` date DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `receive_shift` varchar(50) DEFAULT NULL,
  `receive_quantity` decimal(18,4) DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `stage` varchar(50) DEFAULT NULL,
  `reason_name_inspection` text DEFAULT NULL,
  `material_supplier` varchar(100) DEFAULT NULL,
  `material_supplier_lot` varchar(100) DEFAULT NULL,
  `material_manufacturer` varchar(200) DEFAULT NULL,
  `in_product_name` text DEFAULT NULL,
  `in_roll_no` varchar(50) DEFAULT NULL,
  `material_specification` text DEFAULT NULL,
  `is_process` int(11) DEFAULT 0 COMMENT '1: Trong Process 2: Ngoai Process',
  PRIMARY KEY (`id`),
  KEY `job_input` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162380 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_component` */

DROP TABLE IF EXISTS `ps_job_input_component`;

CREATE TABLE `ps_job_input_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT 0,
  `component_type` varchar(100) DEFAULT NULL,
  `component_input_id` bigint(20) NOT NULL,
  `component_material_code` varchar(50) DEFAULT NULL,
  `component_description` varchar(500) DEFAULT NULL,
  `component_width` int(11) DEFAULT NULL,
  `component_quantity` decimal(18,4) DEFAULT NULL,
  `component_join` int(2) DEFAULT 0,
  `component_uom` varchar(50) DEFAULT NULL,
  `component_supplier` varchar(500) DEFAULT NULL,
  `component_supplier_lot` varchar(50) DEFAULT NULL,
  `component_is_deleted` int(1) DEFAULT 0,
  `component_shift` varchar(200) DEFAULT NULL,
  `component_date_created` datetime DEFAULT NULL,
  `component_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_diluted_ink` */

DROP TABLE IF EXISTS `ps_job_input_diluted_ink`;

CREATE TABLE `ps_job_input_diluted_ink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `ink_color` varchar(50) DEFAULT NULL,
  `ink_harderner` int(1) DEFAULT NULL,
  `ink_transfer_job` int(1) DEFAULT 0,
  `ink_job_no` varchar(50) DEFAULT NULL,
  `ink_inventory_weight` decimal(18,4) DEFAULT 0.0000,
  `ink_receive_weight` decimal(18,4) DEFAULT NULL,
  `ink_used_weight` decimal(18,4) DEFAULT NULL,
  `ink_notes` varchar(200) DEFAULT NULL,
  `ink_is_deleted` tinyint(1) DEFAULT 0,
  `ink_deleted_by` int(11) DEFAULT NULL,
  `ink_deleted_date` datetime DEFAULT NULL,
  `ink_shift` varchar(3) DEFAULT NULL,
  `ink_created_date` datetime DEFAULT NULL,
  `ink_created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28186 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_glue` */

DROP TABLE IF EXISTS `ps_job_input_glue`;

CREATE TABLE `ps_job_input_glue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL DEFAULT 0,
  `glue_general_id` int(11) DEFAULT NULL,
  `glue_code` varchar(50) DEFAULT NULL,
  `glue_name` varchar(200) DEFAULT NULL,
  `glue_type` int(11) DEFAULT NULL COMMENT '1: keo, 2: đóng rắn, 3: dung môi',
  `glue_lot_no` varchar(50) DEFAULT NULL,
  `glue_quantity` float(18,4) DEFAULT NULL,
  `glue_spec_ratio` varchar(50) DEFAULT NULL,
  `glue_mixing_ratio` float(18,4) DEFAULT NULL,
  `glue_notes` varchar(200) DEFAULT NULL,
  `glue_is_deleted` int(11) DEFAULT 0,
  `glue_deleted_by` int(11) DEFAULT NULL,
  `glue_deleted_date` datetime DEFAULT NULL,
  `glue_shift` varchar(50) DEFAULT NULL,
  `glue_date_created` datetime DEFAULT NULL,
  `glue_created_by` int(11) DEFAULT NULL,
  `glue_date` datetime DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `receive_shift` varchar(50) DEFAULT NULL,
  `receive_quantity` float(18,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57002 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_glue_general` */

DROP TABLE IF EXISTS `ps_job_input_glue_general`;

CREATE TABLE `ps_job_input_glue_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL DEFAULT 0,
  `glue_category` int(11) NOT NULL DEFAULT 0,
  `glue_trace_id` varchar(50) DEFAULT NULL,
  `ghep_ky` int(11) DEFAULT NULL,
  `glue_purpose` int(11) DEFAULT 0 COMMENT '1: Châm thêm 2: Vệ sinh',
  `glue_mixing_time` datetime DEFAULT NULL,
  `viscosity` int(11) DEFAULT NULL,
  `glue_no_of_mixing` int(11) DEFAULT NULL,
  `glue_mixing_user` int(11) DEFAULT NULL,
  `glue_used_time` timestamp NULL DEFAULT NULL,
  `job_status` int(11) DEFAULT NULL COMMENT '1: nhan chuyen job',
  `receive_job_id` int(11) DEFAULT NULL,
  `shift` varchar(50) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `receive_shift` varchar(50) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `receive_quantity` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21280 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_glue_recipe` */

DROP TABLE IF EXISTS `ps_job_input_glue_recipe`;

CREATE TABLE `ps_job_input_glue_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `glue_recipe_category` int(11) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `glue_type` int(11) DEFAULT NULL COMMENT 'Phân loại: 1:Keo,2:Đóng rắn,3:Dung môi',
  `name_of_chemical` varchar(200) DEFAULT NULL COMMENT 'Tên hóa chất',
  `standard_phase_ratio` varchar(50) DEFAULT NULL COMMENT 'Tỷ lệ pha tiêu chuẩn',
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_glue_recipe_categories` */

DROP TABLE IF EXISTS `ps_job_input_glue_recipe_categories`;

CREATE TABLE `ps_job_input_glue_recipe_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_type` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `solid_content` varchar(50) DEFAULT NULL COMMENT 'Hàm lượng rắn (%)',
  `viscosity_standard` varchar(50) DEFAULT NULL COMMENT 'Độ nhớt (s) tiêu chuẩn',
  `viscosity_min` int(11) DEFAULT NULL,
  `viscosity_max` int(11) DEFAULT NULL,
  `time_use_mixing_glue` int(11) DEFAULT NULL COMMENT 'Thời gian sử dụng mẻ keo sau khi pha (giờ)',
  `is_deleted` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_glue_return` */

DROP TABLE IF EXISTS `ps_job_input_glue_return`;

CREATE TABLE `ps_job_input_glue_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_category_id` int(11) NOT NULL DEFAULT 0,
  `job_id` int(11) DEFAULT NULL,
  `return_glue_id` int(11) DEFAULT NULL,
  `return_period` int(11) DEFAULT NULL,
  `return_type` int(11) DEFAULT NULL,
  `return_quantity_redisual` decimal(18,4) DEFAULT NULL,
  `return_notes` varchar(200) DEFAULT NULL,
  `return_shift` varchar(50) DEFAULT NULL,
  `return_created_by` int(11) DEFAULT NULL,
  `return_created_date` datetime DEFAULT NULL,
  `return_is_deleted` int(1) NOT NULL DEFAULT 0,
  `return_deleted_by` int(1) DEFAULT NULL,
  `return_deleted_date` datetime DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_is_receive` int(11) DEFAULT NULL,
  `return_date_receive` datetime DEFAULT NULL,
  `return_receive_shift` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21638 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_glue_return_categories` */

DROP TABLE IF EXISTS `ps_job_input_glue_return_categories`;

CREATE TABLE `ps_job_input_glue_return_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL DEFAULT 0,
  `glue_category` int(11) NOT NULL DEFAULT 0,
  `glue_trace_id` varchar(50) DEFAULT NULL,
  `return_trace_id` varchar(50) DEFAULT NULL,
  `return_type` int(11) DEFAULT NULL,
  `is_received` int(11) NOT NULL DEFAULT 0,
  `ghep_ky` int(11) DEFAULT NULL,
  `glue_mixing_time` datetime DEFAULT NULL,
  `viscosity` int(11) DEFAULT NULL,
  `glue_no_of_mixing` int(11) DEFAULT NULL,
  `glue_mixing_user` int(11) DEFAULT NULL,
  `shift` varchar(50) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `receive_shift` varchar(50) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7990 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_gravue_printing` */

DROP TABLE IF EXISTS `ps_job_input_gravue_printing`;

CREATE TABLE `ps_job_input_gravue_printing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `gravue_code` varchar(50) DEFAULT NULL,
  `gravue_name` varchar(200) DEFAULT NULL,
  `gravue_qcsp` varchar(10) DEFAULT NULL,
  `gravue_preventive` int(1) DEFAULT 0,
  `gravue_position` int(11) DEFAULT NULL,
  `gravue_reuse` int(1) NOT NULL DEFAULT 0,
  `gravue_test` int(1) NOT NULL DEFAULT 0,
  `gravue_staff_code` varchar(5) DEFAULT NULL,
  `gravue_out_quantity` float(18,4) DEFAULT 0.0000,
  `gravue_reason` varchar(200) DEFAULT NULL,
  `gravue_is_deleted` int(11) NOT NULL DEFAULT 0,
  `gravue_deleted_date` datetime DEFAULT NULL,
  `gravue_deleted_by` int(11) DEFAULT NULL,
  `gravue_created_by` int(11) DEFAULT NULL,
  `gravue_created_date` datetime DEFAULT NULL,
  `gravue_shift` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16749 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_ink` */

DROP TABLE IF EXISTS `ps_job_input_ink`;

CREATE TABLE `ps_job_input_ink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `ink_code` varchar(50) DEFAULT NULL,
  `ink_name` varchar(200) DEFAULT NULL,
  `ink_suplier_name` varchar(200) DEFAULT NULL,
  `ink_suplier_lot` varchar(100) DEFAULT NULL,
  `ink_inventory_weight` decimal(18,4) DEFAULT 0.0000,
  `ink_receive_weight` decimal(18,4) DEFAULT NULL,
  `ink_used_weight` decimal(18,4) DEFAULT NULL,
  `ink_boom` int(1) DEFAULT NULL,
  `ink_notes` varchar(200) DEFAULT NULL,
  `ink_is_deleted` tinyint(1) DEFAULT 0,
  `ink_deleted_by` int(11) DEFAULT NULL,
  `ink_deleted_date` datetime DEFAULT NULL,
  `ink_shift` varchar(3) DEFAULT NULL,
  `ink_created_date` datetime DEFAULT NULL,
  `ink_created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25873 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_ink_details` */

DROP TABLE IF EXISTS `ps_job_input_ink_details`;

CREATE TABLE `ps_job_input_ink_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `ink_id` int(11) DEFAULT NULL,
  `ink_inventory_weight` decimal(18,4) DEFAULT NULL,
  `ink_receive_weight` decimal(18,4) DEFAULT NULL,
  `ink_used_weight` decimal(18,4) DEFAULT NULL,
  `ink_notes` varchar(200) DEFAULT NULL,
  `ink_shift` varchar(3) DEFAULT NULL,
  `ink_is_deleted` int(11) NOT NULL DEFAULT 0,
  `ink_deleted_by` int(11) DEFAULT NULL,
  `ink_deleted_date` datetime DEFAULT NULL,
  `ink_created_by` int(11) DEFAULT NULL,
  `ink_created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_material` */

DROP TABLE IF EXISTS `ps_job_input_material`;

CREATE TABLE `ps_job_input_material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT 0,
  `material_trace_id` bigint(20) DEFAULT NULL,
  `material_type` int(11) DEFAULT 0,
  `material_parent_order` int(11) DEFAULT 0,
  `material_input_id` bigint(20) DEFAULT NULL,
  `material_parent_id` bigint(20) DEFAULT NULL,
  `material_code` varchar(50) DEFAULT NULL,
  `material_description` varchar(500) DEFAULT NULL,
  `material_roll_no` varchar(50) DEFAULT NULL,
  `material_width` int(11) DEFAULT NULL,
  `material_quantity` decimal(18,4) DEFAULT NULL,
  `material_quantity_real` decimal(18,4) NOT NULL DEFAULT 0.0000,
  `material_quantity_used` decimal(18,4) NOT NULL DEFAULT 0.0000,
  `material_gross_weight` decimal(18,4) DEFAULT NULL,
  `material_net_weight` decimal(18,4) DEFAULT NULL,
  `material_join` int(2) DEFAULT 0,
  `material_uom` varchar(50) DEFAULT NULL,
  `material_supplier` varchar(500) DEFAULT NULL,
  `material_supplier_lot` varchar(100) NOT NULL DEFAULT 'ACCA',
  `material_is_deleted` int(1) DEFAULT 0,
  `material_deleted_by` int(11) DEFAULT NULL,
  `material_deleted_date` datetime DEFAULT NULL,
  `material_shift` varchar(200) DEFAULT NULL,
  `material_created_by` int(11) DEFAULT NULL,
  `material_date_created` datetime DEFAULT NULL,
  `material_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187907 DEFAULT CHARSET=utf8 COMMENT='2350021305';

/*Table structure for table `ps_job_input_material_details_pouching` */

DROP TABLE IF EXISTS `ps_job_input_material_details_pouching`;

CREATE TABLE `ps_job_input_material_details_pouching` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT 0,
  `material_details_type` varchar(100) DEFAULT NULL,
  `material_details_material_id` bigint(20) DEFAULT NULL,
  `material_details_description` text DEFAULT NULL,
  `material_details_quantity` decimal(18,4) DEFAULT NULL,
  `material_details_supplier` varchar(500) DEFAULT NULL,
  `material_details_supplier_lot` varchar(50) DEFAULT NULL,
  `material_details_is_deleted` int(1) DEFAULT 0,
  `material_details_deleted_by` varchar(20) DEFAULT NULL,
  `material_details_deleted_date` datetime DEFAULT NULL,
  `material_details_shift` varchar(200) DEFAULT NULL,
  `material_details_date_created` datetime DEFAULT NULL,
  `material_details_created_by` varchar(20) DEFAULT NULL,
  `material_details_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21035 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_material_extrusion` */

DROP TABLE IF EXISTS `ps_job_input_material_extrusion`;

CREATE TABLE `ps_job_input_material_extrusion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT 0,
  `material_type` varchar(100) DEFAULT NULL,
  `material_code` varchar(50) DEFAULT NULL,
  `material_name` text DEFAULT NULL,
  `material_combined` text DEFAULT NULL,
  `material_traceid` varchar(20) DEFAULT NULL,
  `material_traceid_combined` text DEFAULT NULL,
  `material_description` varchar(500) DEFAULT NULL,
  `material_width` int(11) DEFAULT NULL,
  `material_quantity` decimal(18,4) DEFAULT NULL,
  `material_uom` varchar(50) DEFAULT NULL,
  `material_supplier` varchar(500) DEFAULT NULL,
  `material_supplier_lot` varchar(50) DEFAULT NULL,
  `material_is_deleted` int(1) DEFAULT 0,
  `material_deleted_by` varchar(20) DEFAULT NULL,
  `material_deleted_date` datetime DEFAULT NULL,
  `material_shift` varchar(200) DEFAULT NULL,
  `material_date_created` datetime DEFAULT NULL,
  `material_created_by` varchar(20) DEFAULT NULL,
  `material_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14210 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_material_la` */

DROP TABLE IF EXISTS `ps_job_input_material_la`;

CREATE TABLE `ps_job_input_material_la` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT 0,
  `material_input_id` bigint(20) NOT NULL,
  `material_parent_order` bigint(20) NOT NULL,
  `material_id` bigint(20) NOT NULL,
  `material_type` int(11) NOT NULL DEFAULT 0,
  `material_quantity` decimal(18,4) DEFAULT NULL,
  `material_quantity_real` decimal(18,4) NOT NULL DEFAULT 0.0000,
  `material_quantity_used` decimal(18,4) NOT NULL DEFAULT 0.0000,
  `material_gross_weight` decimal(18,4) DEFAULT NULL,
  `material_net_weight` decimal(18,4) DEFAULT NULL,
  `material_is_deleted` int(1) DEFAULT 0,
  `material_deleted_by` int(11) DEFAULT NULL,
  `material_deleted_date` datetime DEFAULT NULL,
  `material_shift` varchar(200) DEFAULT NULL,
  `material_date_created` datetime DEFAULT NULL,
  `material_date` date DEFAULT NULL,
  `material_created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34272 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_material_pouching` */

DROP TABLE IF EXISTS `ps_job_input_material_pouching`;

CREATE TABLE `ps_job_input_material_pouching` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT 0,
  `material_type` varchar(100) DEFAULT NULL,
  `material_input_id` bigint(20) DEFAULT NULL,
  `material_code` varchar(50) DEFAULT NULL,
  `material_name` text DEFAULT NULL,
  `material_description` varchar(500) DEFAULT NULL,
  `material_width` int(11) DEFAULT NULL,
  `material_quantity` decimal(18,4) DEFAULT NULL,
  `material_join` int(2) DEFAULT 0,
  `material_uom` varchar(50) DEFAULT NULL,
  `material_supplier` varchar(500) DEFAULT NULL,
  `material_supplier_lot` varchar(50) DEFAULT NULL,
  `material_is_deleted` int(1) DEFAULT 0,
  `material_deleted_by` varchar(20) DEFAULT NULL,
  `material_shift` varchar(200) DEFAULT NULL,
  `material_date_created` datetime DEFAULT NULL,
  `material_created_by` varchar(20) DEFAULT NULL,
  `material_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14097 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_material_using_extrusion` */

DROP TABLE IF EXISTS `ps_job_input_material_using_extrusion`;

CREATE TABLE `ps_job_input_material_using_extrusion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT 0,
  `material_code` varchar(50) DEFAULT NULL,
  `material_code_alternate_resin` varchar(50) DEFAULT NULL,
  `is_alternate_resin` int(1) DEFAULT 0,
  `material_name` text DEFAULT NULL,
  `material_pipe` varchar(50) DEFAULT NULL,
  `material_hopper` text DEFAULT NULL,
  `material_description` varchar(500) DEFAULT NULL,
  `material_width` int(11) DEFAULT NULL,
  `material_quantity` decimal(18,4) DEFAULT NULL,
  `material_uom` varchar(50) DEFAULT NULL,
  `material_is_deleted` int(1) DEFAULT 0,
  `material_shift` varchar(200) DEFAULT NULL,
  `material_created_by` varchar(50) DEFAULT NULL,
  `material_deleted_by` varchar(50) DEFAULT NULL,
  `material_date_created` datetime DEFAULT NULL,
  `material_deleted_date` datetime DEFAULT NULL,
  `material_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6290 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_material_using_extrusion_details` */

DROP TABLE IF EXISTS `ps_job_input_material_using_extrusion_details`;

CREATE TABLE `ps_job_input_material_using_extrusion_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `material_using_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT 0,
  `material_details_lot` varchar(50) DEFAULT NULL,
  `material_details_tank` varchar(50) DEFAULT NULL,
  `material_details_description` varchar(500) DEFAULT NULL,
  `material_details_uom` varchar(50) DEFAULT NULL,
  `material_details_quantity` decimal(18,4) DEFAULT NULL,
  `material_details_start_time_use` datetime DEFAULT NULL,
  `material_details_is_deleted` int(1) DEFAULT 0,
  `material_details_shift` varchar(200) DEFAULT NULL,
  `material_details_created_by` varchar(50) DEFAULT NULL,
  `material_details_deleted_by` varchar(50) DEFAULT NULL,
  `material_details_date_created` datetime DEFAULT NULL,
  `material_details_deleted_date` datetime DEFAULT NULL,
  `material_details_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `material_return_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15460 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_residual` */

DROP TABLE IF EXISTS `ps_job_input_residual`;

CREATE TABLE `ps_job_input_residual` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `in_residual_description` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `in_residual_quantity` decimal(18,4) DEFAULT 0.0000,
  `in_residual_created_by` varchar(200) DEFAULT NULL,
  `in_residual_created_date` datetime DEFAULT NULL,
  `in_residual_is_deleted` int(1) DEFAULT 0,
  `in_residual_deleted_by` varchar(10) DEFAULT NULL,
  `in_residual_deleted_date` datetime DEFAULT NULL,
  `in_residual_shift` varchar(500) DEFAULT NULL,
  `in_residual_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_return_join` */

DROP TABLE IF EXISTS `ps_job_input_return_join`;

CREATE TABLE `ps_job_input_return_join` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `return_join_note` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `return_join_quantity` int(10) DEFAULT 0,
  `return_join_created_by` varchar(200) DEFAULT NULL,
  `return_join_created_date` datetime DEFAULT NULL,
  `return_join_is_deleted` int(1) DEFAULT 0,
  `return_join_deleted_by` varchar(10) DEFAULT NULL,
  `return_join_deleted_date` datetime DEFAULT NULL,
  `return_join_shift` varchar(500) DEFAULT NULL,
  `return_join_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9272 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_solvent` */

DROP TABLE IF EXISTS `ps_job_input_solvent`;

CREATE TABLE `ps_job_input_solvent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `solvent_code` varchar(50) DEFAULT NULL,
  `solvent_name` varchar(50) DEFAULT NULL,
  `solvent_suplier_name` varchar(200) DEFAULT NULL,
  `solvent_lot_no` varchar(50) DEFAULT NULL,
  `solvent_inventory_weight` decimal(18,4) DEFAULT 0.0000,
  `solvent_receive_weight` decimal(18,4) DEFAULT 0.0000,
  `solvent_used_weight` decimal(18,4) DEFAULT 0.0000,
  `solvent_boom` int(1) DEFAULT NULL,
  `solvent_notes` varchar(200) DEFAULT NULL,
  `solvent_is_deleted` tinyint(1) DEFAULT 0,
  `solvent_deleted_by` int(11) DEFAULT NULL,
  `solvent_deleted_date` datetime DEFAULT NULL,
  `solvent_shift` varchar(3) DEFAULT NULL,
  `solvent_created_date` datetime DEFAULT NULL,
  `solvent_created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6711 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_input_sub_trace_id` */

DROP TABLE IF EXISTS `ps_job_input_sub_trace_id`;

CREATE TABLE `ps_job_input_sub_trace_id` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT 0,
  `sub_type` varchar(100) DEFAULT NULL,
  `sub_input_id` bigint(20) NOT NULL,
  `sub_trace_id` varchar(50) DEFAULT NULL,
  `sub_product_code` varchar(50) DEFAULT NULL,
  `sub_description` varchar(500) DEFAULT NULL,
  `sub_roll_no` varchar(50) DEFAULT NULL,
  `sub_width` int(11) DEFAULT NULL,
  `sub_quantity` decimal(18,4) DEFAULT NULL,
  `sub_quantity_real` decimal(18,4) DEFAULT NULL,
  `ghep_in_weight` decimal(18,4) DEFAULT NULL,
  `sub_join` int(2) DEFAULT 0,
  `sub_uom` varchar(50) DEFAULT NULL,
  `sub_is_deleted` int(1) DEFAULT 0,
  `sub_shift` varchar(200) DEFAULT NULL,
  `sub_date_created` datetime DEFAULT NULL,
  `sub_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `reason_name_inspection` text DEFAULT NULL,
  `stage` text DEFAULT NULL,
  `sub_created_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `index_job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148308 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_join_position` */

DROP TABLE IF EXISTS `ps_job_join_position`;

CREATE TABLE `ps_job_join_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `output_id` bigint(20) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `tape_number` int(11) DEFAULT 1,
  `type` int(11) DEFAULT NULL COMMENT 'Phân loại',
  `comment` varchar(200) DEFAULT NULL,
  `shift` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58049 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_material_residual` */

DROP TABLE IF EXISTS `ps_job_material_residual`;

CREATE TABLE `ps_job_material_residual` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `material_trace_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `material_type` int(11) DEFAULT 0,
  `material_residual_description` varchar(500) DEFAULT NULL,
  `material_residual_quantity` decimal(18,4) DEFAULT 0.0000,
  `material_residual_created_by` varchar(200) DEFAULT NULL,
  `material_residual_created_date` datetime DEFAULT NULL,
  `material_residual_is_deleted` int(1) DEFAULT 0,
  `material_residual_deleted_by` varchar(10) DEFAULT NULL,
  `material_residual_deleted_date` datetime DEFAULT NULL,
  `material_residual_shift` varchar(500) DEFAULT NULL,
  `material_residual_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2083 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_output` */

DROP TABLE IF EXISTS `ps_job_output`;

CREATE TABLE `ps_job_output` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `out_product_code` varchar(50) DEFAULT NULL,
  `out_reason_rework` text DEFAULT NULL,
  `out_description` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `out_width` decimal(18,4) DEFAULT NULL,
  `out_quantity_real` decimal(18,4) DEFAULT NULL,
  `out_quantity` decimal(18,4) DEFAULT NULL,
  `out_uom` varchar(50) DEFAULT NULL,
  `out_created_by` varchar(200) DEFAULT NULL,
  `out_created_date` datetime DEFAULT NULL,
  `out_is_deleted` int(1) DEFAULT 0,
  `out_deleted_by` varchar(10) DEFAULT NULL,
  `out_deleted_date` datetime DEFAULT NULL,
  `out_is_printed` tinyint(2) DEFAULT 0,
  `out_set_no` tinyint(2) DEFAULT NULL,
  `out_is_reprinted` tinyint(2) DEFAULT 0,
  `is_marked_rework_date` datetime DEFAULT NULL,
  `is_marked_rework_by` varchar(10) DEFAULT NULL,
  `is_marked_rework` tinyint(2) DEFAULT 0 COMMENT '0 not marked rework,1 marked rework, 2 reworked',
  `out_lane_no` tinyint(2) DEFAULT 0,
  `out_net_weight` decimal(18,1) DEFAULT NULL,
  `out_gross_weight` decimal(18,1) DEFAULT NULL,
  `out_connect_no` tinyint(2) DEFAULT 0,
  `out_shift` varchar(500) DEFAULT NULL,
  `out_constituent` text DEFAULT NULL,
  `out_status` int(11) DEFAULT 0,
  `no_of_rewind` int(1) DEFAULT 0,
  `out_master_trace_id` varchar(20) DEFAULT '0',
  `remaining_outer_roll` int(2) NOT NULL DEFAULT 0,
  `out_date` date DEFAULT NULL,
  `out_label_date` date DEFAULT NULL,
  `out_join_position` varchar(500) DEFAULT NULL,
  `out_reason_rework_id` int(10) DEFAULT NULL,
  `HSD` text DEFAULT NULL,
  `out_metter_according_mother_scroll` decimal(18,4) DEFAULT 0.0000,
  `out_imp` decimal(18,4) DEFAULT 0.0000,
  `out_return_join` int(5) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `job_output` (`job_id`),
  KEY `in_put_id` (`in_put_id`),
  KEY `out_trace_id` (`out_trace_id`),
  KEY `index_is_marked_rework` (`is_marked_rework`),
  KEY `index_out_status` (`out_status`)
) ENGINE=InnoDB AUTO_INCREMENT=1324263 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_output_ex_la_pr` */

DROP TABLE IF EXISTS `ps_job_output_ex_la_pr`;

CREATE TABLE `ps_job_output_ex_la_pr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `out_product_code` varchar(50) DEFAULT NULL,
  `out_priority` varchar(5) DEFAULT NULL,
  `out_description` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `list_in_trace_id` varchar(200) DEFAULT NULL,
  `material1_id` varchar(50) DEFAULT NULL,
  `material2_id` varchar(50) DEFAULT NULL,
  `material1_trace_id_used` varchar(200) DEFAULT NULL,
  `material2_trace_id_used` varchar(200) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `out_width` decimal(18,4) DEFAULT NULL,
  `out_quantity` decimal(18,4) DEFAULT NULL,
  `out_uom` varchar(50) DEFAULT NULL,
  `out_is_printed` tinyint(2) DEFAULT 0,
  `out_is_reprinted` tinyint(2) DEFAULT 0,
  `out_net_weight` decimal(18,1) DEFAULT NULL,
  `out_gross_weight` decimal(18,1) DEFAULT NULL,
  `out_connect_no` tinyint(2) DEFAULT 0,
  `out_shift` varchar(500) DEFAULT NULL,
  `out_constituent` text DEFAULT NULL,
  `out_set_no` int(11) DEFAULT NULL,
  `out_lane_no` int(11) DEFAULT NULL,
  `out_status` int(11) DEFAULT 0,
  `out_date` date DEFAULT NULL,
  `out_label_date` date DEFAULT NULL,
  `out_join_position` varchar(500) DEFAULT NULL,
  `out_reason_rework_id` int(10) DEFAULT NULL,
  `out_scrap` decimal(18,4) DEFAULT NULL,
  `out_scrap_reason` varchar(500) DEFAULT NULL,
  `out_scrap_note` varchar(500) DEFAULT NULL,
  `out_created_by` varchar(200) DEFAULT NULL,
  `out_created_date` datetime DEFAULT NULL,
  `out_is_deleted` int(1) DEFAULT 0,
  `out_deleted_by` varchar(10) DEFAULT NULL,
  `out_deleted_date` datetime DEFAULT NULL,
  `out_updated_by` int(11) DEFAULT NULL,
  `out_updated_date` int(11) DEFAULT NULL,
  `out_period` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `job_output` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55690 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_output_extrusion` */

DROP TABLE IF EXISTS `ps_job_output_extrusion`;

CREATE TABLE `ps_job_output_extrusion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `out_product_code` varchar(50) DEFAULT NULL,
  `out_reason_rework` text DEFAULT NULL,
  `out_description` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `out_width` decimal(18,4) DEFAULT NULL,
  `out_quantity` decimal(18,4) DEFAULT NULL,
  `out_set_no` tinyint(2) DEFAULT NULL,
  `out_winder` varchar(20) DEFAULT NULL,
  `out_lane_no` tinyint(2) DEFAULT 0,
  `out_uom` varchar(50) DEFAULT NULL,
  `out_created_by` varchar(200) DEFAULT NULL,
  `out_created_date` datetime DEFAULT NULL,
  `out_is_deleted` int(1) DEFAULT 0 COMMENT '2 transfer, 3 total, 4 received',
  `out_deleted_by` varchar(10) DEFAULT NULL,
  `out_deleted_date` datetime DEFAULT NULL,
  `out_is_printed` tinyint(2) DEFAULT 0,
  `out_is_reprinted` tinyint(2) DEFAULT 0,
  `is_marked_rework_date` datetime DEFAULT NULL,
  `is_marked_rework_by` varchar(10) DEFAULT NULL,
  `is_marked_rework` tinyint(2) DEFAULT 0 COMMENT '0 not marked rework,1 marked rework, 2 reworked',
  `out_net_weight` decimal(18,1) DEFAULT NULL,
  `out_gross_weight` decimal(18,1) DEFAULT NULL,
  `out_connect_no` tinyint(2) DEFAULT 0,
  `out_shift` varchar(50) DEFAULT NULL,
  `out_constituent` text DEFAULT NULL,
  `out_status` int(11) DEFAULT 0,
  `no_of_rewind` int(1) DEFAULT 0,
  `out_master_trace_id` varchar(20) DEFAULT '0',
  `out_date` date DEFAULT NULL,
  `out_label_date` date DEFAULT NULL,
  `out_join_position` varchar(500) DEFAULT NULL,
  `out_reason_rework_id` int(10) DEFAULT NULL,
  `HSD` text DEFAULT NULL,
  `id_return` bigint(20) DEFAULT NULL,
  `outID_merge` varchar(200) DEFAULT NULL,
  `is_transfer` int(2) DEFAULT 0,
  `is_received` int(2) DEFAULT 0,
  `receive_shift` varchar(50) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `is_ccr` int(2) DEFAULT NULL,
  `out_label_time` varchar(5) DEFAULT NULL,
  `remaining_outer_roll` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21299 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_output_pouching` */

DROP TABLE IF EXISTS `ps_job_output_pouching`;

CREATE TABLE `ps_job_output_pouching` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `out_product_code` varchar(50) DEFAULT NULL,
  `out_reason_rework` text DEFAULT NULL,
  `out_description` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `out_quantity` decimal(18,4) DEFAULT NULL,
  `out_uom` varchar(50) DEFAULT 'TUI',
  `out_created_by` varchar(200) DEFAULT NULL,
  `out_created_date` datetime DEFAULT NULL,
  `out_is_deleted` int(1) DEFAULT 0,
  `out_deleted_by` varchar(10) DEFAULT NULL,
  `out_deleted_date` datetime DEFAULT NULL,
  `out_is_printed` tinyint(2) DEFAULT 0,
  `out_set_no` tinyint(20) DEFAULT NULL,
  `out_is_reprinted` tinyint(2) DEFAULT 0,
  `is_marked_rework_date` datetime DEFAULT NULL,
  `is_marked_rework_by` varchar(10) DEFAULT NULL,
  `is_marked_rework` tinyint(2) DEFAULT 0 COMMENT '0 not marked rework,1 marked rework, 2 reworked',
  `out_line_no` varchar(200) DEFAULT NULL,
  `out_net_weight` decimal(18,1) DEFAULT NULL,
  `out_gross_weight` decimal(18,1) DEFAULT NULL,
  `out_shift` varchar(500) DEFAULT NULL,
  `out_constituent` text DEFAULT NULL,
  `out_status` int(11) DEFAULT 0,
  `out_expiry` varchar(200) DEFAULT NULL,
  `out_producer` varchar(200) DEFAULT NULL,
  `out_box_no` int(10) DEFAULT 0,
  `type_box` tinyint(2) DEFAULT 0 COMMENT '0 normal; 1 target; 2 source box',
  `out_shift_old` varchar(500) DEFAULT NULL,
  `out_created_date_old` datetime DEFAULT NULL,
  `out_odd_box` int(2) DEFAULT 0,
  `out_traceID_merge` text DEFAULT NULL COMMENT 'Two ODD Box Merge',
  `out_is_box` tinyint(2) DEFAULT 0,
  `out_date` date DEFAULT NULL,
  `out_reason_rework_id` int(10) DEFAULT 0,
  `out_label_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `out_master_trace_id` varchar(20) DEFAULT NULL,
  `out_start_time_spout` varchar(6) DEFAULT NULL,
  `out_end_time_spout` varchar(6) DEFAULT NULL,
  `out_old_box_no` int(10) DEFAULT NULL,
  `out_old_trace_id` varchar(20) DEFAULT NULL,
  `out_job_id_old` bigint(20) DEFAULT NULL,
  `out_id_return` bigint(20) DEFAULT NULL,
  `out_is_received` tinyint(1) DEFAULT 0,
  `out_receive_shift` varchar(20) DEFAULT NULL,
  `out_receive_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_outtrace_op` (`out_trace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217013 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_output_press` */

DROP TABLE IF EXISTS `ps_job_output_press`;

CREATE TABLE `ps_job_output_press` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `input_redisual_id` text DEFAULT NULL,
  `out_product_code` varchar(50) DEFAULT NULL,
  `out_description` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `out_width` decimal(18,4) DEFAULT NULL,
  `out_quantity` decimal(18,4) DEFAULT NULL,
  `out_uom` varchar(50) DEFAULT NULL,
  `out_is_printed` tinyint(2) DEFAULT 0,
  `out_is_reprinted` tinyint(2) DEFAULT 0,
  `out_net_weight` decimal(18,1) DEFAULT NULL,
  `out_gross_weight` decimal(18,1) DEFAULT NULL,
  `out_connect_no` tinyint(2) DEFAULT 0,
  `out_shift` varchar(500) DEFAULT NULL,
  `out_constituent` text DEFAULT NULL,
  `out_priority` varchar(50) DEFAULT NULL,
  `out_set_no` int(11) DEFAULT NULL,
  `out_lane_no` int(11) DEFAULT NULL,
  `out_status` int(11) DEFAULT 0,
  `out_date` date DEFAULT NULL,
  `out_label_date` date DEFAULT NULL,
  `out_label_time` varchar(5) DEFAULT NULL,
  `out_scrap` decimal(18,4) NOT NULL DEFAULT 0.0000,
  `out_scrap_reason` varchar(500) DEFAULT NULL,
  `out_scrap_note` varchar(500) DEFAULT NULL,
  `out_created_by` varchar(200) DEFAULT NULL,
  `out_created_date` datetime DEFAULT NULL,
  `out_is_deleted` int(1) DEFAULT 0,
  `out_deleted_by` varchar(10) DEFAULT NULL,
  `out_deleted_date` datetime DEFAULT NULL,
  `out_updated_by` int(11) DEFAULT NULL,
  `out_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `job_output` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32485 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_output_rewind` */

DROP TABLE IF EXISTS `ps_job_output_rewind`;

CREATE TABLE `ps_job_output_rewind` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `out_product_code` varchar(50) DEFAULT NULL,
  `out_reason_rework` text DEFAULT NULL,
  `out_description` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `out_width` decimal(18,4) DEFAULT NULL,
  `out_quantity` decimal(18,4) DEFAULT NULL,
  `checked_meter` decimal(18,4) DEFAULT NULL,
  `out_uom` varchar(50) DEFAULT NULL,
  `out_created_by` varchar(200) DEFAULT NULL,
  `out_created_date` datetime DEFAULT NULL,
  `out_is_deleted` int(1) DEFAULT 0,
  `out_deleted_by` varchar(10) DEFAULT NULL,
  `out_deleted_date` datetime DEFAULT NULL,
  `out_is_printed` tinyint(2) DEFAULT 0,
  `out_set_no` tinyint(2) DEFAULT NULL,
  `out_is_reprinted` tinyint(2) DEFAULT 0,
  `is_marked_rework_date` datetime DEFAULT NULL,
  `is_marked_rework_by` varchar(10) DEFAULT NULL,
  `is_marked_rework` tinyint(2) DEFAULT 0 COMMENT '0 not marked rework,1 marked rework, 2 reworked',
  `out_lane_no` tinyint(2) DEFAULT 0,
  `out_net_weight` decimal(18,1) DEFAULT NULL,
  `out_gross_weight` decimal(18,1) DEFAULT NULL,
  `out_connect_no` tinyint(2) DEFAULT 0,
  `out_shift` varchar(500) DEFAULT NULL,
  `out_constituent` text DEFAULT NULL,
  `out_status` int(11) DEFAULT 0,
  `no_of_rewind` int(1) DEFAULT 0,
  `out_master_trace_id` varchar(20) DEFAULT '0',
  `remaining_outer_roll` int(2) NOT NULL DEFAULT 0,
  `out_date` date DEFAULT NULL,
  `out_label_date` date DEFAULT NULL,
  `out_join_position` varchar(500) DEFAULT NULL,
  `out_reason_rework_id` int(10) DEFAULT NULL,
  `HSD` text DEFAULT NULL,
  `is_good` int(1) DEFAULT 0,
  `out_shims` int(10) DEFAULT 0,
  `id_return` bigint(20) DEFAULT NULL,
  `out_TraceID_merge` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20138 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_output_scrap_set` */

DROP TABLE IF EXISTS `ps_job_output_scrap_set`;

CREATE TABLE `ps_job_output_scrap_set` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `out_scrap_product_code` varchar(50) DEFAULT NULL,
  `out_scrap_reason_rework` text DEFAULT NULL,
  `out_scrap_description` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `out_scrap_trace_id` varchar(500) DEFAULT NULL,
  `out_scrap_width` decimal(18,4) DEFAULT NULL,
  `out_scrap_quantity` decimal(18,4) DEFAULT 0.0000,
  `out_scrap_uom` varchar(50) DEFAULT NULL,
  `out_scrap_created_by` varchar(200) DEFAULT NULL,
  `out_scrap_created_date` datetime DEFAULT NULL,
  `out_scrap_is_deleted` int(1) DEFAULT 0,
  `out_scrap_deleted_by` varchar(10) DEFAULT NULL,
  `out_scrap_deleted_date` datetime DEFAULT NULL,
  `out_scrap_is_printed` tinyint(2) DEFAULT 0,
  `out_scrap_set_no` tinyint(2) DEFAULT NULL,
  `out_scrap_is_reprinted` tinyint(2) DEFAULT 0,
  `is_marked_rework_date` datetime DEFAULT NULL,
  `is_marked_rework_by` varchar(10) DEFAULT NULL,
  `is_marked_rework` tinyint(2) DEFAULT 0 COMMENT '0 not marked rework,1 marked rework, 2 reworked',
  `out_scrap_lane_no` tinyint(2) DEFAULT 0,
  `out_scrap_net_weight` decimal(18,1) DEFAULT NULL,
  `out_scrap_gross_weight` decimal(18,1) DEFAULT NULL,
  `out_scrap_connect_no` tinyint(2) DEFAULT 0,
  `out_scrap_shift` varchar(500) DEFAULT NULL,
  `out_scrap_constituent` text DEFAULT NULL,
  `out_scrap_status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_rework` */

DROP TABLE IF EXISTS `ps_job_rework`;

CREATE TABLE `ps_job_rework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `job_no` varchar(10) DEFAULT NULL,
  `output_id_new` int(11) DEFAULT NULL COMMENT 'ouput id new',
  `output_id_combined` text DEFAULT NULL,
  `trace_id_combined` text DEFAULT NULL COMMENT 'json string for trace id and status of it',
  `quantity_combined` text DEFAULT NULL,
  `trace_id_last_roll` varchar(20) DEFAULT NULL,
  `output_id_last_roll` varchar(20) DEFAULT NULL,
  `work_center_code` varchar(20) DEFAULT NULL,
  `machine_code` varchar(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0 COMMENT '0 for unactivated/deleted, 1 for activated & scheduled, 2 for unscheduled',
  `is_deleted_by` varchar(10) DEFAULT NULL,
  `is_deleted_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `combine_type` text DEFAULT NULL,
  `instruction` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91339 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_job_rework_extrusion` */

DROP TABLE IF EXISTS `ps_job_rework_extrusion`;

CREATE TABLE `ps_job_rework_extrusion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `job_no` varchar(10) DEFAULT NULL,
  `output_id_new` int(11) DEFAULT NULL COMMENT 'ouput id new',
  `output_id_combined` text DEFAULT NULL,
  `trace_id_combined` text DEFAULT NULL COMMENT 'json string for trace id and status of it',
  `quantity_combined` text DEFAULT NULL,
  `trace_id_last_roll` varchar(20) DEFAULT NULL,
  `output_id_last_roll` varchar(20) DEFAULT NULL,
  `work_center_code` varchar(20) DEFAULT NULL,
  `machine_code` varchar(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0 COMMENT '0 for unactivated/deleted, 1 for activated & scheduled, 2 for unscheduled',
  `is_deleted_by` varchar(10) DEFAULT NULL,
  `is_deleted_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `combine_type` text DEFAULT NULL,
  `instruction` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45577 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ps_job_rework_pouching` */

DROP TABLE IF EXISTS `ps_job_rework_pouching`;

CREATE TABLE `ps_job_rework_pouching` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `job_no` varchar(10) DEFAULT NULL,
  `output_id_new` int(11) DEFAULT NULL COMMENT 'ouput id new',
  `output_id_combined` text DEFAULT NULL,
  `trace_id_combined` text DEFAULT NULL COMMENT 'json string for trace id and status of it',
  `quantity_combined` text DEFAULT NULL,
  `trace_id_source` text DEFAULT NULL,
  `output_id_source` text DEFAULT NULL,
  `work_center_code` varchar(20) DEFAULT NULL,
  `machine_code` varchar(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0 COMMENT '0 for unactivated/deleted, 1 for activated & scheduled, 2 for unscheduled',
  `is_deleted_by` varchar(10) DEFAULT NULL,
  `is_deleted_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `combine_type` text DEFAULT NULL,
  `instruction` varchar(500) DEFAULT NULL,
  `rework_shift` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78363 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_material_return` */

DROP TABLE IF EXISTS `ps_material_return`;

CREATE TABLE `ps_material_return` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(20) DEFAULT NULL,
  `input_trace_id` varchar(20) DEFAULT NULL,
  `return_shift` varchar(20) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `input_width` double DEFAULT NULL,
  `input_quantity` double DEFAULT NULL,
  `ghep_lot_ncc` varchar(100) DEFAULT NULL,
  `is_return` tinyint(4) DEFAULT 0,
  `is_pouching` int(11) DEFAULT 0,
  `join_return` int(11) DEFAULT 0,
  `trace_id` varchar(20) DEFAULT NULL,
  `return_quantity` double DEFAULT NULL,
  `return_weight` decimal(18,4) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `receive_shift` varchar(20) DEFAULT NULL,
  `is_received` tinyint(4) DEFAULT 0,
  `is_material` int(1) DEFAULT 0,
  `in_weight` decimal(18,4) DEFAULT NULL,
  `work_center_code` varchar(50) DEFAULT NULL,
  `trace_id_original` varchar(20) DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `roll_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_output` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31144 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_material_return_extrusion` */

DROP TABLE IF EXISTS `ps_material_return_extrusion`;

CREATE TABLE `ps_material_return_extrusion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(20) DEFAULT NULL,
  `return_shift` varchar(20) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `input_width` double DEFAULT NULL,
  `input_quantity` double DEFAULT NULL,
  `lot_ncc` text DEFAULT NULL,
  `is_return` tinyint(4) DEFAULT 0 COMMENT '1 return ; 2 transfer',
  `type_return` int(11) DEFAULT 0 COMMENT '0 material ; 1 Roll',
  `join_return` int(11) DEFAULT 0,
  `trace_id` varchar(20) DEFAULT NULL,
  `return_quantity` double DEFAULT NULL,
  `return_weight` decimal(18,4) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `receive_shift` varchar(20) DEFAULT NULL,
  `is_received` tinyint(4) DEFAULT 0,
  `is_material` int(1) DEFAULT NULL,
  `in_weight` decimal(18,4) DEFAULT NULL,
  `work_center_code` varchar(50) DEFAULT NULL,
  `trace_id_original` varchar(20) DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `manufacturing_date` date DEFAULT NULL,
  `material_using_detail_id` int(20) DEFAULT NULL,
  `is_out_roll` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8276 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_material_return_extrusion_details` */

DROP TABLE IF EXISTS `ps_material_return_extrusion_details`;

CREATE TABLE `ps_material_return_extrusion_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(20) DEFAULT NULL,
  `return_id` bigint(20) DEFAULT NULL,
  `return_shift` varchar(20) DEFAULT NULL,
  `product_code` varchar(200) DEFAULT NULL,
  `input_width` double DEFAULT NULL,
  `input_quantity` double DEFAULT NULL,
  `lot_ncc` text DEFAULT NULL,
  `is_return` tinyint(4) DEFAULT 0 COMMENT '1 return ; 2 transfer',
  `type_return` int(11) DEFAULT 0 COMMENT '0 material ; 1 Roll',
  `join_return` int(11) DEFAULT 0,
  `trace_id` varchar(20) DEFAULT NULL,
  `return_quantity` double DEFAULT NULL,
  `return_weight` decimal(18,4) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `receive_shift` varchar(20) DEFAULT NULL,
  `is_received` tinyint(4) DEFAULT 0,
  `is_material` int(1) DEFAULT NULL,
  `in_weight` decimal(18,4) DEFAULT NULL,
  `work_center_code` varchar(50) DEFAULT NULL,
  `trace_id_original` varchar(20) DEFAULT NULL,
  `product_name` text DEFAULT NULL,
  `out_winder` varchar(50) DEFAULT NULL,
  `out_set_no` int(10) DEFAULT NULL,
  `out_lane_no` int(10) DEFAULT NULL,
  `is_out_roll` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13929 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_mfg_lsx_thongtinthanhpham` */

DROP TABLE IF EXISTS `ps_mfg_lsx_thongtinthanhpham`;

CREATE TABLE `ps_mfg_lsx_thongtinthanhpham` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `LSX` varchar(50) DEFAULT NULL,
  `job_id` varchar(20) DEFAULT NULL,
  `machine_code` varchar(20) DEFAULT NULL,
  `STT` tinyint(2) DEFAULT NULL,
  `MaVatTu` varchar(20) DEFAULT NULL,
  `SoLuongMV` decimal(18,4) DEFAULT NULL,
  `SoLuongMD` decimal(18,4) DEFAULT NULL,
  `SoLuongKG` decimal(18,4) DEFAULT NULL,
  `GhiChu` varchar(500) DEFAULT NULL,
  `UserCreate` varchar(20) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `ModifyDate` varchar(50) DEFAULT NULL,
  `SoLaneThoi` decimal(18,4) DEFAULT NULL,
  `TongKhoMang` decimal(18,4) DEFAULT NULL,
  `ratio` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1518 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_mfg_move_congdoan` */

DROP TABLE IF EXISTS `ps_mfg_move_congdoan`;

CREATE TABLE `ps_mfg_move_congdoan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `machine_code` varchar(10) DEFAULT NULL,
  `job_id_history` bigint(20) DEFAULT 0,
  `SoYC` varchar(20) DEFAULT NULL,
  `NhomCD` varchar(10) DEFAULT NULL,
  `CongDoan` int(10) DEFAULT NULL,
  `MetDaiVao` decimal(18,4) DEFAULT NULL,
  `MetDaiRa` decimal(18,4) DEFAULT NULL,
  `Met2Vao` decimal(18,4) DEFAULT NULL,
  `Met2Ra` decimal(18,4) DEFAULT NULL,
  `Setup` decimal(18,4) DEFAULT NULL,
  `PhiHao` decimal(18,4) DEFAULT NULL,
  `DonGiaLuong` decimal(18,4) DEFAULT NULL,
  `MaCongDoan` varchar(5) DEFAULT NULL,
  `LenhSX` varchar(250) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24046 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_mfg_moveorder` */

DROP TABLE IF EXISTS `ps_mfg_moveorder`;

CREATE TABLE `ps_mfg_moveorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `MaXuong` varchar(20) DEFAULT NULL,
  `SoChungTu` varchar(20) DEFAULT NULL,
  `Ngay` datetime DEFAULT NULL,
  `GhiChu` varchar(1000) DEFAULT NULL,
  `STT` int(11) DEFAULT NULL,
  `MaVatTu` varchar(20) DEFAULT NULL,
  `TenVatTu` text DEFAULT NULL,
  `DVT` varchar(20) DEFAULT NULL,
  `SoLuong` decimal(10,0) DEFAULT NULL,
  `MaKho` varchar(20) DEFAULT NULL,
  `UserID` varchar(20) DEFAULT NULL,
  `GhiChuD` varchar(4000) DEFAULT NULL,
  `MaDonVi` varchar(20) DEFAULT NULL,
  `LSX` varchar(20) DEFAULT NULL,
  `XuatBu` varchar(1) DEFAULT NULL,
  `SoDMPH` varchar(50) DEFAULT NULL,
  `YCBoSung` varchar(1) DEFAULT NULL,
  `NhomCD` varchar(20) DEFAULT NULL,
  `CongDoan` int(11) DEFAULT NULL,
  `HeSoBom` decimal(18,4) DEFAULT NULL,
  `SoQCSP` varchar(20) DEFAULT NULL,
  `SoLuongYC` decimal(18,4) DEFAULT NULL,
  `TinhTrang` varchar(2) DEFAULT NULL,
  `SoLuongBom` decimal(38,6) DEFAULT NULL,
  `DinhLuong` decimal(18,6) DEFAULT NULL,
  `HaoHut` decimal(18,6) DEFAULT NULL,
  `CongThuc` varchar(200) DEFAULT NULL,
  `ChuoiCongThuc` varchar(200) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `KhoSXSuaDoi` decimal(18,4) DEFAULT NULL,
  `MaCD` varchar(10) DEFAULT NULL,
  `MaCDBS` varchar(10) DEFAULT NULL,
  `LoiNhuanGross` decimal(18,4) DEFAULT NULL,
  `MaThanhPham` varchar(20) DEFAULT NULL,
  `MaNCC` varchar(4000) DEFAULT NULL,
  `TenNCC` varchar(4000) DEFAULT NULL,
  `BienKg` decimal(18,4) DEFAULT NULL,
  `GhiChuBOM` varchar(4000) DEFAULT NULL,
  `MaVTBOM` varchar(20) DEFAULT NULL,
  `SLVTBOM` decimal(18,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55343 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_om_quycachsanpham_h` */

DROP TABLE IF EXISTS `ps_om_quycachsanpham_h`;

CREATE TABLE `ps_om_quycachsanpham_h` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `job_no` varchar(20) DEFAULT NULL,
  `machine_code` varchar(20) DEFAULT NULL,
  `SoQCSP` varchar(20) DEFAULT NULL,
  `Ngay` datetime DEFAULT NULL,
  `MaTP` varchar(10) DEFAULT NULL,
  `MaKH` varchar(20) DEFAULT NULL,
  `VersionTP` int(11) DEFAULT NULL,
  `CauTrucSP` varchar(250) DEFAULT NULL,
  `SoMau` int(11) DEFAULT NULL,
  `KhoMangSX` decimal(18,4) DEFAULT NULL,
  `VersionQCSP` int(11) DEFAULT NULL,
  `Active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=863 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_output_press_bandage` */

DROP TABLE IF EXISTS `ps_output_press_bandage`;

CREATE TABLE `ps_output_press_bandage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL DEFAULT 0,
  `error_id` int(11) DEFAULT NULL,
  `output_id` int(11) DEFAULT NULL,
  `position_error` int(11) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `shift` varchar(10) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9305 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_output_press_errors` */

DROP TABLE IF EXISTS `ps_output_press_errors`;

CREATE TABLE `ps_output_press_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_pallet` */

DROP TABLE IF EXISTS `ps_pallet`;

CREATE TABLE `ps_pallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pallet_trace_id` bigint(20) DEFAULT NULL,
  `box_trace_id` bigint(20) DEFAULT NULL,
  `pallet_status` tinyint(1) DEFAULT 0 COMMENT '0 is Opened, 1 is Released',
  `is_receipt` tinyint(1) DEFAULT 0 COMMENT '0 is Opened, 1 is Released',
  `date_time` datetime DEFAULT NULL,
  `sft_message_id` bigint(20) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `job_rework_id` int(11) DEFAULT NULL,
  `pallet_created_date` datetime DEFAULT NULL,
  `pallet_deleted` tinyint(1) DEFAULT 0 COMMENT 'check if the license pallet has been deleted',
  `pallet_deleted_by` varchar(10) DEFAULT NULL,
  `pallet_deleted_date` datetime DEFAULT NULL,
  `prod_order_no` varchar(10) DEFAULT NULL,
  `work_center_code` varchar(15) DEFAULT NULL,
  `machine_center_code` varchar(15) DEFAULT NULL,
  `is_pending_box` tinyint(1) DEFAULT 0,
  `rework_ticket` varchar(50) DEFAULT NULL,
  `is_printed` tinyint(2) DEFAULT 0,
  `shift` varchar(50) DEFAULT NULL,
  `constituent` varchar(500) DEFAULT NULL,
  `pallet_total_box` int(11) DEFAULT 0,
  `pallet_note` text DEFAULT NULL,
  `pallet_date` date DEFAULT NULL,
  `pallet_label_date` date DEFAULT NULL,
  `HSD` text DEFAULT NULL,
  `pallet_weight` decimal(18,4) DEFAULT NULL,
  `pallet_no` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_output` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44649 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_pallet_box` */

DROP TABLE IF EXISTS `ps_pallet_box`;

CREATE TABLE `ps_pallet_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `pallet_id` int(11) DEFAULT NULL,
  `box_id` int(11) DEFAULT NULL,
  `box_trace_id` varchar(500) DEFAULT NULL,
  `is_deleted` int(2) DEFAULT 0,
  `deleted_by` varchar(10) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `work_center_code` varchar(15) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_output` (`pallet_id`,`box_id`),
  KEY `box_id` (`box_id`),
  KEY `box_trace_id` (`box_trace_id`),
  KEY `pallet_id` (`pallet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=858878 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_pallet_box_pouching` */

DROP TABLE IF EXISTS `ps_pallet_box_pouching`;

CREATE TABLE `ps_pallet_box_pouching` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `pallet_id` int(11) DEFAULT NULL,
  `out_id` int(11) DEFAULT NULL,
  `out_trace_id` varchar(500) DEFAULT NULL,
  `is_deleted` int(2) DEFAULT 0,
  `deleted_by` varchar(10) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `work_center_code` varchar(15) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149953 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_pouching_types` */

DROP TABLE IF EXISTS `ps_pouching_types`;

CREATE TABLE `ps_pouching_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `machine_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `ps_print_templates` */

DROP TABLE IF EXISTS `ps_print_templates`;

CREATE TABLE `ps_print_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MaSoKH` varchar(20) DEFAULT NULL,
  `TenKhachHang` varchar(500) DEFAULT NULL,
  `SLTemMoiTrang` int(11) DEFAULT 0,
  `is_active` int(11) DEFAULT 0,
  `GhiChu` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_printed_label` */

DROP TABLE IF EXISTS `ps_printed_label`;

CREATE TABLE `ps_printed_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `trace_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `machine_code` int(11) DEFAULT NULL,
  `print_lsx` varchar(100) DEFAULT NULL,
  `print_type` varchar(32) DEFAULT NULL,
  `print_qty` int(11) DEFAULT 0,
  `is_reprint` int(11) DEFAULT 0,
  `printed_by` varchar(50) DEFAULT NULL,
  `printed_date` datetime DEFAULT NULL,
  `authen_by` varchar(50) DEFAULT NULL,
  `label_date` date DEFAULT NULL,
  `print_shift` varchar(50) DEFAULT NULL,
  `label_hsd` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2626216 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_prod_schedule` */

DROP TABLE IF EXISTS `ps_prod_schedule`;

CREATE TABLE `ps_prod_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_job_id` bigint(20) NOT NULL DEFAULT 0,
  `machine_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `machine_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `job_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_status` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `job_status` int(1) DEFAULT 0,
  `fg_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `prod_name` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `specification` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `in_put_plan` double(5,4) DEFAULT NULL,
  `actual_output` double(5,4) DEFAULT NULL,
  `plan_quantity` double(5,4) DEFAULT NULL,
  `total_order` double(5,4) DEFAULT NULL,
  `previous_process_time` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `finished_date` datetime DEFAULT NULL,
  `start_to_wh` date DEFAULT NULL,
  `set_up_time` float(2,1) DEFAULT NULL,
  `runing_time` float(2,1) DEFAULT NULL,
  `pl_speed` int(5) DEFAULT NULL,
  `rd_speed` int(5) DEFAULT NULL,
  `design_speed` int(5) DEFAULT NULL,
  `daily_run_time` int(5) DEFAULT NULL,
  `product_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `lanes` int(5) DEFAULT NULL,
  `fg_width` decimal(18,4) DEFAULT NULL,
  `qcsp_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `product_quantity` decimal(18,4) DEFAULT NULL,
  `quantity_order` decimal(18,4) DEFAULT NULL,
  `uom` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `sale_order` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `note_bom` text CHARACTER SET utf8 DEFAULT NULL,
  `customer_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `GhiChuItemSO` text CHARACTER SET utf8 DEFAULT NULL,
  `KhoCat2` decimal(18,4) DEFAULT NULL,
  `KhoCat3` decimal(18,4) DEFAULT NULL,
  `SOSO` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `SoLuong` decimal(10,0) DEFAULT NULL,
  `DienGiai` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `SoLuongM2` decimal(18,2) DEFAULT NULL,
  `TinhTrang` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `DVTGD` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `GhiChuBOM` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  `MaVatTu` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `TenVatTu` varchar(225) CHARACTER SET utf8 DEFAULT NULL,
  `DVT` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DVT2` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `LoaiVT` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `GhiChu` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `TenDoiTuong` text CHARACTER SET utf8 DEFAULT NULL,
  `TrDoDay` decimal(18,4) DEFAULT NULL,
  `TrDoDayLDPE` decimal(18,4) DEFAULT NULL,
  `TrTongDoDay` decimal(18,4) DEFAULT NULL,
  `TrTyTongDoDay` decimal(18,4) DEFAULT NULL,
  `CuChieuDaiCuon` decimal(18,4) DEFAULT NULL,
  `CuKhoCat` decimal(18,4) DEFAULT NULL,
  `CuKhoCat2` decimal(18,4) DEFAULT NULL,
  `SoMau` int(11) DEFAULT NULL,
  `Active` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `TuKichThuoc` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `TenKhachHang` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `MaSoKH` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `TrDSTDD` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `date_add_job` datetime DEFAULT NULL,
  `label_printed_date` date DEFAULT NULL,
  `TuRong` decimal(18,4) DEFAULT NULL,
  `TuCao` decimal(18,4) DEFAULT NULL,
  `TuDaySau` decimal(18,4) DEFAULT NULL,
  `TuSoJane` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `TenDoiTuongTui` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `TuDangVoi` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `TuGanNut` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `TuLoaiTui` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `TuDongGoi` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `TuQCPallet` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `LoaiTui` varchar(100) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `HSD` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `TuDuongHan2bien` decimal(18,4) DEFAULT NULL,
  `TuHanDau` decimal(18,4) DEFAULT NULL,
  `TuHanDay` decimal(18,4) DEFAULT NULL,
  `TrangKho` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `TrDSKT` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `TrDSBD` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `TrangMPET` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `TrCoDungMoi` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `TrKeoKy1` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `TrKeoKy2` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `TrKeoKy3` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `TrMangGhepKho` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `TrMangGhepKhoK2` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `TrMangGhepKhoK3` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `TrDungSai` decimal(18,4) DEFAULT NULL,
  `TrDungSaiBD` decimal(18,4) DEFAULT NULL,
  `Say` int(11) DEFAULT 0,
  `KhongSay` int(11) DEFAULT 0,
  `pouching_has_faucet` int(2) DEFAULT NULL,
  `label_type` int(2) DEFAULT NULL,
  `masking_tape` int(2) DEFAULT 1,
  `TuXepHongCao` decimal(18,4) DEFAULT NULL,
  `TuXepDaySau` decimal(18,4) DEFAULT NULL,
  `stable_time` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `note_history` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `InChatDongRan` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `TrangTrong` char(1) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `TrangBa` char(1) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `TrangAL` char(1) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `TrangDun` char(1) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `DVTSell` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `InDoDayMangIn` float DEFAULT NULL,
  `InVatLieu` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `corona` int(11) DEFAULT 0,
  `BuocDaiTP` decimal(18,4) DEFAULT NULL,
  `job_is_test` tinyint(4) DEFAULT 0 COMMENT 'Job la lsx thu',
  `job_has_test` tinyint(4) DEFAULT 0 COMMENT 'Job chinh co lsx thu',
  `label_old` int(1) DEFAULT 0,
  `thinkness_extrusion` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `HSCode` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `MaVach` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `SoPOKH` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `SOThamChieu` varchar(50) COLLATE utf8_esperanto_ci DEFAULT NULL,
  `pcs_bag` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37232 DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

/*Table structure for table `ps_prod_schedule_history_la` */

DROP TABLE IF EXISTS `ps_prod_schedule_history_la`;

CREATE TABLE `ps_prod_schedule_history_la` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) NOT NULL DEFAULT 0,
  `prod_name` varchar(500) DEFAULT NULL,
  `fg_code` varchar(50) DEFAULT NULL,
  `TenKhachHang` varchar(500) DEFAULT NULL,
  `MaSoKH` varchar(20) DEFAULT NULL,
  `TenDoiTuong` text DEFAULT NULL,
  `fg_width` decimal(18,4) DEFAULT NULL,
  `CuKhoCat` decimal(18,4) DEFAULT NULL,
  `DVTGD` varchar(50) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `TrangMPET` char(1) DEFAULT NULL,
  `TrCoDungMoi` char(1) DEFAULT NULL,
  `TrangKho` char(1) DEFAULT NULL,
  `TrangTrong` char(1) DEFAULT NULL,
  `TrangBa` char(1) DEFAULT NULL,
  `TrangAL` char(1) DEFAULT NULL,
  `TrangDun` char(1) DEFAULT NULL,
  `TrTongDoDay` decimal(18,4) DEFAULT NULL,
  `TrDSTDD` varchar(10) DEFAULT NULL,
  `TrDSKT` varchar(10) DEFAULT NULL,
  `TrDSBD` varchar(10) DEFAULT NULL,
  `TrDungSai` decimal(18,4) DEFAULT NULL,
  `TrDungSaiBD` decimal(18,4) DEFAULT NULL,
  `TrKeoKy1` varchar(250) DEFAULT NULL,
  `TrKeoKy2` varchar(250) DEFAULT NULL,
  `TrKeoKy3` varchar(250) DEFAULT NULL,
  `TrMangGhepKho` varchar(250) DEFAULT NULL,
  `TrMangGhepKhoK2` varchar(250) DEFAULT NULL,
  `TrMangGhepKhoK3` varchar(250) DEFAULT NULL,
  `Say` int(11) DEFAULT 0,
  `KhongSay` int(11) DEFAULT 0,
  `note` varchar(50) DEFAULT NULL,
  `created_by_login` int(11) DEFAULT NULL,
  `user_authorize` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_schedule` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_production_scraps` */

DROP TABLE IF EXISTS `ps_production_scraps`;

CREATE TABLE `ps_production_scraps` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT 0,
  `weight_lbs` double(10,2) DEFAULT NULL,
  `recycle` tinyint(1) DEFAULT 0,
  `comment` varchar(80) DEFAULT NULL,
  `scrap_code` varchar(20) DEFAULT NULL,
  `scrap_code_vn` varchar(20) DEFAULT NULL,
  `sft_message_id` bigint(20) DEFAULT NULL,
  `apply_message_id` bigint(20) DEFAULT NULL,
  `print_label_a` int(11) DEFAULT 0,
  `job_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(100) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_by` varchar(100) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `net_weight` double(10,2) DEFAULT NULL,
  `job_rework_id` int(11) DEFAULT NULL,
  `shift` varchar(50) DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `is_receipt` tinyint(2) DEFAULT 0,
  `trace_id` bigint(20) DEFAULT 0,
  `machine_code` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pallet_weight` double(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47721 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_production_scraps_update_tracking` */

DROP TABLE IF EXISTS `ps_production_scraps_update_tracking`;

CREATE TABLE `ps_production_scraps_update_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scrap_id` int(11) DEFAULT NULL,
  `update_weight` tinyint(4) DEFAULT 0,
  `update_code` tinyint(4) DEFAULT 0,
  `old_weight` double(10,2) DEFAULT NULL,
  `new_weight` double(10,2) DEFAULT NULL,
  `old_code` varchar(20) DEFAULT NULL,
  `new_code` varchar(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `reason_update` text DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_by` varchar(100) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `shift_update` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=360 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ps_production_status` */

DROP TABLE IF EXISTS `ps_production_status`;

CREATE TABLE `ps_production_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT 0,
  `status_code` varchar(20) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `grid_prod_status` varchar(200) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `prod_status_date` date DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `sft_message_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `job_rework_id` bigint(20) DEFAULT NULL,
  `external_system` varchar(20) DEFAULT 'SFT',
  `status_shift` varchar(20) NOT NULL,
  `temperature` varchar(500) DEFAULT NULL,
  `speed` varchar(100) DEFAULT NULL,
  `counter_from` decimal(18,4) DEFAULT NULL,
  `counter_to` decimal(18,4) DEFAULT NULL,
  `master_roll` text DEFAULT NULL,
  `comment_counter` text DEFAULT NULL,
  `tech_code` text DEFAULT NULL,
  `grid_prod_tech` text DEFAULT NULL,
  `ghep_ky` int(11) DEFAULT NULL,
  `time_out` int(11) DEFAULT NULL,
  `status_job` tinyint(4) DEFAULT 0,
  `status_glue` tinyint(4) DEFAULT 0,
  `status_date_new` date DEFAULT NULL,
  `machinery_info` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkExistSetupCode` (`status`,`status_code`,`job_id`),
  KEY `job_output` (`job_id`),
  KEY `index_created_date` (`created_date`)
) ENGINE=InnoDB AUTO_INCREMENT=127667 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_production_status_code` */

DROP TABLE IF EXISTS `ps_production_status_code`;

CREATE TABLE `ps_production_status_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(20) NOT NULL DEFAULT 'EXTRUSION',
  `code` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `description_vi` varchar(200) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `movement` varchar(15) DEFAULT NULL,
  `frequently_used` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `confirm_required` tinyint(1) DEFAULT 0,
  `manager_authorization` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `display_order` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_production_tech_code` */

DROP TABLE IF EXISTS `ps_production_tech_code`;

CREATE TABLE `ps_production_tech_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(10) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_reason_mbg` */

DROP TABLE IF EXISTS `ps_reason_mbg`;

CREATE TABLE `ps_reason_mbg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `define` varchar(200) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `ps_scarp_receipt_details` */

DROP TABLE IF EXISTS `ps_scarp_receipt_details`;

CREATE TABLE `ps_scarp_receipt_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `machine_code` varchar(20) DEFAULT NULL,
  `quantity` double DEFAULT 0,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `receipt_detail_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `prodscrap_id` int(11) DEFAULT NULL,
  `scrap_code` varchar(50) DEFAULT NULL,
  `scrap_name` text CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23055 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ps_scrap_codes` */

DROP TABLE IF EXISTS `ps_scrap_codes`;

CREATE TABLE `ps_scrap_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `description_vi` varchar(200) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `labor_type` varchar(50) DEFAULT NULL,
  `frequenly_used` tinyint(1) DEFAULT 0,
  `key` varchar(10) DEFAULT 'EXTRUSION',
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_scrap_material_la` */

DROP TABLE IF EXISTS `ps_scrap_material_la`;

CREATE TABLE `ps_scrap_material_la` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `material_scrap_material_id` bigint(20) DEFAULT NULL,
  `material_scrap_description` text DEFAULT NULL,
  `material_scrap_quantity` decimal(18,4) DEFAULT NULL,
  `material_scrap_is_deleted` int(1) DEFAULT 0,
  `material_scrap_deleted_by` varchar(10) DEFAULT NULL,
  `material_scrap_deleted_date` datetime DEFAULT NULL,
  `material_scrap_shift` varchar(20) DEFAULT NULL,
  `material_scrap_date_created` datetime DEFAULT NULL,
  `material_scrap_date` date DEFAULT NULL,
  `material_scrap_created_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_scrap_receipt` */

DROP TABLE IF EXISTS `ps_scrap_receipt`;

CREATE TABLE `ps_scrap_receipt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_no` varchar(20) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `receipt_shift` varchar(5) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `receipt_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `receipt_comment` text DEFAULT NULL,
  `receipt_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2708 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ps_scrap_stage` */

DROP TABLE IF EXISTS `ps_scrap_stage`;

CREATE TABLE `ps_scrap_stage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `job_test_id` bigint(20) NOT NULL DEFAULT 0,
  `reason_id` int(11) DEFAULT NULL COMMENT 'table ps_stage_reason',
  `stage_id` int(11) DEFAULT NULL,
  `scrap_product_code` varchar(50) DEFAULT NULL,
  `scrap_reason_rework` text DEFAULT NULL,
  `scrap_note` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `scrap_trace_id` varchar(20) DEFAULT NULL,
  `scrap_width` decimal(18,4) DEFAULT NULL,
  `scrap_quantity` decimal(18,4) DEFAULT 0.0000,
  `scrap_uom` varchar(50) DEFAULT NULL,
  `scrap_created_by` varchar(200) DEFAULT NULL,
  `scrap_created_date` datetime DEFAULT NULL,
  `scrap_is_deleted` int(1) DEFAULT 0,
  `scrap_deleted_by` varchar(10) DEFAULT NULL,
  `scrap_deleted_date` datetime DEFAULT NULL,
  `scrap_is_printed` tinyint(2) DEFAULT 0,
  `scrap_is_reprinted` tinyint(2) DEFAULT 0,
  `scrap_shift` varchar(20) DEFAULT NULL,
  `scrap_date` date DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `scrap_weight` decimal(18,4) DEFAULT NULL,
  `scrap_material` int(1) DEFAULT 0,
  `scrap_material_id` int(1) NOT NULL DEFAULT 0,
  `scrap_material_redisual_id` int(1) NOT NULL DEFAULT 0,
  `id_error` bigint(20) DEFAULT NULL,
  `scrap_setup_process_material` varchar(50) DEFAULT NULL,
  `scrap_id_box_spout` bigint(20) DEFAULT NULL,
  `scrap_from_time` varchar(5) DEFAULT NULL,
  `scrap_to_time` varchar(5) DEFAULT NULL,
  `scrap_methyl_blue` tinyint(1) DEFAULT NULL,
  `scrap_bonding` tinyint(1) DEFAULT NULL,
  `scrap_machine_issue_note` text DEFAULT NULL,
  `scrap_spout_test` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `job_output` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=273347 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_scrap_stage_sub` */

DROP TABLE IF EXISTS `ps_scrap_stage_sub`;

CREATE TABLE `ps_scrap_stage_sub` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `in_put_id` bigint(20) DEFAULT NULL,
  `scrap_stage_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `reason_id` int(11) DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `scrap_product_code` varchar(50) DEFAULT NULL,
  `scrap_reason_rework` text DEFAULT NULL,
  `scrap_note` varchar(500) DEFAULT NULL,
  `in_trace_id` bigint(20) DEFAULT NULL,
  `scrap_trace_id` varchar(20) DEFAULT NULL,
  `scrap_width` decimal(18,4) DEFAULT NULL,
  `scrap_quantity` decimal(18,4) DEFAULT 0.0000,
  `scrap_uom` varchar(50) DEFAULT NULL,
  `scrap_created_by` varchar(200) DEFAULT NULL,
  `scrap_created_date` datetime DEFAULT NULL,
  `scrap_is_deleted` int(1) DEFAULT 0,
  `scrap_deleted_by` varchar(10) DEFAULT NULL,
  `scrap_deleted_date` datetime DEFAULT NULL,
  `scrap_is_printed` tinyint(2) DEFAULT 0,
  `scrap_is_reprinted` tinyint(2) DEFAULT 0,
  `scrap_shift` varchar(20) DEFAULT NULL,
  `scrap_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1890 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_shelf_life` */

DROP TABLE IF EXISTS `ps_shelf_life`;

CREATE TABLE `ps_shelf_life` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(50) DEFAULT NULL,
  `structure` varchar(500) DEFAULT NULL,
  `shelf_life_by_structure` int(1) DEFAULT 0,
  `shelf_life_by_month` int(1) DEFAULT 0,
  `shelf_life_by_date` int(1) DEFAULT 0,
  `is_active` int(1) DEFAULT 1,
  `display_order` int(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_shipping_mark` */

DROP TABLE IF EXISTS `ps_shipping_mark`;

CREATE TABLE `ps_shipping_mark` (
  `job_no` varchar(100) NOT NULL,
  `customer_on_label` text DEFAULT NULL,
  `po_no` text DEFAULT NULL,
  `shipping_mark` text DEFAULT NULL,
  PRIMARY KEY (`job_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Table structure for table `ps_stage` */

DROP TABLE IF EXISTS `ps_stage`;

CREATE TABLE `ps_stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage_name` varchar(500) DEFAULT NULL,
  `active` int(1) DEFAULT 1 COMMENT '1 active; 0 not inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_stage_error_identifier` */

DROP TABLE IF EXISTS `ps_stage_error_identifier`;

CREATE TABLE `ps_stage_error_identifier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_stage` varchar(250) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `active` int(1) DEFAULT 1 COMMENT '1 active; 0 not inactive',
  `machine_type` varchar(50) DEFAULT NULL,
  `reason_no_unicode` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_output` (`id_stage`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_stage_reason` */

DROP TABLE IF EXISTS `ps_stage_reason`;

CREATE TABLE `ps_stage_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason_code` varchar(50) NOT NULL DEFAULT '0',
  `id_stage` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `reason_no_unicode` text DEFAULT NULL,
  `active` int(1) DEFAULT 1 COMMENT '1 active; 0 not inactive',
  `machine_type` varchar(50) DEFAULT NULL,
  `is_join` int(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `job_output` (`id_stage`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_type_rework_extrusion` */

DROP TABLE IF EXISTS `ps_type_rework_extrusion`;

CREATE TABLE `ps_type_rework_extrusion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_stage` varchar(250) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `active` int(1) DEFAULT 1 COMMENT '1 active; 0 not inactive',
  `machine_type` varchar(50) DEFAULT NULL,
  `reason_no_unicode` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job_output` (`id_stage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `ps_warehouse_receipt` */

DROP TABLE IF EXISTS `ps_warehouse_receipt`;

CREATE TABLE `ps_warehouse_receipt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_no` varchar(50) DEFAULT NULL,
  `receipt_number` varchar(50) DEFAULT NULL COMMENT 'So phieu',
  `department` varchar(50) DEFAULT NULL,
  `receipt_shift` varchar(5) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `receipt_date` date DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0 COMMENT '1:Deleted 2:Unpallet',
  `deleted_by` varchar(10) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15104 DEFAULT CHARSET=utf8;

/*Table structure for table `ps_warehouse_receipt_detail` */

DROP TABLE IF EXISTS `ps_warehouse_receipt_detail`;

CREATE TABLE `ps_warehouse_receipt_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receipt_id` bigint(20) NOT NULL,
  `pallet_id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `material_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `machine_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `total_quantity` float(18,2) DEFAULT NULL,
  `wooden_pallet` int(1) DEFAULT NULL COMMENT 'Gỗ Old:2 New:1 Null: 0',
  `plastic_pallet` int(1) DEFAULT NULL COMMENT 'Nhựa Old:2 New:1 Null: 0',
  `lot_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_type` int(1) DEFAULT 0 COMMENT 'HangXuLy:3TraVe:2 TraKho:1 Null: 0',
  `out_connect_no` int(11) DEFAULT 0,
  `out_connect_no1` int(11) DEFAULT 0,
  `out_connect_no2` int(11) DEFAULT 0,
  `out_connect_no3` int(11) DEFAULT 0,
  `out_connect_no4` int(11) DEFAULT 0,
  `out_connect_no5` int(11) DEFAULT 0,
  `pallet_date` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `receipt_note` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `receipt_detail_date` date DEFAULT NULL,
  `is_deleted` int(1) DEFAULT 0 COMMENT '1:Deleted 2:Unpallet',
  `deleted_by` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_id` (`receipt_id`),
  KEY `pallet_id` (`pallet_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15069 DEFAULT CHARSET=utf8mb4;

/*Table structure for table `tbl_activities` */

DROP TABLE IF EXISTS `tbl_activities`;

CREATE TABLE `tbl_activities` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `recorded_time` datetime DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `item_id` int(20) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `activity_action` int(2) DEFAULT NULL,
  `machine_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1171 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=1247281 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_activity_extrusion` */

DROP TABLE IF EXISTS `tbl_activity_extrusion`;

CREATE TABLE `tbl_activity_extrusion` (
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
  `scenario` varchar(30) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_activity_lamination` */

DROP TABLE IF EXISTS `tbl_activity_lamination`;

CREATE TABLE `tbl_activity_lamination` (
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
  `scenario` varchar(30) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_activity_pouching` */

DROP TABLE IF EXISTS `tbl_activity_pouching`;

CREATE TABLE `tbl_activity_pouching` (
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
  `scenario` varchar(30) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_activity_press` */

DROP TABLE IF EXISTS `tbl_activity_press`;

CREATE TABLE `tbl_activity_press` (
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
  `scenario` varchar(30) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_activity_rewind` */

DROP TABLE IF EXISTS `tbl_activity_rewind`;

CREATE TABLE `tbl_activity_rewind` (
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
  `scenario` varchar(30) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_activity_rework` */

DROP TABLE IF EXISTS `tbl_activity_rework`;

CREATE TABLE `tbl_activity_rework` (
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
  `scenario` varchar(30) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_activity_slitting` */

DROP TABLE IF EXISTS `tbl_activity_slitting`;

CREATE TABLE `tbl_activity_slitting` (
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
  `scenario` varchar(30) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_activity_vfold` */

DROP TABLE IF EXISTS `tbl_activity_vfold`;

CREATE TABLE `tbl_activity_vfold` (
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
  `scenario` varchar(30) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_activity_wicketing` */

DROP TABLE IF EXISTS `tbl_activity_wicketing`;

CREATE TABLE `tbl_activity_wicketing` (
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
  `scenario` varchar(30) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `application` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_api_cache` */

DROP TABLE IF EXISTS `tbl_api_cache`;

CREATE TABLE `tbl_api_cache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` text DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_api_function` */

DROP TABLE IF EXISTS `tbl_api_function`;

CREATE TABLE `tbl_api_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_api_history` */

DROP TABLE IF EXISTS `tbl_api_history`;

CREATE TABLE `tbl_api_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `function_id` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `param` text DEFAULT NULL,
  `query` text DEFAULT NULL,
  `data_post` text DEFAULT NULL,
  `call_result` longtext DEFAULT NULL,
  `call_total` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_debug` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `function_id` (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=302747 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_api_param` */

DROP TABLE IF EXISTS `tbl_api_param`;

CREATE TABLE `tbl_api_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `function_id` int(11) DEFAULT NULL,
  `is_numeric` tinyint(2) DEFAULT 0,
  `is_required` tinyint(2) DEFAULT 0,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `function_id` (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_api_user_visible_column` */

DROP TABLE IF EXISTS `tbl_api_user_visible_column`;

CREATE TABLE `tbl_api_user_visible_column` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `work_center_code` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `is_visible` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_calculate_percentage` */

DROP TABLE IF EXISTS `tbl_calculate_percentage`;

CREATE TABLE `tbl_calculate_percentage` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `percentage` int(3) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_computer` */

DROP TABLE IF EXISTS `tbl_computer`;

CREATE TABLE `tbl_computer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mrms_id` int(11) DEFAULT NULL,
  `mrms_name` varchar(50) DEFAULT NULL,
  `nav_code` int(11) DEFAULT NULL,
  `nav_name` varchar(50) DEFAULT NULL,
  `layer_number` int(11) DEFAULT NULL,
  `deparment_id` int(11) DEFAULT NULL,
  `work_center_code` varchar(20) DEFAULT NULL,
  `nav_zebra_pinter` varchar(50) DEFAULT NULL,
  `printed_name` varchar(50) DEFAULT NULL,
  `path_file_record_value_scale` varchar(250) DEFAULT NULL,
  `file_record_value_scale` varchar(50) DEFAULT NULL,
  `switch_nav_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_computer_us` */

DROP TABLE IF EXISTS `tbl_computer_us`;

CREATE TABLE `tbl_computer_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mrms_id` int(11) DEFAULT NULL,
  `mrms_name` varchar(50) DEFAULT NULL,
  `nav_code` int(11) DEFAULT NULL,
  `nav_name` varchar(50) DEFAULT NULL,
  `layer_number` int(11) DEFAULT NULL,
  `deparment_id` int(11) DEFAULT NULL,
  `work_center_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nav_code` (`nav_code`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_configurations` */

DROP TABLE IF EXISTS `tbl_configurations`;

CREATE TABLE `tbl_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(150) DEFAULT NULL,
  `value` mediumtext DEFAULT NULL,
  `is_js` tinyint(2) DEFAULT 0,
  `description` varchar(500) DEFAULT NULL,
  `role_matrix` mediumtext DEFAULT NULL,
  `role_matrix_sftu` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_default_orders` */

DROP TABLE IF EXISTS `tbl_default_orders`;

CREATE TABLE `tbl_default_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'SFTU',
  `column_name` varchar(200) NOT NULL,
  `column_title` varchar(200) DEFAULT NULL,
  `unscheduled_checked` tinyint(1) DEFAULT 1,
  `scheduled_checked` tinyint(1) DEFAULT 1,
  `suspended_checked` tinyint(1) DEFAULT 0,
  `completed_checked` tinyint(1) DEFAULT 1,
  `unscheduled_order` int(10) DEFAULT 0,
  `scheduled_order` int(10) DEFAULT 0,
  `suspended_order` int(10) DEFAULT 0,
  `completed_order` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=555 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_emailtemplates` */

DROP TABLE IF EXISTS `tbl_emailtemplates`;

CREATE TABLE `tbl_emailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(250) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `email_content` mediumtext DEFAULT NULL,
  `name_queue` varchar(255) DEFAULT NULL,
  `is_displayed` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_erp_outsourcing_activities` */

DROP TABLE IF EXISTS `tbl_erp_outsourcing_activities`;

CREATE TABLE `tbl_erp_outsourcing_activities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `recorded_time` datetime NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `content` mediumtext DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_erp_outsourcing_jobs` */

DROP TABLE IF EXISTS `tbl_erp_outsourcing_jobs`;

CREATE TABLE `tbl_erp_outsourcing_jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_type` tinyint(1) DEFAULT 0,
  `prod_order_no` varchar(20) NOT NULL,
  `accredo_part_no` varchar(50) NOT NULL,
  `customer_part_no` varchar(50) DEFAULT NULL,
  `product_description` mediumtext DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `completed_date` datetime NOT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_erp_outsourcing_pallet_details` */

DROP TABLE IF EXISTS `tbl_erp_outsourcing_pallet_details`;

CREATE TABLE `tbl_erp_outsourcing_pallet_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pallet_id` int(20) NOT NULL,
  `trace_id` varchar(20) NOT NULL,
  `item_count` int(11) DEFAULT 0,
  `item_length` decimal(12,2) DEFAULT 0.00,
  `net_weight` decimal(12,2) DEFAULT 0.00,
  `gross_weight` decimal(12,2) DEFAULT 0.00,
  `created_date` datetime NOT NULL,
  `is_temp` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_erp_outsourcing_pallets` */

DROP TABLE IF EXISTS `tbl_erp_outsourcing_pallets`;

CREATE TABLE `tbl_erp_outsourcing_pallets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) NOT NULL,
  `pallet_no` int(11) NOT NULL,
  `pallet_weight` decimal(12,2) DEFAULT 0.00,
  `total_trace_id` int(11) NOT NULL DEFAULT 0,
  `total_count` decimal(12,2) DEFAULT 0.00,
  `total_length` decimal(12,2) DEFAULT 0.00,
  `total_net_weight` decimal(12,2) DEFAULT 0.00,
  `total_gross_weight` decimal(12,2) DEFAULT 0.00,
  `created_date` datetime DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT 0,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_erp_outsourcing_profiles` */

DROP TABLE IF EXISTS `tbl_erp_outsourcing_profiles`;

CREATE TABLE `tbl_erp_outsourcing_profiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `columns` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_estimate_date` */

DROP TABLE IF EXISTS `tbl_estimate_date`;

CREATE TABLE `tbl_estimate_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_center_code` varchar(20) DEFAULT NULL,
  `time_point` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_fgs` */

DROP TABLE IF EXISTS `tbl_fgs`;

CREATE TABLE `tbl_fgs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gos_id` int(11) DEFAULT NULL,
  `graphic_number` varchar(30) DEFAULT NULL,
  `art_description` varchar(500) DEFAULT NULL,
  `gos_json` text DEFAULT NULL,
  `assigned_user_id` int(11) DEFAULT NULL,
  `form_name` varchar(200) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `queue` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `accredo_part_number` varchar(100) DEFAULT NULL,
  `customer_part_number` varchar(50) DEFAULT NULL,
  `fgs_json` mediumtext DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `accredo_structure` varchar(300) DEFAULT NULL,
  `bill_to_cust` varchar(300) NOT NULL,
  `bill_to_cust_id` bigint(20) DEFAULT NULL,
  `id_accredo_number` varchar(5) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `customer_code` varchar(30) DEFAULT NULL,
  `bill_to_customer` varchar(30) DEFAULT NULL,
  `COA` tinyint(1) DEFAULT NULL,
  `assigned_csr` int(11) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `isupdated` tinyint(1) DEFAULT NULL,
  `trial` tinyint(1) DEFAULT NULL,
  `10_gos_status_date` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_fgsgr_gos` */

DROP TABLE IF EXISTS `tbl_fgsgr_gos`;

CREATE TABLE `tbl_fgsgr_gos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `graphic_number` varchar(30) DEFAULT NULL,
  `cloned_from` varchar(30) DEFAULT NULL,
  `customer` varchar(50) DEFAULT NULL,
  `customer_part` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `art_received_date` datetime DEFAULT NULL,
  `submitted_date` datetime DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  `json` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `approval_cost_date` datetime DEFAULT NULL,
  `edit_gos_come_up` tinyint(1) DEFAULT 1,
  `isupdated` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `graphic_number` (`graphic_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_film_consumption_activity` */

DROP TABLE IF EXISTS `tbl_film_consumption_activity`;

CREATE TABLE `tbl_film_consumption_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1 is posted success',
  `date_time` datetime DEFAULT NULL,
  `trace_id` varchar(15) DEFAULT NULL,
  `item_no` varchar(20) DEFAULT NULL,
  `film_width` varchar(25) DEFAULT NULL COMMENT 'also known as Variant Code',
  `machine_code` varchar(10) DEFAULT NULL,
  `operator_code` varchar(10) DEFAULT NULL,
  `current_bin_code` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34112 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_image_problem_report` */

DROP TABLE IF EXISTS `tbl_image_problem_report`;

CREATE TABLE `tbl_image_problem_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_problem_report` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `url_base64` longtext DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_job_detail` */

DROP TABLE IF EXISTS `tbl_job_detail`;

CREATE TABLE `tbl_job_detail` (
  `id` int(11) NOT NULL,
  `Prod_Order_No` varchar(20) DEFAULT NULL,
  `Prod_Order_Line_No` varchar(20) DEFAULT NULL,
  `Operation_No` varchar(20) DEFAULT NULL,
  `machine_type` varchar(50) DEFAULT NULL,
  `machine_center_code` varchar(50) DEFAULT NULL,
  `machine_center_name` varchar(50) DEFAULT NULL,
  `work_center_code` varchar(50) DEFAULT NULL,
  `step_width` varchar(20) DEFAULT '0',
  `order_no` int(11) DEFAULT NULL,
  `is_completed` varchar(2) DEFAULT '0',
  `is_suspended` varchar(2) DEFAULT '0',
  `is_disabled` varchar(2) DEFAULT '0',
  `is_art_approved` varchar(1) DEFAULT '0',
  `is_trial` varchar(2) DEFAULT NULL,
  `is_trial_approved` varchar(1) DEFAULT '0',
  `mounted` varchar(1) DEFAULT '0',
  `plate_status` varchar(2) DEFAULT '0',
  `trial_issues` text DEFAULT NULL,
  `art_issues` text DEFAULT NULL,
  `art_approved_date` varchar(20) DEFAULT NULL,
  `art_approved_by` varchar(11) DEFAULT NULL,
  `trial_approved_by` varchar(11) DEFAULT NULL,
  `trial_approved_date` varchar(2) DEFAULT NULL,
  `is_last_step` varchar(2) DEFAULT '0',
  `is_complete_approved` varchar(2) DEFAULT '0',
  `complete_approved_by` varchar(11) DEFAULT NULL,
  `complete_approved_date` varchar(20) DEFAULT NULL,
  `Combo_No` varchar(10) DEFAULT NULL,
  `press_art` varchar(25) DEFAULT 'NO APPROVAL',
  `last_order_no` varchar(11) DEFAULT NULL,
  `new_machine_center` varchar(50) DEFAULT NULL,
  `art_approved_by_api` varchar(11) DEFAULT NULL,
  `trial_approved_by_api` varchar(11) DEFAULT NULL,
  `sample_required` varchar(2) DEFAULT '0',
  `csr_required` varchar(2) DEFAULT '0',
  `csr_required_approved` varchar(2) DEFAULT '0',
  `csr_required_quantity` varchar(20) DEFAULT NULL,
  `csr_required_uom` varchar(50) DEFAULT NULL,
  `csr_required_dept` varchar(50) DEFAULT NULL,
  `csr_approved_by` varchar(11) DEFAULT NULL,
  `csr_approved_by_api` varchar(11) DEFAULT NULL,
  `csr_approved_date` varchar(20) DEFAULT NULL,
  `marketing_required` varchar(2) DEFAULT '0',
  `marketing_required_approved` varchar(2) DEFAULT '0',
  `marketing_required_quantity` varchar(20) DEFAULT NULL,
  `marketing_required_uom` varchar(50) DEFAULT NULL,
  `marketing_required_dept` varchar(50) DEFAULT NULL,
  `marketing_approved_by` varchar(11) DEFAULT NULL,
  `marketing_approved_by_api` varchar(11) DEFAULT NULL,
  `marketing_approved_date` varchar(20) DEFAULT NULL,
  `suspended_from` varchar(20) DEFAULT NULL,
  `suspended_by` varchar(8) DEFAULT NULL,
  `suspended_date` datetime DEFAULT NULL,
  `reschedule_to` varchar(20) DEFAULT NULL,
  `reschedule_issues` text DEFAULT NULL,
  `is_rescheduled` varchar(2) DEFAULT '0',
  `graphic_status` varchar(20) DEFAULT NULL,
  `is_restarted` varchar(2) DEFAULT '0',
  `created_date` varchar(20) DEFAULT NULL,
  `completed_from` varchar(20) DEFAULT NULL,
  `completed_by` varchar(8) DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `is_archived` varchar(4) DEFAULT '0',
  `archived_date` varchar(20) DEFAULT NULL,
  `Next_Operation_No` varchar(10) DEFAULT NULL,
  `Previous_to_Suspend_No` varchar(20) DEFAULT NULL,
  `SFT_Status` varchar(100) DEFAULT NULL,
  `Task_Status` varchar(100) DEFAULT NULL,
  `Fixed_Scrap_Quantity_FEET` varchar(20) DEFAULT NULL,
  `Fixed_Scrap_Quantity` varchar(20) DEFAULT NULL,
  `Scrap_Factor` varchar(20) DEFAULT NULL,
  `Input_Quantity_FEET` varchar(20) DEFAULT NULL,
  `Input_Quantity` varchar(20) DEFAULT NULL,
  `Output_Quantity` varchar(20) DEFAULT NULL,
  `Output_Quantity_FEET` varchar(20) DEFAULT NULL,
  `Expected_Capacity_Need_Mins` varchar(20) DEFAULT NULL,
  `Routing_Status` varchar(100) DEFAULT NULL,
  `Production_UOM` varchar(20) DEFAULT NULL,
  `Remaining_Quantity` varchar(20) DEFAULT NULL,
  `V2UOM_Remaining_Qty` varchar(20) DEFAULT NULL,
  `Quantity` varchar(50) DEFAULT NULL,
  `V2UOM_Quantity` varchar(20) DEFAULT NULL,
  `Trial` varchar(10) DEFAULT NULL,
  `Graphic_No` varchar(20) DEFAULT NULL,
  `Film_Structure` varchar(50) DEFAULT NULL,
  `Treat` varchar(10) DEFAULT NULL,
  `Hot_Job` varchar(10) DEFAULT NULL,
  `COA` varchar(10) DEFAULT NULL,
  `Gauge` varchar(10) DEFAULT NULL,
  `Web_Width` varchar(20) DEFAULT NULL,
  `Long_Description` varchar(250) DEFAULT NULL,
  `Customer_Part_No` varchar(50) DEFAULT NULL,
  `Accredo_Part_No` varchar(50) DEFAULT NULL,
  `Qty_Ordered` double DEFAULT NULL,
  `Qty_Ordered_UOM` varchar(20) DEFAULT NULL,
  `Folded_Width` varchar(20) DEFAULT NULL,
  `Folder_Wind` varchar(20) DEFAULT NULL,
  `VFold_Dusting` varchar(200) DEFAULT NULL,
  `VFold_Dusting_Perc` varchar(10) DEFAULT NULL,
  `Customer_Samples_Requested` varchar(10) DEFAULT NULL,
  `CSR_Quantity` varchar(10) DEFAULT NULL,
  `CSR_UOM` varchar(20) DEFAULT NULL,
  `CSR_Department` varchar(50) DEFAULT NULL,
  `Marketing_Samples_Requested` varchar(10) DEFAULT NULL,
  `MSR_Quantity` varchar(10) DEFAULT NULL,
  `MSR_UOM` varchar(20) DEFAULT NULL,
  `MSR_Department` varchar(50) DEFAULT NULL,
  `FGS_Syncronized` varchar(10) DEFAULT NULL,
  `Customer_PO_No` varchar(200) DEFAULT NULL,
  `Creation_Date` varchar(20) DEFAULT NULL,
  `Due_Date` varchar(20) DEFAULT NULL,
  `AuxiliaryIndex1` varchar(50) DEFAULT NULL,
  `AuxiliaryIndex2` varchar(50) DEFAULT NULL,
  `AuxiliaryIndex3` varchar(50) DEFAULT NULL,
  `AuxiliaryIndex4` varchar(10) DEFAULT NULL,
  `AuxiliaryIndex5` varchar(10) DEFAULT NULL,
  `AuxiliaryIndex6` varchar(50) DEFAULT NULL,
  `AuxiliaryIndex7` varchar(50) DEFAULT NULL,
  `AuxiliaryIndex8` varchar(10) DEFAULT NULL,
  `Type_FilterOnly` varchar(2) DEFAULT NULL,
  `Machine_Center_No_FilterOnly` varchar(2) DEFAULT NULL,
  `Work_Center_No_FilterOnly` varchar(2) DEFAULT NULL,
  `Previous_to_Suspend_No_Filter_FilterOnly` varchar(2) DEFAULT NULL,
  `job_id` varchar(10) DEFAULT NULL,
  `press_art_short` varchar(200) DEFAULT NULL,
  `last_status_time` varchar(20) DEFAULT NULL,
  `Production_Status_Code` varchar(10) DEFAULT NULL,
  `Production_Status` varchar(100) DEFAULT NULL,
  `Production_Moment` varchar(20) DEFAULT NULL,
  `Production_Status_Detail` varchar(100) DEFAULT NULL,
  `Required_Quantity` double DEFAULT NULL,
  `Est_Hours` varchar(20) DEFAULT NULL,
  `FT_Qty__Left_to_Make` double DEFAULT NULL,
  `info_separator` varchar(100) DEFAULT NULL,
  `info_contact` varchar(100) DEFAULT NULL,
  `row_class` varchar(100) DEFAULT NULL,
  `sample_required_qty` varchar(200) DEFAULT NULL,
  `sample_required_popup_title` varchar(200) DEFAULT NULL,
  `sample_required_approved` varchar(10) DEFAULT NULL,
  `Customer_Name` varchar(200) DEFAULT NULL,
  `Percent_Completed` varchar(50) DEFAULT NULL,
  `actions` varchar(2) DEFAULT NULL,
  `Actual_Output_Qty` varchar(10) DEFAULT NULL,
  `V2UOM_Actual_Qty` varchar(20) DEFAULT NULL,
  `GC` varchar(10) DEFAULT NULL,
  `Printed_Structure` varchar(100) DEFAULT NULL,
  `Printed_Rewind` varchar(10) DEFAULT NULL,
  `Printed_No_Across_FGS` varchar(10) DEFAULT NULL,
  `Printed_Around` varchar(10) DEFAULT NULL,
  `Printed_Repeat` varchar(10) DEFAULT NULL,
  `Printed_Color` varchar(10) DEFAULT NULL,
  `Printed_Sleeve` varchar(20) DEFAULT NULL,
  `Impression_per_Finished_Web` varchar(10) DEFAULT NULL,
  `gos_status_approved_files_date` varchar(20) DEFAULT NULL,
  `Prod_Order_Line` varchar(10) DEFAULT NULL,
  `Item_No` varchar(200) DEFAULT NULL,
  `Output_Width` varchar(20) DEFAULT NULL,
  `Prod_Target_Gauge` varchar(10) DEFAULT NULL,
  `Trim` varchar(10) DEFAULT NULL,
  `Treated` varchar(200) DEFAULT NULL,
  `Bubble_Width` double DEFAULT NULL,
  `FT_Total_Qty_to_Make` varchar(10) DEFAULT NULL,
  `No_of_Layers` varchar(10) DEFAULT NULL,
  `Code` varchar(20) DEFAULT NULL,
  `Color` varchar(200) DEFAULT NULL,
  `Treat_Target` varchar(50) DEFAULT NULL,
  `Treat_Range` varchar(50) DEFAULT NULL,
  `Lam_Top_Film_Type` varchar(200) DEFAULT NULL,
  `Lam_Top_Gauge` varchar(10) DEFAULT NULL,
  `Lam_Top_Width` varchar(20) DEFAULT NULL,
  `Lam_Middle_Web_Film_Type` varchar(200) DEFAULT NULL,
  `Lam_Middle_Web_Gauge` varchar(10) DEFAULT NULL,
  `Lam_Middle_Web_Width` varchar(20) DEFAULT NULL,
  `Lam_Back_Sheet_Film_Type` varchar(100) DEFAULT NULL,
  `Lam_Back_Sheet_Gauge` varchar(10) DEFAULT NULL,
  `Lam_Back_Sheet_Width` varchar(20) DEFAULT NULL,
  `Lam_Wind_1` varchar(200) DEFAULT NULL,
  `Lam_Wind_2` varchar(200) DEFAULT NULL,
  `Slitting_Width` varchar(20) DEFAULT NULL,
  `Slitting_AC` varchar(11) DEFAULT NULL,
  `Slitting_Wind` varchar(20) DEFAULT NULL,
  `Slitting_Dusting` varchar(20) DEFAULT NULL,
  `Slitting_Dusting_Perc` varchar(20) DEFAULT NULL,
  `Wckt_Lay_Flat_Width` varchar(20) DEFAULT NULL,
  `Wckt_Zipper` varchar(100) DEFAULT NULL,
  `Wckt_Location_from_top` varchar(200) DEFAULT NULL,
  `Wckt_Height_of_Bags` varchar(20) DEFAULT NULL,
  `Wckt_Width_of_Bags` varchar(20) DEFAULT NULL,
  `Wckt_Flip` varchar(20) DEFAULT NULL,
  `Wckt_Bottom_Gusset` varchar(20) DEFAULT NULL,
  `Wckt_Handle_Punch` varchar(10) DEFAULT NULL,
  `Wckt_Perforation` varchar(10) DEFAULT NULL,
  `Wckt_Perforation_Location` varchar(200) DEFAULT NULL,
  `Wckt_Venting` varchar(200) DEFAULT NULL,
  `Wckt_Venting_Location` varchar(200) DEFAULT NULL,
  `Wckt_Tie_Links` varchar(200) DEFAULT NULL,
  `Wckt_Tie_Links_Location` varchar(260) DEFAULT NULL,
  `Wckt_No_Of_Holes` varchar(20) DEFAULT NULL,
  `Wckt_Washer` varchar(100) DEFAULT NULL,
  `Wckt_Cards` varchar(50) DEFAULT NULL,
  `Wckt_Wicket` varchar(10) DEFAULT NULL,
  `Wckt_Wicket_Type` varchar(50) DEFAULT NULL,
  `Wckt_Wicket_Direction` varchar(50) DEFAULT NULL,
  `Wckt_Wicket_Width` varchar(20) DEFAULT NULL,
  `Wckt_Wicket_Length` varchar(20) DEFAULT NULL,
  `Wckt_Wicket_Item` varchar(50) DEFAULT NULL,
  `Wckt_Bags_per_Wicket` varchar(11) DEFAULT NULL,
  `Pouch_Height` varchar(20) DEFAULT NULL,
  `Pouch_Width` varchar(20) DEFAULT NULL,
  `Pouch_Bottom_Gusset` varchar(20) DEFAULT NULL,
  `Pouch_Wicket` varchar(200) DEFAULT NULL,
  `Pouch_Tear_Notch` varchar(200) DEFAULT NULL,
  `Pouch_Handle` varchar(200) DEFAULT NULL,
  `Pouch_Vent_Hole` varchar(200) DEFAULT NULL,
  `Pouch_Zipper` varchar(10) DEFAULT NULL,
  `Film_Type` varchar(200) DEFAULT NULL,
  `Combo_No2` varchar(10) DEFAULT NULL,
  `Combo_No_FilterOnly` varchar(2) DEFAULT NULL,
  `Prod_Order_No_F_FilterOnly` varchar(2) DEFAULT NULL,
  `Input_Quantity_UOM` varchar(200) DEFAULT NULL,
  `Routing_Steps` varchar(200) DEFAULT NULL,
  `Print_Colours` varchar(200) DEFAULT NULL,
  `FEET_Actual_Qty` varchar(20) DEFAULT NULL,
  `Last_Date_Modified` varchar(200) DEFAULT NULL,
  `Number_Across` varchar(20) DEFAULT NULL,
  `FT_Qty__Left_to_Make_Unit` varchar(200) DEFAULT NULL,
  `Qty_Ordered_Unit` varchar(200) DEFAULT NULL,
  `Required_Quantity_Unit` varchar(200) DEFAULT NULL,
  `Machine_Center_No2` varchar(20) DEFAULT NULL,
  `reopen_issues` varchar(200) DEFAULT NULL,
  `is_deleted` varchar(4) DEFAULT '0',
  `Production_Status_en` varchar(200) DEFAULT NULL,
  `Production_Status_vi` varchar(200) DEFAULT NULL,
  `hours_est` double DEFAULT 0,
  `Quantity_Run` varchar(20) DEFAULT NULL,
  `Last_Modified_Date` varchar(200) DEFAULT NULL,
  `Last_Modified_Time` varchar(200) DEFAULT NULL,
  `Last_Modified_Date_Filter_FilterOnly` varchar(200) DEFAULT NULL,
  `Last_Modified_Time_Filter_FilterOnly` varchar(200) DEFAULT NULL,
  `sample_required_detail_csr` varchar(200) DEFAULT NULL,
  `sample_required_detail_msr` varchar(200) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `is_splitter` tinyint(2) DEFAULT 0,
  `job_jacket` tinyint(2) DEFAULT 0,
  `Slitting_Laser_Vents` varchar(50) DEFAULT NULL,
  `plate_type` varchar(3) DEFAULT NULL,
  `break_in_fee` tinyint(4) DEFAULT 0,
  `Authorization_No` varchar(50) DEFAULT NULL,
  `instruction_to_operator` varchar(50) DEFAULT NULL,
  `Remaining_Qty_Base` varchar(2) DEFAULT NULL,
  `Line_No2` varchar(10) DEFAULT NULL,
  `Variant_Code` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Unit_of_Measure_Code` varchar(8) DEFAULT NULL,
  `Quantity_Base` varchar(14) DEFAULT NULL,
  `Job_Specification_No` varchar(28) DEFAULT NULL,
  `Printed_Across_No` varchar(2) DEFAULT NULL,
  `Slitting_Across_No` varchar(2) DEFAULT NULL,
  `Imp_Per_Finished_Web` varchar(2) DEFAULT NULL,
  `Line_No_FilterOnly` varchar(2) DEFAULT NULL,
  `FG_Lanes_Across` varchar(2) DEFAULT NULL,
  `Printed_Number_Across_FGS` varchar(2) DEFAULT NULL,
  `Finished_Quantity` varchar(8) DEFAULT NULL,
  `V2UOM_Finished_Qty` varchar(10) DEFAULT NULL,
  `schedule_color_icon` varchar(10) DEFAULT NULL,
  `schedule_color_note_id` int(11) DEFAULT 0,
  `is_created` tinyint(2) DEFAULT 0,
  `press_color_exactly` varchar(200) DEFAULT NULL,
  `press_color_1` varchar(100) DEFAULT NULL,
  `press_color_2` varchar(100) DEFAULT NULL,
  `press_color_3` varchar(100) DEFAULT NULL,
  `press_color_4` varchar(100) DEFAULT NULL,
  `press_color_5` varchar(100) DEFAULT NULL,
  `press_color_6` varchar(100) DEFAULT NULL,
  `press_color_7` varchar(100) DEFAULT NULL,
  `press_color_8` varchar(100) DEFAULT NULL,
  `press_color_9` varchar(100) DEFAULT NULL,
  `press_color_10` varchar(100) DEFAULT NULL,
  `film_staging` int(11) DEFAULT 0,
  `Rewinder_Wind` varchar(3) DEFAULT NULL,
  `mrms` varchar(3) DEFAULT NULL,
  `combo_ext` varchar(4) DEFAULT NULL,
  `press_cs_color_1` varchar(100) DEFAULT 'blank',
  `press_cs_color_2` varchar(100) DEFAULT 'blank',
  `press_cs_color_3` varchar(100) DEFAULT 'blank',
  `press_cs_color_4` varchar(100) DEFAULT 'blank',
  `press_cs_color_5` varchar(100) DEFAULT 'blank',
  `press_cs_color_6` varchar(100) DEFAULT 'blank',
  `press_cs_color_7` varchar(100) DEFAULT 'blank',
  `press_cs_color_8` varchar(100) DEFAULT 'blank',
  `press_cs_color_9` varchar(100) DEFAULT 'blank',
  `press_cs_color_10` varchar(100) DEFAULT 'blank',
  `press_cs_color_exactly` varchar(200) DEFAULT '__________, __________, __________, __________, __________, __________, __________, __________, __________, __________',
  `Lanes_Across` varchar(4) DEFAULT NULL,
  `Previous_Operation_No` varchar(5) DEFAULT NULL,
  `Pouch_Laser_Score` varchar(4) DEFAULT NULL,
  `Last_Modified_Date_Time` varchar(30) DEFAULT NULL,
  `Prod_Order_No_Operation_No` varchar(11) DEFAULT NULL,
  `Expected_Due_Date` varchar(22) DEFAULT NULL,
  `graphic_pdf` date DEFAULT NULL,
  `graphic_pdf_completed` tinyint(2) DEFAULT 0,
  `graphic_proof` date DEFAULT NULL,
  `graphic_proof_completed` tinyint(2) DEFAULT 0,
  `graphic_len_file` date DEFAULT NULL,
  `graphic_len_file_completed` tinyint(2) DEFAULT 0,
  `trial_type` varchar(10) DEFAULT NULL,
  `film_plan` varchar(20) DEFAULT NULL,
  `film_plan_data` varchar(20) DEFAULT NULL,
  `purple_line` varchar(4) DEFAULT NULL,
  `is_hold_trial` tinyint(1) DEFAULT 0,
  `hold_reason` varchar(500) DEFAULT 'hold_reason',
  `is_qc_trial` tinyint(1) DEFAULT 0,
  `qc_trial_by` int(11) DEFAULT NULL,
  `qc_trial_date` datetime DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `unhold_reason` varchar(500) DEFAULT 'unhold_reason',
  `Adj_Input_Qty_FEET` varchar(12) DEFAULT NULL,
  `Adj_Output_Qty_FEET` varchar(12) DEFAULT NULL,
  `Inno_Lok_Op_Ref_Link` varchar(5) DEFAULT NULL,
  `Is_Inno_Lok_Zipper` varchar(6) DEFAULT NULL,
  `Inno_Lok_UOM` varchar(8) DEFAULT NULL,
  `Inno_Lok_Zipper_Length` varchar(10) DEFAULT NULL,
  `Inno_Lok_Loc_from_top_of_Imp` varchar(6) DEFAULT NULL,
  `Inno_Lok_Loc_from_edge_of_Imp` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_completed` (`is_completed`),
  KEY `is_disabled` (`is_disabled`),
  KEY `machine_center_code` (`machine_center_code`),
  KEY `operation_no` (`Operation_No`),
  KEY `prod_order_no` (`Prod_Order_No`),
  KEY `work_center_no` (`work_center_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_job_detail_column` */

DROP TABLE IF EXISTS `tbl_job_detail_column`;

CREATE TABLE `tbl_job_detail_column` (
  `column_name` varchar(100) NOT NULL,
  `column_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_job_info` */

DROP TABLE IF EXISTS `tbl_job_info`;

CREATE TABLE `tbl_job_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) DEFAULT NULL,
  `prod_order_no` varchar(20) DEFAULT NULL,
  `prod_order_line_no` bigint(20) DEFAULT NULL,
  `operation_no` bigint(20) DEFAULT NULL,
  `machine_type` varchar(50) DEFAULT NULL,
  `machine_center_code` varchar(50) DEFAULT NULL,
  `machine_center_name` varchar(50) DEFAULT NULL,
  `work_center_code` varchar(50) DEFAULT NULL,
  `is_last_step` tinyint(1) DEFAULT 0,
  `step_width` float DEFAULT 0,
  `is_completed` tinyint(2) DEFAULT 0,
  `completed_from` varchar(20) DEFAULT NULL,
  `completed_by` varchar(8) DEFAULT NULL,
  `trial_issues` text DEFAULT NULL,
  `trial_approved_by` int(11) DEFAULT NULL,
  `trial_approved_by_api` int(11) DEFAULT NULL,
  `trial_approved_date` datetime DEFAULT NULL,
  `is_complete_approved` tinyint(1) DEFAULT 0,
  `complete_approved_by` int(11) DEFAULT NULL,
  `complete_approved_date` datetime DEFAULT NULL,
  `combo_no` varchar(20) DEFAULT '',
  `press_art` varchar(25) DEFAULT 'NO APPROVAL',
  `last_order_no` int(11) DEFAULT NULL,
  `new_machine_center` varchar(50) DEFAULT NULL,
  `sample_required` tinyint(1) DEFAULT 0,
  `csr_required` tinyint(1) DEFAULT 0,
  `csr_required_approved` tinyint(1) DEFAULT 0,
  `csr_required_quantity` double DEFAULT NULL,
  `csr_required_uom` varchar(50) DEFAULT NULL,
  `csr_required_dept` varchar(50) DEFAULT NULL,
  `csr_approved_by` int(11) DEFAULT NULL,
  `csr_approved_by_api` int(11) DEFAULT NULL,
  `csr_approved_date` datetime DEFAULT NULL,
  `marketing_required` tinyint(1) DEFAULT 0,
  `marketing_required_approved` tinyint(1) DEFAULT 0,
  `marketing_required_quantity` double DEFAULT NULL,
  `marketing_required_uom` varchar(50) DEFAULT NULL,
  `marketing_required_dept` varchar(50) DEFAULT NULL,
  `marketing_approved_by` int(11) DEFAULT NULL,
  `marketing_approved_by_api` int(11) DEFAULT NULL,
  `marketing_approved_date` datetime DEFAULT NULL,
  `is_rescheduled` int(2) DEFAULT 0,
  `reschedule_to` varchar(20) DEFAULT NULL,
  `reschedule_issues` text DEFAULT NULL,
  `suspended_date` datetime DEFAULT NULL,
  `is_disabled` tinyint(2) DEFAULT 0,
  `Task_Status` varchar(100) DEFAULT NULL,
  `reopen_issues` varchar(250) DEFAULT NULL,
  `graphic_status` varchar(20) DEFAULT NULL,
  `is_restarted` int(2) DEFAULT 0,
  `mounted` tinyint(1) DEFAULT 0,
  `plate_status` tinyint(2) DEFAULT 0,
  `completed_date` datetime DEFAULT NULL,
  `is_suspended` tinyint(2) DEFAULT 0,
  `is_art_approved` tinyint(1) DEFAULT 0,
  `art_approved_by` int(11) DEFAULT NULL,
  `art_approved_by_api` int(11) DEFAULT NULL,
  `art_issues` text DEFAULT NULL,
  `Accredo_Part_No` varchar(20) DEFAULT NULL,
  `is_archived` tinyint(4) DEFAULT 0,
  `archived_date` datetime DEFAULT NULL,
  `Customer_Name` varchar(200) DEFAULT NULL,
  `is_trial` tinyint(2) DEFAULT NULL,
  `is_trial_approved` tinyint(1) DEFAULT 0,
  `art_approved_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `suspended_from` varchar(20) DEFAULT NULL,
  `suspended_by` varchar(8) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `Production_Status_Code` varchar(10) DEFAULT NULL,
  `Production_Status_en` varchar(200) DEFAULT 'Ready',
  `Production_Status_vi` varchar(200) DEFAULT 'Ready',
  `hours_est` double DEFAULT 0,
  `note` varchar(250) DEFAULT NULL,
  `is_splitter` tinyint(2) DEFAULT 0,
  `job_jacket` tinyint(2) DEFAULT 0,
  `break_in_fee` tinyint(4) DEFAULT 0,
  `film_staging` int(11) DEFAULT 0,
  `graphic_pdf` date DEFAULT NULL,
  `graphic_pdf_completed` tinyint(2) DEFAULT 0,
  `graphic_proof` date DEFAULT NULL,
  `graphic_proof_completed` tinyint(2) DEFAULT 0,
  `graphic_len_file` date DEFAULT NULL,
  `graphic_len_file_completed` tinyint(2) DEFAULT 0,
  `film_plan` varchar(20) DEFAULT NULL,
  `film_plan_data` varchar(20) DEFAULT NULL,
  `purple_line` tinyint(4) DEFAULT 0,
  `is_hold_trial` tinyint(1) DEFAULT 0,
  `hold_reason` varchar(500) DEFAULT NULL,
  `unhold_reason` varchar(500) DEFAULT NULL,
  `is_qc_trial` tinyint(1) DEFAULT 0,
  `qc_trial_by` int(11) DEFAULT NULL,
  `qc_trial_date` datetime DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job` (`prod_order_no`,`operation_no`,`work_center_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1456 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_job_info_combo_detail` */

DROP TABLE IF EXISTS `tbl_job_info_combo_detail`;

CREATE TABLE `tbl_job_info_combo_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) NOT NULL,
  `combo_no` varchar(20) NOT NULL,
  `line_no` varchar(6) NOT NULL,
  `item_no` varchar(20) DEFAULT NULL,
  `variant_code` varchar(25) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `quantity_base` double DEFAULT NULL,
  `remaining_qty` double DEFAULT NULL,
  `remaining_qty_base` double DEFAULT NULL,
  `printed_across` int(11) DEFAULT NULL,
  `slitting_across` int(11) DEFAULT NULL,
  `mounted` tinyint(1) DEFAULT 0,
  `plate_status` tinyint(1) DEFAULT 0,
  `is_trial` tinyint(1) DEFAULT 0,
  `is_trial_approved` tinyint(1) DEFAULT 0,
  `trial_issues` text DEFAULT NULL,
  `trial_approved_by` int(11) DEFAULT NULL,
  `trial_approved_by_api` int(11) DEFAULT NULL,
  `trial_approved_date` datetime DEFAULT NULL,
  `press_art` varchar(25) DEFAULT 'NO APPROVAL',
  `is_art_approved` tinyint(1) DEFAULT 0,
  `art_approved_by` int(11) DEFAULT NULL,
  `art_approved_by_api` int(11) DEFAULT NULL,
  `art_approved_date` datetime DEFAULT NULL,
  `sample_required` tinyint(1) DEFAULT 0,
  `csr_required` tinyint(1) DEFAULT 0,
  `csr_required_approved` tinyint(1) DEFAULT 0,
  `csr_required_quantity` double DEFAULT NULL,
  `csr_required_uom` varchar(25) DEFAULT NULL,
  `csr_required_dept` varchar(25) DEFAULT NULL,
  `csr_approved_by` int(11) DEFAULT NULL,
  `csr_approved_by_api` int(11) DEFAULT NULL,
  `csr_approved_date` datetime DEFAULT NULL,
  `marketing_required` tinyint(1) DEFAULT 0,
  `marketing_required_approved` tinyint(1) DEFAULT 0,
  `marketing_required_quantity` double DEFAULT NULL,
  `marketing_required_uom` varchar(25) DEFAULT NULL,
  `marketing_required_dept` varchar(25) DEFAULT NULL,
  `marketing_approved_by` int(11) DEFAULT NULL,
  `marketing_approved_by_api` int(11) DEFAULT NULL,
  `marketing_approved_date` datetime DEFAULT NULL,
  `art_issues` text DEFAULT NULL,
  `graphic_status` varchar(20) DEFAULT NULL,
  `Customer_Name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`job_id`,`combo_no`,`line_no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_job_rework` */

DROP TABLE IF EXISTS `tbl_job_rework`;

CREATE TABLE `tbl_job_rework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 for unactivated/deleted, 1 for activated & scheduled, 2 for unscheduled',
  `work_center_code` varchar(20) DEFAULT NULL,
  `machine_code` varchar(10) DEFAULT NULL,
  `pallet_number` varchar(10) DEFAULT NULL,
  `job_number` varchar(10) DEFAULT NULL,
  `accredo_part_number` varchar(15) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ccts_number` varchar(15) DEFAULT NULL,
  `ncts_number` varchar(15) DEFAULT NULL,
  `trace_id_number` text DEFAULT NULL COMMENT 'json string for trace id and status of it',
  `step` varchar(15) DEFAULT NULL,
  `step_width` float DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `is_approved` tinyint(4) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_name` varchar(100) DEFAULT NULL,
  `last_machine_code` varchar(10) DEFAULT NULL,
  `last_order_no` int(11) DEFAULT NULL,
  `graphic_no` varchar(100) DEFAULT NULL,
  `customer_po_no` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_only_rewind_type` tinyint(5) DEFAULT NULL,
  `is_combine_type` tinyint(5) DEFAULT NULL,
  `is_others_type` tinyint(5) DEFAULT NULL,
  `instruction` varchar(500) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `ticket_no` varchar(150) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_label_correction` */

DROP TABLE IF EXISTS `tbl_label_correction`;

CREATE TABLE `tbl_label_correction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `job_rework_id` bigint(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `number_label` int(11) DEFAULT NULL,
  `request_number` varchar(10) DEFAULT NULL,
  `operator_comment` text DEFAULT NULL,
  `correction_comment` text DEFAULT NULL,
  `requested_machine` varchar(10) DEFAULT NULL,
  `requested_by` varchar(25) DEFAULT NULL,
  `requested_date` datetime DEFAULT NULL,
  `corrected_by` varchar(25) DEFAULT NULL,
  `corrected_date` datetime DEFAULT NULL,
  `completed_by` varchar(25) DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `archived_by` varchar(25) DEFAULT NULL,
  `archived_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Label correction for job';

/*Table structure for table `tbl_label_correction_detail` */

DROP TABLE IF EXISTS `tbl_label_correction_detail`;

CREATE TABLE `tbl_label_correction_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label_request_id` int(11) DEFAULT NULL,
  `ir_number` varchar(12) DEFAULT NULL,
  `trace_id` varchar(12) DEFAULT NULL,
  `correct_type` tinyint(1) DEFAULT NULL,
  `gross_lbs` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_lc_detail` */

DROP TABLE IF EXISTS `tbl_lc_detail`;

CREATE TABLE `tbl_lc_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(10) NOT NULL,
  `trace_id` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `weight` float DEFAULT NULL,
  `lc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_login_history` */

DROP TABLE IF EXISTS `tbl_login_history`;

CREATE TABLE `tbl_login_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_code` varchar(20) DEFAULT NULL,
  `shift_code` varchar(20) DEFAULT NULL,
  `status` tinyint(2) DEFAULT 1,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `device_list` text DEFAULT NULL,
  `machine_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login_code` (`login_code`),
  KEY `shift_code` (`shift_code`),
  KEY `in_time` (`in_time`),
  KEY `out_time` (`out_time`),
  KEY `machine_code` (`machine_code`),
  FULLTEXT KEY `device_list` (`device_list`)
) ENGINE=InnoDB AUTO_INCREMENT=148277 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_maillog` */

DROP TABLE IF EXISTS `tbl_maillog`;

CREATE TABLE `tbl_maillog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `order_no` varchar(20) DEFAULT '0',
  `subject` varchar(500) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `mail_to` text DEFAULT NULL,
  `mail_cc` text DEFAULT NULL,
  `mail_bcc` text DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `is_done` tinyint(2) DEFAULT NULL,
  `status_value` varchar(500) DEFAULT 'Pending',
  `date_done` datetime DEFAULT NULL,
  `prod_order_no` varchar(255) DEFAULT NULL,
  `attachment_file` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64302 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_material_note` */

DROP TABLE IF EXISTS `tbl_material_note`;

CREATE TABLE `tbl_material_note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note_userid` int(11) NOT NULL,
  `note_username` varchar(50) CHARACTER SET latin1 NOT NULL,
  `note_useremail` varchar(100) CHARACTER SET latin1 NOT NULL,
  `note_ls_userid` int(11) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `notes` text CHARACTER SET latin1 DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `temp_key` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `mrms_note_id` bigint(20) DEFAULT NULL,
  `external_system` varchar(10) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_material_request` */

DROP TABLE IF EXISTS `tbl_material_request`;

CREATE TABLE `tbl_material_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `statusid` int(11) DEFAULT NULL,
  `mread` int(2) NOT NULL DEFAULT 0,
  `uread` int(2) NOT NULL DEFAULT 0,
  `computerid` int(11) NOT NULL,
  `requestby` varchar(250) CHARACTER SET latin1 NOT NULL,
  `requestnumber` int(11) NOT NULL DEFAULT 0,
  `jobnumber` varchar(250) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `material_needed` tinyint(1) DEFAULT NULL,
  `structure` text CHARACTER SET latin1 DEFAULT NULL,
  `substitute` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `other` text CHARACTER SET latin1 DEFAULT NULL,
  `itemnumber` varchar(250) CHARACTER SET latin1 NOT NULL,
  `qty` varchar(100) CHARACTER SET latin1 NOT NULL,
  `uom` varchar(20) CHARACTER SET latin1 NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `req_completed` tinyint(1) DEFAULT NULL,
  `completed_by` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `checkupdate` int(2) DEFAULT NULL,
  `mrms_request_id` bigint(20) DEFAULT NULL,
  `external_system` varchar(10) DEFAULT NULL,
  `trace_id` varchar(10) DEFAULT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `nav_message` int(11) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `item_code` varchar(100) DEFAULT NULL,
  `item_width` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_material_return` */

DROP TABLE IF EXISTS `tbl_material_return`;

CREATE TABLE `tbl_material_return` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `input_trace_id` varchar(20) DEFAULT NULL,
  `item_no` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `input_qty_lbs` double DEFAULT NULL,
  `input_qty_feet` double DEFAULT NULL,
  `prod_order_no` varchar(20) DEFAULT NULL,
  `prod_order_line_no` varchar(20) DEFAULT NULL,
  `operation_no` varchar(20) DEFAULT NULL,
  `machine_center_code` varchar(20) DEFAULT NULL,
  `is_return` tinyint(4) DEFAULT 0,
  `trace_id` varchar(20) DEFAULT NULL,
  `sft_message` bigint(20) DEFAULT NULL,
  `sft_message_delete` bigint(20) DEFAULT NULL,
  `return_qty_lbs` double DEFAULT NULL,
  `return_qty_feet` double DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_message_problem_report` */

DROP TABLE IF EXISTS `tbl_message_problem_report`;

CREATE TABLE `tbl_message_problem_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_message_report` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `is_done` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `msg_by` int(11) DEFAULT NULL,
  `msg_by_api` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_mrms_order` */

DROP TABLE IF EXISTS `tbl_mrms_order`;

CREATE TABLE `tbl_mrms_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_order_no` varchar(6) NOT NULL,
  `accredo_part_number` varchar(20) DEFAULT NULL,
  `material_desc` varchar(200) NOT NULL,
  `requested_by` varchar(100) NOT NULL,
  `material_needed` tinyint(1) NOT NULL,
  `structure` mediumtext DEFAULT NULL,
  `substitute` varchar(200) DEFAULT NULL,
  `other` mediumtext DEFAULT NULL,
  `qty` double NOT NULL,
  `uom` varchar(20) DEFAULT NULL,
  `delivery_to` varchar(50) NOT NULL,
  `mrms_request_id` int(11) NOT NULL,
  `request_number` int(11) NOT NULL,
  `machine_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `req_completed` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `completed_by` varchar(50) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`prod_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_notes` */

DROP TABLE IF EXISTS `tbl_notes`;

CREATE TABLE `tbl_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `rework_job_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `prod_order_no` varchar(10) DEFAULT NULL,
  `combo_no` varchar(10) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_operation_code` */

DROP TABLE IF EXISTS `tbl_operation_code`;

CREATE TABLE `tbl_operation_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(10) NOT NULL,
  `code` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `movement` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_overwritten_job` */

DROP TABLE IF EXISTS `tbl_overwritten_job`;

CREATE TABLE `tbl_overwritten_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prod_order_no` varchar(10) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `activity_type` varchar(50) NOT NULL,
  `trace_id` varchar(10) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `job_id` bigint(20) NOT NULL,
  `combo_id` int(11) DEFAULT NULL,
  `work_center_code` varchar(20) NOT NULL,
  `machine_center_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378782 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_palletized_trace_id` */

DROP TABLE IF EXISTS `tbl_palletized_trace_id`;

CREATE TABLE `tbl_palletized_trace_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace_id` varchar(10) DEFAULT NULL,
  `lp_number` varchar(20) DEFAULT NULL,
  `pallet_status` tinyint(1) DEFAULT 0 COMMENT '0 is Opened, 1 is Released',
  `date_time` datetime DEFAULT NULL,
  `sft_message_id` bigint(20) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `job_rework_id` int(11) DEFAULT NULL,
  `trace_id_deleted` tinyint(1) DEFAULT 0 COMMENT 'check if the trace id in the license pallet has been deleted',
  `trace_id_deleted_date` datetime DEFAULT NULL,
  `lp_deleted` tinyint(1) DEFAULT 0 COMMENT 'check if the license pallet has been deleted',
  `lp_deleted_date` datetime DEFAULT NULL,
  `prod_order_no` varchar(10) DEFAULT NULL,
  `work_center_code` varchar(15) DEFAULT NULL,
  `machine_center_code` varchar(15) DEFAULT NULL,
  `is_pending_pallet` tinyint(1) DEFAULT 0,
  `combo_id` int(11) DEFAULT NULL,
  `rework_ticket` varchar(50) DEFAULT NULL,
  `is_printed` tinyint(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `removeTraceFromPallet` (`trace_id`,`trace_id_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=323895 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_print_label` */

DROP TABLE IF EXISTS `tbl_print_label`;

CREATE TABLE `tbl_print_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sft_message_no` int(11) DEFAULT NULL,
  `label_count` smallint(2) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=512018 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_problem_report` */

DROP TABLE IF EXISTS `tbl_problem_report`;

CREATE TABLE `tbl_problem_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT 1,
  `job_id` bigint(20) DEFAULT NULL,
  `machine_center_code` varchar(15) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  `type_report` varchar(10) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `error_msg` varchar(500) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `data_post` text DEFAULT NULL,
  `result_data` text DEFAULT NULL,
  `operator_report` varchar(500) DEFAULT NULL,
  `operator_code` varchar(10) DEFAULT NULL,
  `type_error` varchar(255) DEFAULT NULL,
  `is_done` tinyint(2) DEFAULT 0,
  `support_by` int(11) DEFAULT NULL,
  `support_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14355 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_production_input` */

DROP TABLE IF EXISTS `tbl_production_input`;

CREATE TABLE `tbl_production_input` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `sft_message_id` int(11) DEFAULT NULL,
  `trace_id` bigint(20) DEFAULT NULL,
  `item_no` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `variant_code` varchar(20) DEFAULT NULL,
  `item_qty` decimal(10,2) DEFAULT NULL,
  `uom_code` varchar(10) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `v2_uom_code` varchar(10) DEFAULT NULL,
  `v2_quantity` decimal(10,2) DEFAULT NULL,
  `set_no` tinyint(2) DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  `is_wip` tinyint(1) DEFAULT 0,
  `is_reserved` tinyint(1) DEFAULT 0,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_setup_roll` tinyint(2) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `is_passed_produce` tinyint(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  KEY `status` (`status`),
  KEY `CheckInputWIPTraceID` (`status`,`trace_id`),
  KEY `GetInfoByTraceID` (`job_id`,`trace_id`),
  KEY `GetNewestWIPTraceID` (`job_id`,`status`,`is_wip`),
  KEY `totalInput` (`job_id`,`status`,`variant_code`)
) ENGINE=InnoDB AUTO_INCREMENT=59295 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_production_input_new_item_added` */

DROP TABLE IF EXISTS `tbl_production_input_new_item_added`;

CREATE TABLE `tbl_production_input_new_item_added` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `combo_id` int(11) DEFAULT NULL,
  `prod_order_no` varchar(10) DEFAULT NULL,
  `work_center_code` varchar(20) DEFAULT NULL,
  `machine_center_code` varchar(10) DEFAULT NULL,
  `trace_id` varchar(10) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_production_input_wip` */

DROP TABLE IF EXISTS `tbl_production_input_wip`;

CREATE TABLE `tbl_production_input_wip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace_id` varchar(15) DEFAULT NULL,
  `prev_operation_no` varchar(3) DEFAULT NULL,
  `prev_operation_name` varchar(50) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT 0,
  `prev_trace_id` varchar(20) DEFAULT NULL,
  `prev_job_id` bigint(20) DEFAULT NULL,
  `item_no` varchar(50) DEFAULT NULL,
  `impression_per_finish_web` int(11) DEFAULT NULL,
  `film_roll_count` int(11) DEFAULT NULL,
  `film_roll_width` decimal(10,2) DEFAULT NULL,
  `film_roll_gauge` decimal(10,2) DEFAULT NULL,
  `ft_qty` decimal(15,2) DEFAULT NULL,
  `lbs_qty` decimal(15,2) DEFAULT NULL COMMENT 'net lbs qty',
  `gross_lbs_qty` decimal(15,2) DEFAULT NULL,
  `core` varchar(5) DEFAULT NULL,
  `zone_code` varchar(10) DEFAULT NULL,
  `lot_test_quality` varchar(15) DEFAULT NULL,
  `lot_certificate_number` varchar(15) DEFAULT NULL,
  `lot_blocked` tinyint(1) DEFAULT 0,
  `created_date` datetime DEFAULT NULL,
  `selected_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `SyncWIPList` (`trace_id`,`job_id`),
  KEY `is_used` (`is_used`)
) ENGINE=InnoDB AUTO_INCREMENT=55761 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_production_output_roll` */

DROP TABLE IF EXISTS `tbl_production_output_roll`;

CREATE TABLE `tbl_production_output_roll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `combo_id` bigint(20) DEFAULT NULL,
  `job_rework_id` bigint(20) DEFAULT NULL,
  `roll_number` int(11) DEFAULT NULL COMMENT 'Roll number',
  `trace_id_nav` int(11) DEFAULT NULL,
  `trace_id_input` bigint(20) DEFAULT NULL,
  `trace_id_input_wip` bigint(20) DEFAULT NULL,
  `item_no` varchar(20) DEFAULT NULL,
  `return_value_nav` bigint(20) DEFAULT NULL,
  `set_no` int(11) DEFAULT NULL,
  `actual_weight` decimal(12,2) DEFAULT NULL,
  `qty_feet` decimal(12,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `qty_imp` float(10,0) DEFAULT NULL,
  `action_mod` int(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `date_submit` datetime DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) DEFAULT NULL,
  `winder` varchar(20) DEFAULT NULL,
  `lane` int(11) DEFAULT NULL,
  `id_input_roll` int(11) DEFAULT NULL,
  `extrusion_item_index` varchar(15) DEFAULT NULL,
  `extrusion_latest_deleted_lane` int(11) DEFAULT NULL,
  `net_weight` decimal(12,2) DEFAULT NULL,
  `reason_delete` mediumtext DEFAULT NULL,
  `net_feet` decimal(12,2) DEFAULT NULL,
  `lami_roll_group` varchar(200) DEFAULT NULL,
  `job_combo` int(5) DEFAULT NULL,
  `total_bag` int(11) DEFAULT NULL,
  `is_marked_rework` tinyint(1) DEFAULT 0,
  `instruction` varchar(500) DEFAULT NULL,
  `is_created_rework` tinyint(2) DEFAULT 0,
  `trace_id_combine` varchar(150) DEFAULT NULL,
  `type_rework` varchar(50) DEFAULT NULL,
  `value_wip_zone` varchar(20) DEFAULT NULL,
  `core_type` varchar(50) DEFAULT NULL,
  `core_length` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `trace_id` (`trace_id_input`),
  KEY `combo_id` (`combo_id`),
  KEY `item_no` (`item_no`),
  KEY `job_id` (`job_id`),
  KEY `CheckCurrentInput` (`job_id`,`combo_id`,`trace_id_input`,`status`),
  KEY `CheckInputWIPTraceID` (`trace_id_input`,`trace_id_input_wip`,`status`),
  KEY `GetListPouchingOutput` (`job_id`,`status`,`action_mod`),
  KEY `GetListOutputRoll` (`job_id`,`combo_id`,`trace_id_input`,`trace_id_input_wip`,`item_no`,`status`),
  KEY `GetListOutputRoll_Rework` (`job_rework_id`,`trace_id_input`,`trace_id_input_wip`,`status`),
  KEY `validateStatus` (`job_rework_id`,`status`),
  KEY `checkProduceAllTraceID` (`job_rework_id`,`trace_id_input`,`status`),
  KEY `trace_id_input_wip` (`trace_id_input_wip`)
) ENGINE=InnoDB AUTO_INCREMENT=386331 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_production_resin` */

DROP TABLE IF EXISTS `tbl_production_resin`;

CREATE TABLE `tbl_production_resin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_order_no` bigint(11) DEFAULT NULL,
  `trace_id` varchar(150) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_production_scraps` */

DROP TABLE IF EXISTS `tbl_production_scraps`;

CREATE TABLE `tbl_production_scraps` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT 0,
  `weight_lbs` double(10,2) DEFAULT NULL,
  `recycle` tinyint(1) DEFAULT 0,
  `comment` varchar(80) DEFAULT NULL,
  `scrap_code` varchar(20) DEFAULT NULL,
  `sft_message_id` bigint(20) DEFAULT NULL,
  `apply_message_id` bigint(20) DEFAULT NULL,
  `print_label_a` int(11) DEFAULT 0,
  `job_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(100) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_by` varchar(100) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `net_weight` double(10,2) DEFAULT NULL,
  `job_rework_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5317 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_production_status` */

DROP TABLE IF EXISTS `tbl_production_status`;

CREATE TABLE `tbl_production_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT 0,
  `status_code` varchar(15) DEFAULT NULL,
  `comment` text CHARACTER SET latin1 DEFAULT NULL,
  `grid_prod_status` varchar(50) DEFAULT NULL,
  `real_time` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0,
  `deleted_by` varchar(50) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `sft_message_id` bigint(20) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `job_rework_id` bigint(20) DEFAULT NULL,
  `external_system` varchar(20) DEFAULT 'SFT',
  PRIMARY KEY (`id`),
  KEY `checkExistSetupCode` (`status`,`status_code`,`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17883 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_production_status_codes` */

DROP TABLE IF EXISTS `tbl_production_status_codes`;

CREATE TABLE `tbl_production_status_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(10) NOT NULL DEFAULT 'EXTRUSION',
  `code` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `description_vi` varchar(200) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `movement` varchar(15) DEFAULT NULL,
  `frequently_used` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `confirm_required` tinyint(1) DEFAULT 0,
  `manager_authorization` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_profile_columns` */

DROP TABLE IF EXISTS `tbl_profile_columns`;

CREATE TABLE `tbl_profile_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `columns` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_quarantine` */

DROP TABLE IF EXISTS `tbl_quarantine`;

CREATE TABLE `tbl_quarantine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ncts_number` varchar(20) NOT NULL,
  `trace_id` varchar(20) NOT NULL,
  `test_quality` tinyint(4) NOT NULL,
  `blocked` tinyint(4) NOT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `combo_id` bigint(20) DEFAULT NULL,
  `job_rework_id` bigint(20) DEFAULT NULL,
  `job_number` varchar(10) DEFAULT NULL,
  `accredo_part_number` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_recycle` */

DROP TABLE IF EXISTS `tbl_recycle`;

CREATE TABLE `tbl_recycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace_id` varchar(20) DEFAULT NULL,
  `machine_center_code` varchar(20) DEFAULT NULL,
  `resin_type` tinyint(4) DEFAULT NULL,
  `gross_qty` double DEFAULT NULL,
  `net_qty` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_name` varchar(100) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_name` varchar(100) DEFAULT NULL,
  `sft_message_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trace_id` (`trace_id`),
  KEY `machine_center_code` (`machine_center_code`),
  KEY `created_by` (`created_by`),
  KEY `deleted_by` (`deleted_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_recycle_history` */

DROP TABLE IF EXISTS `tbl_recycle_history`;

CREATE TABLE `tbl_recycle_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace_id` mediumtext DEFAULT NULL,
  `login_history_id` bigint(20) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `machine_center_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login_history_id` (`login_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_role_group` */

DROP TABLE IF EXISTS `tbl_role_group`;

CREATE TABLE `tbl_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `level` int(11) DEFAULT 1,
  `order_number` int(11) DEFAULT NULL,
  `is_global` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_role_group_matrix` */

DROP TABLE IF EXISTS `tbl_role_group_matrix`;

CREATE TABLE `tbl_role_group_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `group_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_role_mail_matrix` */

DROP TABLE IF EXISTS `tbl_role_mail_matrix`;

CREATE TABLE `tbl_role_mail_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `sftu_role_short_name` varchar(500) DEFAULT NULL,
  `trialdashboard_role_short_name` varchar(500) DEFAULT NULL,
  `erpsupport_role_short_name` varchar(500) DEFAULT NULL,
  `user_emails` text DEFAULT NULL,
  `user_emails_cc` text DEFAULT NULL,
  `user_emails_bcc` text DEFAULT NULL,
  `user_emails_exception` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_role_matrix` */

DROP TABLE IF EXISTS `tbl_role_matrix`;

CREATE TABLE `tbl_role_matrix` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` text DEFAULT NULL,
  `role_short_name` text DEFAULT NULL,
  `related_config` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_role_matrix_compare` */

DROP TABLE IF EXISTS `tbl_role_matrix_compare`;

CREATE TABLE `tbl_role_matrix_compare` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `role_short_name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_role_matrix_erp_outsourcing` */

DROP TABLE IF EXISTS `tbl_role_matrix_erp_outsourcing`;

CREATE TABLE `tbl_role_matrix_erp_outsourcing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_role_matrix_erp_support` */

DROP TABLE IF EXISTS `tbl_role_matrix_erp_support`;

CREATE TABLE `tbl_role_matrix_erp_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_role_matrix_sftu` */

DROP TABLE IF EXISTS `tbl_role_matrix_sftu`;

CREATE TABLE `tbl_role_matrix_sftu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` text DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `related_config` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_role_matrix_trial_dashboard` */

DROP TABLE IF EXISTS `tbl_role_matrix_trial_dashboard`;

CREATE TABLE `tbl_role_matrix_trial_dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_role_permission` */

DROP TABLE IF EXISTS `tbl_role_permission`;

CREATE TABLE `tbl_role_permission` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `operation` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `need_approval` tinyint(1) DEFAULT 0,
  `admin_approval` tinyint(1) DEFAULT 0,
  `manager_approval` tinyint(1) DEFAULT 0,
  `lead_approval` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_roles_sft` */

DROP TABLE IF EXISTS `tbl_roles_sft`;

CREATE TABLE `tbl_roles_sft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `is_sft_read_only` tinyint(2) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_scrap_codes` */

DROP TABLE IF EXISTS `tbl_scrap_codes`;

CREATE TABLE `tbl_scrap_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `description_vi` varchar(200) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `labor_type` varchar(50) DEFAULT NULL,
  `frequenly_used` tinyint(1) DEFAULT 0,
  `key` varchar(10) DEFAULT 'EXTRUSION',
  `status` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_shipment_lps` */

DROP TABLE IF EXISTS `tbl_shipment_lps`;

CREATE TABLE `tbl_shipment_lps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Shipment_No` varchar(10) DEFAULT NULL,
  `No` varchar(10) DEFAULT NULL,
  `Item_No` varchar(50) DEFAULT NULL,
  `Lot_No` varchar(50) DEFAULT NULL,
  `Quantity_Base` decimal(12,2) DEFAULT 0.00,
  `V2UOM_Quantity` decimal(12,2) DEFAULT 0.00,
  `AuxiliaryIndex1` varchar(50) DEFAULT NULL,
  `AuxiliaryIndex2` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `is_sync` tinyint(1) DEFAULT 1,
  `Shipment_Net_Weight` decimal(12,2) DEFAULT 0.00,
  `Shipment_Gross_Weight` decimal(12,2) DEFAULT 0.00,
  `Gross_Weight` decimal(12,2) DEFAULT 0.00,
  `job_id` bigint(20) DEFAULT -1,
  `Prod_Order_No` varchar(20) DEFAULT '',
  `width` decimal(12,2) DEFAULT 0.00,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=324745 DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_shipment_lps_20220507` */

DROP TABLE IF EXISTS `tbl_shipment_lps_20220507`;

CREATE TABLE `tbl_shipment_lps_20220507` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Shipment_No` varchar(10) DEFAULT NULL,
  `No` varchar(10) DEFAULT NULL,
  `Item_No` varchar(50) DEFAULT NULL,
  `Lot_No` varchar(50) DEFAULT NULL,
  `Quantity_Base` decimal(12,2) DEFAULT 0.00,
  `V2UOM_Quantity` decimal(12,2) DEFAULT 0.00,
  `AuxiliaryIndex1` varchar(50) DEFAULT NULL,
  `AuxiliaryIndex2` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `is_sync` tinyint(1) DEFAULT 1,
  `Shipment_Net_Weight` decimal(12,2) DEFAULT 0.00,
  `Shipment_Gross_Weight` decimal(12,2) DEFAULT 0.00,
  `Gross_Weight` decimal(12,2) DEFAULT 0.00,
  `job_id` bigint(20) DEFAULT -1,
  `Prod_Order_No` varchar(20) DEFAULT '',
  `width` decimal(12,2) DEFAULT 0.00,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212770 DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_suspended_job` */

DROP TABLE IF EXISTS `tbl_suspended_job`;

CREATE TABLE `tbl_suspended_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `js_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_sync_history` */

DROP TABLE IF EXISTS `tbl_sync_history`;

CREATE TABLE `tbl_sync_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid` varchar(100) DEFAULT NULL,
  `last_sync_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_temp_product_status` */

DROP TABLE IF EXISTS `tbl_temp_product_status`;

CREATE TABLE `tbl_temp_product_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_order_no` int(11) DEFAULT NULL,
  `product_status` int(11) DEFAULT NULL,
  `actived` int(11) DEFAULT NULL,
  `pro_order_line_no` int(11) DEFAULT NULL,
  `operate_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_trial_job_attachments` */

DROP TABLE IF EXISTS `tbl_trial_job_attachments`;

CREATE TABLE `tbl_trial_job_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_order_no` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `file_name` varchar(100) DEFAULT NULL,
  `file_type` varchar(10) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `uploaded_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_trial_job_notes` */

DROP TABLE IF EXISTS `tbl_trial_job_notes`;

CREATE TABLE `tbl_trial_job_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_order_no` varchar(10) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `last_updated_date` date DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_user_login` */

DROP TABLE IF EXISTS `tbl_user_login`;

CREATE TABLE `tbl_user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `login_code` varchar(10) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `activated` int(11) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `registered_date` datetime DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  `logged_in_time` datetime DEFAULT NULL,
  `logged_out_time` datetime DEFAULT NULL,
  `plan_code` varchar(10) DEFAULT NULL,
  `shift_code_id` int(11) DEFAULT NULL,
  `Elapsed_Hours` float DEFAULT NULL,
  `type_machine_center` varchar(20) DEFAULT NULL,
  `work_center_code` varchar(20) DEFAULT NULL,
  `machine_center_code` varchar(20) DEFAULT NULL,
  `prod_order_no` int(20) DEFAULT NULL,
  `matirial_request` varchar(200) DEFAULT NULL,
  `next_prod_order_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_users_sft` */

DROP TABLE IF EXISTS `tbl_users_sft`;

CREATE TABLE `tbl_users_sft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `login_code` varchar(11) DEFAULT NULL,
  `shift_code_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `machine_code` varchar(100) DEFAULT NULL,
  `machine_name` varchar(100) DEFAULT NULL,
  `activated` int(1) DEFAULT 0,
  `password_hash` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `registered_date` datetime DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `plan_code` varchar(10) DEFAULT 'SL',
  `mrms_id` int(11) DEFAULT NULL,
  `mrms_name` varchar(200) DEFAULT NULL,
  `is_test` tinyint(4) DEFAULT 0,
  `language_problem_report` varchar(20) DEFAULT 'en',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1124 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `column_name` mediumtext NOT NULL,
  `column_title` varchar(50) DEFAULT NULL,
  `scheduled_checked` int(10) DEFAULT 1,
  `suspended_checked` int(10) DEFAULT 0,
  `column_order` int(10) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3381 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_working_on` */

DROP TABLE IF EXISTS `tbl_working_on`;

CREATE TABLE `tbl_working_on` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `login_history_id` bigint(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `last_activity_date` datetime DEFAULT NULL,
  `is_start_job` tinyint(2) DEFAULT 0,
  `is_disabled` tinyint(2) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79991 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_working_shifts` */

DROP TABLE IF EXISTS `tbl_working_shifts`;

CREATE TABLE `tbl_working_shifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_code` int(11) DEFAULT NULL,
  `description` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `shift_start_time` varchar(10) DEFAULT NULL,
  `shift_end_time` varchar(10) DEFAULT NULL,
  `plan_code` varchar(10) DEFAULT 'SL',
  `status` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_zebra_printer` */

DROP TABLE IF EXISTS `tbl_zebra_printer`;

CREATE TABLE `tbl_zebra_printer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `printer_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `printer_name` (`printer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbl_zebra_printer_config_matrix` */

DROP TABLE IF EXISTS `tbl_zebra_printer_config_matrix`;

CREATE TABLE `tbl_zebra_printer_config_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_user_id` int(11) DEFAULT NULL,
  `sft_user_id` int(11) DEFAULT NULL,
  `zebra_printer_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Function  structure for function  `regex_replace` */

/*!50003 DROP FUNCTION IF EXISTS `regex_replace` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `regex_replace`(`pattern` VARCHAR(1000), `replacement` VARCHAR(1000), `original` VARCHAR(1000)) RETURNS varchar(1000) CHARSET latin1
BEGIN 
 DECLARE temp VARCHAR(1000); 
 DECLARE ch VARCHAR(1); 
 DECLARE i INT;
 SET i = 1;
 SET temp = '';
 IF original REGEXP pattern THEN 
  loop_label: LOOP 
   IF i>CHAR_LENGTH(original) THEN
    LEAVE loop_label;  
   END IF;
   SET ch = SUBSTRING(original,i,1);
   IF NOT ch REGEXP pattern THEN
    SET temp = CONCAT(temp,ch);
   ELSE
    SET temp = CONCAT(temp,replacement);
   END IF;
   SET i=i+1;
  END LOOP;
 ELSE
  SET temp = original;
 END IF;
 RETURN temp;
END */$$
DELIMITER ;

/* Procedure structure for procedure `backup_order` */

/*!50003 DROP PROCEDURE IF EXISTS  `backup_order` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `backup_order`()
BEGIN
	DECLARE $db TEXT;
	DECLARE $currentDB TEXT;
	DECLARE $currentuser TEXT;
	DECLARE $tb TEXT;
	SELECT USER() INTO $currentuser;
	SELECT DATABASE() INTO $currentDB FROM DUAL;
	SELECT UNIX_TIMESTAMP() INTO $tb;
	SET $db = CONCAT($currentDB, '_order');
	SET @s = CONCAT('CREATE DATABASE IF NOT EXISTS ', $db);
	PREPARE stmt_create FROM @s;
	EXECUTE stmt_create;
	DEALLOCATE PREPARE stmt_create;
	SET @s = CONCAT('GRANT ALL PRIVILEGES ON ', $db, '.* TO ', $currentuser, ' WITH GRANT OPTION');
	PREPARE stmt_grant FROM @s;
	EXECUTE stmt_grant;
	DEALLOCATE PREPARE stmt_grant;
	SET @s = CONCAT('CREATE TABLE ',$db,'.', $tb, ' (PRIMARY KEY (id)) SELECT id,prod_order_no,operation_no,order_no,machine_center_code FROM ',$currentDB,'.tbl_job_info WHERE is_deleted=0 AND is_disabled=0 AND machine_center_code != work_center_code AND order_no > 0');
	PREPARE stmt_grant FROM @s;
	EXECUTE stmt_grant;
	DEALLOCATE PREPARE stmt_grant;
END */$$
DELIMITER ;

/* Procedure structure for procedure `backup_order_create_temp_table_list` */

/*!50003 DROP PROCEDURE IF EXISTS  `backup_order_create_temp_table_list` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `backup_order_create_temp_table_list`()
BEGIN
	DECLARE $db TEXT;
	DECLARE $currentDB TEXT;
	DECLARE $maxDate TEXT;
	SELECT DATABASE() INTO $currentDB FROM DUAL;
	SET $db = CONCAT($currentDB, '_order');
	SELECT UNIX_TIMESTAMP(DATE_SUB(NOW(), INTERVAL 7 DAY)) INTO $maxDate;
	DROP TABLE IF EXISTS temp_backup_order;
	SET @s = CONCAT("CREATE TABLE " , $currentDB,".temp_backup_order SELECT table_name FROM information_schema.tables WHERE table_schema='", $db ,"' AND table_name <" , $maxDate);
	PREPARE stmt_table FROM @s;
	EXECUTE stmt_table;
	DEALLOCATE PREPARE stmt_table;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `backup_order_get_data` */

/*!50003 DROP PROCEDURE IF EXISTS  `backup_order_get_data` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `backup_order_get_data`(IN $tb TEXT , IN $machine TEXT)
BEGIN
	DECLARE $db TEXT;
	SELECT CONCAT(DATABASE(),'_order') INTO $db FROM DUAL;
	SET @s = CONCAT("SELECT * FROM `", $db ,"`.`",$tb,"` WHERE `machine_center_code`='" , $machine , "' ORDER BY `order_no`");
	PREPARE stmt_query FROM @s;
	EXECUTE stmt_query;
	DEALLOCATE PREPARE stmt_query;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `backup_order_reduce_table` */

/*!50003 DROP PROCEDURE IF EXISTS  `backup_order_reduce_table` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `backup_order_reduce_table`()
BEGIN
	CALL backup_order_create_temp_table_list();
	CALL backup_order_remove_old_table();
	DROP TABLE temp_backup_order;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `backup_order_remove_old_table` */

/*!50003 DROP PROCEDURE IF EXISTS  `backup_order_remove_old_table` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `backup_order_remove_old_table`()
BEGIN
	DECLARE $db TEXT;
	DECLARE $tb TEXT;
	DECLARE done BOOLEAN DEFAULT FALSE;
	DECLARE tableList CURSOR FOR SELECT * FROM temp_backup_order;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	SELECT CONCAT(DATABASE(),'_order') INTO $db FROM DUAL;
	OPEN tableList;
	REPEAT
		FETCH tableList INTO $tb;
		SET @s = CONCAT("DROP TABLE IF EXISTS " , $db,"." , $tb);
		PREPARE stmt_table FROM @s;
		EXECUTE stmt_table;
		DEALLOCATE PREPARE stmt_table;
	UNTIL done END REPEAT;
	CLOSE tableList;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `backup_order_table_list` */

/*!50003 DROP PROCEDURE IF EXISTS  `backup_order_table_list` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `backup_order_table_list`()
BEGIN
	DECLARE $db TEXT;
	DECLARE $currentDB TEXT;
	SELECT DATABASE() INTO $currentDB FROM DUAL;
	SET $db = CONCAT($currentDB, '_order');
	SET @s = CONCAT("SELECT table_name FROM information_schema.tables WHERE table_schema='", $db ,"' ORDER BY table_name");
	PREPARE stmt_table FROM @s;
	EXECUTE stmt_table;
	DEALLOCATE PREPARE stmt_table;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `order_change` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_change` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_change`(IN $id BIGINT , IN $order_no INT)
order_change_label:BEGIN
	/* declare variable */
	DECLARE $old_order_no INT;
	DECLARE $machine TEXT;
	DECLARE $machine_last INT;
	/* set variable */
	SELECT order_no,machine_center_code FROM tbl_job_info WHERE id=$id AND is_disabled=0 INTO $old_order_no , $machine;
	IF  $old_order_no IS NULL
	THEN 
		LEAVE order_change_label;
	END IF;
	IF $order_no = $old_order_no
	THEN 
		LEAVE order_change_label;
	END IF;
	CALL order_last($machine , $machine_last);
	
	IF $order_no > $machine_last
	THEN 
		SET $order_no = $machine_last;
	END IF;
	IF $order_no < $machine_last
	THEN 
		IF $old_order_no < 1 
		THEN 	
			CALL `order_increase_from`($machine , $order_no);
		ELSE
			IF $old_order_no < $order_no
			THEN 
				SET @start = $old_order_no + 1;
				SET @end = $order_no;
				CALL `order_reduce_in`($machine ,$old_order_no + 1 , $order_no );
			ELSE 
				SET @start = $order_no;
				SET @end = $old_order_no - 1;
				CALL `order_increase_in`($machine , $order_no , $old_order_no - 1 );
			END IF;
		END IF;
	END IF;
	UPDATE tbl_job_info SET last_order_no=$old_order_no , order_no=$order_no WHERE id=$id;
	UPDATE tbl_job_detail SET last_order_no=$old_order_no , order_no=$order_no WHERE id=$id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `order_change_machine` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_change_machine` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_change_machine`(IN $id INT,IN $machine TEXT)
order_change_machine:BEGIN
	DECLARE $right_machine TEXT;
	DECLARE $current_machine INT;
	DECLARE $current_order INT;
	DECLARE $last_order INT;
	DECLARE $current_status TEXT;
	SELECT order_no,machine_center_code,`Production_Status_Code` FROM tbl_job_info WHERE id=$id INTO $current_order , $right_machine,$current_status;
	#check status
	IF $current_status
	THEN 
		SELECT -1;
		LEAVE order_change_machine;
	END IF;
	#check is already changed to $machine
	IF $right_machine = $machine
	THEN 
		SELECT -2;
		LEAVE order_change_machine;
	END IF;
	# get last order no of new machine
	CALL order_last($machine , $last_order);
	# set machine_center_code numeric to prevent reduce order_no if job not in scheduled grid
	SET $current_machine = $right_machine;
	#update data new machine
	UPDATE tbl_job_info 
	SET 
		new_machine_center=$current_machine,
		machine_center_code=$machine,
		machine_center_name=(SELECT nav_name FROM tbl_computer WHERE nav_code=$machine),
		order_no=$last_order
	WHERE id=$id;
	UPDATE tbl_job_detail 
	SET 
		new_machine_center=$current_machine,
		machine_center_code=$machine,
		machine_center_name=(SELECT nav_name FROM tbl_computer WHERE nav_code=$machine),
		order_no=$last_order
	WHERE id=$id;
	#reduce order no in scheduled grid if job still in scheduled grid
	IF $current_machine = $right_machine AND $current_order > 0
	THEN 
		UPDATE tbl_job_info 
		SET 
			order_no = order_no - 1
		WHERE machine_center_code=$current_machine AND is_disabled = 0 AND order_no > $current_order;
		UPDATE tbl_job_detail 
		SET 
			order_no = order_no - 1
		WHERE machine_center_code=$current_machine AND is_disabled = 0 AND order_no > $current_order;
	END IF;
	SELECT 1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `order_fix_all_machine` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_fix_all_machine` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_fix_all_machine`()
BEGIN
	DECLARE done BOOLEAN DEFAULT FALSE;
	DECLARE $machine TEXT;
	DECLARE items CURSOR FOR SELECT machine_center_code FROM tbl_job_info WHERE machine_center_code REGEXP '^-?[0-9]+$' AND machine_center_code NOT LIKE '%20' GROUP BY machine_center_code;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	OPEN items;
	REPEAT
		FETCH NEXT FROM items INTO $machine;
		CALL order_fix_machine($machine);
	UNTIL done END REPEAT;
	CLOSE items;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `order_fix_machine` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_fix_machine` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_fix_machine`(IN $machine TEXT)
BEGIN
	DECLARE $id BIGINT;
	DECLARE $job TEXT;
	DECLARE $current INT;
	DECLARE $right_order INT;
	DECLARE done BOOLEAN DEFAULT FALSE;
	DECLARE items CURSOR FOR SELECT id,prod_order_no,order_no FROM tbl_job_info WHERE machine_center_code= $machine AND is_disabled=0 AND is_deleted=0 ORDER BY order_no;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	SET $right_order=1;
	OPEN items;
	REPEAT
		
		FETCH NEXT FROM items INTO $id,$job,$current;
		IF $id AND $right_order <> $current
		THEN
			UPDATE tbl_job_info SET order_no=$right_order WHERE id=$id;
			UPDATE tbl_job_detail SET order_no=$right_order WHERE id=$id;
		END IF;
		SET $right_order = $right_order + 1;
		SET $id = NULL;
	UNTIL done END REPEAT;
	CLOSE items;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `order_increase_from` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_increase_from` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_increase_from`(IN $machine TEXT , IN $order_no INT)
BEGIN
	UPDATE tbl_job_info SET order_no = order_no + 1 WHERE machine_center_code = $machine AND order_no >= $order_no AND is_disabled=0;
	UPDATE tbl_job_detail SET order_no = order_no + 1 WHERE machine_center_code = $machine AND order_no >= $order_no AND is_disabled=0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `order_increase_in` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_increase_in` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_increase_in`(IN $machine TEXT , IN $order_start INT , IN $order_end INT)
BEGIN
	UPDATE tbl_job_info SET order_no = order_no + 1 WHERE machine_center_code = $machine AND order_no >= $order_start AND order_no <= $order_end AND is_disabled=0;
	UPDATE tbl_job_detail SET order_no = order_no + 1 WHERE machine_center_code = $machine AND order_no >= $order_start AND order_no <= $order_end AND is_disabled=0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `order_last` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_last` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_last`(IN $machine TEXT , OUT $order_no INT)
BEGIN
	DECLARE $last_order_no INT;
	SELECT order_no FROM tbl_job_info WHERE machine_center_code= $machine AND is_disabled = 0 AND order_no > 0 ORDER BY order_no DESC , prod_order_no DESC LIMIT 1 INTO $last_order_no;
	IF $last_order_no IS NULL
	THEN 
		SET $order_no = 1;
	ELSE
		SET $order_no = ($last_order_no + 1);
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `order_machine_status` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_machine_status` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_machine_status`(IN $machine TEXT)
BEGIN
	SELECT id,prod_order_no,operation_no,order_no,machine_center_code FROM tbl_job_info WHERE is_deleted=0 AND is_disabled=0 AND machine_center_code=$machine AND order_no > 0 ORDER BY order_no;
END */$$
DELIMITER ;

/* Procedure structure for procedure `order_reduce_from` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_reduce_from` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_reduce_from`(IN $machine TEXT , IN $order_no INT)
BEGIN
	UPDATE tbl_job_info SET order_no = order_no - 1 WHERE machine_center_code = $machine AND order_no > $order_no AND is_disabled=0;
	UPDATE tbl_job_detail SET order_no = order_no - 1 WHERE machine_center_code = $machine AND order_no > $order_no AND is_disabled=0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `order_reduce_in` */

/*!50003 DROP PROCEDURE IF EXISTS  `order_reduce_in` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `order_reduce_in`(IN $machine TEXT , IN $order_start INT , IN $order_end INT)
BEGIN
	UPDATE tbl_job_info SET order_no = order_no - 1 WHERE machine_center_code = $machine AND order_no >= $order_start AND order_no <= $order_end AND is_disabled=0;
	UPDATE tbl_job_detail SET order_no = order_no - 1 WHERE machine_center_code = $machine AND order_no >= $order_start AND order_no <= $order_end AND is_disabled=0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `status_reset_grid_status` */

/*!50003 DROP PROCEDURE IF EXISTS  `status_reset_grid_status` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `status_reset_grid_status`(IN $machine TEXT)
BEGIN
	UPDATE tbl_job_info 
	SET 
		Production_Status_Code=NULL , 
		Production_Status_vi='Ready', 
		Production_Status_en='Ready' 
	WHERE 
		machine_center_code=$machine AND order_no > 0 AND is_disabled=0;
	UPDATE tbl_job_detail
	SET 
		Production_Status_Code=NULL , 
		Production_Status_vi='Ready', 
		Production_Status_en='Ready' 
	WHERE 
		machine_center_code=$machine AND order_no > 0 AND is_disabled=0;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_list_roll_press` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_list_roll_press` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_list_roll_press`(
	IN `trace_id` varchar(50),
    IN `type_search` varchar(50)
)
BEGIN
	SELECT TenKhachHang,op.id as out_id, op.in_trace_id, pd.id as job_id,pd.lanes, machine_code, machine_name, op.out_date as out_created_date,out_shift,op.out_date as input_date,
		out_created_by, pd.job_no,pd.prod_name,pd.fg_width,pd.fg_code,out_trace_id,out_net_weight,out_gross_weight,out_connect_no,out_priority,out_quantity,
		out_lane_no,out_status, out_label_date, out_label_time, out_description, out_product_code  
	FROM ps_prod_schedule as pd
	LEFT JOIN ps_job_output_press as op ON op.job_id=pd.id 
	WHERE out_is_deleted in (0,2) AND 
		IF(type_search='search_roll', op.out_trace_id=trace_id, 
			IF(type_search='search_input', op.in_trace_id=trace_id, 
				IF(type_search='search_job', job_no = trace_id, op.out_trace_id=trace_id)));
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_list_roll_spout` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_list_roll_spout` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_list_roll_spout`(
	IN `trace_id` text,
    IN `type_search` varchar(50)
)
BEGIN
    #Get all job by department "PRESS" OR 1 MACHINE OR JOB NO to temporary table
	CREATE TEMPORARY TABLE IF NOT EXISTS job_info AS (
		SELECT id , machine_name, job_no
		FROM ps_prod_schedule AS PD
		INNER JOIN (
			SELECT printed_name,nav_code
			FROM tbl_computer
			WHERE work_center_code="SPOUT-INSERTER" AND printed_name IS NOT NULL
		) AS C ON C.nav_code=PD.machine_code
        WHERE IF(type_search='search_job',job_no=trace_id,1)
    );
    IF (type_search='search_pallet')
    THEN
		CREATE TEMPORARY TABLE IF NOT EXISTS table_out_id AS (
			SELECT b.out_id AS id
			FROM ps_pallet as a
            LEFT JOIN(
				SELECT out_id,pallet_id
                FROM ps_pallet_box_pouching
                WHERE is_deleted = 0 AND job_id IN (SELECT id FROM job_info)
            ) AS b ON a.id = b.pallet_id
			WHERE pallet_trace_id = trace_id AND pallet_deleted = 0 AND job_id IN (SELECT id FROM job_info)
		);
	ELSE
		CREATE TEMPORARY TABLE IF NOT EXISTS table_out_id AS (
			SELECT id
			FROM ps_job_output_pouching
			WHERE out_is_deleted = 0 AND job_id IN (SELECT id FROM job_info) AND 
				IF(type_search='search_box',out_trace_id=trace_id,
					IF(type_search='search_input',in_trace_id=trace_id,1))
		);
    END IF;  
    #Summary query
	SELECT PO.id as out_id, PD.*, 
		box.pallet_trace_id, box.printed_name ,
        PO.out_box_no, PO.out_trace_id, PO.out_producer, PO.out_net_weight, PO.out_gross_weight, PO.is_marked_rework, PO.out_reason_rework,
        PO.out_shift, PO.out_created_by, PO.out_date, PO.out_description,
		P.pouching_machine, P.quantity_bag_input, 
		P.quantity_box,
        P.trace_id_source, P.box_trace_id
	FROM ps_job_output_pouching AS PO
    #Schedule
    LEFT JOIN (
		SELECT *
		FROM job_info
		WHERE id IN (SELECT id FROM job_info)
	) AS PD ON PO.job_id = PD.id
	#Rework
	LEFT JOIN (
        SELECT SUBSTRING_INDEX(trace_id_combined, ",", -1) as box_trace_id, 
			pouching_machine, c.out_quantity as quantity_bag_input, output_id_new,
            (CASE SUBSTRING_INDEX(quantity_combined, ",", 1) WHEN 0 THEN NULL ELSE trace_id_source END) AS trace_id_source,
			(CASE SUBSTRING_INDEX(quantity_combined, ",", 1) WHEN 0 THEN NULL ELSE SUBSTRING_INDEX(quantity_combined, ",", 1) END) AS quantity_box,
            job_id
		FROM ps_job_rework_pouching AS a
            LEFT JOIN(
				SELECT out_trace_id, out_quantity
				FROM ps_job_output_pouching
				WHERE out_is_deleted = 2 AND out_trace_id IN(SELECT DISTINCT(out_trace_id) 
																FROM ps_job_rework_pouching 
																WHERE (is_deleted = 0 OR is_deleted = 2) AND job_id IN (SELECT id FROM job_info) AND SUBSTRING_INDEX(quantity_combined, ",", 1)
																GROUP BY trace_id_source)
                GROUP BY out_trace_id
			) AS b ON a.trace_id_source = b.out_trace_id
            LEFT JOIN(
				SELECT out_trace_id, machine_name as pouching_machine, out_quantity
				FROM ps_job_output_pouching AS a
				LEFT JOIN(
					SELECT machine_name, id AS job_id
					FROM ps_prod_schedule
					WHERE 1
				) AS b ON a.job_id = b.job_id
				WHERE out_is_deleted = 2
			) AS c ON SUBSTRING_INDEX(a.trace_id_combined, ",", -1) = c.out_trace_id
		WHERE (a.is_deleted = 0 OR a.is_deleted = 2) AND a.job_id IN (SELECT id FROM job_info) AND a.output_id_new IN (SELECT id FROM table_out_id)
	) AS P ON PO.id = P.output_id_new
    #Pallet
    LEFT JOIN (
		SELECT pallet_trace_id, a.job_id, out_id, printed_name
		FROM ps_pallet_box_pouching AS a
        LEFT JOIN (
			SELECT id, pallet_trace_id, printed_name
			FROM ps_pallet
            LEFT JOIN(
				SELECT printed_name, nav_code
				FROM tbl_computer
                WHERE work_center_code="SPOUT-INSERTER"
			) AS c ON c.nav_code = machine_center_code
			WHERE pallet_deleted = 0 AND job_id IN (SELECT id FROM job_info)
		) AS b ON a.pallet_id = b.id
		WHERE a.is_deleted = 0 AND job_id IN (SELECT id FROM job_info) AND a.out_id IN (SELECT id FROM table_out_id)
	) AS BOX ON PO.id = BOX.out_id
	WHERE PO.out_is_deleted = 0 AND PO.job_id IN (SELECT id FROM job_info) AND PO.id IN (SELECT id FROM table_out_id) AND PO.out_quantity > 0
	GROUP BY PO.out_trace_id;
	DROP TABLE job_info;
    DROP TABLE table_out_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_production_status` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_production_status` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_production_status`(
	IN `machineCode` VARCHAR(100),
	IN `jobNo` VARCHAR(50),
	IN `shift` VARCHAR(3),
	IN `fromDate` VARCHAR(10),
	IN `toDate` VARCHAR(10)
)
BEGIN
	DECLARE list_job text;
	#Get all job by department "R-REWORK" OR 1 MACHINE OR JOB NO to temporary table
	CREATE TEMPORARY TABLE IF NOT EXISTS job_info AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, lanes, CuChieuDaiCuon
		FROM `ps_prod_schedule` as PD
		INNER JOIN (
			SELECT printed_name,nav_code
			FROM tbl_computer
			WHERE work_center_code="PRESS" AND printed_name IS NOT NULL AND IF(machineCode, nav_code=machineCode, 1)
		) AS C ON C.nav_code=PD.machine_code
        WHERE IF(jobNo<>"", job_no=jobNo, 1)
    );
    #Set list job from temporary above
    SET list_job = (SELECT GROUP_CONCAT(DISTINCT(id) SEPARATOR ", ") as id FROM job_info);
    #Summary query
	SELECT PD.job_no, PD.printed_name, status_shift, master_roll, from_date, to_date, status_date, speed, TIMEDIFF(to_date, from_date) as total, grid_prod_status, `comment`
	FROM job_info as PD
	#Production status
	LEFT JOIN (
		SELECT status_code, job_id, status_shift, master_roll, from_date, to_date, speed, grid_prod_status, `comment`,
			IF((TIME(from_date)>="07:30:00" AND TIME(from_date)<="23:59:59"), 
				DATE(from_date), DATE_SUB(DATE(from_date), INTERVAL 1 DAY)
			) AS status_date
		FROM ps_production_status
		WHERE is_deleted=0 
			AND IF((TIME(from_date)>="07:30:00" AND TIME(from_date)<="23:59:59"),DATE(from_date), DATE_SUB(DATE(from_date), INTERVAL 1 DAY)) BETWEEN fromDate AND toDate 
			AND IF(shift<>"",status_shift=shift,1) 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
	) AS STT ON PD.id=STT.job_id
	WHERE status_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(id, list_job),1);
	DROP TABLE job_info;
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_summary_inspection` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_summary_inspection` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_summary_inspection`(
	IN `machineCode` VARCHAR(100),
	IN `jobNo` VARCHAR(50),
	IN `shift` VARCHAR(3),
	IN `fromDate` VARCHAR(10),
	IN `toDate` VARCHAR(10)
)
BEGIN
	DECLARE list_job TEXT;
	#Get all job by department "INSPECTION" OR 1 MACHINE OR JOB NO to temporary table
	CREATE TEMPORARY TABLE IF NOT EXISTS job_info AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, specification, lanes AS line, masking_tape, fg_code
		FROM `ps_prod_schedule` AS PD
		INNER JOIN (
			SELECT printed_name,nav_code
			FROM tbl_computer
			WHERE work_center_code="REWIND" AND printed_name IS NOT NULL AND IF(machineCode, nav_code=machineCode, 1)
		) AS C ON C.nav_code LIKE PD.machine_code
        WHERE IF(jobNo<>"", job_no=jobNo, 1)
    );
	SET group_concat_max_len=15000;
    #Set list job from temporary above
    SET list_job = (SELECT GROUP_CONCAT(DISTINCT(id) SEPARATOR ", ") AS id FROM job_info);
    #Summary query
	SELECT PD.*,
		INP.stage, OP.job_id, total_in_quantity, OP.checked_meter, OP.out_quantity,
        OP.out_shift, OP.out_connect_no, OP.out_shims, OP.out_date, out_created_by, OP.in_trace_id, OP.out_trace_id, specification, pd.fg_code,
        out_description, no_of_rewind, reason_name_inspection, checked_meter, OP.in_put_id, OP.out_id, OP.out_created_date
	FROM job_info AS PD
	
	#Table Output
	LEFT JOIN (
		SELECT out_shift, out_created_by, job_id, id,
        GROUP_CONCAT(DISTINCT(id) SEPARATOR ",") AS out_id,
        in_put_id, in_trace_id, out_trace_id, no_of_rewind, checked_meter, out_connect_no,
		out_date, out_quantity, out_shims, out_created_date, out_description
		FROM ps_job_output_rewind
		WHERE out_is_deleted IN (0,2) AND (out_date BETWEEN fromDate AND toDate) AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",out_shift=shift,1)
		GROUP BY out_shift, job_id, out_date, id
	) AS OP ON PD.id=OP.job_id
    #INPUT
	LEFT JOIN (
		SELECT job_id, stage, reason_name_inspection,
			in_date, in_shift, SUM(in_quantity) AS total_in_quantity
		FROM ps_job_input
		WHERE in_is_deleted = 0 AND in_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",in_shift=shift,1)
		GROUP BY job_id, in_shift, in_date
		ORDER BY in_date ASC
	) AS INP ON OP.job_id=INP.job_id AND INP.in_shift=OP.out_shift AND OP.out_date=INP.in_date
	#Stage Error
	LEFT JOIN (
		SELECT job_id, out_id, COUNT(IF(no_of_flags = 2,1,NULL)) AS section_flag,
			COUNT(IF(no_of_flags = 1,1,NULL)) AS joint_flag, COUNT(out_id) AS total_defect,
			SUM(CASE WHEN reason_id = 173 OR reason_id = 195 OR reason_id = 172 OR reason_id = 153 THEN no_of_flags ELSE 0 END ) AS defect_insect
		FROM ps_error_stage
		WHERE error_is_deleted=0 AND IF(shift<>"",error_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id, out_id
        ORDER BY out_id ASC
	) AS ERS ON OP.job_id=ERS.job_id AND ERS.out_id=OP.id
	WHERE out_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(PD.id, list_job),1)
	GROUP BY id, out_date, out_shift, OP.id
	ORDER BY out_date ASC, out_shift ASC;
	
	DROP TABLE job_info;
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_summary_la` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_summary_la` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_summary_la`(
	IN `machineCode` VARCHAR(100),
	IN `jobNo` VARCHAR(50),
	IN `shift` VARCHAR(3),
	IN `fromDate` VARCHAR(10),
	IN `toDate` VARCHAR(10)
)
BEGIN
	DECLARE list_job text;
	#Get all job by department "LAMINATION" OR 1 MACHINE OR JOB NO to temporary table
	CREATE TEMPORARY TABLE IF NOT EXISTS job_info AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, specification
		FROM `ps_prod_schedule` as PD
		INNER JOIN (
			SELECT printed_name,nav_code
			FROM tbl_computer
			WHERE work_center_code="LAMINATION" AND printed_name IS NOT NULL AND IF(machineCode, nav_code=machineCode, 1)
		) AS C ON C.nav_code=PD.machine_code
        WHERE IF(jobNo<>"", job_no=jobNo, 1)
    );
    #Set list job from temporary above
    SET list_job = (SELECT GROUP_CONCAT(DISTINCT(id) SEPARATOR ", ") as id FROM job_info);
    #Summary query
	SELECT PD.*,
		OP.out_date,OP.out_shift,OP.out_created_by,OP.job_id,SUB.total_sub_quantity,in_residual_quantity,IPN.total_in_quantity,IPN.ghep_option_value,IPN.ghep_option,IPN.is_process,
        OP.out_quantity,SCRAP.note,bl_satloi,bl_thieumet,bl_loinc,pr_satloi,pr_print,la_setup,la_process,other,machine_md,lsx5,material_satloi,material_other,
        material_ncc,material_no_satloi,material_no_other,setup_nl,process_mangin,setup_mangin,
		time_noted,setup_job,setup_tech,sl_doijob,sl_doikeo,run_order,sxt,MT,WH,PU,RD,QC,PL,SA,PLAN,Holiday,LA020,
		period_thieumet,period_satloi,Incident,BL,PT,LA,Maintenance,speed1,speed2,total_return_quantity,total_transfer_quantity,
		total_receive_transfer_quantity,is_return,return_trace_id,time_out_order,time_out_sxt,STT.status_shift,STT.created_by, prod_status_date,STT.ghep_ky,
        CONCAT(COALESCE(glue_name_2,''),',',COALESCE(glue_name_1,'')) as glue_name
	FROM job_info as PD
	 #Production status
	LEFT JOIN (
		SELECT status_code, job_id,status_shift, MIN(from_date) AS min_status_date, MAX(to_date) AS max_status_date,ghep_ky,
			prod_status_date ,created_by, from_date,
            GROUP_CONCAT(DISTINCT(COMMENT) SEPARATOR ", ") AS time_noted,
            SUM(CASE WHEN `status_code`="LA-002" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS setup_tech,
            SUM(CASE WHEN `status_code`="LA-002" AND status_job = 1 THEN status_job ELSE NULL END) AS sl_doijob,
            SUM(CASE WHEN `status_code`="LA-002" AND status_glue = 1 THEN status_glue ELSE NULL END) AS sl_doikeo,
            AVG(CASE WHEN `status_code`="LA-003" THEN speed ELSE NULL END) AS speed1,
            SUM(CASE WHEN time_out<>'' AND `status_code`="LA-003" THEN time_out ELSE NULL END) AS time_out_order,
            SUM(CASE WHEN `status_code`="LA-003" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS run_order,
            AVG(CASE WHEN `status_code`="LA-004" THEN speed ELSE NULL END) AS speed2,
            SUM(CASE WHEN time_out<>'' AND `status_code`="LA-004" THEN time_out ELSE NULL END) AS time_out_sxt,
            SUM(CASE WHEN `status_code`="LA-004" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS sxt,
			SUM(CASE WHEN `status_code`="LA-001" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS setup_job,
			SUM(CASE WHEN `status_code`="LA-005" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS MT,
			SUM(CASE WHEN `status_code`="LA-006" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS WH,
			SUM(CASE WHEN `status_code`="LA-007" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS PU,
			SUM(CASE WHEN `status_code`="LA-008" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS RD,
			SUM(CASE WHEN `status_code`="LA-009" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS QC,
			SUM(CASE WHEN `status_code`="LA-010" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS PL,
			SUM(CASE WHEN `status_code`="LA-011" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS SA,
			SUM(CASE WHEN `status_code`="LA-012" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS PLAN,
			SUM(CASE WHEN `status_code`="LA-013" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS Maintenance,
			SUM(CASE WHEN `status_code`="LA-014" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS Incident,
			SUM(CASE WHEN `status_code`="LA-016" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS Holiday,
			SUM(CASE WHEN `status_code`="LA-017" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS BL,
			SUM(CASE WHEN `status_code`="LA-018" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS PT,
			SUM(CASE WHEN `status_code`="LA-019" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS LA,
			SUM(CASE WHEN `status_code`="LA-020" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END) AS LA020
		FROM ps_production_status
		WHERE is_deleted=0 
			AND prod_status_date BETWEEN fromDate AND toDate
			AND IF(shift<>"",status_shift=shift,1) 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,status_shift,prod_status_date,ghep_ky
	) AS STT ON PD.id=STT.job_id
    #Table Output
	LEFT JOIN (
		SELECT out_shift, out_created_by, job_id, out_date, SUM(out_quantity) AS out_quantity, in_put_id, out_period
		FROM ps_job_output_ex_la_pr
		WHERE out_is_deleted = 0 AND out_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",out_shift=shift,1)
		GROUP BY out_shift, out_date, job_id, out_period
	) AS OP ON STT.job_id = OP.job_id AND STT.status_shift=OP.out_shift AND OP.out_date=STT.prod_status_date AND OP.out_period = STT.ghep_ky
    #INPUT
	LEFT JOIN (
		SELECT SUM(in_quantity) AS total_in_quantity, job_id, ghep_ky, id, in_trace_id,in_shift,in_date,ghep_option,ghep_option_value,is_process
		FROM ps_job_input AS IP
		WHERE in_is_deleted = 0 AND in_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",in_shift=shift,1)
		GROUP BY job_id,in_shift,in_date,ghep_ky,ghep_option
		ORDER BY in_date ASC
	) AS IPN ON IPN.job_id = STT.job_id AND STT.status_shift=IPN.in_shift AND STT.prod_status_date=IPN.in_date AND STT.ghep_ky = IPN.ghep_ky
    #SUB_INPUT
	LEFT JOIN (
		SELECT SUM(sub_quantity) AS total_sub_quantity,sub_shift,job_id,sub_date,a.ghep_ky
		FROM ps_job_input_sub_trace_id b
		LEFT JOIN (
			SELECT id,ghep_ky
			FROM ps_job_input
			WHERE in_is_deleted = 0 AND in_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",in_shift=shift,1)
		) AS a ON a.id = b.sub_input_id
		WHERE sub_is_deleted=0 AND sub_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",sub_shift=shift,1)
		GROUP BY job_id, sub_shift,sub_date,ghep_ky
	) AS SUB ON STT.job_id=SUB.job_id AND STT.status_shift=SUB.sub_shift AND SUB.sub_date=STT.prod_status_date AND STT.ghep_ky = SUB.ghep_ky
    #SCRAP
	LEFT JOIN (
		SELECT job_id, stage_id, reason_id,scrap_shift, a.ghep_ky, scrap_date,
			SUM(CASE WHEN stage_id = 1 	AND reason_id = 105 THEN scrap_quantity ELSE NULL END) AS bl_satloi, 
			SUM(CASE WHEN stage_id = 1 	AND reason_id = 106 THEN scrap_quantity ELSE NULL END) AS bl_thieumet,
            SUM(CASE WHEN stage_id = 1 	AND reason_id = 224 THEN scrap_quantity ELSE NULL END) AS bl_loinc,
			SUM(CASE WHEN stage_id = 2 	AND reason_id = 107 THEN scrap_quantity ELSE NULL END) AS pr_satloi,
			SUM(CASE WHEN stage_id = 2 	AND reason_id = 108 THEN scrap_quantity ELSE NULL END) AS pr_print,
			SUM(CASE WHEN stage_id = 3 	AND reason_id = 109 THEN scrap_quantity ELSE NULL END) AS la_setup,
			SUM(CASE WHEN stage_id = 3 	AND reason_id = 110 THEN scrap_quantity ELSE NULL END) AS la_process,
			SUM(CASE WHEN stage_id = 7 	AND reason_id = 111 THEN scrap_quantity ELSE NULL END) AS other,
			SUM(CASE WHEN stage_id = 7 	AND reason_id = 112 THEN scrap_quantity ELSE NULL END) AS machine_md,
			SUM(CASE WHEN stage_id = 7 	AND reason_id = 186 THEN scrap_quantity ELSE NULL END) AS lsx5,
			SUM(CASE WHEN stage_id = 9 	AND reason_id = 113 THEN scrap_quantity ELSE NULL END) AS material_satloi,
			SUM(CASE WHEN stage_id = 9 	AND reason_id = 114 THEN scrap_quantity ELSE NULL END) AS material_other,
            SUM(CASE WHEN stage_id = 9 	AND reason_id = 225 THEN scrap_quantity ELSE NULL END) AS material_ncc,
			SUM(CASE WHEN stage_id = 10 AND reason_id = 182 THEN scrap_quantity ELSE NULL END) AS setup_mangin,
			SUM(CASE WHEN stage_id = 10 AND reason_id = 184 THEN scrap_quantity ELSE NULL END) AS period_satloi,
			SUM(CASE WHEN stage_id = 10 AND reason_id = 185 THEN scrap_quantity ELSE NULL END) AS period_thieumet,
            SUM(CASE WHEN stage_id = 11 AND reason_id = 222 THEN scrap_quantity ELSE NULL END) AS material_no_satloi,
			SUM(CASE WHEN stage_id = 11 AND reason_id = 223 THEN scrap_quantity ELSE NULL END) AS material_no_other,
			SUM(CASE WHEN stage_id = 10 AND reason_id = 183 THEN scrap_quantity ELSE NULL END) AS setup_nl,
            SUM(CASE WHEN stage_id = 10 AND reason_id = 241 THEN scrap_quantity ELSE NULL END) AS process_mangin
		FROM ps_scrap_stage b
			LEFT JOIN (
			SELECT id,ghep_ky
			FROM ps_job_input
			WHERE in_is_deleted = 0
			) AS a ON a.id = b.in_put_id
		WHERE scrap_is_deleted=0 AND scrap_date BETWEEN fromDate AND toDate AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,scrap_shift,scrap_date,ghep_ky
	) AS sc1 ON sc1.job_id=STT.job_id AND sc1.scrap_shift=STT.status_shift AND sc1.scrap_date=STT.prod_status_date AND STT.ghep_ky = sc1.ghep_ky
	LEFT JOIN (
		SELECT job_id, scrap_shift, in_put_id, GROUP_CONCAT(CONCAT_WS(' ', CONCAT_WS(' ', CONCAT(FORMAT(scrap_quantity,0),'m'),CONCAT(reason,':')), scrap_note) SEPARATOR ", ") AS note,
		IF((TIME(scrap_created_date)>="07:30:00" AND TIME(scrap_created_date)<="23:59:59"), DATE(scrap_created_date), DATE_SUB(DATE(scrap_created_date), INTERVAL 1 DAY)
		) AS scrap_date,a.ghep_ky
		FROM ps_scrap_stage b
		LEFT JOIN (
			SELECT id,ghep_ky
			FROM ps_job_input
			WHERE in_is_deleted = 0
		) AS a ON a.id = b.in_put_id
        LEFT JOIN (
			SELECT id, id_stage, reason
			FROM ps_stage_reason
			WHERE machine_type = 'LAMINATION'
		) AS r ON r.id = b.reason_id AND r.id_stage = b.stage_id
		WHERE scrap_is_deleted=0 AND scrap_date BETWEEN fromDate AND toDate AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,scrap_shift,scrap_date,ghep_ky
	) AS SCRAP ON SCRAP.job_id=STT.job_id AND SCRAP.scrap_shift=STT.status_shift AND SCRAP.scrap_date=STT.prod_status_date AND STT.ghep_ky = SCRAP.ghep_ky
    #Input Residual
	LEFT JOIN (
		SELECT SUM(in_residual_quantity) AS in_residual_quantity,in_residual_shift,job_id, ghep_ky,in_residual_date
		FROM ps_job_input_residual b
		LEFT JOIN (
			SELECT id,ghep_ky
			FROM ps_job_input
			WHERE in_is_deleted = 0
		) AS a ON a.id = b.in_put_id
		WHERE in_residual_is_deleted=0 AND in_residual_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",in_residual_shift=shift,1)
		GROUP BY job_id, in_residual_shift,in_residual_date
	) AS RES ON STT.job_id=RES.job_id AND STT.status_shift=RES.in_residual_shift AND RES.in_residual_date=STT.prod_status_date AND STT.ghep_ky = RES.ghep_ky
    #Table Return for Receive Transfer
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_transfer_quantity,job_id,period,return_shift,
			IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) AS return_date
		FROM ps_material_return AS R
		WHERE is_deleted=0 AND is_return=2 AND is_material = 0 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate 
            AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
            AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift,return_date,period
	) AS TRS ON STT.job_id=TRS.job_id AND TRS.return_date=STT.prod_status_date AND TRS.return_shift=STT.status_shift AND STT.ghep_ky = TRS.period
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_return_quantity,job_id,is_return,period,return_shift,
			IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) AS return_date
		FROM ps_material_return AS R
		WHERE is_deleted=0 AND is_return =1 AND is_material = 0 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift,return_date,period
	) AS RE ON STT.job_id=RE.job_id AND STT.status_shift=RE.return_shift AND RE.return_date=STT.prod_status_date AND STT.ghep_ky = RE.period
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_receive_transfer_quantity,job_id, MAX(input_trace_id) AS return_trace_id,period,receive_shift,
		IF((TIME(receive_date)<="07:30:00"), DATE_ADD(DATE(receive_date), INTERVAL -1 DAY), DATE(receive_date)) AS return_date
		FROM ps_material_return AS R
		WHERE is_deleted=0 AND is_return=2 AND is_received =1 AND is_material = 0 
        AND IF((TIME(receive_date)<="07:30:00"), DATE_ADD(DATE(receive_date), INTERVAL -1 DAY), DATE(receive_date)) BETWEEN fromDate AND toDate 
        AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
        AND IF(shift<>"",receive_shift=shift,1)
		GROUP BY job_id, receive_shift,return_date,period
	) AS TRSR ON STT.job_id=TRSR.job_id AND TRSR.return_date=STT.prod_status_date AND TRSR.receive_shift=STT.status_shift AND STT.ghep_ky = TRSR.period
    #Adhesive
    LEFT JOIN (
		SELECT job_id, return_period, return_receive_shift, 
			GROUP_CONCAT(DISTINCT(glue_name) SEPARATOR ",") AS glue_name_2,
			IF((TIME(return_date_receive)<="07:30:00"), DATE_ADD(DATE(return_date_receive), INTERVAL -1 DAY), DATE(return_date_receive)) AS return_date_receive
		FROM ps_job_input_glue_return as b
        LEFT JOIN (
			SELECT id,glue_name
			FROM ps_job_input_glue
			WHERE glue_is_deleted = 0
		) AS a ON a.id = b.return_glue_id
		WHERE return_is_deleted = 0 AND return_type = 2 AND return_is_receive = 1
        AND IF((TIME(return_date_receive)<="07:30:00"), DATE_ADD(DATE(return_date_receive), INTERVAL -1 DAY), DATE(return_date_receive)) BETWEEN fromDate AND toDate 
        AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
        AND IF(shift<>"",return_receive_shift=shift,1)
        GROUP BY job_id,return_period,return_date_receive,return_receive_shift
	) AS RTGL ON RTGL.job_id=STT.job_id AND RTGL.return_date_receive=STT.prod_status_date AND RTGL.return_receive_shift=STT.status_shift AND RTGL.return_period=STT.ghep_ky
    LEFT JOIN (
		SELECT job_id, ghep_ky, DATE(glue_date) as glue_date, glue_shift,
			GROUP_CONCAT(DISTINCT(glue_name) SEPARATOR ",") AS glue_name_1
		FROM ps_job_input_glue as b
        LEFT JOIN (
			SELECT id,ghep_ky
			FROM ps_job_input_glue_general
			WHERE is_deleted = 0
		) AS a ON a.id = b.glue_general_id
		WHERE glue_is_deleted=0
        AND DATE(glue_date) BETWEEN fromDate AND toDate
        AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
        AND IF(shift<>"",glue_shift=shift,1)
		GROUP BY b.job_id,ghep_ky,glue_date,glue_shift
	) AS Glue ON Glue.job_id=STT.job_id AND Glue.glue_date=STT.prod_status_date AND Glue.glue_shift=STT.status_shift AND Glue.ghep_ky=STT.ghep_ky
    WHERE prod_status_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(PD.id, list_job),1)
	GROUP BY STT.job_id,STT.prod_status_date,STT.status_shift,STT.ghep_ky
	ORDER BY from_date ASC,prod_status_date ASC, STT.status_shift ASC;
    DROP TABLE job_info;
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_summary_pouching` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_summary_pouching` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_summary_pouching`(
	IN `machineCode` VARCHAR(100),
	IN `jobNo` VARCHAR(50),
	IN `shift` VARCHAR(3),
	IN `fromDate` VARCHAR(10),
	IN `toDate` VARCHAR(10)
)
BEGIN
	DECLARE list_job text;
	#Get all job by department "POUCHING" OR 1 MACHINE OR JOB NO to temporary table
	CREATE TEMPORARY TABLE IF NOT EXISTS job_info AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, TuKichThuoc, TuSoJane, TuRong, TuCao, lanes AS line, specification, fg_code
		FROM `ps_prod_schedule` as PD
		INNER JOIN (
			SELECT printed_name,nav_code
			FROM tbl_computer
			WHERE work_center_code="POUCHING" AND printed_name IS NOT NULL AND IF(machineCode, nav_code=machineCode, 1)
		) AS C ON C.nav_code=PD.machine_code
        WHERE IF(jobNo<>"", job_no=jobNo, 1)
    );
    #Set list job from temporary above
    SET list_job = (SELECT GROUP_CONCAT(DISTINCT(id) SEPARATOR ", ") as id FROM job_info);
    #CREATE TEMPORARY TABLE
    CREATE TEMPORARY TABLE IF NOT EXISTS job_status AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, TuKichThuoc, TuSoJane, TuRong, TuCao, line, specification, fg_code, STT.prod_status_date, STT.status_shift
		FROM job_info as PD
		LEFT JOIN (
			SELECT prod_status_date, status_shift, job_id
			FROM ps_production_status
			WHERE is_deleted=0 
				AND prod_status_date BETWEEN fromDate AND toDate
				AND IF(shift<>"",status_shift=shift,1) 
				AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
				GROUP BY job_id,status_shift,prod_status_date
		) AS STT ON PD.id=STT.job_id
        WHERE 1
    );
    CREATE TEMPORARY TABLE IF NOT EXISTS job_out AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, TuKichThuoc, TuSoJane, TuRong, TuCao, line, specification, fg_code, OPN.out_date as prod_status_date, OPN.out_shift as status_shift
		FROM job_info as PD
		LEFT JOIN (
			SELECT out_shift, out_date, job_id
			FROM ps_job_output_pouching
			WHERE out_is_deleted IN(0,2) AND out_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",out_shift=shift,1)
			GROUP BY out_shift,job_id,out_date
		) AS OPN ON PD.id=OPN.job_id
        WHERE 1
    );
    #Summary query
	SELECT PD.*, INP.*, 
		OP.job_id, in_residual_quantity, OP.out_quantity AS total_out_quantity, OP.out_fail_quantity AS total_out_fail_quantity,STT.status_shift,STT.created_by, PD.prod_status_date,
		OP.out_shift, OP.out_date, total_box, out_line_no, out_created_by, total_return_quantity, is_return, 
		total_receive_transfer_quantity, total_transfer_quantity, setup_time, process_time, 
		WorkTime, SanXuatThu, Machine, Material, Plan, Holiday, Maintenance, PO_009, PO_024, PO_020, PO_019, PO_022, PO_025, PO_032,PO_033,
		PO_008, PO_017, PO_026, PO_027, PO_028, PO_021, comment_production_status, time_noted, PO_023, bl_satloi, bl_thieumet, bl_khac, 
		pr_satloi, pr_thieumet, pr_khac, la_satloi, la_thieumet, la_khac, rw_satloi, rw_thieumet, rw_khac, sl_satloi, sl_thieumet, sl_khac, 
		po_xlcl, ot_khac, de_pa, po_setup, ot_machine, ot_force, ot_material, scrap_note, out_reason_rework
	FROM (SELECT * FROM job_status WHERE prod_status_date IS NOT NULL
			UNION
			SELECT * FROM job_out WHERE prod_status_date IS NOT NULL) as PD
	#Production status
	LEFT JOIN (
		SELECT status_code, job_id, status_shift,
			prod_status_date ,created_by, from_date,
			SUM(CASE WHEN status_code IN ("PO-013","PO-031") THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS setup_time,
			SUM(CASE WHEN status_code IN  ("PO-014","PO-017","PO-030","PO-030") THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS process_time,
			SUM(CASE WHEN status_code="PO-015" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS WorkTime,
			SUM(CASE WHEN status_code="PO-016" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS SanXuatThu,
			SUM(CASE WHEN status_code="PO-003" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS Machine,
			SUM(CASE WHEN status_code="PO-004" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS Material,
			SUM(CASE WHEN status_code="PO-005" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS Plan,
			SUM(CASE WHEN status_code="PO-006" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS Holiday,
			SUM(CASE WHEN status_code="PO-007" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS Maintenance,
			SUM(CASE WHEN status_code="PO-008" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_008,
			SUM(CASE WHEN status_code="PO-024" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_024,
			SUM(CASE WHEN status_code="PO-019" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_019,
			SUM(CASE WHEN status_code="PO-022" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_022,
			SUM(CASE WHEN status_code="PO-025" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_025,
			SUM(CASE WHEN status_code="PO-017" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_017,
			SUM(CASE WHEN status_code="PO-020" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_020,
			SUM(CASE WHEN status_code="PO-026" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_026,
			SUM(CASE WHEN status_code="PO-027" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_027,
			SUM(CASE WHEN status_code="PO-028" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_028,
			SUM(CASE WHEN status_code IN ("PO-021","PO-029") THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_021,
			SUM(CASE WHEN status_code="PO-023" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_023,
			SUM(CASE WHEN status_code="PO-032" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_032,
			SUM(CASE WHEN status_code="PO-033" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PO_033
		FROM ps_production_status
		WHERE is_deleted=0 
			AND prod_status_date BETWEEN fromDate AND toDate 
			AND IF(shift<>"",status_shift=shift,1) 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id, status_shift, prod_status_date
	) AS STT ON STT.job_id=PD.id AND STT.status_shift=PD.status_shift AND STT.prod_status_date=PD.prod_status_date
	#Table Output
	LEFT JOIN (
		SELECT out_shift, out_created_by,job_id, out_box_no,out_line_no,out_date, 
			COUNT(IF(is_marked_rework = 0,1, NULL)) AS good_roll, COUNT(IF(is_marked_rework = 1,1, NULL) OR IF(is_marked_rework = 2,1, NULL)) AS fail_roll,
            SUM(CASE WHEN is_marked_rework=0 OR is_marked_rework=5 THEN (out_quantity) END) AS out_quantity,
            SUM(CASE WHEN is_marked_rework=1 THEN (out_quantity) END) AS out_fail_quantity
		FROM ps_job_output_pouching
		WHERE out_is_deleted in (0,2) AND out_odd_box in (0,1,3) AND (out_date BETWEEN fromDate AND toDate) AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",out_shift=shift,1)
		GROUP BY out_shift, job_id, out_date
	) AS OP ON PD.id = OP.job_id AND PD.status_shift =OP.out_shift AND PD.prod_status_date=OP.out_date
	LEFT JOIN (
		SELECT out_shift, job_id, GROUP_CONCAT(CONCAT(ROUND(out_quantity,0)," Túi ",out_reason_rework) SEPARATOR ",") AS out_reason_rework, out_date
		FROM ps_job_output_pouching
		WHERE out_is_deleted in (0,2) AND is_marked_rework = 1 AND out_odd_box in (0,1,3) AND out_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",out_shift=shift,1)
		GROUP BY out_shift, job_id, out_date
	) AS OPN ON PD.id = OPN.job_id AND PD.status_shift =OPN.out_shift AND PD.prod_status_date=OPN.out_date
    LEFT JOIN (
		SELECT out_date, out_shift, job_id AS jobIDNew, COUNT(IF(out_box_no >0,1,0)) AS total_box
		FROM ps_job_output_pouching
		WHERE out_is_deleted in (0,2) AND out_odd_box in (0,2,4,6) AND out_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",out_shift=shift,1)
		GROUP BY out_shift, job_id, out_date
	) AS OPNew ON PD.id = OPNew.jobIDNew AND PD.status_shift =OPNew.out_shift AND PD.prod_status_date=OPNew.out_date
    #Table Residual
	LEFT JOIN (
		SELECT SUM(in_residual_quantity) AS in_residual_quantity, in_residual_shift, job_id, in_residual_date
		FROM ps_job_input_residual
		WHERE in_residual_is_deleted=0 AND in_residual_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",in_residual_shift=shift,1)
		GROUP BY job_id, in_residual_shift, in_residual_date
	) AS RES ON PD.id=RES.job_id AND PD.status_shift=RES.in_residual_shift AND RES.in_residual_date=PD.prod_status_date
    #INPUT
	LEFT JOIN (
		SELECT IP.job_id, in_date, in_shift, SUM(in_quantity) AS total_in_quantity
		FROM ps_job_input AS IP
		WHERE in_is_deleted=0 AND in_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",in_shift=shift,1)
		GROUP BY IP.job_id,in_shift,in_date
		ORDER BY in_date ASC
	) AS INP ON PD.id=INP.job_id AND PD.status_shift=INP.in_shift AND PD.prod_status_date=INP.in_date
	#Table Return for Transfer
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_transfer_quantity, job_id, return_shift,
			IF((TIME(created_date)<="07:30:00" ),
			DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
			DATE(created_date)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=2 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift, return_date
	) AS TRS ON PD.id=TRS.job_id AND TRS.return_date=PD.prod_status_date AND TRS.return_shift=PD.status_shift
	#Table Return for Receive Transfer
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_receive_transfer_quantity, job_id, receive_shift ,
			IF((TIME(receive_date)>="07:30:00" AND TIME(receive_date)<="23:59:59"),
			DATE(receive_date), DATE_SUB(DATE(receive_date), INTERVAL 1 DAY)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=2 AND is_received =1 
			AND IF((TIME(receive_date)<="07:30:00"), DATE_ADD(DATE(receive_date), INTERVAL -1 DAY), DATE(receive_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",receive_shift=shift,1)
		GROUP BY job_id, receive_shift, return_date
	) AS TRSR ON PD.id=TRSR.job_id AND TRSR.return_date =PD.prod_status_date AND TRSR.receive_shift=PD.status_shift
	#Table Return for Return
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_return_quantity, job_id, is_return, return_shift,
			IF((TIME(created_date)<="07:30:00"),
			DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
			DATE(created_date)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=1 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate
			AND input_trace_id IN (SELECT in_trace_id FROM ps_job_input WHERE in_is_deleted =0 AND IF(jobNo<>"",LOCATE(job_id, list_job),1))
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift, return_date
	) AS RE ON PD.id=RE.job_id AND PD.status_shift=RE.return_shift AND RE.return_date=PD.prod_status_date
	#Scrap
	LEFT JOIN (
		SELECT job_id, stage_id, reason_id, scrap_shift, scrap_date,
			SUM(CASE WHEN stage_id = 1 AND reason_id = 27 THEN scrap_quantity ELSE null END ) AS bl_satloi,
			SUM(CASE WHEN stage_id = 1 AND reason_id = 28 THEN scrap_quantity ELSE null END ) AS bl_thieumet,
			SUM(CASE WHEN stage_id = 1 AND reason_id IN (29,62)  THEN scrap_quantity ELSE null END ) AS bl_khac,
			SUM(CASE WHEN stage_id = 2 AND reason_id = 30 THEN scrap_quantity ELSE null END ) AS pr_satloi,
			SUM(CASE WHEN stage_id = 2 AND reason_id = 31 THEN scrap_quantity ELSE null END ) AS pr_thieumet,
			SUM(CASE WHEN stage_id = 2 AND reason_id in (32,49,50,51,52,53) THEN scrap_quantity ELSE null END ) AS pr_khac,
			SUM(CASE WHEN stage_id = 3 AND reason_id = 33 THEN scrap_quantity ELSE null END ) AS la_satloi,
			SUM(CASE WHEN stage_id = 3 AND reason_id = 34 THEN scrap_quantity ELSE null END ) AS la_thieumet,
			SUM(CASE WHEN stage_id = 3 AND reason_id in (35,54,55,56,57) THEN scrap_quantity ELSE null END ) AS la_khac,
			SUM(CASE WHEN stage_id = 4 AND reason_id = 36 THEN scrap_quantity ELSE null END ) AS rw_satloi,
			SUM(CASE WHEN stage_id = 4 AND reason_id = 37 THEN scrap_quantity ELSE null END ) AS rw_thieumet,
			SUM(CASE WHEN stage_id = 4 AND reason_id = 38 THEN scrap_quantity ELSE null END ) AS rw_khac,
			SUM(CASE WHEN stage_id = 5 AND reason_id = 39 THEN scrap_quantity ELSE null END ) AS sl_satloi,
			SUM(CASE WHEN stage_id = 5 AND reason_id = 40 THEN scrap_quantity ELSE null END ) AS sl_thieumet,
			SUM(CASE WHEN stage_id = 5 AND reason_id in (41,58,59) THEN scrap_quantity ELSE null END ) AS sl_khac,
			SUM(CASE WHEN stage_id = 6 AND reason_id = 47 THEN scrap_quantity ELSE null END ) AS po_setup,
			SUM(CASE WHEN stage_id = 7 AND reason_id = 46 THEN scrap_quantity ELSE null END ) AS ot_khac,
			SUM(CASE WHEN stage_id = 7 AND reason_id = 44 THEN scrap_quantity ELSE null END ) AS ot_material,
			SUM(CASE WHEN stage_id = 7 AND reason_id = 43 THEN scrap_quantity ELSE null END ) AS ot_machine,
			SUM(CASE WHEN stage_id = 7 AND reason_id = 45 THEN scrap_quantity ELSE null END ) AS ot_force,
			SUM(CASE WHEN stage_id = 6 AND reason_id in (42,60,61) THEN scrap_quantity ELSE null END ) AS po_xlcl,
			SUM(CASE WHEN stage_id = 6 AND reason_id = 48 THEN scrap_quantity ELSE null END ) AS de_pa
		FROM ps_scrap_stage
		WHERE scrap_is_deleted=0 AND scrap_date BETWEEN fromDate AND toDate AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,scrap_shift,scrap_date
	) AS sc ON sc.job_id=PD.id AND sc.scrap_shift=PD.status_shift AND sc.scrap_date=PD.prod_status_date
	LEFT JOIN (
		SELECT job_id, scrap_shift,GROUP_CONCAT(CONCAT(ROUND(scrap_quantity,0)," ",reason,scrap_note) SEPARATOR ",") as scrap_note,
			IF((TIME(scrap_created_date)>="07:30:00" AND TIME(scrap_created_date)<="23:59:59"), DATE(scrap_created_date), DATE_SUB(DATE(scrap_created_date), INTERVAL 1 DAY)) AS scrap_date 
		FROM ps_scrap_stage st
        LEFT JOIN ps_stage s ON st.stage_id = s.id
		LEFT JOIN ps_stage_reason sr ON st.reason_id =sr.id
		WHERE scrap_is_deleted=0 AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id, scrap_shift, scrap_date
	) AS SCRAP ON SCRAP.job_id=PD.id AND SCRAP.scrap_shift=PD.status_shift AND SCRAP.scrap_date=PD.prod_status_date
	
	LEFT JOIN (
		SELECT SUM(TIMESTAMPDIFF(MINUTE,from_date,to_date)) AS PO_009, status_code, job_id, status_shift,
			GROUP_CONCAT(DISTINCT(CONCAT(grid_prod_status," ", COMMENT)) SEPARATOR ",") AS comment_production_status,
			IF((TIME(from_date)>="07:30:00" AND TIME(from_date)<="23:59:59"), DATE(from_date), DATE_SUB(DATE(from_date), INTERVAL 1 DAY)) AS status_date
		FROM ps_production_status
		WHERE is_deleted=0 AND status_code in("PO-021","PO-026","PO-027","PO-028") 
			AND IF((TIME(from_date)>="07:30:00" AND TIME(from_date)<="23:59:59"),DATE(from_date), DATE_SUB(DATE(from_date), INTERVAL 1 DAY)) BETWEEN fromDate AND toDate 
			AND IF(shift<>"",status_shift=shift,1) 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY status_code, job_id,status_shift,status_date
	) AS STT12 ON PD.id=STT12.job_id AND STT12.status_shift=PD.status_shift and PD.prod_status_date=STT12.status_date
    LEFT JOIN (
		SELECT SUM(TIMESTAMPDIFF(MINUTE,from_date,to_date)) AS Diff_Time, status_code, job_id,status_shift,
			GROUP_CONCAT((CONCAT(TIMESTAMPDIFF(MINUTE,from_date,to_date),"-", COMMENT)) SEPARATOR ",") AS time_noted,
			IF((TIME(from_date)>="07:30:00" AND TIME(from_date)<="23:59:59"), DATE(from_date), DATE_SUB(DATE(from_date), INTERVAL 1 DAY)) AS status_date
		FROM ps_production_status
		WHERE is_deleted=0 AND status_code in("PO-014","PO-017","PO-013","PO-016","PO-003","PO-024","PO-023","PO-020","PO-019","PO-022","PO-025","PO-008","PO-005","PO-006","PO-007","PO-021","PO-026","PO-027","PO-028","PO-029","PO-030","PO-031","PO-032","PO-033")
			AND IF((TIME(from_date)>="07:30:00" AND TIME(from_date)<="23:59:59"),DATE(from_date), DATE_SUB(DATE(from_date), INTERVAL 1 DAY)) BETWEEN fromDate AND toDate 
            AND IF(shift<>"",status_shift=shift,1) 
            AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY  job_id,status_shift,status_date
	) AS STT32  ON PD.id=STT32.job_id AND STT32.status_shift=PD.status_shift and PD.prod_status_date=STT32.status_date
	WHERE IF(jobNo<>"",LOCATE(PD.id, list_job),1)
	GROUP BY PD.id,PD.prod_status_date,PD.status_shift
	ORDER BY from_date ASC, PD.prod_status_date ASC, PD.status_shift ASC;
    
	DROP TABLE job_status;
    DROP TABLE job_out;
	DROP TABLE job_info;
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_summary_press` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_summary_press` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_summary_press`(
	IN `machineCode` varchar(100),
    IN `jobNo` varchar(50),
    IN `shift` varchar(3),
	IN `fromDate` varchar(10),
    IN `toDate` varchar(10)
)
BEGIN
    DECLARE list_job varchar(200);
    #Get all job by department "PRESS" OR 1 MACHINE OR JOB NO to temporary table
	CREATE TEMPORARY TABLE IF NOT EXISTS job_info AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, parent_job_id, specification, SoMau
		FROM ps_prod_schedule as PD
		INNER JOIN (
			SELECT printed_name,nav_code
			FROM tbl_computer
			WHERE work_center_code="PRESS" AND printed_name IS NOT NULL AND IF(machineCode, nav_code=machineCode, 1)
		) AS C ON C.nav_code LIKE PD.machine_code
        WHERE IF(jobNo<>"", job_no=jobNo, 1)
    );
    #Set list job from temporary above
	SET list_job = (SELECT GROUP_CONCAT(DISTINCT(id) SEPARATOR ", ") as id FROM job_info);
    #CREATE TEMPORARY TABLE
    CREATE TEMPORARY TABLE IF NOT EXISTS job_status AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, parent_job_id, specification, SoMau, STT.prod_status_date, STT.status_shift
		FROM job_info as PD
		LEFT JOIN (
			SELECT prod_status_date, status_shift, job_id
			FROM ps_production_status
			WHERE is_deleted=0 
				AND prod_status_date BETWEEN fromDate AND toDate
				AND IF(shift<>"",status_shift=shift,1) 
				AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
				GROUP BY job_id,status_shift,prod_status_date
		) AS STT ON PD.id=STT.job_id
        WHERE 1
    );
    CREATE TEMPORARY TABLE IF NOT EXISTS job_out AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, parent_job_id, specification, SoMau, OPN.out_date as prod_status_date, OPN.out_shift as status_shift
		FROM job_info as PD
		LEFT JOIN (
			SELECT out_shift, out_date, job_id
			FROM ps_job_output_press
			WHERE out_is_deleted IN(0,2) AND out_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",out_shift=shift,1)
			GROUP BY out_shift,job_id,out_date
		) AS OPN ON PD.id=OPN.job_id
        WHERE 1
    );
    #SELECT list_job;
    #Summary query
    SELECT PD.*, OPN.in_put_id,
			total_transfer_quantity, total_return_quantity, total_receive_transfer_quantity, total_transfer_weight,
            total_return_weight, total_receive_transfer_weight, in_quantity, in_weight, scrap_note,
            out_date, OPN.out_quantity AS out_quantity, PD.status_shift, out_net_weight, created_by, out_created_by, PD.prod_status_date,
            SETUP, `PROCESS`, DONHANG, SXT, MT,WH,PU,RD,QC,PL, SA,PLAN, HOLIDAY, OTHER, PLANNED, INCIDENT,
            sc_setup, sc_process, sc_machine, sc_material, sc_issue, sc_other, time_noted
	FROM (SELECT * FROM job_status WHERE prod_status_date IS NOT NULL
			UNION
			SELECT * FROM job_out WHERE prod_status_date IS NOT NULL) as PD
	#Production status
    LEFT JOIN (
		SELECT status_code, job_id, status_shift, min(from_date) as min_status_date, max(to_date) as max_status_date,
			created_by, prod_status_date, GROUP_CONCAT(DISTINCT(comment) SEPARATOR ", ") as time_noted,
			AVG(speed) AS speed, from_date,
			SUM(CASE WHEN status_code="PR-001" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS SETUP,
			SUM(CASE WHEN status_code="PR-002" OR status_code="PR-003" OR status_code="PR-004" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS `PROCESS`,
			SUM(CASE WHEN status_code="PR-005" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS DONHANG,
			SUM(CASE WHEN status_code="PR-006" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS SXT,
			SUM(CASE WHEN status_code="PR-007" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS MT,
			SUM(CASE WHEN status_code="PR-008" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS WH,
			SUM(CASE WHEN status_code="PR-009" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS PU,
			SUM(CASE WHEN status_code="PR-010" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS RD,
			SUM(CASE WHEN status_code="PR-011" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS QC,
			SUM(CASE WHEN status_code="PR-012" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS PL,
			SUM(CASE WHEN status_code="PR-013" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS SA,
			SUM(CASE WHEN status_code="PR-014" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS PLAN,
			SUM(CASE WHEN status_code="PR-016" OR status_code="PR-018" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS INCIDENT,
			SUM(CASE WHEN status_code="PR-017" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS HOLIDAY,
			SUM(CASE WHEN status_code="PR-019" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS OTHER,
			SUM(CASE WHEN status_code="PR-015" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS PLANNED
		FROM ps_production_status
		WHERE is_deleted=0 
			AND prod_status_date BETWEEN fromDate AND toDate
			AND IF(shift<>"",status_shift=shift,1) 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,status_shift,prod_status_date
	) AS STT ON STT.job_id=PD.id AND STT.status_shift=PD.status_shift AND STT.prod_status_date=PD.prod_status_date
    #Table Output
    LEFT JOIN (
		SELECT in_put_id, out_shift, out_created_by, job_id, out_date, SUM(out_quantity) AS out_quantity, SUM(out_net_weight) AS out_net_weight
		FROM ps_job_output_press
		WHERE out_is_deleted IN(0,2) AND out_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",out_shift=shift,1)
		GROUP BY out_shift,job_id,out_date
	) AS OPN ON PD.id=OPN.job_id AND PD.status_shift=OPN.out_shift AND PD.prod_status_date=OPN.out_date
    #INPUT
    LEFT JOIN (
		SELECT IP.job_id, in_shift, in_date, SUM(in_quantity) AS in_quantity, SUM(ghep_in_weight) as in_weight
		FROM ps_job_input AS IP
		WHERE in_is_deleted = 0 AND in_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",in_shift=shift,1)
		GROUP BY IP.job_id,in_date,in_shift
	) AS INP ON PD.id=INP.job_id AND PD.prod_status_date=INP.in_date AND PD.status_shift=INP.in_shift
    #Table Return for Transfer
    LEFT JOIN (
		SELECT SUM(return_quantity) AS total_transfer_quantity,job_id,sum(return_weight) as total_transfer_weight,
            return_shift,
            IF((TIME(created_date)<="07:30:00" ),
            DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
            DATE(created_date)) AS return_date
		FROM ps_material_return AS R
		WHERE is_deleted=0 AND is_return=2 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate 
            AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
            AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift, return_date
	) AS TRS ON PD.id=TRS.job_id AND TRS.return_date=PD.prod_status_date AND TRS.return_shift=PD.status_shift
    #Table Return for Receive Transfer
    LEFT JOIN (
		SELECT SUM(return_quantity) AS total_return_quantity,job_id,is_return,sum(return_weight) as total_return_weight,
            return_shift,
            IF((TIME(created_date)<="07:30:00"),
            DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
            DATE(created_date)) AS return_date
		FROM ps_material_return as R
		WHERE is_deleted=0 AND is_return=1
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift, return_date
	) AS RE ON PD.id=RE.job_id AND RE.return_date=PD.prod_status_date AND RE.return_shift=PD.status_shift
    #Table Return for Return
    LEFT JOIN (
		SELECT SUM(return_quantity) AS total_receive_transfer_quantity,job_id,MAX(input_trace_id) as return_trace_id,sum(return_weight) as total_receive_transfer_weight,
            receive_shift,		
            IF((TIME(receive_date)<="07:30:00"), 
            DATE_ADD(DATE(receive_date), INTERVAL -1 DAY),
            DATE(receive_date)) AS return_date
		FROM ps_material_return AS R
		WHERE is_deleted=0 AND is_return=2 AND is_received=1
			AND IF((TIME(receive_date)<="07:30:00"), DATE_ADD(DATE(receive_date), INTERVAL -1 DAY), DATE(receive_date)) BETWEEN fromDate AND toDate 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",receive_shift=shift,1)
		GROUP BY job_id, receive_shift, return_date
	) AS TRSR ON PD.id=TRSR.job_id AND TRSR.return_date=PD.prod_status_date AND TRSR.receive_shift=PD.status_shift
    #Scrap
    LEFT JOIN (
		SELECT job_id, stage_id, sr.reason_code, scrap_shift, scrap_date, GROUP_CONCAT(DISTINCT(scrap_note) SEPARATOR ", ") as scrap_note,
			SUM(CASE WHEN sr.reason_code = "SETUP" 		THEN scrap_quantity ELSE 0 END ) AS sc_setup,
			SUM(CASE WHEN sr.reason_code = "PROCESS" 	THEN scrap_quantity ELSE 0 END ) AS sc_process,
			SUM(CASE WHEN sr.reason_code = "MACHINE" 	THEN scrap_quantity ELSE 0 END ) AS sc_machine,
			SUM(CASE WHEN sr.reason_code = "MATERIAL" 	THEN scrap_quantity ELSE 0 END ) AS sc_material,
			SUM(CASE WHEN sr.reason_code = "ISSUE" 		THEN scrap_quantity ELSE 0 END ) AS sc_issue,
			SUM(CASE WHEN sr.reason_code = "OTHER" 		THEN scrap_quantity ELSE 0 END ) AS sc_other
		FROM ps_scrap_stage AS ss
		LEFT JOIN ps_stage_reason AS sr ON ss.reason_id=sr.id
		WHERE scrap_is_deleted=0 AND job_test_id=0
			AND scrap_date BETWEEN fromDate AND toDate AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,scrap_shift,scrap_date
	) AS sc ON sc.job_id=PD.id AND sc.scrap_shift=PD.status_shift AND PD.prod_status_date=sc.scrap_date
    WHERE IF(jobNo<>"",LOCATE(PD.id, list_job),1)
	GROUP BY PD.id,PD.prod_status_date,PD.status_shift
	ORDER BY from_date ASC, PD.prod_status_date ASC, PD.status_shift ASC;
    DROP TABLE job_status;
    DROP TABLE job_out;
    DROP TABLE job_info;
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_summary_rework` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_summary_rework` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_summary_rework`(
	IN `machineCode` VARCHAR(100),
	IN `jobNo` VARCHAR(50),
	IN `shift` VARCHAR(3),
	IN `fromDate` VARCHAR(10),
	IN `toDate` VARCHAR(10)
)
BEGIN
	DECLARE list_job text;
	#Get all job by department "R-REWORK" OR 1 MACHINE OR JOB NO to temporary table
	CREATE TEMPORARY TABLE IF NOT EXISTS job_info AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, lanes, CuChieuDaiCuon
		FROM `ps_prod_schedule` as PD
		INNER JOIN (
			SELECT printed_name,nav_code
			FROM tbl_computer
			WHERE work_center_code="R-REWORK" AND printed_name IS NOT NULL AND IF(machineCode, nav_code=machineCode, 1)
		) AS C ON C.nav_code=PD.machine_code
        WHERE IF(jobNo<>"", job_no=jobNo, 1)
    );
    #Set list job from temporary above
    SET list_job = (SELECT GROUP_CONCAT(DISTINCT(id) SEPARATOR ", ") as id FROM job_info);
    #Summary query
	SELECT PD.*,
		OP.out_shift, OP.out_date, total_return_quantity, OP.out_date, OP.out_quantity AS total_out_quantity,status_shift,prod_status_date,created_by,
        good_roll, total_transfer_quantity, OP.out_created_by, total_receive_transfer_quantity, total_return_quantity,
		PreparationTime, Machine, WorkTime, OthersTime, bl, pr, la, rw, sl, others, SCRAP.note, OP.out_quantity AS total_rewind_quantity
	FROM job_info as PD
	#Production status
	LEFT JOIN (
		SELECT status_code, job_id, status_shift,
			prod_status_date ,created_by, 
			SUM(CASE WHEN status_code="SL-013" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PreparationTime,
			SUM(CASE WHEN status_code="SL-015" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS WorkTime,
			SUM(CASE WHEN status_code="SL-003" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS Machine,
			SUM(CASE WHEN status_code="SL-009" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS OthersTime
		FROM ps_production_status
		WHERE is_deleted=0 
			AND prod_status_date BETWEEN fromDate AND toDate 
			AND IF(shift<>"",status_shift=shift,1) 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id, status_shift, prod_status_date
	) AS STT ON PD.id=STT.job_id 
	#Table Output
	LEFT JOIN (
		SELECT job_id, out_shift, out_created_by, out_date, COUNT(IF(out_quantity > 0,1,NULL)) AS good_roll,
			SUM(out_quantity) AS out_quantity
		FROM ps_job_output
		WHERE out_is_deleted=0  AND is_marked_rework=2 AND no_of_rewind>0 AND (out_date BETWEEN fromDate AND toDate) AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",out_shift=shift,1)
		GROUP BY out_shift, job_id, out_date
	) AS OP ON STT.job_id = OP.job_id AND STT.status_shift =OP.out_shift AND STT.prod_status_date=OP.out_date
	#Table Return for Transfer
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_transfer_quantity, job_id, return_shift,
			IF((TIME(created_date)<="07:30:00" ),
			DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
			DATE(created_date)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=2 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift, return_date
	) AS TRS ON STT.job_id=TRS.job_id AND TRS.return_date=STT.prod_status_date AND TRS.return_shift=STT.status_shift
	#Table Return for Receive Transfer
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_receive_transfer_quantity, job_id, receive_shift ,
			IF((TIME(receive_date)>="07:30:00" AND TIME(receive_date)<="23:59:59"),
			DATE(receive_date), DATE_SUB(DATE(receive_date), INTERVAL 1 DAY)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=2 AND is_received =1 
			AND IF((TIME(receive_date)<="07:30:00"), DATE_ADD(DATE(receive_date), INTERVAL -1 DAY), DATE(receive_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",receive_shift=shift,1)
		GROUP BY job_id, receive_shift, return_date
	) AS TRSR ON STT.job_id=TRSR.job_id AND TRSR.return_date=STT.prod_status_date AND TRSR.receive_shift=OP.out_shift
	#Table Return for Return
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_return_quantity, job_id, is_return, return_shift,
			IF((TIME(created_date)<="07:30:00"),
			DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
			DATE(created_date)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=1 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift, return_date
	) AS RE ON STT.job_id=RE.job_id AND STT.status_shift=RE.return_shift AND RE.return_date=STT.prod_status_date
	#Scrap
	LEFT JOIN (
		SELECT job_id, stage_id, reason_id, scrap_shift, scrap_date,
			SUM(CASE WHEN stage_id = 1 AND reason_id = 21 THEN scrap_quantity ELSE null END ) AS bl,
			SUM(CASE WHEN stage_id = 2 AND reason_id = 22 THEN scrap_quantity ELSE null END ) AS pr,
			SUM(CASE WHEN stage_id = 3 AND reason_id = 23 THEN scrap_quantity ELSE null END ) AS la,
			SUM(CASE WHEN stage_id = 4 AND reason_id = 24 THEN scrap_quantity ELSE null END ) AS rw,
			SUM(CASE WHEN stage_id = 5 AND reason_id = 25 THEN scrap_quantity ELSE null END ) AS sl,
			SUM(CASE WHEN stage_id = 7 AND reason_id in ( 26,269) THEN scrap_quantity ELSE null END ) AS others
		FROM ps_scrap_stage
		WHERE scrap_is_deleted=0 AND scrap_date BETWEEN fromDate AND toDate AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,scrap_shift,scrap_date
	) AS sc ON sc.job_id=STT.job_id AND sc.scrap_shift=STT.status_shift AND sc.scrap_date=STT.prod_status_date
	LEFT JOIN (
		SELECT job_id, scrap_shift,
			GROUP_CONCAT(DISTINCT(scrap_note) SEPARATOR ",") as note,
			IF((TIME(scrap_created_date)>="07:30:00" AND TIME(scrap_created_date)<="23:59:59"), DATE(scrap_created_date), DATE_SUB(DATE(scrap_created_date), INTERVAL 1 DAY)) AS scrap_date
		FROM ps_scrap_stage
		WHERE scrap_is_deleted=0 AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id, scrap_shift, scrap_date
	) AS SCRAP ON SCRAP.job_id=STT.job_id AND SCRAP.scrap_shift=STT.status_shift AND SCRAP.scrap_date=STT.prod_status_date
	
	
	WHERE prod_status_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(id, list_job),1)
	GROUP BY id, prod_status_date, status_shift
	ORDER BY prod_status_date ASC, status_shift ASC, machine_code;
	
	DROP TABLE job_info;
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_summary_rework_online` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_summary_rework_online` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_summary_rework_online`(
	IN `machineCode` VARCHAR(100),
	IN `jobNo` VARCHAR(50),
	IN `shift` VARCHAR(3),
	IN `fromDate` VARCHAR(10),
	IN `toDate` VARCHAR(10)
)
BEGIN
	DECLARE list_job text;
	#Get all job by department "SLITTING" OR 1 MACHINE OR JOB NO to temporary table
	CREATE TEMPORARY TABLE IF NOT EXISTS job_info AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, lanes, CuChieuDaiCuon
		FROM `ps_prod_schedule` as PD
		INNER JOIN (
			SELECT printed_name,nav_code
			FROM tbl_computer
			WHERE work_center_code="SLITTING" AND printed_name IS NOT NULL AND IF(machineCode, nav_code=machineCode, 1)
		) AS C ON C.nav_code=PD.machine_code
        WHERE IF(jobNo<>"", job_no=jobNo, 1)
    );
    #Set list job from temporary above
    SET list_job = (SELECT GROUP_CONCAT(DISTINCT(id) SEPARATOR ", ") as id FROM job_info);
    #Summary query
	SELECT PD.*,
		OP.out_shift, OP.out_date, total_return_quantity, OP.out_date, OP.out_quantity AS total_out_quantity,prod_status_date,STT.status_shift,created_by,
        good_roll, total_transfer_quantity, OP.out_created_by, total_receive_transfer_quantity, total_return_quantity,
		PreparationTime, Machine, WorkTime, OthersTime, bl, pr, la, rw, sl, others, SCRAP.note, OP.out_quantity AS total_rewind_quantity
	FROM job_info as PD
	#Production status
	LEFT JOIN (
		SELECT status_code, job_id, status_shift,
			prod_status_date ,created_by, 
			SUM(CASE WHEN status_code="SL-013" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS PreparationTime,
			SUM(CASE WHEN status_code="SL-015" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS WorkTime,
			SUM(CASE WHEN status_code="SL-003" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS Machine,
			SUM(CASE WHEN status_code="SL-009" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE NULL END ) AS OthersTime
		FROM ps_production_status
		WHERE is_deleted=0 
			AND prod_status_date BETWEEN fromDate AND toDate 
			AND IF(shift<>"",status_shift=shift,1) 
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id, status_shift, prod_status_date
	) AS STT ON PD.id=STT.job_id 
	#Table Output
	LEFT JOIN (
		SELECT job_id, out_shift, out_created_by, out_date,  COUNT(IF(out_quantity <> 0,1,NULL)) AS good_roll,
			SUM(out_quantity) AS out_quantity
		FROM ps_job_output
		WHERE out_is_deleted=0 AND is_marked_rework=2 AND no_of_rewind>0 AND (out_date BETWEEN fromDate AND toDate) AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",out_shift=shift,1)
		GROUP BY out_shift, job_id, out_date
	) AS OP ON STT.job_id = OP.job_id AND STT.status_shift =OP.out_shift AND STT.prod_status_date=OP.out_date
	#Table Return for Transfer
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_transfer_quantity, job_id, return_shift,
			IF((TIME(created_date)<="07:30:00" ),
			DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
			DATE(created_date)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=2 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift, return_date
	) AS TRS ON STT.job_id=TRS.job_id AND TRS.return_date=STT.prod_status_date AND TRS.return_shift=STT.status_shift
	#Table Return for Receive Transfer
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_receive_transfer_quantity, job_id, receive_shift ,
			IF((TIME(receive_date)>="07:30:00" AND TIME(receive_date)<="23:59:59"),
			DATE(receive_date), DATE_SUB(DATE(receive_date), INTERVAL 1 DAY)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=2 AND is_received =1 
			AND IF((TIME(receive_date)<="07:30:00"), DATE_ADD(DATE(receive_date), INTERVAL -1 DAY), DATE(receive_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",receive_shift=shift,1)
		GROUP BY job_id, receive_shift, return_date
	) AS TRSR ON STT.job_id=TRSR.job_id AND TRSR.return_date=STT.prod_status_date AND TRSR.receive_shift=OP.out_shift
	#Table Return for Return
	LEFT JOIN (
		SELECT SUM(return_quantity) AS total_return_quantity, job_id, is_return, return_shift,
			IF((TIME(created_date)<="07:30:00"),
			DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
			DATE(created_date)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=1 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift, return_date
	) AS RE ON STT.job_id=RE.job_id AND STT.status_shift=RE.return_shift AND RE.return_date=STT.prod_status_date
	#Scrap
	LEFT JOIN (
		SELECT job_id, stage_id, reason_id, scrap_shift, scrap_date,
			SUM(CASE WHEN stage_id = 1 AND reason_id = 21 THEN scrap_quantity ELSE null END ) AS bl,
			SUM(CASE WHEN stage_id = 2 AND reason_id = 22 THEN scrap_quantity ELSE null END ) AS pr,
			SUM(CASE WHEN stage_id = 3 AND reason_id = 23 THEN scrap_quantity ELSE null END ) AS la,
			SUM(CASE WHEN stage_id = 4 AND reason_id = 24 THEN scrap_quantity ELSE null END ) AS rw,
			SUM(CASE WHEN stage_id = 5 AND reason_id = 25 THEN scrap_quantity ELSE null END ) AS sl,
			SUM(CASE WHEN stage_id = 7 AND reason_id IN ( 26,269) THEN scrap_quantity ELSE null END ) AS others
		FROM ps_scrap_stage
		WHERE scrap_is_deleted=0 AND scrap_date BETWEEN fromDate AND toDate AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,scrap_shift,scrap_date
	) AS sc ON sc.job_id=STT.job_id AND sc.scrap_shift=STT.status_shift AND sc.scrap_date=STT.prod_status_date
	LEFT JOIN (
		SELECT job_id, scrap_shift,
			GROUP_CONCAT(DISTINCT(scrap_note) SEPARATOR ",") as note,
			IF((TIME(scrap_created_date)>="07:30:00" AND TIME(scrap_created_date)<="23:59:59"), DATE(scrap_created_date), DATE_SUB(DATE(scrap_created_date), INTERVAL 1 DAY)) AS scrap_date
		FROM ps_scrap_stage
		WHERE scrap_is_deleted=0 AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id, scrap_shift, scrap_date
	) AS SCRAP ON SCRAP.job_id=STT.job_id AND SCRAP.scrap_shift=STT.status_shift AND SCRAP.scrap_date=STT.prod_status_date
	
	WHERE prod_status_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(id, list_job),1)
	GROUP BY id, prod_status_date, status_shift
	ORDER BY prod_status_date ASC, status_shift ASC, machine_code;
	
	
	DROP TABLE job_info;
END */$$
DELIMITER ;

/* Procedure structure for procedure `st_get_summary_slitting` */

/*!50003 DROP PROCEDURE IF EXISTS  `st_get_summary_slitting` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `st_get_summary_slitting`(
	IN `machineCode` VARCHAR(100),
	IN `jobNo` VARCHAR(50),
	IN `shift` VARCHAR(3),
	IN `fromDate` VARCHAR(10),
	IN `toDate` VARCHAR(10)
)
BEGIN
	DECLARE list_job text;
	#Get all job by department "SLITTING" OR 1 MACHINE OR JOB NO to temporary table
	CREATE TEMPORARY TABLE IF NOT EXISTS job_info AS (
		SELECT id, machine_name, printed_name, job_no, prod_name, machine_code, lanes, specification, fg_code
		FROM `ps_prod_schedule` as PD
		INNER JOIN (
			SELECT printed_name,nav_code
			FROM tbl_computer
			WHERE work_center_code="SLITTING" AND printed_name IS NOT NULL AND IF(machineCode, nav_code=machineCode, 1)
		) AS C ON C.nav_code=PD.machine_code
        WHERE IF(jobNo<>"", job_no=jobNo, 1)
    );
    #Set list job from temporary above
    SET list_job = (SELECT GROUP_CONCAT(DISTINCT(id) SEPARATOR ", ") as id FROM job_info);
    #Summary query
	SELECT PD.*,
		min_out_date, min_status_date, max_status_date, in_residual_quantity, INP.*, OPN.*, OPN.out_quantity AS total_out_quantity,prod_status_date,STT.status_shift,STT.created_by,
		OPN.out_fail_quantity AS total_out_fail_quantity, OPN.out_shift, OPN.good_roll, OPN.fail_roll, out_created_by, total_sub_quantity, total_return_quantity,
		is_return, total_transfer_quantity, total_receive_transfer_quantity, PreparationTime, RD, WorkTime, ChangingCore, Rewind, Machine, Material, Plan,
		Holiday, Maintenance, Forces, Others, QC, WH, stop_RD, PL, bl_satloi, bl_thieumet, bl_khac, pr_satloi, pr_thieumet, pr_khac, la_satloi, la_thieumet, la_khac, rw_satloi,
		rw_thieumet, rw_khac, sl_setup, sl_xulycl, ot_machine, ot_material, ot_force, ot_khac, SCRAP.note, speed, bu_met
	FROM job_info as PD
	#Production status
   LEFT JOIN (
		SELECT status_code, job_id,status_shift,MIN(from_date) AS min_status_date, MAX(to_date) AS max_status_date,
			prod_status_date ,created_by, 
			SUM(CASE WHEN `status_code`="SL-013" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS PreparationTime,
			SUM(CASE WHEN `status_code`="SL-014" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS RD,
			SUM(CASE WHEN `status_code`="SL-015" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS WorkTime,
			SUM(CASE WHEN `status_code`="SL-013" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS ChangingCore,
			SUM(CASE WHEN `status_code`="SL-017" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS Rewind,
			SUM(CASE WHEN `status_code`="SL-003" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS Machine,
			SUM(CASE WHEN `status_code`="SL-004" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS Material,
			SUM(CASE WHEN `status_code`="SL-005" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS Plan,
			SUM(CASE WHEN `status_code`="SL-006" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS Holiday,
			SUM(CASE WHEN `status_code`="SL-007" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS Maintenance,
			SUM(CASE WHEN `status_code`="SL-008" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS Forces,
			SUM(CASE WHEN `status_code`="SL-009" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS Others,
			SUM(CASE WHEN `status_code`="SL-018" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS QC,
			SUM(CASE WHEN `status_code`="SL-019" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS PL,
			SUM(CASE WHEN `status_code`="SL-021" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS stop_RD,
			SUM(CASE WHEN `status_code`="SL-020" THEN TIMESTAMPDIFF(MINUTE,from_date,to_date) ELSE 0 END ) AS WH
		FROM ps_production_status
		WHERE is_deleted=0 
			AND prod_status_date BETWEEN fromDate AND toDate 
            AND IF(shift<>"",status_shift=shift,1) 
            AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,status_shift,prod_status_date
	) AS STT ON PD.id=STT.job_id 
	#Table Output
   LEFT JOIN (
		SELECT out_shift, out_created_by,job_id AS jobID,MAX(out_quantity) as max_quantity,MAX(out_lane_no) as lane_no,
				out_date,min(out_created_date) as min_out_date,GROUP_CONCAT(DISTINCT(out_reason_rework )SEPARATOR ",") as out_reason_rework,
				COUNT(IF(is_marked_rework = 0,1,NULL)) AS good_roll,
				COUNT(IF(is_marked_rework = 1,1,NULL)) AS fail_roll,
				SUM(IF(is_marked_rework = 0,out_metter_according_mother_scroll,0)) AS out_quantity,
				SUM(IF(is_marked_rework = 1,out_metter_according_mother_scroll,0)) AS out_fail_quantity
		FROM ps_job_output
		WHERE out_is_deleted IN(0,2) AND is_marked_rework IN (0,1) AND (out_date BETWEEN fromDate AND toDate) AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",out_shift=shift,1)
		GROUP BY out_shift, job_id, out_date
	) AS OPN ON STT.job_id = OPN.jobID AND STT.status_shift =OPN.out_shift AND STT.prod_status_date=OPN.out_date
    #INPUT
   LEFT JOIN (
		SELECT IP.job_id, in_date, in_shift, SUM(in_quantity) AS total_in_quantity
		FROM ps_job_input AS IP
		WHERE in_is_deleted in(0,2) AND in_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",in_shift=shift,1)
		GROUP BY IP.job_id,in_date,in_shift
	) AS INP ON STT.job_id=INP.job_id AND STT.status_shift=INP.in_shift AND STT.prod_status_date=INP.in_date
	#SUB_INPUT
	LEFT JOIN (
		SELECT SUM(sub_quantity) AS total_sub_quantity,sub_shift,job_id, sub_date
		FROM ps_job_input_sub_trace_id
		WHERE sub_is_deleted=0 AND sub_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",IF(jobNo<>"",LOCATE(job_id, list_job),1),1) AND IF(shift<>"",sub_shift=shift,1)
		GROUP BY job_id, sub_shift, sub_date
	) AS SUB ON STT.job_id=SUB.job_id AND STT.status_shift=SUB.sub_shift AND SUB.sub_date=STT.prod_status_date
	#Table Return for Transfer
   LEFT JOIN (
		SELECT SUM(return_quantity) AS total_transfer_quantity,job_id, return_shift,
			IF((TIME(created_date)<="07:30:00" ),
			DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
			DATE(created_date)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=2 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift,return_date
	) AS TRS ON STT.job_id=TRS.job_id AND TRS.return_date=STT.prod_status_date AND TRS.return_shift=STT.status_shift
   #Table Return for Receive Transfer
   LEFT JOIN (
		SELECT SUM(return_quantity) AS total_receive_transfer_quantity,job_id, receive_shift ,
			IF((TIME(receive_date)>="07:30:00" AND TIME(receive_date)<="23:59:59"),
			DATE(receive_date), DATE_SUB(DATE(receive_date), INTERVAL 1 DAY)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=2 AND is_received =1 
			AND IF((TIME(receive_date)<="07:30:00"), DATE_ADD(DATE(receive_date), INTERVAL -1 DAY), DATE(receive_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",receive_shift=shift,1)
		GROUP BY job_id, receive_shift,return_date
	) AS TRSN ON STT.job_id=TRSN.job_id AND TRSN.return_date =STT.prod_status_date AND TRSN.receive_shift=STT.status_shift
   #Table Return for Return
   LEFT JOIN (
		SELECT SUM(return_quantity) AS total_return_quantity,job_id,is_return,return_shift,
			IF((TIME(created_date)<="07:30:00"),
			DATE_ADD(DATE(created_date), INTERVAL -1 DAY),
			DATE(created_date)) AS return_date
		FROM ps_material_return
		WHERE is_deleted=0 AND is_return=1 
			AND IF((TIME(created_date)<="07:30:00"), DATE_ADD(DATE(created_date), INTERVAL -1 DAY), DATE(created_date)) BETWEEN fromDate AND toDate
			AND IF(jobNo<>"",LOCATE(job_id, list_job),1) 
			AND IF(shift<>"",return_shift=shift,1)
		GROUP BY job_id, return_shift,return_date
	) AS RE ON STT.job_id=RE.job_id AND STT.status_shift=RE.return_shift AND RE.return_date=STT.prod_status_date
	#Table Residual
   LEFT JOIN (
		SELECT SUM(in_residual_quantity) AS in_residual_quantity, in_residual_shift, job_id, in_residual_date
		FROM ps_job_input_residual
		WHERE in_residual_is_deleted=0 AND in_residual_date BETWEEN fromDate AND toDate AND IF(jobNo<>"",LOCATE(job_id, list_job),1) AND IF(shift<>"",in_residual_shift=shift,1)
		GROUP BY job_id, in_residual_shift, in_residual_date
	) AS RES ON STT.job_id=RES.job_id AND STT.status_shift=RES.in_residual_shift AND RES.in_residual_date=STT.prod_status_date
	#Scrap
   LEFT JOIN (
		SELECT job_id, stage_id, reason_id, scrap_shift, scrap_date,
			SUM(CASE WHEN stage_id = 1 AND reason_id = 1   THEN scrap_quantity ELSE 0 END ) AS bl_satloi,
			SUM(CASE WHEN stage_id = 1 AND reason_id = 2   THEN scrap_quantity ELSE 0 END ) AS bl_thieumet,
			SUM(CASE WHEN stage_id = 1 AND reason_id = 3   THEN scrap_quantity ELSE 0 END ) AS bl_khac,
			SUM(CASE WHEN stage_id = 2 AND reason_id = 4   THEN scrap_quantity ELSE 0 END ) AS pr_satloi,
			SUM(CASE WHEN stage_id = 2 AND reason_id = 5   THEN scrap_quantity ELSE 0 END ) AS pr_thieumet,
			SUM(CASE WHEN stage_id = 2 AND reason_id = 6   THEN scrap_quantity ELSE 0 END ) AS pr_khac,
			SUM(CASE WHEN stage_id = 3 AND reason_id = 7   THEN scrap_quantity ELSE 0 END ) AS la_satloi,
			SUM(CASE WHEN stage_id = 3 AND reason_id = 8   THEN scrap_quantity ELSE 0 END ) AS la_thieumet,
			SUM(CASE WHEN stage_id = 3 AND reason_id = 9   THEN scrap_quantity ELSE 0 END ) AS la_khac,
			SUM(CASE WHEN stage_id = 4 AND reason_id = 10  THEN scrap_quantity ELSE 0 END ) AS rw_satloi,
			SUM(CASE WHEN stage_id = 4 AND reason_id = 11  THEN scrap_quantity ELSE 0 END ) AS rw_thieumet,
			SUM(CASE WHEN stage_id = 4 AND reason_id = 12  THEN scrap_quantity ELSE 0 END ) AS rw_khac,
			SUM(CASE WHEN stage_id = 5 AND reason_id = 13  THEN scrap_quantity ELSE 0 END ) AS sl_setup,
			SUM(CASE WHEN stage_id = 5 AND reason_id = 14  THEN scrap_quantity ELSE 0 END ) AS sl_xulycl,
			SUM(CASE WHEN stage_id = 7 AND reason_id = 16  THEN scrap_quantity ELSE 0 END ) AS ot_machine,
			SUM(CASE WHEN stage_id = 7 AND reason_id = 17  THEN scrap_quantity ELSE 0 END ) AS ot_material,
			SUM(CASE WHEN stage_id = 7 AND reason_id = 18  THEN scrap_quantity ELSE 0 END ) AS ot_force,
			SUM(CASE WHEN stage_id = 7 AND reason_id = 19  THEN scrap_quantity ELSE 0 END ) AS ot_khac,
			SUM(CASE WHEN stage_id = 5 AND reason_id = 115 THEN scrap_quantity ELSE 0 END ) AS bu_met
		FROM ps_scrap_stage
		WHERE scrap_is_deleted=0 AND scrap_date BETWEEN fromDate AND toDate AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,scrap_shift,scrap_date
	) AS sc ON sc.job_id=PD.id AND sc.scrap_shift=STT.status_shift AND sc.scrap_date=STT.prod_status_date
	LEFT JOIN (
		SELECT job_id, scrap_shift, GROUP_CONCAT(CONCAT_WS(' ', CONCAT_WS(' ', CONCAT(FORMAT(scrap_quantity,0),'m'),CONCAT(reason,':')), scrap_note) SEPARATOR ", ")  AS note, scrap_date
		FROM ps_scrap_stage ps, ps_stage_reason pt
		WHERE scrap_is_deleted=0 AND ps.reason_id =pt.id AND IF(shift<>"",scrap_shift=shift,1) AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY job_id,scrap_shift,scrap_date
	) AS SCRAP ON SCRAP.job_id=PD.id AND SCRAP.scrap_shift=STT.status_shift AND SCRAP.scrap_date=STT.prod_status_date
	
	LEFT JOIN (
		SELECT AVG(speed) AS speed, status_code, job_id,status_shift,
			IF((TIME(from_date)>="07:30:00" AND TIME(from_date)<="23:59:59"),
			DATE(from_date), DATE_SUB(DATE(from_date), INTERVAL 1 DAY)
			) AS status_date
		FROM ps_production_status
		WHERE is_deleted=0 AND speed >0 
			AND IF((TIME(from_date)>="07:30:00" AND TIME(from_date)<="23:59:59"),DATE(from_date), DATE_SUB(DATE(from_date), INTERVAL 1 DAY)) BETWEEN fromDate AND toDate 
            AND IF(shift<>"",status_shift=shift,1) 
            AND IF(jobNo<>"",LOCATE(job_id, list_job),1)
		GROUP BY status_code, job_id,status_shift,status_date
	) AS STT13 ON PD.id=STT13.job_id AND STT13.status_shift=STT.status_shift and STT.prod_status_date=STT13.status_date
	WHERE (prod_status_date BETWEEN fromDate AND toDate) AND IF(jobNo<>"",LOCATE(id, list_job),1)
	GROUP BY id, STT.prod_status_date,STT.status_shift
	ORDER BY STT.prod_status_date ASC, STT.status_shift ASC;
	
	DROP TABLE job_info;
END */$$
DELIMITER ;

/*Table structure for table `view_delete` */

DROP TABLE IF EXISTS `view_delete`;

/*!50001 DROP VIEW IF EXISTS `view_delete` */;
/*!50001 DROP TABLE IF EXISTS `view_delete` */;

/*!50001 CREATE TABLE  `view_delete`(
 `trace_id` varchar(15) ,
 `is_used` tinyint(1) ,
 `job_id` bigint(20) ,
 `COUNT(trace_id)` bigint(21) 
)*/;

/*Table structure for table `view_job_input_wip` */

DROP TABLE IF EXISTS `view_job_input_wip`;

/*!50001 DROP VIEW IF EXISTS `view_job_input_wip` */;
/*!50001 DROP TABLE IF EXISTS `view_job_input_wip` */;

/*!50001 CREATE TABLE  `view_job_input_wip`(
 `id` int(11) ,
 `prod_order_no` varchar(20) ,
 `machine_center_code` varchar(50) ,
 `machine_center_name` varchar(50) ,
 `work_center_code` varchar(50) ,
 `trace_id` bigint(20) ,
 `created_date` datetime ,
 `item_no` varchar(20) ,
 `description` varchar(50) ,
 `variant_code` varchar(20) ,
 `total_output` int(1) 
)*/;

/*Table structure for table `view_press_completed` */

DROP TABLE IF EXISTS `view_press_completed`;

/*!50001 DROP VIEW IF EXISTS `view_press_completed` */;
/*!50001 DROP TABLE IF EXISTS `view_press_completed` */;

/*!50001 CREATE TABLE  `view_press_completed`(
 `id` int(11) ,
 `Prod_Order_No` varchar(20) ,
 `Prod_Order_Line_No` varchar(20) ,
 `Operation_No` varchar(20) ,
 `machine_type` varchar(50) ,
 `machine_center_code` varchar(50) ,
 `machine_center_name` varchar(50) ,
 `work_center_code` varchar(50) ,
 `step_width` varchar(20) ,
 `order_no` int(11) ,
 `is_completed` varchar(2) ,
 `is_suspended` varchar(2) ,
 `is_disabled` varchar(2) ,
 `is_art_approved` varchar(1) ,
 `is_trial` varchar(2) ,
 `is_trial_approved` varchar(1) ,
 `mounted` varchar(1) ,
 `plate_status` varchar(2) ,
 `trial_issues` text ,
 `art_issues` text ,
 `art_approved_date` varchar(20) ,
 `art_approved_by` varchar(11) ,
 `trial_approved_by` varchar(11) ,
 `trial_approved_date` varchar(2) ,
 `is_last_step` varchar(2) ,
 `is_complete_approved` varchar(2) ,
 `complete_approved_by` varchar(11) ,
 `complete_approved_date` varchar(20) ,
 `Combo_No` varchar(10) ,
 `press_art` varchar(25) ,
 `last_order_no` varchar(11) ,
 `new_machine_center` varchar(50) ,
 `art_approved_by_api` varchar(11) ,
 `trial_approved_by_api` varchar(11) ,
 `sample_required` varchar(2) ,
 `csr_required` varchar(2) ,
 `csr_required_approved` varchar(2) ,
 `csr_required_quantity` varchar(20) ,
 `csr_required_uom` varchar(50) ,
 `csr_required_dept` varchar(50) ,
 `csr_approved_by` varchar(11) ,
 `csr_approved_by_api` varchar(11) ,
 `csr_approved_date` varchar(20) ,
 `marketing_required` varchar(2) ,
 `marketing_required_approved` varchar(2) ,
 `marketing_required_quantity` varchar(20) ,
 `marketing_required_uom` varchar(50) ,
 `marketing_required_dept` varchar(50) ,
 `marketing_approved_by` varchar(11) ,
 `marketing_approved_by_api` varchar(11) ,
 `marketing_approved_date` varchar(20) ,
 `suspended_from` varchar(20) ,
 `reschedule_to` varchar(20) ,
 `reschedule_issues` text ,
 `is_rescheduled` varchar(2) ,
 `graphic_status` varchar(20) ,
 `is_restarted` varchar(2) ,
 `created_date` varchar(20) ,
 `completed_from` varchar(20) ,
 `is_archived` varchar(4) ,
 `archived_date` varchar(20) ,
 `Next_Operation_No` varchar(10) ,
 `Previous_to_Suspend_No` varchar(20) ,
 `SFT_Status` varchar(100) ,
 `Task_Status` varchar(100) ,
 `Fixed_Scrap_Quantity_FEET` varchar(20) ,
 `Fixed_Scrap_Quantity` varchar(20) ,
 `Scrap_Factor` varchar(20) ,
 `Input_Quantity_FEET` varchar(20) ,
 `Input_Quantity` varchar(20) ,
 `Output_Quantity` varchar(20) ,
 `Output_Quantity_FEET` varchar(20) ,
 `Expected_Capacity_Need_Mins` varchar(20) ,
 `Routing_Status` varchar(100) ,
 `Production_UOM` varchar(20) ,
 `Remaining_Quantity` varchar(20) ,
 `V2UOM_Remaining_Qty` varchar(20) ,
 `Quantity` varchar(50) ,
 `V2UOM_Quantity` varchar(20) ,
 `Trial` varchar(10) ,
 `Graphic_No` varchar(20) ,
 `Film_Structure` varchar(50) ,
 `Treat` varchar(10) ,
 `Hot_Job` varchar(10) ,
 `COA` varchar(10) ,
 `Gauge` varchar(10) ,
 `Web_Width` varchar(20) ,
 `Long_Description` varchar(250) ,
 `Customer_Part_No` varchar(50) ,
 `Accredo_Part_No` varchar(50) ,
 `Qty_Ordered` double ,
 `Qty_Ordered_UOM` varchar(20) ,
 `Folded_Width` varchar(20) ,
 `Folder_Wind` varchar(20) ,
 `VFold_Dusting` varchar(200) ,
 `VFold_Dusting_Perc` varchar(10) ,
 `Customer_Samples_Requested` varchar(10) ,
 `CSR_Quantity` varchar(10) ,
 `CSR_UOM` varchar(20) ,
 `CSR_Department` varchar(50) ,
 `Marketing_Samples_Requested` varchar(10) ,
 `MSR_Quantity` varchar(10) ,
 `MSR_UOM` varchar(20) ,
 `MSR_Department` varchar(50) ,
 `FGS_Syncronized` varchar(10) ,
 `Customer_PO_No` varchar(200) ,
 `Creation_Date` varchar(20) ,
 `Due_Date` varchar(20) ,
 `AuxiliaryIndex1` varchar(50) ,
 `AuxiliaryIndex2` varchar(50) ,
 `AuxiliaryIndex3` varchar(50) ,
 `AuxiliaryIndex4` varchar(10) ,
 `AuxiliaryIndex5` varchar(10) ,
 `AuxiliaryIndex6` varchar(50) ,
 `AuxiliaryIndex7` varchar(50) ,
 `AuxiliaryIndex8` varchar(10) ,
 `Type_FilterOnly` varchar(2) ,
 `Machine_Center_No_FilterOnly` varchar(2) ,
 `Work_Center_No_FilterOnly` varchar(2) ,
 `Previous_to_Suspend_No_Filter_FilterOnly` varchar(2) ,
 `job_id` varchar(10) ,
 `press_art_short` varchar(200) ,
 `last_status_time` varchar(20) ,
 `Production_Status_Code` varchar(10) ,
 `Production_Status` varchar(100) ,
 `Production_Moment` varchar(20) ,
 `Production_Status_Detail` varchar(100) ,
 `Required_Quantity` double ,
 `Est_Hours` varchar(20) ,
 `FT_Qty__Left_to_Make` double ,
 `info_separator` varchar(100) ,
 `info_contact` varchar(100) ,
 `row_class` varchar(100) ,
 `sample_required_qty` varchar(200) ,
 `sample_required_popup_title` varchar(200) ,
 `sample_required_approved` varchar(10) ,
 `Customer_Name` varchar(200) ,
 `Percent_Completed` varchar(50) ,
 `actions` varchar(2) ,
 `Actual_Output_Qty` varchar(10) ,
 `V2UOM_Actual_Qty` varchar(20) ,
 `GC` varchar(10) ,
 `Printed_Structure` varchar(100) ,
 `Printed_Rewind` varchar(10) ,
 `Printed_No_Across_FGS` varchar(10) ,
 `Printed_Around` varchar(10) ,
 `Printed_Repeat` varchar(10) ,
 `Printed_Color` varchar(10) ,
 `Printed_Sleeve` varchar(20) ,
 `Impression_per_Finished_Web` varchar(10) ,
 `gos_status_approved_files_date` varchar(20) ,
 `Prod_Order_Line` varchar(10) ,
 `Item_No` varchar(200) ,
 `Output_Width` varchar(20) ,
 `Prod_Target_Gauge` varchar(10) ,
 `Trim` varchar(10) ,
 `Treated` varchar(200) ,
 `Bubble_Width` double ,
 `FT_Total_Qty_to_Make` varchar(10) ,
 `No_of_Layers` varchar(10) ,
 `Code` varchar(20) ,
 `Color` varchar(200) ,
 `Treat_Target` varchar(50) ,
 `Treat_Range` varchar(50) ,
 `Lam_Top_Film_Type` varchar(200) ,
 `Lam_Top_Gauge` varchar(10) ,
 `Lam_Top_Width` varchar(20) ,
 `Lam_Middle_Web_Film_Type` varchar(200) ,
 `Lam_Middle_Web_Gauge` varchar(10) ,
 `Lam_Middle_Web_Width` varchar(20) ,
 `Lam_Back_Sheet_Film_Type` varchar(100) ,
 `Lam_Back_Sheet_Gauge` varchar(10) ,
 `Lam_Back_Sheet_Width` varchar(20) ,
 `Lam_Wind_1` varchar(200) ,
 `Lam_Wind_2` varchar(200) ,
 `Slitting_Width` varchar(20) ,
 `Slitting_AC` varchar(11) ,
 `Slitting_Wind` varchar(20) ,
 `Slitting_Dusting` varchar(20) ,
 `Slitting_Dusting_Perc` varchar(20) ,
 `Wckt_Lay_Flat_Width` varchar(20) ,
 `Wckt_Zipper` varchar(100) ,
 `Wckt_Location_from_top` varchar(200) ,
 `Wckt_Height_of_Bags` varchar(20) ,
 `Wckt_Width_of_Bags` varchar(20) ,
 `Wckt_Flip` varchar(20) ,
 `Wckt_Bottom_Gusset` varchar(20) ,
 `Wckt_Handle_Punch` varchar(10) ,
 `Wckt_Perforation` varchar(10) ,
 `Wckt_Perforation_Location` varchar(200) ,
 `Wckt_Venting` varchar(200) ,
 `Wckt_Venting_Location` varchar(200) ,
 `Wckt_Tie_Links` varchar(200) ,
 `Wckt_Tie_Links_Location` varchar(260) ,
 `Wckt_No_Of_Holes` varchar(20) ,
 `Wckt_Washer` varchar(100) ,
 `Wckt_Cards` varchar(50) ,
 `Wckt_Wicket` varchar(10) ,
 `Wckt_Wicket_Type` varchar(50) ,
 `Wckt_Wicket_Direction` varchar(50) ,
 `Wckt_Wicket_Width` varchar(20) ,
 `Wckt_Wicket_Length` varchar(20) ,
 `Wckt_Wicket_Item` varchar(50) ,
 `Wckt_Bags_per_Wicket` varchar(11) ,
 `Pouch_Height` varchar(20) ,
 `Pouch_Width` varchar(20) ,
 `Pouch_Bottom_Gusset` varchar(20) ,
 `Pouch_Wicket` varchar(200) ,
 `Pouch_Tear_Notch` varchar(200) ,
 `Pouch_Handle` varchar(200) ,
 `Pouch_Vent_Hole` varchar(200) ,
 `Pouch_Zipper` varchar(10) ,
 `Film_Type` varchar(200) ,
 `Combo_No2` varchar(10) ,
 `Combo_No_FilterOnly` varchar(2) ,
 `Prod_Order_No_F_FilterOnly` varchar(2) ,
 `Input_Quantity_UOM` varchar(200) ,
 `Routing_Steps` varchar(200) ,
 `Print_Colours` varchar(200) ,
 `FEET_Actual_Qty` varchar(20) ,
 `Last_Date_Modified` varchar(200) ,
 `Number_Across` varchar(20) ,
 `FT_Qty__Left_to_Make_Unit` varchar(200) ,
 `Qty_Ordered_Unit` varchar(200) ,
 `Required_Quantity_Unit` varchar(200) ,
 `Machine_Center_No2` varchar(20) ,
 `reopen_issues` varchar(200) ,
 `is_deleted` varchar(4) ,
 `Production_Status_en` varchar(200) ,
 `Production_Status_vi` varchar(200) ,
 `hours_est` double ,
 `Quantity_Run` varchar(20) ,
 `Last_Modified_Date` varchar(200) ,
 `Last_Modified_Time` varchar(200) ,
 `Last_Modified_Date_Filter_FilterOnly` varchar(200) ,
 `Last_Modified_Time_Filter_FilterOnly` varchar(200) ,
 `sample_required_detail_csr` varchar(200) ,
 `sample_required_detail_msr` varchar(200) ,
 `note` varchar(250) ,
 `is_splitter` tinyint(2) ,
 `job_jacket` tinyint(2) ,
 `Slitting_Laser_Vents` varchar(50) ,
 `plate_type` varchar(3) ,
 `break_in_fee` tinyint(4) ,
 `Authorization_No` varchar(50) ,
 `instruction_to_operator` varchar(50) ,
 `Remaining_Qty_Base` varchar(2) ,
 `schedule_color_icon` varchar(10) ,
 `schedule_color_note_id` int(11) ,
 `Finished_Quantity` varchar(8) ,
 `V2UOM_Finished_Qty` varchar(10) ,
 `is_created` tinyint(2) ,
 `press_color_exactly` varchar(200) ,
 `press_color_1` varchar(100) ,
 `press_color_2` varchar(100) ,
 `press_color_3` varchar(100) ,
 `press_color_4` varchar(100) ,
 `press_color_5` varchar(100) ,
 `press_color_6` varchar(100) ,
 `press_color_7` varchar(100) ,
 `press_color_8` varchar(100) ,
 `press_color_9` varchar(100) ,
 `press_color_10` varchar(100) ,
 `film_staging` int(11) ,
 `Rewinder_Wind` varchar(3) ,
 `combo_ext` varchar(4) ,
 `mrms` varchar(3) 
)*/;

/*Table structure for table `view_production_output_list` */

DROP TABLE IF EXISTS `view_production_output_list`;

/*!50001 DROP VIEW IF EXISTS `view_production_output_list` */;
/*!50001 DROP TABLE IF EXISTS `view_production_output_list` */;

/*!50001 CREATE TABLE  `view_production_output_list`(
 `id` int(11) ,
 `status` int(11) ,
 `job_id` bigint(20) ,
 `combo_id` bigint(20) ,
 `job_rework_id` bigint(20) ,
 `trace_id_nav` int(11) ,
 `trace_id_input` bigint(20) ,
 `trace_id_input_wip` bigint(20) ,
 `sft_message_id` bigint(20) ,
 `actual_weight` decimal(12,2) ,
 `net_weight` decimal(12,2) ,
 `qty_feet` decimal(12,2) ,
 `created_date` datetime ,
 `width` float ,
 `po_item_no` varchar(20) ,
 `extrusion_item_index` varchar(15) ,
 `set_no` int(11) ,
 `id_input` int(11) ,
 `item_no` varchar(20) ,
 `variant_code` varchar(20) ,
 `machine_center_code` varchar(50) ,
 `work_center_code` varchar(50) ,
 `prod_order_no` varchar(20) ,
 `job_description` varchar(250) ,
 `machine_center_code_nav` varchar(20) 
)*/;

/*Table structure for table `view_production_scrap_list` */

DROP TABLE IF EXISTS `view_production_scrap_list`;

/*!50001 DROP VIEW IF EXISTS `view_production_scrap_list` */;
/*!50001 DROP TABLE IF EXISTS `view_production_scrap_list` */;

/*!50001 CREATE TABLE  `view_production_scrap_list`(
 `id` int(10) ,
 `status` int(1) ,
 `weight_lbs` double(10,2) ,
 `recycle` tinyint(1) ,
 `comment` varchar(80) ,
 `scrap_code` varchar(20) ,
 `sft_message_id` bigint(20) ,
 `apply_message_id` bigint(20) ,
 `print_label_a` int(11) ,
 `job_id` bigint(20) ,
 `created_by` varchar(100) ,
 `created_date` datetime ,
 `last_modified_by` varchar(100) ,
 `last_modified_date` datetime ,
 `is_deleted` tinyint(4) ,
 `deleted_by` varchar(100) ,
 `deleted_date` datetime ,
 `prod_order_no` varchar(20) ,
 `operation_no` bigint(20) ,
 `prod_order_line_no` bigint(20) ,
 `machine_center_code` varchar(50) ,
 `scrap_description` varchar(200) ,
 `scrap_description_vi` varchar(200) ,
 `date_time` datetime ,
 `job_rework_id` int(11) ,
 `machine_center_code_nav` varchar(20) 
)*/;

/*Table structure for table `view_production_status_list` */

DROP TABLE IF EXISTS `view_production_status_list`;

/*!50001 DROP VIEW IF EXISTS `view_production_status_list` */;
/*!50001 DROP TABLE IF EXISTS `view_production_status_list` */;

/*!50001 CREATE TABLE  `view_production_status_list`(
 `id` int(11) ,
 `status_code` varchar(10) ,
 `status_description` varchar(200) ,
 `status_description_vi` varchar(200) ,
 `comment` text ,
 `date_time` datetime ,
 `created_date` datetime ,
 `status` int(1) ,
 `job_id` bigint(20) ,
 `job_rework_id` bigint(20) ,
 `machine_center_code` varchar(50) ,
 `prod_order_no` varchar(20) ,
 `machine_center_code_nav` varchar(20) 
)*/;

/*Table structure for table `view_ps_all_roll_out_for_tab_ouput` */

DROP TABLE IF EXISTS `view_ps_all_roll_out_for_tab_ouput`;

/*!50001 DROP VIEW IF EXISTS `view_ps_all_roll_out_for_tab_ouput` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_all_roll_out_for_tab_ouput` */;

/*!50001 CREATE TABLE  `view_ps_all_roll_out_for_tab_ouput`(
 `id` bigint(20) ,
 `in_put_id` bigint(20) ,
 `in_trace_id` bigint(20) ,
 `out_trace_id` varchar(500) ,
 `out_put_id` bigint(20) ,
 `out_gross_weight` decimal(18,1) ,
 `out_net_weight` decimal(18,1) ,
 `out_quantity` decimal(18,4) ,
 `out_width` decimal(18,4) ,
 `out_created_date` datetime ,
 `out_product_code` varchar(50) ,
 `out_set_no` tinyint(2) ,
 `out_lane_no` tinyint(2) ,
 `out_constituent` text ,
 `out_connect_no` tinyint(2) ,
 `out_is_deleted` int(1) ,
 `is_marked_rework` tinyint(2) ,
 `box_is_deleted` int(2) 
)*/;

/*Table structure for table `view_ps_list_box` */

DROP TABLE IF EXISTS `view_ps_list_box`;

/*!50001 DROP VIEW IF EXISTS `view_ps_list_box` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_list_box` */;

/*!50001 CREATE TABLE  `view_ps_list_box`(
 `id` int(11) ,
 `box_trace_id` bigint(20) ,
 `input_trace_id` bigint(20) ,
 `box_status` tinyint(1) ,
 `date_time` datetime ,
 `sft_message_id` bigint(20) ,
 `job_id` int(11) ,
 `job_rework_id` int(11) ,
 `box_deleted` tinyint(1) ,
 `box_deleted_by` varchar(10) ,
 `box_deleted_date` datetime ,
 `prod_order_no` varchar(10) ,
 `work_center_code` varchar(15) ,
 `machine_center_code` varchar(15) ,
 `is_pending_box` tinyint(1) ,
 `rework_ticket` varchar(50) ,
 `is_printed` tinyint(2) ,
 `gross_weight` decimal(18,1) ,
 `net_weight` decimal(18,1) ,
 `lane_no` tinyint(10) ,
 `set_no` tinyint(10) ,
 `shift` varchar(50) ,
 `joins_no` tinyint(10) ,
 `constituent` varchar(500) ,
 `dimension` varchar(500) ,
 `thickness` varchar(500) ,
 `box_total_rolls` double ,
 `box_weight` decimal(18,2) ,
 `job_no` varchar(50) 
)*/;

/*Table structure for table `view_ps_list_box_pouching_rework` */

DROP TABLE IF EXISTS `view_ps_list_box_pouching_rework`;

/*!50001 DROP VIEW IF EXISTS `view_ps_list_box_pouching_rework` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_list_box_pouching_rework` */;

/*!50001 CREATE TABLE  `view_ps_list_box_pouching_rework`(
 `id` bigint(20) ,
 `in_trace_id` bigint(20) ,
 `out_trace_id` varchar(500) ,
 `out_put_id` bigint(20) ,
 `out_gross_weight` decimal(18,1) ,
 `out_net_weight` decimal(18,1) ,
 `out_quantity` decimal(18,4) ,
 `out_created_date` datetime ,
 `out_product_code` varchar(50) ,
 `out_set_no` tinyint(20) ,
 `out_uom` varchar(50) ,
 `is_marked_rework` tinyint(2) ,
 `out_constituent` text ,
 `out_shift` varchar(500) ,
 `out_is_deleted` int(1) ,
 `out_reason_rework` text ,
 `out_description` varchar(500) ,
 `in_put_id` bigint(20) ,
 `machine_code` varchar(10) ,
 `machine_code_rw` varchar(20) ,
 `machine_name` varchar(50) ,
 `job_status` int(1) ,
 `job_no` varchar(50) ,
 `job_id` bigint(20) ,
 `type_box` tinyint(2) ,
 `out_producer` varchar(200) ,
 `out_line_no` varchar(200) ,
 `out_box_no` int(10) ,
 `job_id_rw` bigint(20) ,
 `add_is_deleted` int(1) 
)*/;

/*Table structure for table `view_ps_list_box_pouching_spout_inserter` */

DROP TABLE IF EXISTS `view_ps_list_box_pouching_spout_inserter`;

/*!50001 DROP VIEW IF EXISTS `view_ps_list_box_pouching_spout_inserter` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_list_box_pouching_spout_inserter` */;

/*!50001 CREATE TABLE  `view_ps_list_box_pouching_spout_inserter`(
 `id` bigint(20) ,
 `in_trace_id` bigint(20) ,
 `out_trace_id` varchar(500) ,
 `out_put_id` bigint(20) ,
 `out_gross_weight` decimal(18,1) ,
 `out_net_weight` decimal(18,1) ,
 `out_quantity` decimal(18,4) ,
 `out_created_date` datetime ,
 `out_product_code` varchar(50) ,
 `out_set_no` tinyint(20) ,
 `out_uom` varchar(50) ,
 `is_marked_rework` tinyint(2) ,
 `out_constituent` text ,
 `out_shift` varchar(500) ,
 `out_is_deleted` int(1) ,
 `out_reason_rework` text ,
 `out_description` varchar(500) ,
 `in_put_id` bigint(20) ,
 `machine_code` varchar(10) ,
 `machine_code_rw` varchar(20) ,
 `machine_name` varchar(50) ,
 `job_status` int(1) ,
 `job_no` varchar(50) ,
 `job_id` bigint(20) ,
 `type_box` tinyint(2) ,
 `out_producer` varchar(200) ,
 `out_line_no` varchar(200) ,
 `out_box_no` int(10) ,
 `job_id_rw` bigint(20) ,
 `out_id_return` bigint(20) ,
 `out_is_received` tinyint(1) ,
 `add_is_deleted` int(1) 
)*/;

/*Table structure for table `view_ps_list_pallet` */

DROP TABLE IF EXISTS `view_ps_list_pallet`;

/*!50001 DROP VIEW IF EXISTS `view_ps_list_pallet` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_list_pallet` */;

/*!50001 CREATE TABLE  `view_ps_list_pallet`(
 `id` int(11) ,
 `pallet_trace_id` bigint(20) ,
 `pallet_status` tinyint(1) ,
 `is_receipt` tinyint(1) ,
 `pallet_total_box` int(11) ,
 `pallet_note` text ,
 `date_time` datetime ,
 `sft_message_id` bigint(20) ,
 `job_id` int(11) ,
 `machine_center_code` varchar(15) ,
 `pallet_weight` decimal(18,4) ,
 `pallet_no` int(2) ,
 `job_no` varchar(50) 
)*/;

/*Table structure for table `view_ps_list_pouching_out` */

DROP TABLE IF EXISTS `view_ps_list_pouching_out`;

/*!50001 DROP VIEW IF EXISTS `view_ps_list_pouching_out` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_list_pouching_out` */;

/*!50001 CREATE TABLE  `view_ps_list_pouching_out`(
 `id` bigint(20) ,
 `trace_id_input` bigint(20) ,
 `out_trace_id` varchar(500) ,
 `out_put_id` bigint(20) ,
 `out_gross_weight` decimal(18,1) ,
 `net_weight` decimal(18,1) ,
 `out_quantity` decimal(18,4) ,
 `out_created_date` datetime ,
 `out_product_code` varchar(50) ,
 `out_set_no` tinyint(20) ,
 `out_box_no` int(10) ,
 `is_marked_rework` tinyint(2) ,
 `out_constituent` text ,
 `out_shift` varchar(500) ,
 `out_is_deleted` int(1) ,
 `id_input` bigint(20) ,
 `in_product_code` varchar(50) ,
 `job_id` bigint(20) ,
 `machine_code` varchar(10) ,
 `machine_name` varchar(50) ,
 `job_status` int(1) ,
 `job_no` varchar(50) 
)*/;

/*Table structure for table `view_ps_list_rework_roll_out` */

DROP TABLE IF EXISTS `view_ps_list_rework_roll_out`;

/*!50001 DROP VIEW IF EXISTS `view_ps_list_rework_roll_out` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_list_rework_roll_out` */;

/*!50001 CREATE TABLE  `view_ps_list_rework_roll_out`(
 `id` bigint(20) ,
 `in_trace_id` bigint(20) ,
 `out_trace_id` varchar(500) ,
 `out_put_id` bigint(20) ,
 `out_gross_weight` decimal(18,1) ,
 `out_net_weight` decimal(18,1) ,
 `out_quantity` decimal(18,4) ,
 `out_width` decimal(18,4) ,
 `out_created_date` datetime ,
 `out_product_code` varchar(50) ,
 `out_set_no` tinyint(2) ,
 `out_lane_no` tinyint(2) ,
 `out_connect_no` tinyint(2) ,
 `out_uom` varchar(50) ,
 `is_marked_rework` tinyint(2) ,
 `out_constituent` text ,
 `out_shift` varchar(500) ,
 `out_is_deleted` int(1) ,
 `out_reason_rework` text ,
 `out_description` varchar(500) ,
 `out_master_trace_id` varchar(20) ,
 `in_put_id` bigint(20) ,
 `remaining_outer_roll` int(2) ,
 `machine_code_rw` varchar(20) ,
 `job_id` bigint(20) ,
 `job_id_rw` bigint(20) ,
 `add_is_deleted` int(1) 
)*/;

/*Table structure for table `view_ps_list_roll_out` */

DROP TABLE IF EXISTS `view_ps_list_roll_out`;

/*!50001 DROP VIEW IF EXISTS `view_ps_list_roll_out` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_list_roll_out` */;

/*!50001 CREATE TABLE  `view_ps_list_roll_out`(
 `id` bigint(20) ,
 `trace_id_input` bigint(20) ,
 `out_trace_id` varchar(500) ,
 `out_put_id` bigint(20) ,
 `out_gross_weight` decimal(18,1) ,
 `net_weight` decimal(18,1) ,
 `out_quantity` decimal(18,4) ,
 `out_width` decimal(18,4) ,
 `out_created_date` datetime ,
 `out_product_code` varchar(50) ,
 `out_set_no` tinyint(2) ,
 `out_lane_no` tinyint(2) ,
 `is_marked_rework` tinyint(2) ,
 `out_constituent` text ,
 `out_shift` varchar(500) ,
 `out_is_deleted` int(1) ,
 `id_input` bigint(20) ,
 `in_product_code` varchar(50) ,
 `job_id` bigint(20) ,
 `machine_code` varchar(10) ,
 `machine_name` varchar(50) ,
 `job_status` int(1) ,
 `job_no` varchar(50) 
)*/;

/*Table structure for table `view_ps_list_roll_out_in_pallet` */

DROP TABLE IF EXISTS `view_ps_list_roll_out_in_pallet`;

/*!50001 DROP VIEW IF EXISTS `view_ps_list_roll_out_in_pallet` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_list_roll_out_in_pallet` */;

/*!50001 CREATE TABLE  `view_ps_list_roll_out_in_pallet`(
 `id` bigint(20) ,
 `trace_id_input` bigint(20) ,
 `in_set_no` tinyint(10) ,
 `out_trace_id` varchar(500) ,
 `machine_name` varchar(50) ,
 `job_no` varchar(50) ,
 `pallet_trace_id` bigint(20) ,
 `box_trace_id` bigint(20) ,
 `box_weight` decimal(18,2) ,
 `out_gross_weight` decimal(18,1) ,
 `net_weight` decimal(18,1) ,
 `out_quantity` decimal(18,4) ,
 `out_width` decimal(18,4) ,
 `out_created_date` datetime ,
 `out_product_code` varchar(50) ,
 `out_set_no` tinyint(2) ,
 `out_lane_no` tinyint(2) ,
 `out_label_date` date ,
 `out_connect_no` tinyint(2) ,
 `is_marked_rework` tinyint(2) ,
 `out_constituent` text ,
 `out_shift` varchar(500) ,
 `out_is_deleted` int(1) ,
 `id_input` bigint(20) ,
 `in_product_code` varchar(50) ,
 `job_id` bigint(20) ,
 `machine_code` varchar(10) ,
 `job_status` int(1) ,
 `pallet_id` int(11) 
)*/;

/*Table structure for table `view_ps_list_roll_out_new` */

DROP TABLE IF EXISTS `view_ps_list_roll_out_new`;

/*!50001 DROP VIEW IF EXISTS `view_ps_list_roll_out_new` */;
/*!50001 DROP TABLE IF EXISTS `view_ps_list_roll_out_new` */;

/*!50001 CREATE TABLE  `view_ps_list_roll_out_new`(
 `id` bigint(20) ,
 `trace_id_input` bigint(20) ,
 `in_set_no` tinyint(10) ,
 `out_trace_id` varchar(500) ,
 `machine_name` varchar(50) ,
 `job_no` varchar(50) ,
 `pallet_trace_id` bigint(20) ,
 `box_trace_id` bigint(20) ,
 `box_weight` decimal(18,2) ,
 `out_gross_weight` decimal(18,1) ,
 `net_weight` decimal(18,1) ,
 `out_quantity` decimal(18,4) ,
 `out_width` decimal(18,4) ,
 `out_created_date` datetime ,
 `out_product_code` varchar(50) ,
 `out_set_no` tinyint(2) ,
 `out_lane_no` tinyint(2) ,
 `out_label_date` date ,
 `out_connect_no` tinyint(2) ,
 `is_marked_rework` tinyint(2) ,
 `out_constituent` text ,
 `out_shift` varchar(500) ,
 `out_is_deleted` int(1) ,
 `id_input` bigint(20) ,
 `in_product_code` varchar(50) ,
 `job_id` bigint(20) ,
 `machine_code` varchar(10) ,
 `job_status` int(1) ,
 `pallet_id` int(11) 
)*/;

/*Table structure for table `view_role` */

DROP TABLE IF EXISTS `view_role`;

/*!50001 DROP VIEW IF EXISTS `view_role` */;
/*!50001 DROP TABLE IF EXISTS `view_role` */;

/*!50001 CREATE TABLE  `view_role`(
 `id` int(11) ,
 `role_name` varchar(50) ,
 `short_name` varchar(10) ,
 `description` varchar(200) ,
 `department` varchar(200) ,
 `is_sft_read_only` tinyint(2) ,
 `status` tinyint(1) ,
 `deleted_by` int(11) ,
 `deleted_date` datetime ,
 `group_id` int(11) ,
 `parent_id` int(11) ,
 `group_name` varchar(100) ,
 `group_description` varchar(100) ,
 `group_level` int(11) ,
 `is_global` tinyint(1) ,
 `parent_name` varchar(50) ,
 `parent_short_name` varchar(10) ,
 `parent_description` varchar(200) 
)*/;

/*Table structure for table `view_user_list` */

DROP TABLE IF EXISTS `view_user_list`;

/*!50001 DROP VIEW IF EXISTS `view_user_list` */;
/*!50001 DROP TABLE IF EXISTS `view_user_list` */;

/*!50001 CREATE TABLE  `view_user_list`(
 `id` int(11) ,
 `first_name` varchar(100) ,
 `last_name` varchar(100) ,
 `email` varchar(100) ,
 `status` tinyint(1) ,
 `login_code` varchar(11) ,
 `shift_code_id` int(11) ,
 `role_id` int(11) ,
 `machine_code` varchar(100) ,
 `machine_name` varchar(100) ,
 `activated` int(1) ,
 `password_hash` varchar(60) ,
 `registered_date` datetime ,
 `activated_date` datetime ,
 `deleted_by` int(11) ,
 `deleted_at` datetime ,
 `plan_code` varchar(10) ,
 `mrms_id` int(11) ,
 `mrms_name` varchar(200) ,
 `is_test` tinyint(4) ,
 `full_name` varchar(201) ,
 `activated_name` varchar(3) ,
 `role_name` varchar(50) ,
 `department` varchar(200) ,
 `group_id` int(11) ,
 `group` varchar(100) ,
 `group_level` int(11) ,
 `is_global` tinyint(1) ,
 `shift_code` varchar(100) 
)*/;

/*Table structure for table `view_working_history` */

DROP TABLE IF EXISTS `view_working_history`;

/*!50001 DROP VIEW IF EXISTS `view_working_history` */;
/*!50001 DROP TABLE IF EXISTS `view_working_history` */;

/*!50001 CREATE TABLE  `view_working_history`(
 `login_history_id` bigint(20) ,
 `job_id` bigint(20) ,
 `prod_order_no` varchar(20) ,
 `login_code` varchar(20) ,
 `shift_code` varchar(20) ,
 `first_name` varchar(100) ,
 `last_name` varchar(100) ,
 `is_logout` tinyint(2) ,
 `in_time` datetime ,
 `out_time` datetime ,
 `machine_code` varchar(20) ,
 `is_start_job` tinyint(2) 
)*/;

/*View structure for view view_delete */

/*!50001 DROP TABLE IF EXISTS `view_delete` */;
/*!50001 DROP VIEW IF EXISTS `view_delete` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_delete` AS (select `tbl_production_input_wip`.`trace_id` AS `trace_id`,`tbl_production_input_wip`.`is_used` AS `is_used`,`tbl_production_input_wip`.`job_id` AS `job_id`,count(`tbl_production_input_wip`.`trace_id`) AS `COUNT(trace_id)` from `tbl_production_input_wip` group by `tbl_production_input_wip`.`trace_id`,`tbl_production_input_wip`.`is_used`,`tbl_production_input_wip`.`job_id` having count(`tbl_production_input_wip`.`trace_id`) > 1) */;

/*View structure for view view_job_input_wip */

/*!50001 DROP TABLE IF EXISTS `view_job_input_wip` */;
/*!50001 DROP VIEW IF EXISTS `view_job_input_wip` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_job_input_wip` AS (select `t`.`id` AS `id`,`job`.`prod_order_no` AS `prod_order_no`,`job`.`machine_center_code` AS `machine_center_code`,`job`.`machine_center_name` AS `machine_center_name`,`job`.`work_center_code` AS `work_center_code`,`t`.`trace_id` AS `trace_id`,`t`.`created_date` AS `created_date`,`t`.`item_no` AS `item_no`,`t`.`description` AS `description`,`t`.`variant_code` AS `variant_code`,0 AS `total_output` from (`tbl_production_input` `t` join `tbl_job_info` `job` on(`t`.`job_id` = `job`.`id`)) where `t`.`is_wip` = 1 and `t`.`status` = 1 and !(`t`.`id` in (select `input`.`id` from (`tbl_production_output_roll` `output` join `tbl_production_input` `input` on(`input`.`trace_id` = `output`.`trace_id_input` or `input`.`trace_id` = `output`.`trace_id_input_wip`)) where `input`.`is_wip` = 1 and `input`.`status` = 1 and `output`.`status` = 1 group by `input`.`trace_id`))) */;

/*View structure for view view_press_completed */

/*!50001 DROP TABLE IF EXISTS `view_press_completed` */;
/*!50001 DROP VIEW IF EXISTS `view_press_completed` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_press_completed` AS (select `tbl_job_detail`.`id` AS `id`,`tbl_job_detail`.`Prod_Order_No` AS `Prod_Order_No`,`tbl_job_detail`.`Prod_Order_Line_No` AS `Prod_Order_Line_No`,`tbl_job_detail`.`Operation_No` AS `Operation_No`,`tbl_job_detail`.`machine_type` AS `machine_type`,`tbl_job_detail`.`machine_center_code` AS `machine_center_code`,`tbl_job_detail`.`machine_center_name` AS `machine_center_name`,`tbl_job_detail`.`work_center_code` AS `work_center_code`,`tbl_job_detail`.`step_width` AS `step_width`,`tbl_job_detail`.`order_no` AS `order_no`,`tbl_job_detail`.`is_completed` AS `is_completed`,`tbl_job_detail`.`is_suspended` AS `is_suspended`,`tbl_job_detail`.`is_disabled` AS `is_disabled`,`tbl_job_detail`.`is_art_approved` AS `is_art_approved`,`tbl_job_detail`.`is_trial` AS `is_trial`,`tbl_job_detail`.`is_trial_approved` AS `is_trial_approved`,`tbl_job_detail`.`mounted` AS `mounted`,`tbl_job_detail`.`plate_status` AS `plate_status`,`tbl_job_detail`.`trial_issues` AS `trial_issues`,`tbl_job_detail`.`art_issues` AS `art_issues`,`tbl_job_detail`.`art_approved_date` AS `art_approved_date`,`tbl_job_detail`.`art_approved_by` AS `art_approved_by`,`tbl_job_detail`.`trial_approved_by` AS `trial_approved_by`,`tbl_job_detail`.`trial_approved_date` AS `trial_approved_date`,`tbl_job_detail`.`is_last_step` AS `is_last_step`,`tbl_job_detail`.`is_complete_approved` AS `is_complete_approved`,`tbl_job_detail`.`complete_approved_by` AS `complete_approved_by`,`tbl_job_detail`.`complete_approved_date` AS `complete_approved_date`,`tbl_job_detail`.`Combo_No` AS `Combo_No`,`tbl_job_detail`.`press_art` AS `press_art`,`tbl_job_detail`.`last_order_no` AS `last_order_no`,`tbl_job_detail`.`new_machine_center` AS `new_machine_center`,`tbl_job_detail`.`art_approved_by_api` AS `art_approved_by_api`,`tbl_job_detail`.`trial_approved_by_api` AS `trial_approved_by_api`,`tbl_job_detail`.`sample_required` AS `sample_required`,`tbl_job_detail`.`csr_required` AS `csr_required`,`tbl_job_detail`.`csr_required_approved` AS `csr_required_approved`,`tbl_job_detail`.`csr_required_quantity` AS `csr_required_quantity`,`tbl_job_detail`.`csr_required_uom` AS `csr_required_uom`,`tbl_job_detail`.`csr_required_dept` AS `csr_required_dept`,`tbl_job_detail`.`csr_approved_by` AS `csr_approved_by`,`tbl_job_detail`.`csr_approved_by_api` AS `csr_approved_by_api`,`tbl_job_detail`.`csr_approved_date` AS `csr_approved_date`,`tbl_job_detail`.`marketing_required` AS `marketing_required`,`tbl_job_detail`.`marketing_required_approved` AS `marketing_required_approved`,`tbl_job_detail`.`marketing_required_quantity` AS `marketing_required_quantity`,`tbl_job_detail`.`marketing_required_uom` AS `marketing_required_uom`,`tbl_job_detail`.`marketing_required_dept` AS `marketing_required_dept`,`tbl_job_detail`.`marketing_approved_by` AS `marketing_approved_by`,`tbl_job_detail`.`marketing_approved_by_api` AS `marketing_approved_by_api`,`tbl_job_detail`.`marketing_approved_date` AS `marketing_approved_date`,`tbl_job_detail`.`suspended_from` AS `suspended_from`,`tbl_job_detail`.`reschedule_to` AS `reschedule_to`,`tbl_job_detail`.`reschedule_issues` AS `reschedule_issues`,`tbl_job_detail`.`is_rescheduled` AS `is_rescheduled`,`tbl_job_detail`.`graphic_status` AS `graphic_status`,`tbl_job_detail`.`is_restarted` AS `is_restarted`,`tbl_job_detail`.`created_date` AS `created_date`,`tbl_job_detail`.`completed_from` AS `completed_from`,`tbl_job_detail`.`is_archived` AS `is_archived`,`tbl_job_detail`.`archived_date` AS `archived_date`,`tbl_job_detail`.`Next_Operation_No` AS `Next_Operation_No`,`tbl_job_detail`.`Previous_to_Suspend_No` AS `Previous_to_Suspend_No`,`tbl_job_detail`.`SFT_Status` AS `SFT_Status`,`tbl_job_detail`.`Task_Status` AS `Task_Status`,`tbl_job_detail`.`Fixed_Scrap_Quantity_FEET` AS `Fixed_Scrap_Quantity_FEET`,`tbl_job_detail`.`Fixed_Scrap_Quantity` AS `Fixed_Scrap_Quantity`,`tbl_job_detail`.`Scrap_Factor` AS `Scrap_Factor`,`tbl_job_detail`.`Input_Quantity_FEET` AS `Input_Quantity_FEET`,`tbl_job_detail`.`Input_Quantity` AS `Input_Quantity`,`tbl_job_detail`.`Output_Quantity` AS `Output_Quantity`,`tbl_job_detail`.`Output_Quantity_FEET` AS `Output_Quantity_FEET`,`tbl_job_detail`.`Expected_Capacity_Need_Mins` AS `Expected_Capacity_Need_Mins`,`tbl_job_detail`.`Routing_Status` AS `Routing_Status`,`tbl_job_detail`.`Production_UOM` AS `Production_UOM`,`tbl_job_detail`.`Remaining_Quantity` AS `Remaining_Quantity`,`tbl_job_detail`.`V2UOM_Remaining_Qty` AS `V2UOM_Remaining_Qty`,`tbl_job_detail`.`Quantity` AS `Quantity`,`tbl_job_detail`.`V2UOM_Quantity` AS `V2UOM_Quantity`,`tbl_job_detail`.`Trial` AS `Trial`,`tbl_job_detail`.`Graphic_No` AS `Graphic_No`,`tbl_job_detail`.`Film_Structure` AS `Film_Structure`,`tbl_job_detail`.`Treat` AS `Treat`,`tbl_job_detail`.`Hot_Job` AS `Hot_Job`,`tbl_job_detail`.`COA` AS `COA`,`tbl_job_detail`.`Gauge` AS `Gauge`,`tbl_job_detail`.`Web_Width` AS `Web_Width`,`tbl_job_detail`.`Long_Description` AS `Long_Description`,`tbl_job_detail`.`Customer_Part_No` AS `Customer_Part_No`,`tbl_job_detail`.`Accredo_Part_No` AS `Accredo_Part_No`,`tbl_job_detail`.`Qty_Ordered` AS `Qty_Ordered`,`tbl_job_detail`.`Qty_Ordered_UOM` AS `Qty_Ordered_UOM`,`tbl_job_detail`.`Folded_Width` AS `Folded_Width`,`tbl_job_detail`.`Folder_Wind` AS `Folder_Wind`,`tbl_job_detail`.`VFold_Dusting` AS `VFold_Dusting`,`tbl_job_detail`.`VFold_Dusting_Perc` AS `VFold_Dusting_Perc`,`tbl_job_detail`.`Customer_Samples_Requested` AS `Customer_Samples_Requested`,`tbl_job_detail`.`CSR_Quantity` AS `CSR_Quantity`,`tbl_job_detail`.`CSR_UOM` AS `CSR_UOM`,`tbl_job_detail`.`CSR_Department` AS `CSR_Department`,`tbl_job_detail`.`Marketing_Samples_Requested` AS `Marketing_Samples_Requested`,`tbl_job_detail`.`MSR_Quantity` AS `MSR_Quantity`,`tbl_job_detail`.`MSR_UOM` AS `MSR_UOM`,`tbl_job_detail`.`MSR_Department` AS `MSR_Department`,`tbl_job_detail`.`FGS_Syncronized` AS `FGS_Syncronized`,`tbl_job_detail`.`Customer_PO_No` AS `Customer_PO_No`,`tbl_job_detail`.`Creation_Date` AS `Creation_Date`,`tbl_job_detail`.`Due_Date` AS `Due_Date`,`tbl_job_detail`.`AuxiliaryIndex1` AS `AuxiliaryIndex1`,`tbl_job_detail`.`AuxiliaryIndex2` AS `AuxiliaryIndex2`,`tbl_job_detail`.`AuxiliaryIndex3` AS `AuxiliaryIndex3`,`tbl_job_detail`.`AuxiliaryIndex4` AS `AuxiliaryIndex4`,`tbl_job_detail`.`AuxiliaryIndex5` AS `AuxiliaryIndex5`,`tbl_job_detail`.`AuxiliaryIndex6` AS `AuxiliaryIndex6`,`tbl_job_detail`.`AuxiliaryIndex7` AS `AuxiliaryIndex7`,`tbl_job_detail`.`AuxiliaryIndex8` AS `AuxiliaryIndex8`,`tbl_job_detail`.`Type_FilterOnly` AS `Type_FilterOnly`,`tbl_job_detail`.`Machine_Center_No_FilterOnly` AS `Machine_Center_No_FilterOnly`,`tbl_job_detail`.`Work_Center_No_FilterOnly` AS `Work_Center_No_FilterOnly`,`tbl_job_detail`.`Previous_to_Suspend_No_Filter_FilterOnly` AS `Previous_to_Suspend_No_Filter_FilterOnly`,`tbl_job_detail`.`job_id` AS `job_id`,`tbl_job_detail`.`press_art_short` AS `press_art_short`,`tbl_job_detail`.`last_status_time` AS `last_status_time`,`tbl_job_detail`.`Production_Status_Code` AS `Production_Status_Code`,`tbl_job_detail`.`Production_Status` AS `Production_Status`,`tbl_job_detail`.`Production_Moment` AS `Production_Moment`,`tbl_job_detail`.`Production_Status_Detail` AS `Production_Status_Detail`,`tbl_job_detail`.`Required_Quantity` AS `Required_Quantity`,`tbl_job_detail`.`Est_Hours` AS `Est_Hours`,`tbl_job_detail`.`FT_Qty__Left_to_Make` AS `FT_Qty__Left_to_Make`,`tbl_job_detail`.`info_separator` AS `info_separator`,`tbl_job_detail`.`info_contact` AS `info_contact`,`tbl_job_detail`.`row_class` AS `row_class`,`tbl_job_detail`.`sample_required_qty` AS `sample_required_qty`,`tbl_job_detail`.`sample_required_popup_title` AS `sample_required_popup_title`,`tbl_job_detail`.`sample_required_approved` AS `sample_required_approved`,`tbl_job_detail`.`Customer_Name` AS `Customer_Name`,`tbl_job_detail`.`Percent_Completed` AS `Percent_Completed`,`tbl_job_detail`.`actions` AS `actions`,`tbl_job_detail`.`Actual_Output_Qty` AS `Actual_Output_Qty`,`tbl_job_detail`.`V2UOM_Actual_Qty` AS `V2UOM_Actual_Qty`,`tbl_job_detail`.`GC` AS `GC`,`tbl_job_detail`.`Printed_Structure` AS `Printed_Structure`,`tbl_job_detail`.`Printed_Rewind` AS `Printed_Rewind`,`tbl_job_detail`.`Printed_No_Across_FGS` AS `Printed_No_Across_FGS`,`tbl_job_detail`.`Printed_Around` AS `Printed_Around`,`tbl_job_detail`.`Printed_Repeat` AS `Printed_Repeat`,`tbl_job_detail`.`Printed_Color` AS `Printed_Color`,`tbl_job_detail`.`Printed_Sleeve` AS `Printed_Sleeve`,`tbl_job_detail`.`Impression_per_Finished_Web` AS `Impression_per_Finished_Web`,`tbl_job_detail`.`gos_status_approved_files_date` AS `gos_status_approved_files_date`,`tbl_job_detail`.`Prod_Order_Line` AS `Prod_Order_Line`,`tbl_job_detail`.`Item_No` AS `Item_No`,`tbl_job_detail`.`Output_Width` AS `Output_Width`,`tbl_job_detail`.`Prod_Target_Gauge` AS `Prod_Target_Gauge`,`tbl_job_detail`.`Trim` AS `Trim`,`tbl_job_detail`.`Treated` AS `Treated`,`tbl_job_detail`.`Bubble_Width` AS `Bubble_Width`,`tbl_job_detail`.`FT_Total_Qty_to_Make` AS `FT_Total_Qty_to_Make`,`tbl_job_detail`.`No_of_Layers` AS `No_of_Layers`,`tbl_job_detail`.`Code` AS `Code`,`tbl_job_detail`.`Color` AS `Color`,`tbl_job_detail`.`Treat_Target` AS `Treat_Target`,`tbl_job_detail`.`Treat_Range` AS `Treat_Range`,`tbl_job_detail`.`Lam_Top_Film_Type` AS `Lam_Top_Film_Type`,`tbl_job_detail`.`Lam_Top_Gauge` AS `Lam_Top_Gauge`,`tbl_job_detail`.`Lam_Top_Width` AS `Lam_Top_Width`,`tbl_job_detail`.`Lam_Middle_Web_Film_Type` AS `Lam_Middle_Web_Film_Type`,`tbl_job_detail`.`Lam_Middle_Web_Gauge` AS `Lam_Middle_Web_Gauge`,`tbl_job_detail`.`Lam_Middle_Web_Width` AS `Lam_Middle_Web_Width`,`tbl_job_detail`.`Lam_Back_Sheet_Film_Type` AS `Lam_Back_Sheet_Film_Type`,`tbl_job_detail`.`Lam_Back_Sheet_Gauge` AS `Lam_Back_Sheet_Gauge`,`tbl_job_detail`.`Lam_Back_Sheet_Width` AS `Lam_Back_Sheet_Width`,`tbl_job_detail`.`Lam_Wind_1` AS `Lam_Wind_1`,`tbl_job_detail`.`Lam_Wind_2` AS `Lam_Wind_2`,`tbl_job_detail`.`Slitting_Width` AS `Slitting_Width`,`tbl_job_detail`.`Slitting_AC` AS `Slitting_AC`,`tbl_job_detail`.`Slitting_Wind` AS `Slitting_Wind`,`tbl_job_detail`.`Slitting_Dusting` AS `Slitting_Dusting`,`tbl_job_detail`.`Slitting_Dusting_Perc` AS `Slitting_Dusting_Perc`,`tbl_job_detail`.`Wckt_Lay_Flat_Width` AS `Wckt_Lay_Flat_Width`,`tbl_job_detail`.`Wckt_Zipper` AS `Wckt_Zipper`,`tbl_job_detail`.`Wckt_Location_from_top` AS `Wckt_Location_from_top`,`tbl_job_detail`.`Wckt_Height_of_Bags` AS `Wckt_Height_of_Bags`,`tbl_job_detail`.`Wckt_Width_of_Bags` AS `Wckt_Width_of_Bags`,`tbl_job_detail`.`Wckt_Flip` AS `Wckt_Flip`,`tbl_job_detail`.`Wckt_Bottom_Gusset` AS `Wckt_Bottom_Gusset`,`tbl_job_detail`.`Wckt_Handle_Punch` AS `Wckt_Handle_Punch`,`tbl_job_detail`.`Wckt_Perforation` AS `Wckt_Perforation`,`tbl_job_detail`.`Wckt_Perforation_Location` AS `Wckt_Perforation_Location`,`tbl_job_detail`.`Wckt_Venting` AS `Wckt_Venting`,`tbl_job_detail`.`Wckt_Venting_Location` AS `Wckt_Venting_Location`,`tbl_job_detail`.`Wckt_Tie_Links` AS `Wckt_Tie_Links`,`tbl_job_detail`.`Wckt_Tie_Links_Location` AS `Wckt_Tie_Links_Location`,`tbl_job_detail`.`Wckt_No_Of_Holes` AS `Wckt_No_Of_Holes`,`tbl_job_detail`.`Wckt_Washer` AS `Wckt_Washer`,`tbl_job_detail`.`Wckt_Cards` AS `Wckt_Cards`,`tbl_job_detail`.`Wckt_Wicket` AS `Wckt_Wicket`,`tbl_job_detail`.`Wckt_Wicket_Type` AS `Wckt_Wicket_Type`,`tbl_job_detail`.`Wckt_Wicket_Direction` AS `Wckt_Wicket_Direction`,`tbl_job_detail`.`Wckt_Wicket_Width` AS `Wckt_Wicket_Width`,`tbl_job_detail`.`Wckt_Wicket_Length` AS `Wckt_Wicket_Length`,`tbl_job_detail`.`Wckt_Wicket_Item` AS `Wckt_Wicket_Item`,`tbl_job_detail`.`Wckt_Bags_per_Wicket` AS `Wckt_Bags_per_Wicket`,`tbl_job_detail`.`Pouch_Height` AS `Pouch_Height`,`tbl_job_detail`.`Pouch_Width` AS `Pouch_Width`,`tbl_job_detail`.`Pouch_Bottom_Gusset` AS `Pouch_Bottom_Gusset`,`tbl_job_detail`.`Pouch_Wicket` AS `Pouch_Wicket`,`tbl_job_detail`.`Pouch_Tear_Notch` AS `Pouch_Tear_Notch`,`tbl_job_detail`.`Pouch_Handle` AS `Pouch_Handle`,`tbl_job_detail`.`Pouch_Vent_Hole` AS `Pouch_Vent_Hole`,`tbl_job_detail`.`Pouch_Zipper` AS `Pouch_Zipper`,`tbl_job_detail`.`Film_Type` AS `Film_Type`,`tbl_job_detail`.`Combo_No2` AS `Combo_No2`,`tbl_job_detail`.`Combo_No_FilterOnly` AS `Combo_No_FilterOnly`,`tbl_job_detail`.`Prod_Order_No_F_FilterOnly` AS `Prod_Order_No_F_FilterOnly`,`tbl_job_detail`.`Input_Quantity_UOM` AS `Input_Quantity_UOM`,`tbl_job_detail`.`Routing_Steps` AS `Routing_Steps`,`tbl_job_detail`.`Print_Colours` AS `Print_Colours`,`tbl_job_detail`.`FEET_Actual_Qty` AS `FEET_Actual_Qty`,`tbl_job_detail`.`Last_Date_Modified` AS `Last_Date_Modified`,`tbl_job_detail`.`Number_Across` AS `Number_Across`,`tbl_job_detail`.`FT_Qty__Left_to_Make_Unit` AS `FT_Qty__Left_to_Make_Unit`,`tbl_job_detail`.`Qty_Ordered_Unit` AS `Qty_Ordered_Unit`,`tbl_job_detail`.`Required_Quantity_Unit` AS `Required_Quantity_Unit`,`tbl_job_detail`.`Machine_Center_No2` AS `Machine_Center_No2`,`tbl_job_detail`.`reopen_issues` AS `reopen_issues`,`tbl_job_detail`.`is_deleted` AS `is_deleted`,`tbl_job_detail`.`Production_Status_en` AS `Production_Status_en`,`tbl_job_detail`.`Production_Status_vi` AS `Production_Status_vi`,`tbl_job_detail`.`hours_est` AS `hours_est`,`tbl_job_detail`.`Quantity_Run` AS `Quantity_Run`,`tbl_job_detail`.`Last_Modified_Date` AS `Last_Modified_Date`,`tbl_job_detail`.`Last_Modified_Time` AS `Last_Modified_Time`,`tbl_job_detail`.`Last_Modified_Date_Filter_FilterOnly` AS `Last_Modified_Date_Filter_FilterOnly`,`tbl_job_detail`.`Last_Modified_Time_Filter_FilterOnly` AS `Last_Modified_Time_Filter_FilterOnly`,`tbl_job_detail`.`sample_required_detail_csr` AS `sample_required_detail_csr`,`tbl_job_detail`.`sample_required_detail_msr` AS `sample_required_detail_msr`,`tbl_job_detail`.`note` AS `note`,`tbl_job_detail`.`is_splitter` AS `is_splitter`,`tbl_job_detail`.`job_jacket` AS `job_jacket`,`tbl_job_detail`.`Slitting_Laser_Vents` AS `Slitting_Laser_Vents`,`tbl_job_detail`.`plate_type` AS `plate_type`,`tbl_job_detail`.`break_in_fee` AS `break_in_fee`,`tbl_job_detail`.`Authorization_No` AS `Authorization_No`,`tbl_job_detail`.`instruction_to_operator` AS `instruction_to_operator`,`tbl_job_detail`.`Remaining_Qty_Base` AS `Remaining_Qty_Base`,`tbl_job_detail`.`schedule_color_icon` AS `schedule_color_icon`,`tbl_job_detail`.`schedule_color_note_id` AS `schedule_color_note_id`,`tbl_job_detail`.`Finished_Quantity` AS `Finished_Quantity`,`tbl_job_detail`.`V2UOM_Finished_Qty` AS `V2UOM_Finished_Qty`,`tbl_job_detail`.`is_created` AS `is_created`,`tbl_job_detail`.`press_color_exactly` AS `press_color_exactly`,`tbl_job_detail`.`press_color_1` AS `press_color_1`,`tbl_job_detail`.`press_color_2` AS `press_color_2`,`tbl_job_detail`.`press_color_3` AS `press_color_3`,`tbl_job_detail`.`press_color_4` AS `press_color_4`,`tbl_job_detail`.`press_color_5` AS `press_color_5`,`tbl_job_detail`.`press_color_6` AS `press_color_6`,`tbl_job_detail`.`press_color_7` AS `press_color_7`,`tbl_job_detail`.`press_color_8` AS `press_color_8`,`tbl_job_detail`.`press_color_9` AS `press_color_9`,`tbl_job_detail`.`press_color_10` AS `press_color_10`,`tbl_job_detail`.`film_staging` AS `film_staging`,`tbl_job_detail`.`Rewinder_Wind` AS `Rewinder_Wind`,`tbl_job_detail`.`combo_ext` AS `combo_ext`,`tbl_job_detail`.`mrms` AS `mrms` from `tbl_job_detail` where `tbl_job_detail`.`work_center_code` = 'PRESS' and `tbl_job_detail`.`is_completed` = 1 and `tbl_job_detail`.`is_deleted` = 0) */;

/*View structure for view view_production_output_list */

/*!50001 DROP TABLE IF EXISTS `view_production_output_list` */;
/*!50001 DROP VIEW IF EXISTS `view_production_output_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_production_output_list` AS (select `po`.`id` AS `id`,`po`.`status` AS `status`,`po`.`job_id` AS `job_id`,`po`.`combo_id` AS `combo_id`,`po`.`job_rework_id` AS `job_rework_id`,`po`.`trace_id_nav` AS `trace_id_nav`,`po`.`trace_id_input` AS `trace_id_input`,`po`.`trace_id_input_wip` AS `trace_id_input_wip`,`po`.`return_value_nav` AS `sft_message_id`,`po`.`actual_weight` AS `actual_weight`,`po`.`net_weight` AS `net_weight`,`po`.`qty_feet` AS `qty_feet`,`po`.`created_date` AS `created_date`,`po`.`width` AS `width`,`po`.`item_no` AS `po_item_no`,`po`.`extrusion_item_index` AS `extrusion_item_index`,`po`.`set_no` AS `set_no`,`pi`.`id` AS `id_input`,`pi`.`item_no` AS `item_no`,`pi`.`variant_code` AS `variant_code`,`ji`.`machine_center_code` AS `machine_center_code`,`ji`.`work_center_code` AS `work_center_code`,`ji`.`prod_order_no` AS `prod_order_no`,`jd`.`Long_Description` AS `job_description`,`jd`.`Machine_Center_No2` AS `machine_center_code_nav` from (((`tbl_production_output_roll` `po` left join `tbl_production_input` `pi` on(convert(`po`.`trace_id_input` using utf8) = `pi`.`trace_id`)) left join `tbl_job_info` `ji` on(`ji`.`id` = `po`.`job_id`)) left join `tbl_job_detail` `jd` on(`jd`.`id` = `po`.`job_id`)) where `po`.`status` not in (0,2)) */;

/*View structure for view view_production_scrap_list */

/*!50001 DROP TABLE IF EXISTS `view_production_scrap_list` */;
/*!50001 DROP VIEW IF EXISTS `view_production_scrap_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_production_scrap_list` AS (select `ps`.`id` AS `id`,`ps`.`status` AS `status`,`ps`.`weight_lbs` AS `weight_lbs`,`ps`.`recycle` AS `recycle`,`ps`.`comment` AS `comment`,`ps`.`scrap_code` AS `scrap_code`,`ps`.`sft_message_id` AS `sft_message_id`,`ps`.`apply_message_id` AS `apply_message_id`,`ps`.`print_label_a` AS `print_label_a`,`ps`.`job_id` AS `job_id`,`ps`.`created_by` AS `created_by`,`ps`.`created_date` AS `created_date`,`ps`.`last_modified_by` AS `last_modified_by`,`ps`.`last_modified_date` AS `last_modified_date`,`ps`.`is_deleted` AS `is_deleted`,`ps`.`deleted_by` AS `deleted_by`,`ps`.`deleted_date` AS `deleted_date`,`ji`.`prod_order_no` AS `prod_order_no`,`ji`.`operation_no` AS `operation_no`,`ji`.`prod_order_line_no` AS `prod_order_line_no`,`ji`.`machine_center_code` AS `machine_center_code`,`sc`.`description` AS `scrap_description`,`sc`.`description_vi` AS `scrap_description_vi`,`ps`.`created_date` AS `date_time`,`ps`.`job_rework_id` AS `job_rework_id`,`jd`.`Machine_Center_No2` AS `machine_center_code_nav` from (((`tbl_production_scraps` `ps` left join `tbl_scrap_codes` `sc` on(`ps`.`scrap_code` = `sc`.`code`)) left join `tbl_job_info` `ji` on(`ji`.`id` = `ps`.`job_id`)) left join `tbl_job_detail` `jd` on(`jd`.`id` = `ps`.`job_id`)) where `ps`.`status` not in (0,2)) */;

/*View structure for view view_production_status_list */

/*!50001 DROP TABLE IF EXISTS `view_production_status_list` */;
/*!50001 DROP VIEW IF EXISTS `view_production_status_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_production_status_list` AS (select `s`.`id` AS `id`,`c`.`code` AS `status_code`,`c`.`description` AS `status_description`,`c`.`description_vi` AS `status_description_vi`,`s`.`comment` AS `comment`,`s`.`real_time` AS `date_time`,`s`.`created_date` AS `created_date`,`s`.`status` AS `status`,`s`.`job_id` AS `job_id`,`s`.`job_rework_id` AS `job_rework_id`,`ji`.`machine_center_code` AS `machine_center_code`,`ji`.`prod_order_no` AS `prod_order_no`,`jd`.`Machine_Center_No2` AS `machine_center_code_nav` from (((`tbl_production_status` `s` left join `tbl_production_status_codes` `c` on(`s`.`status_code` = convert(`c`.`code` using utf8))) left join `tbl_job_info` `ji` on(`ji`.`id` = `s`.`job_id`)) left join `tbl_job_detail` `jd` on(`jd`.`id` = `s`.`job_id`)) where `s`.`status` not in (0,2)) */;

/*View structure for view view_ps_all_roll_out_for_tab_ouput */

/*!50001 DROP TABLE IF EXISTS `view_ps_all_roll_out_for_tab_ouput` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_all_roll_out_for_tab_ouput` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_all_roll_out_for_tab_ouput` AS (select distinct `po`.`id` AS `id`,`po`.`in_put_id` AS `in_put_id`,`po`.`in_trace_id` AS `in_trace_id`,`po`.`out_trace_id` AS `out_trace_id`,`po`.`id` AS `out_put_id`,`po`.`out_gross_weight` AS `out_gross_weight`,`po`.`out_net_weight` AS `out_net_weight`,`po`.`out_quantity` AS `out_quantity`,`po`.`out_width` AS `out_width`,`po`.`out_created_date` AS `out_created_date`,`po`.`out_product_code` AS `out_product_code`,`po`.`out_set_no` AS `out_set_no`,`po`.`out_lane_no` AS `out_lane_no`,`po`.`out_constituent` AS `out_constituent`,`po`.`out_connect_no` AS `out_connect_no`,`po`.`out_is_deleted` AS `out_is_deleted`,`po`.`is_marked_rework` AS `is_marked_rework`,`bo`.`is_deleted` AS `box_is_deleted` from (`ps_job_output` `po` left join `ps_boxed_trace_id` `bo` on(`po`.`id` = `bo`.`out_put_id`)) where `po`.`out_is_deleted` = 0 and `po`.`is_marked_rework` in (0,1) and `po`.`out_created_date` between current_timestamp() - interval 3 day and current_timestamp() and !(`po`.`out_trace_id` in (select `ps_boxed_trace_id`.`out_put_trace_id` from `ps_boxed_trace_id` where `ps_boxed_trace_id`.`is_deleted` = 0))) */;

/*View structure for view view_ps_list_box */

/*!50001 DROP TABLE IF EXISTS `view_ps_list_box` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_list_box` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_list_box` AS (select `box`.`id` AS `id`,`box`.`box_trace_id` AS `box_trace_id`,`box`.`input_trace_id` AS `input_trace_id`,`box`.`box_status` AS `box_status`,`box`.`date_time` AS `date_time`,`box`.`sft_message_id` AS `sft_message_id`,`box`.`job_id` AS `job_id`,`box`.`job_rework_id` AS `job_rework_id`,`box`.`box_deleted` AS `box_deleted`,`box`.`box_deleted_by` AS `box_deleted_by`,`box`.`box_deleted_date` AS `box_deleted_date`,`box`.`prod_order_no` AS `prod_order_no`,`box`.`work_center_code` AS `work_center_code`,`box`.`machine_center_code` AS `machine_center_code`,`box`.`is_pending_box` AS `is_pending_box`,`box`.`rework_ticket` AS `rework_ticket`,`box`.`is_printed` AS `is_printed`,`box`.`gross_weight` AS `gross_weight`,`box`.`net_weight` AS `net_weight`,`box`.`lane_no` AS `lane_no`,`box`.`set_no` AS `set_no`,`box`.`shift` AS `shift`,`box`.`joins_no` AS `joins_no`,`box`.`constituent` AS `constituent`,`box`.`dimension` AS `dimension`,`box`.`thickness` AS `thickness`,`box`.`box_total_rolls` AS `box_total_rolls`,`box`.`box_weight` AS `box_weight`,`ps`.`job_no` AS `job_no` from (`ps_boxed` `box` left join `ps_prod_schedule` `ps` on(`ps`.`id` = `box`.`job_id`)) where `box`.`box_deleted` = 0 and `box`.`box_status` = 1 and !(`box`.`id` in (select `ps_pallet_box`.`box_id` from `ps_pallet_box` where `ps_pallet_box`.`is_deleted` = 0))) */;

/*View structure for view view_ps_list_box_pouching_rework */

/*!50001 DROP TABLE IF EXISTS `view_ps_list_box_pouching_rework` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_list_box_pouching_rework` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_list_box_pouching_rework` AS (select `po`.`id` AS `id`,`po`.`in_trace_id` AS `in_trace_id`,`po`.`out_trace_id` AS `out_trace_id`,`po`.`id` AS `out_put_id`,`po`.`out_gross_weight` AS `out_gross_weight`,`po`.`out_net_weight` AS `out_net_weight`,`po`.`out_quantity` AS `out_quantity`,`po`.`out_created_date` AS `out_created_date`,`po`.`out_product_code` AS `out_product_code`,`po`.`out_set_no` AS `out_set_no`,`po`.`out_uom` AS `out_uom`,`po`.`is_marked_rework` AS `is_marked_rework`,`po`.`out_constituent` AS `out_constituent`,`po`.`out_shift` AS `out_shift`,`po`.`out_is_deleted` AS `out_is_deleted`,`po`.`out_reason_rework` AS `out_reason_rework`,`po`.`out_description` AS `out_description`,`po`.`in_put_id` AS `in_put_id`,`ps`.`machine_code` AS `machine_code`,`rw`.`add_machine_code` AS `machine_code_rw`,`ps`.`machine_name` AS `machine_name`,`ps`.`job_status` AS `job_status`,`ps`.`job_no` AS `job_no`,`po`.`job_id` AS `job_id`,`po`.`type_box` AS `type_box`,`po`.`out_producer` AS `out_producer`,`po`.`out_line_no` AS `out_line_no`,`po`.`out_box_no` AS `out_box_no`,`rw`.`job_id` AS `job_id_rw`,`rw`.`add_is_deleted` AS `add_is_deleted` from ((`ps_job_output_pouching` `po` left join `ps_prod_schedule` `ps` on(`ps`.`id` = `po`.`job_id`)) left join `ps_job_add_traceid_rework_pouching` `rw` on(`po`.`out_trace_id` = `rw`.`out_trace_id`)) where `po`.`out_is_deleted` = 0 and `po`.`is_marked_rework` in (1,3,5) and `po`.`out_status` = 0 and `po`.`out_quantity` <> 0 and (`rw`.`add_is_deleted` <> 1 or `rw`.`add_is_deleted` is null)) */;

/*View structure for view view_ps_list_box_pouching_spout_inserter */

/*!50001 DROP TABLE IF EXISTS `view_ps_list_box_pouching_spout_inserter` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_list_box_pouching_spout_inserter` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_list_box_pouching_spout_inserter` AS (select `po`.`id` AS `id`,`po`.`in_trace_id` AS `in_trace_id`,`po`.`out_trace_id` AS `out_trace_id`,`po`.`id` AS `out_put_id`,`po`.`out_gross_weight` AS `out_gross_weight`,`po`.`out_net_weight` AS `out_net_weight`,`po`.`out_quantity` AS `out_quantity`,`po`.`out_created_date` AS `out_created_date`,`po`.`out_product_code` AS `out_product_code`,`po`.`out_set_no` AS `out_set_no`,`po`.`out_uom` AS `out_uom`,`po`.`is_marked_rework` AS `is_marked_rework`,`po`.`out_constituent` AS `out_constituent`,`po`.`out_shift` AS `out_shift`,`po`.`out_is_deleted` AS `out_is_deleted`,`po`.`out_reason_rework` AS `out_reason_rework`,`po`.`out_description` AS `out_description`,`po`.`in_put_id` AS `in_put_id`,`ps`.`machine_code` AS `machine_code`,`rw`.`add_machine_code` AS `machine_code_rw`,`ps`.`machine_name` AS `machine_name`,`ps`.`job_status` AS `job_status`,`ps`.`job_no` AS `job_no`,`po`.`job_id` AS `job_id`,`po`.`type_box` AS `type_box`,`po`.`out_producer` AS `out_producer`,`po`.`out_line_no` AS `out_line_no`,`po`.`out_box_no` AS `out_box_no`,`rw`.`job_id` AS `job_id_rw`,`po`.`out_id_return` AS `out_id_return`,`po`.`out_is_received` AS `out_is_received`,`rw`.`add_is_deleted` AS `add_is_deleted` from ((`ps_job_output_pouching` `po` left join `ps_prod_schedule` `ps` on(`ps`.`id` = `po`.`job_id`)) left join `ps_job_add_traceid_rework_pouching` `rw` on(`po`.`out_trace_id` = `rw`.`out_trace_id`)) where `po`.`out_is_deleted` = 0 and `ps`.`pouching_has_faucet` = 1 and (`po`.`is_marked_rework` = 0 or `po`.`is_marked_rework` = 3) and `po`.`out_quantity` <> 0 and `po`.`out_status` = 0 and (`rw`.`add_is_deleted` <> 1 or `rw`.`add_is_deleted` is null)) */;

/*View structure for view view_ps_list_pallet */

/*!50001 DROP TABLE IF EXISTS `view_ps_list_pallet` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_list_pallet` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_list_pallet` AS (select `pl`.`id` AS `id`,`pl`.`pallet_trace_id` AS `pallet_trace_id`,`pl`.`pallet_status` AS `pallet_status`,`pl`.`is_receipt` AS `is_receipt`,`pl`.`pallet_total_box` AS `pallet_total_box`,`pl`.`pallet_note` AS `pallet_note`,`pl`.`date_time` AS `date_time`,`pl`.`sft_message_id` AS `sft_message_id`,`pl`.`job_id` AS `job_id`,`pl`.`machine_center_code` AS `machine_center_code`,`pl`.`pallet_weight` AS `pallet_weight`,`pl`.`pallet_no` AS `pallet_no`,`ps`.`job_no` AS `job_no` from (`ps_pallet` `pl` left join `ps_prod_schedule` `ps` on(`ps`.`id` = `pl`.`job_id`)) where `pl`.`pallet_deleted` = 0 and `pl`.`pallet_status` in (0,1)) */;

/*View structure for view view_ps_list_pouching_out */

/*!50001 DROP TABLE IF EXISTS `view_ps_list_pouching_out` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_list_pouching_out` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_list_pouching_out` AS (select `po`.`id` AS `id`,`po`.`in_trace_id` AS `trace_id_input`,`po`.`out_trace_id` AS `out_trace_id`,`po`.`id` AS `out_put_id`,`po`.`out_gross_weight` AS `out_gross_weight`,`po`.`out_net_weight` AS `net_weight`,`po`.`out_quantity` AS `out_quantity`,`po`.`out_created_date` AS `out_created_date`,`po`.`out_product_code` AS `out_product_code`,`po`.`out_set_no` AS `out_set_no`,`po`.`out_box_no` AS `out_box_no`,`po`.`is_marked_rework` AS `is_marked_rework`,`po`.`out_constituent` AS `out_constituent`,`po`.`out_shift` AS `out_shift`,`po`.`out_is_deleted` AS `out_is_deleted`,`pi`.`id` AS `id_input`,`pi`.`in_product_code` AS `in_product_code`,`po`.`job_id` AS `job_id`,`ps`.`machine_code` AS `machine_code`,`ps`.`machine_name` AS `machine_name`,`ps`.`job_status` AS `job_status`,`ps`.`job_no` AS `job_no` from ((`ps_job_output_pouching` `po` left join `ps_job_input` `pi` on(convert(`po`.`in_put_id` using utf8) = `pi`.`id`)) left join `ps_prod_schedule` `ps` on(`ps`.`id` = `po`.`job_id`)) where `po`.`out_is_deleted` = 0 and `po`.`is_marked_rework` in (0,2,4) and `po`.`out_odd_box` in (0,2) and `po`.`out_box_no` > 0 and `po`.`out_status` = 0) */;

/*View structure for view view_ps_list_rework_roll_out */

/*!50001 DROP TABLE IF EXISTS `view_ps_list_rework_roll_out` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_list_rework_roll_out` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_list_rework_roll_out` AS (select `po`.`id` AS `id`,`po`.`in_trace_id` AS `in_trace_id`,`po`.`out_trace_id` AS `out_trace_id`,`po`.`id` AS `out_put_id`,`po`.`out_gross_weight` AS `out_gross_weight`,`po`.`out_net_weight` AS `out_net_weight`,`po`.`out_quantity` AS `out_quantity`,`po`.`out_width` AS `out_width`,`po`.`out_created_date` AS `out_created_date`,`po`.`out_product_code` AS `out_product_code`,`po`.`out_set_no` AS `out_set_no`,`po`.`out_lane_no` AS `out_lane_no`,`po`.`out_connect_no` AS `out_connect_no`,`po`.`out_uom` AS `out_uom`,`po`.`is_marked_rework` AS `is_marked_rework`,`po`.`out_constituent` AS `out_constituent`,`po`.`out_shift` AS `out_shift`,`po`.`out_is_deleted` AS `out_is_deleted`,`po`.`out_reason_rework` AS `out_reason_rework`,`po`.`out_description` AS `out_description`,`po`.`out_master_trace_id` AS `out_master_trace_id`,`po`.`in_put_id` AS `in_put_id`,`po`.`remaining_outer_roll` AS `remaining_outer_roll`,`rw`.`add_machine_code` AS `machine_code_rw`,`po`.`job_id` AS `job_id`,`rw`.`job_id` AS `job_id_rw`,`rw`.`add_is_deleted` AS `add_is_deleted` from ((select `apiv2_apisft`.`ps_job_output`.`id` AS `id`,`apiv2_apisft`.`ps_job_output`.`in_put_id` AS `in_put_id`,`apiv2_apisft`.`ps_job_output`.`job_id` AS `job_id`,`apiv2_apisft`.`ps_job_output`.`out_product_code` AS `out_product_code`,`apiv2_apisft`.`ps_job_output`.`out_reason_rework` AS `out_reason_rework`,`apiv2_apisft`.`ps_job_output`.`out_description` AS `out_description`,`apiv2_apisft`.`ps_job_output`.`in_trace_id` AS `in_trace_id`,`apiv2_apisft`.`ps_job_output`.`out_trace_id` AS `out_trace_id`,`apiv2_apisft`.`ps_job_output`.`out_width` AS `out_width`,`apiv2_apisft`.`ps_job_output`.`out_quantity` AS `out_quantity`,`apiv2_apisft`.`ps_job_output`.`out_uom` AS `out_uom`,`apiv2_apisft`.`ps_job_output`.`out_created_by` AS `out_created_by`,`apiv2_apisft`.`ps_job_output`.`out_created_date` AS `out_created_date`,`apiv2_apisft`.`ps_job_output`.`out_is_deleted` AS `out_is_deleted`,`apiv2_apisft`.`ps_job_output`.`out_deleted_by` AS `out_deleted_by`,`apiv2_apisft`.`ps_job_output`.`out_deleted_date` AS `out_deleted_date`,`apiv2_apisft`.`ps_job_output`.`out_is_printed` AS `out_is_printed`,`apiv2_apisft`.`ps_job_output`.`out_set_no` AS `out_set_no`,`apiv2_apisft`.`ps_job_output`.`out_is_reprinted` AS `out_is_reprinted`,`apiv2_apisft`.`ps_job_output`.`is_marked_rework_date` AS `is_marked_rework_date`,`apiv2_apisft`.`ps_job_output`.`is_marked_rework_by` AS `is_marked_rework_by`,`apiv2_apisft`.`ps_job_output`.`is_marked_rework` AS `is_marked_rework`,`apiv2_apisft`.`ps_job_output`.`out_lane_no` AS `out_lane_no`,`apiv2_apisft`.`ps_job_output`.`out_net_weight` AS `out_net_weight`,`apiv2_apisft`.`ps_job_output`.`out_gross_weight` AS `out_gross_weight`,`apiv2_apisft`.`ps_job_output`.`out_connect_no` AS `out_connect_no`,`apiv2_apisft`.`ps_job_output`.`out_shift` AS `out_shift`,`apiv2_apisft`.`ps_job_output`.`out_constituent` AS `out_constituent`,`apiv2_apisft`.`ps_job_output`.`out_status` AS `out_status`,`apiv2_apisft`.`ps_job_output`.`no_of_rewind` AS `no_of_rewind`,`apiv2_apisft`.`ps_job_output`.`out_master_trace_id` AS `out_master_trace_id`,`apiv2_apisft`.`ps_job_output`.`remaining_outer_roll` AS `remaining_outer_roll`,`apiv2_apisft`.`ps_job_output`.`out_date` AS `out_date`,`apiv2_apisft`.`ps_job_output`.`out_label_date` AS `out_label_date`,`apiv2_apisft`.`ps_job_output`.`out_join_position` AS `out_join_position`,`apiv2_apisft`.`ps_job_output`.`out_reason_rework_id` AS `out_reason_rework_id`,`apiv2_apisft`.`ps_job_output`.`HSD` AS `HSD` from `apiv2_apisft`.`ps_job_output` where `apiv2_apisft`.`ps_job_output`.`out_is_deleted` = 0 and `apiv2_apisft`.`ps_job_output`.`out_status` = 0 and `apiv2_apisft`.`ps_job_output`.`is_marked_rework` in (1,3,5)) `po` left join `apiv2_apisft`.`ps_job_add_traceid_rework` `rw` on(`po`.`id` = `rw`.`out_id`)) where `po`.`out_is_deleted` = 0 and `po`.`is_marked_rework` in (1,3,5) and `po`.`out_status` = 0 and (`rw`.`add_is_deleted` <> 1 or `rw`.`add_is_deleted` is null)) */;

/*View structure for view view_ps_list_roll_out */

/*!50001 DROP TABLE IF EXISTS `view_ps_list_roll_out` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_list_roll_out` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_list_roll_out` AS (select `po`.`id` AS `id`,`po`.`in_trace_id` AS `trace_id_input`,`po`.`out_trace_id` AS `out_trace_id`,`po`.`id` AS `out_put_id`,`po`.`out_gross_weight` AS `out_gross_weight`,`po`.`out_net_weight` AS `net_weight`,`po`.`out_quantity` AS `out_quantity`,`po`.`out_width` AS `out_width`,`po`.`out_created_date` AS `out_created_date`,`po`.`out_product_code` AS `out_product_code`,`po`.`out_set_no` AS `out_set_no`,`po`.`out_lane_no` AS `out_lane_no`,`po`.`is_marked_rework` AS `is_marked_rework`,`po`.`out_constituent` AS `out_constituent`,`po`.`out_shift` AS `out_shift`,`po`.`out_is_deleted` AS `out_is_deleted`,`pi`.`id` AS `id_input`,`pi`.`in_product_code` AS `in_product_code`,`po`.`job_id` AS `job_id`,`ps`.`machine_code` AS `machine_code`,`ps`.`machine_name` AS `machine_name`,`ps`.`job_status` AS `job_status`,`ps`.`job_no` AS `job_no` from ((`ps_job_output` `po` left join `ps_job_input` `pi` on(convert(`po`.`in_put_id` using utf8) = `pi`.`id`)) left join `ps_prod_schedule` `ps` on(`ps`.`id` = `po`.`job_id`)) where `po`.`out_is_deleted` = 0 and `po`.`is_marked_rework` in (0,2) and `po`.`out_quantity` > 0 and `po`.`out_status` = 0) */;

/*View structure for view view_ps_list_roll_out_in_pallet */

/*!50001 DROP TABLE IF EXISTS `view_ps_list_roll_out_in_pallet` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_list_roll_out_in_pallet` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_list_roll_out_in_pallet` AS (select `po`.`id` AS `id`,`po`.`in_trace_id` AS `trace_id_input`,`pi`.`in_set_no` AS `in_set_no`,`po`.`out_trace_id` AS `out_trace_id`,`ps`.`machine_name` AS `machine_name`,`ps`.`job_no` AS `job_no`,`pl`.`pallet_trace_id` AS `pallet_trace_id`,`bo`.`box_trace_id` AS `box_trace_id`,`bo`.`box_weight` AS `box_weight`,`po`.`out_gross_weight` AS `out_gross_weight`,`po`.`out_net_weight` AS `net_weight`,`po`.`out_quantity` AS `out_quantity`,`po`.`out_width` AS `out_width`,`po`.`out_created_date` AS `out_created_date`,`po`.`out_product_code` AS `out_product_code`,`po`.`out_set_no` AS `out_set_no`,`po`.`out_lane_no` AS `out_lane_no`,`po`.`out_label_date` AS `out_label_date`,`po`.`out_connect_no` AS `out_connect_no`,`po`.`is_marked_rework` AS `is_marked_rework`,`po`.`out_constituent` AS `out_constituent`,`po`.`out_shift` AS `out_shift`,`po`.`out_is_deleted` AS `out_is_deleted`,`pi`.`id` AS `id_input`,`pi`.`in_product_code` AS `in_product_code`,`pi`.`job_id` AS `job_id`,`ps`.`machine_code` AS `machine_code`,`ps`.`job_status` AS `job_status`,`pb`.`pallet_id` AS `pallet_id` from ((((((`ps_job_output` `po` left join `ps_job_input` `pi` on(convert(`po`.`in_put_id` using utf8) = `pi`.`id`)) left join `ps_boxed_trace_id` `bt` on(`po`.`id` = `bt`.`out_put_id`)) left join `ps_boxed` `bo` on(`bo`.`id` = `bt`.`box_id`)) left join `ps_pallet_box` `pb` on(`pb`.`box_id` = `bo`.`id`)) left join `ps_pallet` `pl` on(`pl`.`id` = `pb`.`pallet_id`)) left join `ps_prod_schedule` `ps` on(`ps`.`id` = `po`.`job_id`)) where `po`.`out_is_deleted` = 0 and `bt`.`is_deleted` = 0 and `pb`.`is_deleted` = 0 and `po`.`is_marked_rework` in (0,2)) */;

/*View structure for view view_ps_list_roll_out_new */

/*!50001 DROP TABLE IF EXISTS `view_ps_list_roll_out_new` */;
/*!50001 DROP VIEW IF EXISTS `view_ps_list_roll_out_new` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_ps_list_roll_out_new` AS (select `po`.`id` AS `id`,`po`.`in_trace_id` AS `trace_id_input`,`pi`.`in_set_no` AS `in_set_no`,`po`.`out_trace_id` AS `out_trace_id`,`ps`.`machine_name` AS `machine_name`,`ps`.`job_no` AS `job_no`,`pl`.`pallet_trace_id` AS `pallet_trace_id`,`bo`.`box_trace_id` AS `box_trace_id`,`bo`.`box_weight` AS `box_weight`,`po`.`out_gross_weight` AS `out_gross_weight`,`po`.`out_net_weight` AS `net_weight`,`po`.`out_quantity` AS `out_quantity`,`po`.`out_width` AS `out_width`,`po`.`out_created_date` AS `out_created_date`,`po`.`out_product_code` AS `out_product_code`,`po`.`out_set_no` AS `out_set_no`,`po`.`out_lane_no` AS `out_lane_no`,`po`.`out_label_date` AS `out_label_date`,`po`.`out_connect_no` AS `out_connect_no`,`po`.`is_marked_rework` AS `is_marked_rework`,`po`.`out_constituent` AS `out_constituent`,`po`.`out_shift` AS `out_shift`,`po`.`out_is_deleted` AS `out_is_deleted`,`pi`.`id` AS `id_input`,`pi`.`in_product_code` AS `in_product_code`,`pi`.`job_id` AS `job_id`,`ps`.`machine_code` AS `machine_code`,`ps`.`job_status` AS `job_status`,`pb`.`pallet_id` AS `pallet_id` from ((((((`ps_job_output` `po` left join `ps_job_input` `pi` on(convert(`po`.`in_put_id` using utf8) = `pi`.`id`)) left join `ps_boxed_trace_id` `bt` on(`po`.`id` = `bt`.`out_put_id`)) left join `ps_boxed` `bo` on(`bo`.`id` = `bt`.`box_id`)) left join `ps_pallet_box` `pb` on(`pb`.`box_id` = `bo`.`id`)) left join `ps_pallet` `pl` on(`pl`.`id` = `pb`.`pallet_id`)) left join `ps_prod_schedule` `ps` on(`ps`.`id` = `po`.`job_id`)) where `po`.`out_is_deleted` = 0 and `bt`.`is_deleted` = 0 and `pb`.`is_deleted` = 0 and `po`.`is_marked_rework` in (0,2)) */;

/*View structure for view view_role */

/*!50001 DROP TABLE IF EXISTS `view_role` */;
/*!50001 DROP VIEW IF EXISTS `view_role` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_role` AS (select `r`.`id` AS `id`,`r`.`role_name` AS `role_name`,`r`.`short_name` AS `short_name`,`r`.`description` AS `description`,`r`.`department` AS `department`,`r`.`is_sft_read_only` AS `is_sft_read_only`,`r`.`status` AS `status`,`r`.`deleted_by` AS `deleted_by`,`r`.`deleted_date` AS `deleted_date`,`r`.`group_id` AS `group_id`,`r`.`parent_id` AS `parent_id`,`g`.`name` AS `group_name`,`g`.`description` AS `group_description`,`g`.`level` AS `group_level`,`g`.`is_global` AS `is_global`,`p`.`role_name` AS `parent_name`,`p`.`short_name` AS `parent_short_name`,`p`.`description` AS `parent_description` from ((`tbl_roles_sft` `r` left join `tbl_role_group` `g` on(`r`.`group_id` = `g`.`id`)) left join `tbl_roles_sft` `p` on(`r`.`parent_id` = `p`.`id`)) where `r`.`status` = 1) */;

/*View structure for view view_user_list */

/*!50001 DROP TABLE IF EXISTS `view_user_list` */;
/*!50001 DROP VIEW IF EXISTS `view_user_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_user_list` AS (select `u`.`id` AS `id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`email` AS `email`,`u`.`status` AS `status`,`u`.`login_code` AS `login_code`,`u`.`shift_code_id` AS `shift_code_id`,`u`.`role_id` AS `role_id`,`u`.`machine_code` AS `machine_code`,`u`.`machine_name` AS `machine_name`,`u`.`activated` AS `activated`,`u`.`password_hash` AS `password_hash`,`u`.`registered_date` AS `registered_date`,`u`.`activated_date` AS `activated_date`,`u`.`deleted_by` AS `deleted_by`,`u`.`deleted_at` AS `deleted_at`,`u`.`plan_code` AS `plan_code`,`u`.`mrms_id` AS `mrms_id`,`u`.`mrms_name` AS `mrms_name`,`u`.`is_test` AS `is_test`,concat(`u`.`first_name`,' ',`u`.`last_name`) AS `full_name`,case when `u`.`activated` = 1 then 'Yes' when `u`.`activated` = 0 then 'No' end AS `activated_name`,`r`.`role_name` AS `role_name`,`r`.`department` AS `department`,`r`.`group_id` AS `group_id`,`rg`.`name` AS `group`,`rg`.`level` AS `group_level`,`rg`.`is_global` AS `is_global`,`ws`.`description` AS `shift_code` from (((`tbl_users_sft` `u` left join `tbl_roles_sft` `r` on(`u`.`role_id` = `r`.`id`)) left join `tbl_working_shifts` `ws` on(`u`.`shift_code_id` = `ws`.`id`)) left join `tbl_role_group` `rg` on(`r`.`group_id` = `rg`.`id`)) where `u`.`status` = 1) */;

/*View structure for view view_working_history */

/*!50001 DROP TABLE IF EXISTS `view_working_history` */;
/*!50001 DROP VIEW IF EXISTS `view_working_history` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_working_history` AS (select `lh`.`id` AS `login_history_id`,`wo`.`job_id` AS `job_id`,`ji`.`prod_order_no` AS `prod_order_no`,`lh`.`login_code` AS `login_code`,`lh`.`shift_code` AS `shift_code`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`lh`.`status` AS `is_logout`,`lh`.`in_time` AS `in_time`,`lh`.`out_time` AS `out_time`,`lh`.`machine_code` AS `machine_code`,`wo`.`is_start_job` AS `is_start_job` from (`tbl_job_info` `ji` left join (`tbl_working_on` `wo` left join (`tbl_login_history` `lh` join `tbl_users_sft` `u` on(`lh`.`login_code` = `u`.`login_code`)) on(`lh`.`id` = `wo`.`login_history_id`)) on(`wo`.`job_id` = `ji`.`id`)) where `wo`.`is_disabled` = 0 and `ji`.`is_disabled` = 0 order by `lh`.`id` desc) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
