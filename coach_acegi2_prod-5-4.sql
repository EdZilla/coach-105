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
INSERT INTO `auth_user` VALUES (1,132,'','ejy@SummitBid.com','\0','','e9c4bb7e20067b5707c2c1c7375f549e','Ed Young','ed',71,164),(6,3,'','aidan@summitbid.com','','','3f75f31f946bc04d8f781fb155d2b17e','aidan','aidan',NULL,NULL),(7,1,'','steve@myplaceinparadise.com','','','c4fe4c936835156672a5ad76e907b917','Steve Miller','steve',NULL,NULL),(8,1,'','Alan.McQueen@dcsdk12.org','','','eaad5f30ece302b762fb70672a1728f4','Alan McQueen','alan',NULL,NULL),(13,2,'','daddyconan@yahoo.com','','','15c6d8e89899b0dc606d2498d102bd71','Mike McDanial','daddyconan',59,NULL),(14,1,'','gramos112@gmail.com','','','a0dc6df8f07627f1f63b1b9394dcd200','George Ramos','AbrahamRa',NULL,NULL),(15,1,'','velopete@hotmail.com','','','bfda0e744a32cfc10b43fc328e4b60b5','Pete','velopete',NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,6,0,'none',0,'none','none','summitbid_logo.gif',NULL,NULL),(3,1,5280,'CMC, Holly, Orchard, DTC, Hoffman Park, Village',6,'Greenwood Village/Centennial','CMC to Village direct','Commuting - Home to CMC via Tamarac, Quincy, Highline 8-21-2007.jpg','',NULL),(2,3,5500,'Home, Tamarac, Rosemary Way, Princeton, Quincy, HLC, CMC',15,'Denver/Greenwood Village/Centennial','Home to CMC via Tamarac, Quincy, HLC','Commuting - Home to CMC via Tamarac, Quincy, Highline 8-21-2007.jpg','Profile Home to CMC via DTC, Rosemary Way, Princeton, Quincy, HLC 8-21-2007, Elevation - Time.png',5680),(4,2,5555,'View of trail from CMC to Platte via Lee gulch',3,'centennial ','Lee Gulch ','','',5666),(5,2,6300,'Great hike for kids. Start at parking lot and approach to Morrison Slide trail and go up. The climb is short and once at the top it\'s beautiful. Traverse the top and head down the steep and then return on Red Rocks trail. ',5,'Morrison Colorado','Mathews-Winters Morrison Slide','My Activities - Mathews Winters open space park 8-11-2007-2.jpg','My Activities - Mathews Winters open space park 8-11-2007, Elevation - Distance.jpg',6800),(6,4,6350,'Profile of Morrison Slide trail',5,'Morrison Colorado','Mathews-Winters Morrison Slide trail profile','My Activities - Mathews Winters open space park 8-11-2007, Elevation - Distance.jpg','',6800),(18,0,5555,'I tried to stay off the road and caused myself alot of grief. I should have just gotten on the right traffic lane and dealt with it. Instead I was haveing to wait for traffic and lights in the left lane and sidewalk all the time. ',6.43,'Greenwood Village/Centennial','Village to CMC via Orchard','Commuting Greenwood Village - Centennial 4-23-2008.png',NULL,NULL),(7,0,5555,'Rode out and returned on some access road instead of the C470 trail',18,'Centennial','CMC to Chatfield RT with alt return','CMC to Chatfield and back-lunchtime- 9-14-2007.jpg',NULL,NULL),(8,0,5555,'8.5 mile loop',9,'centennial','CMC to CMC loop via HLC and CO blvd','Cycling - CMC to CMC loop via HL and CO 10-9-2007.jpg',NULL,NULL),(9,0,5555,'Detail of roads where Big Dry Creek meets the Platte trail',10,'Centennial','Detail of Platte turn off to Big Dry Creek trail','Road - E Turn off of Platte toward Big Dry Creek 10-24-2007.jpg',NULL,NULL),(10,0,5555,'CMC RT: CMC, 470, Platte, Big Dry Creek, misc roads, Colorado Blvd CMC',20,'Littleton','CMC RT: CMC, 470, Platte, Big Dry Creek, misc roads, Colorado Blvd CMC','Road - CMC RT to 470 to Platte to Big Dry Creek to Highline misc roads 10-24-2007.jpg',NULL,NULL),(11,0,5555,'CMC to HLC, Sunset, Sherman, Centennial, Lehow, Big Dry Creek, Platte',10,'Littleton','Detail of Sunset to Platte route','Commute-Highline at Sunset to Platte via Sherman-Centennial-Lehow-BigDry Creek.jpg',NULL,NULL),(12,0,5555,'CMC RT: Sunset, Platte, south to Lee Gulch, CMC',20,'Centennial','CMC RT: Sunset, Platte, south to Lee Gulch, CMC','Bike Path - CMC to Sunset to N. Big Dry Creek to Centennial to Platte to Lee Gulch to HL to Ralph Schomp  RT 7-13-2007.jpg',NULL,NULL),(13,0,5555,'CMC to Village via HLC, Quincy, DTC, CCH, Village',14,'Greenwood Village/Centennial','CMC to Village via HLC, Quincy, DTC, CCH, Village','CMC to Village via HLC, Quincy, DTC, CCHS. 4-18-2008.png',NULL,NULL),(14,0,5555,'Village to CMC via Belleview, Holly',7,'Greenwood Village/Centennial','Village to CMC via Belleview, Holly','Village to CMC via Belleview, Holly. 4-18-2008.png',NULL,NULL),(15,0,5555,'Belleview and Sante Fe to CMC via Lee Gulch',9,'Littleton','Belleview and Sante Fe to CMC via Lee Gulch','Commuting Belleview and Sante Fe to CMC via Platte, Lee Gulch 4-14-2008.png',NULL,NULL),(16,3,5300,'Took a detour to look for Dave D\'s office.',20,'Centennial','CMC RT: Chatfield res','Road CMC to Chatfield RT 4-15-2008.png','Profile Road CMC to Chatfield RT 4-15-2008, Elevation - Time.png',5800),(17,0,5555,'Home to CMC via Tamarac, Rosemary Way, Princeton, Quincy, Holly, Dry Creek, CMC',8,'Denver to Centennial','Home to CMC via Tamarac, Rosemary Way, Princeton, Quincy, Holly, Dry Creek, CMC','Home to CMC via DTC, Rosemary Way, Princeton, Quincy, Holly, Dry Creek 3-26-2008.png',NULL,NULL),(19,3,5500,'Sucks. Riding along Belleview is a nightmare. 8.04 miles ',8.04,'Centennial/GreenwoodVillage','Commute CMC to Village via Dexter/Belleview','Commuting CMC to Village via Dexter-Belleview 4-24-2008.png','Profile CMC to Village via Dexter-Belleview Elevation-Time 4-24-2008.png',NULL),(20,2,5300,'CMC to Kipling/Kentucky',16.5,'Centennial/Lakewood','CMC to Gordon\'s old house','Road CMC to Gordon\'s house and back 9-7-2007.png','Profile CMC to Gordon\'s House and Back 9-7-2007, Elevation - Time.png',NULL),(21,2,5260,'Rode from home to Redrocks park. Route was was west on Dartmouth, south on Platte, west on Bear Creek to Kipling. Then north on Kipling to Jewel and then over the Hogback and across highway 8 to RedRocks park. Lots of activity at Redrocks. ',50,'Denver to Morrison','Home to Redrocks and back','Road Home to Redrocks and back 4-27-2008.png','Road Home to Redrocks and back 4-27-2008, Elevation - Time.png',6486);
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Dumping data for table `equipment_ref`
--

LOCK TABLES `equipment_ref` WRITE;
/*!40000 ALTER TABLE `equipment_ref` DISABLE KEYS */;
INSERT INTO `equipment_ref` VALUES (3,0,1,19),(2,0,8,16),(4,0,1,20),(5,0,1,22),(6,0,1,13),(7,0,1,21),(8,0,1,23),(9,0,13,20),(11,0,1,61),(12,0,13,61),(13,0,1,62),(14,0,1,64);
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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,0,'1 hour spin class','spin class',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'solo','hacky sack session',1,NULL,NULL,'http://www.youtube.com/v/d2qS67dDQrQ&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,4,'old school, bad form','situps',1,NULL,NULL,'http://www.youtube.com/v/TKg_cdwq9l4&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,'like trainer described: 35 seconds, rest, repeat','ab isometric',1,NULL,NULL,'http://www.youtube.com/v/zJGlP-Z21ws&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,3,'30lbs','dumbell press',1,NULL,NULL,'http://www.youtube.com/v/tka3-WM3r9g&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,1,'Use machine. see video','lateral pulldown',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,'jog around the gym and dribble a basket ball. Keep HR up around 160','job/dribble basketball',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135,180,NULL,NULL),(48,1,'old school, nothing special. Reduce the reps each set.','pushups',NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL),(32,0,'larger machine uses sitting position','ab crunch machine',1,NULL,NULL,'http://www.youtube.com/v/F-hrStkNNH0&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,0,'simple hinged machine isolates upper abs','ab machine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,3,'dips. 10 ea. in various hand positions','assisted dip',1,NULL,NULL,'http://www.youtube.com/v/A2RrGfzg6_w&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,3,'from cmc to quincy 12.57 miles 155bpm avg','biked 12.57 miles from CMC ',NULL,NULL,NULL,NULL,12.57,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,0,'3 reps of 15, 30 sec rest','leg press machine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,0,'3 sets of 12, 30 sec rest','rowing machine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,0,'wrap around hands about shoulder width, straight out in front, then out to sides. 3 sets of 10','rubber band for lats',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,0,'hold ball with legs at 90, shoulders up. Down to 65, up to 90, arms touch ball, then over head and back up. Legs 65 to 90. 45 Second sets.','ab iso with ball',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,0,'on back free weights','Bench Press',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,0,'Ride with kids, low impact','Bike ride with kids',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,0,'pull luka in bike trailer','bike ride pulling trailer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,0,'Just rode around for fun','bike, casual',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,0,'10. 5 miles. Parked at High School, rode down Holly, got on path to Highline canal path on to CMC','bike commute to work',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,0,'biked up Holly to Orchard, through westland park, up Monoco, to Quincy. East on Quincy to Princeton and up Tamarac to home. ','biked from CMC to Home',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,0,'can be exhausting','wrestled with kids',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,0,'Click here to enter description','test embedded video',1,NULL,NULL,'http://www.youtube.com/v/TKg_cdwq9l4&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,0,'run on treadmill','treadmill',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,2,'Simple whole leg workout','walking lunge',1,NULL,NULL,'http://www.youtube.com/v/xYTNEh4r5PI&hl=en',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(29,0,'with machine','lateral pulldown',1,NULL,NULL,'http://www.youtube.com/v/kgF37pq861Q&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,1,'Old school, nothing special','pushups',1,NULL,NULL,'http://www.youtube.com/v/6bleiB13I2E&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,0,'Click here to enter description','pullups',1,NULL,NULL,'http://www.youtube.com/v/742v8O64154&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,1,'Using exercise ball, lay back and do crunches','ab crunch with ball',1,NULL,NULL,'http://www.youtube.com/v/VVBddP5oW8Y&hl=en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,1,'stand, step forward up to a step, then leg goes back and bends. Repeat 12 times. Then do other leg. ','back and forth lunges',1,NULL,NULL,NULL,NULL,12,NULL,3,NULL,NULL,NULL,NULL),(36,0,'head up on decline board, then hold legs out at about 54 deg, and then crunch to chest. Repeat ','decline board ab crunchs',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,3,'decline board, raise legs up and back, and raise buttocks up.','decline bench toes to the sky',1,NULL,NULL,'http://www.youtube.com/v/AsduzAwA0H4&hl=en',NULL,NULL,90,NULL,NULL,NULL,NULL,NULL),(38,2,'do a pushup and then raise one arm up and back, straight up.\nStart with 12 each arm and reduce for each set.','pushups, then extend arm up',1,NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,NULL),(39,1,'stand, hold both cable handles palm up, bring forward with arms extended.','cable upper body thing',1,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(40,0,'stand over free weight bar, bend back, pull bar up toward belly','inverted bench press',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,1,'hold rubber band shoulder width, extend arms out','rubber band for upper back',1,NULL,NULL,NULL,NULL,12,NULL,3,NULL,NULL,NULL,NULL),(53,1,'direct route to work from Luka\'s Daycare','Bike from Village to CMC',NULL,13,32,NULL,6,NULL,1680,NULL,NULL,NULL,NULL,NULL),(54,0,'Rode up holly to Orchard, east and up dtc to Yosemite and to village','bike commute from CMC to village',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,0,'downhill ski','Downhill Ski',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,1,'on machine, legs at 90 deg','hack squat',NULL,NULL,NULL,'http://www.youtube.com/v/e1lNykZYsms&hl=en',NULL,12,NULL,3,NULL,NULL,NULL,NULL),(57,0,'ball behind head and shoulders, then dumbell press','dumbell press on swiss ball',NULL,NULL,NULL,'http://www.youtube.com/v/3RgXg_-pz5k&hl=en',NULL,12,NULL,3,NULL,NULL,NULL,NULL),(58,0,'sit on ball, hands up, feet up on machine, pull bar to chest','pull down bar on ball',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(59,0,'back agains a wall, normal curl, then arms up and out','bar curl, then arms out',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(60,0,'on decline board, head up, bring legs all the way back over head','decline board ab crunch',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),(61,0,'After Science Museum, the kids and I went to Johnny Rockets. I rode home pulling the trailer','Rode home From Cherry Creek mall',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,0,'From Discount Tire at Belleview and Sante Fe down Platte to Lee Gulch and misc bike paths to CMC','lunch time ride from tire shop',NULL,12,25,NULL,9,NULL,NULL,NULL,153,191,NULL,NULL),(10,0,'description','name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,0,'via neighborhood behind Village, to Orchard, down Holly, through \'hood N of CMC','Commute from Village to CMC',NULL,12,31,NULL,6,NULL,NULL,NULL,157,177,NULL,NULL),(64,0,'Rode to Chatfield and back. Met up with Dave Diller','CMC to Chatfield RT',NULL,13,35,NULL,20,NULL,NULL,NULL,156,NULL,NULL,NULL),(65,0,'keep revs at 110per minute','exercise bike intense',NULL,NULL,NULL,NULL,NULL,NULL,120,NULL,NULL,NULL,NULL,NULL),(66,0,'keep revs at 50 per minute. Resistance 60%','exercise bike moderate',NULL,NULL,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,NULL,NULL),(67,0,'Hold at shoulders, swat down and keep feet flat on floor, no heel lift.','dumbell sqats',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(68,0,'Squat to floor, raise bells from floor to ceiling','Dumbell floor to ceiling',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(69,0,'Elbows out and higher than hands.','Dumbell hips to chest',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(70,0,'In front of mirror, stand back flat, raise bells with elbows back.','Dumbell standing row',NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),(71,0,'Left work early so I rode the Highline Canal trail to Quincy, stopped at MicroCenter, and then through Cherry Creek High School to the Village.','Rode from CMC to Village via HLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,0,'Rode up Dexter to Orchard, east and up dtc to Yosemite and to village','commute CMC to Village',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercise_ref`
--

LOCK TABLES `exercise_ref` WRITE;
/*!40000 ALTER TABLE `exercise_ref` DISABLE KEYS */;
INSERT INTO `exercise_ref` VALUES (1,0,2,2),(2,0,3,2),(3,0,4,2),(5,0,7,2),(6,0,1,6),(7,0,1,7),(8,0,4,7),(10,0,11,7),(11,0,12,7),(12,0,2,8),(13,0,11,8),(14,0,12,8),(16,0,2,9),(18,0,10,9),(19,0,11,9),(20,0,13,10),(21,0,17,11),(22,0,16,11),(23,0,15,11),(24,0,14,11),(25,0,2,18),(27,0,11,18),(28,0,4,18),(29,0,17,18),(30,0,18,19),(31,0,2,20),(32,0,19,20),(33,0,2,21),(34,0,4,21),(35,0,12,21),(36,0,11,21),(37,0,10,21),(70,0,1,37),(40,0,20,22),(41,0,20,23),(42,0,1,25),(43,0,10,25),(44,0,11,25),(45,0,1,27),(46,0,10,27),(47,0,11,27),(49,0,12,27),(50,0,22,28),(51,0,23,29),(54,0,25,4),(55,0,10,5),(56,0,2,33),(57,0,12,33),(58,0,34,33),(59,0,1,34),(60,0,1,35),(61,0,2,35),(62,0,35,36),(63,0,36,36),(64,0,37,36),(65,0,38,36),(66,0,39,36),(67,0,40,36),(68,0,41,36),(69,0,2,37),(80,0,54,42),(79,0,53,39),(81,0,55,43),(82,0,2,44),(83,0,20,44),(84,0,56,45),(85,0,57,45),(86,0,58,45),(87,0,59,45),(88,0,36,45),(89,0,60,45),(90,0,25,46),(91,0,19,47),(92,0,61,47),(93,0,62,48),(94,0,63,50),(95,0,64,51),(96,0,54,52),(97,0,28,53),(98,0,65,53),(99,0,66,53),(100,0,67,53),(101,0,68,53),(102,0,69,53),(103,0,70,53),(104,0,41,53),(105,0,57,53),(106,0,53,56);
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
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,3,'oatmeal w granola, raisins, etc','oatmeal',26,NULL,NULL),(2,3,'carafe of french press coffee','carafe of coffee',3,NULL,NULL),(3,2,'sometimes with lettuce and tomato','turkey sandwich',2,NULL,NULL),(4,1,'whole wheat bun, lettuce, tomato','cheese burger',2,NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en'),(5,0,'','yogurt',NULL,NULL,NULL),(6,0,'','Pizza Slice',NULL,NULL,NULL),(7,1,'','banana',2,NULL,NULL),(8,0,'','toast w peanut butter',NULL,NULL,NULL),(9,0,'little bagels we got for the kids','mini bagel, wheat',1,NULL,NULL),(10,4,'lettuce and carots, etc. Light dressing','salad',41,4.27,NULL),(12,0,'to go salad w chicken','salad w chicken',2,NULL,NULL),(13,0,'none','default food place holder',3,NULL,NULL),(14,0,'name brand oatmeal packages','oatmeal from packets',3,NULL,NULL),(15,0,'from a can','chicken noodle soup',3,NULL,NULL),(16,0,'from cafeteria-spicy','vegatable and chorizo soup',3,NULL,NULL),(17,0,'burger with swiss cheeese and mini bagel and letuce','cheesburger',2,NULL,NULL),(18,0,'Chicken noodle','Healthy Choice Soup',3,NULL,NULL),(19,0,'Odells 900 Schilling','dark beer',3,NULL,NULL),(20,0,'Stella Artios','lighter beer',3,NULL,NULL),(21,0,'awesome','Baked Char w rich Spinach sauce',3,NULL,NULL),(22,0,'appetizer','Fish Taco',3,NULL,NULL),(23,0,'','Steamed Veggies',2,NULL,NULL),(24,0,'2 eggs, veggies, sausage, green chille','mervin veggie, sausage, green chillie omelet',3,NULL,NULL),(25,0,'turkey chunks, veggies, broth.','Old fashioned Turkey vegetable soup',3,NULL,NULL),(26,2,'large diet coke','large diet coke',15,NULL,NULL),(27,0,'whole wheat','english muffin',3,NULL,NULL),(28,0,'awesome soup from cafeteria','soup, beaf noodle',3,NULL,NULL),(29,0,'beaf patty w cheese','hamburger patty',3,NULL,NULL),(30,0,'single slice ','turkey bacon slice',3,NULL,NULL),(31,0,'Burrito, enchillada, taco combo, (*burp*)','mexican dish',3,NULL,NULL),(32,0,'awesome soup from cafeteria','Tortilla Soup',3,NULL,NULL),(33,0,'w butter','toast',2,NULL,NULL),(34,0,'junk food chips','corn chips',3,NULL,NULL),(35,0,'Penna Pasta with spinach, an cheese and yummy stuff','Penna Rosa',3,NULL,NULL),(36,0,'junki food','burito supreme',3,NULL,NULL),(37,0,'Arlene\'s awesome vegan pumkin muffins','muffins, pumpkin',3,NULL,NULL),(38,2,'vegan burgers from costco','burger, veggie burger',36,NULL,NULL),(39,0,'bean and cheese','burrito, frozen',3,NULL,NULL),(40,0,'chicken tikka masala','frozen dinner, ethnic gourmet',3,NULL,NULL),(41,0,'Egg Spinach cheese bagel sandwich, coffee','sandwich w egg, cheese',3,NULL,NULL),(42,0,'single cup','coffee, cup',3,NULL,NULL),(43,0,'soup from cafeteria','Soup, Cream of Brocoli',3,NULL,NULL),(44,0,'Whole Grain Tuscan Linguini','Tuscan Linguini',3,NULL,NULL),(46,0,'awesome wrap from deli: Roast beaf, olives, spinach, horse radish sauce, spinach tortilla.','EdZilla wrap',2,NULL,NULL),(47,0,'Click here to enter description','test session food 1',2,NULL,NULL),(48,0,'Click here to enter description','test session food 2',2,NULL,NULL),(49,0,'Click here to enter description','test session food 3',2,NULL,NULL),(50,0,'n slices','turkey bacon',2,NULL,NULL),(51,0,'what was I thinking...','donut',2,NULL,NULL),(52,0,'Miller Ice','beer, light beer',2,NULL,NULL),(53,0,'faux cheetos','cheetos',2,NULL,NULL),(54,0,'from cafeteria','clam chowder',2,NULL,NULL),(55,0,'got it at the Valentines day run','mix 1 health drink',2,NULL,NULL),(56,0,'junk food','McDonalds McGriddle',2,NULL,NULL),(57,1,'can of diet soda.','diet soda pop',44,NULL,NULL),(58,0,'sugery cereal ','cereal, Honey Bunch Oats',2,NULL,NULL),(59,0,'way rich. Stay away.','chocolate brownie',2,NULL,NULL),(60,1,'2 eggs, veggies, cheese, sausage, green chile','mervin omlet',5,NULL,NULL),(61,2,'with seeds.','orange',42,NULL,NULL),(62,0,'with seeds','grapefruit',2,NULL,NULL),(63,0,'Click here to enter description','weight watchers chicken',2,NULL,NULL),(64,0,'skinless chicken breast','chicken breast',2,NULL,NULL),(65,0,'mostly veggies, usually some pasta salad, not too much dressing','trip to salad bar',2,NULL,NULL),(66,0,'From cafeteria. pretty fatty, I recon. ','cream of mushroom soup',2,NULL,NULL),(67,0,'Spinach Tortilla, roas beaf, shrooms, olives, tomato, cheese, horse radish-Awesome!','EdZilla sandwich',2,NULL,NULL),(68,2,'brand of \"health\" drink','Vitamin Water',17,NULL,NULL),(69,0,'Roll your own Gyro fixins from some Greek restaurant Arlene went to','Gyro Sandwich',2,NULL,NULL),(70,0,'regular beer','Moosehead beer',2,NULL,NULL),(71,1,'test cost','test cost',2,3.33,NULL),(72,1,'test','test cost 2',2,4.33,NULL),(73,2,'test','test cost 3',2,0.9,NULL),(74,0,'Click here to enter description','test food nutrion data',3,NULL,NULL),(75,1,'test nutrition data','test food',3,NULL,NULL),(76,0,'Click here to enter description','test nutrition data',5,NULL,NULL),(77,0,'Click here to enter description','test aroony',6,NULL,NULL),(78,0,'Click here to enter description','test animation',7,NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en'),(79,0,'Click here to enter description','test no animation',8,NULL,NULL),(80,0,'yummy','cheesy potatoes',9,NULL,'http://www.youtube.com/v/-9kmQuefbtA&hl=en'),(81,1,'Click here to enter description','lemonade',10,NULL,'http://www.youtube.com/v/iRC_i4a2oP8&hl=en'),(82,0,'bowtie pasta, black beans, peas, ','pasta salad',12,NULL,NULL),(83,0,'with butter and jam','rye toast',13,NULL,NULL),(84,0,'Small, but it\'s gotta be fattening.','cheesy vegetable soup',14,1.65,NULL),(85,0,'all the sugar, and stuff','non diet soda',16,NULL,NULL),(86,0,'Roast beef or whatever, veggies, etc','subway sandwich',18,4,NULL),(87,0,'small bag of cheetos','cheetos',19,NULL,NULL),(88,0,'orville redenbachers, with extra margarine','popcorn',20,NULL,NULL),(89,0,'grilled potatoes','hash browns',21,NULL,NULL),(90,0,'2 small ones','pancakes',22,NULL,NULL),(91,0,'\"Rich Chocolate\" from a packet','Hot Chocolate',23,NULL,NULL),(92,0,'turkey burger patty','turkey burger',24,NULL,NULL),(93,0,'energy bar','zone bar',25,NULL,NULL),(94,0,'various soups from cafeteria','soup from caferia',27,1.75,NULL),(95,0,'wings, chips, pizza like things, fries, onion rings, etc.','miscellaneous bar food',28,NULL,NULL),(96,0,'dinasaur shaped chicken things','chicken dino nuggets',29,NULL,NULL),(97,0,'fudge bar','fudge bar',30,NULL,NULL),(98,0,'from starbucks','coffee cake',31,2,NULL),(99,0,'From Chipotle, Wahoo\'s, etc','large burito',32,6,NULL),(100,0,'regular bar','power bar',34,NULL,NULL),(101,0,'large','grapefruit',35,NULL,NULL),(102,0,'egg, spinach, ','einstein\'s egg pannini',37,6.99,NULL),(103,0,'light rye, swiss cheese, tomato, letuce, mustard','pastrami sandwich',38,5,NULL),(104,0,'noodles dish','penne rosa',39,8,NULL),(105,0,'Nutritional snack/energy bar','cliff bar',40,NULL,NULL),(106,0,'italian sausage and veggies, I guess','Italian Wedding Soup',45,1.85,NULL),(107,0,'little burgers for the kids','mini burger w cheese',46,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_ref`
--

LOCK TABLES `food_ref` WRITE;
/*!40000 ALTER TABLE `food_ref` DISABLE KEYS */;
INSERT INTO `food_ref` VALUES (1,0,7,1),(2,0,8,1),(3,0,9,3),(4,0,2,1),(5,0,5,10),(6,0,10,10),(7,0,12,12),(8,0,14,13),(9,0,2,13),(10,0,17,14),(11,0,5,15),(12,0,14,15),(13,0,2,15),(14,0,3,16),(15,0,18,16),(16,0,21,17),(17,0,20,17),(18,0,19,17),(19,0,22,17),(20,0,23,17),(21,0,2,18),(22,0,26,19),(23,0,5,20),(24,0,27,20),(25,0,3,21),(26,0,26,21),(27,0,28,21),(28,0,3,22),(29,0,29,23),(30,0,2,24),(31,0,9,24),(32,0,30,24),(33,0,30,24),(34,0,31,25),(35,0,5,26),(36,0,2,26),(37,0,3,26),(38,0,3,27),(39,0,26,27),(40,0,32,27),(41,0,2,28),(42,0,34,28),(43,0,35,29),(44,0,26,29),(45,0,2,31),(46,0,37,31),(47,0,38,32),(48,0,39,32),(49,0,38,33),(50,0,40,33),(51,0,2,35),(52,0,37,35),(53,0,26,36),(54,0,40,36),(55,0,35,37),(56,0,2,39),(57,0,26,40),(58,0,40,40),(59,0,43,40),(60,0,44,41),(61,0,1,42),(62,0,8,42),(63,0,15,42),(66,0,27,44),(65,0,2,44),(67,0,46,45),(68,0,26,45),(69,0,47,46),(70,0,49,46),(71,0,48,46),(72,0,2,49),(73,0,5,49),(74,0,5,49),(75,0,50,49),(76,0,51,49),(77,0,52,48),(78,0,53,48),(79,0,54,50),(80,0,26,50),(81,0,2,52),(82,0,7,52),(83,0,55,52),(84,0,56,53),(85,0,38,55),(86,0,57,55),(87,0,38,55),(88,0,38,56),(89,0,26,56),(90,0,18,56),(91,0,2,57),(94,0,2,58),(93,0,50,57),(95,0,58,58),(96,0,59,59),(97,0,3,60),(98,0,26,60),(99,0,44,61),(100,0,60,62),(101,0,42,62),(102,0,62,63),(103,0,61,63),(104,0,3,64),(105,0,1,65),(106,0,42,65),(107,0,63,66),(108,0,26,66),(109,0,38,67),(110,0,64,67),(111,0,65,70),(112,0,65,70),(113,0,65,70),(114,0,20,70),(115,0,26,69),(116,0,66,69),(117,0,67,69),(118,0,1,68),(119,0,42,68),(120,0,58,71),(121,0,2,71),(122,0,7,71),(123,0,68,71),(124,0,1,74),(125,0,9,74),(126,0,69,75),(127,0,70,75),(128,0,1,78),(129,0,38,1),(130,0,1,1),(131,0,6,6),(132,0,6,6),(133,0,80,85),(134,0,81,85),(135,0,2,86),(136,0,2,87),(137,0,42,87),(140,0,83,87),(139,0,60,87),(141,0,84,88),(142,0,26,88),(143,0,85,89),(144,0,15,90),(145,0,26,90),(146,0,60,91),(147,0,83,91),(148,0,6,92),(149,0,25,92),(150,0,85,92),(151,0,38,93),(152,0,68,93),(153,0,6,93),(154,0,38,94),(155,0,40,95),(156,0,86,95),(157,0,2,96),(158,0,38,97),(159,0,29,97),(160,0,68,97),(161,0,87,97),(162,0,2,98),(163,0,7,98),(164,0,5,98),(165,0,6,99),(166,0,29,100),(167,0,38,100),(168,0,88,100),(169,0,60,101),(170,0,2,101),(171,0,89,101),(172,0,90,101),(173,0,85,103),(174,0,42,104),(175,0,60,104),(176,0,25,105),(177,0,57,105),(178,0,91,106),(179,0,38,108),(180,0,92,108),(181,0,68,108),(182,0,2,109),(183,0,93,109),(184,0,1,109),(185,0,26,111),(186,0,94,111),(187,0,19,112),(188,0,19,112),(189,0,95,112),(190,0,95,112),(191,0,38,114),(192,0,92,114),(193,0,96,114),(194,1,88,115),(195,0,97,115),(196,0,2,116),(197,0,5,116),(198,0,98,116),(199,0,94,117),(200,0,46,117),(201,0,68,119),(202,0,99,119),(203,0,9,120),(204,0,2,120),(205,0,40,121),(206,0,38,122),(207,0,2,123),(208,0,100,123),(209,0,40,124),(210,0,92,127),(211,0,2,128),(212,0,5,128),(213,0,2,128),(214,0,101,129),(215,0,61,129),(216,0,40,130),(217,0,38,130),(218,0,2,132),(219,0,7,132),(220,0,38,133),(221,0,54,133),(222,0,38,134),(223,0,102,135),(224,0,103,136),(225,0,104,137),(226,0,46,139),(227,0,26,139),(228,0,2,141),(229,0,105,141),(230,0,61,141),(231,0,40,142),(232,0,29,142),(233,0,38,143),(234,0,38,143),(235,0,10,143),(236,0,2,144),(237,0,7,144),(238,0,51,144),(239,0,51,144),(240,0,10,145),(241,0,50,146),(242,0,61,146),(246,0,106,159),(244,0,26,149),(247,0,26,159),(248,0,107,160),(249,0,38,161),(250,0,60,163),(251,0,42,163),(252,0,83,163),(253,0,92,164),(254,0,38,164),(255,0,57,164),(256,0,31,162);
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
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (1,1,1,'2008-02-03 08:10:00','light breakfast','breakfast',10,NULL),(2,0,1,'2008-02-03 11:19:00','','lunch',NULL,NULL),(3,0,1,'2008-02-05 08:12:00','','breakfast',NULL,NULL),(4,0,1,'2008-02-09 12:12:00','at noodles with Luka','lunch',NULL,NULL),(5,2,1,'2008-02-09 17:13:00','grilled cheesburger','dinner',NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en'),(6,2,1,'2008-02-10 18:27:00','Had a Pacific Plantation pizza and a diet coke. Ate half and took rest home. al rocks','Dinner at Beu Jo\'s',25,NULL),(7,1,1,'2008-02-13 09:54:00','light breakfast. had a bagel','breakfast',NULL,NULL),(8,0,1,'2008-02-14 07:30:00','little bagels we got for the kids','mini bagel, wheat',NULL,NULL),(9,0,1,'2008-02-14 11:30:00','soup with the boys','lunch',NULL,NULL),(10,0,1,'2008-02-15 08:35:00','light dinner at home','dinner',NULL,NULL),(11,0,1,'2008-02-15 08:15:00','Oatmeal, coffee, apex bar','breakfast',NULL,NULL),(12,0,1,'2008-02-17 11:40:00','lunch with arlene at sweet tomatos','lunch',NULL,NULL),(13,0,1,'2008-02-18 07:37:00','oatmeal and coffee','breakfast',NULL,NULL),(14,0,1,'2008-02-19 18:50:00','cheesburger','dinner',NULL,NULL),(15,0,1,'2008-02-20 08:38:00','yogurt, oatmeal, coffee','breakfast',NULL,NULL),(16,0,1,'2008-02-20 12:25:00','soup, sandwich, soda','lunch',NULL,NULL),(17,0,1,'2008-02-20 17:31:00','Went to Bonefish Grill and had a fish place with a rich spinache sauce, bread, fish taco, and two beers. ','Big Dinner out with Work guys',NULL,NULL),(18,0,1,'2008-02-25 11:38:00','coffee, mervin omelet.','breakfast',NULL,NULL),(19,0,1,'2008-02-25 12:28:00','turkey soup, and diet soda','lunch',NULL,NULL),(20,1,1,'2008-02-27 10:19:00','coffe, english muffin, yogurt','breakfast',NULL,NULL),(21,0,1,'2008-02-26 11:30:00','soup, sandwich, soda','lunch',NULL,NULL),(22,0,1,'2008-02-26 17:25:00','turkey sandwich','dinner',NULL,NULL),(23,0,1,'2008-02-27 21:03:00','hamburger patty, 2 diet sodas','dinner',NULL,NULL),(24,0,1,'2008-02-28 07:32:00','coffee, mini bagel with cream cheese, two slices of bacon','breakfast',NULL,NULL),(25,0,1,'2008-02-28 14:47:00','at LosDosPortillos','lunch with Tony, Mark, Don, Jim, Doug',NULL,NULL),(26,0,1,'2008-03-06 12:35:00','coffee, yogurt, sandwich','breakfast',NULL,NULL),(27,0,1,'2008-03-06 11:05:00','soup, sandwich, soda','lunch',NULL,NULL),(28,0,1,'2008-03-07 07:44:00','coffee, chips','breakfast',NULL,NULL),(29,0,1,'2008-03-06 17:47:00','Me Pasta Rosa, him Wisc. MacNCheese','dinner at Noodles with Luka',NULL,NULL),(30,0,1,'2008-03-07 22:13:00','junk food','taco bell burrito supreme',NULL,NULL),(31,1,1,'2008-03-09 09:53:00','coffee, Arlene\'s pumpkin muffins','breakfast',NULL,NULL),(32,0,1,'2008-03-08 20:57:00','frozen burrito with cheese, harvest burger','late dinner',NULL,NULL),(33,0,1,'2008-03-08 15:07:00','frozen indian meal with harvest burger','dinner',NULL,NULL),(34,0,1,'2008-03-09 11:12:00','Egg Spinach cheese bagel sandwich, coffee','Lunch at Einsteins Bagels',NULL,NULL),(35,0,1,'2008-03-10 07:41:00','coffee, ','breakfast',NULL,NULL),(36,0,1,'2008-03-10 13:52:00','Ethnic Goumet Chicken thing and a soda','lunch',NULL,NULL),(37,0,1,'2008-03-10 18:04:00','Him mac n cheese, me curly noodles n water','dinner with Luka at noodles',NULL,NULL),(38,0,1,'2008-03-11 19:43:00','At the rest of my noodles dinner from last night','dinner',NULL,NULL),(39,0,1,'2008-03-12 09:14:00','banana with aidan','breakfast',NULL,NULL),(40,1,1,'2008-03-12 13:47:00','Ethnic Gourmet, cream of brocoli soup, large diet soda, a couple tootsie rolls.','lunch',NULL,NULL),(41,0,1,'2008-03-12 21:15:00','dinner with Luka at Noodles','dinner',NULL,NULL),(44,0,1,'2008-03-13 09:27:00','coffee, english muffin w peanut butter','breakfast',NULL,NULL),(45,0,1,'2008-03-13 13:37:00','EdZilla wrap, large diet soda','lunch',NULL,NULL),(48,3,1,'2008-03-13 16:22:00','handful of cheetos, light beer (16oz)','dinner',NULL,NULL),(49,0,1,'2008-03-14 07:27:00','coffee, yogurt x2, turkey bacon, donut','breakfast',NULL,NULL),(50,0,1,'2008-03-14 12:56:00','clam chowder from cafeteria, large soda','lunch',NULL,NULL),(51,0,1,'2008-03-14 15:59:00','two harvest burgers, diet soda','dinner',NULL,NULL),(52,2,1,'2008-03-15 08:07:00','coffee, banana, mix 1 health drink.','breakfast',NULL,NULL),(53,0,1,'2008-03-16 12:00:00','Click here to enter description','McGriddles',NULL,NULL),(54,0,1,'2008-03-16 12:19:00','had pizza and soda','lunch at birthday party',NULL,NULL),(55,1,1,'2008-03-16 22:28:00','2 harvest burger patties, diet soda pop','dinner',NULL,NULL),(56,0,1,'2008-03-17 13:46:00','sandwich, soup, large diet soda','lunch',NULL,NULL),(57,0,1,'2008-03-17 08:50:00','turkey bacon, coffee, ','breakfast',NULL,NULL),(58,0,1,'2008-03-18 08:33:00','coffee, cereal (Honey Bunch O Oats)','breakfast',NULL,NULL),(59,0,1,'2008-03-18 10:36:00','chocolate brownie...woa!','snack',NULL,NULL),(60,0,1,'2008-03-18 11:44:00','turkey sandwich, large diet soda','lunch',NULL,NULL),(61,0,1,'2008-03-18 16:38:00','him mac n cheese, me Whole Wheet Linguini','dinner at Noodles with Luka',NULL,NULL),(62,0,1,'2008-03-19 09:01:00','omlet from cafeteria: eggs, cheese, veggies, sausage, green chile','breakfast',NULL,NULL),(63,0,1,'2008-03-19 10:44:00','1 orange, 1 grapefruit','mid morning snack',NULL,NULL),(64,0,1,'2008-03-19 16:05:00','turkey sandwich, w cheese','afternoon snack',NULL,NULL),(65,0,1,'2008-03-20 07:23:00','Click here to enter description','oatmeal from packets',NULL,NULL),(66,1,1,'2008-03-20 14:29:00','weight watchers chicken dish, large diet soda.','lunch',NULL,NULL),(67,0,1,'2008-03-20 22:17:00','harvest burger, chicken breast','dinner',NULL,NULL),(68,0,1,'2008-03-22 08:50:00','oatmeal and coffee from cafeteria','breakfast',NULL,NULL),(69,1,1,'2008-03-21 11:52:00','Edzilla sandwich from Milo, mushroom soup, large diet soda','lunch at cafeteria',NULL,NULL),(70,0,1,'2008-03-21 17:53:00','Salad bar (three trips)','dinner at Beau Jo\'s',NULL,NULL),(71,0,1,'2008-03-22 08:25:00','coffee, banana, honey bunches of oats','breakfast at home',NULL,NULL),(72,0,1,'2008-03-22 19:14:00','Click here to enter description','dinner',NULL,NULL),(73,0,6,'2008-03-22 23:03:00','yummy','macncheese',NULL,NULL),(74,0,6,'2008-03-22 23:04:00','pizza, coke','pizza',NULL,NULL),(75,0,1,'2008-03-23 01:42:00','Arlene brought home some Greek food from an awesome restaurant','dinner with Al and Janet Morris',NULL,NULL),(115,1,1,'2008-04-10 21:47:00','Orville Redenbacher\'s Movie butter with extra melted margarine','popcorn watching tv...and a fudge bar...',NULL,NULL),(77,0,1,'2008-03-26 06:15:00','test cost','test cost',NULL,NULL),(78,0,1,'2008-03-26 20:48:00','test food ref','test foodRef',NULL,NULL),(79,0,1,'2008-03-26 20:51:00','test2','test foodRef 2',2.33,NULL),(80,0,1,'2008-03-27 06:05:00','test','testing last updated meal',0.22,NULL),(81,0,1,'2008-03-28 00:22:00','','test',0.22,NULL),(82,0,1,'2008-03-28 00:24:00','Click here to enter description','test',0.22,NULL),(83,1,1,'2008-03-28 00:28:00','Click here to enter description2','test cost',NULL,NULL),(84,1,1,'2008-03-29 13:18:00','Click here to enter description','test new animation',NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en'),(85,2,1,'2008-03-30 07:14:00','soup, cheesy pototoes, fruit, chips, lemonade, ice cream','dinner with Donny & Marissa',NULL,'http://www.youtube.com/v/-9kmQuefbtA&hl=en'),(86,0,1,'2008-03-31 06:34:00','coffee, cheetos, oatmeal','breakfast',NULL,NULL),(87,0,1,'2008-03-31 08:53:00','Omlet, coffee, rye toast','breakfast at cafeteria',3.85,NULL),(88,0,1,'2008-03-31 12:22:00','Small cheesy vegetable soup','lunch at cafeteria',3.08,NULL),(89,0,1,'2008-03-31 16:13:00','soda pop','afternoon snack',0,NULL),(90,0,1,'2008-04-01 15:24:00','soup, frozen indian meal, soda, pizza, chicken wings','lunch at cafeteria',4.5,NULL),(91,0,1,'2008-04-02 11:24:00','Omlet, coffee, rye toast','breakfast at cafeteria',3.8,NULL),(92,0,1,'2008-04-02 13:28:00','slice of pizza, soda, soup','lunch',NULL,NULL),(93,1,1,'2008-04-02 19:35:00','harvest burger w a cheese slice, Vitamin water and a small slice of cheese pizza stolen from my children. ','dinner at home',NULL,NULL),(94,0,1,'2008-04-03 14:11:00','Kids woke me and I couldnt sleep so I had an veggie burger','2:AM Snack',NULL,NULL),(95,1,1,'2008-04-03 14:13:00','Brought my own: leftover 6\" Subway roast beef, Ethnic Gourmet Chicken something or other.','lunch at cafeteria',NULL,NULL),(96,1,1,'2008-04-03 14:23:00','Coffee, not sure what else.','breakfast',NULL,NULL),(97,0,1,'2008-04-03 19:15:00','harvest burger, regular burger, cheetos two cookies','dinner at home',NULL,NULL),(98,0,1,'2008-04-04 06:19:00','coffee, yogurt, banana','breakfast at home',NULL,NULL),(99,0,1,'2008-04-04 12:16:00','leftover burgers, pizza slice','lunch in cafeteria',NULL,NULL),(100,0,1,'2008-04-06 19:57:00','Cooked a harvest burger and a beef burge and made an awesome burger with wheat toast bread. ','harvest burger and beef burger, popcorn',NULL,NULL),(101,2,1,'2008-04-06 08:00:00','eggs, ham, veggies, cheese','Breakfast at Village Inn',NULL,NULL),(102,1,1,'2008-04-06 11:07:00','With Aidan. Pizza and Sprite. Talked to Chris V (an engineer from Ball Aerospace)','lunch at Copper mt ',16,NULL),(103,0,1,'2008-04-06 20:19:00','Chicken salad sandwiches, egg salad sandwich, veggies, soda, ice cream cake','Nathan Evans-Ehringer Birthday Party',NULL,NULL),(104,0,1,'2008-04-07 08:22:00','mcmervin omlet, coffee','breakfast at cafeteria',3.24,NULL),(105,0,1,'2008-04-07 12:13:00','small soup, large diet soda','lunch at cafeteria',3.08,NULL),(106,0,1,'2008-04-07 17:27:00','hot chocolate','late afternoon snack',NULL,NULL),(107,0,1,'2008-04-08 11:07:00','soup, indian meal, large diet soda','lunch at cafeteria',3.08,NULL),(108,0,1,'2008-04-08 18:29:00','1/2 harvest buger, turkey burger, lettuce, wheat bread, vitamin water.','dinner at home',NULL,NULL),(109,1,1,'2008-04-09 06:34:00','coffee, zone bar, test\n','breakfast at home',NULL,NULL),(110,0,1,'2008-04-09 10:27:00','ate second half of last nights turkey/harvest burger. Starved.','mid morning snack',NULL,NULL),(111,0,1,'2008-04-09 13:21:00','corn chowder soup, large diet soda','lunch at cafeteria',3.08,NULL),(112,1,1,'2008-04-10 06:30:00','After the DJUG we went to the rock bottom brewery and had 2 large beers, a wing, an onion ring, a fried cheese wrap thing, and a bruchetta like pizza slice.\nI have two of everything below on purpose.','post DJUG at the bar',14,NULL),(113,0,1,'2008-04-10 07:03:00','two mini bagels with cream cheese, coffee','breakfast at home',NULL,NULL),(114,0,1,'2008-04-10 15:55:00','harvest burger and turkey burger, cheese, lettuce','dinner at home',NULL,NULL),(116,0,1,'2008-04-11 06:15:00','coffee, cofee cake, yogurt, bite o banana','breakfast at Starbucks and home',4,NULL),(117,2,1,'2008-04-11 12:08:00','lean cuisine, soup, EdZilla wrap','lunch at cafeteria',NULL,NULL),(118,0,1,'2008-04-11 20:38:00','from safeway','roasted chicken & ice crea',16,NULL),(119,0,1,'2008-04-14 11:44:00','Huge Burrito and Vitamin Water','lunch at Copper Mt lodge',12.84,NULL),(120,0,1,'2008-04-14 07:52:00','coffee, mini bagel','breakfast at home',NULL,NULL),(121,0,1,'2008-04-14 15:51:00','microwaved a frozen indian meal','lunch at my desk',NULL,NULL),(122,0,1,'2008-04-14 06:32:00','harvest burger w cheese, vitamin water','dinner at home',NULL,NULL),(123,0,1,'2008-04-15 08:12:00','coffee, half a power bar','breakfast at home',NULL,NULL),(124,0,1,'2008-04-15 14:59:00','Ethnic Gourmet, cream of brocoli soup, large diet soda','lunch at my desk',NULL,NULL),(125,0,1,'2008-04-15 19:54:00','grilled out on deck, cheese, greens, wheat bread','hamburger w cheese',NULL,NULL),(126,0,1,'2008-04-16 06:38:00','yogurt, coffee','breakfast',NULL,NULL),(127,0,1,'2008-04-16 18:16:00','low cal frozen meal + turkey burger with cheese','lunch at cafeteria',NULL,NULL),(128,0,1,'2008-04-17 04:23:00','coffee, yogurt','breakfast at home',NULL,NULL),(129,0,1,'2008-04-17 11:07:00','orange, grapefruit','mid morning snack',NULL,NULL),(130,0,1,'2008-04-17 13:46:00','Ethnic Gourmet,  harvest burger','lunch at cafeteria',0,NULL),(131,0,1,'2008-04-17 16:56:00','arlene brought home an awesome pablano pesto burrito, chips, had a buffalo hotdot too and a diet 7up','QDoba naked burrito',NULL,NULL),(132,0,1,'2008-04-18 09:05:00','banana, coffee','breakfast at home',NULL,NULL),(133,0,1,'2008-04-18 12:30:00','clam chowder, harvest burger','lunch at cafeteria',1.85,NULL),(134,0,1,'2008-04-18 20:56:00','harvest burger w cheese, ice cream','dinner at home',NULL,NULL),(135,0,1,'2008-04-19 21:29:00','egg pannini. Kids had pizza bagels','lunch at Einsteins bagels',17.89,NULL),(136,0,1,'2008-04-19 21:32:00','pastrami sandwich','mid day snack',5,NULL),(137,0,1,'2008-04-19 21:33:00','noodles dish','penne pasta',8,NULL),(138,0,1,'2008-04-21 07:39:00','coffee...','breakfast at home',NULL,NULL),(139,0,1,'2008-04-21 12:39:00','EdZilla wrap, large diet soda','lunch at cafeteria',6,NULL),(140,0,1,'2008-04-22 00:22:00','harvest burger w cheese.','dinner at home',NULL,NULL),(141,0,1,'2008-04-22 08:56:00','coffee, cliff bar','breakfast at home',NULL,NULL),(142,0,1,'2008-04-22 12:16:00','frozen indian meal, burger patty (beef)','lunch at cafeteria',NULL,NULL),(143,0,1,'2008-04-22 20:33:00','two harvest burgers, salad greens, diet 7-UP','dinner at home',NULL,NULL),(144,0,1,'2008-04-23 08:03:00','coffee, banana, two donuts when I got to work. ','breakfast at home',NULL,NULL),(145,0,1,'2008-04-23 12:56:00','garden salad w soy peanut dressing','lunch at cafeteria',4.27,NULL),(146,0,1,'2008-04-23 21:28:00','turkey bacon and oranges.','bacon strips',NULL,NULL),(147,0,1,'2008-04-24 06:22:00','coffee, italian sausage, bacon','breakfast at home',NULL,NULL),(148,0,1,'2008-04-25 04:08:00','some leftover fried rice, yogurt, coffee','rice leftovers, coffee, yogurt',NULL,NULL),(149,0,1,'2008-04-25 14:33:00','Spaghetti with Meat sauce, steamed veggies, large soda','lunch at cafeteria',6,NULL),(150,0,1,'2008-04-25 13:01:00','two veggie patties and a beer','dinner at home',NULL,NULL),(151,0,1,'2008-04-26 17:52:00','had a brat, 3 beers, apple pie, ice cream, woa!','dinner at logan auction',NULL,NULL),(152,0,1,'2008-04-26 13:53:00','veggie burger','lunch at home',NULL,NULL),(153,1,1,'2008-04-28 06:51:00','coffee, mini bagel, also had a mervin omlet when I got to work.','breakfast at home',NULL,NULL),(157,0,1,'2008-04-29 22:59:00','don\'t remember...','dinner at home',NULL,NULL),(158,1,1,'2008-04-30 09:23:00','coffee, 2 mini bagels w cc, raison cookie, another cookie.,','breakfast at home',NULL,NULL),(155,0,1,'2008-04-29 07:21:00','coffee, banana','breakfast at home',NULL,NULL),(156,0,1,'2008-04-29 12:56:00','awesome roast beef, corn, potatoes, gravy, large diet soda','lunch at cafeteria',7,NULL),(159,0,1,'2008-04-30 16:53:00','soup, and large diet soda.','lunch at cafeteria',3.08,NULL),(160,0,1,'2008-04-30 21:09:00','mini burger w spinach, diet 7-up','dinner at home',NULL,NULL),(161,1,1,'2008-04-30 20:17:00','veggie burger','late night snack',NULL,NULL),(162,0,1,'2008-05-01 16:56:00','went with Jim, Don, Tony, Mark, Jeff E, and Jeff C.','Lunch at Los Dos',13,NULL),(163,0,1,'2008-05-02 09:40:00','coffee, toast, mervin omlet: 2 eggs, veggies, sausage, green chile','breakfast at cafeteria',3.85,NULL),(164,0,1,'2008-05-01 17:42:00','veggie burger, turkey burger, cheese, spinach, diet 7-up','dinner at home',NULL,NULL);
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
  PRIMARY KEY  (`id`),
  KEY `FK86F4ABF1D792211A` (`food_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nutrition_data`
--

LOCK TABLES `nutrition_data` WRITE;
/*!40000 ALTER TABLE `nutrition_data` DISABLE KEYS */;
INSERT INTO `nutrition_data` VALUES (2,1,0,'Turkey sandwich',3,0,0,0),(1,0,0,'bagel',9,0,0,0),(3,0,0,'default empty data',1,NULL,0,0),(4,0,200,'Click here to enter description',1,NULL,4,50),(5,3,0,'mervin omlet: 2 eggs, veggies, sausage, green chile',60,NULL,0,98),(6,1,NULL,'test aroony',77,NULL,NULL,NULL),(7,1,NULL,'test animation',78,NULL,NULL,NULL),(8,1,NULL,'test no animation',79,NULL,NULL,NULL),(9,1,NULL,'cheesy potatoes',80,NULL,NULL,NULL),(10,1,NULL,'lemonade',81,NULL,NULL,NULL),(11,0,NULL,'oatmeal packets',14,NULL,NULL,NULL),(12,1,NULL,'pasta salad',82,NULL,NULL,NULL),(13,1,NULL,'rye toast',83,NULL,NULL,NULL),(14,1,NULL,'cheesy vegetable soup',84,NULL,NULL,NULL),(15,0,NULL,'large diet coke',26,NULL,NULL,NULL),(16,1,NULL,'non diet soda',85,NULL,NULL,NULL),(17,0,NULL,'vitamin water',68,NULL,NULL,NULL),(18,1,NULL,'subway sandwich',86,NULL,NULL,NULL),(19,1,NULL,'cheetos',87,NULL,NULL,NULL),(20,1,NULL,'popcorn',88,NULL,NULL,NULL),(21,1,NULL,'hash browns',89,NULL,NULL,NULL),(22,1,NULL,'pancakes',90,NULL,NULL,NULL),(23,1,NULL,'Hot Chocolate',91,NULL,NULL,NULL),(24,1,NULL,'turkey burger',92,NULL,NULL,NULL),(25,1,NULL,'zone bar',93,NULL,NULL,NULL),(26,0,NULL,'raw oatmeal',1,NULL,NULL,NULL),(27,1,NULL,'soup from caferia',94,NULL,NULL,NULL),(28,1,NULL,'miscellaneous bar food',95,NULL,NULL,NULL),(29,1,NULL,'chicken dino nuggets',96,NULL,NULL,NULL),(30,1,NULL,'fudge bar',97,NULL,NULL,NULL),(31,1,NULL,'coffee cake',98,NULL,NULL,NULL),(32,1,NULL,'large burito',99,NULL,NULL,NULL),(33,0,NULL,'harvest burger',1,NULL,NULL,NULL),(34,1,NULL,'power bar',100,NULL,NULL,NULL),(35,1,NULL,'grapefruit',101,NULL,NULL,NULL),(36,1,NULL,'veggie burger',38,NULL,NULL,NULL),(37,1,NULL,'einstein\'s egg pannini',102,NULL,NULL,NULL),(38,1,NULL,'pastrami sandwich',103,NULL,NULL,NULL),(39,1,NULL,'penne rosa',104,NULL,NULL,NULL),(40,1,NULL,'cliff bar',105,NULL,NULL,NULL),(41,0,NULL,'garden salad',10,NULL,NULL,NULL),(42,0,NULL,'orange',61,NULL,NULL,NULL),(43,0,NULL,'banana',7,NULL,NULL,NULL),(44,0,NULL,'can of diet soda',57,NULL,NULL,NULL),(45,1,NULL,'Italian Wedding Soup',106,NULL,NULL,NULL),(46,1,NULL,'mini burger w cheese',107,NULL,NULL,NULL);
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
INSERT INTO `requestmap` VALUES (1,0,'ROLE_ATHLETE,ROLE_ COACH,','/workout/**'),(2,0,'ROLE_ATHLETE,ROLE_ COACH,','/meal/**'),(3,1,'ROLE_ATHLETE,ROLE_ COACH,','/biometrics/**'),(4,0,'ROLE_ATHLETE,ROLE_ COACH,','/food/**'),(5,0,'ROLE_ATHLETE,ROLE_ COACH,','/foodref/**'),(6,0,'ROLE_ATHLETE,ROLE_ COACH,','/exercise/**'),(7,1,'ROLE_ATHLETE,ROLE_ COACH,ROLE_,','/nutritiondata/**'),(8,0,'ROLE_ATHLETE,ROLE_ COACH,','/exerciseref/**'),(9,0,'ROLE_COACH,','/role/**'),(10,0,'ROLE_COACH,','/requestmap/**'),(11,0,'ROLE_COACH,','/authuser/**'),(12,0,'ROLE_COACH,','/classperiod/**'),(13,0,'ROLE_ATHLETE,','/classperiod/list/**'),(15,1,'ROLE_ATHLETE,ROLE_ COACH,ROLE_,','/equipment/**'),(16,0,'ROLE_COACH,','/user/**'),(17,0,'ROLE_ATHLETE,ROLE_ COACH,','/course/**');
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
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workout`
--

LOCK TABLES `workout` WRITE;
/*!40000 ALTER TABLE `workout` DISABLE KEYS */;
INSERT INTO `workout` VALUES (1,0,1,NULL,'discussed fitness plan','2008-02-03 06:49:00','24 Hour Fitness @ Tamarac',NULL,NULL,'trainer appointment','2008-02-03 05:00:00',NULL,NULL,NULL,NULL),(2,0,1,NULL,'weights and isometrics','2008-02-05 06:50:00','24 Hour Fitness @ Tamarac',NULL,NULL,'trainer workout','2008-02-05 05:00:00',NULL,NULL,NULL,NULL),(3,0,1,168,'1 hour spin and hacky sack warmdown','2008-02-08 06:40:00','24 Hour Fitness @ Tamarac',195,NULL,'spin class','2008-02-08 05:30:00',NULL,NULL,NULL,NULL),(4,1,1,NULL,'played with luka at westland park','2008-02-09 13:17:00','westland park',NULL,NULL,'played at park','2008-02-09 12:17:00',NULL,NULL,NULL,NULL),(5,0,1,NULL,'30 mins jog/dribble bball','2008-02-11 06:45:00','24 Hour Fitness @Tamarac',NULL,NULL,'gym workout','2008-02-11 05:30:00',NULL,NULL,NULL,NULL),(6,0,1,NULL,'1 hour spin + warm down','2008-02-13 06:45:00','24 Hour Fitness @Tamarac',NULL,NULL,'spin class','2008-02-13 05:30:00',NULL,NULL,NULL,NULL),(7,1,1,149,'1  hour spin + hacky sack, situps, bench press','2008-02-15 06:45:00','24 Hour Fitness @Tamarac',220,NULL,'spin class','2008-02-15 05:30:00',NULL,NULL,NULL,NULL),(8,3,1,NULL,'sack, situps, assisted dips','2008-02-16 18:15:00','24 Hour fitness @ Tamarac',NULL,NULL,'Gym workout, hacky sack session','2008-02-16 17:15:00',NULL,'http://www.youtube.com/v/DhZwU3Cp0Pc&hl=en',NULL,NULL),(9,0,1,NULL,'jog/dribble, footbag, weights,situps','2008-02-19 07:01:00','24 Hour Fitness @Tamarac',NULL,NULL,'gym workout','2008-02-19 05:01:00',NULL,NULL,NULL,NULL),(10,4,1,155,'12.57 mi. from work to car at Quincy','2008-02-19 16:26:00','cmc to quincy via hlc',NULL,NULL,'bike commute from work','2008-02-19 15:26:00',12.57,NULL,1,NULL),(11,0,1,NULL,'abs iso, leg press, rowing machine, rubber band','2008-02-20 06:21:00','24 Hour Fitness @Tamarac',NULL,NULL,'trainer workout','2008-02-20 05:21:00',NULL,NULL,NULL,NULL),(12,0,1,NULL,'played with boys downstairs: Exhausting','2008-02-20 18:38:00','downstairs playroom',NULL,NULL,'wrestled with kids','2008-02-21 15:38:00',NULL,NULL,NULL,NULL),(13,0,1,NULL,'Ski at Winter Park','2008-02-22 15:02:00','winter park colorado',NULL,NULL,'Downhill Ski','2008-02-22 10:02:00',NULL,NULL,NULL,NULL),(14,0,1,NULL,'at winter park','2008-02-23 15:05:00','winter park colorado',NULL,NULL,'Downhill Ski','2008-02-23 09:05:00',NULL,NULL,NULL,NULL),(15,0,1,NULL,'played keep away from Luka','2008-02-24 19:07:00','denver jazzercise',NULL,NULL,'played with kids','2008-02-24 17:07:00',NULL,NULL,NULL,NULL),(16,0,1,NULL,'Pulled Luka in trailer and Aidan rode his bike to Performance bicycle. ','2008-02-24 17:08:00','Highline canal',NULL,NULL,'Rode bikes to Performance N Jazzercise','2008-02-24 16:08:00',NULL,NULL,NULL,NULL),(21,0,1,NULL,'hacky sack session, lunges, ab iso, ab machine, assisted dips, sitting bench press machine,','2008-03-11 05:55:00','24 Hour Fitness @Tamarac',NULL,NULL,'gym workout','2008-03-11 09:55:00',NULL,NULL,NULL,NULL),(18,0,1,NULL,'jog/dribble, footbag, weights,situps','2008-02-26 06:45:00','24 Hour Fitness @Tamarac',NULL,NULL,'gym workout','2008-02-26 05:30:00',NULL,NULL,NULL,NULL),(19,1,1,NULL,'wrestled and tossed him around. I specified the bench press as the exercise, but it\'s pretty close. ','2008-02-26 20:50:00','home',NULL,NULL,'played with Luka','2008-02-26 20:37:00',NULL,NULL,NULL,NULL),(20,1,1,NULL,'Rode with Aidan and pulled Luka to Wash park. They played, I hackysack sessioned.','2008-03-10 07:01:00','Washington Park',NULL,NULL,'Bike ride/play at Wash Park with kids','2008-03-10 07:01:00',NULL,NULL,NULL,NULL),(22,0,1,NULL,'Pulled Luka home from village through Cherry Creek. Saw Jamey Leonard on the way. Beautiful evening. ','2008-03-11 19:38:00','Cherry Creek Park',NULL,NULL,'Rode Home from Village','2008-03-11 18:38:00',NULL,NULL,NULL,NULL),(23,0,1,NULL,'pulled Luka to school on bike via Dam Road path','2008-03-12 13:41:00','225 Dam road',NULL,NULL,'bike pulling trailer','2008-03-12 13:41:00',NULL,NULL,NULL,NULL),(24,0,1,NULL,'Click here to enter description','2008-03-13 01:26:00','24 Hour fitness @ Tamarac',NULL,NULL,'test flash','2008-03-13 01:26:00',NULL,NULL,NULL,NULL),(25,0,1,NULL,'spin class, lunges, ab machine','2008-03-14 06:43:00','24 Hour Fitness @Tamarac',NULL,NULL,'spin class','2008-03-14 05:24:00',NULL,NULL,NULL,NULL),(26,0,1,NULL,'rode bike from home to Colorado blvd and back','2008-03-15 12:12:00','Denver',NULL,NULL,'bike ride around town','2008-03-15 09:12:00',NULL,NULL,NULL,NULL),(27,0,1,NULL,'1 hour spin + light weight workout','2008-03-19 07:09:00','24 Hour Fitness @Tamarac',NULL,NULL,'spin class','2008-03-19 05:30:00',NULL,NULL,NULL,NULL),(28,0,1,155,'10. 5 miles. Parked at High School, rode down Holly, got on path to Highline canal path on to CMC','2008-03-19 07:33:00','centennial highline canal',NULL,NULL,'commute to work','2008-03-19 12:28:00',NULL,NULL,NULL,NULL),(29,0,1,NULL,'Rode up Holly to Orchard, through Westland Park, up Monoco to Quincy. Then east on quincy to Princeton and then Tamarac home. ','2008-03-21 15:49:00','CMC to Home',NULL,NULL,'commute from work','2008-03-22 07:49:00',NULL,NULL,NULL,NULL),(30,0,1,NULL,'Rode with Aidan to village. I pulled the trailer empty. We got to the Village, and then loaded up Luka and rode back. We wen the Dam road trail both ways. Aidan did great!','2008-03-22 07:57:00','RT: Home to Village ',NULL,NULL,'Biked to Village to get Luka','2008-03-22 07:57:00',NULL,NULL,NULL,NULL),(31,0,1,NULL,'test','2008-03-25 21:56:00','home',NULL,NULL,'test last updated workout','2008-03-25 21:56:00',NULL,NULL,NULL,NULL),(43,0,1,NULL,'Skied with Aidan from 10-2. Awesome snow and snowing the whole day. The whole family went and Luka too a ski lesson. We drove up at 7 and got there at 9:30 cuz we stopped at VI. On the way home we had little traffic. Awesome day','2008-04-06 19:54:00','Copper Mt. Colorado',NULL,NULL,'skied at Copper mt','2008-04-06 19:54:00',NULL,NULL,NULL,NULL),(33,0,1,NULL,'went to the Golden Community Rec center. Kids & Mom swam. I kicked footbag, ran, assisted dip, bench press','2008-03-30 18:09:00','Golden Colorado',NULL,NULL,'Golden Rec Center w Gordons','2008-03-30 18:09:00',NULL,NULL,NULL,NULL),(34,0,1,NULL,'Click here to enter description','2008-04-01 17:22:00','test',NULL,NULL,'test update workout ref','2008-04-01 17:22:00',NULL,NULL,NULL,NULL),(35,0,1,NULL,'1 hour spin + warm down','2008-04-02 11:02:00','24 Hour Fitness @Tamarac',NULL,NULL,'spin class','2008-04-02 11:02:00',NULL,NULL,NULL,NULL),(36,0,1,NULL,'OMG: ab stuff on decline board, lunges (not walking), cable upper body, pushups with arm up in the air thing, rubber band thing, then pull weight up to belly.','2008-04-02 08:04:00','24 Hour Fitness @Tamarac',NULL,NULL,'trainer workout','2008-04-02 07:04:00',NULL,NULL,NULL,NULL),(37,0,1,NULL,'Jon M and I took about 15 mins','2008-04-02 14:50:00','Comcast CMC Parking lot',NULL,NULL,'afternoon footbag session','2008-04-02 14:50:00',NULL,NULL,NULL,NULL),(39,0,1,150,'Rode along Belleview to Holly and then South to Dry Creek, west to CMC','2008-04-04 09:15:00','Centennial',NULL,NULL,'rode from the Village to CMC','2008-04-04 07:33:00',6,NULL,NULL,NULL),(42,0,1,NULL,'Return trip from Work to Village','2008-04-05 21:23:00','centennial',NULL,NULL,'Rode from CMC to Village','2008-04-05 21:23:00',NULL,NULL,NULL,NULL),(41,0,1,NULL,'sat morning brought both kids, saw Brad. Lunges (two different ones), cable fly/pushups w hand wave thing, assisted dips, bench row w rubber band back thing, ab decline board. ','2008-04-05 21:15:00','24 Hour fitness @ Tamarac',NULL,NULL,'gym workout','2008-04-05 21:15:00',NULL,NULL,NULL,NULL),(44,0,1,NULL,'Rode bikes a little. Aidan rode his new bike, I pulled luka in trailer. Mostly hung at the play area. I did footbag session.','2008-04-05 14:11:00','Washington Park, Denver, CO',NULL,NULL,'Played at Wash Park','2008-04-06 20:11:00',NULL,NULL,NULL,NULL),(45,0,1,NULL,'decline ab workout (2 diff ones), toes together bendover touch the ground but up-down, hack squat, ball dumbell press, ball cable pull down hands up, curl against the purple bar then out, ','2008-04-09 05:05:00','24 Hour fitness @ Tamarac',NULL,NULL,'trainer workout','2008-04-09 05:50:00',NULL,NULL,NULL,NULL),(46,0,1,NULL,'wrestled with him downstairs','2008-04-10 21:52:00','home',NULL,NULL,'play with Luka','2008-04-10 21:52:00',NULL,NULL,NULL,NULL),(47,1,1,NULL,'Aidan rode and I pulled Luka in trailer. 10.3 miles','2008-04-13 20:58:00','Denver',NULL,NULL,'rode bikes to Science Museum','2008-04-13 15:58:00',20,NULL,NULL,NULL),(48,0,1,153,'Rode along Platte to Lee Gulch and then followed some bike paths to Dry creek and then to CMC','2008-04-14 13:47:00','Englewood/Centennial',191,NULL,'Rode bike back from Discount Tire','2008-04-14 12:47:00',9,NULL,NULL,NULL),(49,0,1,NULL,'Rode back to tire shop. About 6 miles.','2008-04-14 21:45:00','Englewood/Centennial',NULL,NULL,'cmc to Discount Tire','2008-04-14 21:45:00',NULL,NULL,NULL,NULL),(50,0,1,157,'via neighborhood behind Village, to Orchard, down Holly, through \'hood N of CMC','2008-04-15 08:07:00','Greenwood Village/Centennial',177,NULL,'Village to CMC','2008-04-15 07:43:00',6,NULL,NULL,NULL),(51,0,1,156,'Rode to Chatfield and back. Met up with Dave Diller','2008-04-15 14:06:00','Centennial',NULL,NULL,'CMC to Chatfield RT','2008-04-15 14:06:00',20,NULL,NULL,NULL),(52,0,1,150,'via Holly, Orchard, DTC','2008-04-15 19:52:00','Centennial/Greenwood Village',NULL,NULL,'CMC to Village','2008-04-15 19:52:00',6,NULL,NULL,NULL),(53,3,1,NULL,'vertical intervals: bike, lunges, dumbell stuff (4 or 5 diff ones), abs. Killer','2008-04-16 06:37:00','24 Hour fitness @ Tamarac',NULL,NULL,'trainer interval workout','2008-04-16 06:37:00',NULL,'http://www.youtube.com/v/fhXdSo-8nQw&hl=en',1,NULL),(54,1,1,NULL,'test','2008-04-18 07:36:00','home',NULL,NULL,'test date time start end','2008-04-18 06:36:00',NULL,NULL,NULL,NULL),(63,1,1,155,'Direct, but pretty inefficient route. ended up on the sidewalk alot.','2008-04-23 10:01:00','Greenwood Village/Centennial',165,NULL,'Commute from Village to CMC direct','2008-04-23 08:01:00',6.43,NULL,18,NULL),(56,4,1,157,'Village to CMC','2008-04-18 08:39:00','Denver to Centennial',178,NULL,'commute to work','2008-04-18 08:10:00',7,NULL,14,NULL),(57,3,1,NULL,'CMC to Village via circuituous route.','2008-04-18 15:45:00','centennial highline canal',NULL,NULL,'Commute to Village from work','2008-04-18 14:45:00',14.4,NULL,13,NULL),(58,3,1,NULL,'Left work early so I rode the Highline Canal trail to Quincy, stopped at MicroCenter, and then through Cherry Creek High School to the Village.','2008-04-18 21:17:00','Centennial/Greenwood Village',NULL,NULL,'ride to the Village from CMC','2008-04-18 20:17:00',14,NULL,13,NULL),(59,2,13,NULL,'through the portal','2008-04-20 09:57:00','His crib',NULL,NULL,'Mike Rockin','2008-04-20 08:57:00',NULL,'http://www.youtube.com/v/PzJpyvvQiCI&hl=en',NULL,NULL),(60,1,1,142,'Bike commute from Home to CMC via Tamarac, Rosemary Way, Princeton, Quincy, Holly. Dry Creek.','2008-04-21 09:30:00','Greenwood Village/Centennial',165,NULL,'commute to work','2008-04-21 08:11:00',8,NULL,17,NULL),(61,4,1,NULL,'Was taking a new route via Dexter Way. got a flat just before Belleview.','2008-04-22 01:05:00','Greenwood Village/Centennial',NULL,NULL,'aborted commute home from CMC','2008-04-22 00:05:00',NULL,NULL,1,NULL),(62,2,1,NULL,'Dropped Luka off, got all rigged up, discovered I had a flat on the rear tire. Yesterday it was the front tire. ','2008-04-22 09:55:00','Greenwood Village/Centennial',NULL,NULL,'aborted commute to work','2008-04-22 08:55:00',0,NULL,1,NULL),(64,1,1,NULL,'up Dexter to Orchard. Then East to DTC and Village','2008-04-23 23:20:00','Greenwood Village/Centennial',NULL,NULL,'CMC to Village','2008-04-23 22:20:00',NULL,NULL,NULL,NULL),(65,2,1,NULL,'Sucks. Riding along Belleview is a nightmare. 8.04 miles ','2008-04-24 05:06:00','Centennial/GreenwoodVillage',NULL,NULL,'commute CMC to Village via Dexter/Belleview','2008-04-24 17:06:00',8.04,NULL,19,NULL),(66,1,1,NULL,'Click here to enter description','2008-04-27 08:45:00','home',NULL,NULL,'test end date','2008-04-27 07:45:00',NULL,NULL,NULL,NULL),(67,9,1,143,'about 50 miles ','2008-04-27 12:29:00','denver/morrison',NULL,NULL,'ride to redrocks and back','2008-04-27 12:29:00',50,'http://www.youtube.com/v/gbJh5CagyNA&hl=en',21,245),(68,0,1,NULL,'Parked car at Orchard and rode short path along Colorado Blvd to CMC','2008-04-29 16:39:00','Centennial',NULL,NULL,'commute to work from Orchard lot','2008-04-29 16:39:00',2,NULL,NULL,20),(69,0,1,NULL,'CMC to Orchard Parking lot via HLC','2008-04-29 23:25:00','Centennial',NULL,NULL,'commute from work','2008-04-29 23:25:00',6.3,NULL,NULL,30),(70,0,1,NULL,'Parked car at stable on Orchard, and rode HLC to Orchard, then took Colorado Blvd shortcut.','2008-04-30 09:51:00','centennial highline canal',NULL,NULL,'commute to work','2008-04-30 09:51:00',NULL,NULL,NULL,30),(71,0,1,NULL,'Parked car at stable on Orchard, and rode HLC to Orchard, then took Colorado Blvd shortcut.','2008-04-30 18:54:00','centennial highline canal',NULL,NULL,'commute back to car','2008-04-30 18:54:00',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2008-05-05  4:15:05
