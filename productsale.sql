-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.30 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 productsale 的数据库结构
CREATE DATABASE IF NOT EXISTS `productsale` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `productsale`;

-- 导出  表 productsale.buyitem 结构
CREATE TABLE IF NOT EXISTS `buyitem` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '买入的订单号',
  `buy_time` date DEFAULT NULL,
  `good_num` int(11) DEFAULT NULL COMMENT '买入的数量',
  `buy_bz` int(11) DEFAULT NULL,
  `buy_price` int(11) DEFAULT NULL COMMENT '买入的商品的单价',
  PRIMARY KEY (`buy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 数据导出被取消选择。
-- 导出  表 productsale.goods 结构
CREATE TABLE IF NOT EXISTS `goods` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_id` int(11) DEFAULT '0',
  `good_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `good_type` int(11) DEFAULT '0' COMMENT '食品0；药品1；服装2；',
  `good_producter` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `saled` int(11) NOT NULL DEFAULT '0' COMMENT '现存商品的数量',
  `sale_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`good_id`),
  KEY `FK_goods_buyitem` (`buy_id`),
  KEY `FK_goods_saleitem` (`sale_id`),
  CONSTRAINT `FK_goods_saleitem` FOREIGN KEY (`sale_id`) REFERENCES `saleitem` (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 数据导出被取消选择。
-- 导出  表 productsale.saleitem 结构
CREATE TABLE IF NOT EXISTS `saleitem` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_price` int(11) DEFAULT NULL,
  `sale_time` datetime DEFAULT NULL,
  `sale_num` int(11) DEFAULT NULL,
  `sale_bz` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 数据导出被取消选择。
-- 导出  表 productsale.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` int(20) DEFAULT NULL,
  `role` int(20) DEFAULT NULL COMMENT 'admin 0;买入信息管理员1；卖出信息管理员2；信息统计查询3；',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
