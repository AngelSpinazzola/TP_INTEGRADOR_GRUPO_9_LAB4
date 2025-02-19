CREATE DATABASE  IF NOT EXISTS `tpintegradorlaboratorio4` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tpintegradorlaboratorio4`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tpintegradorlaboratorio4
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `DNI` int(11) NOT NULL,
  `CUIL` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Sexo` varchar(20) NOT NULL,
  `Nacionalidad` varchar(25) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `IDDireccion` int(11) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `IDUsuario` int(11) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`DNI`),
  KEY `IDUsuario` (`IDUsuario`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`IDUsuario`) REFERENCES `usuarios` (`IDUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (12345678,'20-12345678-1','Martín','Suárez','Masculino','Argentino','1996-04-20',7,'martin.suarez@gmail.com',7,1),(23456789,'27-23456789-2','Lucía','Pérez','Femenino','Argentina','1994-12-15',8,'lucia.perez@gmail.com',8,1),(33333333,'20-33333333-3','Joaquín','Ramírez','Masculino','Argentino','1993-01-15',1,'joaquin.ramirez@gmail.com',1,1),(34567890,'20-34567890-3','Andrés','García','Masculino','Argentino','1991-05-25',9,'andres.garcia@gmail.com',9,1),(35632781,'27-35632781-4','Jose','Gonzales','Masculino','Argentina','1989-10-15',13,'jose.gonzales@hotmail.com',13,1),(45678901,'27-45678901-4','Sofía','López','Femenino','Argentina','1988-09-10',10,'sofia.lopez@gmail.com',10,1),(46110424,'20461104244','Katherine','Caballero','Femenino','Argentino','2004-10-07',22,'KatherineCaballero@gmail.com',19,1),(46433918,'2046433918','Javier','Dandrea','Masculino','Argentino','2025-01-06',21,'javierdandrea50@gmail.com',18,1),(55555555,'27-55555555-5','Paola','González','Masculino','Chileno','1987-12-09',2,'maria.gonzalez@gmail.com',2,1),(56789012,'20-56789012-5','Federico','Domínguez','Masculino','Argentino','1997-06-18',11,'federico.dominguez@gmail.com',11,1),(57843223,'27-57843223-6','Tomas','Perez','Masculino','Argentina','1999-05-15',15,'tomas_perez@gmail.com',15,1),(66666666,'20-66666666-6','Diego','Vega','Masculino','Argentino','1992-10-30',3,'diego.vega@gmail.com',3,1),(67890123,'27-67890123-6','Camila','Martínez','Femenino','Argentina','1993-03-08',12,'camila.martinez@gmail.com',12,1),(77777777,'27-77777777-7','Natalia','Ortiz','Femenino','Argentina','1995-07-04',4,'natalia.ortiz@gmail.com',4,1),(86784302,'20-86784302-5','Federico','Aguilar','Masculino','Argentino','2001-06-18',14,'federico.aguilar@gmail.com',14,1),(88888888,'20-88888888-8','Fernando','Luna','Masculino','Argentino','1990-11-02',5,'fernando.luna@gmail.com',5,1),(99999999,'27-99999999-9','Valeria','Mendoza','Femenino','Argentina','1989-03-12',6,'valeria.mendoza@gmail.com',6,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `IDCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `DNICliente` int(11) DEFAULT NULL,
  `FechaCreacion` date NOT NULL,
  `NumeroCuenta` int(11) NOT NULL,
  `CBU` varchar(50) NOT NULL,
  `Saldo` decimal(18,2) NOT NULL,
  `IDTipoCuenta` int(11) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IDCuenta`),
  KEY `fk_Cuentas_Tipo_Cuentas` (`IDTipoCuenta`),
  KEY `fk_Cuentas_Clientes` (`DNICliente`),
  CONSTRAINT `fk_Cuentas_Clientes` FOREIGN KEY (`DNICliente`) REFERENCES `clientes` (`DNI`),
  CONSTRAINT `fk_Cuentas_Tipo_Cuentas` FOREIGN KEY (`IDTipoCuenta`) REFERENCES `tipo_cuentas` (`IDTipoCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones` (
  `IDDireccion` int(11) NOT NULL AUTO_INCREMENT,
  `IDLocalidad` int(11) DEFAULT NULL,
  `CodigoPostal` varchar(15) NOT NULL,
  `Calle` varchar(30) NOT NULL,
  `Numero` int(11) NOT NULL,
  PRIMARY KEY (`IDDireccion`),
  KEY `IDLocalidad` (`IDLocalidad`),
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`IDLocalidad`) REFERENCES `localidades` (`IDLocalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,1,'1001','Avenida del Libertador',100),(2,17,'1045','Calle Defensa y Justicia',2018),(3,3,'1425','Calle Anchorena',500),(4,1,'1043','Avenida Callao',300),(5,1,'1428','Calle Azcuénaga',750),(6,1,'1073','Avenida Las Heras',450),(7,1,'1056','Calle Suipacha',850),(8,1,'1089','Avenida 9 de Julio',101),(9,1,'1168','Calle Armenia',700),(10,1,'1181','Avenida San Juan',320),(11,1,'1230','Calle Cabrera',680),(12,1,'1333','Avenida Corrientes',1200),(13,1,'1400','Calle Armenia',90),(14,1,'1450','Avenida Santa Fe',320),(15,1,'1520','Calle Parera',550),(16,1,'1600','Avenida Córdoba',250),(17,1,'1702','Calle Juncal',620),(18,1,'1804','Avenida Alvear',300),(19,15,'1629','CaÃ±onera tortuga',1425),(20,16,'1629','CaÃ±onera tortuga',1425),(21,16,'1629','CaÃ±onera tortuga',1425),(22,19,'1629','CaÃ±onera tortuga',1445);
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `IDLocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `IDProvincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDLocalidad`),
  KEY `IDProvincia` (`IDProvincia`),
  CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`IDProvincia`) REFERENCES `provincias` (`IDProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'La Plata',1),(2,'Mar del Plata',1),(3,'Bahía Blanca',1),(4,'Tandil',1),(5,'San Nicolás de los Arroyos',1),(6,'Junín',1),(7,'Pergamino',1),(8,'Chivilcoy',1),(9,'Zárate',1),(10,'San Pedro',1),(11,'Luján',1),(12,'San Antonio de Areco',1),(13,'Necochea',1),(14,'Azul',1),(15,'Olavarría',1),(16,'La Matanza',1),(17,'Tres de Febrero',1),(18,'Morón',1),(19,'San Isidro',1),(20,'Tigre',1),(21,'Vicente López',1),(22,'Berazategui',1),(23,'Quilmes',1),(24,'Avellaneda',1),(25,'San Fernando',1),(26,'Escobar',1),(27,'Merlo',1),(28,'Moreno',1),(29,'Lomas de Zamora',1),(30,'Adrogué',1),(31,'San Miguel',1),(32,'Ituzaingó',1),(33,'Berisso',1),(34,'Ensenada',1),(35,'Campana',1),(36,'Villa Gesell',1),(37,'Pinamar',1),(38,'Mar de Ajó',1),(39,'Miramar',1),(40,'Cariló',1);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `IDMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Detalle` varchar(100) NOT NULL,
  `Importe` decimal(18,2) NOT NULL,
  `IDCuentaEmisor` int(11) DEFAULT NULL,
  `IDCuentaReceptor` int(11) DEFAULT NULL,
  `IDTipoMovimiento` int(11) NOT NULL,
  PRIMARY KEY (`IDMovimiento`),
  KEY `fk_Movimientos_Tipo_Movimientos` (`IDTipoMovimiento`),
  CONSTRAINT `fk_Movimientos_Tipo_Movimientos` FOREIGN KEY (`IDTipoMovimiento`) REFERENCES `tipo_movimientos` (`IDTipoMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plazos`
--

DROP TABLE IF EXISTS `plazos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plazos` (
  `IDPlazo` int(11) NOT NULL AUTO_INCREMENT,
  `IDPrestamo` int(11) DEFAULT NULL,
  `MesQuePaga` varchar(20) NOT NULL,
  `NroCuota` int(11) NOT NULL,
  `ImporteAPagarCuotas` decimal(10,2) NOT NULL,
  `Estado` bit(1) NOT NULL,
  PRIMARY KEY (`IDPlazo`),
  KEY `fk_Plazos_Prestamos` (`IDPrestamo`),
  CONSTRAINT `fk_Plazos_Prestamos` FOREIGN KEY (`IDPrestamo`) REFERENCES `prestamos` (`IDPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plazos`
--

LOCK TABLES `plazos` WRITE;
/*!40000 ALTER TABLE `plazos` DISABLE KEYS */;
/*!40000 ALTER TABLE `plazos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `IDPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `IDTipoPrestamo` int(11) NOT NULL,
  `DNICliente` int(11) DEFAULT NULL,
  `MontoPedido` decimal(10,2) NOT NULL,
  `ImporteAPagar` decimal(10,2) NOT NULL,
  `Cuotas` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`IDPrestamo`),
  KEY `fk_Prestamos_Clientes` (`DNICliente`),
  KEY `fk_PrestamoId` (`IDTipoPrestamo`),
  CONSTRAINT `fk_PrestamoId` FOREIGN KEY (`IDTipoPrestamo`) REFERENCES `tipo_prestamos` (`IDTipoPrestamo`),
  CONSTRAINT `fk_Prestamos_Clientes` FOREIGN KEY (`DNICliente`) REFERENCES `clientes` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `IDProvincia` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`IDProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Catamarca'),(3,'Chaco'),(4,'Chubut'),(5,'Córdoba'),(6,'Corrientes'),(7,'Entre Ríos'),(8,'Formosa'),(9,'Jujuy'),(10,'La Pampa'),(11,'La Rioja'),(12,'Mendoza'),(13,'Misiones'),(14,'Neuquén'),(15,'Río Negro'),(16,'Salta'),(17,'San Juan'),(18,'San Luis'),(19,'Santa Cruz'),(20,'Santa Fe'),(21,'Santiago del Estero'),(22,'Tierra del Fuego'),(23,'Tucumán'),(24,'Ciudad Autónoma de Buenos Aires');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos` (
  `IDTelefono` int(11) NOT NULL AUTO_INCREMENT,
  `DNICliente` int(11) DEFAULT NULL,
  `NumeroTelefonico` varchar(15) NOT NULL,
  PRIMARY KEY (`IDTelefono`),
  KEY `DNICliente` (`DNICliente`),
  CONSTRAINT `telefonos_ibfk_1` FOREIGN KEY (`DNICliente`) REFERENCES `clientes` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cuentas`
--

DROP TABLE IF EXISTS `tipo_cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cuentas` (
  `IDTipoCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTipoCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cuentas`
--

LOCK TABLES `tipo_cuentas` WRITE;
/*!40000 ALTER TABLE `tipo_cuentas` DISABLE KEYS */;
INSERT INTO `tipo_cuentas` VALUES (1,'Caja de Ahorro'),(2,'Cuenta corriente');
/*!40000 ALTER TABLE `tipo_cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_movimientos`
--

DROP TABLE IF EXISTS `tipo_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_movimientos` (
  `IDTipoMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`IDTipoMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_movimientos`
--

LOCK TABLES `tipo_movimientos` WRITE;
/*!40000 ALTER TABLE `tipo_movimientos` DISABLE KEYS */;
INSERT INTO `tipo_movimientos` VALUES (1,'Alta de cuenta'),(2,'Alta de un préstamo'),(3,'Pago de préstamo'),(4,'Transferencia');
/*!40000 ALTER TABLE `tipo_movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_prestamos`
--

DROP TABLE IF EXISTS `tipo_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_prestamos` (
  `IDTipoPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL,
  `TNA` int(11) NOT NULL,
  PRIMARY KEY (`IDTipoPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prestamos`
--

LOCK TABLES `tipo_prestamos` WRITE;
/*!40000 ALTER TABLE `tipo_prestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `IDUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(25) NOT NULL,
  `Contrasenia` varchar(25) NOT NULL,
  `TipoUsuario` int(11) NOT NULL,
  `Estado` bit(1) NOT NULL,
  PRIMARY KEY (`IDUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','123',1,''),(2,'usuario1','password',2,''),(3,'usuario2','password2',2,''),(4,'usuario3','password3',2,'\0'),(5,'usuario4','password4',2,''),(6,'usuario5','password5',2,''),(7,'usuario6','password6',2,'\0'),(8,'usuario7','password7',2,''),(9,'usuario8','password8',2,''),(10,'usuario9','password9',2,'\0'),(11,'usuario10','password10',2,''),(12,'usuario11','password11',2,''),(13,'usuario12','password12',2,''),(14,'usuario13','password13',2,''),(15,'usuario14','password14',2,''),(18,'Javito05','123',2,''),(19,'Katu123','123',2,'');
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

-- Dump completed on 2025-02-10 19:14:36
