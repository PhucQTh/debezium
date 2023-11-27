/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - acca_humanresource
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acca_humanresource` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `acca_humanresource`;

/*Table structure for table `hrm_att_leaveday` */

DROP TABLE IF EXISTS `hrm_att_leaveday`;

CREATE TABLE `hrm_att_leaveday` (
  `ID` varchar(50) DEFAULT NULL,
  `SortID` int(11) DEFAULT NULL,
  `ProfileID` varchar(50) DEFAULT NULL,
  `LeaveDayTypeID` varchar(50) DEFAULT NULL,
  `UserApproveID` varchar(50) DEFAULT NULL,
  `UserApproveID2` varchar(50) DEFAULT NULL,
  `UserRejectID` varchar(50) DEFAULT NULL,
  `OrgStructureID` varchar(50) DEFAULT NULL,
  `DateStart` datetime DEFAULT NULL,
  `DateEnd` datetime DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Comment` varchar(250) DEFAULT NULL,
  `Duration` int(10) DEFAULT NULL,
  `TotalDuration` float DEFAULT NULL,
  `DurationType` varchar(50) DEFAULT NULL,
  `LeaveDays` float DEFAULT NULL,
  `LeaveHours` float DEFAULT NULL,
  `IsDelete` int(1) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `DateUpdate` datetime DEFAULT NULL,
  `DateSyn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `hrm_cat_enumtranslate` */

DROP TABLE IF EXISTS `hrm_cat_enumtranslate`;

CREATE TABLE `hrm_cat_enumtranslate` (
  `ID` varchar(50) DEFAULT NULL,
  `SortID` int(11) DEFAULT NULL,
  `EnumName` varchar(50) DEFAULT NULL,
  `EnumKey` varchar(50) DEFAULT NULL,
  `EN` varchar(250) DEFAULT NULL,
  `VN` varchar(250) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `DateUpdate` datetime DEFAULT NULL,
  `IsDelete` int(1) DEFAULT 0,
  `DateSyn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `hrm_cat_leavedaytype` */

DROP TABLE IF EXISTS `hrm_cat_leavedaytype`;

CREATE TABLE `hrm_cat_leavedaytype` (
  `ID` varchar(50) DEFAULT NULL,
  `SortID` int(11) DEFAULT NULL,
  `LeaveDayTypeName` varchar(250) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `CodeStatistic` varchar(50) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `DateUpdate` datetime DEFAULT NULL,
  `DateSyn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `hrm_cat_orgstructure` */

DROP TABLE IF EXISTS `hrm_cat_orgstructure`;

CREATE TABLE `hrm_cat_orgstructure` (
  `ID` varchar(50) DEFAULT NULL,
  `SortID` int(11) DEFAULT NULL,
  `OrgStructureName` varchar(250) DEFAULT NULL,
  `OrgStructureNameEN` varchar(250) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `DateUpdate` datetime DEFAULT NULL,
  `DateSyn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `hrm_hre_profile` */

DROP TABLE IF EXISTS `hrm_hre_profile`;

CREATE TABLE `hrm_hre_profile` (
  `ID` varchar(50) DEFAULT NULL,
  `SortID` int(11) DEFAULT NULL,
  `OrgStructureID` varchar(50) DEFAULT NULL,
  `ProfileName` varchar(50) DEFAULT NULL,
  `CodeEmp` varchar(10) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Email2` varchar(50) DEFAULT NULL,
  `Cellphone` varchar(50) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `DateUpdate` datetime DEFAULT NULL,
  `DateSyn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `hrm_sys_userinfo` */

DROP TABLE IF EXISTS `hrm_sys_userinfo`;

CREATE TABLE `hrm_sys_userinfo` (
  `ID` varchar(50) DEFAULT NULL,
  `ProfileID` varchar(50) DEFAULT NULL,
  `SortID` int(11) DEFAULT NULL,
  `UserInfoName` varchar(50) DEFAULT NULL,
  `IsActivate` int(1) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `DateUpdate` datetime DEFAULT NULL,
  `DateSyn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

/*Table structure for table `tbl_acca_food` */

DROP TABLE IF EXISTS `tbl_acca_food`;

CREATE TABLE `tbl_acca_food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(500) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `lunch_rice` int(11) DEFAULT NULL,
  `lunch_water` int(11) DEFAULT NULL,
  `lunch_milk` int(11) DEFAULT NULL,
  `lunch_vegetarian` int(11) DEFAULT NULL,
  `dinner_rice` int(11) DEFAULT NULL,
  `dinner_water` int(11) DEFAULT NULL,
  `dinner_milk` int(11) DEFAULT NULL,
  `dinner_vegetarian` int(11) DEFAULT NULL,
  `supper_rice` int(11) DEFAULT NULL,
  `supper_water` int(11) DEFAULT NULL,
  `supper_milk` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3184 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_acca_food_code` */

DROP TABLE IF EXISTS `tbl_acca_food_code`;

CREATE TABLE `tbl_acca_food_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(50) DEFAULT NULL,
  `emp_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `tbl_configurations` */

DROP TABLE IF EXISTS `tbl_configurations`;

CREATE TABLE `tbl_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(150) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ddl_cate` */

DROP TABLE IF EXISTS `tbl_ddl_cate`;

CREATE TABLE `tbl_ddl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_list_cate` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

/*Table structure for table `tbl_employees` */

DROP TABLE IF EXISTS `tbl_employees`;

CREATE TABLE `tbl_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_status` int(11) DEFAULT 1,
  `department_id` int(11) DEFAULT 0,
  `emp_no` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emp_salutation` int(11) DEFAULT NULL,
  `emp_gender` int(11) DEFAULT NULL,
  `emp_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emp_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emp_address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `emp_birth_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `emp_avatar` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_randon` */

DROP TABLE IF EXISTS `tbl_randon`;

CREATE TABLE `tbl_randon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rd_number` int(11) DEFAULT NULL,
  `rd_status` int(1) DEFAULT 0,
  `rd_date` datetime DEFAULT NULL,
  `rd_name` varchar(250) DEFAULT NULL,
  `rd_position` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_role_matrix` */

DROP TABLE IF EXISTS `tbl_role_matrix`;

CREATE TABLE `tbl_role_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_key` varchar(50) DEFAULT NULL,
  `column_hide` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_wish_of_birthday` */

DROP TABLE IF EXISTS `tbl_wish_of_birthday`;

CREATE TABLE `tbl_wish_of_birthday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_emailtemplate` int(11) DEFAULT NULL,
  `wish_content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
