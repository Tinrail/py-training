-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: evan
-- ------------------------------------------------------
-- Server version	5.7.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `evan`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `evan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `evan`;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sex` char(6) DEFAULT NULL,
  `age` int(4) NOT NULL,
  `vehicle_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `produce_id` (`vehicle_id`) USING BTREE,
  KEY `vehicle` (`vehicle_id`) USING BTREE,
  KEY `vehicle_id` (`vehicle_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'dingrui','male',38,2),(2,'chenxi','female',35,11),(3,'chenyoumin','male',59,4),(4,'zhangping','female',59,4),(5,'jiangshulan','female',64,14),(6,'dingrenchang','male',69,13),(7,'dingbao','male',1,9);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oil`
--

DROP TABLE IF EXISTS `oil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oil` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `brand` varchar(10) NOT NULL,
  `model` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oil`
--

LOCK TABLES `oil` WRITE;
/*!40000 ALTER TABLE `oil` DISABLE KEYS */;
INSERT INTO `oil` VALUES (1,'CASTROL','0W30'),(2,'CASTROL','0W40'),(3,'CASTROL','5W30'),(4,'CASTROL','5W40'),(5,'SHELL','0W30'),(6,'SHELL','0W40'),(7,'SHELL','5W30'),(8,'SHELL','5W40'),(9,'SHELL','0W20'),(10,'MOBIL','0W20'),(11,'MOBIL','0W30'),(12,'MOBIL','0W40'),(13,'MOBIL','5W30'),(14,'MOBIL','10W40'),(15,'MOBIL','15W40');
/*!40000 ALTER TABLE `oil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oil_filter`
--

DROP TABLE IF EXISTS `oil_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oil_filter` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) NOT NULL,
  `model` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oil_filter`
--

LOCK TABLES `oil_filter` WRITE;
/*!40000 ALTER TABLE `oil_filter` DISABLE KEYS */;
INSERT INTO `oil_filter` VALUES (1,'Bosch','0986AF0063'),(2,'Bosch','0986AF0255'),(3,'Bosch','0986AF0161');
/*!40000 ALTER TABLE `oil_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `model` char(30) NOT NULL,
  `version` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `size` varchar(50) NOT NULL,
  `oil_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `oil_id` (`oil_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'peugeot','308',NULL,'The All-New Wrangler Sahara has been designed to deliver a premium experience with superior materials and craftsmanship throughout.','white','60*80*120',11),(2,'jeep','compass2018',NULL,'The All-New Wrangler Sahara has been designed to deliver a premium experience with superior materials and craftsmanship throughout.','red','1800*1200*1500',6),(3,'jeep','Wrangler','SAHARA','The All-New Wrangler Sahara has been designed to deliver a premium experience with superior materials and craftsmanship throughout.','black','1800*1200*1500',2),(4,'jeep','Renegade','ALTITUDE',' Renegade,Compact and ready for anything, the 2018 Renegade Sport combines power and value in one exciting package.','Anvil','1700*1600*1754',5),(5,'chevrolet','CAMARO','RS','There’s nothing quite like the thrill of getting behind the wheel of a sports car.','SATIN STEEL METALLIC','4786*1897*1357',1),(8,'chevrolet','MALIBU','HYBRID','the 2018 Malibu is the car that doesn’t compromise. It unites a passion for driving with exceptional efficiency.','SANDY RIDGE METALLIC','4923*1477*1854',1),(9,'TOYOTA','TACOMA','SR5','Forge your own path and seek out tougher roads. With Tacoma TRD Pro, no trail is left unchallenged. ','MIDNIGHT BLACK METALLIC','212-226″ L x 74-75″ W x 71-72″ H',10),(10,'TOYOTA','RAV4','XLE premium','The all-new 2019 RAV4 ignites your desire to explore. With a variety of models to choose from that are as unique as you are.','SILVER SKY METALLIC','4605*1845*1715',9),(11,'HONDA',' Accord','EX-L','In 1976, the first Accord was introduced. For a humble hatchback, it was a runaway success—winning over car buyers with its simple design and fuel-efficiency.','SAN MARINO RED','4605*1845*1715',13),(12,'HONDA','CIVIC','Tourer','A quick-shifting 6-Speed Manual Transmission. ','AEGEAN BLUE METALLIC','4500*1770*1480',1),(13,'NISSAN','ARMADA','SL','With Armada available Automatic Emergency Braking, and features like Intelligent Lane Intervention and Intelligent Rear View Mirror, you will enjoy driving with more confidence and freedom.','whitte','5095*1975*1930',9),(14,'NISSAN','MAXIMA','SR','Transform your drive from elevated to exhilarating at the touch of a button. Feel 300 horsepower push you deeply into a sculpted sport seat.','RAD','4903*1860*1436',11),(16,'NISSAN','VERSA','SV','Bring the whole crew along in Versa Note, with room for five, generous cargo space, and available Nissan Intelligent Mobility tech that keeps you connected and confident. ','black','4901*1850*1447',11);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-14 21:24:46
