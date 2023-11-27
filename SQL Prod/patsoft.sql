/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.3.38-MariaDB-0ubuntu0.20.04.1-log : Database - acca_patsoft
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acca_patsoft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `acca_patsoft`;

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL DEFAULT 0,
  `language` varchar(16) NOT NULL DEFAULT '',
  `translation` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `FK_Message_SourceMessage` FOREIGN KEY (`id`) REFERENCES `sourcemessage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `patsoft_dm_ca` */

DROP TABLE IF EXISTS `patsoft_dm_ca`;

CREATE TABLE `patsoft_dm_ca` (
  `MaCa` int(10) NOT NULL,
  `TenCa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaCa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_dm_donvitinh` */

DROP TABLE IF EXISTS `patsoft_dm_donvitinh`;

CREATE TABLE `patsoft_dm_donvitinh` (
  `DVT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MoTa` varchar(500) DEFAULT NULL,
  `DoUuTien` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `patsoft_dm_hoandoidvt` */

DROP TABLE IF EXISTS `patsoft_dm_hoandoidvt`;

CREATE TABLE `patsoft_dm_hoandoidvt` (
  `DonViGoc` varchar(100) NOT NULL,
  `DonViApDung` varchar(100) DEFAULT NULL,
  `PhamVi` varchar(5) DEFAULT NULL,
  `Ma` varchar(20) DEFAULT NULL,
  `ToanTu` char(1) DEFAULT NULL,
  `TyLeHoanDoi` decimal(18,6) DEFAULT NULL,
  `GhiChu` varchar(255) DEFAULT NULL,
  `SoLe` varchar(1) DEFAULT NULL,
  `UserUpdate` varchar(50) DEFAULT NULL,
  `NgayUpdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_dm_khachhang` */

DROP TABLE IF EXISTS `patsoft_dm_khachhang`;

CREATE TABLE `patsoft_dm_khachhang` (
  `MaSoKH` varchar(20) NOT NULL,
  `TenKhachHang` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_dm_kho` */

DROP TABLE IF EXISTS `patsoft_dm_kho`;

CREATE TABLE `patsoft_dm_kho` (
  `KhoID` varchar(20) NOT NULL,
  `MaKho` varchar(20) NOT NULL,
  `TenKho` varchar(255) DEFAULT NULL,
  `DangSuDung` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_dm_lookup` */

DROP TABLE IF EXISTS `patsoft_dm_lookup`;

CREATE TABLE `patsoft_dm_lookup` (
  `MaLook` varchar(50) DEFAULT NULL,
  `TenLook` varchar(200) DEFAULT NULL,
  `MaDoiTuong` varchar(100) DEFAULT NULL,
  `TenDoiTuong` varchar(100) DEFAULT NULL,
  `GhiChu` varchar(80) DEFAULT NULL,
  `Active` char(1) DEFAULT NULL,
  `MaLookCha` varchar(50) DEFAULT NULL,
  `STT` varchar(11) DEFAULT NULL,
  `NhomCD` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_dm_vattu` */

DROP TABLE IF EXISTS `patsoft_dm_vattu`;

CREATE TABLE `patsoft_dm_vattu` (
  `VTID` varchar(20) DEFAULT NULL,
  `MaVatTu` varchar(20) NOT NULL,
  `TenVatTu` varchar(225) DEFAULT NULL,
  `DVT` varchar(50) DEFAULT NULL,
  `MaNhom` varchar(30) DEFAULT NULL,
  `LoaiVT` varchar(100) DEFAULT NULL,
  `DVT2` varchar(50) DEFAULT NULL,
  `DangSuDung` char(1) DEFAULT NULL,
  `SoNgayHetHan` int(11) DEFAULT NULL,
  `SoNgayTruocHan` int(11) DEFAULT NULL,
  `KhoMang` decimal(18,4) DEFAULT NULL,
  `DoDay` decimal(18,4) DEFAULT NULL,
  `CauTrucSP` varchar(100) DEFAULT NULL,
  `DVTSell` varchar(50) DEFAULT NULL,
  `HSCode` varchar(200) DEFAULT NULL,
  `MaVach` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_in_lo_vattu_onhand` */

DROP TABLE IF EXISTS `patsoft_in_lo_vattu_onhand`;

CREATE TABLE `patsoft_in_lo_vattu_onhand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MaKho` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MaVatTu` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SoLo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SoLuongTon` decimal(18,4) DEFAULT 0.0000,
  `SoLo_NCC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MaNSX` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MaNCC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TenKhachHang` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HSD` datetime DEFAULT NULL,
  `NgaySX` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `patsoft_mfg_lsx_thongtinlonhap` */

DROP TABLE IF EXISTS `patsoft_mfg_lsx_thongtinlonhap`;

CREATE TABLE `patsoft_mfg_lsx_thongtinlonhap` (
  `TraceID` decimal(10,0) NOT NULL,
  `LSX` varchar(50) NOT NULL,
  `MaCongDoan` varchar(50) DEFAULT NULL,
  `MaVatTu` varchar(20) DEFAULT NULL,
  `SoLuongMV` decimal(18,4) DEFAULT NULL,
  `SoLuongMD` decimal(18,4) DEFAULT NULL,
  `SoLo` varchar(200) DEFAULT NULL,
  `Barcode` varchar(200) DEFAULT NULL,
  `SoLuongXuat` decimal(18,4) DEFAULT NULL,
  `UserCreate` varchar(20) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `GhiChu` varchar(500) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Gio` varchar(8) DEFAULT NULL,
  `Ca` varchar(10) DEFAULT NULL,
  `Ngay` varchar(50) DEFAULT NULL,
  `SoLuongKg` decimal(18,4) DEFAULT NULL,
  `PhanLoai` varchar(100) DEFAULT NULL,
  `NoteLine` varchar(1000) DEFAULT NULL,
  `STT` int(11) DEFAULT NULL,
  `DVT` varchar(50) DEFAULT NULL,
  `DVTMD` varchar(50) DEFAULT NULL,
  `MaThietBi` varchar(20) DEFAULT NULL,
  `SLMoiNoi` decimal(18,4) DEFAULT NULL,
  `SLGrossKg` decimal(18,4) DEFAULT NULL,
  `SLGD` decimal(18,4) DEFAULT NULL,
  `TuaSo` varchar(4000) DEFAULT NULL,
  `MaThanhPham` varchar(20) DEFAULT NULL,
  `LineID` decimal(18,4) DEFAULT NULL,
  `Rewind` int(11) DEFAULT NULL,
  `SoLuongRewind` decimal(10,0) DEFAULT NULL,
  `Corona` int(11) DEFAULT NULL,
  `MatCorona` varchar(2) DEFAULT NULL,
  `Hardener` int(11) DEFAULT NULL,
  `TenCongDoan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TraceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_mfg_lsx_thongtinlonhap_backup` */

DROP TABLE IF EXISTS `patsoft_mfg_lsx_thongtinlonhap_backup`;

CREATE TABLE `patsoft_mfg_lsx_thongtinlonhap_backup` (
  `TraceID` decimal(10,0) NOT NULL,
  `LSX` varchar(50) NOT NULL,
  `MaCongDoan` varchar(50) DEFAULT NULL,
  `MaVatTu` varchar(20) DEFAULT NULL,
  `SoLuongMV` decimal(18,4) DEFAULT NULL,
  `SoLuongMD` decimal(18,4) DEFAULT NULL,
  `SoLo` varchar(200) DEFAULT NULL,
  `Barcode` varchar(200) DEFAULT NULL,
  `SoLuongXuat` decimal(18,4) DEFAULT NULL,
  `UserCreate` varchar(20) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `GhiChu` varchar(500) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Gio` varchar(8) DEFAULT NULL,
  `Ca` varchar(10) DEFAULT NULL,
  `Ngay` varchar(50) DEFAULT NULL,
  `SoLuongKg` decimal(18,4) DEFAULT NULL,
  `PhanLoai` varchar(100) DEFAULT NULL,
  `NoteLine` varchar(1000) DEFAULT NULL,
  `STT` int(11) DEFAULT NULL,
  `DVT` varchar(50) DEFAULT NULL,
  `DVTMD` varchar(50) DEFAULT NULL,
  `MaThietBi` varchar(20) DEFAULT NULL,
  `SLMoiNoi` decimal(18,4) DEFAULT NULL,
  `SLGrossKg` decimal(18,4) DEFAULT NULL,
  `SLGD` decimal(18,4) DEFAULT NULL,
  `TuaSo` varchar(4000) DEFAULT NULL,
  `MaThanhPham` varchar(20) DEFAULT NULL,
  `LineID` decimal(18,4) DEFAULT NULL,
  `Rewind` int(11) DEFAULT NULL,
  `SoLuongRewind` decimal(10,0) DEFAULT NULL,
  `Corona` int(11) DEFAULT NULL,
  `MatCorona` varchar(2) DEFAULT NULL,
  `Hardener` int(11) DEFAULT NULL,
  `TenCongDoan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TraceID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_mfg_lsx_thongtinthanhpham` */

DROP TABLE IF EXISTS `patsoft_mfg_lsx_thongtinthanhpham`;

CREATE TABLE `patsoft_mfg_lsx_thongtinthanhpham` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `LSX` varchar(50) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=699 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_mfg_lxs` */

DROP TABLE IF EXISTS `patsoft_mfg_lxs`;

CREATE TABLE `patsoft_mfg_lxs` (
  `LSX` varchar(50) NOT NULL,
  `LSX_Father` varchar(50) DEFAULT NULL,
  `MaVatTu` varchar(50) DEFAULT NULL,
  `MaBoPhan` varchar(50) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `NgayBatDau` datetime DEFAULT NULL,
  `NgayKetThuc` datetime DEFAULT NULL,
  `SoLuong` decimal(10,0) DEFAULT NULL,
  `TinhTrang` char(1) DEFAULT NULL,
  `DienGiai` varchar(150) DEFAULT NULL,
  `SoSO` varchar(20) DEFAULT NULL,
  `DungSai` decimal(10,0) DEFAULT NULL,
  `UserCreate` varchar(20) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `MaCa` varchar(20) DEFAULT NULL,
  `Type` char(1) DEFAULT NULL,
  `GhiChu` varchar(50) DEFAULT NULL,
  `NgayGiao` datetime DEFAULT NULL,
  `SoQCSP` varchar(20) DEFAULT NULL,
  `LSXTuiThamChieu` varchar(20) DEFAULT NULL,
  `DungSaiDuoi` decimal(18,4) DEFAULT NULL,
  `NgayDatHang` varchar(50) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `NgayDong` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `HeSo` decimal(18,6) DEFAULT NULL,
  `SOSO_THAMCHIEU` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `LSX_THAMCHIEU` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAVT_THAMCHIEU` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoLuongM2` decimal(18,2) DEFAULT NULL,
  `GhiChuItemSO` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DVTGD` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `LSXThamChieu` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `BPTinhPhi` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `GhiChuBOM` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LSX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_mfg_lxs_20230324` */

DROP TABLE IF EXISTS `patsoft_mfg_lxs_20230324`;

CREATE TABLE `patsoft_mfg_lxs_20230324` (
  `LSX` varchar(50) NOT NULL,
  `LSX_Father` varchar(50) DEFAULT NULL,
  `MaVatTu` varchar(50) DEFAULT NULL,
  `MaBoPhan` varchar(50) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `NgayBatDau` datetime DEFAULT NULL,
  `NgayKetThuc` datetime DEFAULT NULL,
  `SoLuong` decimal(10,0) DEFAULT NULL,
  `TinhTrang` char(1) DEFAULT NULL,
  `DienGiai` varchar(150) DEFAULT NULL,
  `SoSO` varchar(20) DEFAULT NULL,
  `DungSai` decimal(10,0) DEFAULT NULL,
  `UserCreate` varchar(20) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `MaCa` varchar(20) DEFAULT NULL,
  `Type` char(1) DEFAULT NULL,
  `GhiChu` varchar(50) DEFAULT NULL,
  `NgayGiao` datetime DEFAULT NULL,
  `SoQCSP` varchar(20) DEFAULT NULL,
  `LSXTuiThamChieu` varchar(20) DEFAULT NULL,
  `DungSaiDuoi` decimal(18,4) DEFAULT NULL,
  `NgayDatHang` varchar(50) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `NgayDong` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `HeSo` decimal(18,6) DEFAULT NULL,
  `SOSO_THAMCHIEU` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `LSX_THAMCHIEU` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAVT_THAMCHIEU` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoLuongM2` decimal(18,2) DEFAULT NULL,
  `GhiChuItemSO` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DVTGD` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `LSXThamChieu` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `BPTinhPhi` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `GhiChuBOM` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LSX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_mfg_move_congdoan` */

DROP TABLE IF EXISTS `patsoft_mfg_move_congdoan`;

CREATE TABLE `patsoft_mfg_move_congdoan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26530 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_mfg_moveorder` */

DROP TABLE IF EXISTS `patsoft_mfg_moveorder`;

CREATE TABLE `patsoft_mfg_moveorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `MaXuong` varchar(20) DEFAULT NULL,
  `SoChungTu` varchar(20) DEFAULT NULL,
  `Ngay` datetime DEFAULT NULL,
  `GhiChu` varchar(1000) DEFAULT NULL,
  `STT` int(11) DEFAULT NULL,
  `MaVatTu` varchar(20) DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=48524 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_om` */

DROP TABLE IF EXISTS `patsoft_om`;

CREATE TABLE `patsoft_om` (
  `SoOM` varchar(255) DEFAULT NULL,
  `SoOM_Cha` varchar(255) DEFAULT NULL,
  `LoaiCT` varchar(255) DEFAULT NULL,
  `Ngay` datetime DEFAULT NULL,
  `SoHopDong` varchar(255) DEFAULT NULL,
  `NgayHopDong` varchar(255) DEFAULT NULL,
  `DienGiaiChung` varchar(200) DEFAULT NULL,
  `LoaiTien` varchar(3) DEFAULT NULL,
  `TyGia` decimal(10,0) DEFAULT NULL,
  `LoaiOM` varchar(10) DEFAULT NULL,
  `TinhTrang` varchar(2) DEFAULT NULL,
  `MaKH` varchar(20) DEFAULT NULL,
  `STT` int(11) DEFAULT NULL,
  `MaVT` varchar(20) DEFAULT NULL,
  `SoLuong` double DEFAULT NULL,
  `DVT` varchar(10) DEFAULT NULL,
  `DonGia` decimal(10,0) DEFAULT NULL,
  `ThanhTien` decimal(10,0) DEFAULT NULL,
  `MaKho` varchar(20) DEFAULT NULL,
  `NgayCan` varchar(50) DEFAULT NULL,
  `NgayHua` varchar(50) DEFAULT NULL,
  `UserID` varchar(20) DEFAULT NULL,
  `ThueSuat` int(11) DEFAULT NULL,
  `CoDinhGia` char(1) DEFAULT NULL,
  `MaDonVi` varchar(20) DEFAULT NULL,
  `YeuCauKH` char(1) DEFAULT NULL,
  `MoTaYCKH` varchar(200) DEFAULT NULL,
  `DungSai` decimal(10,0) DEFAULT NULL,
  `GiaoTaiKH` char(1) DEFAULT NULL,
  `BangGia` varchar(20) DEFAULT NULL,
  `DieuKienGiaoHang` varchar(200) DEFAULT NULL,
  `NgayGiao` datetime DEFAULT NULL,
  `NgayXacNhanGiao` datetime DEFAULT NULL,
  `SoFC` varchar(50) DEFAULT NULL,
  `SoLuongDH` decimal(10,0) DEFAULT NULL,
  `DungSaiDuoi` decimal(10,0) DEFAULT NULL,
  `GhiChu` varchar(200) DEFAULT NULL,
  `DVTKH` varchar(20) DEFAULT NULL,
  `SoLuongKH` decimal(10,0) DEFAULT NULL,
  `SoPOKH` varchar(50) DEFAULT NULL,
  `MaThietBi` varchar(20) DEFAULT NULL,
  `VersionTP` int(11) DEFAULT NULL,
  `NgaySX` varchar(50) DEFAULT NULL,
  `NgayHT` varchar(50) DEFAULT NULL,
  `DonGiaKH` decimal(10,0) DEFAULT NULL,
  `MaNVSale` varchar(20) DEFAULT NULL,
  `ID_NgayDuKien` int(11) DEFAULT NULL,
  `TinhTrangLine` varchar(10) DEFAULT NULL,
  `SoLuongM2` decimal(10,0) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `ChanCuon` varchar(1) DEFAULT NULL,
  `TransitTime` decimal(10,0) DEFAULT NULL,
  `PhanLoaiDonHang` varchar(50) DEFAULT NULL,
  `NgayKHSXXacNhan` varchar(50) DEFAULT NULL,
  `SOThamChieu` varchar(20) DEFAULT NULL,
  `SoQCSP_OM` varchar(20) DEFAULT NULL,
  `UserUpdated` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_om_20221020` */

DROP TABLE IF EXISTS `patsoft_om_20221020`;

CREATE TABLE `patsoft_om_20221020` (
  `SoOM` varchar(20) NOT NULL,
  `SoOM_Cha` varchar(20) DEFAULT NULL,
  `LoaiCT` varchar(10) DEFAULT NULL,
  `Ngay` datetime DEFAULT NULL,
  `SoHopDong` varchar(20) DEFAULT NULL,
  `NgayHopDong` varchar(50) DEFAULT NULL,
  `DienGiaiChung` varchar(200) DEFAULT NULL,
  `LoaiTien` varchar(3) DEFAULT NULL,
  `TyGia` decimal(10,0) DEFAULT NULL,
  `LoaiOM` varchar(10) DEFAULT NULL,
  `TinhTrang` varchar(2) DEFAULT NULL,
  `MaKH` varchar(20) DEFAULT NULL,
  `STT` int(11) DEFAULT NULL,
  `MaVT` varchar(20) DEFAULT NULL,
  `SoLuong` double DEFAULT NULL,
  `DVT` varchar(10) DEFAULT NULL,
  `DonGia` decimal(10,0) DEFAULT NULL,
  `ThanhTien` decimal(10,0) DEFAULT NULL,
  `MaKho` varchar(20) DEFAULT NULL,
  `NgayCan` varchar(50) DEFAULT NULL,
  `NgayHua` varchar(50) DEFAULT NULL,
  `UserID` varchar(20) DEFAULT NULL,
  `ThueSuat` int(11) DEFAULT NULL,
  `CoDinhGia` char(1) DEFAULT NULL,
  `MaDonVi` varchar(20) DEFAULT NULL,
  `YeuCauKH` char(1) DEFAULT NULL,
  `MoTaYCKH` varchar(200) DEFAULT NULL,
  `DungSai` decimal(10,0) DEFAULT NULL,
  `GiaoTaiKH` char(1) DEFAULT NULL,
  `BangGia` varchar(20) DEFAULT NULL,
  `DieuKienGiaoHang` varchar(200) DEFAULT NULL,
  `NgayGiao` datetime DEFAULT NULL,
  `NgayXacNhanGiao` datetime DEFAULT NULL,
  `SoFC` varchar(50) DEFAULT NULL,
  `SoLuongDH` decimal(10,0) DEFAULT NULL,
  `DungSaiDuoi` decimal(10,0) DEFAULT NULL,
  `GhiChu` varchar(200) DEFAULT NULL,
  `DVTKH` varchar(20) DEFAULT NULL,
  `SoLuongKH` decimal(10,0) DEFAULT NULL,
  `SoPOKH` varchar(50) DEFAULT NULL,
  `MaThietBi` varchar(20) DEFAULT NULL,
  `VersionTP` int(11) DEFAULT NULL,
  `NgaySX` varchar(50) DEFAULT NULL,
  `NgayHT` varchar(50) DEFAULT NULL,
  `DonGiaKH` decimal(10,0) DEFAULT NULL,
  `MaNVSale` varchar(20) DEFAULT NULL,
  `ID_NgayDuKien` int(11) DEFAULT NULL,
  `TinhTrangLine` varchar(10) DEFAULT NULL,
  `SoLuongM2` decimal(10,0) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `ChanCuon` varchar(1) DEFAULT NULL,
  `TransitTime` decimal(10,0) DEFAULT NULL,
  `PhanLoaiDonHang` varchar(50) DEFAULT NULL,
  `NgayKHSXXacNhan` varchar(50) DEFAULT NULL,
  `SOThamChieu` varchar(20) DEFAULT NULL,
  `SoQCSP_OM` varchar(20) DEFAULT NULL,
  `UserUpdated` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_om_quycachsanpham_h` */

DROP TABLE IF EXISTS `patsoft_om_quycachsanpham_h`;

CREATE TABLE `patsoft_om_quycachsanpham_h` (
  `SoQCSP` varchar(20) NOT NULL,
  `Ngay` datetime DEFAULT NULL,
  `MaTP` varchar(10) DEFAULT NULL,
  `MaKH` varchar(20) DEFAULT NULL,
  `VersionTP` int(11) DEFAULT NULL,
  `SoThamChieu` varchar(20) DEFAULT NULL,
  `CauTrucSP` varchar(250) DEFAULT NULL,
  `SoMau` int(11) DEFAULT NULL,
  `GhiChuSoMau` varchar(250) DEFAULT NULL,
  `GiaoTui` char(1) DEFAULT NULL,
  `GiaoCuon` char(1) DEFAULT NULL,
  `KhoMangSX` decimal(18,4) DEFAULT NULL,
  `BuocDaiTrucIn` decimal(18,4) DEFAULT NULL,
  `BuocDaiTP` decimal(18,4) DEFAULT NULL,
  `DienGiai` varchar(250) DEFAULT NULL,
  `HeSoQuyDoi` decimal(18,6) DEFAULT NULL,
  `InTrong` char(1) DEFAULT NULL,
  `InNgoai` char(1) DEFAULT NULL,
  `InVatLieu` varchar(250) DEFAULT NULL,
  `InKhoMang` decimal(18,4) DEFAULT NULL,
  `InDungMoi` varchar(250) DEFAULT NULL,
  `InDungSai` decimal(18,4) DEFAULT NULL,
  `InDoDayMangIn` decimal(18,4) DEFAULT NULL,
  `InMucIn` varchar(250) DEFAULT NULL,
  `InMauSac` varchar(250) DEFAULT NULL,
  `InKhuon` varchar(250) DEFAULT NULL,
  `InChatDongRan` varchar(250) DEFAULT NULL,
  `TrangDun` char(1) DEFAULT NULL,
  `TrangKho` char(1) DEFAULT NULL,
  `TrCoDungMoi` char(1) DEFAULT NULL,
  `TrKhongDungMoi` char(1) DEFAULT NULL,
  `TrMangGhepKho` varchar(250) DEFAULT NULL,
  `TrangTrong` char(1) DEFAULT NULL,
  `TrangBa` char(1) DEFAULT NULL,
  `TrangAL` char(1) DEFAULT NULL,
  `TrMatLangNgoai` char(1) DEFAULT NULL,
  `TrMatMoNgoai` char(1) DEFAULT NULL,
  `TrMo` char(1) DEFAULT NULL,
  `TrLang` char(1) DEFAULT NULL,
  `TrLogo1` char(1) DEFAULT NULL,
  `TrMo2` char(1) DEFAULT NULL,
  `TrLang2` char(1) DEFAULT NULL,
  `TrLogo2` char(1) DEFAULT NULL,
  `TrGhepMang` char(1) DEFAULT NULL,
  `TrVatLieuGhepMang` varchar(250) DEFAULT NULL,
  `TrDoDay` decimal(18,4) DEFAULT NULL,
  `TrLLDPEHat` varchar(500) DEFAULT NULL,
  `TrDoDayLDPE` decimal(18,4) DEFAULT NULL,
  `TrNuCrel` varchar(500) DEFAULT NULL,
  `TrPP` decimal(18,4) DEFAULT NULL,
  `TrTongDoDay` decimal(18,4) DEFAULT NULL,
  `TrTyTongDoDay` decimal(18,4) DEFAULT NULL,
  `TrDungSai` decimal(18,4) DEFAULT NULL,
  `TrDungSaiBD` decimal(18,4) DEFAULT NULL,
  `TrKeoKy1` varchar(250) DEFAULT NULL,
  `TrKeoKy2` varchar(250) DEFAULT NULL,
  `TrKeoKy3` varchar(250) DEFAULT NULL,
  `CuKhoCat` decimal(18,4) DEFAULT NULL,
  `CuKhoCat2` decimal(18,4) DEFAULT NULL,
  `CuChieuDaiCuon` decimal(18,4) DEFAULT NULL,
  `CuDungSaiCD1Cuon` decimal(18,4) DEFAULT NULL,
  `CuBaoGoi` varchar(250) DEFAULT NULL,
  `CuDungSai` decimal(18,4) DEFAULT NULL,
  `CuChuThuan` char(1) DEFAULT NULL,
  `CuChuNghich` char(1) DEFAULT NULL,
  `CuMatThanTrai` char(1) DEFAULT NULL,
  `CuMatThanPhai` char(1) DEFAULT NULL,
  `CuMatThan2ben` char(1) DEFAULT NULL,
  `CuKhongMatThan` char(1) DEFAULT NULL,
  `CuOngLoi` decimal(18,4) DEFAULT NULL,
  `CuThungCarton` varchar(250) DEFAULT NULL,
  `CuQCChatPallet` varchar(250) DEFAULT NULL,
  `CuSoSpec` varchar(250) DEFAULT NULL,
  `TuKichThuoc` varchar(10) DEFAULT NULL,
  `TuRong` decimal(18,4) DEFAULT NULL,
  `TuCao` decimal(18,4) DEFAULT NULL,
  `TuXepHongSau` decimal(18,4) DEFAULT NULL,
  `TuDungSai` decimal(18,4) DEFAULT NULL,
  `TuHanLung` char(1) DEFAULT NULL,
  `TuDuongHan` decimal(18,4) DEFAULT NULL,
  `TuTuiDung` char(1) DEFAULT NULL,
  `TuKieu` varchar(250) DEFAULT NULL,
  `TuDucLo` varchar(250) DEFAULT NULL,
  `TuHan2bien` varchar(50) DEFAULT NULL,
  `TuDuongHan2bien` decimal(18,4) DEFAULT NULL,
  `TuHanDau` decimal(18,4) DEFAULT NULL,
  `TuHanDay` decimal(18,4) DEFAULT NULL,
  `TuCatMepTrai` char(1) DEFAULT NULL,
  `TuCatMepPhai` char(1) DEFAULT NULL,
  `TuCatMepTren` char(1) DEFAULT NULL,
  `TuCatMepDuoi` char(1) DEFAULT NULL,
  `TuGapMiengTren` decimal(18,4) DEFAULT NULL,
  `TuGapMiengDuoi` decimal(18,4) DEFAULT NULL,
  `TuSoleMieng` decimal(18,4) DEFAULT NULL,
  `TuDayKeo` varchar(250) DEFAULT NULL,
  `TuDongGoi` varchar(250) DEFAULT NULL,
  `TuDaySau` decimal(18,4) DEFAULT NULL,
  `TuXepDayNap` char(1) DEFAULT NULL,
  `TuDanBangKeo` char(1) DEFAULT NULL,
  `TuXepDaySau` decimal(18,4) DEFAULT NULL,
  `TuXepHongCao` decimal(18,4) DEFAULT NULL,
  `TuLoThong` decimal(18,4) DEFAULT NULL,
  `TuDangVoi` char(1) DEFAULT NULL,
  `TuGanNut` char(1) DEFAULT NULL,
  `TuLoaiTui` varchar(250) DEFAULT NULL,
  `TuSoJane` varchar(250) DEFAULT NULL,
  `TuSoSpec` varchar(250) DEFAULT NULL,
  `VersionQCSP` int(11) DEFAULT NULL,
  `ChieuXaIn` char(1) DEFAULT NULL,
  `ChieuXaTrang` char(1) DEFAULT NULL,
  `ChieuXacuon` char(1) DEFAULT NULL,
  `ChieuXaTui` char(1) DEFAULT NULL,
  `SoConCao` int(11) DEFAULT NULL,
  `SoConNgang` int(11) DEFAULT NULL,
  `InDSKT` varchar(10) DEFAULT NULL,
  `TrDSKT` varchar(10) DEFAULT NULL,
  `TrDSTDD` varchar(10) DEFAULT NULL,
  `TrDSBD` varchar(10) DEFAULT NULL,
  `CuDSCDC` varchar(10) DEFAULT NULL,
  `CuDS` varchar(10) DEFAULT NULL,
  `TuDS` varchar(10) DEFAULT NULL,
  `TrMangGhepKhoK2` varchar(250) DEFAULT NULL,
  `TrMangGhepKhoK3` varchar(250) DEFAULT NULL,
  `TrangMPET` char(1) DEFAULT NULL,
  `TrCongThucThoi` varchar(250) DEFAULT NULL,
  `KhoCat2` decimal(18,4) DEFAULT NULL,
  `InMauSac2` varchar(250) DEFAULT NULL,
  `SoDMPH` varchar(50) DEFAULT NULL,
  `Active` char(1) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `UserID` varchar(50) DEFAULT NULL,
  `TuiSoLe` char(1) DEFAULT NULL,
  `TuiSoLeMatTruoc` decimal(18,4) DEFAULT NULL,
  `TuiSoLeMatSau` decimal(18,4) DEFAULT NULL,
  `CongThucTui` varchar(20) DEFAULT NULL,
  `TuiPEHD` char(1) DEFAULT NULL,
  `KhoCat3` decimal(18,4) DEFAULT NULL,
  `ChieuXaRewind` char(1) DEFAULT NULL,
  `BoGocTui` char(1) DEFAULT NULL,
  `TuHDBaoGoi` varchar(250) DEFAULT NULL,
  `TuQCPallet` varchar(250) DEFAULT NULL,
  `TrDoDay2` decimal(18,4) DEFAULT NULL,
  `TrDoDay3` decimal(18,4) DEFAULT NULL,
  `TrDoDayLDPE2` decimal(18,4) DEFAULT NULL,
  `CuDSChieuDai` varchar(10) DEFAULT NULL,
  `CuHDMoiNoi` varchar(250) DEFAULT NULL,
  `LoaiQuyCach` varchar(50) DEFAULT NULL,
  `InCurringTime` varchar(50) DEFAULT NULL,
  `TrCurringTime` varchar(50) DEFAULT NULL,
  `CuCurringTime` varchar(50) DEFAULT NULL,
  `TuCurringTime` varchar(50) DEFAULT NULL,
  `InDungSaiBD` varchar(50) DEFAULT NULL,
  `InDSBD` varchar(10) DEFAULT NULL,
  `TuDSDuongHan` varchar(250) DEFAULT NULL,
  `TuNoteCatMep` varchar(500) DEFAULT NULL,
  `TuNoteXepHong` varchar(500) DEFAULT NULL,
  `CuSoCuonThung` varchar(500) DEFAULT NULL COMMENT 'chuyen decimal to varchar',
  `TrKy` char(1) DEFAULT NULL,
  `TrKy2` char(1) DEFAULT NULL,
  `TrBanMo` char(1) DEFAULT NULL,
  `PhanLoai` varchar(50) DEFAULT NULL,
  `UserUpdated` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SoQCSP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `patsoft_om_quycachsp_l1` */

DROP TABLE IF EXISTS `patsoft_om_quycachsp_l1`;

CREATE TABLE `patsoft_om_quycachsp_l1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `STT` int(11) DEFAULT NULL,
  `MaTruc` varchar(50) DEFAULT NULL,
  `TenTruc` varchar(250) DEFAULT NULL,
  `ViTriTruc` varchar(50) DEFAULT NULL,
  `GhiChu` varchar(250) DEFAULT NULL,
  `SoQCSP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32573 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Table structure for table `patsoft_om_quycachsp_l2` */

DROP TABLE IF EXISTS `patsoft_om_quycachsp_l2`;

CREATE TABLE `patsoft_om_quycachsp_l2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `STT` int(2) DEFAULT NULL,
  `GhiChu` text DEFAULT NULL,
  `SoQCSP` text DEFAULT NULL,
  `Tab` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70536 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Table structure for table `patsoft_om_quycachsp_thoicolumn` */

DROP TABLE IF EXISTS `patsoft_om_quycachsp_thoicolumn`;

CREATE TABLE `patsoft_om_quycachsp_thoicolumn` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `SoQCSP` text DEFAULT NULL,
  `CodeThoi` varchar(50) DEFAULT NULL,
  `ValueThoi` text DEFAULT NULL,
  `DienGiai` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6310 DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Table structure for table `sourcemessage` */

DROP TABLE IF EXISTS `sourcemessage`;

CREATE TABLE `sourcemessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) DEFAULT NULL,
  `message` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ddl_cate` */

DROP TABLE IF EXISTS `tbl_ddl_cate`;

CREATE TABLE `tbl_ddl_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drop_down_list_cate` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `tbl_material` */

DROP TABLE IF EXISTS `tbl_material`;

CREATE TABLE `tbl_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_type` int(11) NOT NULL DEFAULT 0,
  `material_trace_id` bigint(20) DEFAULT NULL,
  `material_code` varchar(50) DEFAULT NULL,
  `material_name` varchar(200) DEFAULT NULL,
  `material_specification` varchar(200) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `length` float DEFAULT NULL,
  `gross_weight` float DEFAULT NULL,
  `net_weight` float DEFAULT NULL,
  `lot_ncc` varchar(50) DEFAULT NULL,
  `product_number` varchar(50) DEFAULT NULL,
  `acc_lot` varchar(50) DEFAULT NULL,
  `suplier_name` varchar(500) DEFAULT NULL,
  `suplier_product_code` varchar(100) DEFAULT NULL,
  `is_printed` int(11) DEFAULT 0,
  `last_printed_date` timestamp NULL DEFAULT NULL,
  `last_printed_by` int(11) DEFAULT NULL,
  `produce_date` datetime DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `is_deleted_date` timestamp NULL DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0,
  `is_deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27626 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_material_gen_traceid` */

DROP TABLE IF EXISTS `tbl_material_gen_traceid`;

CREATE TABLE `tbl_material_gen_traceid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL,
  `year_no` int(4) DEFAULT NULL,
  `month_no` int(2) DEFAULT NULL,
  `current_no` bigint(20) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ps_documents` */

DROP TABLE IF EXISTS `tbl_ps_documents`;

CREATE TABLE `tbl_ps_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documents_key` varchar(200) DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `role_short_name` varchar(500) DEFAULT NULL,
  `user_id` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_ps_report` */

DROP TABLE IF EXISTS `tbl_ps_report`;

CREATE TABLE `tbl_ps_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `store_name` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sql_name` text NOT NULL,
  `format_column` text DEFAULT NULL,
  `template_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_type` int(1) DEFAULT 1,
  `role_short_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_purchase_form` */

DROP TABLE IF EXISTS `tbl_request_approval_purchase_form`;

CREATE TABLE `tbl_request_approval_purchase_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `purpose` varchar(500) DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_approval_id` int(11) DEFAULT NULL,
  `pr_code` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_purchase_invited` */

DROP TABLE IF EXISTS `tbl_request_approval_purchase_invited`;

CREATE TABLE `tbl_request_approval_purchase_invited` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `request_approval_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_request_approval_purchase_notes` */

DROP TABLE IF EXISTS `tbl_request_approval_purchase_notes`;

CREATE TABLE `tbl_request_approval_purchase_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `request_approval_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Table structure for table `tbl_visible_columns` */

DROP TABLE IF EXISTS `tbl_visible_columns`;

CREATE TABLE `tbl_visible_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grid_key` varchar(50) DEFAULT NULL,
  `column_hide` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Table structure for table `patsoft_view_qcsp_blow` */

DROP TABLE IF EXISTS `patsoft_view_qcsp_blow`;

/*!50001 DROP VIEW IF EXISTS `patsoft_view_qcsp_blow` */;
/*!50001 DROP TABLE IF EXISTS `patsoft_view_qcsp_blow` */;

/*!50001 CREATE TABLE  `patsoft_view_qcsp_blow`(
 `LSX` varchar(50) ,
 `KhoMangSX` decimal(18,4) ,
 `KhoCat2` decimal(18,4) ,
 `KhoCat3` decimal(18,4) ,
 `CauTrucSP` varchar(250) ,
 `CuChieuDaiCuon` decimal(18,4) ,
 `CuKhoCat` decimal(18,4) ,
 `CuKhoCat2` decimal(18,4) ,
 `TenVatTu` varchar(225) ,
 `DVT` varchar(50) ,
 `DVT2` varchar(50) ,
 `TenDoiTuong` varchar(100) ,
 `TenKhachHang` varchar(500) ,
 `MaSoKH` varchar(20) 
)*/;

/*Table structure for table `patsoft_view_prod_schedule` */

DROP TABLE IF EXISTS `patsoft_view_prod_schedule`;

/*!50001 DROP VIEW IF EXISTS `patsoft_view_prod_schedule` */;
/*!50001 DROP TABLE IF EXISTS `patsoft_view_prod_schedule` */;

/*!50001 CREATE TABLE  `patsoft_view_prod_schedule`(
 `LSX` varchar(50) ,
 `LSX_Father` varchar(50) ,
 `MaVatTu` varchar(50) ,
 `MaBoPhan` varchar(50) ,
 `Version` int(11) ,
 `NgayBatDau` datetime ,
 `NgayKetThuc` datetime ,
 `SoLuong` decimal(10,0) ,
 `TinhTrang` char(1) ,
 `DienGiai` varchar(150) ,
 `SoSO` varchar(20) ,
 `DungSai` decimal(10,0) ,
 `UserCreate` varchar(20) ,
 `DateCreate` datetime ,
 `MaCa` varchar(20) ,
 `Type` char(1) ,
 `GhiChu` varchar(50) ,
 `NgayGiao` datetime ,
 `SoQCSP` varchar(20) ,
 `LSXTuiThamChieu` varchar(20) ,
 `DungSaiDuoi` decimal(18,4) ,
 `NgayDatHang` varchar(50) ,
 `ModifyDate` datetime ,
 `NgayDong` varchar(10) ,
 `HeSo` decimal(18,6) ,
 `SOSO_THAMCHIEU` varchar(20) ,
 `LSX_THAMCHIEU` varchar(200) ,
 `MAVT_THAMCHIEU` varchar(20) ,
 `SoLuongM2` decimal(18,2) ,
 `GhiChuItemSO` varchar(50) ,
 `DVTGD` varchar(50) ,
 `LSXThamChieu` varchar(50) ,
 `BPTinhPhi` varchar(50) ,
 `GhiChuBOM` varchar(4000) ,
 `SoConNgang` int(11) ,
 `KhoMangSX` decimal(18,4) ,
 `KhoCat2` decimal(18,4) ,
 `KhoCat3` decimal(18,4) ,
 `CauTrucSP` varchar(250) ,
 `TrDoDay` decimal(18,4) ,
 `TrDoDayLDPE` decimal(18,4) ,
 `TrTongDoDay` decimal(18,4) ,
 `TrTyTongDoDay` decimal(18,4) ,
 `CuChieuDaiCuon` decimal(18,4) ,
 `CuKhoCat` decimal(18,4) ,
 `CuKhoCat2` decimal(18,4) ,
 `SoMau` int(11) ,
 `TuKichThuoc` varchar(10) ,
 `Active` char(1) ,
 `TrDSTDD` varchar(10) ,
 `TenVatTu` varchar(225) ,
 `DVT` varchar(50) ,
 `DVT2` varchar(50) ,
 `TenDoiTuong` varchar(100) ,
 `TenKhachHang` varchar(500) ,
 `MaSoKH` varchar(20) ,
 `TuRong` decimal(18,4) ,
 `TuCao` decimal(18,4) ,
 `TuDaySau` decimal(18,4) ,
 `TuSoJane` varchar(250) ,
 `TenDoiTuongTui` varchar(100) ,
 `TuDangVoi` char(1) ,
 `TuGanNut` char(1) ,
 `TuLoaiTui` varchar(250) ,
 `TuDongGoi` varchar(250) ,
 `TuQCPallet` varchar(250) ,
 `TuDuongHan2bien` decimal(18,4) ,
 `TuHanDau` decimal(18,4) ,
 `TuHanDay` decimal(18,4) ,
 `TrangKho` char(1) ,
 `TrDSKT` varchar(10) ,
 `TrDSBD` varchar(10) ,
 `TrangMPET` char(1) ,
 `TrCoDungMoi` char(1) ,
 `TrKeoKy1` varchar(250) ,
 `TrKeoKy2` varchar(250) ,
 `TrKeoKy3` varchar(250) ,
 `TrMangGhepKho` varchar(250) ,
 `TrMangGhepKhoK2` varchar(250) ,
 `TrMangGhepKhoK3` varchar(250) ,
 `TrDungSai` decimal(18,4) ,
 `TrDungSaiBD` decimal(18,4) ,
 `TuXepHongCao` decimal(18,4) ,
 `TuXepDaySau` decimal(18,4) ,
 `TuXepHongSau` decimal(18,4) ,
 `InChatDongRan` varchar(250) ,
 `TrangTrong` char(1) ,
 `TrangBa` char(1) ,
 `TrangAL` char(1) ,
 `TrangDun` char(1) ,
 `DVTSell` varchar(50) ,
 `InVatLieu` varchar(250) ,
 `InDoDayMangIn` decimal(18,4) ,
 `BuocDaiTP` decimal(18,4) ,
 `HSCode` varchar(200) ,
 `MaVach` varchar(200) ,
 `SoPOKH` varchar(50) ,
 `SOThamChieu` varchar(255) 
)*/;

/*View structure for view patsoft_view_qcsp_blow */

/*!50001 DROP TABLE IF EXISTS `patsoft_view_qcsp_blow` */;
/*!50001 DROP VIEW IF EXISTS `patsoft_view_qcsp_blow` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patsoft_view_qcsp_blow` AS (select `thanhpham`.`LSX` AS `LSX`,`qcsp`.`KhoMangSX` AS `KhoMangSX`,`qcsp`.`KhoCat2` AS `KhoCat2`,`qcsp`.`KhoCat3` AS `KhoCat3`,`qcsp`.`CauTrucSP` AS `CauTrucSP`,`qcsp`.`CuChieuDaiCuon` AS `CuChieuDaiCuon`,`qcsp`.`CuKhoCat` AS `CuKhoCat`,`qcsp`.`CuKhoCat2` AS `CuKhoCat2`,`vattu`.`TenVatTu` AS `TenVatTu`,`vattu`.`DVT` AS `DVT`,`vattu`.`DVT2` AS `DVT2`,`look`.`TenDoiTuong` AS `TenDoiTuong`,`kh`.`TenKhachHang` AS `TenKhachHang`,`kh`.`MaSoKH` AS `MaSoKH` from ((((`patsoft_mfg_lsx_thongtinthanhpham` `thanhpham` left join `patsoft_dm_vattu` `vattu` on(`thanhpham`.`MaVatTu` = `vattu`.`MaVatTu`)) left join `patsoft_om_quycachsanpham_h` `qcsp` on(`vattu`.`MaVatTu` = `qcsp`.`MaTP` and `vattu`.`CauTrucSP` = `qcsp`.`CauTrucSP`)) left join `patsoft_dm_khachhang` `kh` on(`qcsp`.`MaKH` = `kh`.`MaSoKH`)) left join `patsoft_dm_lookup` `look` on(`look`.`MaDoiTuong` = `qcsp`.`CauTrucSP` and `look`.`MaLook` = 'DM_CAUTRUCSP'))) */;

/*View structure for view patsoft_view_prod_schedule */

/*!50001 DROP TABLE IF EXISTS `patsoft_view_prod_schedule` */;
/*!50001 DROP VIEW IF EXISTS `patsoft_view_prod_schedule` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patsoft_view_prod_schedule` AS (select `lxs`.`LSX` AS `LSX`,`lxs`.`LSX_Father` AS `LSX_Father`,trim(`lxs`.`MaVatTu`) AS `MaVatTu`,`lxs`.`MaBoPhan` AS `MaBoPhan`,`lxs`.`Version` AS `Version`,`lxs`.`NgayBatDau` AS `NgayBatDau`,`lxs`.`NgayKetThuc` AS `NgayKetThuc`,`lxs`.`SoLuong` AS `SoLuong`,`lxs`.`TinhTrang` AS `TinhTrang`,`lxs`.`DienGiai` AS `DienGiai`,`lxs`.`SoSO` AS `SoSO`,`lxs`.`DungSai` AS `DungSai`,`lxs`.`UserCreate` AS `UserCreate`,`lxs`.`DateCreate` AS `DateCreate`,`lxs`.`MaCa` AS `MaCa`,`lxs`.`Type` AS `Type`,`lxs`.`GhiChu` AS `GhiChu`,`lxs`.`NgayGiao` AS `NgayGiao`,`lxs`.`SoQCSP` AS `SoQCSP`,`lxs`.`LSXTuiThamChieu` AS `LSXTuiThamChieu`,`lxs`.`DungSaiDuoi` AS `DungSaiDuoi`,`lxs`.`NgayDatHang` AS `NgayDatHang`,`lxs`.`ModifyDate` AS `ModifyDate`,`lxs`.`NgayDong` AS `NgayDong`,`lxs`.`HeSo` AS `HeSo`,`lxs`.`SOSO_THAMCHIEU` AS `SOSO_THAMCHIEU`,`lxs`.`LSX_THAMCHIEU` AS `LSX_THAMCHIEU`,`lxs`.`MAVT_THAMCHIEU` AS `MAVT_THAMCHIEU`,`lxs`.`SoLuongM2` AS `SoLuongM2`,`lxs`.`GhiChuItemSO` AS `GhiChuItemSO`,`lxs`.`DVTGD` AS `DVTGD`,`lxs`.`LSXThamChieu` AS `LSXThamChieu`,`lxs`.`BPTinhPhi` AS `BPTinhPhi`,`lxs`.`GhiChuBOM` AS `GhiChuBOM`,`qcsp`.`SoConNgang` AS `SoConNgang`,`qcsp`.`KhoMangSX` AS `KhoMangSX`,`qcsp`.`KhoCat2` AS `KhoCat2`,`qcsp`.`KhoCat3` AS `KhoCat3`,`qcsp`.`CauTrucSP` AS `CauTrucSP`,`qcsp`.`TrDoDay` AS `TrDoDay`,`qcsp`.`TrDoDayLDPE` AS `TrDoDayLDPE`,`qcsp`.`TrTongDoDay` AS `TrTongDoDay`,`qcsp`.`TrTyTongDoDay` AS `TrTyTongDoDay`,`qcsp`.`CuChieuDaiCuon` AS `CuChieuDaiCuon`,`qcsp`.`CuKhoCat` AS `CuKhoCat`,`qcsp`.`CuKhoCat2` AS `CuKhoCat2`,`qcsp`.`SoMau` AS `SoMau`,`qcsp`.`TuKichThuoc` AS `TuKichThuoc`,`qcsp`.`Active` AS `Active`,`qcsp`.`TrDSTDD` AS `TrDSTDD`,`vattu`.`TenVatTu` AS `TenVatTu`,`vattu`.`DVT` AS `DVT`,`vattu`.`DVT2` AS `DVT2`,`look`.`TenDoiTuong` AS `TenDoiTuong`,`kh`.`TenKhachHang` AS `TenKhachHang`,`kh`.`MaSoKH` AS `MaSoKH`,`qcsp`.`TuRong` AS `TuRong`,`qcsp`.`TuCao` AS `TuCao`,`qcsp`.`TuDaySau` AS `TuDaySau`,`qcsp`.`TuSoJane` AS `TuSoJane`,`look2`.`TenDoiTuong` AS `TenDoiTuongTui`,`qcsp`.`TuDangVoi` AS `TuDangVoi`,`qcsp`.`TuGanNut` AS `TuGanNut`,`qcsp`.`TuLoaiTui` AS `TuLoaiTui`,`qcsp`.`TuDongGoi` AS `TuDongGoi`,`qcsp`.`TuQCPallet` AS `TuQCPallet`,`qcsp`.`TuDuongHan2bien` AS `TuDuongHan2bien`,`qcsp`.`TuHanDau` AS `TuHanDau`,`qcsp`.`TuHanDay` AS `TuHanDay`,`qcsp`.`TrangKho` AS `TrangKho`,`qcsp`.`TrDSKT` AS `TrDSKT`,`qcsp`.`TrDSBD` AS `TrDSBD`,`qcsp`.`TrangMPET` AS `TrangMPET`,`qcsp`.`TrCoDungMoi` AS `TrCoDungMoi`,`qcsp`.`TrKeoKy1` AS `TrKeoKy1`,`qcsp`.`TrKeoKy2` AS `TrKeoKy2`,`qcsp`.`TrKeoKy3` AS `TrKeoKy3`,`qcsp`.`TrMangGhepKho` AS `TrMangGhepKho`,`qcsp`.`TrMangGhepKhoK2` AS `TrMangGhepKhoK2`,`qcsp`.`TrMangGhepKhoK3` AS `TrMangGhepKhoK3`,`qcsp`.`TrDungSai` AS `TrDungSai`,`qcsp`.`TrDungSaiBD` AS `TrDungSaiBD`,`qcsp`.`TuXepHongCao` AS `TuXepHongCao`,`qcsp`.`TuXepDaySau` AS `TuXepDaySau`,`qcsp`.`TuXepHongSau` AS `TuXepHongSau`,`qcsp`.`InChatDongRan` AS `InChatDongRan`,`qcsp`.`TrangTrong` AS `TrangTrong`,`qcsp`.`TrangBa` AS `TrangBa`,`qcsp`.`TrangAL` AS `TrangAL`,`qcsp`.`TrangDun` AS `TrangDun`,`vattu`.`DVTSell` AS `DVTSell`,`qcsp`.`InVatLieu` AS `InVatLieu`,`qcsp`.`InDoDayMangIn` AS `InDoDayMangIn`,`qcsp`.`BuocDaiTP` AS `BuocDaiTP`,`vattu`.`HSCode` AS `HSCode`,`vattu`.`MaVach` AS `MaVach`,`om`.`SoPOKH` AS `SoPOKH`,`om`.`SoHopDong` AS `SOThamChieu` from ((((((`patsoft_mfg_lxs` `lxs` left join `patsoft_om` `om` on(`lxs`.`SoSO` = `om`.`SoOM` and `lxs`.`MaVatTu` = `om`.`MaVT`)) left join `patsoft_om_quycachsanpham_h` `qcsp` on(`lxs`.`SoQCSP` = `qcsp`.`SoQCSP`)) left join `patsoft_dm_khachhang` `kh` on(`om`.`MaKH` = `kh`.`MaSoKH`)) left join `patsoft_dm_lookup` `look` on(`look`.`MaDoiTuong` = `qcsp`.`CauTrucSP` and `look`.`MaLook` = 'DM_CAUTRUCSP')) left join `patsoft_dm_lookup` `look2` on(`look2`.`MaDoiTuong` = `qcsp`.`TuLoaiTui` and `look2`.`MaLook` = 'OM_DMLOAITUI')) left join `patsoft_dm_vattu` `vattu` on(`lxs`.`MaVatTu` = `vattu`.`MaVatTu`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
