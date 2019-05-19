
drop database if exists usermanager;
create database userManager;
use userManager;

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` varchar(20) NOT NULL PRIMARY KEY,
  `NAME` varchar(160) NOT NULL,
  `PHONE_NUMBER` int(11) NOT NULL,
  `EMAIL` VARCHAR(100) NOT NULL,
  `BIRTHDAY` CHAR(10) NOT NULL,
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET @saved_cs_client     = @@character_set_client */;


DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `COUNTRY_ID` varchar(10) NOT NULL PRIMARY KEY,
  `COUNTRY_NAME` varchar(160) NOT NULL,
  UNIQUE KEY `COUNTRY_ID_UNIQUE` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET @saved_cs_client     = @@character_set_client */;