
drop database if exists usermanager;
create database userManager;
use userManager;

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` varchar(20) NOT NULL,
  `NAME` varchar(160) NOT NULL,
  `YEAR_OLD` int(11) NOT NULL,
  
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*!40101 SET @saved_cs_client     = @@character_set_client */;