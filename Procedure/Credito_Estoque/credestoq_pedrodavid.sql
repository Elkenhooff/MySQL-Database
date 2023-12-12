-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: credestoq_pedrodavid
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
  `NOME` varchar(100) NOT NULL,
  `ENDERECO` varchar(255) NOT NULL,
  `TELEFONE` varchar(19) DEFAULT NULL,
  `CREDITO` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IDCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Pedras','Rua do seu ninguém, 365 - Jardim Europa','(+55) 17 99283-5223',11151.00),(2,'Luanas','Rua perto do seu ninguém, 684 - Jardim Europa','(+55) 16 99382-8675',5900.00),(3,'Felipinas','Rua longe do seu ninguém, 25 - Jardim São Luiz','(+55) 16 93885-2911',1700.00);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemvenda`
--

DROP TABLE IF EXISTS `itemvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemvenda` (
  `IDITEMVENDA` int(11) NOT NULL AUTO_INCREMENT,
  `QUANTIDADE` int(11) NOT NULL,
  `VALORUNITARIO` decimal(10,2) NOT NULL,
  `IDVENDA` int(11) NOT NULL,
  `IDPRODUTO` int(11) NOT NULL,
  PRIMARY KEY (`IDITEMVENDA`),
  KEY `idproduto_itemvenda` (`IDPRODUTO`),
  KEY `idvenda_itemvenda` (`IDVENDA`),
  CONSTRAINT `idproduto_itemvenda` FOREIGN KEY (`IDPRODUTO`) REFERENCES `clientes` (`IDCLIENTE`),
  CONSTRAINT `idvenda_itemvenda` FOREIGN KEY (`IDVENDA`) REFERENCES `vendas` (`IDVENDA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemvenda`
--

LOCK TABLES `itemvenda` WRITE;
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
INSERT INTO `itemvenda` VALUES (1,3,2300.00,1,2),(2,2,2300.00,1,2),(3,2,2300.00,2,2),(4,1,2300.00,3,2),(5,3,3250.00,1,1);
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensagem` (
  `IDMENSAGEM` int(11) NOT NULL AUTO_INCREMENT,
  `CONTEUDO` varchar(255) NOT NULL,
  PRIMARY KEY (`IDMENSAGEM`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem`
--

LOCK TABLES `mensagem` WRITE;
/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
INSERT INTO `mensagem` VALUES (1,'O cliente não possuí limite'),(2,'Produto fora de estoque'),(3,'Compra realizada');
/*!40000 ALTER TABLE `mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `IDPRODUTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `PRECO` decimal(10,2) NOT NULL,
  `ESTOQUE` int(11) NOT NULL,
  PRIMARY KEY (`IDPRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Computador',3250.00,3),(2,'Geladeira',2300.00,8),(3,'Cama King Sized',3450.00,3),(4,'Maquina de Lavar Roupa',1650.00,10),(5,'Fogão Elétrico',2000.00,17);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `IDVENDA` int(11) NOT NULL AUTO_INCREMENT,
  `DTVENDA` date NOT NULL,
  `IDCLIENTE` int(11) NOT NULL,
  PRIMARY KEY (`IDVENDA`),
  KEY `idcliente_vendas` (`IDCLIENTE`),
  CONSTRAINT `idcliente_vendas` FOREIGN KEY (`IDCLIENTE`) REFERENCES `clientes` (`IDCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,'2023-12-08',1),(2,'2023-12-08',2),(3,'2023-12-08',3);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 18:57:27
