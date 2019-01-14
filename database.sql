/*
SQLyog Ultimate v8.53 
MySQL - 5.5.5-10.1.37-MariaDB : Database - goat_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`goat_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `goat_db`;

/*Table structure for table `admin_table` */

DROP TABLE IF EXISTS `admin_table`;

CREATE TABLE `admin_table` (
  `adminId` int(6) NOT NULL AUTO_INCREMENT,
  `credentialId` int(6) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `FK_admin_table` (`credentialId`),
  CONSTRAINT `FK_admin_table` FOREIGN KEY (`credentialId`) REFERENCES `credential_table` (`credentialId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admin_table` */

insert  into `admin_table`(`adminId`,`credentialId`) values (1,3);

/*Table structure for table `credential_table` */

DROP TABLE IF EXISTS `credential_table`;

CREATE TABLE `credential_table` (
  `credentialId` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`credentialId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `credential_table` */

insert  into `credential_table`(`credentialId`,`username`,`password`) values (3,'admin','admin'),(4,'870b','870b'),(5,'b509','b509'),(6,'31ce','31ce'),(7,'8999','8999'),(8,'3a2e','3a2e'),(9,'dec6','dec6');

/*Table structure for table `farmer_table` */

DROP TABLE IF EXISTS `farmer_table`;

CREATE TABLE `farmer_table` (
  `farmerId` int(6) NOT NULL AUTO_INCREMENT,
  `farmerName` varchar(60) DEFAULT NULL,
  `farmerAddress` varchar(60) DEFAULT NULL,
  `credentialId` int(6) DEFAULT NULL,
  PRIMARY KEY (`farmerId`),
  KEY `FK_farmer_table` (`credentialId`),
  CONSTRAINT `FK_farmer_table` FOREIGN KEY (`credentialId`) REFERENCES `credential_table` (`credentialId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `farmer_table` */

insert  into `farmer_table`(`farmerId`,`farmerName`,`farmerAddress`,`credentialId`) values (8,'asd1','dadd1',7),(9,'asd','asdddd',8),(10,'1123','123333',9);

/*Table structure for table `livestock_table` */

DROP TABLE IF EXISTS `livestock_table`;

CREATE TABLE `livestock_table` (
  `liveStockId` int(6) NOT NULL AUTO_INCREMENT,
  `liveStockQRId` varchar(60) DEFAULT NULL,
  `kilo` int(4) DEFAULT NULL,
  `gender` varchar(60) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `farmerId` int(6) DEFAULT NULL,
  `gps` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`liveStockId`),
  KEY `FK_livestock_table` (`farmerId`),
  CONSTRAINT `FK_livestock_table` FOREIGN KEY (`farmerId`) REFERENCES `farmer_table` (`farmerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `livestock_table` */

/*Table structure for table `admin_view` */

DROP TABLE IF EXISTS `admin_view`;

/*!50001 DROP VIEW IF EXISTS `admin_view` */;
/*!50001 DROP TABLE IF EXISTS `admin_view` */;

/*!50001 CREATE TABLE  `admin_view`(
 `adminId` int(6) ,
 `credentialId` int(6) ,
 `username` varchar(60) ,
 `password` varchar(60) 
)*/;

/*Table structure for table `farmer_view` */

DROP TABLE IF EXISTS `farmer_view`;

/*!50001 DROP VIEW IF EXISTS `farmer_view` */;
/*!50001 DROP TABLE IF EXISTS `farmer_view` */;

/*!50001 CREATE TABLE  `farmer_view`(
 `farmerId` int(6) ,
 `farmerName` varchar(60) ,
 `farmerAddress` varchar(60) ,
 `credentialId` int(6) ,
 `username` varchar(60) ,
 `password` varchar(60) 
)*/;

/*Table structure for table `livestock_view` */

DROP TABLE IF EXISTS `livestock_view`;

/*!50001 DROP VIEW IF EXISTS `livestock_view` */;
/*!50001 DROP TABLE IF EXISTS `livestock_view` */;

/*!50001 CREATE TABLE  `livestock_view`(
 `liveStockId` int(6) ,
 `liveStockQRId` varchar(60) ,
 `kilo` int(4) ,
 `gender` varchar(60) ,
 `date` date ,
 `farmerId` int(6) ,
 `farmerName` varchar(60) ,
 `farmerAddress` varchar(60) ,
 `credentialId` int(6) 
)*/;

/*View structure for view admin_view */

/*!50001 DROP TABLE IF EXISTS `admin_view` */;
/*!50001 DROP VIEW IF EXISTS `admin_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `admin_view` AS select `admin_table`.`adminId` AS `adminId`,`admin_table`.`credentialId` AS `credentialId`,`credential_table`.`username` AS `username`,`credential_table`.`password` AS `password` from (`admin_table` join `credential_table` on((`admin_table`.`credentialId` = `credential_table`.`credentialId`))) */;

/*View structure for view farmer_view */

/*!50001 DROP TABLE IF EXISTS `farmer_view` */;
/*!50001 DROP VIEW IF EXISTS `farmer_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `farmer_view` AS select `farmer_table`.`farmerId` AS `farmerId`,`farmer_table`.`farmerName` AS `farmerName`,`farmer_table`.`farmerAddress` AS `farmerAddress`,`farmer_table`.`credentialId` AS `credentialId`,`credential_table`.`username` AS `username`,`credential_table`.`password` AS `password` from (`farmer_table` join `credential_table` on((`farmer_table`.`credentialId` = `credential_table`.`credentialId`))) */;

/*View structure for view livestock_view */

/*!50001 DROP TABLE IF EXISTS `livestock_view` */;
/*!50001 DROP VIEW IF EXISTS `livestock_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `livestock_view` AS select `livestock_table`.`liveStockId` AS `liveStockId`,`livestock_table`.`liveStockQRId` AS `liveStockQRId`,`livestock_table`.`kilo` AS `kilo`,`livestock_table`.`gender` AS `gender`,`livestock_table`.`date` AS `date`,`livestock_table`.`farmerId` AS `farmerId`,`farmer_table`.`farmerName` AS `farmerName`,`farmer_table`.`farmerAddress` AS `farmerAddress`,`farmer_table`.`credentialId` AS `credentialId` from (`livestock_table` join `farmer_table` on((`livestock_table`.`farmerId` = `farmer_table`.`farmerId`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
