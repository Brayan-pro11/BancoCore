CREATE DATABASE  IF NOT EXISTS `bancocore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bancocore`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: bancocore
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `cliente_empresa`
--

DROP TABLE IF EXISTS `cliente_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_empresa` (
  `NIT` varchar(20) NOT NULL,
  `Razon_Social` varchar(150) NOT NULL,
  `Correo_Electronico` varchar(150) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Representante_Legal` varchar(20) NOT NULL,
  `Estado_Cliente` varchar(30) DEFAULT 'Activo',
  PRIMARY KEY (`NIT`),
  KEY `FK_Representante` (`Representante_Legal`),
  CONSTRAINT `FK_Representante` FOREIGN KEY (`Representante_Legal`) REFERENCES `cliente_persona_natural` (`ID_Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_empresa`
--

LOCK TABLES `cliente_empresa` WRITE;
/*!40000 ALTER TABLE `cliente_empresa` DISABLE KEYS */;
INSERT INTO `cliente_empresa` VALUES ('900000001','Empresa 1 SAS','empresa1@empresa.com','6040000001','Colombia','100001','Activo'),('900000002','Empresa 2 SAS','empresa2@empresa.com','6040000002','Colombia','100002','Activo'),('900000003','Empresa 3 SAS','empresa3@empresa.com','6040000003','Colombia','100003','Activo'),('900000004','Empresa 4 SAS','empresa4@empresa.com','6040000004','Colombia','100004','Activo'),('900000005','Empresa 5 SAS','empresa5@empresa.com','6040000005','Colombia','100005','Activo'),('900000006','Empresa 6 SAS','empresa6@empresa.com','6040000006','Colombia','100006','Activo'),('900000007','Empresa 7 SAS','empresa7@empresa.com','6040000007','Colombia','100007','Activo'),('900000008','Empresa 8 SAS','empresa8@empresa.com','6040000008','Colombia','100008','Activo'),('900000009','Empresa 9 SAS','empresa9@empresa.com','6040000009','Colombia','100009','Activo'),('900000010','Empresa 10 SAS','empresa10@empresa.com','6040000010','Colombia','100010','Activo'),('900000011','Empresa 11 SAS','empresa11@empresa.com','6040000011','Colombia','100011','Activo'),('900000012','Empresa 12 SAS','empresa12@empresa.com','6040000012','Colombia','100012','Activo'),('900000013','Empresa 13 SAS','empresa13@empresa.com','6040000013','Colombia','100013','Activo'),('900000014','Empresa 14 SAS','empresa14@empresa.com','6040000014','Colombia','100014','Activo'),('900000015','Empresa 15 SAS','empresa15@empresa.com','6040000015','Colombia','100015','Activo'),('900000016','Empresa 16 SAS','empresa16@empresa.com','6040000016','Colombia','100016','Activo'),('900000017','Empresa 17 SAS','empresa17@empresa.com','6040000017','Colombia','100017','Activo'),('900000018','Empresa 18 SAS','empresa18@empresa.com','6040000018','Colombia','100018','Activo'),('900000019','Empresa 19 SAS','empresa19@empresa.com','6040000019','Colombia','100019','Activo'),('900000020','Empresa 20 SAS','empresa20@empresa.com','6040000020','Colombia','100020','Activo');
/*!40000 ALTER TABLE `cliente_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_persona_natural`
--

DROP TABLE IF EXISTS `cliente_persona_natural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_persona_natural` (
  `ID_Identificacion` varchar(20) NOT NULL,
  `Nombre_Completo` varchar(150) NOT NULL,
  `Correo_Electronico` varchar(150) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Estado_Cliente` varchar(30) DEFAULT 'Activo',
  PRIMARY KEY (`ID_Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_persona_natural`
--

LOCK TABLES `cliente_persona_natural` WRITE;
/*!40000 ALTER TABLE `cliente_persona_natural` DISABLE KEYS */;
INSERT INTO `cliente_persona_natural` VALUES ('100001','Cliente 1','cliente1@gmail.com','3000000001','1985-01-02','Colombia','Activo'),('100002','Cliente 2','cliente2@gmail.com','3000000002','1985-01-03','Colombia','Activo'),('100003','Cliente 3','cliente3@gmail.com','3000000003','1985-01-04','Colombia','Activo'),('100004','Cliente 4','cliente4@gmail.com','3000000004','1985-01-05','Colombia','Activo'),('100005','Cliente 5','cliente5@gmail.com','3000000005','1985-01-06','Colombia','Activo'),('100006','Cliente 6','cliente6@gmail.com','3000000006','1985-01-07','Colombia','Activo'),('100007','Cliente 7','cliente7@gmail.com','3000000007','1985-01-08','Colombia','Activo'),('100008','Cliente 8','cliente8@gmail.com','3000000008','1985-01-09','Colombia','Activo'),('100009','Cliente 9','cliente9@gmail.com','3000000009','1985-01-10','Colombia','Activo'),('100010','Cliente 10','cliente10@gmail.com','3000000010','1985-01-11','Colombia','Activo'),('100011','Cliente 11','cliente11@gmail.com','3000000011','1985-01-12','Colombia','Activo'),('100012','Cliente 12','cliente12@gmail.com','3000000012','1985-01-13','Colombia','Activo'),('100013','Cliente 13','cliente13@gmail.com','3000000013','1985-01-14','Colombia','Activo'),('100014','Cliente 14','cliente14@gmail.com','3000000014','1985-01-15','Colombia','Activo'),('100015','Cliente 15','cliente15@gmail.com','3000000015','1985-01-16','Colombia','Activo'),('100016','Cliente 16','cliente16@gmail.com','3000000016','1985-01-17','Colombia','Activo'),('100017','Cliente 17','cliente17@gmail.com','3000000017','1985-01-18','Colombia','Activo'),('100018','Cliente 18','cliente18@gmail.com','3000000018','1985-01-19','Colombia','Activo'),('100019','Cliente 19','cliente19@gmail.com','3000000019','1985-01-20','Colombia','Activo'),('100020','Cliente 20','cliente20@gmail.com','3000000020','1985-01-21','Colombia','Activo'),('100021','Cliente 21','cliente21@gmail.com','3000000021','1985-01-22','Colombia','Activo'),('100022','Cliente 22','cliente22@gmail.com','3000000022','1985-01-23','Colombia','Activo'),('100023','Cliente 23','cliente23@gmail.com','3000000023','1985-01-24','Colombia','Activo'),('100024','Cliente 24','cliente24@gmail.com','3000000024','1985-01-25','Colombia','Activo'),('100025','Cliente 25','cliente25@gmail.com','3000000025','1985-01-26','Colombia','Activo'),('100026','Cliente 26','cliente26@gmail.com','3000000026','1985-01-27','Colombia','Activo'),('100027','Cliente 27','cliente27@gmail.com','3000000027','1985-01-28','Colombia','Activo'),('100028','Cliente 28','cliente28@gmail.com','3000000028','1985-01-29','Colombia','Activo'),('100029','Cliente 29','cliente29@gmail.com','3000000029','1985-01-30','Colombia','Activo'),('100030','Cliente 30','cliente30@gmail.com','3000000030','1985-01-31','Colombia','Activo'),('100031','Cliente 31','cliente31@gmail.com','3000000031','1985-02-01','Colombia','Activo'),('100032','Cliente 32','cliente32@gmail.com','3000000032','1985-02-02','Colombia','Activo'),('100033','Cliente 33','cliente33@gmail.com','3000000033','1985-02-03','Colombia','Activo'),('100034','Cliente 34','cliente34@gmail.com','3000000034','1985-02-04','Colombia','Activo'),('100035','Cliente 35','cliente35@gmail.com','3000000035','1985-02-05','Colombia','Activo'),('100036','Cliente 36','cliente36@gmail.com','3000000036','1985-02-06','Colombia','Activo'),('100037','Cliente 37','cliente37@gmail.com','3000000037','1985-02-07','Colombia','Activo'),('100038','Cliente 38','cliente38@gmail.com','3000000038','1985-02-08','Colombia','Activo'),('100039','Cliente 39','cliente39@gmail.com','3000000039','1985-02-09','Colombia','Activo'),('100040','Cliente 40','cliente40@gmail.com','3000000040','1985-02-10','Colombia','Activo'),('100041','Cliente 41','cliente41@gmail.com','3000000041','1985-02-11','Colombia','Activo'),('100042','Cliente 42','cliente42@gmail.com','3000000042','1985-02-12','Colombia','Activo'),('100043','Cliente 43','cliente43@gmail.com','3000000043','1985-02-13','Colombia','Activo'),('100044','Cliente 44','cliente44@gmail.com','3000000044','1985-02-14','Colombia','Activo'),('100045','Cliente 45','cliente45@gmail.com','3000000045','1985-02-15','Colombia','Activo'),('100046','Cliente 46','cliente46@gmail.com','3000000046','1985-02-16','Colombia','Activo'),('100047','Cliente 47','cliente47@gmail.com','3000000047','1985-02-17','Colombia','Activo'),('100048','Cliente 48','cliente48@gmail.com','3000000048','1985-02-18','Colombia','Activo'),('100049','Cliente 49','cliente49@gmail.com','3000000049','1985-02-19','Colombia','Activo'),('100050','Cliente 50','cliente50@gmail.com','3000000050','1985-02-20','Colombia','Activo'),('100051','Cliente 51','cliente51@gmail.com','3000000051','1985-02-21','Colombia','Activo'),('100052','Cliente 52','cliente52@gmail.com','3000000052','1985-02-22','Colombia','Activo'),('100053','Cliente 53','cliente53@gmail.com','3000000053','1985-02-23','Colombia','Activo'),('100054','Cliente 54','cliente54@gmail.com','3000000054','1985-02-24','Colombia','Activo'),('100055','Cliente 55','cliente55@gmail.com','3000000055','1985-02-25','Colombia','Activo'),('100056','Cliente 56','cliente56@gmail.com','3000000056','1985-02-26','Colombia','Activo'),('100057','Cliente 57','cliente57@gmail.com','3000000057','1985-02-27','Colombia','Activo'),('100058','Cliente 58','cliente58@gmail.com','3000000058','1985-02-28','Colombia','Activo'),('100059','Cliente 59','cliente59@gmail.com','3000000059','1985-03-01','Colombia','Activo'),('100060','Cliente 60','cliente60@gmail.com','3000000060','1985-03-02','Colombia','Activo'),('100061','Cliente 61','cliente61@gmail.com','3000000061','1985-03-03','Colombia','Activo'),('100062','Cliente 62','cliente62@gmail.com','3000000062','1985-03-04','Colombia','Activo'),('100063','Cliente 63','cliente63@gmail.com','3000000063','1985-03-05','Colombia','Activo'),('100064','Cliente 64','cliente64@gmail.com','3000000064','1985-03-06','Colombia','Activo'),('100065','Cliente 65','cliente65@gmail.com','3000000065','1985-03-07','Colombia','Activo'),('100066','Cliente 66','cliente66@gmail.com','3000000066','1985-03-08','Colombia','Activo'),('100067','Cliente 67','cliente67@gmail.com','3000000067','1985-03-09','Colombia','Activo'),('100068','Cliente 68','cliente68@gmail.com','3000000068','1985-03-10','Colombia','Activo'),('100069','Cliente 69','cliente69@gmail.com','3000000069','1985-03-11','Colombia','Activo'),('100070','Cliente 70','cliente70@gmail.com','3000000070','1985-03-12','Colombia','Activo'),('100071','Cliente 71','cliente71@gmail.com','3000000071','1985-03-13','Colombia','Activo'),('100072','Cliente 72','cliente72@gmail.com','3000000072','1985-03-14','Colombia','Activo'),('100073','Cliente 73','cliente73@gmail.com','3000000073','1985-03-15','Colombia','Activo'),('100074','Cliente 74','cliente74@gmail.com','3000000074','1985-03-16','Colombia','Activo'),('100075','Cliente 75','cliente75@gmail.com','3000000075','1985-03-17','Colombia','Activo'),('100076','Cliente 76','cliente76@gmail.com','3000000076','1985-03-18','Colombia','Activo'),('100077','Cliente 77','cliente77@gmail.com','3000000077','1985-03-19','Colombia','Activo'),('100078','Cliente 78','cliente78@gmail.com','3000000078','1985-03-20','Colombia','Activo'),('100079','Cliente 79','cliente79@gmail.com','3000000079','1985-03-21','Colombia','Activo'),('100080','Cliente 80','cliente80@gmail.com','3000000080','1985-03-22','Colombia','Activo'),('100081','Cliente 81','cliente81@gmail.com','3000000081','1985-03-23','Colombia','Activo'),('100082','Cliente 82','cliente82@gmail.com','3000000082','1985-03-24','Colombia','Activo'),('100083','Cliente 83','cliente83@gmail.com','3000000083','1985-03-25','Colombia','Activo'),('100084','Cliente 84','cliente84@gmail.com','3000000084','1985-03-26','Colombia','Activo'),('100085','Cliente 85','cliente85@gmail.com','3000000085','1985-03-27','Colombia','Activo'),('100086','Cliente 86','cliente86@gmail.com','3000000086','1985-03-28','Colombia','Activo'),('100087','Cliente 87','cliente87@gmail.com','3000000087','1985-03-29','Colombia','Activo'),('100088','Cliente 88','cliente88@gmail.com','3000000088','1985-03-30','Colombia','Activo'),('100089','Cliente 89','cliente89@gmail.com','3000000089','1985-03-31','Colombia','Activo'),('100090','Cliente 90','cliente90@gmail.com','3000000090','1985-04-01','Colombia','Activo'),('100091','Cliente 91','cliente91@gmail.com','3000000091','1985-04-02','Colombia','Activo'),('100092','Cliente 92','cliente92@gmail.com','3000000092','1985-04-03','Colombia','Activo'),('100093','Cliente 93','cliente93@gmail.com','3000000093','1985-04-04','Colombia','Activo'),('100094','Cliente 94','cliente94@gmail.com','3000000094','1985-04-05','Colombia','Activo'),('100095','Cliente 95','cliente95@gmail.com','3000000095','1985-04-06','Colombia','Activo'),('100096','Cliente 96','cliente96@gmail.com','3000000096','1985-04-07','Colombia','Activo'),('100097','Cliente 97','cliente97@gmail.com','3000000097','1985-04-08','Colombia','Activo'),('100098','Cliente 98','cliente98@gmail.com','3000000098','1985-04-09','Colombia','Activo'),('100099','Cliente 99','cliente99@gmail.com','3000000099','1985-04-10','Colombia','Activo'),('100100','Cliente 100','cliente100@gmail.com','3000000100','1985-04-11','Colombia','Activo');
/*!40000 ALTER TABLE `cliente_persona_natural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_bancaria`
--

DROP TABLE IF EXISTS `cuenta_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta_bancaria` (
  `Numero_Cuenta` varchar(30) NOT NULL,
  `Tipo_Cuenta` varchar(50) NOT NULL,
  `ID_Titular` varchar(20) NOT NULL,
  `Saldo_Actual` decimal(18,2) DEFAULT '0.00',
  `Moneda` varchar(10) NOT NULL,
  `Estado_Cuenta` varchar(30) DEFAULT 'Activa',
  `Fecha_Apertura` date NOT NULL,
  PRIMARY KEY (`Numero_Cuenta`),
  KEY `FK_Titular_Persona` (`ID_Titular`),
  CONSTRAINT `FK_Titular_Persona` FOREIGN KEY (`ID_Titular`) REFERENCES `cliente_persona_natural` (`ID_Identificacion`),
  CONSTRAINT `cuenta_bancaria_chk_1` CHECK ((`Saldo_Actual` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_bancaria`
--

LOCK TABLES `cuenta_bancaria` WRITE;
/*!40000 ALTER TABLE `cuenta_bancaria` DISABLE KEYS */;
INSERT INTO `cuenta_bancaria` VALUES ('CTA100001','Ahorros','100001',8096777.53,'COP','Activa','2024-01-01'),('CTA100002','Ahorros','100002',5693113.62,'COP','Activa','2024-01-01'),('CTA100003','Ahorros','100003',4175235.82,'COP','Activa','2024-01-01'),('CTA100004','Ahorros','100004',3796838.53,'COP','Activa','2024-01-01'),('CTA100005','Ahorros','100005',6458485.52,'COP','Activa','2024-01-01'),('CTA100006','Ahorros','100006',901912.32,'COP','Activa','2024-01-01'),('CTA100007','Ahorros','100007',5134105.34,'COP','Activa','2024-01-01'),('CTA100008','Ahorros','100008',2964790.06,'COP','Activa','2024-01-01'),('CTA100009','Ahorros','100009',9421634.56,'COP','Activa','2024-01-01'),('CTA100010','Ahorros','100010',8213802.95,'COP','Activa','2024-01-01'),('CTA100011','Ahorros','100011',2804111.36,'COP','Activa','2024-01-01'),('CTA100012','Ahorros','100012',9379148.25,'COP','Activa','2024-01-01'),('CTA100013','Ahorros','100013',8483407.49,'COP','Activa','2024-01-01'),('CTA100014','Ahorros','100014',4279592.99,'COP','Activa','2024-01-01'),('CTA100015','Ahorros','100015',5947742.80,'COP','Activa','2024-01-01'),('CTA100016','Ahorros','100016',6899935.35,'COP','Activa','2024-01-01'),('CTA100017','Ahorros','100017',6656448.64,'COP','Activa','2024-01-01'),('CTA100018','Ahorros','100018',2582437.47,'COP','Activa','2024-01-01'),('CTA100019','Ahorros','100019',2942841.74,'COP','Activa','2024-01-01'),('CTA100020','Ahorros','100020',6966896.61,'COP','Activa','2024-01-01'),('CTA100021','Ahorros','100021',6005958.14,'COP','Activa','2024-01-01'),('CTA100022','Ahorros','100022',9129101.16,'COP','Activa','2024-01-01'),('CTA100023','Ahorros','100023',7627631.68,'COP','Activa','2024-01-01'),('CTA100024','Ahorros','100024',750855.25,'COP','Activa','2024-01-01'),('CTA100025','Ahorros','100025',871381.53,'COP','Activa','2024-01-01'),('CTA100026','Ahorros','100026',2104342.18,'COP','Activa','2024-01-01'),('CTA100027','Ahorros','100027',7907566.63,'COP','Activa','2024-01-01'),('CTA100028','Ahorros','100028',3224806.92,'COP','Activa','2024-01-01'),('CTA100029','Ahorros','100029',2401335.01,'COP','Activa','2024-01-01'),('CTA100030','Ahorros','100030',2332254.59,'COP','Activa','2024-01-01'),('CTA100031','Ahorros','100031',4457268.25,'COP','Activa','2024-01-01'),('CTA100032','Ahorros','100032',5289577.79,'COP','Activa','2024-01-01'),('CTA100033','Ahorros','100033',3076084.50,'COP','Activa','2024-01-01'),('CTA100034','Ahorros','100034',9511689.44,'COP','Activa','2024-01-01'),('CTA100035','Ahorros','100035',8330194.01,'COP','Activa','2024-01-01'),('CTA100036','Ahorros','100036',3115902.02,'COP','Activa','2024-01-01'),('CTA100037','Ahorros','100037',588928.41,'COP','Activa','2024-01-01'),('CTA100038','Ahorros','100038',3596936.26,'COP','Activa','2024-01-01'),('CTA100039','Ahorros','100039',6217896.40,'COP','Activa','2024-01-01'),('CTA100040','Ahorros','100040',298673.54,'COP','Activa','2024-01-01'),('CTA100041','Ahorros','100041',2839678.79,'COP','Activa','2024-01-01'),('CTA100042','Ahorros','100042',3302373.64,'COP','Activa','2024-01-01'),('CTA100043','Ahorros','100043',7992832.13,'COP','Activa','2024-01-01'),('CTA100044','Ahorros','100044',57040.03,'COP','Activa','2024-01-01'),('CTA100045','Ahorros','100045',6306704.09,'COP','Activa','2024-01-01'),('CTA100046','Ahorros','100046',1362400.67,'COP','Activa','2024-01-01'),('CTA100047','Ahorros','100047',7891891.38,'COP','Activa','2024-01-01'),('CTA100048','Ahorros','100048',5372255.21,'COP','Activa','2024-01-01'),('CTA100049','Ahorros','100049',3185602.20,'COP','Activa','2024-01-01'),('CTA100050','Ahorros','100050',9811245.67,'COP','Activa','2024-01-01'),('CTA100051','Ahorros','100051',9499422.06,'COP','Activa','2024-01-01'),('CTA100052','Ahorros','100052',8063373.60,'COP','Activa','2024-01-01'),('CTA100053','Ahorros','100053',1818602.13,'COP','Activa','2024-01-01'),('CTA100054','Ahorros','100054',4902890.17,'COP','Activa','2024-01-01'),('CTA100055','Ahorros','100055',9058644.76,'COP','Activa','2024-01-01'),('CTA100056','Ahorros','100056',584553.60,'COP','Activa','2024-01-01'),('CTA100057','Ahorros','100057',5746834.03,'COP','Activa','2024-01-01'),('CTA100058','Ahorros','100058',6980509.66,'COP','Activa','2024-01-01'),('CTA100059','Ahorros','100059',7662046.52,'COP','Activa','2024-01-01'),('CTA100060','Ahorros','100060',7368703.93,'COP','Activa','2024-01-01'),('CTA100061','Ahorros','100061',3857380.39,'COP','Activa','2024-01-01'),('CTA100062','Ahorros','100062',7180790.46,'COP','Activa','2024-01-01'),('CTA100063','Ahorros','100063',4331811.45,'COP','Activa','2024-01-01'),('CTA100064','Ahorros','100064',116686.16,'COP','Activa','2024-01-01'),('CTA100065','Ahorros','100065',7587996.77,'COP','Activa','2024-01-01'),('CTA100066','Ahorros','100066',7589925.66,'COP','Activa','2024-01-01'),('CTA100067','Ahorros','100067',5185638.29,'COP','Activa','2024-01-01'),('CTA100068','Ahorros','100068',3158414.79,'COP','Activa','2024-01-01'),('CTA100069','Ahorros','100069',235159.37,'COP','Activa','2024-01-01'),('CTA100070','Ahorros','100070',1700552.80,'COP','Activa','2024-01-01'),('CTA100071','Ahorros','100071',7797286.18,'COP','Activa','2024-01-01'),('CTA100072','Ahorros','100072',3884772.83,'COP','Activa','2024-01-01'),('CTA100073','Ahorros','100073',6032005.91,'COP','Activa','2024-01-01'),('CTA100074','Ahorros','100074',8505711.36,'COP','Activa','2024-01-01'),('CTA100075','Ahorros','100075',4432539.38,'COP','Activa','2024-01-01'),('CTA100076','Ahorros','100076',6645563.11,'COP','Activa','2024-01-01'),('CTA100077','Ahorros','100077',9930197.74,'COP','Activa','2024-01-01'),('CTA100078','Ahorros','100078',9714299.65,'COP','Activa','2024-01-01'),('CTA100079','Ahorros','100079',8780905.37,'COP','Activa','2024-01-01'),('CTA100080','Ahorros','100080',4761628.20,'COP','Activa','2024-01-01'),('CTA100081','Ahorros','100081',7465425.18,'COP','Activa','2024-01-01'),('CTA100082','Ahorros','100082',3042241.61,'COP','Activa','2024-01-01'),('CTA100083','Ahorros','100083',2814932.81,'COP','Activa','2024-01-01'),('CTA100084','Ahorros','100084',4947939.55,'COP','Activa','2024-01-01'),('CTA100085','Ahorros','100085',6294899.61,'COP','Activa','2024-01-01'),('CTA100086','Ahorros','100086',6630679.70,'COP','Activa','2024-01-01'),('CTA100087','Ahorros','100087',4268699.99,'COP','Activa','2024-01-01'),('CTA100088','Ahorros','100088',1451461.16,'COP','Activa','2024-01-01'),('CTA100089','Ahorros','100089',4451206.13,'COP','Activa','2024-01-01'),('CTA100090','Ahorros','100090',7901647.46,'COP','Activa','2024-01-01'),('CTA100091','Ahorros','100091',6154619.24,'COP','Activa','2024-01-01'),('CTA100092','Ahorros','100092',7068154.11,'COP','Activa','2024-01-01'),('CTA100093','Ahorros','100093',6876913.15,'COP','Activa','2024-01-01'),('CTA100094','Ahorros','100094',3180103.71,'COP','Activa','2024-01-01'),('CTA100095','Ahorros','100095',5269779.44,'COP','Activa','2024-01-01'),('CTA100096','Ahorros','100096',6808586.35,'COP','Activa','2024-01-01'),('CTA100097','Ahorros','100097',8233593.75,'COP','Activa','2024-01-01'),('CTA100098','Ahorros','100098',742209.99,'COP','Activa','2024-01-01'),('CTA100099','Ahorros','100099',9010269.03,'COP','Activa','2024-01-01'),('CTA100100','Ahorros','100100',2824715.46,'COP','Activa','2024-01-01');
/*!40000 ALTER TABLE `cuenta_bancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `ID_Prestamo` int NOT NULL AUTO_INCREMENT,
  `Tipo_Prestamo` varchar(50) NOT NULL,
  `ID_Cliente_Solicitante` varchar(20) NOT NULL,
  `Monto_Solicitado` decimal(18,2) NOT NULL,
  `Monto_Aprobado` decimal(18,2) DEFAULT NULL,
  `Tasa_Interes` decimal(5,2) DEFAULT NULL,
  `Plazo_Meses` int DEFAULT NULL,
  `Estado_Prestamo` varchar(30) DEFAULT 'En estudio',
  `Fecha_Aprobacion` date DEFAULT NULL,
  `Fecha_Desembolso` date DEFAULT NULL,
  `Cuenta_Destino_Desembolso` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Prestamo`),
  KEY `FK_Cliente_Prestamo` (`ID_Cliente_Solicitante`),
  KEY `FK_Cuenta_Desembolso` (`Cuenta_Destino_Desembolso`),
  CONSTRAINT `FK_Cliente_Prestamo` FOREIGN KEY (`ID_Cliente_Solicitante`) REFERENCES `cliente_persona_natural` (`ID_Identificacion`),
  CONSTRAINT `FK_Cuenta_Desembolso` FOREIGN KEY (`Cuenta_Destino_Desembolso`) REFERENCES `cuenta_bancaria` (`Numero_Cuenta`),
  CONSTRAINT `prestamo_chk_1` CHECK ((`Monto_Solicitado` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,'Personal','100001',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100001'),(2,'Personal','100002',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100002'),(3,'Personal','100003',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100003'),(4,'Personal','100004',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100004'),(5,'Personal','100005',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100005'),(6,'Personal','100006',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100006'),(7,'Personal','100007',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100007'),(8,'Personal','100008',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100008'),(9,'Personal','100009',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100009'),(10,'Personal','100010',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100010'),(11,'Personal','100011',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100011'),(12,'Personal','100012',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100012'),(13,'Personal','100013',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100013'),(14,'Personal','100014',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100014'),(15,'Personal','100015',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100015'),(16,'Personal','100016',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100016'),(17,'Personal','100017',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100017'),(18,'Personal','100018',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100018'),(19,'Personal','100019',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100019'),(20,'Personal','100020',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100020'),(21,'Personal','100021',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100021'),(22,'Personal','100022',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100022'),(23,'Personal','100023',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100023'),(24,'Personal','100024',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100024'),(25,'Personal','100025',5000000.00,4500000.00,12.50,24,'Aprobado','2024-02-01','2024-02-05','CTA100025');
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_bancario`
--

DROP TABLE IF EXISTS `producto_bancario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_bancario` (
  `Codigo_Producto` varchar(20) NOT NULL,
  `Nombre_Producto` varchar(100) NOT NULL,
  `Categoria` varchar(50) NOT NULL,
  `Requiere_Aprobacion` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Codigo_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_bancario`
--

LOCK TABLES `producto_bancario` WRITE;
/*!40000 ALTER TABLE `producto_bancario` DISABLE KEYS */;
INSERT INTO `producto_bancario` VALUES ('AHO001','Cuenta Ahorros Básica','Cuenta',0),('COR001','Cuenta Corriente Empresarial','Cuenta',0),('CRE001','Crédito Personal','Crédito',1),('CRE002','Crédito Hipotecario','Crédito',1),('CRE003','Crédito Vehicular','Crédito',1),('INV001','Fondo de Inversión','Inversión',0),('PYM001','Crédito Pyme','Crédito',1),('SEG001','Seguro de Vida','Seguro',0),('SEG002','Seguro Vehicular','Seguro',0),('TAR001','Tarjeta de Crédito Clásica','Tarjeta',1);
/*!40000 ALTER TABLE `producto_bancario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencia`
--

DROP TABLE IF EXISTS `transferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferencia` (
  `ID_Transferencia` int NOT NULL AUTO_INCREMENT,
  `Cuenta_Origen` varchar(30) NOT NULL,
  `Cuenta_Destino` varchar(30) NOT NULL,
  `Monto` decimal(18,2) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Aprobacion` timestamp NULL DEFAULT NULL,
  `Estado_Transferencia` varchar(30) NOT NULL,
  `ID_Usuario_Creador` int NOT NULL,
  `ID_Usuario_Aprobador` int DEFAULT NULL,
  PRIMARY KEY (`ID_Transferencia`),
  KEY `FK_Cuenta_Origen` (`Cuenta_Origen`),
  KEY `FK_Cuenta_Destino` (`Cuenta_Destino`),
  KEY `FK_Usuario_Creador` (`ID_Usuario_Creador`),
  KEY `FK_Usuario_Aprobador` (`ID_Usuario_Aprobador`),
  CONSTRAINT `FK_Cuenta_Destino` FOREIGN KEY (`Cuenta_Destino`) REFERENCES `cuenta_bancaria` (`Numero_Cuenta`),
  CONSTRAINT `FK_Cuenta_Origen` FOREIGN KEY (`Cuenta_Origen`) REFERENCES `cuenta_bancaria` (`Numero_Cuenta`),
  CONSTRAINT `FK_Usuario_Aprobador` FOREIGN KEY (`ID_Usuario_Aprobador`) REFERENCES `usuarios` (`ID_Usuario`),
  CONSTRAINT `FK_Usuario_Creador` FOREIGN KEY (`ID_Usuario_Creador`) REFERENCES `usuarios` (`ID_Usuario`),
  CONSTRAINT `transferencia_chk_1` CHECK ((`Monto` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencia`
--

LOCK TABLES `transferencia` WRITE;
/*!40000 ALTER TABLE `transferencia` DISABLE KEYS */;
INSERT INTO `transferencia` VALUES (1,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',24,25),(2,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',23,25),(3,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',22,25),(4,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',21,25),(5,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',20,25),(6,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',19,25),(7,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',18,25),(8,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',17,25),(9,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',16,25),(10,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',15,25),(11,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',14,25),(12,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',13,25),(13,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',12,25),(14,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',11,25),(15,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',10,25),(16,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',9,25),(17,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',8,25),(18,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',7,25),(19,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',6,25),(20,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',5,25),(21,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',4,25),(22,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',3,25),(23,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',2,25),(24,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',1,25),(25,'CTA100006','CTA100001',150000.00,'2026-03-01 15:44:00',NULL,'Ejecutada',50,26);
/*!40000 ALTER TABLE `transferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `ID_Relacionado` varchar(20) DEFAULT NULL,
  `Nombre_Completo` varchar(150) NOT NULL,
  `ID_Identificacion` varchar(20) NOT NULL,
  `Correo_Electronico` varchar(150) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Rol_Sistema` varchar(50) NOT NULL,
  `Estado_Usuario` varchar(30) DEFAULT 'Activo',
  `Fecha_Creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `ID_Identificacion` (`ID_Identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'100001','Usuario 100001','U100001','usuario100001@banco.com','3000000001','1985-01-02','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(2,'100002','Usuario 100002','U100002','usuario100002@banco.com','3000000002','1985-01-03','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(3,'100003','Usuario 100003','U100003','usuario100003@banco.com','3000000003','1985-01-04','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(4,'100004','Usuario 100004','U100004','usuario100004@banco.com','3000000004','1985-01-05','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(5,'100005','Usuario 100005','U100005','usuario100005@banco.com','3000000005','1985-01-06','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(6,'100006','Usuario 100006','U100006','usuario100006@banco.com','3000000006','1985-01-07','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(7,'100007','Usuario 100007','U100007','usuario100007@banco.com','3000000007','1985-01-08','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(8,'100008','Usuario 100008','U100008','usuario100008@banco.com','3000000008','1985-01-09','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(9,'100009','Usuario 100009','U100009','usuario100009@banco.com','3000000009','1985-01-10','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(10,'100010','Usuario 100010','U100010','usuario100010@banco.com','3000000010','1985-01-11','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(11,'100011','Usuario 100011','U100011','usuario100011@banco.com','3000000011','1985-01-12','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(12,'100012','Usuario 100012','U100012','usuario100012@banco.com','3000000012','1985-01-13','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(13,'100013','Usuario 100013','U100013','usuario100013@banco.com','3000000013','1985-01-14','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(14,'100014','Usuario 100014','U100014','usuario100014@banco.com','3000000014','1985-01-15','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(15,'100015','Usuario 100015','U100015','usuario100015@banco.com','3000000015','1985-01-16','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(16,'100016','Usuario 100016','U100016','usuario100016@banco.com','3000000016','1985-01-17','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(17,'100017','Usuario 100017','U100017','usuario100017@banco.com','3000000017','1985-01-18','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(18,'100018','Usuario 100018','U100018','usuario100018@banco.com','3000000018','1985-01-19','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(19,'100019','Usuario 100019','U100019','usuario100019@banco.com','3000000019','1985-01-20','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(20,'100020','Usuario 100020','U100020','usuario100020@banco.com','3000000020','1985-01-21','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(21,'100021','Usuario 100021','U100021','usuario100021@banco.com','3000000021','1985-01-22','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(22,'100022','Usuario 100022','U100022','usuario100022@banco.com','3000000022','1985-01-23','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(23,'100023','Usuario 100023','U100023','usuario100023@banco.com','3000000023','1985-01-24','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(24,'100024','Usuario 100024','U100024','usuario100024@banco.com','3000000024','1985-01-25','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(25,'100025','Usuario 100025','U100025','usuario100025@banco.com','3000000025','1985-01-26','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(26,'100026','Usuario 100026','U100026','usuario100026@banco.com','3000000026','1985-01-27','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(27,'100027','Usuario 100027','U100027','usuario100027@banco.com','3000000027','1985-01-28','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(28,'100028','Usuario 100028','U100028','usuario100028@banco.com','3000000028','1985-01-29','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(29,'100029','Usuario 100029','U100029','usuario100029@banco.com','3000000029','1985-01-30','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(30,'100030','Usuario 100030','U100030','usuario100030@banco.com','3000000030','1985-01-31','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(31,'100031','Usuario 100031','U100031','usuario100031@banco.com','3000000031','1985-02-01','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(32,'100032','Usuario 100032','U100032','usuario100032@banco.com','3000000032','1985-02-02','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(33,'100033','Usuario 100033','U100033','usuario100033@banco.com','3000000033','1985-02-03','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(34,'100034','Usuario 100034','U100034','usuario100034@banco.com','3000000034','1985-02-04','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(35,'100035','Usuario 100035','U100035','usuario100035@banco.com','3000000035','1985-02-05','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(36,'100036','Usuario 100036','U100036','usuario100036@banco.com','3000000036','1985-02-06','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(37,'100037','Usuario 100037','U100037','usuario100037@banco.com','3000000037','1985-02-07','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(38,'100038','Usuario 100038','U100038','usuario100038@banco.com','3000000038','1985-02-08','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(39,'100039','Usuario 100039','U100039','usuario100039@banco.com','3000000039','1985-02-09','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(40,'100040','Usuario 100040','U100040','usuario100040@banco.com','3000000040','1985-02-10','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(41,'100041','Usuario 100041','U100041','usuario100041@banco.com','3000000041','1985-02-11','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(42,'100042','Usuario 100042','U100042','usuario100042@banco.com','3000000042','1985-02-12','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(43,'100043','Usuario 100043','U100043','usuario100043@banco.com','3000000043','1985-02-13','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(44,'100044','Usuario 100044','U100044','usuario100044@banco.com','3000000044','1985-02-14','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(45,'100045','Usuario 100045','U100045','usuario100045@banco.com','3000000045','1985-02-15','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(46,'100046','Usuario 100046','U100046','usuario100046@banco.com','3000000046','1985-02-16','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(47,'100047','Usuario 100047','U100047','usuario100047@banco.com','3000000047','1985-02-17','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(48,'100048','Usuario 100048','U100048','usuario100048@banco.com','3000000048','1985-02-18','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(49,'100049','Usuario 100049','U100049','usuario100049@banco.com','3000000049','1985-02-19','Colombia','Cliente','Activo','2026-03-01 15:44:00'),(50,'100050','Usuario 100050','U100050','usuario100050@banco.com','3000000050','1985-02-20','Colombia','Cliente','Activo','2026-03-01 15:44:00');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-01 16:14:01
