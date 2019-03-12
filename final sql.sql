/*
SQLyog Ultimate v8.53 
MySQL - 5.6.39-cll-lve : Database - goat_db
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `credential_table` */

insert  into `credential_table`(`credentialId`,`username`,`password`) values (3,'admin','admin'),(4,'870b','870b'),(5,'b509','b509'),(6,'31ce','31ce'),(7,'8999','8999'),(8,'3a2e','3a2e'),(9,'dec6','dec6'),(10,'7ed5','7ed5'),(11,'e30c','zxcv'),(12,'a34b','a34b1'),(13,'318e','318e'),(14,'5622','5622'),(15,'5988','5988'),(16,'836b','836b'),(17,'65fe','65fe'),(18,'8e88','8e88'),(19,'ee13','ee13'),(20,'4dc2','4dc2'),(21,'91a2','91a2'),(22,'9870','9870'),(23,'0035','0035'),(24,'8d39','8d39'),(25,'aba1','aba1');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `farmer_table` */

insert  into `farmer_table`(`farmerId`,`farmerName`,`farmerAddress`,`credentialId`) values (13,'Farmer1','Purok 1, Tacurong',12),(14,'Farmer11','Purok A, Tacurong',13),(15,'Farmer22','Purok B, Tacurong',14),(16,'Farmer33','Purok C, Tacurong',15),(17,'Farmer44','Purok D, Tacurong',16),(18,'Farmer55','Purok E, Tacurong',17),(19,'Farmer66','Purok F, Tacurong',18),(20,'Farmer77','Purok G, Tacurong',19),(21,'Farmer88','Purok 1, Isulan',20),(22,'Elmer Pahm','SKSU Lutayan',21),(23,'Farmer99','Purok 2, Isulan',22),(24,'Farmer00','Purok 3, Isulan',23),(25,'Farmer 20','isulan, sultan kudarat',24),(26,'Nerlyn Faropaldino','Upper Katungal, Tacurong',25);

/*Table structure for table `livestock_table` */

DROP TABLE IF EXISTS `livestock_table`;

CREATE TABLE `livestock_table` (
  `liveStockId` int(6) NOT NULL AUTO_INCREMENT,
  `liveStockQRId` varchar(60) DEFAULT NULL,
  `weight` int(4) DEFAULT NULL,
  `whenToSold` date DEFAULT NULL,
  `farmerId` int(6) DEFAULT NULL,
  `gps` varchar(60) DEFAULT NULL,
  `dateAdded` date DEFAULT NULL,
  `actualAddress` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`liveStockId`),
  KEY `FK_livestock_table` (`farmerId`),
  CONSTRAINT `FK_livestock_table` FOREIGN KEY (`farmerId`) REFERENCES `farmer_table` (`farmerId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=latin1;

/*Data for the table `livestock_table` */

insert  into `livestock_table`(`liveStockId`,`liveStockQRId`,`weight`,`whenToSold`,`farmerId`,`gps`,`dateAdded`,`actualAddress`) values (1,'SEFMQUxHT0FUUzIwMTktMDEtMTYgMTQ6MzM6MzUgMDAwMDAwMjA=',58,'2019-01-16',NULL,'6.69134407,124.67339483','2019-01-16',NULL),(2,'SEFMQUxHT0FUUzIwMTktMDEtMTYgMTQ6MzM6MzUgMDAwMDAwMTc=',8,'2019-01-24',NULL,'6.69133079,124.67339234','2019-01-16','Pioner Avenue, Tacurong City, Sultan Kudarat, Philippines'),(3,'SEFMQUxHT0FUUzIwMTktMDEtMTYgMTQ6MzM6MzUgMDAwMDAwMTA=',90,'2019-01-29',NULL,'6.69126169,124.67346694','2019-01-17','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(4,'SEFMQUxHT0FUUzIwMTktMDEtMTYgMTQ6MzM6MzUgMDAwMDAwNw==',80,'2019-01-24',NULL,'6.69145267,124.67332135','2019-01-17','Pioner Avenue, Tacurong City, Sultan Kudarat, Philippines'),(5,'SEFMQUxHT0FUUzIwMTktMDEtMjUgMTI6MDI6MDEgMDAwMDAwMQ==',12,'2019-01-25',NULL,'6.71227651,124.65849972','2019-01-25','Unnamed Road, Tacurong City, Sultan Kudarat, Philippines'),(6,'SEFMQUxHT0FUUzIwMTktMDEtMjUgMTI6MDM6NTIgMDAwMDAwMQ==',100,'2019-01-23',NULL,'6.7125308,124.65885323','2019-01-25','Unnamed Road, Tacurong City, Sultan Kudarat, Philippines'),(7,'SEFMQUxHT0FUUzIwMTktMDEtMjggMDE6NTc6MjIgMDAwMDAwMQ==',150,'2019-01-25',NULL,'6.636116666666667,124.606465','2019-01-28','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(8,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMQ==',50,'2019-02-09',13,'6.69148837,124.67757704','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(9,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMg==',51,'2019-02-09',13,'6.6914896,124.67757799','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(10,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMw==',52,'2019-02-09',13,'6.6914908,124.67757894','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(11,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNA==',53,'2019-02-09',13,'6.69149117,124.67758018','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(12,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNQ==',54,'2019-02-09',13,'6.69149131,124.67758075','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(13,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNg==',55,'2019-02-09',13,'6.69149227,124.67758132','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(14,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNw==',56,'2019-02-09',13,'6.69149319,124.67758166','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(15,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwOA==',57,'2019-02-09',13,'6.69149356,124.67758233','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(16,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwOQ==',58,'2019-02-09',13,'6.69149412,124.67758361','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(17,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTA=',59,'2019-02-09',13,'6.69149417,124.67758403','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(18,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTE=',60,'2019-02-10',13,'6.69119645,124.67568288','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(19,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTI=',61,'2019-02-09',13,'6.69118795,124.67568002','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(20,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTM=',62,'2019-02-09',13,'6.69118648,124.67567992','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(21,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTQ=',63,'2019-02-09',13,'6.69118173,124.67568135','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(22,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTU=',64,'2019-02-09',13,'6.69117506,124.67568191','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(23,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTY=',65,'2019-02-09',13,'6.69117498,124.67568128','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(24,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTc=',66,'2019-02-09',13,'6.69117474,124.67568093','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(25,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTg=',68,'2019-02-09',13,'6.69117452,124.67568074','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(26,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMTk=',98,'2019-02-09',13,'6.69117423,124.67568051','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(27,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjA=',78,'2019-02-09',13,'6.69117373,124.67567992','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(28,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjE=',100,'2019-02-09',13,'6.68995075,124.67513027','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(29,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjI=',100,'2019-02-09',13,'6.68995152,124.67512837','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(30,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjM=',45,'2019-02-09',13,'6.68995152,124.6751283','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(31,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjQ=',25,'2019-02-09',13,'6.68995165,124.67512789','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(32,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjU=',12,'2019-02-09',13,'6.68995132,124.67512776','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(33,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjY=',23,'2019-02-09',13,'6.68995132,124.67512759','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(34,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjc=',14,'2019-02-09',13,'6.68995103,124.67512748','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(35,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjg=',25,'2019-02-09',13,'6.68995095,124.67512729','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(36,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMjk=',36,'2019-02-09',13,'6.68995082,124.67512759','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(37,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzA=',12,'2019-02-09',13,'6.68995078,124.67512756','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(38,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzE=',23,'2019-02-09',13,'6.6890033,124.67480315','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(39,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzI=',25,'2019-02-09',13,'6.68901007,124.67482448','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(40,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzM=',25,'2019-02-09',13,'6.68901003,124.67482621','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(41,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzQ=',14,'2019-02-09',13,'6.68900965,124.67482737','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(42,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzU=',31,'2019-02-09',13,'6.68900983,124.67482812','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(43,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzY=',25,'2019-02-09',13,'6.68900989,124.6748288','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(44,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzc=',25,'2019-02-09',13,'6.68900348,124.67484486','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(45,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzg=',14,'2019-02-09',13,'6.68899134,124.67485038','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(46,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwMzk=',28,'2019-02-09',13,'6.68899112,124.67485087','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(47,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDA=',45,'2019-02-09',13,'6.68899104,124.67485131','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(48,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDE=',35,'2019-02-09',13,'6.6888875,124.67397402','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(49,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDI=',24,'2019-02-09',13,'6.68888667,124.67397576','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(50,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDM=',25,'2019-02-09',13,'6.68887908,124.67396114','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(51,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDQ=',12,'2019-02-09',13,'6.68888692,124.67394722','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(52,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDU=',36,'2019-02-09',13,'6.68887233,124.67395032','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(53,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDY=',12,'2019-02-09',13,'6.68886058,124.6739794','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(54,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDc=',14,'2019-02-09',13,'6.68887015,124.67398263','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(55,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDg=',25,'2019-02-09',13,'6.68885104,124.67394156','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(56,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNDk=',23,'2019-02-09',13,'6.68885621,124.67394979','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(57,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MDk6NTIgMDAwMDAwNTA=',45,'2019-02-09',13,'6.6888617,124.67394977','2019-02-09','Malvar Street, Tacurong City, Sultan Kudarat, Philippines'),(58,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMQ==',25,'2019-02-09',13,'6.68839327,124.67344634','2019-02-09','Lapu-Lapu Street, Tacurong City, Sultan Kudarat, Philippines'),(59,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMg==',12,'2019-02-09',13,'6.68840441,124.67345008','2019-02-09','Lapu-Lapu Street, Tacurong City, Sultan Kudarat, Philippines'),(60,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMw==',12,'2019-02-09',13,'6.68840088,124.67344991','2019-02-09','Lapu-Lapu Street, Tacurong City, Sultan Kudarat, Philippines'),(61,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNA==',17,'2019-02-09',13,'6.68838462,124.67342984','2019-02-09','Lapu-Lapu Street, Tacurong City, Sultan Kudarat, Philippines'),(62,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNQ==',12,'2019-02-09',13,'6.68839439,124.67343195','2019-02-09','Lapu-Lapu Street, Tacurong City, Sultan Kudarat, Philippines'),(63,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNg==',25,'2019-02-09',14,'6.68853229,124.67460748','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(64,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNw==',23,'2019-02-09',14,'6.68853214,124.67460824','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(65,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwOA==',24,'2019-02-09',14,'6.68853209,124.67460856','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(66,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwOQ==',25,'2019-02-09',14,'6.68853233,124.67460875','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(67,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTA=',26,'2019-02-09',14,'6.68853257,124.67460869','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(68,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTE=',24,'2019-02-09',14,'6.68853275,124.67460876','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(69,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTI=',23,'2019-02-09',14,'6.68853295,124.67460859','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(70,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTM=',65,'2019-02-09',14,'6.68853363,124.67460915','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(71,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTQ=',45,'2019-02-09',14,'6.68853371,124.67460927','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(72,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTU=',33,'2019-02-09',14,'6.68853419,124.67460958','2019-02-09','Magsaysay Avenue, Tacurong City, Sultan Kudarat, Philippines'),(73,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTY=',20,'2019-02-09',15,'6.68901586,124.67473443','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(74,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTc=',25,'2019-02-09',15,'6.68901713,124.67474434','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(75,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTg=',23,'2019-02-09',15,'6.68901726,124.67474625','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(76,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMTk=',26,'2019-02-09',15,'6.68901717,124.67474685','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(77,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjA=',24,'2019-02-09',15,'6.68901761,124.67474877','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(78,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjE=',25,'2019-02-09',15,'6.68901716,124.67474979','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(79,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjI=',14,'2019-02-09',15,'6.68901663,124.67475103','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(80,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjM=',29,'2019-02-09',15,'6.68901599,124.67475215','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(81,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjQ=',17,'2019-02-09',15,'6.68901557,124.67475281','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(82,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjU=',42,'2019-02-09',15,'6.68899605,124.67483241','2019-02-09','Ledesma Street, Tacurong City, Sultan Kudarat, Philippines'),(83,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjY=',12,'2019-02-09',16,'6.68991904,124.67518963','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(84,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjc=',10,'2019-02-09',16,'6.68990165,124.6751481','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(85,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjg=',25,'2019-02-09',16,'6.68992445,124.6751411','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(86,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMjk=',13,'2019-02-09',16,'6.68992462,124.67514188','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(87,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzA=',25,'2019-02-09',16,'6.68992457,124.67514198','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(88,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzM=',36,'2019-02-09',16,'6.68992477,124.6751422','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(89,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzI=',15,'2019-02-09',16,'6.68992491,124.67514263','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(90,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzE=',24,'2019-02-09',16,'6.68992497,124.67514281','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(91,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzY=',12,'2019-02-09',16,'6.68992507,124.67514279','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(92,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzQ=',39,'2019-02-09',16,'6.68992527,124.67514301','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(93,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzU=',26,'2019-02-09',17,'6.69075271,124.67585376','2019-02-09',''),(94,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzc=',24,'2019-02-09',17,'6.69075294,124.67585366','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(95,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzg=',36,'2019-02-09',17,'6.69076332,124.67584828','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(96,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwMzk=',36,'2019-02-09',17,'6.69076514,124.6758472','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(97,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDA=',24,'2019-02-09',17,'6.69076504,124.67584726','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(98,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDE=',24,'2019-02-09',17,'6.69076493,124.67584734','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(99,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDI=',12,'2019-02-09',17,'6.6907651,124.67584739','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(100,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDM=',25,'2019-02-09',17,'6.69076514,124.67584752','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(101,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDQ=',12,'2019-02-09',17,'6.69076502,124.67584787','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(102,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDU=',39,'2019-02-09',17,'6.69076498,124.67584808','2019-02-09','Bonifacio Street, Tacurong City, Sultan Kudarat, Philippines'),(103,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDY=',23,'2019-02-09',18,'6.69127154,124.67871069','2019-02-09',''),(104,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDg=',25,'2019-02-09',18,'6.69127148,124.67871069','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(105,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDc=',23,'2019-02-09',18,'6.69127135,124.67871097','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(106,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNDk=',12,'2019-02-09',18,'6.69127139,124.67871104','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(107,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTA6MTI6MTAgMDAwMDAwNTA=',12,'2019-02-09',18,'6.6912713,124.67871112','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(108,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjU6MDIgMDAwMDAwMQ==',12,'2019-02-09',18,'6.69127127,124.67871113','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(109,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjU6MDIgMDAwMDAwMg==',35,'2019-02-09',18,'6.69127189,124.67871095','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(110,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjU6MDIgMDAwMDAwMw==',12,'2019-02-09',18,'6.69127189,124.67871094','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(111,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjU6MDIgMDAwMDAwNA==',25,'2019-02-09',18,'6.69127188,124.67871088','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(112,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjU6MDIgMDAwMDAwNQ==',12,'2019-02-09',18,'6.69127179,124.67871083','2019-02-09','Quirino Mercado Avenue (Jaycee Ave.), Tacurong City, Sultan '),(113,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMw==',12,'2019-02-09',19,'6.69119649,124.67766828','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(114,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMg==',28,'2019-02-09',19,'6.69121368,124.67767167','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(115,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMQ==',36,'2019-02-09',19,'6.69121416,124.67766931','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(116,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNA==',35,'2019-02-09',19,'6.69121844,124.67767497','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(117,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNQ==',12,'2019-02-09',19,'6.69122395,124.67767765','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(118,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNg==',25,'2019-02-09',19,'6.6912321,124.6776805','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(119,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNw==',12,'2019-02-09',19,'6.69123936,124.67768938','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(120,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwOA==',25,'2019-02-09',19,'6.69125567,124.67769749','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(121,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwOQ==',25,'2019-02-09',19,'6.69123038,124.67768562','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(122,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTA=',15,'2019-02-09',19,'6.69122881,124.67768323','2019-02-09','Pan-Philippine Hwy, Tacurong City, Sultan Kudarat, Philippin'),(123,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTE=',25,'2019-02-09',20,'6.69062478,124.67897583','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(124,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTI=',31,'2019-02-09',20,'6.6906242,124.6789748','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(125,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTM=',12,'2019-02-09',20,'6.6906253,124.67897535','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(126,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTQ=',25,'2019-02-09',20,'6.69062594,124.67897805','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(127,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTU=',21,'2019-02-09',20,'6.69062579,124.67897682','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(128,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTY=',18,'2019-02-09',20,'6.6906256,124.67897544','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(129,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTc=',28,'2019-02-09',20,'6.69062559,124.67897475','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(130,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTg=',12,'2019-02-09',20,'6.69062554,124.67897412','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(131,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMTk=',13,'2019-02-09',20,'6.69062342,124.67896938','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(132,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjA=',23,'2019-02-09',20,'6.69062281,124.6789676','2019-02-09','Gen. Lim Street, Tacurong City, Sultan Kudarat, Philippines'),(133,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjE=',22,'2019-02-11',21,'6.636303333333332,124.60641333333334','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(134,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjI=',22,'2019-02-11',21,'6.636234999999999,124.60642333333332','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(135,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjM=',12,'2019-02-11',21,'6.636236666666667,124.60634499999999','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(136,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjQ=',19,'2019-02-11',21,'6.636208333333333,124.60632499999998','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(137,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjU=',13,'2019-02-11',21,'6.636313333333334,124.60636166666667','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(138,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjU=',13,'2019-02-11',21,'6.636313333333334,124.60636166666667','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(139,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjY=',14,'2019-02-11',21,'6.636196666666666,124.60637833333334','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(140,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjc=',10,'2019-02-11',21,'6.636168333333334,124.60639166666667','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(141,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjg=',25,'2019-02-11',21,'6.6361983333333345,124.60639166666667','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(142,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMjk=',5,'2019-02-11',21,'6.636223333333334,124.6064','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(143,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzA=',11,'2019-02-11',21,'6.636246666666667,124.60631166666666','2019-02-11','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(144,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDQ6Mjc6MDEgMDAwMDAwMw==',20,'2019-03-01',22,'6.57453665,124.87700906','2019-02-12','Unnamed Road, Lutayan, Sultan Kudarat, Philippines'),(145,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDM6MTc6MDYgMDAwMDAwMQ==',18,'2019-03-01',22,'6.57452573,124.87704289','2019-02-12','Unnamed Road, Lutayan, Sultan Kudarat, Philippines'),(146,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDI6NTg6MTAgMDAwMDAwMQ==',25,'2019-03-01',22,'6.57451526,124.87703848','2019-02-12','Unnamed Road, Lutayan, Sultan Kudarat, Philippines'),(147,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDM6MDk6MTIgMDAwMDAwMw==',27,'2019-03-01',22,'6.57451382,124.87703924','2019-02-12','Unnamed Road, Lutayan, Sultan Kudarat, Philippines'),(148,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDI6NTE6MjcgMDAwMDAwMQ==',29,'2019-03-01',22,'6.57451946,124.87706585','2019-02-12','Unnamed Road, Lutayan, Sultan Kudarat, Philippines'),(149,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDM6MTQ6MzEgMDAwMDAwMg==',23,'2019-03-01',22,'6.57453097,124.87705882','2019-02-12','Unnamed Road, Lutayan, Sultan Kudarat, Philippines'),(150,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzE=',25,'2019-02-13',23,'6.636186666666667,124.6063','2019-02-13','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(151,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzI=',22,'2019-02-13',23,'6.636186666666667,124.6063','2019-02-13','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(152,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzM=',19,'2019-02-13',23,'6.636151666666666,124.60629666666667','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(153,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzQ=',19,'2019-02-13',23,'6.636016666666666,124.60629499999999','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(154,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzU=',15,'2019-02-13',23,'6.63602,124.60627166666667','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(155,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzY=',18,'2019-02-13',23,'6.636021666666666,124.60630666666665','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(156,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzc=',19,'2019-02-13',23,'6.636038333333333,124.60626166666667','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(157,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzg=',18,'2019-02-13',23,'6.636161666666667,124.60623500000001','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(158,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwMzk=',19,'2019-02-13',23,'6.636328333333334,124.60617666666667','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(159,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDA=',17,'2019-02-13',23,'6.636328333333334,124.60616333333334','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(160,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDE=',15,'2019-02-13',24,'6.636143333333333,124.606305','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(161,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDI=',26,'2019-02-13',24,'6.636216666666667,124.60632666666667','2019-02-13','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(162,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDM=',17,'2019-02-13',24,'6.636219999999999,124.60631333333335','2019-02-13','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(163,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDQ=',18,'2019-02-13',24,'6.636219999999999,124.60631333333335','2019-02-13','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(164,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDU=',28,'2019-02-13',24,'6.636336666666667,124.6063','2019-02-13','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(165,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDY=',12,'2019-02-13',24,'6.636121666666666,124.606315','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(166,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDc=',15,'2019-02-13',24,'6.636130000000001,124.60632166666667','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(167,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDg=',15,'2019-02-13',24,'6.636070000000001,124.60627500000001','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(168,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNDk=',17,'2019-02-13',24,'6.636083333333333,124.60626333333333','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(169,'SEFMQUxHT0FUUzIwMTktMDItMDkgMTM6MjI6NTQgMDAwMDAwNTA=',15,'2019-02-13',24,'6.636115000000001,124.60625','2019-02-13','Don Buencamino Avenue, Isulan, Sultan Kudarat, Philippines'),(170,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDM6MTM6MDAgMDAwMDAwMw==',18,'2019-02-14',13,'6.6679491,124.6302091','2019-02-14','Isulan - Tacurong City Rd, Tacurong City, Sultan Kudarat, Ph'),(171,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDM6MDk6MTIgMDAwMDAwMg==',25,'2019-02-21',13,'6.6342,124.60913166666666','2019-02-21','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(172,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDM6MDk6NTIgMDAwMDAwMw==',25,'2019-02-21',13,'null','2019-02-21',''),(173,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDM6MTQ6MzEgMDAwMDAwMw==',25,'2019-02-21',13,'6.634241666666666,124.60913000000001','2019-02-21','Unnamed Road, Isulan, Sultan Kudarat, Philippines'),(174,'SEFMQUxHT0FUUzIwMTktMDItMTIgMDQ6Mjc6MDEgMDAwMDAwMQ==',16,'2019-02-25',26,'6.6420216666666665,124.65428333333332','2019-02-25','Unnamed Road, Tacurong City, Sultan Kudarat, Philippines');

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
 `weight` int(4) ,
 `whenToSold` date ,
 `farmerId` int(6) ,
 `gps` varchar(60) ,
 `dateAdded` date ,
 `actualAddress` varchar(60) ,
 `farmerName` varchar(60) ,
 `farmerAddress` varchar(60) ,
 `credentialId` int(6) 
)*/;

/*View structure for view admin_view */

/*!50001 DROP TABLE IF EXISTS `admin_view` */;
/*!50001 DROP VIEW IF EXISTS `admin_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`h7tvhir4i4y6`@`49.151.72.18` SQL SECURITY DEFINER VIEW `admin_view` AS select `admin_table`.`adminId` AS `adminId`,`admin_table`.`credentialId` AS `credentialId`,`credential_table`.`username` AS `username`,`credential_table`.`password` AS `password` from (`admin_table` join `credential_table` on((`admin_table`.`credentialId` = `credential_table`.`credentialId`))) */;

/*View structure for view farmer_view */

/*!50001 DROP TABLE IF EXISTS `farmer_view` */;
/*!50001 DROP VIEW IF EXISTS `farmer_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`h7tvhir4i4y6`@`49.151.72.18` SQL SECURITY DEFINER VIEW `farmer_view` AS select `farmer_table`.`farmerId` AS `farmerId`,`farmer_table`.`farmerName` AS `farmerName`,`farmer_table`.`farmerAddress` AS `farmerAddress`,`farmer_table`.`credentialId` AS `credentialId`,`credential_table`.`username` AS `username`,`credential_table`.`password` AS `password` from (`farmer_table` join `credential_table` on((`farmer_table`.`credentialId` = `credential_table`.`credentialId`))) */;

/*View structure for view livestock_view */

/*!50001 DROP TABLE IF EXISTS `livestock_view` */;
/*!50001 DROP VIEW IF EXISTS `livestock_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`h7tvhir4i4y6`@`49.151.72.18` SQL SECURITY DEFINER VIEW `livestock_view` AS select `livestock_table`.`liveStockId` AS `liveStockId`,`livestock_table`.`liveStockQRId` AS `liveStockQRId`,`livestock_table`.`weight` AS `weight`,`livestock_table`.`whenToSold` AS `whenToSold`,`livestock_table`.`farmerId` AS `farmerId`,`livestock_table`.`gps` AS `gps`,`livestock_table`.`dateAdded` AS `dateAdded`,`livestock_table`.`actualAddress` AS `actualAddress`,`farmer_table`.`farmerName` AS `farmerName`,`farmer_table`.`farmerAddress` AS `farmerAddress`,`farmer_table`.`credentialId` AS `credentialId` from (`livestock_table` join `farmer_table` on((`livestock_table`.`farmerId` = `farmer_table`.`farmerId`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;