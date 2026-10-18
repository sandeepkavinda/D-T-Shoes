-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.42 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for d&t_db
CREATE DATABASE IF NOT EXISTS `d&t_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `d&t_db`;

-- Dumping structure for table d&t_db.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `b_id` int NOT NULL AUTO_INCREMENT,
  `b_name` varchar(45) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.brand: ~2 rows (approximately)
INSERT INTO `brand` (`b_id`, `b_name`) VALUES
	(1, 'Nike'),
	(2, 'Addidas');

-- Dumping structure for table d&t_db.category
CREATE TABLE IF NOT EXISTS `category` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `mc_id` int NOT NULL,
  `sc_id` int NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk_category_main_category1_idx` (`mc_id`),
  KEY `fk_category_sub_category1_idx` (`sc_id`),
  CONSTRAINT `fk_category_main_category1` FOREIGN KEY (`mc_id`) REFERENCES `main_category` (`mc_id`),
  CONSTRAINT `fk_category_sub_category1` FOREIGN KEY (`sc_id`) REFERENCES `sub_category` (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.category: ~4 rows (approximately)
INSERT INTO `category` (`c_id`, `mc_id`, `sc_id`) VALUES
	(1, 1, 1),
	(2, 1, 4),
	(3, 2, 3),
	(4, 3, 2);

-- Dumping structure for table d&t_db.color
CREATE TABLE IF NOT EXISTS `color` (
  `co_id` int NOT NULL AUTO_INCREMENT,
  `co_name` varchar(45) NOT NULL,
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.color: ~4 rows (approximately)
INSERT INTO `color` (`co_id`, `co_name`) VALUES
	(1, 'Black'),
	(2, 'White'),
	(3, 'Brown'),
	(4, 'Red');

-- Dumping structure for table d&t_db.company
CREATE TABLE IF NOT EXISTS `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.company: ~3 rows (approximately)
INSERT INTO `company` (`id`, `company_name`, `contact_no`) VALUES
	(1, 'Sahan Enterprices', '0779216487'),
	(2, 'Daham Enterprices', '0779595865'),
	(3, 'Nimal Enterprices', '0785858698');

-- Dumping structure for table d&t_db.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `mobile` varchar(10) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.customer: ~2 rows (approximately)
INSERT INTO `customer` (`mobile`, `fname`, `lname`) VALUES
	('0702252220', 'Vishmi', 'Gunarathne'),
	('0779216487', 'Sandeep', 'Kavinda');

-- Dumping structure for table d&t_db.customer_return
CREATE TABLE IF NOT EXISTS `customer_return` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `qty` int NOT NULL,
  `invoice_item_init_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_return_invoice_item1_idx` (`invoice_item_init_id`),
  CONSTRAINT `fk_customer_return_invoice_item1` FOREIGN KEY (`invoice_item_init_id`) REFERENCES `invoice_item` (`init_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.customer_return: ~3 rows (approximately)
INSERT INTO `customer_return` (`id`, `date_time`, `qty`, `invoice_item_init_id`) VALUES
	(6, '2024-05-23 23:27:21', 2, 1),
	(17, '2024-05-26 02:16:36', 3, 2),
	(19, '2024-05-26 03:06:46', 2, 2);

-- Dumping structure for table d&t_db.grn
CREATE TABLE IF NOT EXISTS `grn` (
  `barcode` bigint NOT NULL,
  `date_time` date NOT NULL,
  `total` double NOT NULL,
  `supplier_mobile` varchar(10) NOT NULL,
  PRIMARY KEY (`barcode`),
  KEY `fk_grn_supplier1_idx` (`supplier_mobile`),
  CONSTRAINT `fk_grn_supplier1` FOREIGN KEY (`supplier_mobile`) REFERENCES `supplier` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.grn: ~12 rows (approximately)
INSERT INTO `grn` (`barcode`, `date_time`, `total`, `supplier_mobile`) VALUES
	(12345, '2024-05-23', 7000, '0715555555'),
	(12346, '2024-05-23', 100, '0713333333'),
	(1716676267488, '2024-05-02', 5000, '0713333333'),
	(1716676344625, '2024-05-01', 0, '0713333333'),
	(1716942631065, '2024-05-03', 500, '0779595869'),
	(1716942718913, '2024-05-15', 100, '0779595869'),
	(1716942917418, '2024-05-22', 100, '0779595869'),
	(1716944461859, '2024-05-15', 100, '0715555555'),
	(1716945004588, '2024-05-03', 100, '0715555555'),
	(1716945199332, '2024-05-21', 100, '0715555555'),
	(1716945305701, '2024-05-01', 100, '0779595869'),
	(1716945525268, '2024-05-21', 100, '0779595869');

-- Dumping structure for table d&t_db.grn_item
CREATE TABLE IF NOT EXISTS `grn_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `buying_price` double NOT NULL,
  `qty` int NOT NULL,
  `product_p_id` int NOT NULL,
  `grn_barcode` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_item_product1_idx` (`product_p_id`),
  KEY `fk_grn_item_grn1_idx` (`grn_barcode`),
  CONSTRAINT `fk_grn_item_grn1` FOREIGN KEY (`grn_barcode`) REFERENCES `grn` (`barcode`),
  CONSTRAINT `fk_grn_item_product1` FOREIGN KEY (`product_p_id`) REFERENCES `product` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.grn_item: ~10 rows (approximately)
INSERT INTO `grn_item` (`id`, `buying_price`, `qty`, `product_p_id`, `grn_barcode`) VALUES
	(1, 25000, 5, 2, 12346),
	(2, 1000, 7, 1, 12345),
	(4, 100, 10, 2, 1716942631065),
	(5, 1000, 10, 3, 1716942718913),
	(6, 100, 10, 1, 1716942917418),
	(7, 100, 10, 2, 1716944461859),
	(8, 100, 10, 1, 1716945004588),
	(9, 100, 10, 2, 1716945199332),
	(10, 110, 10, 1, 1716945305701),
	(11, 100, 10, 3, 1716945525268);

-- Dumping structure for table d&t_db.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `in_id` varchar(20) NOT NULL,
  `in_date_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `pm_id` int NOT NULL,
  `payment` double NOT NULL,
  `discount` double NOT NULL,
  PRIMARY KEY (`in_id`),
  KEY `fk_invoice_user1_idx` (`user_id`),
  KEY `fk_invoice_customer1_idx` (`customer_mobile`),
  KEY `fk_invoice_payment_method1_idx` (`pm_id`),
  CONSTRAINT `fk_invoice_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`),
  CONSTRAINT `fk_invoice_payment_method1` FOREIGN KEY (`pm_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `fk_invoice_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.invoice: ~32 rows (approximately)
INSERT INTO `invoice` (`in_id`, `in_date_time`, `user_id`, `customer_mobile`, `pm_id`, `payment`, `discount`) VALUES
	('1', '2024-05-23 16:31:46', 1, '0702252220', 1, 3200, 0),
	('1716934220297', '2024-05-29 03:40:48', 1, '0779216487', 1, 3000, 0),
	('1716934617833', '2024-05-29 03:47:46', 1, '0779216487', 2, 5000, 0),
	('1716936412643', '2024-05-29 04:17:06', 1, '0779216487', 1, 3000, 0),
	('1716936598558', '2024-05-29 04:20:16', 1, '0779216487', 1, 1000, 0),
	('1716936709962', '2024-05-29 04:22:00', 1, '0779216487', 1, 1000, 0),
	('1716936832783', '2024-05-29 04:24:10', 1, '0779216487', 1, 4000, 0),
	('1716937310221', '2024-05-29 04:32:01', 1, '0779216487', 1, 1000, 0),
	('1716937761957', '2024-05-29 04:39:31', 1, '0779216487', 1, 3000, 0),
	('1716937942761', '2024-05-29 04:42:35', 1, '0702252220', 1, 3200, 0),
	('1716938045034', '2024-05-29 04:44:14', 1, '0702252220', 1, 3000, 0),
	('1716938117020', '2024-05-29 04:45:26', 1, '0779216487', 1, 2500, 0),
	('1716938348715', '2024-05-29 04:49:20', 1, '0779216487', 1, 1000, 0),
	('1716938516131', '2024-05-29 04:52:04', 1, '0779216487', 1, 3000, 0),
	('1716938607107', '2024-05-29 04:53:37', 1, '0779216487', 1, 1000, 0),
	('1716938742877', '2024-05-29 04:55:50', 1, '0779216487', 1, 1000, 0),
	('1716938854231', '2024-05-29 04:57:45', 1, '0779216487', 1, 1000, 0),
	('1716939054215', '2024-05-29 05:01:05', 1, '0779216487', 1, 3000, 0),
	('1716939145355', '2024-05-29 05:02:32', 1, '0779216487', 1, 3000, 0),
	('1716939298858', '2024-05-29 05:05:05', 1, '0779216487', 1, 2500, 0),
	('1716939356877', '2024-05-29 05:06:08', 1, '0779216487', 1, 1000, 0),
	('1716939503226', '2024-05-29 05:08:31', 1, '0779216487', 1, 2500, 0),
	('1716939777048', '2024-05-29 05:13:06', 1, '0779216487', 1, 1000, 0),
	('1716939913330', '2024-05-29 05:15:21', 1, '0779216487', 1, 3000, 0),
	('1716940015159', '2024-05-29 05:17:04', 1, '0779216487', 1, 3200, 0),
	('1716940048624', '2024-05-29 05:17:43', 1, '0779216487', 1, 2500, 0),
	('1716940266868', '2024-05-29 05:22:06', 1, '0779216487', 1, 4000, 0),
	('1716940918745', '2024-05-29 05:32:09', 1, '0779216487', 1, 3000, 0),
	('1716941547200', '2024-05-29 05:42:40', 1, '0779216487', 1, 2500, 0),
	('1716941627359', '2024-05-29 05:43:55', 1, '0779216487', 1, 3000, 0),
	('1716941734879', '2024-05-29 05:45:44', 1, '0779216487', 1, 3000, 0),
	('2', '2024-05-23 21:25:06', 1, '0702252220', 2, 3000, 0);

-- Dumping structure for table d&t_db.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `init_id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `in_id` varchar(20) NOT NULL,
  `discount` double NOT NULL,
  `st_barcode` bigint NOT NULL,
  PRIMARY KEY (`init_id`),
  KEY `fk_invoice_item_invoice1_idx` (`in_id`),
  KEY `fk_invoice_item_stock1_idx` (`st_barcode`),
  CONSTRAINT `fk_invoice_item_invoice1` FOREIGN KEY (`in_id`) REFERENCES `invoice` (`in_id`),
  CONSTRAINT `fk_invoice_item_stock1` FOREIGN KEY (`st_barcode`) REFERENCES `stock` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.invoice_item: ~35 rows (approximately)
INSERT INTO `invoice_item` (`init_id`, `qty`, `in_id`, `discount`, `st_barcode`) VALUES
	(1, 2, '1', 0, 123456),
	(2, 3, '2', 0, 234567),
	(3, 4, '1', 0, 345678),
	(4, 1, '1716934220297', 0, 234567),
	(5, 1, '1716934617833', 0, 234567),
	(6, 1, '1716936412643', 0, 234567),
	(7, 1, '1716936598558', 0, 1716676370670),
	(8, 1, '1716936709962', 0, 1716676370670),
	(9, 1, '1716936832783', 0, 1716676370670),
	(10, 1, '1716936832783', 0, 234567),
	(11, 1, '1716937310221', 0, 1716676370670),
	(12, 1, '1716937761957', 0, 234567),
	(13, 1, '1716937942761', 0, 123456),
	(14, 1, '1716938045034', 0, 234567),
	(15, 1, '1716938117020', 0, 345678),
	(16, 1, '1716938348715', 0, 1716676370670),
	(17, 1, '1716938516131', 0, 234567),
	(18, 1, '1716938607107', 0, 1716676370670),
	(19, 1, '1716938742877', 0, 1716676370670),
	(20, 1, '1716938854231', 0, 1716676370670),
	(21, 1, '1716939054215', 0, 234567),
	(22, 1, '1716939145355', 0, 234567),
	(23, 1, '1716939298858', 0, 345678),
	(24, 1, '1716939356877', 0, 1716676370670),
	(25, 1, '1716939503226', 0, 345678),
	(26, 1, '1716939777048', 0, 1716676370670),
	(27, 1, '1716939913330', 0, 234567),
	(28, 1, '1716940015159', 0, 123456),
	(29, 1, '1716940048624', 0, 345678),
	(30, 1, '1716940266868', 0, 234567),
	(31, 1, '1716940266868', 0, 1716676370670),
	(32, 1, '1716940918745', 0, 234567),
	(33, 1, '1716941547200', 0, 345678),
	(34, 1, '1716941627359', 0, 234567),
	(35, 1, '1716941734879', 0, 234567);

-- Dumping structure for table d&t_db.main_category
CREATE TABLE IF NOT EXISTS `main_category` (
  `mc_id` int NOT NULL AUTO_INCREMENT,
  `mc_name` varchar(45) NOT NULL,
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.main_category: ~3 rows (approximately)
INSERT INTO `main_category` (`mc_id`, `mc_name`) VALUES
	(1, 'Mens'),
	(2, 'Ladies'),
	(3, 'Kids');

-- Dumping structure for table d&t_db.order_status
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.order_status: ~2 rows (approximately)
INSERT INTO `order_status` (`id`, `status`) VALUES
	(1, 'Recived'),
	(2, 'Delivered');

-- Dumping structure for table d&t_db.other_service
CREATE TABLE IF NOT EXISTS `other_service` (
  `barcode` bigint NOT NULL,
  `description` text NOT NULL,
  `amount` double NOT NULL,
  `qty` int NOT NULL,
  `payment` double NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `order_status_id` int NOT NULL DEFAULT '1',
  `order_date` date NOT NULL,
  `deliver_date` date NOT NULL,
  PRIMARY KEY (`barcode`),
  KEY `fk_other_service_customer1_idx` (`customer_mobile`),
  KEY `fk_other_service_order_status1_idx` (`order_status_id`),
  CONSTRAINT `fk_other_service_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`),
  CONSTRAINT `fk_other_service_order_status1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.other_service: ~4 rows (approximately)
INSERT INTO `other_service` (`barcode`, `description`, `amount`, `qty`, `payment`, `customer_mobile`, `order_status_id`, `order_date`, `deliver_date`) VALUES
	(123, 'adad', 300, 10, 3000, '0702252220', 2, '2024-05-27', '2024-06-27'),
	(1716825840451, 'dd', 100, 10, 1000, '0779216487', 1, '2024-05-27', '2024-05-29'),
	(1716895022866, 'asasasds', 100, 10, 500, '0779216487', 2, '2024-05-28', '2024-05-30'),
	(1716917938818, 'wee w', 100, 10, 100, '0779216487', 1, '2024-05-28', '2024-05-30');

-- Dumping structure for table d&t_db.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pm_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.payment_method: ~2 rows (approximately)
INSERT INTO `payment_method` (`id`, `pm_name`) VALUES
	(1, 'Card'),
	(2, 'Cash');

-- Dumping structure for table d&t_db.product
CREATE TABLE IF NOT EXISTS `product` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `b_id` int NOT NULL,
  `c_id` int NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_product_brand1_idx` (`b_id`),
  KEY `fk_product_category1_idx` (`c_id`),
  CONSTRAINT `fk_product_brand1` FOREIGN KEY (`b_id`) REFERENCES `brand` (`b_id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`c_id`) REFERENCES `category` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.product: ~3 rows (approximately)
INSERT INTO `product` (`p_id`, `title`, `b_id`, `c_id`) VALUES
	(1, 'Mens Shoes', 1, 1),
	(2, 'ladies Heels', 2, 3),
	(3, 'Kids Shoes', 1, 4);

-- Dumping structure for table d&t_db.size
CREATE TABLE IF NOT EXISTS `size` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_name` varchar(45) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.size: ~4 rows (approximately)
INSERT INTO `size` (`s_id`, `s_name`) VALUES
	(1, '37'),
	(2, '38'),
	(3, '39'),
	(4, '40');

-- Dumping structure for table d&t_db.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.status: ~2 rows (approximately)
INSERT INTO `status` (`id`, `status`) VALUES
	(1, 'Active'),
	(2, 'Inactive');

-- Dumping structure for table d&t_db.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `barcode` bigint NOT NULL,
  `p_id` int NOT NULL,
  `s_id` int NOT NULL,
  `co_id` int NOT NULL,
  `price` double NOT NULL,
  `available_qty` int NOT NULL,
  PRIMARY KEY (`barcode`),
  KEY `fk_stock_size1_idx` (`s_id`),
  KEY `fk_stock_color1_idx` (`co_id`),
  KEY `fk_stock_product1_idx` (`p_id`),
  CONSTRAINT `fk_stock_color1` FOREIGN KEY (`co_id`) REFERENCES `color` (`co_id`),
  CONSTRAINT `fk_stock_product1` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  CONSTRAINT `fk_stock_size1` FOREIGN KEY (`s_id`) REFERENCES `size` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.stock: ~11 rows (approximately)
INSERT INTO `stock` (`barcode`, `p_id`, `s_id`, `co_id`, `price`, `available_qty`) VALUES
	(123456, 1, 3, 1, 3200, 15),
	(234567, 2, 2, 3, 3000, -2),
	(345678, 3, 1, 2, 2500, 15),
	(1716676284115, 3, 1, 1, 1000, 10),
	(1716676370670, 2, 2, 1, 1000, 1),
	(1716942657075, 2, 1, 1, 110, 20),
	(1716942723068, 3, 1, 1, 10000, 10),
	(1716942921669, 1, 1, 1, 110, 20),
	(1716945201913, 2, 1, 2, 110, 10),
	(1716945307664, 1, 1, 1, 120, 10),
	(1716945528424, 3, 1, 1, 101, 10);

-- Dumping structure for table d&t_db.sub_category
CREATE TABLE IF NOT EXISTS `sub_category` (
  `sc_id` int NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(45) NOT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.sub_category: ~4 rows (approximately)
INSERT INTO `sub_category` (`sc_id`, `sc_name`) VALUES
	(1, 'Sneakers'),
	(2, 'Shoes'),
	(3, 'Heels'),
	(4, 'Boots');

-- Dumping structure for table d&t_db.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `mobile` varchar(10) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `status_id` int NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`mobile`),
  KEY `fk_supplier_status1_idx` (`status_id`),
  KEY `fk_supplier_company1_idx` (`company_id`),
  CONSTRAINT `fk_supplier_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_supplier_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.supplier: ~4 rows (approximately)
INSERT INTO `supplier` (`mobile`, `fname`, `lname`, `status_id`, `company_id`) VALUES
	('0713333333', 'Supun', 'Pereraa', 1, 1),
	('0715555555', 'Kalindu', 'Bandara', 1, 3),
	('0779565985', 'Ayodya', 'Himashi', 1, 3),
	('0779595869', 'sq', 'ssa', 1, 1);

-- Dumping structure for table d&t_db.supplier_return
CREATE TABLE IF NOT EXISTS `supplier_return` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `qty` int NOT NULL,
  `grn_item_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_return_grn_item1_idx` (`grn_item_id`),
  CONSTRAINT `fk_supplier_return_grn_item1` FOREIGN KEY (`grn_item_id`) REFERENCES `grn_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.supplier_return: ~3 rows (approximately)
INSERT INTO `supplier_return` (`id`, `date_time`, `qty`, `grn_item_id`) VALUES
	(1, '2024-05-23 16:30:54', 2, 1),
	(4, '2024-05-24 04:24:58', 4, 2),
	(10, '2024-05-26 03:08:38', 2, 1);

-- Dumping structure for table d&t_db.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type_id` int NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_type_idx` (`user_type_id`),
  KEY `fk_user_status1_idx` (`status_id`),
  CONSTRAINT `fk_user_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_user_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.user: ~1 rows (approximately)
INSERT INTO `user` (`id`, `fname`, `lname`, `mobile`, `username`, `password`, `user_type_id`, `status_id`) VALUES
	(1, 'Daham', 'Bandara', '0702352220', 'daham', '123', 1, 1);

-- Dumping structure for table d&t_db.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table d&t_db.user_type: ~2 rows (approximately)
INSERT INTO `user_type` (`id`, `type`) VALUES
	(1, 'Admin'),
	(2, 'Cashier');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
