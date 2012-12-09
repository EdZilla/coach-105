-- MySQL dump 10.10
--
-- Host: localhost    Database: coach_acegi2_prod
-- ------------------------------------------------------
-- Server version	5.0.27

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
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `MD5SUM` varchar(32) default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  `COMMENTS` varchar(255) default NULL,
  `TAG` varchar(255) default NULL,
  `LIQUIBASE` varchar(10) default NULL,
  PRIMARY KEY  (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime default NULL,
  `LOCKEDBY` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
CREATE TABLE `athlete` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `login` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `postal_address` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `athlete`
--

LOCK TABLES `athlete` WRITE;
/*!40000 ALTER TABLE `athlete` DISABLE KEYS */;
INSERT INTO `athlete` VALUES (1,0,'2008-02-10 02:47:00','1963-10-28 08:10:00','ejy@summitbid.com','M','edderd','ed','gr00vy','3021 S. Xeric Ct. Denver, CO 80231'),(2,0,'2008-02-14 16:10:00','2000-11-02 10:10:00','aidan@summitbid.com','M','aidan','Aidan','aidan','3021 South Xeric Ct.'),(3,0,'2008-02-14 16:11:00','2004-06-24 09:15:00','luka@summitbid.com','M','luka','Luka','luka','3021 South Xeric Ct.');
/*!40000 ALTER TABLE `athlete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athlete_ref`
--

DROP TABLE IF EXISTS `athlete_ref`;
CREATE TABLE `athlete_ref` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `athlete_id` bigint(20) NOT NULL,
  `class_period_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKD53EBA1330B03D3A` (`athlete_id`),
  KEY `FKD53EBA13BA417F8B` (`class_period_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `athlete_ref`
--

LOCK TABLES `athlete_ref` WRITE;
/*!40000 ALTER TABLE `athlete_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `athlete_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_show` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `user_real_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `last_updated_workout_id` bigint(20) default NULL,
  `last_updated_meal_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,285,'','ejy@SummitBid.com','\0','','e9c4bb7e20067b5707c2c1c7375f549e','Ed Young','ed',132,256),(6,3,'','aidan@summitbid.com','','','3f75f31f946bc04d8f781fb155d2b17e','aidan','aidan',NULL,NULL),(7,1,'','steve@myplaceinparadise.com','','','c4fe4c936835156672a5ad76e907b917','Steve Miller','steve',NULL,NULL),(8,1,'','Alan.McQueen@dcsdk12.org','','','eaad5f30ece302b762fb70672a1728f4','Alan McQueen','alan',NULL,NULL),(13,2,'','daddyconan@yahoo.com','','','15c6d8e89899b0dc606d2498d102bd71','Mike McDanial','daddyconan',59,NULL),(14,1,'','gramos112@gmail.com','','','a0dc6df8f07627f1f63b1b9394dcd200','George Ramos','AbrahamRa',NULL,NULL),(15,1,'','velopete@hotmail.com','','','bfda0e744a32cfc10b43fc328e4b60b5','Pete','velopete',NULL,NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_meal`
--

DROP TABLE IF EXISTS `auth_user_meal`;
CREATE TABLE `auth_user_meal` (
  `auth_user_meals_id` bigint(20) default NULL,
  `meal_id` bigint(20) default NULL,
  KEY `FK4BCD6DE0380EAAFA` (`meal_id`),
  KEY `FK4BCD6DE0312C3FA` (`auth_user_meals_id`),
  CONSTRAINT `FK4BCD6DE0312C3FA` FOREIGN KEY (`auth_user_meals_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `FK4BCD6DE0380EAAFA` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_meal`
--

LOCK TABLES `auth_user_meal` WRITE;
/*!40000 ALTER TABLE `auth_user_meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bio_metrics`
--

DROP TABLE IF EXISTS `bio_metrics`;
CREATE TABLE `bio_metrics` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `athlete_id` bigint(20) default NULL,
  `bicep` int(11) NOT NULL,
  `chest` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `height` int(11) NOT NULL,
  `thigh` int(11) NOT NULL,
  `waist` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK40E05C8C30B03D3A` (`athlete_id`),
  KEY `FK40E05C8C4F96694E` (`athlete_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bio_metrics`
--

LOCK TABLES `bio_metrics` WRITE;
/*!40000 ALTER TABLE `bio_metrics` DISABLE KEYS */;
INSERT INTO `bio_metrics` VALUES (1,0,1,20,45,'2008-02-14 16:12:00',66,30,36,199),(2,0,1,15,42,'2008-02-19 06:43:00',66,20,36,195);
/*!40000 ALTER TABLE `bio_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_period`
--

DROP TABLE IF EXISTS `class_period`;
CREATE TABLE `class_period` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `end_date` datetime default NULL,
  `location` varchar(255) NOT NULL,
  `max_athletes` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime default NULL,
  `start_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_period`
--

LOCK TABLES `class_period` WRITE;
/*!40000 ALTER TABLE `class_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_period_athlete`
--

DROP TABLE IF EXISTS `class_period_athlete`;
CREATE TABLE `class_period_athlete` (
  `class_period_athletes_id` bigint(20) default NULL,
  `athlete_id` bigint(20) default NULL,
  KEY `FK5FE03AE830B03D3A` (`athlete_id`),
  KEY `FK5FE03AE8DECEF888` (`class_period_athletes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_period_athlete`
--

LOCK TABLES `class_period_athlete` WRITE;
/*!40000 ALTER TABLE `class_period_athlete` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_period_athlete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_period_auth_user`
--

DROP TABLE IF EXISTS `class_period_auth_user`;
CREATE TABLE `class_period_auth_user` (
  `class_period_athletes_id` bigint(20) default NULL,
  `auth_user_id` bigint(20) default NULL,
  KEY `FKC441DAEBC0EDD82B` (`auth_user_id`),
  KEY `FKC441DAEBDECEF888` (`class_period_athletes_id`),
  CONSTRAINT `FKC441DAEBC0EDD82B` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `FKC441DAEBDECEF888` FOREIGN KEY (`class_period_athletes_id`) REFERENCES `class_period` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_period_auth_user`
--

LOCK TABLES `class_period_auth_user` WRITE;
/*!40000 ALTER TABLE `class_period_auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_period_auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `base_elevation` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `distance` float NOT NULL,
  `location` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `map` varchar(255) default NULL,
  `profile` varchar(255) default NULL,
  `max_elevation` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,6,0,'none',0,'none','none','summitbid_logo.gif',NULL,NULL),(31,0,5200,'Rode from CMC up Sunset route to Platte, REI, CC to home.',27,'denver','CMC to Home via Sunset, Platte, CC','Commute CMC to Home via Platte and Cherry Creek 6-9-2008.png','Commute CMC to Home via Platte and Cherry Creek 6-9-2008, Elevation - Distance.png',5600),(2,3,5500,'Home, Tamarac, Rosemary Way, Princeton, Quincy, HLC, CMC',15,'Denver/Greenwood Village/Centennial','Home to CMC via Tamarac, Quincy, HLC','Commuting - Home to CMC via Tamarac, Quincy, Highline 8-21-2007.jpg','Profile Home to CMC via DTC, Rosemary Way, Princeton, Quincy, HLC 8-21-2007, Elevation - Time.png',5680),(4,2,5555,'View of trail from CMC to Platte via Lee gulch',3,'centennial ','Lee Gulch ','','',5666),(5,2,6300,'Great hike for kids. Start at parking lot and approach to Morrison Slide trail and go up. The climb is short and once at the top it\'s beautiful. Traverse the top and head down the steep and then return on Red Rocks trail. ',5,'Morrison Colorado','Mathews-Winters Morrison Slide','My Activities - Mathews Winters open space park 8-11-2007-2.jpg','My Activities - Mathews Winters open space park 8-11-2007, Elevation - Distance.jpg',6800),(18,1,5550,'I tried to stay off the road and caused myself alot of grief. I should have just gotten on the right traffic lane and dealt with it. Instead I was haveing to wait for traffic and lights in the left lane and sidewalk all the time. ',6.43,'Greenwood Village/Centennial','Village to CMC via Orchard','Village to CMC direct via Orchard 5-12-2008.png','Village to CMC direct via Orchard 5-12-2008, Elevation - Time.png',5720),(7,0,5555,'Rode out and returned on some access road instead of the C470 trail',18,'Centennial','CMC to Chatfield RT with alt return','CMC to Chatfield and back-lunchtime- 9-14-2007.jpg',NULL,NULL),(8,0,5555,'8.5 mile loop',9,'centennial','CMC to CMC loop via HLC and CO blvd','Cycling - CMC to CMC loop via HL and CO 10-9-2007.jpg',NULL,NULL),(9,0,5555,'Detail of roads where Big Dry Creek meets the Platte trail',10,'Centennial','Detail of Platte turn off to Big Dry Creek trail','Road - E Turn off of Platte toward Big Dry Creek 10-24-2007.jpg',NULL,NULL),(10,0,5555,'CMC RT: CMC, 470, Platte, Big Dry Creek, misc roads, Colorado Blvd CMC',20,'Littleton','CMC RT: CMC, 470, Platte, Big Dry Creek, misc roads, Colorado Blvd CMC','Road - CMC RT to 470 to Platte to Big Dry Creek to Highline misc roads 10-24-2007.jpg',NULL,NULL),(11,0,5555,'CMC to HLC, Sunset, Sherman, Centennial, Lehow, Big Dry Creek, Platte',10,'Littleton','Detail of Sunset to Platte route','Commute-Highline at Sunset to Platte via Sherman-Centennial-Lehow-BigDry Creek.jpg',NULL,NULL),(12,0,5555,'CMC RT: Sunset, Platte, south to Lee Gulch, CMC',20,'Centennial','CMC RT: Sunset, Platte, south to Lee Gulch, CMC','Bike Path - CMC to Sunset to N. Big Dry Creek to Centennial to Platte to Lee Gulch to HL to Ralph Schomp  RT 7-13-2007.jpg',NULL,NULL),(13,0,5555,'CMC to Village via HLC, Quincy, DTC, CCH, Village',14,'Greenwood Village/Centennial','CMC to Village via HLC, Quincy, DTC, CCH, Village','CMC to Village via HLC, Quincy, DTC, CCHS. 4-18-2008.png',NULL,NULL),(14,0,5555,'Village to CMC via Belleview, Holly',7,'Greenwood Village/Centennial','Village to CMC via Belleview, Holly','Village to CMC via Belleview, Holly. 4-18-2008.png',NULL,NULL),(15,0,5555,'Belleview and Sante Fe to CMC via Lee Gulch',9,'Littleton','Belleview and Sante Fe to CMC via Lee Gulch','Commuting Belleview and Sante Fe to CMC via Platte, Lee Gulch 4-14-2008.png',NULL,NULL),(16,3,5300,'Took a detour to look for Dave D\'s office.',20,'Centennial','CMC RT: Chatfield res','Road CMC to Chatfield RT 4-15-2008.png','Profile Road CMC to Chatfield RT 4-15-2008, Elevation - Time.png',5800),(17,0,5555,'Home to CMC via Tamarac, Rosemary Way, Princeton, Quincy, Holly, Dry Creek, CMC',8,'Denver to Centennial','Home to CMC via Tamarac, Rosemary Way, Princeton, Quincy, Holly, Dry Creek, CMC','Home to CMC via DTC, Rosemary Way, Princeton, Quincy, Holly, Dry Creek 3-26-2008.png',NULL,NULL),(19,3,5500,'Sucks. Riding along Belleview is a nightmare. 8.04 miles ',8.04,'Centennial/GreenwoodVillage','Commute CMC to Village via Dexter/Belleview','Commuting CMC to Village via Dexter-Belleview 4-24-2008.png','Profile CMC to Village via Dexter-Belleview Elevation-Time 4-24-2008.png',NULL),(20,2,5300,'CMC to Kipling/Kentucky',16.5,'Centennial/Lakewood','CMC to Gordon\'s old house','Road CMC to Gordon\'s house and back 9-7-2007.png','Profile CMC to Gordon\'s House and Back 9-7-2007, Elevation - Time.png',NULL),(30,0,5250,'parked at Slaven Elementary and rode down the Platte to C470 to Kipling and then up Deer Creek.',26,'Deer Creek','Deer Creek from Slaven Elementary','Denver to Deer Creek Canyon 6-8-2008.png','Denver to Deer Creek Canyon 6-8-2008, Elevation - Distance.png',7400),(21,4,5260,'Rode from home to Redrocks park. Route was was west on Dartmouth, south on Platte, west on Bear Creek to Kipling. Then north on Kipling to Jewel and then over the Hogback and across highway 8 to RedRocks park. Lots of activity at Redrocks. ',50,'Denver to Morrison','Home to Redrocks and back','Home to Red Rocks and back 4-27-2008.png','Home to Red Rocks and back 4-27-2008, Elevation - Time.png',6486),(22,2,5280,'along Cherry Creek bike path mostly',14,'Denver','Home to Wash Park','Home to Wash Park and back 5-11-2008.png','Home to Wash Park and back 5-11-2008, Elevation - Distance.png',5540),(23,2,5460,'CMC to Village direct, then rode around Cherry Creek res. Stopped at Bicycle Village',16.5,'Centennial, Denver','CMC to Village, Cherry Creek Res to home','CMC to Village then around the CC Reservior 5-9-2008.png','CMC to Village then rode around the CC Reservior 5-9-2008, Elevation - Distance.png',5720),(24,0,5480,'Home to CC path to CC Dam path, to Village',11.5,'Greenwood Village/Centennial','Home to Village Then CMC via CC Dam Bike path, Orchard','Home to Village and then To CMC 5-9-2008.png','Home to Village and then To CMC 5-9-2008, Elevation - Distance.png',5720),(25,0,5680,'half mile walk around CMC',0.5,'Comcast CMC, Centennial','walk around CMC','Walk around CMC 5-21-2008.png','',5700),(26,0,5540,'Village to CMC via DTC, Orchard, Holly neighborhood.',6.1,'Greenwood Village/Centennial','Village to CMC via DTC, Orchard, Holly ','Commute Village to CMC 5-21-2008.png','Commute Village to CMC 5-21-2008, Elevation - Distance.png',5720),(27,1,5500,'pulled luka via 225 bike path',5.5,'denver','Home to Village via i225 bike path','Pulled Luka in trailer to Village 5-22-2008.png','Pulled Luka in trailer to Village 5-22-2008, Elevation - Distance.png',5680),(28,2,5480,'was on the way to pick up luka and got a flat. Jay martin picked him up and I rode to his house. Had pizza',14.5,'Centennial/Denver','cmc to Jay Martin\'s house','Commute CMC to Jay Martin\'s House 5-21-2008.png','Commute CMC to Jay Martin\'s House 5-21-2008, Elevation - Distance.png',5660),(29,0,2000,'On Charlotte side of the Continental divide',4,'China Creek, NC','China Creek, NC','MTB-China Creek-NC-6-1-2008.png','MTB-China Creek-NC 6-1-2008, Elevation - Distance.png',3750),(32,1,6050,'From parking lot to the Gazebo',2.6,'Mt. Falcon/Jeffco','Mt Falcon Gazebo Grunt','Mt Falcon Gazebo Grunt 6-11-2008.png','Mt Falcon Gazebo Grunt 6-11-2008, Elevation - Distance.png',7500),(33,1,7250,'Loop up top of Mt. Falcon. In this ride I started the GPS at the Parmalee Trail trailhead below the upper parking lot, and then stopped at the gazebo before the final descent.',4.6,'Mt. Falcon/Jeffco','Parmalee Trail','Parmalee Trail 6-11-2008.png','Parmalee Trail 6-11-2008, Elevation - Distance.png',7750),(34,0,6050,'from Gazebo to parking lot',2.6,'Mt. Falcon/Jeffco','Mt Falcon Descent','Mt Falcon Descent 6-11-2008.png','Mt Falcon Descent 6-11-2008, Elevation - Distance.png',7500),(35,2,5500,'wrong turn at Twin Forks. I turned north and went to Tiny Town. Instead I should have turned south. I ended up riding down the shoulder of 285 and then on the C470 trail back to Kipling. Could have been  worse I guess. ',43,'Jeffco','Highgrade wwrong turn at Twin Forks','HighGrade loop with Wrong Turn 6-15-2008.png','HighGrade loop with Wrong Turn 6-15-2008, Elevation - Distance.png',8500),(36,0,5200,'with Harvey Gish and Daryll Loud',49,'Denver','Cappucino Loop','Cappucino Loop Shortcutted at Big Dry Creek off of Platte 6-14-2008.png','Cappucino Loop Shortcutted at Big Dry Creek off of Platte 6-14-2008, Elevation - Distance.png',5500),(37,0,6100,'Rode up to Red Mesa and did two CW loops, then CCW around Plymouth Mt and down to the parking lot.',11.46,'Jeffco','Deer Creek Red Mesa Double, Plymouth Mt','Deer Creek Red Mesa Plymouth Mt 6-18-2008 - Medium.png','Deer Creek Red Mesa Plymouth Mt 6-18-2008, Elevation - Distance.png',7450),(38,0,5500,'long path except for shortcuts at Colorado.',20,'Denver/Centennial','CMC to Home via HLC longpath','CMC to Home via HLC with shortcuts 3-26-2008.png','',5600),(39,1,5500,'Complicated route down South Yosemite and through neighborhoods. Goes over Englewood dam',6.67,'Greenwood Village/Centennial','Village to CMC via S. Yosemite','commute village to cmc via s. Yosemite route 6-20-2008.png','commute village to cmc via s. Yosemite route 6-20-2008, Elevation - Distance.png',5600),(40,0,5500,'Click here to enter description',5.56,'Denver/Greenwood Village','Home to Village via 225 bike path','Commute Home to Village pulling kids in trailer 6-20-2008.png','Commute Home to Village pulling kids in trailer 6-20-2008, Elevation - Distance.png',4600),(41,0,5500,'view of street names',6.67,'Greenwood Village/Centennial','Village to CMC via S. Yosemite DETAIL','commute village to cmc via s. Yosemite route - detail 6-20-2008.png','',5600),(42,0,5460,'Click here to enter description',4,'Denver','Home to CC Res Beach','Riding with Kids-Home to CC Res beach. 6-21-2008.png','Riding with Kids-Home to CC Res beach. 6-21-2008, Elevation - Distance.png',5660),(43,2,5550,'40 miles. Up Deer Creek and Highgrade, Conifer, Aspen Park, right at N Turkey Creek, right at Twin Forks, left at the firestation to return on Deer Creek',40,'Jeffco','Highgrade loop ','Highgrade loop 7-2-2008.png','Highgrade loop 7-2-2008, Elevation - Distance.png',8550),(44,2,7000,'about 35 miles up. I rode to mile 8 (out of 14) but got turned back because of the  Hailstorm from Hell. ',35,'Jeffco','Evergreen to Mt. Evans','Mt. Evans Ascent from Evergreen 7-6-2008.png','Mt. Evans Ascent from Evergreen 7-6-2008, Elevation - Distance.png',14277),(46,1,7833,'Evergreen to Avon: 120 miles',120,'Evergree to Avon Colorado','Triple Bypass 2008','Triple Bypass 2008 7-12-2008.png','Triple Bypass 2008 7-12-2008, Elevation - Distance.png',12000),(47,3,5150,'rode down Wads, down Little Dry Creek. Then down Pecos, but had to turn back due to a stopped coal train. The rest of the ride was first through nasty industrial and scary part of Platte trail, then Cherry Creek path to home.',30,'Broomfield/Denver','Bike from Vidiom home','Vidiom to home via nasty industrial part of Denver 9-11-2008.png','Vidiom to home via nasty industrial part of Denver 9-11-2008, Elevation - Distance.png',5500),(48,0,5100,'Click here to enter description',30,'Golden/Denver','Gordons house to Lowry','Gordon\'s house to Logan School via Clear Creek and Sand Creek 9-7-2008.png','Gordon\'s house to Logan School via Clear Creek and Sand Creek 9-7-2008, Elevation - Distance.png',5600);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `MD5SUM` varchar(32) default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  `COMMENTS` varchar(255) default NULL,
  `TAG` varchar(255) default NULL,
  `LIQUIBASE` varchar(10) default NULL,
  PRIMARY KEY  (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime default NULL,
  `LOCKEDBY` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,0,NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devel_issue`
--

DROP TABLE IF EXISTS `devel_issue`;
CREATE TABLE `devel_issue` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `severity` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devel_issue`
--

LOCK TABLES `devel_issue` WRITE;
/*!40000 ALTER TABLE `devel_issue` DISABLE KEYS */;
INSERT INTO `devel_issue` VALUES (1,0,'biometrics can\'t have null values','BioMetrics','BioMetric null values',3,'open'),(2,1,'deleting objects throws','Food','object deletion throws',5,'closed'),(3,1,'not-null property references a null or transient value: Food.description; ','Food','can\'t delete Food',5,'RESOLVED'),(31,0,'acegi plugin provides user role support','User','user roles',5,'OPEN'),(5,0,'log4j warns not configured correctly','config','log4j configuration',4,'open'),(6,1,'contact us email','maintenance','contact us',5,'open'),(7,2,'devel issue status enums','DevelIssue','issue status enum',5,'RESOLVED'),(8,1,'user superclass,coach, athlete subclasses','Athlete','User subclassing',5,'RESOLVED'),(10,3,'org.springframework.orm.hibernate3.HibernateObjectRetrievalFailureException: No row with the given identifier exists: [NutritionData#1]; nested exception is org.hibernate.ObjectNotFoundException: No row with the given identifier exists: [NutritionData#1]','FoodRef','FoodRef exception upon create',5,'CLOSED'),(11,1,'Can\'t click on FoodRef','FoodRef','FoodRef exception when clicked',5,'closed'),(12,2,'database maintenance utility. Probably us liquibase. Dbmigrate had issues.','config','gorm utilities',3,'open'),(13,0,'enumerations in grails','','enumerations howto',5,'open'),(14,2,'constraint closure in class should configure the order in the list view, but doesn\'t','constraint doesn\'t enforce ordering of attributdes','grails',5,'CLOSED'),(15,0,'Devel issue tree view','DevelIssue','DevelIssue tree view',5,'open'),(16,1,'button to add new food when in food ref','FoodRef','new food button on FoodRef',5,'closed'),(17,0,'increase list length','All','increasd list length',5,'open'),(18,0,'Use the flash object to return from the creation of an new food or exercise','ExerciseRef and FoodRef','flash object for redirect return',5,'open'),(19,1,'deleting doesn\'t work','all','delete does nothing',5,'closed'),(20,0,'use flash scope when creating a food from food reference and from meal creation','Meal','use flash scope',5,'OPEN'),(21,1,'implement inline edit like in dgg.\nGot this working in DevelIssue view, but not in other domains. Also some problems with saving. ','in description fields.','inline edit',5,'OPEN'),(22,0,'When listing a domain, provide a show all instead of the pageinate view','DevelIssue, Workout, meal','show all option',5,'OPEN'),(23,1,'When entering domain data from another controller, the controller context should be passed in so the user doesn\'t have to select the Athlete for example.','all','controller context persistance',3,'OPEN'),(24,2,'When creating an exercise ref, it should know what workout it is belongs to, so the user doesn\'t have to select a workout. \nSame for meal, and Athlete, etc','Workout, exercise ref.','New Workout object session persistance',5,'OPEN'),(25,0,'save workout when user selects add Exercise Ref','workout','auto save workout upon ExRef create.',2,'OPEN'),(26,0,'The \"mail the development team\" link extends into the milestones/roadmap part','index.gsp','limit contact us string',5,'OPEN'),(27,2,'displays only \"saving\". Wtf. Seems to work for new devel issues, but some fail. ','','cant save editInPlace',5,'OPEN'),(28,2,'follow article on securing grails app.\nhttp://www.infoq.com/articles/grails-acegi-integration\nNOTE: The article describes the integration of several new user related domains which will change the app architecture considerably. ','security','integrate acegi plugin',2,'OPEN'),(29,1,'in Workout, editInPlace only implemented in list view, but it can\'t be saved. Displays \"saving...\" but fails with no error.\n\nThis all works in DevelIssue.','workout','editInPlace won\'t save in Workout',5,'OPEN'),(30,1,'acegi plugin will work well for this. Also provides roles.','user','secure user login',5,'OPEN'),(32,0,'So they can be punch listed','DevelIssue','pretty print devel issues',2,'OPEN'),(33,0,'When registering a user, the acegi register controller fails because the captcha object is null. The one from the user form is good, but it is compared with the one from the captcha generator, but it\'s null and the registration fails','acegi','acegi registration broken',5,'OPEN'),(34,0,'throws exception relating to dates','User/AuthUser','UserController can\'t update user1',5,'OPEN'),(35,0,'when a food is deleted, any foodRefs must be deleted too. If not you get a weird error about nutrition data missing rows. ','food, foodRef, delete','delete food must delete foodRefs too',5,'OPEN'),(36,0,'Create a superclass called activity and subclass Exercise','Exercise','subclass Exercise from Activity domain',1,'OPEN'),(37,0,'for backup, and restore as well as manipulation','Workout','export workout to xml',3,'OPEN'),(38,0,'Human readable format','DevelIssue','export devel issues as report',3,'OPEN'),(39,0,'meals and workouts should list from most recent first. ','meal, workout','default lists should be in reverse chronological order',5,'OPEN'),(40,0,'example: When choosing from the food dropdown list in the foodRef create action, the food items should be listed in order of frequency of occurence.','food, exercise','lists based on frequency of reference occurence',5,'OPEN'),(41,0,'since we can\'t migrate easily, a way to read in xml and populate the date','app','load coach data from xml',5,'OPEN'),(42,0,'you get a reference integrity error from Equipment ref (hibernate','Exercise, Equipment','can\'t delete exercise',5,'OPEN');
/*!40000 ALTER TABLE `devel_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devel_issue_devel_issue`
--

DROP TABLE IF EXISTS `devel_issue_devel_issue`;
CREATE TABLE `devel_issue_devel_issue` (
  `devel_issue_issues_id` bigint(20) default NULL,
  `devel_issue_id` bigint(20) default NULL,
  KEY `FKC32C49EDB05D34F4` (`devel_issue_issues_id`),
  KEY `FKC32C49EDBC1F6E81` (`devel_issue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devel_issue_devel_issue`
--

LOCK TABLES `devel_issue_devel_issue` WRITE;
/*!40000 ALTER TABLE `devel_issue_devel_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `devel_issue_devel_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet`
--

DROP TABLE IF EXISTS `diet`;
CREATE TABLE `diet` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diet`
--

LOCK TABLES `diet` WRITE;
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;
/*!40000 ALTER TABLE `diet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `cost` float NOT NULL,
  `date_purchased` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,0,850,'2008-03-16 19:23:00','Specialized Tricross 2006','Cyclocross bike',NULL),(8,1,0,'2008-04-03 04:20:00','hold shoulder length. Different colors for different resistances.','rubber bands',NULL),(9,0,1250,'2005-04-03 21:35:00','2004 Frame, parts from various other C\'Dale bikes','Canondale Jekyll',NULL),(10,0,850,'2002-04-03 21:38:00','2002 (or so) Mod 3.0. Shimano 105 all the way around','K2 Road Bike',NULL),(11,0,0,'2007-04-03 21:46:00','From Pete Quesada. Nice mtb converted to a SS','Canondale Single speed MTB',NULL),(12,0,0,'2006-04-03 21:47:00','Frame from Velo Swap, parts from various, including my old \'96 Stumpjumper that was destroyed by an Alaskan Bulldozer','Ralleigh Frankenbike',NULL),(13,0,300,'2004-04-03 21:52:00','Bought from REI, with stroller and bike trailer attachments.','Dual Chariot Carrier Child Carrier',NULL),(14,0,180,'2001-04-03 21:55:00','bought from REI.','Solomon Inline Skates',NULL),(15,0,160,'2008-04-02 20:15:00','7 speed mtb kids bike. Nice, with grip shift and front shock','Columbia Kids bike',NULL),(16,0,400,'2007-12-06 20:37:00','nice','Solomon CrossMax 10 skis',NULL);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_ref`
--

DROP TABLE IF EXISTS `equipment_ref`;
CREATE TABLE `equipment_ref` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `equipment_id` bigint(20) NOT NULL,
  `exercise_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK77AB56629A6DFEDA` (`equipment_id`),
  KEY `FK77AB5662AF1266DA` (`exercise_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Dumping data for table `equipment_ref`
--

LOCK TABLES `equipment_ref` WRITE;
/*!40000 ALTER TABLE `equipment_ref` DISABLE KEYS */;
INSERT INTO `equipment_ref` VALUES (3,0,1,19),(2,0,8,16),(4,0,1,20),(5,0,1,22),(6,0,1,13),(7,0,1,21),(8,0,1,23),(9,0,13,20),(11,0,1,61),(12,0,13,61),(13,0,1,62),(14,0,1,64),(15,0,9,77);
/*!40000 ALTER TABLE `equipment_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `equipment_id` bigint(20) default NULL,
  `avg_speed` float default NULL,
  `max_speed` float default NULL,
  `animation` tinyblob,
  `distance` float default NULL,
  `reps` int(11) default NULL,
  `seconds` int(11) default NULL,
  `sets` int(11) default NULL,
  `avg_heart_rate` int(11) default NULL,
  `max_heart_rate` int(11) default NULL,
  `calories` int(11) default NULL,
  `completed` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK7A9101D89A6DFEDA` (`equipment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,3,'1 hour spin class','spin class',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'solo','hacky sack session',1,NULL,NULL,'http://www.youtube.com/v/d2qS67dDQrQ&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,4,'old school, bad form','situps',1,NULL,NULL,'http://www.youtube.com/v/TKg_cdwq9l4&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,3,'like trainer described: 35 seconds, rest, repeat. test','ab isometric',1,NULL,NULL,'http://www.youtube.com/v/zJGlP-Z21ws&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,3,'30lbs','dumbell press',1,NULL,NULL,'http://www.youtube.com/v/tka3-WM3r9g&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,1,'Use machine. see video','lateral pulldown',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,'jog around the gym and dribble a basket ball. Keep HR up around 160','job/dribble basketball',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135,180,NULL,NULL),(48,1,'old school, nothing special. Reduce the reps each set.','pushups',NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL),(32,0,'larger machine uses sitting position','ab crunch machine',1,NULL,NULL,'http://www.youtube.com/v/F-hrStkNNH0&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,0,'simple hinged machine isolates upper abs','ab machine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,3,'dips. 10 ea. in various hand positions','assisted dip',1,NULL,NULL,'http://www.youtube.com/v/A2RrGfzg6_w&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,3,'from cmc to quincy 12.57 miles 155bpm avg','biked 12.57 miles from CMC ',NULL,NULL,NULL,NULL,12.57,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,0,'3 reps of 15, 30 sec rest','leg press machine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,0,'3 sets of 12, 30 sec rest','rowing machine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,0,'wrap around hands about shoulder width, straight out in front, then out to sides. 3 sets of 10','rubber band for lats',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,0,'hold ball with legs at 90, shoulders up. Down to 65, up to 90, arms touch ball, then over head and back up. Legs 65 to 90. 45 Second sets.','ab iso with ball',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,0,'on back free weights','Bench Press',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,0,'Ride with kids, low impact','Bike ride with kids',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,0,'pull luka in bike trailer','bike ride pulling trailer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,0,'Just rode around for fun','bike, casual',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,0,'10. 5 miles. Parked at High School, rode down Holly, got on path to Highline canal path on to CMC','bike commute to work',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,0,'biked up Holly to Orchard, through westland park, up Monoco, to Quincy. East on Quincy to Princeton and up Tamarac to home. ','biked from CMC to Home',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,0,'can be exhausting','wrestled with kids',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,0,'Click here to enter description','test embedded video',1,NULL,NULL,'http://www.youtube.com/v/TKg_cdwq9l4&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,0,'run on treadmill','treadmill',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,2,'Simple whole leg workout','walking lunge',1,NULL,NULL,'http://www.youtube.com/v/xYTNEh4r5PI&hl=en',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(29,0,'with machine','lateral pulldown',1,NULL,NULL,'http://www.youtube.com/v/kgF37pq861Q&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,1,'Old school, nothing special','pushups',1,NULL,NULL,'http://www.youtube.com/v/6bleiB13I2E&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,0,'Click here to enter description','pullups',1,NULL,NULL,'http://www.youtube.com/v/742v8O64154&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,1,'Using exercise ball, lay back and do crunches','ab crunch with ball',1,NULL,NULL,'http://www.youtube.com/v/VVBddP5oW8Y&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,1,'stand, step forward up to a step, then leg goes back and bends. Repeat 12 times. Then do other leg. ','back and forth lunges',1,NULL,NULL,NULL,NULL,12,NULL,3,NULL,NULL,NULL,NULL),(36,0,'head up on decline board, then hold legs out at about 54 deg, and then crunch to chest. Repeat ','decline board ab crunchs',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,3,'decline board, raise legs up and back, and raise buttocks up.','decline bench toes to the sky',1,NULL,NULL,'http://www.youtube.com/v/AsduzAwA0H4&hl=en',NULL,NULL,90,NULL,NULL,NULL,NULL,NULL),(38,2,'do a pushup and then raise one arm up and back, straight up.\nStart with 12 each arm and reduce for each set.','pushups, then extend arm up',1,NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,NULL),(39,1,'stand, hold both cable handles palm up, bring forward with arms extended.','cable upper body thing',1,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(40,0,'stand over free weight bar, bend back, pull bar up toward belly','inverted bench press',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,1,'hold rubber band shoulder width, extend arms out','rubber band for upper back',1,NULL,NULL,NULL,NULL,12,NULL,3,NULL,NULL,NULL,NULL),(53,1,'direct route to work from Luka\'s Daycare','Bike from Village to CMC',NULL,13,32,NULL,6,NULL,1680,NULL,NULL,NULL,NULL,NULL),(54,0,'Rode up holly to Orchard, east and up dtc to Yosemite and to village','bike commute from CMC to village',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,0,'downhill ski','Downhill Ski',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,1,'on machine, legs at 90 deg','hack squat',NULL,NULL,NULL,'http://www.youtube.com/v/e1lNykZYsms&hl=en',NULL,12,NULL,3,NULL,NULL,NULL,NULL),(57,0,'ball behind head and shoulders, then dumbell press','dumbell press on swiss ball',NULL,NULL,NULL,'http://www.youtube.com/v/3RgXg_-pz5k&hl=en',NULL,12,NULL,3,NULL,NULL,NULL,NULL),(58,0,'sit on ball, hands up, feet up on machine, pull bar to chest','pull down bar on ball',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(59,0,'back agains a wall, normal curl, then arms up and out','bar curl, then arms out',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(60,0,'on decline board, head up, bring legs all the way back over head','decline board ab crunch',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(61,0,'After Science Museum, the kids and I went to Johnny Rockets. I rode home pulling the trailer','Rode home From Cherry Creek mall',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,0,'From Discount Tire at Belleview and Sante Fe down Platte to Lee Gulch and misc bike paths to CMC','lunch time ride from tire shop',NULL,12,25,NULL,9,NULL,NULL,NULL,153,191,NULL,NULL),(10,0,'description','name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,0,'via neighborhood behind Village, to Orchard, down Holly, through \'hood N of CMC','Commute from Village to CMC',NULL,12,31,NULL,6,NULL,NULL,NULL,157,177,NULL,NULL),(64,0,'Rode to Chatfield and back. Met up with Dave Diller','CMC to Chatfield RT',NULL,13,35,NULL,20,NULL,NULL,NULL,156,NULL,NULL,NULL),(65,0,'keep revs at 110per minute','exercise bike intense',NULL,NULL,NULL,NULL,NULL,NULL,120,NULL,NULL,NULL,NULL,NULL),(66,0,'keep revs at 50 per minute. Resistance 60%','exercise bike moderate',NULL,NULL,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL),(67,0,'Hold at shoulders, swat down and keep feet flat on floor, no heel lift.','dumbell sqats',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(68,0,'Squat to floor, raise bells from floor to ceiling','Dumbell floor to ceiling',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(69,0,'Elbows out and higher than hands.','Dumbell hips to chest',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(70,0,'In front of mirror, stand back flat, raise bells with elbows back.','Dumbell standing row',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(71,0,'Left work early so I rode the Highline Canal trail to Quincy, stopped at MicroCenter, and then through Cherry Creek High School to the Village.','Rode from CMC to Village via HLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,0,'Rode up Dexter to Orchard, east and up dtc to Yosemite and to village','commute CMC to Village',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,0,'Home to CMC via HLC with a couple shortcuts','commute: Home to CMC via HLC',NULL,NULL,NULL,NULL,20,NULL,70,NULL,NULL,NULL,NULL,NULL),(74,0,'Rode around the Cherry Creek Reservoir pulling Luka in the trailer','Commute from Village to Home via CC Res pulling Luka',NULL,NULL,NULL,NULL,10,NULL,60,NULL,NULL,NULL,NULL,NULL),(75,0,'parked at Slaven Elementary and rode down the Platte to C470 to Kipling and then up Deer Creek.','Denver to Deer Creek',NULL,11.3,30.3,NULL,26,NULL,180,NULL,NULL,NULL,NULL,NULL),(76,0,'rode back to car','Deer Creek back to Denver',NULL,16.6,34.5,NULL,26,NULL,90,NULL,NULL,NULL,NULL,NULL),(77,2,'From parking lot to the Gazebo','Mt Falcon Gazebo Grunt',NULL,3.5,13.7,NULL,2.6,NULL,2750,NULL,161,180,NULL,NULL),(78,1,'Loop up top of Mt. Falcon','Parmalee Trail',NULL,6.5,22.3,NULL,4.38,NULL,2417,NULL,145,167,NULL,NULL),(79,0,'Descent from Gazebo to parking lot','Mt Falcon Gazebo to bottom',NULL,10.2,19.9,NULL,2.62,NULL,923,NULL,116,142,NULL,NULL),(80,1,'hard as hell','Military Pushups',NULL,NULL,NULL,'http://www.youtube.com/v/K5boftY6FBU&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,0,'video on how to tape handlebars','tape handlebar',NULL,NULL,NULL,'http://www.howcast.com/flash/howcast_player.swf?file=11058',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,0,'video on how to replace a spoke','replace broken spoke',NULL,NULL,NULL,'http://www.howcast.com/flash/howcast_player.swf?file=10734',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,0,'video on how to adjust the rear derailer','adjust rear derailer',NULL,NULL,NULL,'http://www.howcast.com/flash/howcast_player.swf?file=2249',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,0,'video on how to true a wheel','true a wheel',NULL,NULL,NULL,'http://www.howcast.com/flash/howcast_player.swf?file=2517',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,0,'video on how to tune up a bike','bicycle tuneup',NULL,NULL,NULL,'http://www.howcast.com/flash/howcast_player.swf?file=10813',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,0,'complicated route (see map)','commute from Village to CMC via S. Yosemite route',NULL,14,24,NULL,6.67,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,0,'hard work!','pull both kids in bike trailer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,0,'Ride up Deer Creek Highgrade','bicycle hillclimbing',NULL,8.5,24.1,NULL,13.5,NULL,5700,NULL,NULL,NULL,NULL,NULL),(89,0,'Home to Quincy HLC trail to CMC','Commute to work Quincy HLC',NULL,14.9,27.4,NULL,14.34,NULL,3420,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_ref`
--

DROP TABLE IF EXISTS `exercise_ref`;
CREATE TABLE `exercise_ref` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `exercise_id` bigint(20) NOT NULL,
  `workout_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKE4393DACAF1266DA` (`exercise_id`),
  KEY `FKE4393DACB882287A` (`workout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercise_ref`
--

LOCK TABLES `exercise_ref` WRITE;
/*!40000 ALTER TABLE `exercise_ref` DISABLE KEYS */;
INSERT INTO `exercise_ref` VALUES (1,0,2,2),(2,0,3,2),(3,0,4,2),(5,0,7,2),(6,0,1,6),(7,0,1,7),(8,0,4,7),(10,0,11,7),(11,0,12,7),(12,0,2,8),(13,0,11,8),(14,0,12,8),(16,0,2,9),(18,0,10,9),(19,0,11,9),(20,0,13,10),(21,0,17,11),(22,0,16,11),(23,0,15,11),(24,0,14,11),(25,0,2,18),(27,0,11,18),(28,0,4,18),(29,0,17,18),(30,0,18,19),(31,0,2,20),(32,0,19,20),(33,0,2,21),(34,0,4,21),(35,0,12,21),(36,0,11,21),(37,0,10,21),(70,0,1,37),(40,0,20,22),(41,0,20,23),(42,0,1,25),(43,0,10,25),(44,0,11,25),(45,0,1,27),(46,0,10,27),(47,0,11,27),(49,0,12,27),(50,0,22,28),(51,0,23,29),(54,0,25,4),(55,0,10,5),(56,0,2,33),(57,0,12,33),(58,0,34,33),(59,0,1,34),(60,0,1,35),(61,0,2,35),(62,0,35,36),(63,0,36,36),(64,0,37,36),(65,0,38,36),(66,0,39,36),(67,0,40,36),(68,0,41,36),(69,0,2,37),(80,0,54,42),(79,0,53,39),(81,0,55,43),(82,0,2,44),(83,0,20,44),(84,0,56,45),(85,0,57,45),(86,0,58,45),(87,0,59,45),(88,0,36,45),(89,0,60,45),(90,0,25,46),(91,0,19,47),(92,0,61,47),(93,0,62,48),(94,0,63,50),(95,0,64,51),(96,0,54,52),(97,0,28,53),(98,0,65,53),(99,0,66,53),(100,0,67,53),(101,0,68,53),(102,0,69,53),(103,0,70,53),(104,0,41,53),(105,0,57,53),(106,0,53,56),(107,0,2,86),(108,0,73,88),(109,0,3,88),(110,0,48,88),(111,0,54,89),(112,0,74,89),(113,0,20,93),(114,0,53,94),(115,0,75,96),(116,0,76,96),(117,0,3,99),(118,0,48,99),(119,0,77,102),(120,0,78,102),(121,0,79,102),(122,0,3,102),(123,0,48,102),(124,0,3,2),(125,0,2,102),(126,0,3,1),(127,0,20,110),(128,0,86,110),(129,0,87,111),(130,0,88,131),(131,0,89,132),(132,0,1,5);
/*!40000 ALTER TABLE `exercise_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nutrition_data_id` bigint(20) default NULL,
  `cost` float default NULL,
  `animation` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK300C5EBB48F76B` (`nutrition_data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,3,'oatmeal w granola, raisins, etc','oatmeal',26,NULL,NULL),(2,3,'carafe of french press coffee','carafe of coffee',3,NULL,NULL),(3,2,'sometimes with lettuce and tomato','turkey sandwich',2,NULL,NULL),(4,2,'whole wheat bun, lettuce, tomato','cheese burger',47,NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en'),(5,1,'','yogurt',50,NULL,NULL),(6,1,'','Pizza Slice',63,NULL,NULL),(7,2,'','banana',43,NULL,NULL),(8,0,'','toast w peanut butter',NULL,NULL,NULL),(9,0,'little bagels we got for the kids','mini bagel, wheat',1,NULL,NULL),(10,4,'lettuce and carots, etc. Light dressing','salad',41,4.27,NULL),(12,1,'to go salad w chicken','salad w chicken',41,NULL,NULL),(13,0,'none','default food place holder',3,NULL,NULL),(14,0,'name brand oatmeal packages','oatmeal from packets',3,NULL,NULL),(15,0,'from a can','chicken noodle soup',3,NULL,NULL),(16,0,'from cafeteria-spicy','vegatable and chorizo soup',3,NULL,NULL),(17,0,'burger with swiss cheeese and mini bagel and letuce','cheesburger',2,NULL,NULL),(18,0,'Chicken noodle','Healthy Choice Soup',3,NULL,NULL),(19,0,'Odells 900 Schilling','dark beer',3,NULL,NULL),(20,0,'Stella Artios','lighter beer',3,NULL,NULL),(21,0,'awesome','Baked Char w rich Spinach sauce',3,NULL,NULL),(22,0,'appetizer','Fish Taco',3,NULL,NULL),(23,0,'','Steamed Veggies',2,NULL,NULL),(24,0,'2 eggs, veggies, sausage, green chille','mervin veggie, sausage, green chillie omelet',3,NULL,NULL),(25,0,'turkey chunks, veggies, broth.','Old fashioned Turkey vegetable soup',3,NULL,NULL),(26,3,'large diet coke','large diet coke',15,1.27,NULL),(27,0,'whole wheat','english muffin',3,NULL,NULL),(28,0,'awesome soup from cafeteria','soup, beaf noodle',3,NULL,NULL),(29,0,'beaf patty w cheese','hamburger patty',3,NULL,NULL),(30,0,'single slice ','turkey bacon slice',3,NULL,NULL),(31,0,'Burrito, enchillada, taco combo, (*burp*)','mexican dish',3,NULL,NULL),(32,0,'awesome soup from cafeteria','Tortilla Soup',3,NULL,NULL),(33,0,'w butter','toast',2,NULL,NULL),(34,0,'junk food chips','corn chips',3,NULL,NULL),(35,0,'Penna Pasta with spinach, an cheese and yummy stuff','Penna Rosa',3,NULL,NULL),(36,0,'junki food','burito supreme',3,NULL,NULL),(37,1,'Arlene\'s awesome vegan pumkin muffins','muffins, pumpkin',62,NULL,NULL),(38,2,'vegan burgers from costco','burger, veggie burger',36,NULL,NULL),(39,0,'bean and cheese','burrito, frozen',3,NULL,NULL),(40,1,'chicken tikka masala','frozen dinner, amy\'s or ethnic gourmet',3,NULL,NULL),(41,0,'Egg Spinach cheese bagel sandwich, coffee','sandwich w egg, cheese',3,NULL,NULL),(42,0,'single cup','coffee, cup',3,NULL,NULL),(43,0,'soup from cafeteria','Soup, Cream of Brocoli',3,NULL,NULL),(44,0,'Whole Grain Tuscan Linguini','Tuscan Linguini',3,NULL,NULL),(46,1,'awesome wrap from deli: Roast beaf, olives, spinach, horse radish sauce, spinach tortilla.','EdZilla wrap',69,NULL,NULL),(47,0,'Click here to enter description','test session food 1',2,NULL,NULL),(48,0,'Click here to enter description','test session food 2',2,NULL,NULL),(49,0,'Click here to enter description','test session food 3',2,NULL,NULL),(50,0,'n slices','turkey bacon',2,NULL,NULL),(51,0,'what was I thinking...','donut',2,NULL,NULL),(52,0,'Miller Ice','beer, light beer',2,NULL,NULL),(53,0,'faux cheetos','cheetos',2,NULL,NULL),(54,0,'from cafeteria','clam chowder',2,NULL,NULL),(55,0,'got it at the Valentines day run','mix 1 health drink',2,NULL,NULL),(56,0,'junk food','McDonalds McGriddle',2,NULL,NULL),(57,1,'can of diet soda.','diet soda pop',44,NULL,NULL),(58,0,'sugery cereal ','cereal, Honey Bunch Oats',2,NULL,NULL),(59,0,'way rich. Stay away.','chocolate brownie',2,NULL,NULL),(60,1,'2 eggs, veggies, cheese, sausage, green chile','mervin omlet',5,NULL,NULL),(61,2,'with seeds.','orange',42,NULL,NULL),(62,0,'with seeds','grapefruit',2,NULL,NULL),(63,0,'Click here to enter description','weight watchers chicken',2,NULL,NULL),(64,0,'skinless chicken breast','chicken breast',2,NULL,NULL),(65,0,'mostly veggies, usually some pasta salad, not too much dressing','trip to salad bar',2,NULL,NULL),(66,0,'From cafeteria. pretty fatty, I recon. ','cream of mushroom soup',2,NULL,NULL),(67,0,'Spinach Tortilla, roas beaf, shrooms, olives, tomato, cheese, horse radish-Awesome!','EdZilla sandwich',2,NULL,NULL),(68,2,'brand of \"health\" drink','Vitamin Water',17,NULL,NULL),(69,0,'Roll your own Gyro fixins from some Greek restaurant Arlene went to','Gyro Sandwich',2,NULL,NULL),(70,0,'regular beer','Moosehead beer',2,NULL,NULL),(71,1,'test cost','test cost',2,3.33,NULL),(72,1,'test','test cost 2',2,4.33,NULL),(73,2,'test','test cost 3',2,0.9,NULL),(74,0,'Click here to enter description','test food nutrion data',3,NULL,NULL),(75,1,'test nutrition data','test food',3,NULL,NULL),(76,0,'Click here to enter description','test nutrition data',5,NULL,NULL),(77,0,'Click here to enter description','test aroony',6,NULL,NULL),(78,0,'Click here to enter description','test animation',7,NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en'),(79,0,'Click here to enter description','test no animation',8,NULL,NULL),(80,0,'yummy','cheesy potatoes',9,NULL,'http://www.youtube.com/v/-9kmQuefbtA&hl=en'),(81,1,'Click here to enter description','lemonade',10,NULL,'http://www.youtube.com/v/iRC_i4a2oP8&hl=en'),(82,0,'bowtie pasta, black beans, peas, ','pasta salad',12,NULL,NULL),(83,0,'with butter and jam','rye toast',13,NULL,NULL),(84,0,'Small, but it\'s gotta be fattening.','cheesy vegetable soup',14,1.65,NULL),(85,0,'all the sugar, and stuff','non diet soda',16,NULL,NULL),(86,0,'Roast beef or whatever, veggies, etc','subway sandwich',18,4,NULL),(87,0,'small bag of cheetos','cheetos',19,NULL,NULL),(88,0,'orville redenbachers, with extra margarine','popcorn',20,NULL,NULL),(89,0,'grilled potatoes','hash browns',21,NULL,NULL),(90,0,'2 small ones','pancakes',22,NULL,NULL),(91,0,'\"Rich Chocolate\" from a packet','Hot Chocolate',23,NULL,NULL),(92,0,'turkey burger patty','turkey burger',24,NULL,NULL),(93,0,'energy bar','zone bar',25,NULL,NULL),(94,0,'various soups from cafeteria','soup from caferia',27,1.75,NULL),(95,0,'wings, chips, pizza like things, fries, onion rings, etc.','miscellaneous bar food',28,NULL,NULL),(96,0,'dinasaur shaped chicken things','chicken dino nuggets',29,NULL,NULL),(97,0,'fudge bar','fudge bar',30,NULL,NULL),(98,0,'from starbucks','coffee cake',31,2,NULL),(99,0,'From Chipotle, Wahoo\'s, etc','large burito',32,6,NULL),(100,0,'regular bar','power bar',34,NULL,NULL),(101,0,'large','grapefruit',35,NULL,NULL),(102,0,'egg, spinach, ','einstein\'s egg pannini',37,6.99,NULL),(103,0,'light rye, swiss cheese, tomato, letuce, mustard','pastrami sandwich',38,5,NULL),(104,0,'noodles dish','penne rosa',39,8,NULL),(105,1,'Nutritional snack/energy bar','clif bar',40,NULL,NULL),(106,0,'italian sausage and veggies, I guess','Italian Wedding Soup',45,1.85,NULL),(107,0,'little burgers for the kids','mini burger w cheese',46,NULL,NULL),(108,0,'whole wheet pita bread, burger, shrooms, spinach, cheese','pita burger',47,NULL,NULL),(109,0,'kids love em','corndog',48,NULL,NULL),(110,0,'bowl of Special K cereal w milk','cereal, special K',49,NULL,NULL),(111,0,'from cafeteria','stir fry',51,5.5,NULL),(112,0,'buffalo link','buffalo hot dog',52,NULL,NULL),(113,0,'little frozen sausage patties','veggie breakfast sausage',53,NULL,NULL),(114,0,'bowl of ice cream','ice cream',54,NULL,NULL),(115,0,'Click here to enter description','little chewy granola bar',55,NULL,NULL),(116,0,'cup of slaw','cole slaw',56,NULL,NULL),(117,0,'slice of watermellon','watermellon',57,NULL,NULL),(118,0,'hmmm.','chocoloate chip cookie',58,NULL,NULL),(119,0,'hmmm.','ice cream cone',59,NULL,NULL),(120,1,'unsweetened','ice tea',60,NULL,NULL),(121,0,'sweetened','ice tea',61,NULL,NULL),(122,0,'Click here to enter description','rice bowl with chicken and beef',64,7,NULL),(123,0,'little round pizza','personnal pizza',65,NULL,NULL),(124,0,'Amy\'s Indian frozen thang','Mattar Paneer',66,NULL,NULL),(125,0,'Amy\'s Indian frozen thang','Palak Paneer',67,NULL,NULL),(126,0,'faster energy so they say','power bar gel',68,NULL,NULL),(127,0,'1 bag of Sun Original Flavor','Small Bag of Sun Chips',70,NULL,NULL),(128,0,'with veggies','noodles whole wheat linguini with chicken',71,NULL,NULL),(129,0,'nestles crunch','ice cream bar',72,NULL,NULL),(130,0,'prepackaged salad','salad to go',73,4,NULL),(131,0,'Basalmic Vinaigrette','packaged salad dressing, single serving',74,NULL,NULL),(132,0,'handfull of almonds','almonds',75,NULL,NULL),(133,0,'prepared salad','Chef\'s Salad',76,4.25,NULL),(134,0,'prepackaged salad','Garden Salad',77,3.69,NULL),(135,0,'packaged fig thangs','fig newmans',78,NULL,NULL);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_ref`
--

DROP TABLE IF EXISTS `food_ref`;
CREATE TABLE `food_ref` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `food_id` bigint(20) NOT NULL,
  `meal_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK16A39532D792211A` (`food_id`),
  KEY `FK16A39532380EAAFA` (`meal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=376 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_ref`
--

LOCK TABLES `food_ref` WRITE;
/*!40000 ALTER TABLE `food_ref` DISABLE KEYS */;
INSERT INTO `food_ref` VALUES (1,0,7,1),(2,0,8,1),(3,0,9,3),(4,0,2,1),(5,0,5,10),(6,0,10,10),(7,0,12,12),(8,0,14,13),(9,0,2,13),(10,0,17,14),(11,0,5,15),(12,0,14,15),(13,0,2,15),(14,0,3,16),(15,0,18,16),(16,0,21,17),(17,0,20,17),(18,0,19,17),(19,0,22,17),(20,0,23,17),(21,0,2,18),(22,0,26,19),(23,0,5,20),(24,0,27,20),(25,0,3,21),(26,0,26,21),(27,0,28,21),(28,0,3,22),(29,0,29,23),(30,0,2,24),(31,0,9,24),(32,0,30,24),(33,0,30,24),(34,0,31,25),(35,0,5,26),(36,0,2,26),(37,0,3,26),(38,0,3,27),(39,0,26,27),(40,0,32,27),(41,0,2,28),(42,0,34,28),(43,0,35,29),(44,0,26,29),(45,0,2,31),(46,0,37,31),(47,0,38,32),(48,0,39,32),(49,0,38,33),(50,0,40,33),(51,0,2,35),(52,0,37,35),(53,0,26,36),(54,0,40,36),(55,0,35,37),(56,0,2,39),(57,0,26,40),(58,0,40,40),(59,0,43,40),(60,0,44,41),(61,0,1,42),(62,0,8,42),(63,0,15,42),(66,0,27,44),(65,0,2,44),(67,0,46,45),(68,0,26,45),(69,0,47,46),(70,0,49,46),(71,0,48,46),(72,0,2,49),(73,0,5,49),(74,0,5,49),(75,0,50,49),(76,0,51,49),(77,0,52,48),(78,0,53,48),(79,0,54,50),(80,0,26,50),(81,0,2,52),(82,0,7,52),(83,0,55,52),(84,0,56,53),(85,0,38,55),(86,0,57,55),(87,0,38,55),(88,0,38,56),(89,0,26,56),(90,0,18,56),(91,0,2,57),(94,0,2,58),(93,0,50,57),(95,0,58,58),(96,0,59,59),(97,0,3,60),(98,0,26,60),(99,0,44,61),(100,0,60,62),(101,0,42,62),(102,0,62,63),(103,0,61,63),(104,0,3,64),(105,0,1,65),(106,0,42,65),(107,0,63,66),(108,0,26,66),(109,0,38,67),(110,0,64,67),(111,0,65,70),(112,0,65,70),(113,0,65,70),(114,0,20,70),(115,0,26,69),(116,0,66,69),(117,0,67,69),(118,0,1,68),(119,0,42,68),(120,0,58,71),(121,0,2,71),(122,0,7,71),(123,0,68,71),(124,0,1,74),(125,0,9,74),(126,0,69,75),(127,0,70,75),(128,0,1,78),(129,0,38,1),(130,0,1,1),(131,0,6,6),(132,0,6,6),(133,0,80,85),(134,0,81,85),(135,0,2,86),(136,0,2,87),(137,0,42,87),(140,0,83,87),(139,0,60,87),(141,0,84,88),(142,0,26,88),(143,0,85,89),(144,0,15,90),(145,0,26,90),(146,0,60,91),(147,0,83,91),(148,0,6,92),(149,0,25,92),(150,0,85,92),(151,0,38,93),(152,0,68,93),(153,0,6,93),(154,0,38,94),(155,0,40,95),(156,0,86,95),(157,0,2,96),(158,0,38,97),(159,0,29,97),(160,0,68,97),(161,0,87,97),(162,0,2,98),(163,0,7,98),(164,0,5,98),(165,0,6,99),(166,0,29,100),(167,0,38,100),(168,0,88,100),(169,0,60,101),(170,0,2,101),(171,0,89,101),(172,0,90,101),(173,0,85,103),(174,0,42,104),(175,0,60,104),(176,0,25,105),(177,0,57,105),(178,0,91,106),(179,0,38,108),(180,0,92,108),(181,0,68,108),(182,0,2,109),(183,0,93,109),(184,0,1,109),(185,0,26,111),(186,0,94,111),(187,0,19,112),(188,0,19,112),(189,0,95,112),(190,0,95,112),(191,0,38,114),(192,0,92,114),(193,0,96,114),(194,1,88,115),(195,0,97,115),(196,0,2,116),(197,0,5,116),(198,0,98,116),(199,0,94,117),(200,0,46,117),(201,0,68,119),(202,0,99,119),(203,0,9,120),(204,0,2,120),(205,0,40,121),(206,0,38,122),(207,0,2,123),(208,0,100,123),(209,0,40,124),(210,0,92,127),(211,0,2,128),(212,0,5,128),(213,0,2,128),(214,0,101,129),(215,0,61,129),(216,0,40,130),(217,0,38,130),(218,0,2,132),(219,0,7,132),(220,0,38,133),(221,0,54,133),(222,0,38,134),(223,0,102,135),(224,0,103,136),(225,0,104,137),(226,0,46,139),(227,0,26,139),(228,0,2,141),(229,0,105,141),(230,0,61,141),(231,0,40,142),(232,0,29,142),(233,0,38,143),(234,0,38,143),(235,0,10,143),(236,0,2,144),(237,0,7,144),(238,0,51,144),(239,0,51,144),(240,0,10,145),(241,0,50,146),(242,0,61,146),(246,0,106,159),(244,0,26,149),(247,0,26,159),(248,0,107,160),(249,0,38,161),(250,0,60,163),(251,0,42,163),(252,0,83,163),(253,0,92,164),(254,0,38,164),(255,0,57,164),(256,0,31,162),(257,0,2,166),(258,0,26,167),(259,0,108,167),(260,0,2,174),(261,0,26,185),(262,0,12,185),(263,0,2,183),(264,0,110,183),(265,0,38,186),(266,0,57,186),(267,0,5,187),(268,0,2,187),(269,0,26,188),(270,0,111,188),(271,0,38,191),(272,0,7,193),(273,0,2,193),(280,0,40,194),(275,0,26,194),(276,0,38,195),(277,0,112,195),(278,0,85,195),(279,0,6,194),(281,0,2,196),(282,0,110,196),(283,0,113,196),(284,0,2,198),(285,0,5,198),(286,0,26,199),(287,0,32,199),(288,0,114,201),(289,0,70,201),(290,0,2,202),(291,0,110,202),(292,0,113,202),(293,0,113,202),(294,0,113,202),(295,0,115,202),(296,0,4,203),(297,0,82,203),(298,0,116,203),(299,0,117,203),(300,0,118,203),(301,0,119,203),(302,0,120,203),(303,0,7,204),(304,0,37,205),(305,0,5,205),(306,0,2,205),(307,0,122,206),(308,0,38,207),(309,0,123,207),(310,0,19,207),(311,0,124,210),(312,0,125,211),(313,0,38,212),(314,0,100,211),(315,0,46,213),(316,0,26,213),(317,0,2,214),(318,0,7,214),(319,0,93,214),(320,0,46,215),(321,0,26,215),(322,0,127,215),(323,0,128,216),(324,0,129,216),(325,0,88,216),(326,0,2,217),(327,0,113,217),(328,0,113,217),(329,0,113,217),(330,0,113,217),(331,0,110,217),(332,0,130,219),(333,0,26,219),(334,0,29,220),(335,0,38,220),(336,0,7,224),(337,0,2,224),(338,0,105,224),(339,0,26,226),(340,0,111,226),(341,0,5,227),(342,0,2,227),(343,0,132,227),(344,0,44,229),(345,0,7,230),(346,0,2,230),(347,0,9,230),(348,0,57,231),(349,0,103,231),(350,0,127,231),(351,0,34,231),(352,0,19,232),(353,0,29,232),(354,0,2,233),(355,0,132,233),(356,0,26,234),(357,0,133,234),(358,0,26,236),(359,0,46,236),(360,0,134,236),(361,0,99,249),(362,0,20,249),(363,0,2,250),(364,0,7,250),(365,0,134,251),(366,0,57,251),(367,0,25,251),(368,0,46,252),(369,0,26,252),(370,0,2,253),(371,0,135,253),(372,0,10,254),(373,0,1,255),(374,0,1,9),(375,0,39,256);
/*!40000 ALTER TABLE `food_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
CREATE TABLE `meal` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `athlete_id` bigint(20) default NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` float default NULL,
  `animation` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK3313C330B03D3A` (`athlete_id`),
  KEY `FK3313C34F96694E` (`athlete_id`)
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (1,1,1,'2008-02-03 08:10:00','light breakfast','breakfast',10,NULL),(2,0,1,'2008-02-03 11:19:00','','lunch',NULL,NULL),(3,0,1,'2008-02-05 08:12:00','','breakfast',NULL,NULL),(4,0,1,'2008-02-09 12:12:00','at noodles with Luka','lunch',NULL,NULL),(5,2,1,'2008-02-09 17:13:00','grilled cheesburger','dinner',NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en'),(6,2,1,'2008-02-10 18:27:00','Had a Pacific Plantation pizza and a diet coke. Ate half and took rest home. al rocks','Dinner at Beu Jo\'s',25,NULL),(7,1,1,'2008-02-13 09:54:00','light breakfast. had a bagel','breakfast',NULL,NULL),(8,0,1,'2008-02-14 07:30:00','little bagels we got for the kids','mini bagel, wheat',NULL,NULL),(9,0,1,'2008-02-14 11:30:00','soup with the boys','lunch',NULL,NULL),(10,0,1,'2008-02-15 08:35:00','light dinner at home','dinner',NULL,NULL),(11,0,1,'2008-02-15 08:15:00','Oatmeal, coffee, apex bar','breakfast',NULL,NULL),(12,0,1,'2008-02-17 11:40:00','lunch with arlene at sweet tomatos','lunch',NULL,NULL),(13,0,1,'2008-02-18 07:37:00','oatmeal and coffee','breakfast',NULL,NULL),(14,0,1,'2008-02-19 18:50:00','cheesburger','dinner',NULL,NULL),(15,0,1,'2008-02-20 08:38:00','yogurt, oatmeal, coffee','breakfast',NULL,NULL),(16,0,1,'2008-02-20 12:25:00','soup, sandwich, soda','lunch',NULL,NULL),(17,0,1,'2008-02-20 17:31:00','Went to Bonefish Grill and had a fish place with a rich spinache sauce, bread, fish taco, and two beers. ','Big Dinner out with Work guys',NULL,NULL),(18,0,1,'2008-02-25 11:38:00','coffee, mervin omelet.','breakfast',NULL,NULL),(19,0,1,'2008-02-25 12:28:00','turkey soup, and diet soda','lunch',NULL,NULL),(20,1,1,'2008-02-27 10:19:00','coffe, english muffin, yogurt','breakfast',NULL,NULL),(21,0,1,'2008-02-26 11:30:00','soup, sandwich, soda','lunch',NULL,NULL),(22,0,1,'2008-02-26 17:25:00','turkey sandwich','dinner',NULL,NULL),(23,0,1,'2008-02-27 21:03:00','hamburger patty, 2 diet sodas','dinner',NULL,NULL),(24,0,1,'2008-02-28 07:32:00','coffee, mini bagel with cream cheese, two slices of bacon','breakfast',NULL,NULL),(25,0,1,'2008-02-28 14:47:00','at LosDosPortillos','lunch with Tony, Mark, Don, Jim, Doug',NULL,NULL),(26,0,1,'2008-03-06 12:35:00','coffee, yogurt, sandwich','breakfast',NULL,NULL),(27,0,1,'2008-03-06 11:05:00','soup, sandwich, soda','lunch',NULL,NULL),(28,0,1,'2008-03-07 07:44:00','coffee, chips','breakfast',NULL,NULL),(29,0,1,'2008-03-06 17:47:00','Me Pasta Rosa, him Wisc. MacNCheese','dinner at Noodles with Luka',NULL,NULL),(30,0,1,'2008-03-07 22:13:00','junk food','taco bell burrito supreme',NULL,NULL),(31,1,1,'2008-03-09 09:53:00','coffee, Arlene\'s pumpkin muffins','breakfast',NULL,NULL),(32,0,1,'2008-03-08 20:57:00','frozen burrito with cheese, harvest burger','late dinner',NULL,NULL),(33,0,1,'2008-03-08 15:07:00','frozen indian meal with harvest burger','dinner',NULL,NULL),(34,0,1,'2008-03-09 11:12:00','Egg Spinach cheese bagel sandwich, coffee','Lunch at Einsteins Bagels',NULL,NULL),(35,0,1,'2008-03-10 07:41:00','coffee, ','breakfast',NULL,NULL),(36,0,1,'2008-03-10 13:52:00','Ethnic Goumet Chicken thing and a soda','lunch',NULL,NULL),(37,0,1,'2008-03-10 18:04:00','Him mac n cheese, me curly noodles n water','dinner with Luka at noodles',NULL,NULL),(38,0,1,'2008-03-11 19:43:00','At the rest of my noodles dinner from last night','dinner',NULL,NULL),(39,0,1,'2008-03-12 09:14:00','banana with aidan','breakfast',NULL,NULL),(40,1,1,'2008-03-12 13:47:00','Ethnic Gourmet, cream of brocoli soup, large diet soda, a couple tootsie rolls.','lunch',NULL,NULL),(41,0,1,'2008-03-12 21:15:00','dinner with Luka at Noodles','dinner',NULL,NULL),(44,0,1,'2008-03-13 09:27:00','coffee, english muffin w peanut butter','breakfast',NULL,NULL),(45,0,1,'2008-03-13 13:37:00','EdZilla wrap, large diet soda','lunch',NULL,NULL),(48,3,1,'2008-03-13 16:22:00','handful of cheetos, light beer (16oz)','dinner',NULL,NULL),(49,0,1,'2008-03-14 07:27:00','coffee, yogurt x2, turkey bacon, donut','breakfast',NULL,NULL),(50,0,1,'2008-03-14 12:56:00','clam chowder from cafeteria, large soda','lunch',NULL,NULL),(51,0,1,'2008-03-14 15:59:00','two harvest burgers, diet soda','dinner',NULL,NULL),(52,2,1,'2008-03-15 08:07:00','coffee, banana, mix 1 health drink.','breakfast',NULL,NULL),(53,0,1,'2008-03-16 12:00:00','Click here to enter description','McGriddles',NULL,NULL),(54,0,1,'2008-03-16 12:19:00','had pizza and soda','lunch at birthday party',NULL,NULL),(55,1,1,'2008-03-16 22:28:00','2 harvest burger patties, diet soda pop','dinner',NULL,NULL),(56,0,1,'2008-03-17 13:46:00','sandwich, soup, large diet soda','lunch',NULL,NULL),(57,0,1,'2008-03-17 08:50:00','turkey bacon, coffee, ','breakfast',NULL,NULL),(58,0,1,'2008-03-18 08:33:00','coffee, cereal (Honey Bunch O Oats)','breakfast',NULL,NULL),(59,0,1,'2008-03-18 10:36:00','chocolate brownie...woa!','snack',NULL,NULL),(60,0,1,'2008-03-18 11:44:00','turkey sandwich, large diet soda','lunch',NULL,NULL),(61,0,1,'2008-03-18 16:38:00','him mac n cheese, me Whole Wheet Linguini','dinner at Noodles with Luka',NULL,NULL),(62,0,1,'2008-03-19 09:01:00','omlet from cafeteria: eggs, cheese, veggies, sausage, green chile','breakfast',NULL,NULL),(63,0,1,'2008-03-19 10:44:00','1 orange, 1 grapefruit','mid morning snack',NULL,NULL),(64,0,1,'2008-03-19 16:05:00','turkey sandwich, w cheese','afternoon snack',NULL,NULL),(65,0,1,'2008-03-20 07:23:00','Click here to enter description','oatmeal from packets',NULL,NULL),(66,1,1,'2008-03-20 14:29:00','weight watchers chicken dish, large diet soda.','lunch',NULL,NULL),(67,0,1,'2008-03-20 22:17:00','harvest burger, chicken breast','dinner',NULL,NULL),(68,0,1,'2008-03-22 08:50:00','oatmeal and coffee from cafeteria','breakfast',NULL,NULL),(69,1,1,'2008-03-21 11:52:00','Edzilla sandwich from Milo, mushroom soup, large diet soda','lunch at cafeteria',NULL,NULL),(70,0,1,'2008-03-21 17:53:00','Salad bar (three trips)','dinner at Beau Jo\'s',NULL,NULL),(71,0,1,'2008-03-22 08:25:00','coffee, banana, honey bunches of oats','breakfast at home',NULL,NULL),(72,0,1,'2008-03-22 19:14:00','Click here to enter description','dinner',NULL,NULL),(73,0,6,'2008-03-22 23:03:00','yummy','macncheese',NULL,NULL),(74,0,6,'2008-03-22 23:04:00','pizza, coke','pizza',NULL,NULL),(75,0,1,'2008-03-23 01:42:00','Arlene brought home some Greek food from an awesome restaurant','dinner with Al and Janet Morris',NULL,NULL),(115,1,1,'2008-04-10 21:47:00','Orville Redenbacher\'s Movie butter with extra melted margarine','popcorn watching tv...and a fudge bar...',NULL,NULL),(77,0,1,'2008-03-26 06:15:00','test cost','test cost',NULL,NULL),(78,0,1,'2008-03-26 20:48:00','test food ref','test foodRef',NULL,NULL),(79,0,1,'2008-03-26 20:51:00','test2','test foodRef 2',2.33,NULL),(80,0,1,'2008-03-27 06:05:00','test','testing last updated meal',0.22,NULL),(81,0,1,'2008-03-28 00:22:00','','test',0.22,NULL),(82,0,1,'2008-03-28 00:24:00','Click here to enter description','test',0.22,NULL),(83,1,1,'2008-03-28 00:28:00','Click here to enter description2','test cost',NULL,NULL),(84,1,1,'2008-03-29 13:18:00','Click here to enter description','test new animation',NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en'),(85,2,1,'2008-03-30 07:14:00','soup, cheesy pototoes, fruit, chips, lemonade, ice cream','dinner with Donny & Marissa',NULL,'http://www.youtube.com/v/-9kmQuefbtA&hl=en'),(86,0,1,'2008-03-31 06:34:00','coffee, cheetos, oatmeal','breakfast',NULL,NULL),(87,0,1,'2008-03-31 08:53:00','Omlet, coffee, rye toast','breakfast at cafeteria',3.85,NULL),(88,0,1,'2008-03-31 12:22:00','Small cheesy vegetable soup','lunch at cafeteria',3.08,NULL),(89,0,1,'2008-03-31 16:13:00','soda pop','afternoon snack',0,NULL),(90,0,1,'2008-04-01 15:24:00','soup, frozen indian meal, soda, pizza, chicken wings','lunch at cafeteria',4.5,NULL),(91,0,1,'2008-04-02 11:24:00','Omlet, coffee, rye toast','breakfast at cafeteria',3.8,NULL),(92,0,1,'2008-04-02 13:28:00','slice of pizza, soda, soup','lunch',NULL,NULL),(93,1,1,'2008-04-02 19:35:00','harvest burger w a cheese slice, Vitamin water and a small slice of cheese pizza stolen from my children. ','dinner at home',NULL,NULL),(94,0,1,'2008-04-03 14:11:00','Kids woke me and I couldnt sleep so I had an veggie burger','2:AM Snack',NULL,NULL),(95,1,1,'2008-04-03 14:13:00','Brought my own: leftover 6\" Subway roast beef, Ethnic Gourmet Chicken something or other.','lunch at cafeteria',NULL,NULL),(96,1,1,'2008-04-03 14:23:00','Coffee, not sure what else.','breakfast',NULL,NULL),(97,0,1,'2008-04-03 19:15:00','harvest burger, regular burger, cheetos two cookies','dinner at home',NULL,NULL),(98,0,1,'2008-04-04 06:19:00','coffee, yogurt, banana','breakfast at home',NULL,NULL),(99,0,1,'2008-04-04 12:16:00','leftover burgers, pizza slice','lunch in cafeteria',NULL,NULL),(100,0,1,'2008-04-06 19:57:00','Cooked a harvest burger and a beef burge and made an awesome burger with wheat toast bread. ','harvest burger and beef burger, popcorn',NULL,NULL),(101,2,1,'2008-04-06 08:00:00','eggs, ham, veggies, cheese','Breakfast at Village Inn',NULL,NULL),(102,1,1,'2008-04-06 11:07:00','With Aidan. Pizza and Sprite. Talked to Chris V (an engineer from Ball Aerospace)','lunch at Copper mt ',16,NULL),(103,0,1,'2008-04-06 20:19:00','Chicken salad sandwiches, egg salad sandwich, veggies, soda, ice cream cake','Nathan Evans-Ehringer Birthday Party',NULL,NULL),(104,0,1,'2008-04-07 08:22:00','mcmervin omlet, coffee','breakfast at cafeteria',3.24,NULL),(105,0,1,'2008-04-07 12:13:00','small soup, large diet soda','lunch at cafeteria',3.08,NULL),(106,0,1,'2008-04-07 17:27:00','hot chocolate','late afternoon snack',NULL,NULL),(107,0,1,'2008-04-08 11:07:00','soup, indian meal, large diet soda','lunch at cafeteria',3.08,NULL),(108,0,1,'2008-04-08 18:29:00','1/2 harvest buger, turkey burger, lettuce, wheat bread, vitamin water.','dinner at home',NULL,NULL),(109,1,1,'2008-04-09 06:34:00','coffee, zone bar, test\n','breakfast at home',NULL,NULL),(110,0,1,'2008-04-09 10:27:00','ate second half of last nights turkey/harvest burger. Starved.','mid morning snack',NULL,NULL),(111,0,1,'2008-04-09 13:21:00','corn chowder soup, large diet soda','lunch at cafeteria',3.08,NULL),(112,1,1,'2008-04-10 06:30:00','After the DJUG we went to the rock bottom brewery and had 2 large beers, a wing, an onion ring, a fried cheese wrap thing, and a bruchetta like pizza slice.\nI have two of everything below on purpose.','post DJUG at the bar',14,NULL),(113,0,1,'2008-04-10 07:03:00','two mini bagels with cream cheese, coffee','breakfast at home',NULL,NULL),(114,0,1,'2008-04-10 15:55:00','harvest burger and turkey burger, cheese, lettuce','dinner at home',NULL,NULL),(116,0,1,'2008-04-11 06:15:00','coffee, cofee cake, yogurt, bite o banana','breakfast at Starbucks and home',4,NULL),(117,2,1,'2008-04-11 12:08:00','lean cuisine, soup, EdZilla wrap','lunch at cafeteria',NULL,NULL),(118,0,1,'2008-04-11 20:38:00','from safeway','roasted chicken & ice crea',16,NULL),(119,0,1,'2008-04-14 11:44:00','Huge Burrito and Vitamin Water','lunch at Copper Mt lodge',12.84,NULL),(120,0,1,'2008-04-14 07:52:00','coffee, mini bagel','breakfast at home',NULL,NULL),(121,0,1,'2008-04-14 15:51:00','microwaved a frozen indian meal','lunch at my desk',NULL,NULL),(122,0,1,'2008-04-14 06:32:00','harvest burger w cheese, vitamin water','dinner at home',NULL,NULL),(123,0,1,'2008-04-15 08:12:00','coffee, half a power bar','breakfast at home',NULL,NULL),(124,0,1,'2008-04-15 14:59:00','Ethnic Gourmet, cream of brocoli soup, large diet soda','lunch at my desk',NULL,NULL),(125,0,1,'2008-04-15 19:54:00','grilled out on deck, cheese, greens, wheat bread','hamburger w cheese',NULL,NULL),(126,0,1,'2008-04-16 06:38:00','yogurt, coffee','breakfast',NULL,NULL),(127,0,1,'2008-04-16 18:16:00','low cal frozen meal + turkey burger with cheese','lunch at cafeteria',NULL,NULL),(128,0,1,'2008-04-17 04:23:00','coffee, yogurt','breakfast at home',NULL,NULL),(129,0,1,'2008-04-17 11:07:00','orange, grapefruit','mid morning snack',NULL,NULL),(130,0,1,'2008-04-17 13:46:00','Ethnic Gourmet,  harvest burger','lunch at cafeteria',0,NULL),(131,0,1,'2008-04-17 16:56:00','arlene brought home an awesome pablano pesto burrito, chips, had a buffalo hotdot too and a diet 7up','QDoba naked burrito',NULL,NULL),(132,0,1,'2008-04-18 09:05:00','banana, coffee','breakfast at home',NULL,NULL),(133,0,1,'2008-04-18 12:30:00','clam chowder, harvest burger','lunch at cafeteria',1.85,NULL),(134,0,1,'2008-04-18 20:56:00','harvest burger w cheese, ice cream','dinner at home',NULL,NULL),(135,0,1,'2008-04-19 21:29:00','egg pannini. Kids had pizza bagels','lunch at Einsteins bagels',17.89,NULL),(136,0,1,'2008-04-19 21:32:00','pastrami sandwich','mid day snack',5,NULL),(137,0,1,'2008-04-19 21:33:00','noodles dish','penne pasta',8,NULL),(138,0,1,'2008-04-21 07:39:00','coffee...','breakfast at home',NULL,NULL),(139,0,1,'2008-04-21 12:39:00','EdZilla wrap, large diet soda','lunch at cafeteria',6,NULL),(140,0,1,'2008-04-22 00:22:00','harvest burger w cheese.','dinner at home',NULL,NULL),(141,0,1,'2008-04-22 08:56:00','coffee, cliff bar','breakfast at home',NULL,NULL),(142,0,1,'2008-04-22 12:16:00','frozen indian meal, burger patty (beef)','lunch at cafeteria',NULL,NULL),(143,0,1,'2008-04-22 20:33:00','two harvest burgers, salad greens, diet 7-UP','dinner at home',NULL,NULL),(144,0,1,'2008-04-23 08:03:00','coffee, banana, two donuts when I got to work. ','breakfast at home',NULL,NULL),(145,0,1,'2008-04-23 12:56:00','garden salad w soy peanut dressing','lunch at cafeteria',4.27,NULL),(146,0,1,'2008-04-23 21:28:00','turkey bacon and oranges.','bacon strips',NULL,NULL),(147,0,1,'2008-04-24 06:22:00','coffee, italian sausage, bacon','breakfast at home',NULL,NULL),(148,0,1,'2008-04-25 04:08:00','some leftover fried rice, yogurt, coffee','rice leftovers, coffee, yogurt',NULL,NULL),(149,0,1,'2008-04-25 14:33:00','Spaghetti with Meat sauce, steamed veggies, large soda','lunch at cafeteria',6,NULL),(150,0,1,'2008-04-25 13:01:00','two veggie patties and a beer','dinner at home',NULL,NULL),(151,0,1,'2008-04-26 17:52:00','had a brat, 3 beers, apple pie, ice cream, woa!','dinner at logan auction',NULL,NULL),(152,0,1,'2008-04-26 13:53:00','veggie burger','lunch at home',NULL,NULL),(153,1,1,'2008-04-28 06:51:00','coffee, mini bagel, also had a mervin omlet when I got to work.','breakfast at home',NULL,NULL),(157,0,1,'2008-04-29 22:59:00','don\'t remember...','dinner at home',NULL,NULL),(158,1,1,'2008-04-30 09:23:00','coffee, 2 mini bagels w cc, raison cookie, another cookie.,','breakfast at home',NULL,NULL),(155,0,1,'2008-04-29 07:21:00','coffee, banana','breakfast at home',NULL,NULL),(156,0,1,'2008-04-29 12:56:00','awesome roast beef, corn, potatoes, gravy, large diet soda','lunch at cafeteria',7,NULL),(159,0,1,'2008-04-30 16:53:00','soup, and large diet soda.','lunch at cafeteria',3.08,NULL),(160,0,1,'2008-04-30 21:09:00','mini burger w spinach, diet 7-up','dinner at home',NULL,NULL),(161,1,1,'2008-04-30 20:17:00','veggie burger','late night snack',NULL,NULL),(162,0,1,'2008-05-01 16:56:00','went with Jim, Don, Tony, Mark, Jeff E, and Jeff C.','Lunch at Los Dos',13,NULL),(163,0,1,'2008-05-02 09:40:00','coffee, toast, mervin omlet: 2 eggs, veggies, sausage, green chile','breakfast at cafeteria',3.85,NULL),(164,0,1,'2008-05-01 17:42:00','veggie burger, turkey burger, cheese, spinach, diet 7-up','dinner at home',NULL,NULL),(165,0,1,'2008-05-04 22:50:00','grilled a burger outside','dinner at home',NULL,NULL),(166,0,1,'2008-05-05 07:28:00','coffee, ate the waffle I burnt in the toaster.','breakfast',NULL,NULL),(167,0,1,'2008-05-05 11:26:00','burger, diet soda','lunch at cafeteria',1.27,NULL),(168,0,1,'2008-05-05 19:25:00','carrots, cheesy hotdog','dinner at home',NULL,NULL),(169,0,1,'2008-05-06 07:26:00','coffee, oatmeal','breakfast at home',NULL,NULL),(170,0,1,'2008-05-06 13:27:00','cheese and turkey coldcut','snack at work',NULL,NULL),(171,0,1,'2008-05-09 19:13:00','beaf burger, shrooms, cheese, pita bread, diet 7-up','grilled a burger at home',NULL,NULL),(172,0,1,'2008-05-09 11:53:00','bbq pork sandwich, beans, cole slaw, large diet soda','lunch at cafeteria',7,NULL),(173,0,1,'2008-05-10 05:22:00','bowl of cereal at 5:AM','early breakfast',NULL,NULL),(174,0,1,'2008-05-10 13:36:00','reheated corndog, coffee','breakfast #2',NULL,NULL),(175,0,1,'2008-05-11 10:28:00','bowl of cereal, poptart, coffee, cliff bar','breakfast at home',NULL,NULL),(176,0,1,'2008-05-10 19:29:00','veggie burger w spinach and cheese','late night snack',NULL,NULL),(177,0,1,'2008-05-10 13:30:00','shared with Aidan but I ate most of them, 2 7-ups','2 beer brats',NULL,NULL),(178,0,1,'2008-05-12 07:31:00','bowl of cereal, coffee','breakfast at home',NULL,NULL),(179,1,1,'2008-05-11 22:32:00','ate two veggie patties, one with cheese and spinach, two 7-ups','late night binge',NULL,NULL),(180,0,1,'2008-05-12 10:39:00','ate my veggie burger with pita','mid morning early  lunch',NULL,NULL),(181,0,1,'2008-05-12 12:36:00','salad and large diet coke','lunch at cafeteria',4.26,NULL),(182,0,1,'2008-05-12 16:26:00','turkey and cheese slice','mid afternoon snack',NULL,NULL),(183,0,1,'2008-05-13 07:52:00','bowl of special k, coffee','breakfast at home',NULL,NULL),(184,0,1,'2008-05-12 19:53:00','Guacamole Burger with Pinnaple, wheat bun, onion rings. Yukky','burger at Gunther Toody\'s',NULL,NULL),(185,0,1,'2008-05-13 12:24:00','Uptown Waldorf salad, large diet soda','salad w chickent & large diet soda',4.26,NULL),(186,0,1,'2008-05-13 06:37:00','veggie burger w cheese, spinach, shrooms, 7-up','dinner at home',NULL,NULL),(187,0,1,'2008-05-14 07:40:00','yogurt, chips, coffee','breakfast at home',NULL,NULL),(188,0,1,'2008-05-21 13:44:00','awesome stir fry + large diet soda','lunch at cafeteria',6,NULL),(189,0,1,'2008-05-26 05:31:00','Donny and Marissa came over and we grilled out on the deck. Brats, corn, tater salad, beer, ice cream','Huge cookout at home',50,NULL),(190,0,1,'2008-05-29 06:35:00','vile double burger with cheese and bacon, blah.','double burger melt at waffle house',8,NULL),(191,0,1,'2008-05-29 14:49:00','Troy\'s Diner veggie burger special','veggie burger',10,NULL),(192,0,1,'2008-06-01 14:25:00','Ate BBQ at Woodlands','Lunch with Family',51.12,NULL),(193,0,1,'2008-06-03 06:29:00','banana, coffee','breakfast at home',NULL,NULL),(194,0,1,'2008-06-03 12:31:00','Frozen Indian meal, large diet soda','lunch at cafeteria',2,NULL),(195,0,1,'2008-06-03 19:34:00','veggie burger w spinach and cheese','dinner at home',NULL,NULL),(196,0,1,'2008-06-04 06:51:00','Cereal, Cofeee, veggie sausage.','breakfast at home',NULL,NULL),(197,0,1,'2008-06-04 19:34:00','2 veggie burgers with cheese, spinache','Dinner at home',NULL,NULL),(198,0,1,'2008-06-05 07:52:00','yogurt, coffee','breakfast at home',NULL,NULL),(199,0,1,'2008-06-05 12:31:00','soup and a large soda.','lunch at cafeteria',4,NULL),(200,0,1,'2008-06-05 16:07:00','Amy\'s Indian meal','late afternoon snack',NULL,NULL),(201,0,1,'2008-06-05 19:09:00','pizza, popcorn, ice cream, beer','dinner at home',NULL,NULL),(202,0,1,'2008-06-06 05:29:00','coffee, cereal','breakfast at home',NULL,NULL),(203,0,1,'2008-06-06 12:45:00','Had a burger,  bow tie pasta, slaw, watermellon, ice cream, cookie, ice tea','BBQ at Work',6,NULL),(204,0,1,'2008-06-07 04:33:00','couldn\'t sleep so watched an episode of Lost and had a banana','early morning snack',NULL,NULL),(205,0,1,'2008-06-07 08:58:00','coffee, muffin, yogurt','breakfast at home',NULL,NULL),(206,0,1,'2008-06-07 14:21:00','Met Michael Lui and his son David. We ate at a Japanese place and had some sushi.','lunch at some japanese restaurant',7,NULL),(207,0,1,'2008-06-07 18:25:00','pizza, veggie burger','dinner at home',NULL,NULL),(208,1,1,'2008-06-08 17:59:00','grilled a burger and a veggie patty on the bbq. Ate arlene\'s awesome cous couse and beans.','dinner at home',NULL,NULL),(209,0,1,'2008-06-08 09:01:00','veggie breakfast sausage, and bacon. Coffee','breakfast at home',NULL,NULL),(210,1,1,'2008-06-09 11:48:00','Mattar Paneer','lunch at cafeteria',NULL,NULL),(211,0,1,'2008-06-09 15:47:00','Got the munchies and ate my Palak Paneer','mid afternoon meal',NULL,NULL),(212,0,1,'2008-06-09 20:58:00','cut ham/veggie burger in half','Sandwich before bed',NULL,NULL),(213,1,1,'2008-06-10 13:00:00','EdZilla wrap, large diet soda','lunch at cafeteria',5.4,NULL),(214,1,1,'2008-06-11 05:00:00','coffee, banana, zone bar','breakfast at home',NULL,NULL),(215,2,1,'2008-06-11 12:00:00','EdZilla wrap, large diet coke','lunch at cafeteria',5.5,NULL),(216,1,1,'2008-06-11 15:00:00','leftover noodles linguini, popcorn, ice cream bar, lemonade','dinner at home',NULL,NULL),(217,0,1,'2008-06-12 00:00:00','bowl of cereal, 3.5 breakfast veggie sausages, coffee.','breakfast at home',NULL,NULL),(218,1,1,'2008-06-16 07:00:00','coffee, mini bagel','breakfast at home',NULL,NULL),(219,2,1,'2008-06-16 12:00:00','Salad and diet soda. After reading the Nutrition info, I shoulda gotten a cheesburger. ','lunch at cafeteria',NULL,NULL),(220,1,1,'2008-06-16 16:00:00','two burgers: One beef, one veggie both with guac','dinner at home',NULL,NULL),(221,1,1,'2008-06-17 08:00:00','banana, coffee, yogurt','breakfast at home',NULL,NULL),(222,1,1,'2008-06-17 12:00:00','soup, and veggie burger from home','lunch at cafeteria',NULL,NULL),(223,1,1,'2008-06-17 17:00:00','veggie burger, diet 7-up, almonds','diinner at home',NULL,NULL),(224,1,1,'2008-06-18 06:00:00','banana, coffee, clif bar','breakfast at home',NULL,NULL),(225,1,1,'2008-06-18 18:00:00','veggie burger, chicken breast, diet 7-up, pomegranate juice, popcorn','dinner at home',NULL,NULL),(226,1,1,'2008-06-18 12:00:00','badass stir fry with beef, shrimp, veggies, pot sticker, large diet soda','lunch at cafeteria',6,NULL),(227,1,1,'2008-06-19 08:00:00','yogurt, coffee, almonds','breakfast at home',NULL,NULL),(228,1,1,'2008-06-19 12:00:00','veggie, burger chicken breast, lettuce, tomato','lunch at cafeteria',NULL,NULL),(229,1,1,'2008-06-19 17:00:00','Whole wheat Linguini for me mac n cheese for kids, cookie','dinner at Noodles',20,NULL),(230,1,1,'2008-06-20 06:19:00','coffee, mini bagel w cream cheese, banana','breakfast at home',NULL,NULL),(231,1,1,'2008-06-20 12:00:00','awesome sandwich fixins','lunch at all team meeting',NULL,NULL),(232,1,1,'2008-06-20 17:00:00','Mom out of town so boys and I had dinner. Me: almonds, burger pattie w cheese, beer, ','dinner at home',NULL,NULL),(233,1,1,'2008-06-23 06:00:00','coffee, almonds','breakfast at home',NULL,NULL),(234,2,1,'2008-06-23 12:00:00','leftover burrito from arlene. Chef\'s Salad, large diet soda','lunch at cafeteria',6,NULL),(235,1,1,'2008-06-23 16:00:00','Mom got noodles so I had Linguini','Dinner at home-Luka\'s birthday',NULL,NULL),(236,1,1,'2008-06-25 12:00:00','Garden Salad, EdZilla, diet soda','lunch at cafeteria',8.42,NULL),(237,2,1,'2008-06-25 17:00:00','turkey hot dog, chicken veggie noodle stir fry, Chocolate Mousse, Chocolate Cake','dinner at home',NULL,NULL),(238,1,1,'2008-06-26 05:00:00','Veggie burger w cheese, oatmeal, coffee, banana','Breakfast at desk',NULL,NULL),(239,0,1,'2008-06-30 00:00:00','burgers with spinach','lunch at desk',NULL,NULL),(240,0,1,'2008-06-30 00:00:00','burgers with spinach, juice','dinner at home',NULL,NULL),(241,0,1,'2008-06-30 00:00:00','Egg McMervin','breakfast at cmc',3.08,NULL),(242,0,1,'2008-07-01 00:00:00','Banana, coffee, Egg McMervin, coffee','breakfast at cmc',5,NULL),(243,0,1,'2008-07-01 00:00:00','soup','lunch at cafeteria',3.08,NULL),(244,0,1,'2008-07-01 00:00:00','went to the grocery store and got salad stuff. Met some nice person from Alaska. Never got her name. ','salad at home',NULL,NULL),(245,2,1,'2008-07-02 17:00:00','Pizza Slice (the bomb O veggies), burger w cheese','Dinner at Whole Foods',11,NULL),(246,1,1,'2008-07-04 08:00:00','veggie patties, coffee','breakfast at home',NULL,NULL),(247,1,1,'2008-07-04 12:00:00','pizza','lunch at home',NULL,NULL),(248,1,1,'2008-07-04 16:00:00','hotdog and alot of beers','4th of July at Hamden Heights Pool',5,NULL),(249,1,1,'2008-07-05 00:00:00','fajita burrito, beer, gin/tonic','chipotle burrito X2',13,NULL),(250,0,1,'2008-07-08 00:00:00','coffee, cereal, banana','breakfast at home',NULL,NULL),(251,0,1,'2008-07-08 00:00:00','soup, salad, soda','lunch at cafeteria',NULL,NULL),(252,0,1,'2008-07-14 00:00:00','EdZilla Sandwich, soda','lunch at work',5,NULL),(253,0,1,'2008-07-14 00:00:00','coffee, banana, fig newmans','breakfast at home',NULL,NULL),(254,0,1,'2008-07-14 00:00:00','salad: Spinach, carrots, greens','dinner at home',NULL,NULL),(255,0,1,'2008-09-01 08:40:00','coffee, apple cinnamon muffins','breakfast at home',NULL,NULL),(256,0,1,'2008-09-04 21:07:00','olive loaf with cheese','dinner at home',NULL,NULL);
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrition_data`
--

DROP TABLE IF EXISTS `nutrition_data`;
CREATE TABLE `nutrition_data` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `calories` int(11) default NULL,
  `description` varchar(255) default NULL,
  `food_id` bigint(20) default NULL,
  `grams` int(11) default NULL,
  `grams_fat` int(11) default NULL,
  `serving_size` int(11) default NULL,
  `grams_protein` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK86F4ABF1D792211A` (`food_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nutrition_data`
--

LOCK TABLES `nutrition_data` WRITE;
/*!40000 ALTER TABLE `nutrition_data` DISABLE KEYS */;
INSERT INTO `nutrition_data` VALUES (2,1,0,'Turkey sandwich',3,0,0,0,NULL),(1,0,0,'bagel',9,0,0,0,NULL),(3,0,0,'default empty data',1,NULL,0,0,NULL),(4,0,200,'Click here to enter description',1,NULL,4,50,NULL),(5,3,0,'mervin omlet: 2 eggs, veggies, sausage, green chile',60,NULL,0,98,NULL),(6,1,NULL,'test aroony',77,NULL,NULL,NULL,NULL),(7,1,NULL,'test animation',78,NULL,NULL,NULL,NULL),(8,1,NULL,'test no animation',79,NULL,NULL,NULL,NULL),(9,1,NULL,'cheesy potatoes',80,NULL,NULL,NULL,NULL),(10,1,NULL,'lemonade',81,NULL,NULL,NULL,NULL),(11,0,NULL,'oatmeal packets',14,NULL,NULL,NULL,NULL),(12,1,NULL,'pasta salad',82,NULL,NULL,NULL,NULL),(13,1,NULL,'rye toast',83,NULL,NULL,NULL,NULL),(14,1,NULL,'cheesy vegetable soup',84,NULL,NULL,NULL,NULL),(15,0,NULL,'large diet coke',26,NULL,NULL,NULL,NULL),(16,1,NULL,'non diet soda',85,NULL,NULL,NULL,NULL),(17,0,NULL,'vitamin water',68,NULL,NULL,NULL,NULL),(18,1,NULL,'subway sandwich',86,NULL,NULL,NULL,NULL),(19,1,NULL,'cheetos',87,NULL,NULL,NULL,NULL),(20,1,NULL,'popcorn',88,NULL,NULL,NULL,NULL),(21,1,NULL,'hash browns',89,NULL,NULL,NULL,NULL),(22,1,NULL,'pancakes',90,NULL,NULL,NULL,NULL),(23,1,NULL,'Hot Chocolate',91,NULL,NULL,NULL,NULL),(24,1,NULL,'turkey burger',92,NULL,NULL,NULL,NULL),(25,2,210,'zone bar',93,NULL,7,50,NULL),(26,0,NULL,'raw oatmeal',1,NULL,NULL,NULL,NULL),(27,1,NULL,'soup from caferia',94,NULL,NULL,NULL,NULL),(28,1,NULL,'miscellaneous bar food',95,NULL,NULL,NULL,NULL),(29,1,NULL,'chicken dino nuggets',96,NULL,NULL,NULL,NULL),(30,1,NULL,'fudge bar',97,NULL,NULL,NULL,NULL),(31,1,NULL,'coffee cake',98,NULL,NULL,NULL,NULL),(32,1,NULL,'large burito',99,NULL,NULL,NULL,NULL),(33,0,NULL,'harvest burger',1,NULL,NULL,NULL,NULL),(34,2,240,'power bar',100,NULL,4,NULL,NULL),(35,1,NULL,'grapefruit',101,NULL,NULL,NULL,NULL),(36,1,NULL,'veggie burger',38,NULL,NULL,NULL,NULL),(37,1,NULL,'einstein\'s egg pannini',102,NULL,NULL,NULL,NULL),(38,1,NULL,'pastrami sandwich',103,NULL,NULL,NULL,NULL),(39,1,NULL,'penne rosa',104,NULL,NULL,NULL,NULL),(40,3,250,'clif bar',105,NULL,6,68,NULL),(41,0,NULL,'garden salad',10,NULL,NULL,NULL,NULL),(42,0,NULL,'orange',61,NULL,NULL,NULL,NULL),(43,0,NULL,'banana',7,NULL,NULL,NULL,NULL),(44,0,NULL,'can of diet soda',57,NULL,NULL,NULL,NULL),(45,1,NULL,'Italian Wedding Soup',106,NULL,NULL,NULL,NULL),(46,1,NULL,'mini burger w cheese',107,NULL,NULL,NULL,NULL),(47,1,NULL,'pita burger',108,NULL,NULL,NULL,NULL),(48,1,NULL,'corndog',109,NULL,NULL,NULL,NULL),(49,1,NULL,'cereal, special K',110,NULL,NULL,NULL,NULL),(50,0,NULL,'yogurt',5,NULL,NULL,NULL,NULL),(51,1,NULL,'stir fry',111,NULL,NULL,NULL,NULL),(52,1,NULL,'buffalo hot dog',112,NULL,NULL,NULL,NULL),(53,1,NULL,'veggie breakfast sausage',113,NULL,NULL,NULL,NULL),(54,1,NULL,'ice cream',114,NULL,NULL,NULL,NULL),(55,1,NULL,'little chewy granola bar',115,NULL,NULL,NULL,NULL),(56,1,NULL,'cole slaw',116,NULL,NULL,NULL,NULL),(57,1,NULL,'watermellon',117,NULL,NULL,NULL,NULL),(58,1,NULL,'chocoloate chip cookie',118,NULL,NULL,NULL,NULL),(59,1,NULL,'ice cream cone',119,NULL,NULL,NULL,NULL),(60,1,NULL,'ice tea',120,NULL,NULL,NULL,NULL),(61,1,NULL,'ice tea',121,NULL,NULL,NULL,NULL),(62,0,NULL,'arlene\'s muffins',37,NULL,NULL,NULL,NULL),(63,0,NULL,'cheese pizza slice',6,NULL,NULL,NULL,NULL),(64,1,NULL,'rice bowl with chicken and beef',122,NULL,NULL,NULL,NULL),(65,1,NULL,'personnal pizza',123,NULL,NULL,NULL,NULL),(66,2,320,'Mattar Paneer',124,NULL,8,NULL,NULL),(67,2,270,'Palak Paneer',125,NULL,9,NULL,NULL),(68,3,120,'power bar gel',126,NULL,2,NULL,NULL),(69,0,NULL,'EdZilla wrap',46,NULL,NULL,NULL,NULL),(70,2,210,'Small Bag of Sun Chips',127,NULL,10,NULL,NULL),(71,1,NULL,'noodles whole wheat linguini with chicken',128,NULL,NULL,NULL,NULL),(72,1,NULL,'ice cream bar',129,NULL,NULL,NULL,NULL),(73,2,500,'salad to go',130,NULL,33,NULL,43),(74,3,160,'packaged salad dressing, single serving',131,NULL,17,1,0),(75,1,NULL,'almonds',132,NULL,NULL,NULL,NULL),(76,2,500,'Chef\'s Salad',133,NULL,33,324,43),(77,2,60,'Garden Salad',134,NULL,19,252,2),(78,1,NULL,'fig newmans',135,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nutrition_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestmap`
--

DROP TABLE IF EXISTS `requestmap`;
CREATE TABLE `requestmap` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `config_attribute` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requestmap`
--

LOCK TABLES `requestmap` WRITE;
/*!40000 ALTER TABLE `requestmap` DISABLE KEYS */;
INSERT INTO `requestmap` VALUES (3,0,'ROLE_COACH,','/course/delete/**');
/*!40000 ALTER TABLE `requestmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,1,'ROLE_COACH','trains athletes'),(2,26,'ROLE_ATHLETE','jock'),(3,0,'ROLE_MANAGER','has some administration abilities');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_auth_user`
--

DROP TABLE IF EXISTS `role_auth_user`;
CREATE TABLE `role_auth_user` (
  `authorities_id` bigint(20) NOT NULL,
  `people_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`people_id`,`authorities_id`),
  KEY `FKFB14EF798F01F561` (`people_id`),
  KEY `FKFB14EF79287E0CAC` (`authorities_id`),
  CONSTRAINT `FKFB14EF79287E0CAC` FOREIGN KEY (`authorities_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `FKFB14EF798F01F561` FOREIGN KEY (`people_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_auth_user`
--

LOCK TABLES `role_auth_user` WRITE;
/*!40000 ALTER TABLE `role_auth_user` DISABLE KEYS */;
INSERT INTO `role_auth_user` VALUES (1,1),(1,2),(6,2),(7,2),(8,2),(13,2),(14,2),(15,2);
/*!40000 ALTER TABLE `role_auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `date_of_birth` datetime default NULL,
  `gender` varchar(1) default NULL,
  `postal_address` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'2008-02-19 13:40:00','ejy@summitbid.com','edderd','ed','gr00vy','Athlete','1963-10-28 13:40:00','M','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout`
--

DROP TABLE IF EXISTS `workout`;
CREATE TABLE `workout` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `athlete_id` bigint(20) default NULL,
  `avg_heart_rate` int(11) default NULL,
  `description` varchar(255) NOT NULL,
  `end_date_time` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `max_heart_rate` int(11) default NULL,
  `min_heart_rate` int(11) default NULL,
  `name` varchar(255) NOT NULL,
  `start_date_time` datetime NOT NULL,
  `distance` float default NULL,
  `animation` varchar(255) default NULL,
  `course_id` bigint(20) default NULL,
  `duration` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK5AE8429D30B03D3A` (`athlete_id`),
  KEY `FK5AE8429D4F96694E` (`athlete_id`),
  KEY `FK5AE8429DD006A3FA` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout`
--

LOCK TABLES `workout` WRITE;
/*!40000 ALTER TABLE `workout` DISABLE KEYS */;
INSERT INTO `workout` VALUES (1,0,1,NULL,'discussed fitness plan','2008-02-03 06:49:00','24 Hour Fitness @ Tamarac',NULL,NULL,'trainer appointment','2008-02-03 05:00:00',NULL,NULL,NULL,NULL),(2,0,1,NULL,'weights and isometrics','2008-02-05 06:50:00','24 Hour Fitness @ Tamarac',NULL,NULL,'trainer workout','2008-02-05 05:00:00',NULL,NULL,NULL,NULL),(3,0,1,168,'1 hour spin and hacky sack warmdown','2008-02-08 06:40:00','24 Hour Fitness @ Tamarac',195,NULL,'spin class','2008-02-08 05:30:00',NULL,NULL,NULL,NULL),(4,1,1,NULL,'played with luka at westland park','2008-02-09 13:17:00','westland park',NULL,NULL,'played at park','2008-02-09 12:17:00',NULL,NULL,NULL,NULL),(5,0,1,NULL,'30 mins jog/dribble bball','2008-02-11 06:45:00','24 Hour Fitness @Tamarac',NULL,NULL,'gym workout','2008-02-11 05:30:00',NULL,NULL,NULL,NULL),(6,0,1,NULL,'1 hour spin + warm down','2008-02-13 06:45:00','24 Hour Fitness @Tamarac',NULL,NULL,'spin class','2008-02-13 05:30:00',NULL,NULL,NULL,NULL),(7,1,1,149,'1  hour spin + hacky sack, situps, bench press','2008-02-15 06:45:00','24 Hour Fitness @Tamarac',220,NULL,'spin class','2008-02-15 05:30:00',NULL,NULL,NULL,NULL),(8,3,1,NULL,'sack, situps, assisted dips','2008-02-16 18:15:00','24 Hour fitness @ Tamarac',NULL,NULL,'Gym workout, hacky sack session','2008-02-16 17:15:00',NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en',NULL,NULL),(9,1,1,NULL,'jog/dribble, footbag, weights,situps','2008-02-19 07:01:00','24 Hour Fitness @Tamarac',NULL,NULL,'gym workout','2008-02-19 05:01:00',NULL,NULL,1,NULL),(10,4,1,155,'12.57 mi. from work to car at Quincy','2008-02-19 16:26:00','cmc to quincy via hlc',NULL,NULL,'bike commute from work','2008-02-19 15:26:00',12.57,NULL,1,NULL),(11,0,1,NULL,'abs iso, leg press, rowing machine, rubber band','2008-02-20 06:21:00','24 Hour Fitness @Tamarac',NULL,NULL,'trainer workout','2008-02-20 05:21:00',NULL,NULL,NULL,NULL),(12,0,1,NULL,'played with boys downstairs: Exhausting','2008-02-20 18:38:00','downstairs playroom',NULL,NULL,'wrestled with kids','2008-02-21 15:38:00',NULL,NULL,NULL,NULL),(13,0,1,NULL,'Ski at Winter Park','2008-02-22 15:02:00','winter park colorado',NULL,NULL,'Downhill Ski','2008-02-22 10:02:00',NULL,NULL,NULL,NULL),(14,0,1,NULL,'at winter park','2008-02-23 15:05:00','winter park colorado',NULL,NULL,'Downhill Ski','2008-02-23 09:05:00',NULL,NULL,NULL,NULL),(15,0,1,NULL,'played keep away from Luka','2008-02-24 19:07:00','denver jazzercise',NULL,NULL,'played with kids','2008-02-24 17:07:00',NULL,NULL,NULL,NULL),(16,0,1,NULL,'Pulled Luka in trailer and Aidan rode his bike to Performance bicycle. ','2008-02-24 17:08:00','Highline canal',NULL,NULL,'Rode bikes to Performance N Jazzercise','2008-02-24 16:08:00',NULL,NULL,NULL,NULL),(21,0,1,NULL,'hacky sack session, lunges, ab iso, ab machine, assisted dips, sitting bench press machine,','2008-03-11 05:55:00','24 Hour Fitness @Tamarac',NULL,NULL,'gym workout','2008-03-11 09:55:00',NULL,NULL,NULL,NULL),(18,0,1,NULL,'jog/dribble, footbag, weights,situps','2008-02-26 06:45:00','24 Hour Fitness @Tamarac',NULL,NULL,'gym workout','2008-02-26 05:30:00',NULL,NULL,NULL,NULL),(19,1,1,NULL,'wrestled and tossed him around. I specified the bench press as the exercise, but it\'s pretty close. ','2008-02-26 20:50:00','home',NULL,NULL,'played with Luka','2008-02-26 20:37:00',NULL,NULL,NULL,NULL),(20,1,1,NULL,'Rode with Aidan and pulled Luka to Wash park. They played, I hackysack sessioned.','2008-03-10 07:01:00','Washington Park',NULL,NULL,'Bike ride/play at Wash Park with kids','2008-03-10 07:01:00',NULL,NULL,NULL,NULL),(22,0,1,NULL,'Pulled Luka home from village through Cherry Creek. Saw Jamey Leonard on the way. Beautiful evening. ','2008-03-11 19:38:00','Cherry Creek Park',NULL,NULL,'Rode Home from Village','2008-03-11 18:38:00',NULL,NULL,NULL,NULL),(23,0,1,NULL,'pulled Luka to school on bike via Dam Road path','2008-03-12 13:41:00','225 Dam road',NULL,NULL,'bike pulling trailer','2008-03-12 13:41:00',NULL,NULL,NULL,NULL),(24,0,1,NULL,'Click here to enter description','2008-03-13 01:26:00','24 Hour fitness @ Tamarac',NULL,NULL,'test flash','2008-03-13 01:26:00',NULL,NULL,NULL,NULL),(25,0,1,NULL,'spin class, lunges, ab machine','2008-03-14 06:43:00','24 Hour Fitness @Tamarac',NULL,NULL,'spin class','2008-03-14 05:24:00',NULL,NULL,NULL,NULL),(26,0,1,NULL,'rode bike from home to Colorado blvd and back','2008-03-15 12:12:00','Denver',NULL,NULL,'bike ride around town','2008-03-15 09:12:00',NULL,NULL,NULL,NULL),(27,0,1,NULL,'1 hour spin + light weight workout','2008-03-19 07:09:00','24 Hour Fitness @Tamarac',NULL,NULL,'spin class','2008-03-19 05:30:00',NULL,NULL,NULL,NULL),(28,0,1,155,'10. 5 miles. Parked at High School, rode down Holly, got on path to Highline canal path on to CMC','2008-03-19 07:33:00','centennial highline canal',NULL,NULL,'commute to work','2008-03-19 12:28:00',NULL,NULL,NULL,NULL),(29,0,1,NULL,'Rode up Holly to Orchard, through Westland Park, up Monoco to Quincy. Then east on quincy to Princeton and then Tamarac home. ','2008-03-21 15:49:00','CMC to Home',NULL,NULL,'commute from work','2008-03-22 07:49:00',NULL,NULL,NULL,NULL),(30,0,1,NULL,'Rode with Aidan to village. I pulled the trailer empty. We got to the Village, and then loaded up Luka and rode back. We wen the Dam road trail both ways. Aidan did great!','2008-03-22 07:57:00','RT: Home to Village ',NULL,NULL,'Biked to Village to get Luka','2008-03-22 07:57:00',NULL,NULL,NULL,NULL),(31,0,1,NULL,'test','2008-03-25 21:56:00','home',NULL,NULL,'test last updated workout','2008-03-25 21:56:00',NULL,NULL,NULL,NULL),(43,0,1,NULL,'Skied with Aidan from 10-2. Awesome snow and snowing the whole day. The whole family went and Luka too a ski lesson. We drove up at 7 and got there at 9:30 cuz we stopped at VI. On the way home we had little traffic. Awesome day','2008-04-06 19:54:00','Copper Mt. Colorado',NULL,NULL,'skied at Copper mt','2008-04-06 19:54:00',NULL,NULL,NULL,NULL),(33,0,1,NULL,'went to the Golden Community Rec center. Kids & Mom swam. I kicked footbag, ran, assisted dip, bench press','2008-03-30 18:09:00','Golden Colorado',NULL,NULL,'Golden Rec Center w Gordons','2008-03-30 18:09:00',NULL,NULL,NULL,NULL),(34,0,1,NULL,'Click here to enter description','2008-04-01 17:22:00','test',NULL,NULL,'test update workout ref','2008-04-01 17:22:00',NULL,NULL,NULL,NULL),(35,0,1,NULL,'1 hour spin + warm down','2008-04-02 11:02:00','24 Hour Fitness @Tamarac',NULL,NULL,'spin class','2008-04-02 11:02:00',NULL,NULL,NULL,NULL),(36,0,1,NULL,'OMG: ab stuff on decline board, lunges (not walking), cable upper body, pushups with arm up in the air thing, rubber band thing, then pull weight up to belly.','2008-04-02 08:04:00','24 Hour Fitness @Tamarac',NULL,NULL,'trainer workout','2008-04-02 07:04:00',NULL,NULL,NULL,NULL),(37,0,1,NULL,'Jon M and I took about 15 mins','2008-04-02 14:50:00','Comcast CMC Parking lot',NULL,NULL,'afternoon footbag session','2008-04-02 14:50:00',NULL,NULL,NULL,NULL),(39,0,1,150,'Rode along Belleview to Holly and then South to Dry Creek, west to CMC','2008-04-04 09:15:00','Centennial',NULL,NULL,'rode from the Village to CMC','2008-04-04 07:33:00',6,NULL,NULL,NULL),(42,0,1,NULL,'Return trip from Work to Village','2008-04-05 21:23:00','centennial',NULL,NULL,'Rode from CMC to Village','2008-04-05 21:23:00',NULL,NULL,NULL,NULL),(41,0,1,NULL,'sat morning brought both kids, saw Brad. Lunges (two different ones), cable fly/pushups w hand wave thing, assisted dips, bench row w rubber band back thing, ab decline board. ','2008-04-05 21:15:00','24 Hour fitness @ Tamarac',NULL,NULL,'gym workout','2008-04-05 21:15:00',NULL,NULL,NULL,NULL),(44,0,1,NULL,'Rode bikes a little. Aidan rode his new bike, I pulled luka in trailer. Mostly hung at the play area. I did footbag session.','2008-04-05 14:11:00','Washington Park, Denver, CO',NULL,NULL,'Played at Wash Park','2008-04-06 20:11:00',NULL,NULL,NULL,NULL),(45,0,1,NULL,'decline ab workout (2 diff ones), toes together bendover touch the ground but up-down, hack squat, ball dumbell press, ball cable pull down hands up, curl against the purple bar then out, ','2008-04-09 05:05:00','24 Hour fitness @ Tamarac',NULL,NULL,'trainer workout','2008-04-09 05:50:00',NULL,NULL,NULL,NULL),(46,0,1,NULL,'wrestled with him downstairs','2008-04-10 21:52:00','home',NULL,NULL,'play with Luka','2008-04-10 21:52:00',NULL,NULL,NULL,NULL),(47,1,1,NULL,'Aidan rode and I pulled Luka in trailer. 10.3 miles','2008-04-13 20:58:00','Denver',NULL,NULL,'rode bikes to Science Museum','2008-04-13 15:58:00',20,NULL,NULL,NULL),(48,0,1,153,'Rode along Platte to Lee Gulch and then followed some bike paths to Dry creek and then to CMC','2008-04-14 13:47:00','Englewood/Centennial',191,NULL,'Rode bike back from Discount Tire','2008-04-14 12:47:00',9,NULL,NULL,NULL),(49,0,1,NULL,'Rode back to tire shop. About 6 miles.','2008-04-14 21:45:00','Englewood/Centennial',NULL,NULL,'cmc to Discount Tire','2008-04-14 21:45:00',NULL,NULL,NULL,NULL),(50,0,1,157,'via neighborhood behind Village, to Orchard, down Holly, through \'hood N of CMC','2008-04-15 08:07:00','Greenwood Village/Centennial',177,NULL,'Village to CMC','2008-04-15 07:43:00',6,NULL,NULL,NULL),(51,0,1,156,'Rode to Chatfield and back. Met up with Dave Diller','2008-04-15 14:06:00','Centennial',NULL,NULL,'CMC to Chatfield RT','2008-04-15 14:06:00',20,NULL,NULL,NULL),(52,0,1,150,'via Holly, Orchard, DTC','2008-04-15 19:52:00','Centennial/Greenwood Village',NULL,NULL,'CMC to Village','2008-04-15 19:52:00',6,NULL,NULL,NULL),(53,3,1,NULL,'vertical intervals: bike, lunges, dumbell stuff (4 or 5 diff ones), abs. Killer','2008-04-16 06:37:00','24 Hour fitness @ Tamarac',NULL,NULL,'trainer interval workout','2008-04-16 06:37:00',NULL,'http://www.youtube.com/v/fhXdSo-8nQw&hl=en',1,NULL),(54,1,1,NULL,'test','2008-04-18 07:36:00','home',NULL,NULL,'test date time start end','2008-04-18 06:36:00',NULL,NULL,NULL,NULL),(63,1,1,155,'Direct, but pretty inefficient route. ended up on the sidewalk alot.','2008-04-23 10:01:00','Greenwood Village/Centennial',165,NULL,'Commute from Village to CMC direct','2008-04-23 08:01:00',6.43,NULL,18,NULL),(56,4,1,157,'Village to CMC','2008-04-18 08:39:00','Denver to Centennial',178,NULL,'commute to work','2008-04-18 08:10:00',7,NULL,14,NULL),(57,3,1,NULL,'CMC to Village via circuituous route.','2008-04-18 15:45:00','centennial highline canal',NULL,NULL,'Commute to Village from work','2008-04-18 14:45:00',14.4,NULL,13,NULL),(58,3,1,NULL,'Left work early so I rode the Highline Canal trail to Quincy, stopped at MicroCenter, and then through Cherry Creek High School to the Village.','2008-04-18 21:17:00','Centennial/Greenwood Village',NULL,NULL,'ride to the Village from CMC','2008-04-18 20:17:00',14,NULL,13,NULL),(59,2,13,NULL,'through the portal','2008-04-20 09:57:00','His crib',NULL,NULL,'Mike Rockin','2008-04-20 08:57:00',NULL,'http://www.youtube.com/v/PzJpyvvQiCI&hl=en',NULL,NULL),(60,1,1,142,'Bike commute from Home to CMC via Tamarac, Rosemary Way, Princeton, Quincy, Holly. Dry Creek.','2008-04-21 09:30:00','Greenwood Village/Centennial',165,NULL,'commute to work','2008-04-21 08:11:00',8,NULL,17,NULL),(61,4,1,NULL,'Was taking a new route via Dexter Way. got a flat just before Belleview.','2008-04-22 01:05:00','Greenwood Village/Centennial',NULL,NULL,'aborted commute home from CMC','2008-04-22 00:05:00',NULL,NULL,1,NULL),(62,2,1,NULL,'Dropped Luka off, got all rigged up, discovered I had a flat on the rear tire. Yesterday it was the front tire. ','2008-04-22 09:55:00','Greenwood Village/Centennial',NULL,NULL,'aborted commute to work','2008-04-22 08:55:00',0,NULL,1,NULL),(64,1,1,NULL,'up Dexter to Orchard. Then East to DTC and Village','2008-04-23 23:20:00','Greenwood Village/Centennial',NULL,NULL,'CMC to Village','2008-04-23 22:20:00',NULL,NULL,NULL,NULL),(65,2,1,NULL,'Sucks. Riding along Belleview is a nightmare. 8.04 miles ','2008-04-24 05:06:00','Centennial/GreenwoodVillage',NULL,NULL,'commute CMC to Village via Dexter/Belleview','2008-04-24 17:06:00',8.04,NULL,19,NULL),(66,1,1,NULL,'Click here to enter description','2008-04-27 08:45:00','home',NULL,NULL,'test end date','2008-04-27 07:45:00',NULL,NULL,NULL,NULL),(67,9,1,143,'about 50 miles ','2008-04-27 12:29:00','denver/morrison',NULL,NULL,'ride to redrocks and back','2008-04-27 12:29:00',50,'http://www.youtube.com/v/gbJh5CagyNA&hl=en',21,245),(68,0,1,NULL,'Parked car at Orchard and rode short path along Colorado Blvd to CMC','2008-04-29 16:39:00','Centennial',NULL,NULL,'commute to work from Orchard lot','2008-04-29 16:39:00',2,NULL,NULL,20),(69,0,1,NULL,'CMC to Orchard Parking lot via HLC','2008-04-29 23:25:00','Centennial',NULL,NULL,'commute from work','2008-04-29 23:25:00',6.3,NULL,NULL,30),(70,0,1,NULL,'Parked car at stable on Orchard, and rode HLC to Orchard, then took Colorado Blvd shortcut.','2008-04-30 09:51:00','centennial highline canal',NULL,NULL,'commute to work','2008-04-30 09:51:00',NULL,NULL,NULL,30),(71,0,1,NULL,'Parked car at stable on Orchard, and rode HLC to Orchard, then took Colorado Blvd shortcut.','2008-04-30 18:54:00','centennial highline canal',NULL,NULL,'commute back to car','2008-04-30 18:54:00',NULL,NULL,NULL,NULL),(72,0,1,NULL,'Also did Parmalee trail. rode with sam harsh','2008-05-04 16:48:00','Jeffco',NULL,NULL,'mt bike mt falcon','2008-05-04 16:48:00',NULL,NULL,NULL,120),(73,1,1,NULL,'CMC to sunset to Platte, to 470 to County Line to Clarkson to Dry Crek to CMC','2008-05-06 15:35:00','Centennial',NULL,NULL,'Lunchtime ride: CMC to sunset to Platte, south to 470, back to CMC','2008-05-06 15:35:00',NULL,NULL,1,90),(74,1,1,NULL,'Pulled Luka to school, and then rode to work via Orchard, Holly','2008-05-09 08:35:00','Greenwood Village/Centennial',NULL,NULL,'pulled Luka to School, rode to work','2008-05-09 08:35:00',12,NULL,24,58),(75,0,1,154,'CMC to Village direct, then rode around Cherry Creek res. Stopped at Bicycle Village','2008-05-09 16:47:00','Greenwood Village/Centennial',181,NULL,'CMC to Village, Cherry Creek Res to home','2008-05-09 16:47:00',16,NULL,NULL,68),(76,0,1,NULL,'Parked at Library at Holly & Orchard, rode orchard to CMC','2008-05-08 08:04:00','centennial',NULL,NULL,'Commute to CMC','2008-05-08 08:04:00',5,NULL,NULL,20),(77,0,1,NULL,'rode back to car parked at the library at Holly & Orchard','2008-05-08 18:16:00','centennial',NULL,NULL,'CMC back to car','2008-05-08 18:16:00',5,NULL,NULL,30),(78,0,1,NULL,'rode with Aidan and pulled Luka from home to Wash park','2008-05-11 11:33:00','Denver',NULL,NULL,'pulled luka to Wash Park','2008-05-11 11:33:00',NULL,NULL,NULL,60),(79,1,1,NULL,'Return trip from Wash park','2008-05-11 15:34:00','Denver',NULL,NULL,'pulled Luka home from Wash Park','2008-05-11 15:34:00',10,NULL,22,60),(80,1,1,NULL,'down DTC to Orchard, Holly CMC','2008-05-12 08:30:00','Denver',NULL,NULL,'Village to CMC direct via Orchard','2008-05-12 08:30:00',6.43,NULL,18,30),(81,1,1,158,'Village, backstreet to DTC, Orchard, Holly, neighborhood, CMC','2008-05-21 08:05:00','Greenwood Village/Centennial',178,NULL,'Village to CMC direct via Orchard','2008-05-21 08:05:00',6.1,NULL,26,25),(82,1,1,NULL,'Click here to enter description','2008-05-22 17:28:00','Denver',NULL,NULL,'pulled Luka to school','2008-05-22 17:28:00',5,NULL,27,30),(83,1,1,158,'dtc orchard, holly','2008-05-22 22:09:00','Greenwood Village/Centennial',180,NULL,'village to cmc','2008-05-22 22:09:00',6.43,NULL,26,25),(84,1,1,NULL,'via highline canal. Got a flat and had Jay pick up Luka at school.','2008-05-21 23:47:00','Centennial/Denver',NULL,NULL,'cmc to Jay Martin\'s house','2008-05-21 23:47:00',14.5,NULL,28,NULL),(85,0,1,NULL,'home to ACE to Wells Fargo to Safeway','2008-05-24 11:38:00','Denver',NULL,NULL,'rode around doing errends','2008-05-24 11:38:00',4,NULL,NULL,90),(86,0,1,NULL,'sessioned while waiting for my plane','2008-05-29 07:38:00','DIA Airport',NULL,NULL,'hacky sack session in airport','2008-05-29 07:38:00',NULL,NULL,NULL,60),(87,2,1,160,'Started at the top of China Creek Road., Parked rode down the creek bed. Crashed and broke my GPS. David neeeds to buy me one for Uncles\'s day. ','2008-06-01 15:12:00','CHina Creek, NC',180,NULL,'China Creek with David V','2008-06-01 15:12:00',4,NULL,29,60),(88,1,1,NULL,'From home along HLC to CMC. Took a couple shortcuts but followed the HLC route.','2008-06-03 08:26:00','Denver/Centennial',NULL,NULL,'commute to work long  path along HLC','2008-06-03 08:26:00',20,NULL,1,70),(89,5,1,NULL,'commute CMC to Village direct along Holly, Orchard, DTC. Then Pulled Luka home around the Cherry Creek Res','2008-06-03 17:52:00','Centennial/Greenwood Village',NULL,NULL,'commute from CMC to Village,  to Home around CC Res','2008-06-03 17:52:00',15.93,NULL,23,30),(90,2,1,NULL,'Village Orchard, Holly, CMC','2008-06-04 09:50:00','Greenwood Village/Centennial',NULL,NULL,'commute Village to CMC','2008-06-04 09:50:00',6.34,NULL,26,25),(91,3,1,NULL,'CMC Holly, Orchard, Village','2008-06-04 19:30:00','Centennial/GreenwoodVillage',NULL,NULL,'commute CMC to Village','2008-06-04 19:30:00',6.3,NULL,1,30),(92,0,1,NULL,'Village to CMC via Orchard, Holly.','2008-06-06 06:31:00','Greenwood Village/Centennial',NULL,NULL,'Commute from Village to Home via CC Res pulling Luka','2008-06-06 06:31:00',NULL,NULL,NULL,NULL),(93,0,1,146,'Pulled from Home to Village via 225 bike path','2008-06-06 07:38:00','Denver/Greenwood Village',188,NULL,'Pulled Luka from Home to Village','2008-06-06 07:38:00',5.51,NULL,NULL,30),(94,0,1,143,'Village to CMC via Orchard, Holly','2008-06-06 08:41:00','Greenwood Village/Centennial',168,NULL,'Commute from Village to CMC','2008-06-06 08:41:00',6.25,NULL,NULL,28),(95,1,1,NULL,'Rode from CMC up Holly, Orchard to Village. Then rode through the Cherry Creek Res with Luka in tow. Luka and I took out time and walked a bit. Beautiful Friday evening. ','2008-06-06 22:58:00','Centennial/Greenwood Village/Denver',NULL,NULL,'commute CMC to Village, then home via CC Res','2008-06-06 22:58:00',16,NULL,23,190),(96,5,1,NULL,'parked at Slaven Elementary and rode down the Platte to C470 to Kipling and then up Deer Creek. ','2008-06-08 14:50:00','Deer Creek',NULL,NULL,'Rode up Deer Creek canyon and back','2008-06-08 14:50:00',52,NULL,30,223),(97,1,1,NULL,'1 mile. Each lap is 0.5miles','2008-06-09 15:01:00','Comcast CMC',NULL,NULL,'2 laps around CMC','2008-06-09 15:01:00',NULL,NULL,25,NULL),(98,1,1,146,'Rode from CMC up Sunset route to Platte, REI, CC to home.','2008-06-09 22:30:00','Denver',176,NULL,'Commute CMC to Home via Platte, CC trail','2008-06-09 22:30:00',27,NULL,31,98),(99,1,1,NULL,'direct via Orchard, Holly','2008-06-09 08:43:00','Greenwood Village/Centennial',NULL,NULL,'Commute from Village to CMC ','2008-06-09 08:43:00',6.3,NULL,18,30),(100,1,1,NULL,'most direct from home','2008-06-10 09:16:00','Denver/Centennial',NULL,NULL,'Commute Home to CMC via Tamarac, Quincy, Holly','2008-06-10 09:16:00',8.5,NULL,17,35),(101,1,1,NULL,'.5 miles after lunch','2008-06-10 14:58:00','Comcast CMC',NULL,NULL,'walked around CMC','2008-06-10 14:58:00',0.5,NULL,25,10),(102,5,1,161,'Rode to the Gazebo, did ab crunches and pushups, then rode Parmalee Trail and back down. The duration below is just from the parking lot to the Gazebo. Modified.','2008-06-11 05:42:00','Mt Falcon Jeffco',180,NULL,'Mt Falcon Dawn Patrol','2008-06-11 05:42:00',2.6,NULL,32,45),(103,0,1,NULL,'Home Tamarac Quincy Holly','2008-06-16 08:42:00','Denver/Centennial',NULL,NULL,'comute Home to CMC ','2008-06-16 08:42:00',8.3,NULL,NULL,30),(104,0,1,145,'Parked car at The Great Indoors, rode through CCRes up CC Trail to REI, Down Platte, shortcutted at Little Dry Creek back to car','2008-06-17 06:13:00','Jeffco',185,NULL,'Cappuccino Loop CC','2008-06-17 06:13:00',49,NULL,NULL,1200),(105,1,1,136,'Was doing a big loop, but took a turn North at Twin Forks instead of the South Turn back to Deer Creek. ','2008-06-17 06:21:00','Jeffco',171,NULL,'HighGrade with Wrong turn at Twin Forks','2008-06-17 06:21:00',43,NULL,35,1200),(106,0,1,NULL,'tamarac, Quincy, Holly','2008-06-16 09:31:00','Denver/Centennial',NULL,NULL,'commute home to CMC','2008-06-16 09:31:00',8.3,NULL,NULL,NULL),(107,0,1,NULL,'holly, Orchard, DTC','2008-06-17 18:33:00','Centennial/Greenwood Village',NULL,NULL,'commute CMC to Village','2008-06-17 18:33:00',6.3,NULL,NULL,NULL),(108,0,1,NULL,'Pulled them along 225 bike path and stopped at Bicycle village','2008-06-20 05:34:00','Greenwood Village/Denver',NULL,NULL,'Pulled both boys in trailer from Village to home','2008-06-20 05:34:00',NULL,NULL,NULL,3600),(109,1,1,147,'Rode up to Red Mesa and did two CW loops, then CCW around Plymouth Mt and down to the parking lot.','2008-06-18 07:59:00','Jeffco',176,NULL,'Deer Creek Red Mesa Double, Plymouth Mt','2008-06-18 07:59:00',11.46,NULL,37,110),(110,0,1,NULL,'two workouts in one: Pulled the kids via the 225 bike path to the Village, then rode a new route to the CMC (see map)','2008-06-22 19:54:00','Denver/Centennial',NULL,NULL,'commute to work, pulled kids to school','2008-06-22 19:54:00',12,NULL,NULL,3600),(111,0,1,NULL,'Pulled both kids in the bike trailer along 225 bike path to village','2008-06-21 14:41:00','Denver/Centennial',NULL,NULL,'Commute home to Village: pulled kids to school','2008-06-21 14:41:00',5.5,NULL,NULL,1900),(112,0,1,NULL,'complicated route (see map)','2008-06-21 15:16:00','Greenwood Village/Centennial',NULL,NULL,'Commute Village to work via S. Yosemite route','2008-06-21 15:16:00',6.67,NULL,NULL,1900),(113,1,1,NULL,'Rode with Aidan. Luka in trailer','2008-06-22 17:24:00','Denver',NULL,NULL,'Home to CC Res Beach pulling trailer','2008-06-22 17:24:00',NULL,NULL,42,35),(114,0,1,NULL,'Rode to Bicycle Village to return a tire, and got spokes, handlebar tape. Rode around CC Res and took the 225 path, but rode across the light rail bridge as a shortcut. ','2008-06-25 01:06:00','Denver',NULL,NULL,'running errends and rode around CC Res','2008-06-25 01:06:00',NULL,NULL,NULL,3600),(115,0,1,NULL,'took a wrong turn at S. Uinta and S. Tamarac. Should have turned north at E Costilla just past S. Tamarac. ','2008-06-23 08:25:00','Denver/Centennial',NULL,NULL,'Comute to work-S. Yosemite, got lost','2008-06-23 08:25:00',8.47,NULL,NULL,30),(116,0,1,NULL,'Tried a new route. East on Orchard and north on Yosemite. Didn\'t like it. Too much stinky traffic. Nor shorter','2008-06-23 06:44:00','Centennial/Denver',NULL,NULL,'commute home from CMC-orchard yosemite','2008-06-23 06:44:00',8.7,NULL,NULL,30),(117,1,1,NULL,'Rode up, did one Red Mesa Loop, Plymout Mt. Down. Rode with Don Sims','2008-06-28 07:09:00','Jeffco',NULL,NULL,'Deer Creek Red Mesa Loop, Plymouth Mt','2008-06-28 07:09:00',NULL,NULL,37,4000),(118,0,1,NULL,'Rode along 470 Trail to Kipling and then rode up to the base of HighGrade. Decided not to ride up it because my bike was having mechanical issues and I wanted to take it to Bicycle Village before the closed. ','2008-06-29 02:35:00','Jeffco',NULL,NULL,'Rode from CMC to HighGrade','2008-06-29 02:35:00',NULL,NULL,NULL,5400),(119,0,1,NULL,'Rode from Front Range Community College to Ft Collins','2008-06-28 05:52:00','Boulder/Ft. Collins',NULL,NULL,'MS150 Day 1','2008-06-28 05:52:00',75,NULL,NULL,NULL),(120,0,1,NULL,'Rode from Ft. Collins back to Front Range Community College','2008-06-29 08:30:00','Ft. Collins/Boulder',NULL,NULL,'MS150 Day 2','2008-06-29 08:30:00',75,NULL,NULL,NULL),(121,0,1,NULL,'S. Yosemite','2008-06-30 07:42:00','Denver/Centennial',NULL,NULL,'Commute to work','2008-06-30 07:42:00',8.7,NULL,NULL,45),(122,0,1,NULL,'Took long path along HLC 22 miles','2008-06-30 05:59:00','Centennial/Denver',NULL,NULL,'Commute CMC to Home via HLC','2008-06-30 05:59:00',22,NULL,NULL,NULL),(123,0,1,NULL,'via Tamarac, Quincy, S Quincy. Took a weird route that didn\'t work out well. ','2008-07-01 10:40:00','Denver/Centennial',NULL,NULL,'home to cmc','2008-07-01 10:40:00',8.47,NULL,NULL,48),(124,0,1,NULL,'did the reverse S. Yosemite route. Rode by Fiddlers green and saw that Stevie Wonder was playing. Also rode by the DTC place where the have music every Tuesday during the summer. ','2008-07-01 22:36:00','Centennial/Greenwood Village',NULL,NULL,'CMC to Home via Englewood Dam','2008-07-01 22:36:00',NULL,NULL,NULL,60),(125,1,1,NULL,'40 miles. Up Deer Creek and Highgrade, Conifer, Aspen Park, right at N Turkey Creek, right at Twin Forks, left at the firestation to return on Deer Creek','2008-07-02 19:45:00','Jeffco/Conifer',NULL,NULL,'HighGrade loop','2008-07-02 19:45:00',40,NULL,43,180),(126,0,1,NULL,'Normal Tamarac, Quincy, Holly route','2008-07-03 08:21:00','Denver/Centennial',NULL,NULL,'commute to work via Quincy, Holly','2008-07-03 08:21:00',8.47,NULL,NULL,35),(127,2,1,NULL,'Rode from Bergan Park to Echo Lake and then up Mt Evans. Made it as far as Mile 8 before had to turn back because of a wicked hail storm.','2008-07-06 18:35:00','Mt Evans Colorado',NULL,NULL,'Bergan to Mt Evans Summit (mile 8 of 14)','2008-07-06 18:35:00',NULL,NULL,44,NULL),(128,1,1,NULL,'Tamarac, Quincy, Holly','2008-07-08 08:12:00','Denver/Centennial',NULL,NULL,'commute home to CMC','2008-07-08 08:12:00',8.43,NULL,17,43),(129,1,1,132,'Rode from Evergreen to Avon. 120 miles over Squaw, Loveland and Vail Passes. 9:48','2008-08-05 18:05:00','Evergeen/Avon',190,NULL,'Triple Bypass 2008','2008-08-05 18:05:00',120,NULL,46,35280),(130,0,1,NULL,'Stopped at Whole foods','2008-07-14 21:29:00','Centennial/Denver',NULL,NULL,'rode home from work','2008-07-14 21:29:00',8.5,NULL,NULL,40),(131,0,1,NULL,'rode up with Mike Liu','2008-07-16 19:05:00','Jeffco',NULL,NULL,'Deer Creek Highgrade','2008-07-16 19:05:00',27,NULL,NULL,120),(132,0,1,NULL,'Home to Quincy HLC trail to CMC','2008-07-18 16:24:00','Denver/Centennial',NULL,NULL,'Commute to work Quincy HLC','2008-07-18 16:24:00',14.34,NULL,NULL,3420);
/*!40000 ALTER TABLE `workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_telemetry_data`
--

DROP TABLE IF EXISTS `workout_telemetry_data`;
CREATE TABLE `workout_telemetry_data` (
  `id` bigint(20) NOT NULL auto_increment,
  `version` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `workout_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK2841EE52B882287A` (`workout_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout_telemetry_data`
--

LOCK TABLES `workout_telemetry_data` WRITE;
/*!40000 ALTER TABLE `workout_telemetry_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `workout_telemetry_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-09-16  1:45:30
