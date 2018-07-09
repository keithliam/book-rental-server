-- MySQL dump 10.13  Distrib 5.7.21, for osx10.12 (x86_64)
--
-- Host: localhost    Database: book_rental
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `author` text NOT NULL,
  `category` text NOT NULL,
  `borrower` varchar(256) DEFAULT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_borrower` (`borrower`),
  CONSTRAINT `FK_borrower` FOREIGN KEY (`borrower`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (51,'The Amazing Book Is Not on Fire: The World of Dan and Phil','Dan Howell','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51gJ82I7bZL.jpg'),(52,'Twilight Tenth Anniversary/Life and Death Dual Edition','Stephenie Meyer','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51fT2LOwQgL.jpg'),(53,'Harry Potter Paperback Box Set (Books 1-7)','J. K. Rowling','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51BBTJaU6QL.jpg'),(54,'Library of Souls: The Third Novel of Miss Peregrine\'s Peculiar Children','Ransom Riggs','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/516ETg2nrlL.jpg'),(55,'Carry On','Rainbow Rowell','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51aT-%2BHwVqL.jpg'),(56,'Winter (The Lunar Chronicles)','Marissa Meyer','Teen & Young Adult','projects/tay-hurlos/agent/sessions/1530091573121','http://ecx.images-amazon.com/images/I/41SSIYbE2LL.jpg'),(57,'The Maze Runner Series (Maze Runner)','James Dashner','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51GcSiLFYeL.jpg'),(58,'Michael Vey 5: Storm of Lightning','Richard Paul Evans','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51DJ%2B4lX5YL.jpg'),(59,'Harry Potter and the Sorcerer\'s Stone','J.K. Rowling','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51PxQCRCx0L.jpg'),(60,'The Death Cure (Maze Runner, Book Three)','James Dashner','Teen & Young Adult','projects/tay-hurlos/agent/sessions/1530092365429','http://ecx.images-amazon.com/images/I/51hrwXHI7jL.jpg'),(61,'The Rose Society (A Young Elites Novel)','Marie Lu','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51%2BFlUlFz5L.jpg'),(62,'The Giver (Giver Quartet)','Lois Lowry','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/61-cJVGfj6L.jpg'),(63,'Six of Crows','Leigh Bardugo','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51LYZqzZcNL.jpg'),(64,'The Scorch Trials (Maze Runner, Book 2)','James Dashner','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/518YN1zzOjL.jpg'),(65,'Girl Online: On Tour','Zoe Sugg','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51f%2BIJeCgdL.jpg'),(66,'The Maze Runner (Book 1)','James Dashner','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51P9MJrBQCL.jpg'),(67,'Journey to Star Wars: The Force Awakens Lost Stars','Claudia Gray','Teen & Young Adult','1719056924868604','http://ecx.images-amazon.com/images/I/51gF3dYpeTL.jpg'),(68,'Paper Towns','John Green','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51hgkNew%2BXL.jpg'),(69,'Rush Revere and the First Patriots: Time-Travel Adventures With Exceptional Americans','Rush Limbaugh','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/517Vc9Jy0oL.jpg'),(70,'Miss Peregrine\'s Home for Peculiar Children (Miss Peregrine\'s Peculiar Children)','Ransom Riggs','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51xgGEKd6oL.jpg'),(71,'Rush Revere and the Brave Pilgrims: Time-Travel Adventures with Exceptional Americans','Rush Limbaugh','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/514izSXQ1uL.jpg'),(72,'Happily Ever After: Companion to the Selection Series (The Selection Novella)','Kiera Cass','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51L1Q0kK9RL.jpg'),(73,'The Fate of Ten (Lorien Legacies)','Pittacus Lore','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/61Dgk0A3COL.jpg'),(74,'Rush Revere and the Star-Spangled Banner','Rush Limbaugh','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/618X4EoMgBL.jpg'),(75,'The Kill Order (Maze Runner, Prequel) (The Maze Runner Series)','James Dashner','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51QsOn2IGRL.jpg'),(76,'The Hunger Games Trilogy: The Hunger Games / Catching Fire / Mockingjay','Suzanne Collins','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51dvPNSo82L.jpg'),(77,'Harry Potter And The Chamber Of Secrets','J. K. Rowling','Teen & Young Adult','projects/tay-hurlos/agent/sessions/1530092693763','http://ecx.images-amazon.com/images/I/51jNORv6nQL.jpg'),(78,'Illuminae (The Illuminae Files)','Amie Kaufman','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51vpagSvAYL.jpg'),(79,'Eleanor & Park','Rainbow Rowell','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/41yMNepSxpL.jpg'),(80,'Queen of Shadows (Throne of Glass)','Sarah J. Maas','Teen & Young Adult','1719056924868604','http://ecx.images-amazon.com/images/I/51r%2By3Ey6jL.jpg'),(81,'The 5th Wave: The First Book of the 5th Wave Series','Rick Yancey','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/519kWfgQqqL.jpg'),(82,'Hollow City: The Second Novel of Miss Peregrine\'s Peculiar Children','Ransom Riggs','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51RP7pNqzCL.jpg'),(83,'Waterfire Saga, Book Three Dark Tide','Jennifer Donnelly','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/5176eL1ZA1L.jpg'),(84,'The Boy\'s Body Book: Third Edition: Everything You Need to Know for Growing Up YOU','Kelli Dunham','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51RNn6LfRhL.jpg'),(85,'Harry Potter and the Prisoner of Azkaban','J.K. Rowling','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51gY5jzz3NL.jpg'),(86,'Divergent Series Ultimate Four-Book Box Set: Divergent, Insurgent, Allegiant, Four','Veronica Roth','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51qtn8zJVnL.jpg'),(87,'Judy Blume\'s Fudge Box Set','Judy Blume','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51X%2BJOXIfpL.jpg'),(88,'Harry Potter and the Deathly Hallows (Book 7)','J. K. Rowling','Teen & Young Adult','projects/tay-hurlos/agent/sessions/1530092742333','http://ecx.images-amazon.com/images/I/5128ATd9dSL.jpg'),(89,'The Heir (The Selection)','Kiera Cass','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51a5h1OlkvL.jpg'),(90,'Red Queen','Victoria Aveyard','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/41VTPDCAq5L.jpg'),(91,'The Fault in Our Stars','John Green','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51VlKD1aucL.jpg'),(92,'Thirteen Reasons Why','Jay Asher','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/411MJMpTseL.jpg'),(93,'Allegiant (Divergent Series)','Veronica Roth','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51AXNYr9hkL.jpg'),(94,'The Boy in the Striped Pajamas (Young Reader\'s Choice Award - Intermediate Division)','John Boyne','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51BS6FjTqqL.jpg'),(95,'The Rest of Us Just Live Here','Patrick Ness','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51dDM7po-yL.jpg'),(96,'The Game of Lives (The Mortality Doctrine, Book Three)','James Dashner','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/512B30QVD0L.jpg'),(97,'Nimona','Noelle Stevenson','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51m5E%2BGsZhL.jpg'),(98,'A Smart Girl\'s Guide: Drama, Rumors & Secrets: Staying True to Yourself in Changing Times (Smart Girl\'s Guides)','Nancy Holyoke','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51m1OlQCMsL.jpg'),(99,'The Giver Quartet boxed set','Lois Lowry','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51LkGVu9TnL.jpg'),(100,'The Infinite Sea: The Second Book of the 5th Wave','Rick Yancey','Teen & Young Adult',NULL,'http://ecx.images-amazon.com/images/I/51c%2BwRUGMvL.jpg');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `name` varchar(256) NOT NULL,
  `user` varchar(256) NOT NULL,
  KEY `FK_user` (`user`),
  CONSTRAINT `FK_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(256) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `source` varchar(256) NOT NULL,
  `prev_transac` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-09 15:11:05
