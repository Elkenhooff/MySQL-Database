-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pix_pedrodavid
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `IDCLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `CELULAR` varchar(19) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'\nPedro David','382.254.285-81','(+55) 17 93500-1389'),(2,'\nEdudas','928.352.153-91','(+55) 16 93821-5382'),(3,'\nLuanas','215.256.391-32','(+55) 16 38753-2152');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacorrente`
--

DROP TABLE IF EXISTS `contacorrente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacorrente` (
  `IDCONTACORRENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` varchar(9) NOT NULL,
  `SALDO` decimal(10,2) NOT NULL,
  `IDCLIENTE` int(11) NOT NULL,
  PRIMARY KEY (`IDCONTACORRENTE`),
  KEY `chavecontacorrente` (`IDCLIENTE`),
  CONSTRAINT `chavecontacorrente` FOREIGN KEY (`IDCLIENTE`) REFERENCES `clientes` (`IDCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacorrente`
--

LOCK TABLES `contacorrente` WRITE;
/*!40000 ALTER TABLE `contacorrente` DISABLE KEYS */;
INSERT INTO `contacorrente` VALUES (1,'48520-25',10253.00,1),(2,'59325-25',25000.00,2),(3,'39520-35',25536.00,3);
/*!40000 ALTER TABLE `contacorrente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensagem` (
  `IDMENSAGEM` int(11) NOT NULL AUTO_INCREMENT,
  `CONTEUDO` varchar(100) NOT NULL,
  PRIMARY KEY (`IDMENSAGEM`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem`
--

LOCK TABLES `mensagem` WRITE;
/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
INSERT INTO `mensagem` VALUES (1,'Transferência realizada com sucesso'),(2,'A conta credita e a conta debitada não podem ser as mesmas'),(3,'A conta debitada deve ter saldo suficiente para transferência');
/*!40000 ALTER TABLE `mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pix`
--

DROP TABLE IF EXISTS `pix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pix` (
  `IDPIX` int(11) NOT NULL AUTO_INCREMENT,
  `DTHORA` datetime NOT NULL,
  `IDCCCREDITO` int(11) NOT NULL,
  `IDCCDEBITO` int(11) NOT NULL,
  `VALOR` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IDPIX`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pix`
--

LOCK TABLES `pix` WRITE;
/*!40000 ALTER TABLE `pix` DISABLE KEYS */;
INSERT INTO `pix` VALUES (1,'2023-12-08 11:52:00',3,1,50.00),(2,'2023-12-08 11:52:33',1,3,50.00),(3,'2023-12-08 11:54:30',3,1,25000.00);
/*!40000 ALTER TABLE `pix` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 11:55:16
