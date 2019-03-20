-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24-0ubuntu0.18.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for carthook

-- Data exporting was unselected.
-- Dumping structure for function carthook.generate_fname
DELIMITER //
CREATE DEFINER=`homestead`@`%` FUNCTION `generate_fname`() RETURNS varchar(255) CHARSET utf8
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "Igor","Peter","Marko","Janez","Rudi","Jože","Simon","Sandi","Anže","Andrej","Johan","James","Mary","John","Patricia","Robert","Linda","Michael","Barbara","William","Elizabeth","David","Jennifer","Richard","Maria","Charles","Susan","Joseph","Margaret","Thomas","Dorothy","Christopher","Lisa","Daniel","Nancy","Paul","Karen","Mark","Betty","Donald","Helen","George","Sandra","Kenneth","Donna","Steven","Carol","Edward","Ruth","Brian","Sharon","Ronald","Michelle","Anthony","Laura","Kevin","Sarah","Jason","Kimberly","Matthew","Deborah","Gary","Jessica","Timothy","Shirley","Jose","Cynthia","Larry","Angela","Jeffrey","Melissa","Frank","Brenda","Scott","Amy","Eric","Anna","Stephen","Rebecca","Andrew","Virginia","Raymond","Kathleen","Gregory","Pamela","Joshua","Martha","Jerry","Debra","Dennis","Amanda","Walter","Stephanie","Patrick","Carolyn","Peter","Christine","Harold","Marie","Douglas","Janet","Henry","Catherine","Carl","Frances","Arthur","Ann","Ryan","Joyce","Roger","Diane");
END//
DELIMITER ;

-- Dumping structure for function carthook.generate_lname
DELIMITER //
CREATE DEFINER=`homestead`@`%` FUNCTION `generate_lname`() RETURNS varchar(255) CHARSET utf8
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "Novak","Kranjc","Pohar","Klarič","Komar","Boter","Peterson","Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes");
END//
DELIMITER ;

CREATE DATABASE IF NOT EXISTS `carthook` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `carthook`;


-- Dumping structure for table carthook.funnels_daily
CREATE TABLE IF NOT EXISTS `funnels_daily` (
  `merchant_id` varchar(50) NOT NULL,
  `funnel_id` varchar(50) NOT NULL,
  `analytics_date` date NOT NULL,
  `sales_total` decimal(14,2) NOT NULL,
  `conversions_total` int(11) NOT NULL,
  `postpurchase_revenue_total` decimal(14,2) NOT NULL,
  `visits_total` int(11) NOT NULL,
  `ident` varchar(50) NOT NULL,
  KEY `merchant_id` (`merchant_id`),
  KEY `analytics_date` (`analytics_date`),
  KEY `funnel_id` (`funnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table carthook.funnels_hourly
CREATE TABLE IF NOT EXISTS `funnels_hourly` (
  `merchant_id` varchar(50) NOT NULL,
  `funnel_id` varchar(50) NOT NULL,
  `analytics_date` datetime NOT NULL,
  `sales_total` decimal(14,2) NOT NULL,
  `conversions_total` int(11) NOT NULL,
  `postpurchase_revenue_total` decimal(14,2) NOT NULL,
  `visits_total` int(11) NOT NULL,
  `ident` varchar(50) NOT NULL,
  KEY `merchant_id` (`merchant_id`),
  KEY `analytics_date` (`analytics_date`),
  KEY `funnel_id` (`funnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping structure for table carthook.merchant
CREATE TABLE IF NOT EXISTS `merchant` (
  `id` varchar(50) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 3` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table carthook.merchants_daily
CREATE TABLE IF NOT EXISTS `merchants_daily` (
  `merchant_id` varchar(50) NOT NULL,
  `analytics_date` date NOT NULL,
  `sales_total` decimal(14,2) NOT NULL,
  `conversions_total` int(11) NOT NULL,
  `postpurchase_revenue_total` decimal(14,2) NOT NULL,
  `visits_total` int(11) NOT NULL,
  `ident` varchar(50) NOT NULL,
  KEY `merchant_id` (`merchant_id`),
  KEY `analytics_date` (`analytics_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table carthook.merchants_hourly
CREATE TABLE IF NOT EXISTS `merchants_hourly` (
  `merchant_id` varchar(50) NOT NULL,
  `analytics_date` datetime NOT NULL,
  `sales_total` decimal(14,2) NOT NULL,
  `conversions_total` int(11) NOT NULL,
  `postpurchase_revenue_total` decimal(14,2) NOT NULL,
  `visits_total` int(11) NOT NULL,
  `ident` varchar(50) NOT NULL,
  KEY `merchant_id` (`merchant_id`),
  KEY `analytics_date` (`analytics_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
