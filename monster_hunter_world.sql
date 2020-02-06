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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
(11,'チェーンパンツ',1,2,100,'下位','チェーン','足'),
(12,'ハンターヘルム',1,6,200,'下位','ハンター','頭'),
(13,'ハンターメイル',1,6,200,'下位','ハンター','胴'),
(14,'ハンターアーム',1,6,200,'下位','ハンター','腕'),
(15,'ハンターコイル',1,6,200,'下位','ハンター','腰'),
(16,'ハンターグリーヴ',1,6,200,'下位','ハンター','足'),
(17,'ボーンヘルム',1,6,200,'下位','ボーン','頭'),
(18,'ボーンメイル',1,6,200,'下位','ボーン','胴'),
(19,'ボーンアーム',1,6,200,'下位','ボーン','腕'),
(20,'ボーンコイル',1,6,200,'下位','ボーン','腰'),
(21,'ボーングリーヴ',1,6,200,'下位','ボーン','足'),
(22,'ランゴヘルム',1,8,200,'下位','ランゴ','頭'),
(23,'ランゴメイル',1,8,200,'下位','ランゴ','胴'),
(24,'ランゴアーム',1,8,200,'下位','ランゴ','腕'),
(25,'ランゴコイル',1,8,200,'下位','ランゴ','腰'),
(27,'ランゴグリーヴ',1,8,200,'下位','ランゴ','足'),
(28,'ケストガード',1,12,200,'下位','ケスト','腕'),
(29,'ガライーブーツ',1,12,200,'下位','ガライー','足'),
(30,'ジャグラスヘルム',1,8,200,'下位','ジャグラス','頭'),
(31,'ジャグラスメイル',1,8,200,'下位','ジャグラス','胴'),
(32,'ジャグラスアーム',1,8,200,'下位','ジャグラス','腕'),
(33,'ジャグラスコイル',1,8,200,'下位','ジャグラス','腰'),
(34,'ジャグラスグリーヴ',1,8,200,'下位','ジャグラス','足');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
(10,'チェーンパンツ','鉄鉱石',1),
(11,'ハンターヘルム','ジャグラスの皮',2),
(12,'ハンターヘルム','ジャグラスの鱗',2),
(13,'ハンターメイル','ジャグラスの皮',2),
(14,'ハンターメイル','竜骨【小】',2),
(15,'ハンターアーム','ジャグラスの皮',1),
(16,'ハンターアーム','ジャグラスの鱗',1),
(17,'ハンターコイル','ジャグラスの皮',1),
(18,'ハンターコイル','竜骨【小】',1),
(19,'ハンターグリーヴ','ジャグラスの皮',1),
(20,'ハンターグリーヴ','竜骨【小】',1),
(21,'ボーンヘルム','太古の大骨',2),
(22,'ボーンヘルム','竜骨【小】',2),
(23,'ボーンメイル','太古の大骨',1),
(24,'ボーンメイル','竜骨【小】',1),
(25,'ボーンアーム','ケストドンの甲殻',2),
(26,'ボーンアーム','竜骨【小】',3),
(27,'ボーンコイル','ケストドンの甲殻',1),
(28,'ボーンコイル','竜骨【小】',1),
(29,'ボーングリーヴ','太古の大骨',1),
(30,'ボーングリーヴ','竜骨【小】',1),
(31,'ランゴヘルム','ランゴスタの甲殻',2),
(32,'ランゴヘルム','鉄鉱石',2),
(33,'ランゴメイル','ランゴスタの甲殻',1),
(34,'ランゴメイル','マカライト鉱石',1),
(35,'ランゴアーム','ランゴスタの羽',2),
(36,'ランゴアーム','モンスターの体液',1),
(37,'ランゴコイル','ランゴスタの甲殻',1),
(38,'ランゴコイル','鉄鉱石',4),
(39,'ランゴグリーヴ','ランゴスタの羽',2),
(40,'ランゴグリーヴ','モンスターの体液',1),
(41,'ケストガード','ケストドンの甲殻',6),
(42,'ケストガード','ケストドンの頭殻',3),
(43,'ガライーブーツ','咬魚の皮',4),
(44,'ガライーブーツ','咬魚のヒゲ',2),
(45,'ジャグラスヘルム','賊竜の皮',2),
(46,'ジャグラスヘルム','賊竜のたてがみ',2),
(47,'ジャグラスヘルム','賊竜の爪',2),
(48,'ジャグラスヘルム','太古の大骨',1),
(49,'ジャグラスメイル','賊竜の皮',2),
(50,'ジャグラスメイル','賊竜の鱗',2),
(51,'ジャグラスメイル','賊竜の爪',1),
(52,'ジャグラスメイル','竜骨【小】',3),
(53,'ジャグラスアーム','賊竜の皮',1),
(54,'ジャグラスアーム','賊竜の鱗',2),
(55,'ジャグラスアーム','ジャグラスの皮',3),
(56,'ジャグラスコイル','賊竜の皮',1),
(57,'ジャグラスコイル','賊竜のたてがみ',1),
(58,'ジャグラスコイル','賊竜の鱗',2),
(59,'ジャグラスコイル','とがった爪',2),
(60,'ジャグラスグリーヴ','賊竜の鱗',1),
(61,'ジャグラスグリーヴ','賊竜の皮',1),
(62,'ジャグラスグリーヴ','賊竜のたてがみ',2),
(63,'ジャグラスグリーヴ','ジャグラスの鱗',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
(50,'チェーンパンツ','dragon','0'),
(51,'ハンターヘルム','fire','2'),
(52,'ハンターヘルム','water','2'),
(53,'ハンターヘルム','thunder','0'),
(54,'ハンターヘルム','ice','0'),
(55,'ハンターヘルム','dragon','0'),
(56,'ハンターメイル','fire','2'),
(57,'ハンターメイル','water','2'),
(58,'ハンターメイル','thunder','0'),
(59,'ハンターメイル','ice','0'),
(60,'ハンターメイル','dragon','0'),
(61,'ハンターアーム','fire','2'),
(62,'ハンターアーム','water','2'),
(63,'ハンターアーム','thunder','0'),
(64,'ハンターアーム','ice','0'),
(65,'ハンターアーム','dragon','0'),
(66,'ハンターコイル','fire','2'),
(67,'ハンターコイル','water','2'),
(68,'ハンターコイル','thunder','0'),
(69,'ハンターコイル','ice','0'),
(70,'ハンターコイル','dragon','0'),
(71,'ハンターグリーヴ','fire','2'),
(72,'ハンターグリーヴ','water','2'),
(73,'ハンターグリーヴ','thunder','0'),
(74,'ハンターグリーヴ','ice','0'),
(75,'ハンターグリーヴ','dragon','0'),
(76,'ボーンヘルム','fire','2'),
(77,'ボーンヘルム','water','0'),
(78,'ボーンヘルム','thunder','2'),
(79,'ボーンヘルム','ice','0'),
(80,'ボーンヘルム','dragon','2'),
(81,'ボーンメイル','fire','2'),
(82,'ボーンメイル','water','0'),
(83,'ボーンメイル','thunder','2'),
(84,'ボーンメイル','ice','0'),
(85,'ボーンメイル','dragon','2'),
(86,'ボーンアーム','fire','2'),
(87,'ボーンアーム','water','0'),
(88,'ボーンアーム','thunder','2'),
(89,'ボーンアーム','ice','0'),
(90,'ボーンアーム','dragon','2'),
(91,'ボーンコイル','fire','2'),
(92,'ボーンコイル','water','0'),
(93,'ボーンコイル','thunder','2'),
(94,'ボーンコイル','ice','0'),
(95,'ボーンコイル','dragon','2'),
(96,'ボーングリーヴ','fire','2'),
(97,'ボーングリーヴ','water','0'),
(98,'ボーングリーヴ','thunder','2'),
(99,'ボーングリーヴ','ice','0'),
(100,'ボーングリーヴ','dragon','2'),
(101,'ランゴヘルム','fire','-2'),
(102,'ランゴヘルム','water','1'),
(103,'ランゴヘルム','thunder','1'),
(104,'ランゴヘルム','ice','1'),
(105,'ランゴヘルム','dragon','2'),
(106,'ランゴメイル','fire','-2'),
(107,'ランゴメイル','water','1'),
(108,'ランゴメイル','thunder','1'),
(109,'ランゴメイル','ice','1'),
(110,'ランゴメイル','dragon','2'),
(111,'ランゴアーム','fire','-2'),
(112,'ランゴアーム','water','1'),
(113,'ランゴアーム','thunder','1'),
(114,'ランゴアーム','ice','1'),
(115,'ランゴアーム','dragon','2'),
(116,'ランゴコイル','fire','-2'),
(117,'ランゴコイル','water','1'),
(118,'ランゴコイル','thunder','1'),
(119,'ランゴコイル','ice','1'),
(120,'ランゴコイル','dragon','2'),
(121,'ランゴグリーヴ','fire','-2'),
(122,'ランゴグリーヴ','water','1'),
(123,'ランゴグリーヴ','thunder','1'),
(124,'ランゴグリーヴ','ice','1'),
(125,'ランゴグリーヴ','dragon','2'),
(126,'ケストガード','fire','4'),
(127,'ケストガード','water','0'),
(128,'ケストガード','thunder','0'),
(129,'ケストガード','ice','0'),
(130,'ケストガード','dragon','0'),
(131,'ガライーブーツ','fire','0'),
(132,'ガライーブーツ','water','5'),
(133,'ガライーブーツ','thunder','0'),
(134,'ガライーブーツ','ice','0'),
(135,'ガライーブーツ','dragon','0'),
(136,'ジャグラスヘルム','fire','-2'),
(137,'ジャグラスヘルム','water','2'),
(138,'ジャグラスヘルム','thunder','-1'),
(139,'ジャグラスヘルム','ice','-1'),
(140,'ジャグラスヘルム','dragon','1'),
(141,'ジャグラスメイル','fire','-2'),
(142,'ジャグラスメイル','water','2'),
(143,'ジャグラスメイル','thunder','-1'),
(144,'ジャグラスメイル','ice','-1'),
(145,'ジャグラスメイル','dragon','1'),
(146,'ジャグラスアーム','fire','-2'),
(147,'ジャグラスアーム','water','2'),
(148,'ジャグラスアーム','thunder','-1'),
(149,'ジャグラスアーム','ice','-1'),
(150,'ジャグラスアーム','dragon','1'),
(151,'ジャグラスコイル','fire','-2'),
(152,'ジャグラスコイル','water','2'),
(153,'ジャグラスコイル','thunder','-1'),
(154,'ジャグラスコイル','ice','-1'),
(155,'ジャグラスコイル','dragon','1'),
(156,'ジャグラスグリーヴ','fire','-2'),
(157,'ジャグラスグリーヴ','water','2'),
(158,'ジャグラスグリーヴ','thunder','-1'),
(159,'ジャグラスグリーヴ','ice','-1'),
(160,'ジャグラスグリーヴ','dragon','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor_skill`
--

LOCK TABLES `armor_skill` WRITE;
/*!40000 ALTER TABLE `armor_skill` DISABLE KEYS */;
INSERT INTO `armor_skill` VALUES (1,'レザーヘッド','腹減り耐性',1),
(2,'チェーンヘッド','採集の達人',1),
(3,'ハンターヘルム','導蟲反応距離UP',1),
(4,'ハンターメイル','スリンガー装填数UP',1),
(5,'ハンターアーム','潜伏',1),
(6,'ハンターコイル','追跡の達人',1),
(7,'ハンターグリーヴ','肉焼き名人',1),
(8,'ボーンヘルム','体力増強',1),
(9,'ボーンメイル','攻撃',1),
(10,'ボーンアーム','KO術',1),
(11,'ボーンコイル','笛吹き名人',1),
(12,'ボーングリーヴ','昆虫標本の達人',1),
(13,'ランゴヘルム','納刀術',1),
(14,'ランゴメイル','風圧耐性',1),
(15,'ランゴアーム','麻痺属性強化',1),
(16,'ランゴコイル','麻痺耐性',1),
(17,'ランゴグリーヴ','ハニーハンター',1),
(18,'ケストガード','滑走強化',1),
(19,'ガライーブーツ','水場・深雪適応',1),
(20,'ジャグラスヘルム','早食い',1),
(21,'ジャグラスメイル','威嚇',1),
(22,'ジャグラスアーム','オトモへの采配',1),
(23,'ジャグラスコイル','不屈',1),
(24,'ジャグラスグリーヴ','しゃがみ移動速度UP',1);
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
