-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: monster_hunter_world
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `armor`
--

DROP TABLE IF EXISTS `armor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `rarity` int NOT NULL,
  `defense` int NOT NULL,
  `cost_money` int DEFAULT NULL,
  `rank_value` varchar(128) DEFAULT NULL,
  `set_name` varchar(128) DEFAULT NULL,
  `part` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uq_set_name_and_part` (`set_name`,`part`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor`
--

LOCK TABLES `armor` WRITE;
/*!40000 ALTER TABLE `armor` DISABLE KEYS */;
INSERT INTO `armor` VALUES (1,'レザーヘッド',1,2,100,'下位','レザー','頭'),
(3,'レザーベスト',1,2,100,'下位','レザー','胴'),
(4,'レザーグラブ',1,2,100,'下位','レザー','腕'),
(5,'レザーベルト',1,2,100,'下位','レザー','腰'),
(6,'レザーパンツ',1,2,100,'下位','レザー','足'),
(7,'チェーンヘッド',1,2,100,'下位','チェーン','頭'),
(8,'チェーンベスト',1,2,100,'下位','チェーン','胴'),
(9,'チェーングラブ',1,2,100,'下位','チェーン','腕'),
(10,'チェーンベルト',1,2,100,'下位','チェーン','腰'),
(11,'チェーンパンツ',1,2,100,'下位','チェーン','足');
/*!40000 ALTER TABLE `armor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armor_material`
--

DROP TABLE IF EXISTS `armor_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armor_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `armor_name` varchar(128) NOT NULL,
  `material_name` varchar(128) NOT NULL,
  `number_of_require_material` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_armor_name_and_material_name` (`armor_name`,`material_name`),
  CONSTRAINT `fk_armor_material_ref_armor` FOREIGN KEY (`armor_name`) REFERENCES `armor` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ck_number_of_require_material_01` CHECK ((1 <= `number_of_require_material`))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor_material`
--

LOCK TABLES `armor_material` WRITE;
/*!40000 ALTER TABLE `armor_material` DISABLE KEYS */;
INSERT INTO `armor_material` VALUES (1,'レザーヘッド','鉄鉱石',2),
(2,'レザーベスト','鉄鉱石',1),
(3,'レザーグラブ','鉄鉱石',1),
(4,'レザーベルト','鉄鉱石',1),
(5,'レザーパンツ','鉄鉱石',1),
(6,'チェーンヘッド','鉄鉱石',2),
(7,'チェーンベスト','鉄鉱石',1),
(8,'チェーングラブ','鉄鉱石',1),
(9,'チェーンベルト','鉄鉱石',1),
(10,'チェーンパンツ','鉄鉱石',1);
/*!40000 ALTER TABLE `armor_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armor_resistance`
--

DROP TABLE IF EXISTS `armor_resistance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armor_resistance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `armor_name` varchar(128) NOT NULL,
  `element_name` varchar(128) NOT NULL,
  `resistance_value` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_armor_name_and_element_name` (`armor_name`,`element_name`),
  CONSTRAINT `fk_armor_resistance_ref_armor` FOREIGN KEY (`armor_name`) REFERENCES `armor` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor_resistance`
--

LOCK TABLES `armor_resistance` WRITE;
/*!40000 ALTER TABLE `armor_resistance` DISABLE KEYS */;
INSERT INTO `armor_resistance` VALUES (1,'レザーヘッド','fire','2'),
(2,'レザーヘッド','water','0'),
(3,'レザーヘッド','thunder','0'),
(4,'レザーヘッド','ice','0'),
(5,'レザーヘッド','dragon','0'),
(6,'レザーベスト','fire','2'),
(7,'レザーベスト','water','0'),
(8,'レザーベスト','thunder','0'),
(9,'レザーベスト','ice','0'),
(10,'レザーベスト','dragon','0'),
(11,'レザーグラブ','fire','2'),
(12,'レザーグラブ','water','0'),
(13,'レザーグラブ','thunder','0'),
(14,'レザーグラブ','ice','0'),
(15,'レザーグラブ','dragon','0'),
(16,'レザーベルト','fire','2'),
(17,'レザーベルト','water','0'),
(18,'レザーベルト','thunder','0'),
(19,'レザーベルト','ice','0'),
(20,'レザーベルト','dragon','0'),
(21,'レザーパンツ','fire','2'),
(22,'レザーパンツ','water','0'),
(23,'レザーパンツ','thunder','0'),
(24,'レザーパンツ','ice','0'),
(25,'レザーパンツ','dragon','0'),
(26,'チェーンヘッド','fire','0'),
(27,'チェーンヘッド','water','2'),
(28,'チェーンヘッド','thunder','0'),
(29,'チェーンヘッド','ice','0'),
(30,'チェーンヘッド','dragon','0'),
(31,'チェーンベスト','fire','0'),
(32,'チェーンベスト','water','2'),
(33,'チェーンベスト','thunder','0'),
(34,'チェーンベスト','ice','0'),
(35,'チェーンベスト','dragon','0'),
(36,'チェーングラブ','fire','0'),
(37,'チェーングラブ','water','2'),
(38,'チェーングラブ','thunder','0'),
(39,'チェーングラブ','ice','0'),
(40,'チェーングラブ','dragon','0'),
(41,'チェーンベルト','fire','0'),
(42,'チェーンベルト','water','2'),
(43,'チェーンベルト','thunder','0'),
(44,'チェーンベルト','ice','0'),
(45,'チェーンベルト','dragon','0'),
(46,'チェーンパンツ','fire','0'),
(47,'チェーンパンツ','water','2'),
(48,'チェーンパンツ','thunder','0'),
(49,'チェーンパンツ','ice','0'),
(50,'チェーンパンツ','dragon','0');
/*!40000 ALTER TABLE `armor_resistance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armor_set_bonus`
--

DROP TABLE IF EXISTS `armor_set_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armor_set_bonus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `armor_name` varchar(128) NOT NULL,
  `bonus_name` varchar(128) NOT NULL,
  `bonus_skill_name` varchar(128) NOT NULL,
  `number_of_require_piece` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_armor_name_and_bonus_name` (`armor_name`,`bonus_name`),
  CONSTRAINT `fk_armor_set_bonus_ref_armor` FOREIGN KEY (`armor_name`) REFERENCES `armor` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ck_number_of_require_piece_01` CHECK (((1 <= `number_of_require_piece`) and (`number_of_require_piece` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor_set_bonus`
--

LOCK TABLES `armor_set_bonus` WRITE;
/*!40000 ALTER TABLE `armor_set_bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `armor_set_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armor_skill`
--

DROP TABLE IF EXISTS `armor_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armor_skill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `armor_name` varchar(128) NOT NULL,
  `skill_name` varchar(128) NOT NULL,
  `skill_level` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_armor_name_and_skill_name` (`armor_name`,`skill_name`),
  CONSTRAINT `fk_armor_skill_ref_armor` FOREIGN KEY (`armor_name`) REFERENCES `armor` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ck_skill_level_01` CHECK ((1 <= `skill_level`))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor_skill`
--

LOCK TABLES `armor_skill` WRITE;
/*!40000 ALTER TABLE `armor_skill` DISABLE KEYS */;
INSERT INTO `armor_skill` VALUES (1,'レザーヘッド','腹減り耐性',1),
(2,'チェーンヘッド','採集の達人',1);
/*!40000 ALTER TABLE `armor_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armor_slot`
--

DROP TABLE IF EXISTS `armor_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armor_slot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `armor_name` varchar(128) NOT NULL,
  `slot_level` int NOT NULL,
  `number_of_slot` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_armor_name_and_slot_level` (`armor_name`,`slot_level`),
  CONSTRAINT `fk_armor_name_ref_armor_name` FOREIGN KEY (`armor_name`) REFERENCES `armor` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ck_number_of_slot_01` CHECK (((1 <= `number_of_slot`) and (`number_of_slot` <= 3))),
  CONSTRAINT `ck_slot_level_01` CHECK (((1 <= `slot_level`) and (`slot_level` <= 4)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor_slot`
--

LOCK TABLES `armor_slot` WRITE;
/*!40000 ALTER TABLE `armor_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `armor_slot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
