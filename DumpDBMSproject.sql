-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cs5200project
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute` (
  `attributeName` varchar(255) NOT NULL,
  PRIMARY KEY (`attributeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES ('AttackMagicPotency'),('AttackPower'),('AverageItemLevel'),('CriticalHit'),('Defense'),('Determination'),('Dexterity'),('DirectHitRate'),('HealingMagicPotency'),('hp'),('Intelligence'),('MagicDefense'),('Mind'),('mp'),('Piety'),('SkillSpeed'),('SpellSpeed'),('Strength'),('Tenacity'),('Vitality');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character` (
  `characterID` int NOT NULL AUTO_INCREMENT,
  `accountID` int NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `mainHandItemID` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`characterID`),
  UNIQUE KEY `uq_Charater_firstName_lastName` (`firstName`,`lastName`),
  KEY `fk_Character_accountID` (`accountID`),
  KEY `fk_Character_mainHandItemID` (`mainHandItemID`),
  CONSTRAINT `fk_Character_accountID` FOREIGN KEY (`accountID`) REFERENCES `playeraccount` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Character_mainHandItemID` FOREIGN KEY (`mainHandItemID`) REFERENCES `weapon` (`itemID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES (1,1,'Azura','Storm',1),(2,1,'Luna','Shadow',1),(3,2,'Drakon','Heart',2),(4,4,'Astral','Seeker',1),(5,5,'Eclipse','Whisper',16),(6,10,'Cyril','blade2',17),(7,10,'Cyril','Mist',18),(8,10,'Cyril','Storm',19),(9,10,'Syncytia','Light',23),(10,10,'Toothless','Frost',24);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characterattributerelation`
--

DROP TABLE IF EXISTS `characterattributerelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characterattributerelation` (
  `characterID` int NOT NULL,
  `attributeName` varchar(255) NOT NULL,
  `attributePower` int NOT NULL,
  PRIMARY KEY (`characterID`,`attributeName`),
  KEY `fk_CharacterAttributeRelation_attributeName` (`attributeName`),
  CONSTRAINT `fk_CharacterAttributeRelation_attributeName` FOREIGN KEY (`attributeName`) REFERENCES `attribute` (`attributeName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CharacterAttributeRelation_characterID` FOREIGN KEY (`characterID`) REFERENCES `character` (`characterID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characterattributerelation`
--

LOCK TABLES `characterattributerelation` WRITE;
/*!40000 ALTER TABLE `characterattributerelation` DISABLE KEYS */;
INSERT INTO `characterattributerelation` VALUES (1,'CriticalHit',1678),(1,'Defense',2511),(1,'Determination',340),(1,'DirectHitRate',356),(1,'MagicDefense',3220),(1,'Strength',3000),(1,'Tenacity',90),(1,'Vitality',2134),(2,'CriticalHit',2178),(2,'Defense',1111),(2,'Determination',1340),(2,'DirectHitRate',1356),(2,'MagicDefense',1220),(2,'Strength',3500),(2,'Tenacity',190),(2,'Vitality',1134),(3,'CriticalHit',1178),(3,'Defense',1911),(3,'Determination',140),(3,'DirectHitRate',556),(3,'MagicDefense',900),(3,'Strength',4500),(3,'Tenacity',290),(3,'Vitality',2134),(4,'CriticalHit',2178),(4,'Defense',2911),(4,'Determination',1140),(4,'DirectHitRate',2156),(4,'MagicDefense',1900),(4,'Strength',2500),(4,'Tenacity',790),(4,'Vitality',1134),(5,'CriticalHit',2178),(5,'Defense',1371),(5,'Determination',1240),(5,'DirectHitRate',756),(5,'MagicDefense',850),(5,'Strength',3500),(5,'Tenacity',490),(5,'Vitality',1134),(6,'CriticalHit',1678),(6,'Defense',2511),(6,'Determination',340),(6,'DirectHitRate',356),(6,'MagicDefense',3220),(6,'Strength',3000),(6,'Tenacity',90),(6,'Vitality',2134),(7,'CriticalHit',2178),(7,'Defense',1111),(7,'Determination',1340),(7,'DirectHitRate',1356),(7,'MagicDefense',1220),(7,'Strength',3500),(7,'Tenacity',190),(7,'Vitality',1134),(8,'CriticalHit',1178),(8,'Defense',1911),(8,'Determination',140),(8,'DirectHitRate',556),(8,'MagicDefense',900),(8,'Strength',4500),(8,'Tenacity',290),(8,'Vitality',2134),(9,'CriticalHit',2178),(9,'Defense',2911),(9,'Determination',1140),(9,'DirectHitRate',2156),(9,'MagicDefense',1900),(9,'Strength',2500),(9,'Tenacity',790),(9,'Vitality',1134),(10,'CriticalHit',2178),(10,'Defense',1371),(10,'Determination',1240),(10,'DirectHitRate',756),(10,'MagicDefense',850),(10,'Strength',3500),(10,'Tenacity',490),(10,'Vitality',1134);
/*!40000 ALTER TABLE `characterattributerelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charactercurrencyrelation`
--

DROP TABLE IF EXISTS `charactercurrencyrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charactercurrencyrelation` (
  `currencyID` int NOT NULL,
  `characterID` int NOT NULL,
  `amountOwned` int NOT NULL DEFAULT '0',
  `weeklyEarned` int DEFAULT NULL,
  PRIMARY KEY (`characterID`,`currencyID`),
  KEY `fk_CharacterCurrencyRelation_currencyID` (`currencyID`),
  CONSTRAINT `fk_CharacterCurrencyRelation_characterID` FOREIGN KEY (`characterID`) REFERENCES `character` (`characterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CharacterCurrencyRelation_currencyID` FOREIGN KEY (`currencyID`) REFERENCES `currency` (`currencyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charactercurrencyrelation`
--

LOCK TABLES `charactercurrencyrelation` WRITE;
/*!40000 ALTER TABLE `charactercurrencyrelation` DISABLE KEYS */;
INSERT INTO `charactercurrencyrelation` VALUES (1,1,1500,350),(2,1,1900,410),(3,2,879,50),(2,3,540,78),(4,3,1000,200),(2,4,789,90),(5,4,800,150),(6,5,2500,100),(1,6,1400,300),(7,6,8000,200),(2,7,1900,400),(8,7,300,50),(9,8,600,80),(10,9,850,300),(11,10,1200,100);
/*!40000 ALTER TABLE `charactercurrencyrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charactergearrelation`
--

DROP TABLE IF EXISTS `charactergearrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charactergearrelation` (
  `characterID` int NOT NULL,
  `slotType` varchar(255) NOT NULL,
  `gearID` int NOT NULL,
  PRIMARY KEY (`characterID`,`slotType`),
  KEY `fk_CharacterGearRelation_slotType` (`slotType`),
  KEY `fk_CharacterGearRelation_gearID` (`gearID`),
  CONSTRAINT `fk_CharacterGearRelation_characterID` FOREIGN KEY (`characterID`) REFERENCES `character` (`characterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CharacterGearRelation_gearID` FOREIGN KEY (`gearID`) REFERENCES `gear` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CharacterGearRelation_slotType` FOREIGN KEY (`slotType`) REFERENCES `slot` (`slotType`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charactergearrelation`
--

LOCK TABLES `charactergearrelation` WRITE;
/*!40000 ALTER TABLE `charactergearrelation` DISABLE KEYS */;
INSERT INTO `charactergearrelation` VALUES (10,'feet',6),(2,'earring',8),(6,'earring',8),(7,'earring',8),(9,'earring',8),(10,'earring',8),(7,'feet',10),(8,'feet',10),(6,'body',20),(7,'body',21),(8,'head',38),(9,'body',39);
/*!40000 ALTER TABLE `charactergearrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characterjobrelation`
--

DROP TABLE IF EXISTS `characterjobrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characterjobrelation` (
  `characterID` int NOT NULL,
  `jobID` int NOT NULL,
  `jobLevel` int NOT NULL DEFAULT '0',
  `isPlayed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`characterID`,`jobID`),
  KEY `fk_CharacterJobRelation_jobID` (`jobID`),
  CONSTRAINT `fk_CharacterJobRelation_characterID` FOREIGN KEY (`characterID`) REFERENCES `character` (`characterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CharacterJobRelation_jobID` FOREIGN KEY (`jobID`) REFERENCES `job` (`jobID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characterjobrelation`
--

LOCK TABLES `characterjobrelation` WRITE;
/*!40000 ALTER TABLE `characterjobrelation` DISABLE KEYS */;
INSERT INTO `characterjobrelation` VALUES (6,1,60,1),(6,5,70,1),(7,1,50,1),(7,9,60,1),(8,1,50,1),(8,10,80,1),(9,1,70,1),(9,6,82,1),(10,1,0,0),(10,2,0,0),(10,4,65,1),(10,7,75,1),(10,8,55,1);
/*!40000 ALTER TABLE `characterjobrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumable`
--

DROP TABLE IF EXISTS `consumable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumable` (
  `itemID` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  CONSTRAINT `fk_Consumable_itemID` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumable`
--

LOCK TABLES `consumable` WRITE;
/*!40000 ALTER TABLE `consumable` DISABLE KEYS */;
INSERT INTO `consumable` VALUES (7,'Yummy egg'),(11,'Expensive Wine'),(12,'Lucky'),(13,'Essence, Get Huge Power'),(14,'Be cured'),(15,'Yummy milk'),(27,'Restores a small amount of health'),(28,'Restores a small amount of mana'),(29,'Restores stamina instantly'),(30,'Boosts strength temporarily'),(31,'Boosts intellect temporarily'),(32,'Grants temporary invisibility'),(33,'Grants temporary invulnerability'),(34,'Increases movement speed temporarily'),(35,'Provides temporary resistance to fire damage'),(36,'Provides temporary resistance to ice damage');
/*!40000 ALTER TABLE `consumable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumableattributerelation`
--

DROP TABLE IF EXISTS `consumableattributerelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumableattributerelation` (
  `consumableID` int NOT NULL,
  `attributeName` varchar(255) NOT NULL,
  `bonusPercentage` float NOT NULL,
  `bonusCap` int DEFAULT NULL,
  PRIMARY KEY (`consumableID`,`attributeName`),
  KEY `fk_ConsumableAttributeRelation_attributeName` (`attributeName`),
  CONSTRAINT `fk_ConsumableAttributeRelation_attributeName` FOREIGN KEY (`attributeName`) REFERENCES `attribute` (`attributeName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ConsumableAttributeRelation_consumableID` FOREIGN KEY (`consumableID`) REFERENCES `consumable` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumableattributerelation`
--

LOCK TABLES `consumableattributerelation` WRITE;
/*!40000 ALTER TABLE `consumableattributerelation` DISABLE KEYS */;
INSERT INTO `consumableattributerelation` VALUES (7,'Determination',0.01,5),(7,'Tenacity',0.01,10),(7,'Vitality',0.01,10),(11,'Determination',0.02,15),(11,'Tenacity',0.02,20),(11,'Vitality',0.02,20),(12,'Determination',0.03,15),(12,'Tenacity',0.03,30),(12,'Vitality',0.03,30),(13,'Determination',0.15,50),(13,'Tenacity',0.15,200),(13,'Vitality',0.15,200),(15,'Determination',0.01,5),(15,'Tenacity',0.01,10),(15,'Vitality',0.01,10),(27,'hp',0.05,100),(28,'mp',0.05,100),(29,'Strength',0.02,20),(30,'Determination',0.03,25),(31,'Intelligence',0.03,30),(32,'DirectHitRate',0.02,15),(33,'Defense',0.04,40),(34,'SkillSpeed',0.05,20),(35,'Strength',0.1,50),(36,'Vitality',0.1,50);
/*!40000 ALTER TABLE `consumableattributerelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `currencyID` int NOT NULL AUTO_INCREMENT,
  `currencyName` varchar(255) NOT NULL,
  `totalCap` int NOT NULL,
  `weeklyCap` int DEFAULT NULL,
  PRIMARY KEY (`currencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'Crystal Shards',2000,450),(2,'Gold Crowns',2000,450),(3,'Astral Essence',1000,200),(4,'Platinum Ingots',1000,200),(5,'Soul stones',1000,100),(6,'Silver Marks',5000,100),(7,'Bronze Coins',10000,200),(8,'Hero Tokens',500,50),(9,'Mystic Gems',800,80),(10,'Battle Points',900,300),(11,'Event Tickets',1200,100);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gear`
--

DROP TABLE IF EXISTS `gear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gear` (
  `itemID` int NOT NULL,
  `slotType` varchar(255) DEFAULT NULL,
  `requiredLevel` int NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `fk_Gear_slotType` (`slotType`),
  CONSTRAINT `fk_Gear_itemID` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Gear_slotType` FOREIGN KEY (`slotType`) REFERENCES `slot` (`slotType`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gear`
--

LOCK TABLES `gear` WRITE;
/*!40000 ALTER TABLE `gear` DISABLE KEYS */;
INSERT INTO `gear` VALUES (6,'feet',10),(8,'earring',10),(9,'body',30),(10,'feet',30),(16,'mainhand',40),(20,'body',30),(21,'body',25),(37,'offhand',20),(38,'head',30),(39,'body',40),(40,'feet',10),(41,'hands',20),(42,'earring',35),(43,'ring',35),(44,'wrist',25),(45,'legs',30),(46,'body',20);
/*!40000 ALTER TABLE `gear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gearattributerelation`
--

DROP TABLE IF EXISTS `gearattributerelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gearattributerelation` (
  `gearID` int NOT NULL,
  `attributeName` varchar(255) NOT NULL,
  `bonusNumber` int NOT NULL,
  PRIMARY KEY (`gearID`,`attributeName`),
  KEY `fk_GearAttributeRelation_attributeName` (`attributeName`),
  CONSTRAINT `fk_GearAttributeRelation_attributeName` FOREIGN KEY (`attributeName`) REFERENCES `attribute` (`attributeName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_GearAttributeRelation_gearID` FOREIGN KEY (`gearID`) REFERENCES `gear` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gearattributerelation`
--

LOCK TABLES `gearattributerelation` WRITE;
/*!40000 ALTER TABLE `gearattributerelation` DISABLE KEYS */;
INSERT INTO `gearattributerelation` VALUES (6,'CriticalHit',35),(6,'Defense',25),(6,'Determination',22),(6,'MagicDefense',20),(6,'Strength',32),(6,'Vitality',15),(8,'CriticalHit',90),(8,'Defense',45),(8,'Determination',40),(8,'MagicDefense',29),(8,'Strength',30),(8,'Vitality',20),(9,'CriticalHit',25),(9,'Defense',75),(9,'Determination',20),(9,'MagicDefense',90),(9,'Strength',45),(9,'Vitality',30),(10,'CriticalHit',40),(10,'Defense',15),(10,'Determination',30),(10,'MagicDefense',9),(10,'Strength',10),(10,'Vitality',20),(20,'Defense',200),(20,'Dexterity',160),(21,'Intelligence',170),(21,'MagicDefense',180),(37,'CriticalHit',20),(37,'Defense',15),(37,'Determination',20),(37,'MagicDefense',9),(37,'Strength',30),(37,'Vitality',10),(38,'Strength',100),(39,'Vitality',120),(40,'Determination',130),(41,'SkillSpeed',140),(42,'CriticalHit',150),(43,'Mind',180);
/*!40000 ALTER TABLE `gearattributerelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gearjobrelation`
--

DROP TABLE IF EXISTS `gearjobrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gearjobrelation` (
  `gearID` int NOT NULL,
  `jobID` int NOT NULL,
  PRIMARY KEY (`gearID`,`jobID`),
  KEY `fk_GearJobRelation_jobID` (`jobID`),
  CONSTRAINT `fk_GearJobRelation_gearID` FOREIGN KEY (`gearID`) REFERENCES `gear` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_GearJobRelation_jobID` FOREIGN KEY (`jobID`) REFERENCES `job` (`jobID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gearjobrelation`
--

LOCK TABLES `gearjobrelation` WRITE;
/*!40000 ALTER TABLE `gearjobrelation` DISABLE KEYS */;
INSERT INTO `gearjobrelation` VALUES (6,1),(8,1),(9,1),(41,1),(6,2),(10,2),(37,2),(42,2),(6,3),(8,3),(10,3),(20,3),(37,3),(6,4),(21,4),(9,5),(10,5),(43,5),(20,6),(21,7),(38,8),(39,9),(40,10);
/*!40000 ALTER TABLE `gearjobrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `characterID` int NOT NULL,
  `inventoryPosition` int NOT NULL,
  `itemID` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`characterID`,`inventoryPosition`),
  KEY `fk_Inventory_itemID` (`itemID`),
  CONSTRAINT `fk_Inventory_characterID` FOREIGN KEY (`characterID`) REFERENCES `character` (`characterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Inventory_itemID` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,1,1),(1,2,3,1),(1,3,4,1),(1,4,14,9),(1,5,7,76),(1,6,27,2),(1,7,28,3),(2,1,2,1),(2,2,3,1),(2,3,6,1),(2,4,8,1),(2,5,10,1),(2,6,29,4),(2,7,30,1),(3,6,31,2),(3,7,32,1),(4,6,33,5),(4,7,34,2),(5,6,35,3),(5,7,36,1),(6,1,1,1),(6,4,31,9),(6,5,32,76),(6,9,6,1),(6,10,8,1),(6,11,20,1),(6,12,37,1),(6,13,17,1),(7,1,2,1),(7,2,21,1),(7,4,8,1),(7,5,10,1),(7,9,35,1),(7,10,34,1),(7,11,33,1),(7,12,18,1),(7,13,46,1),(8,1,2,2),(8,4,8,1),(8,5,10,1),(8,9,27,2),(8,10,15,1),(8,11,14,2),(8,12,19,1),(8,13,38,1),(9,1,2,1),(9,4,8,3),(9,5,10,1),(9,6,36,1),(9,7,27,3),(9,8,39,3),(9,9,23,1),(10,3,6,1),(10,4,8,4),(10,5,10,1),(10,7,27,4),(10,8,30,1),(10,9,32,4),(10,10,36,1),(10,11,42,4),(10,12,24,1),(10,14,22,1),(10,15,25,1);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `itemName` varchar(255) NOT NULL,
  `maxStackSize` int NOT NULL,
  `isSellable` tinyint(1) NOT NULL DEFAULT '0',
  `unitPrice` int DEFAULT NULL,
  `itemLevel` int NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Blade',1,1,600,160),(2,'Bow',1,1,100,130),(3,'Gauntlets',1,1,200,200),(4,'Hammer',1,1,1000,800),(5,'Rifle',1,1,1500,900),(6,'Runningshoe',1,1,100,40),(7,'Egg',999,1,10,10),(8,'Earring',1,1,50,20),(9,'Robes',1,1,100,20),(10,'Boots',1,1,100,20),(11,'RedWine',999,1,100,20),(12,'FortuneCookie',999,1,50,10),(13,'PhantomEssence',99,1,1000,200),(14,'Antidote',99,1,1000,200),(15,'Milk',999,1,10,10),(16,'AdvancedRifle',1,1,2000,900),(17,'Sword of the Ancients',1,1,1000,50),(18,'Staff of Elemental Fury',1,1,950,45),(19,'Twin Daggers of Shadow',1,1,900,40),(20,'Dragonhide Chestplate',1,1,1200,60),(21,'Celestial Robes',1,1,1150,55),(22,'Frostfire Blade',1,1,1000,50),(23,'Thunderclap Bow',1,1,950,45),(24,'Shadowreaper Scythe',1,1,900,40),(25,'Starlight Staff',1,1,1200,60),(26,'Earthshaker Axe',1,1,1150,55),(27,'Healing Potion',99,1,50,1),(28,'Mana Potion',99,1,50,1),(29,'Stamina Draught',99,1,75,1),(30,'Elixir of Strength',99,1,100,1),(31,'Elixir of Intellect',99,1,100,1),(32,'Invisibility Potion',99,1,150,1),(33,'Invulnerability Potion',99,1,200,1),(34,'Speed Potion',99,1,120,1),(35,'Fire Resistance Potion',99,1,80,1),(36,'Ice Resistance Potion',99,1,80,1),(37,'Silver Shield',1,1,350,30),(38,'Golden Helmet',1,1,500,45),(39,'Mystic Cloak',1,1,750,60),(40,'Leather Boots',1,1,120,15),(41,'Chain Gloves',1,1,180,25),(42,'Crystal Earring',1,1,220,40),(43,'Emerald Ring',1,1,300,50),(44,'Obsidian Wristguard',1,1,250,35),(45,'Titanium Leggings',1,1,800,55),(46,'Diamond Chestplate',1,1,1000,70);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `jobID` int NOT NULL AUTO_INCREMENT,
  `jobName` varchar(255) NOT NULL,
  `jobLevelCap` int NOT NULL DEFAULT '90',
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Blade Master',90),(2,'Mystic Engineer',90),(3,'Holy Templar',90),(4,'Arcane Artificer',90),(5,'Elixir Master',90),(6,'Warrior',90),(7,'Samurai',90),(8,'White Mage',90),(9,'Rogue',90),(10,'Cleric',90),(11,'Ranger',90);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playeraccount`
--

DROP TABLE IF EXISTS `playeraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playeraccount` (
  `accountID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`accountID`),
  UNIQUE KEY `userName` (`userName`),
  UNIQUE KEY `emailAddress` (`emailAddress`),
  UNIQUE KEY `uq_PlayerAccount_userName` (`userName`),
  UNIQUE KEY `uq_PlayerAccount_emailAddress` (`emailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playeraccount`
--

LOCK TABLES `playeraccount` WRITE;
/*!40000 ALTER TABLE `playeraccount` DISABLE KEYS */;
INSERT INTO `playeraccount` VALUES (1,'JohnSmith','js0302@gmail.com'),(2,'JimmySmith','js0303@gmail.com'),(3,'SamSmith','ss0304@gmail.com'),(4,'AnneMiller','am0305@gmail.com'),(5,'TonyWilliams','tw0306@gmail.com'),(6,'JaneDoe','jad@email.com'),(7,'JasonDoe','jd@email.com'),(8,'JoySeattle','js@email.com'),(9,'MichaelRiver','mr@email.com'),(10,'CharlieBrown','cb@email.com'),(11,'AliceJohnson','aj@email.com');
/*!40000 ALTER TABLE `playeraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot`
--

DROP TABLE IF EXISTS `slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot` (
  `slotType` varchar(255) NOT NULL,
  PRIMARY KEY (`slotType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot`
--

LOCK TABLES `slot` WRITE;
/*!40000 ALTER TABLE `slot` DISABLE KEYS */;
INSERT INTO `slot` VALUES ('body'),('earring'),('feet'),('hands'),('head'),('legs'),('mainhand'),('offhand'),('ring'),('wrist');
/*!40000 ALTER TABLE `slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapon`
--

DROP TABLE IF EXISTS `weapon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapon` (
  `itemID` int NOT NULL,
  `requiredLevel` int NOT NULL,
  `physicalDamage` int NOT NULL,
  `autoAttack` float NOT NULL,
  `delay` float NOT NULL,
  `jobID` int NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `fk_Weapon_jobID` (`jobID`),
  CONSTRAINT `fk_Weapon_itemID` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Weapon_jobID` FOREIGN KEY (`jobID`) REFERENCES `job` (`jobID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon`
--

LOCK TABLES `weapon` WRITE;
/*!40000 ALTER TABLE `weapon` DISABLE KEYS */;
INSERT INTO `weapon` VALUES (1,30,65,10.3,1.89,1),(2,10,70,56.2,1.7,1),(3,40,50,6.5,2.5,3),(4,35,56,23.2,0.1,1),(5,40,68,10.2,3.2,1),(16,30,90,8.9,2.11,2),(17,30,40,4.1,2,5),(18,50,70,7,1.9,9),(19,30,75,7.5,2.2,10),(22,20,30,3.2,1.8,4),(23,40,55,5.7,2.3,6),(24,40,60,6,2,7),(25,40,65,6.5,2.1,8),(26,35,80,8,2.4,11);
/*!40000 ALTER TABLE `weapon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weaponattributerelation`
--

DROP TABLE IF EXISTS `weaponattributerelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weaponattributerelation` (
  `weaponID` int NOT NULL,
  `attributeName` varchar(255) NOT NULL,
  `bonusNumber` int NOT NULL,
  PRIMARY KEY (`weaponID`,`attributeName`),
  KEY `fk_WeaponAttributeRelation_attributeName` (`attributeName`),
  CONSTRAINT `fk_WeaponAttributeRelation_attributeName` FOREIGN KEY (`attributeName`) REFERENCES `attribute` (`attributeName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_WeaponAttributeRelation_weaponID` FOREIGN KEY (`weaponID`) REFERENCES `weapon` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weaponattributerelation`
--

LOCK TABLES `weaponattributerelation` WRITE;
/*!40000 ALTER TABLE `weaponattributerelation` DISABLE KEYS */;
INSERT INTO `weaponattributerelation` VALUES (1,'Determination',40),(1,'DirectHitRate',56),(1,'Strength',50),(1,'Vitality',36),(2,'Determination',70),(2,'DirectHitRate',55),(2,'Strength',40),(2,'Vitality',36),(4,'Determination',40),(4,'DirectHitRate',35),(4,'Strength',45),(4,'Vitality',58),(5,'Strength',35),(5,'Vitality',68),(16,'DirectHitRate',49),(16,'Strength',90),(17,'Strength',80),(18,'CriticalHit',30),(19,'DirectHitRate',20),(22,'MagicDefense',60),(23,'Tenacity',35),(24,'Intelligence',45),(25,'Mind',55),(26,'Piety',25);
/*!40000 ALTER TABLE `weaponattributerelation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-29 16:20:52
