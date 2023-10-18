-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: fullstackphp
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.38-MariaDB

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
-- Table structure for table `app_call_progress`
--

DROP TABLE IF EXISTS `app_call_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_call_progress` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT '',
  `called_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_call_progress`
--

LOCK TABLES `app_call_progress` WRITE;
/*!40000 ALTER TABLE `app_call_progress` DISABLE KEYS */;
INSERT INTO `app_call_progress` VALUES (77,'dddsssssssssssssssssssssssss',2,'2023-10-18 16:20:07',NULL,NULL);
/*!40000 ALTER TABLE `app_call_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_called`
--

DROP TABLE IF EXISTS `app_called`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_called` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_called`
--

LOCK TABLES `app_called` WRITE;
/*!40000 ALTER TABLE `app_called` DISABLE KEYS */;
INSERT INTO `app_called` VALUES (5,53,'teste as 14:000','2023-10-18 17:58:28','2023-10-18 18:46:46','A');
/*!40000 ALTER TABLE `app_called` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_queue`
--

DROP TABLE IF EXISTS `mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `from_email` varchar(255) NOT NULL DEFAULT '',
  `from_name` varchar(255) NOT NULL DEFAULT '',
  `recipient_email` varchar(255) NOT NULL DEFAULT '',
  `recipient_name` varchar(255) NOT NULL DEFAULT '',
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_queue`
--

LOCK TABLES `mail_queue` WRITE;
/*!40000 ALTER TABLE `mail_queue` DISABLE KEYS */;
INSERT INTO `mail_queue` VALUES (1,'[PAGAMENTO CONFIRMADO] Obrigado por assinar o CaféApp','<!doctype html>\n<html>\n<head>\n    <meta name=\"viewport\" content=\"width=device-width\"/>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\n    <title>[PAGAMENTO CONFIRMADO] Obrigado por assinar o CaféApp</title>\n    <style>\n        body {\n            -webkit-box-sizing: border-box;\n            -moz-box-sizing: border-box;\n            box-sizing: border-box;\n            font-family: Helvetica, sans-serif;\n        }\n\n        table {\n            max-width: 500px;\n            padding: 0 10px;\n            background: #ffffff;\n        }\n\n        .content {\n            font-size: 16px;\n            margin-bottom: 25px;\n            padding-bottom: 5px;\n            border-bottom: 1px solid #EEEEEE;\n        }\n\n        .content p {\n            margin: 25px 0;\n        }\n\n        .footer {\n            font-size: 14px;\n            color: #888888;\n            font-style: italic;\n        }\n\n        .footer p {\n            margin: 0 0 2px 0;\n        }\n    </style>\n</head>\n<body>\n<table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td>\n            <div class=\"content\">\n                \n<h3>Obrigado Robson!</h3><p>Estamos passando apenas para agradecer por você ser um assinante CaféApp PRO.</p><p>Sua fatura deste mês venceu hoje e já está paga de acordo com seu plano. Qualquer dúvida estamos a disposição.</p>                <p>Atenciosamente, equipe CaféControl.</p>\n            </div>\n            <div class=\"footer\">\n                <p>CaféControl - Gerencie suas contas com o melhor café</p>\n                <p>SC 406 - Rod. Drº Antônio Luiz Moura Gonzaga                    , 3339, Bloco A, Sala 208</p>\n                <p>Florianópolis/SC - 88048-301</p>\n            </div>\n        </td>\n    </tr>\n</table>\n</body>\n</html>\n','cursos@upinside.com.br','Robson V. Leite','robsonvleite@gmail.com','Robson Leite','2019-01-31 17:23:54','2019-01-04 14:13:11','2019-02-07 14:57:26'),(2,'[PAGAMENTO RECUSADO] Sua conta CaféApp precisa de atenção','<!doctype html>\n<html>\n<head>\n    <meta name=\"viewport\" content=\"width=device-width\"/>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\n    <title>[PAGAMENTO RECUSADO] Sua conta CaféApp precisa de atenção</title>\n    <style>\n        body {\n            -webkit-box-sizing: border-box;\n            -moz-box-sizing: border-box;\n            box-sizing: border-box;\n            font-family: Helvetica, sans-serif;\n        }\n\n        table {\n            max-width: 500px;\n            padding: 0 10px;\n            background: #ffffff;\n        }\n\n        .content {\n            font-size: 16px;\n            margin-bottom: 25px;\n            padding-bottom: 5px;\n            border-bottom: 1px solid #EEEEEE;\n        }\n\n        .content p {\n            margin: 25px 0;\n        }\n\n        .footer {\n            font-size: 14px;\n            color: #888888;\n            font-style: italic;\n        }\n\n        .footer p {\n            margin: 0 0 2px 0;\n        }\n    </style>\n</head>\n<body>\n<table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td>\n            <div class=\"content\">\n                \n<h3>Presado Robson!</h3><p>Não conseguimos cobrar seu cartão referênte a fatura deste mês para sua assinatura CaféApp. Precisamos que você veja isso.</p><p>Acesse sua conta para atualizar seus dados de pagamento, você pode cadastrar outro cartão.</p><p>Se não fizer nada agora uma nova tentativa de cobrança será feita em 3 dias. Se não der certo, sua assinatura será cancelada :/</p><p>Qualquer dúvida estamos a disposição.</p>                <p>Atenciosamente, equipe CaféControl.</p>\n            </div>\n            <div class=\"footer\">\n                <p>CaféControl - Gerencie suas contas com o melhor café</p>\n                <p>SC 406 - Rod. Drº Antônio Luiz Moura Gonzaga                    , 3339, Bloco A, Sala 208</p>\n                <p>Florianópolis/SC - 88048-301</p>\n            </div>\n        </td>\n    </tr>\n</table>\n</body>\n</html>\n','cursos@upinside.com.br','Robson V. Leite','robsonvleite@gmail.com','Robson Leite','2019-01-11 15:43:45','2019-01-04 14:19:54','2019-02-07 14:57:27'),(3,'[ASSINATURA CANCELADA] Sua conta CaféApp agora é FREE','<!doctype html>\n<html>\n<head>\n    <meta name=\"viewport\" content=\"width=device-width\"/>\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>\n    <title>[ASSINATURA CANCELADA] Sua conta CaféApp agora é FREE</title>\n    <style>\n        body {\n            -webkit-box-sizing: border-box;\n            -moz-box-sizing: border-box;\n            box-sizing: border-box;\n            font-family: Helvetica, sans-serif;\n        }\n\n        table {\n            max-width: 500px;\n            padding: 0 10px;\n            background: #ffffff;\n        }\n\n        .content {\n            font-size: 16px;\n            margin-bottom: 25px;\n            padding-bottom: 5px;\n            border-bottom: 1px solid #EEEEEE;\n        }\n\n        .content p {\n            margin: 25px 0;\n        }\n\n        .footer {\n            font-size: 14px;\n            color: #888888;\n            font-style: italic;\n        }\n\n        .footer p {\n            margin: 0 0 2px 0;\n        }\n    </style>\n</head>\n<body>\n<table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td>\n            <div class=\"content\">\n                \n<h3>Que pena Robson :/</h3><p>Tentamos efetuar mais uma cobrança para sua assinatura PRO hoje, mas sem sucesso.</p><p>Como essa já é uma segunda tentativa, infelismente sua assinatura foi cancelada. Mas calma, você pode assinar novamente a qualquer momento.</p><p>Continue controlando com os recursos FREE, e assim que quiser basta assinar novamente e voltar de onde parou :)</p>                <p>Atenciosamente, equipe CaféControl.</p>\n            </div>\n            <div class=\"footer\">\n                <p>CaféControl - Gerencie suas contas com o melhor café</p>\n                <p>SC 406 - Rod. Drº Antônio Luiz Moura Gonzaga                    , 3339, Bloco A, Sala 208</p>\n                <p>Florianópolis/SC - 88048-301</p>\n            </div>\n        </td>\n    </tr>\n</table>\n</body>\n</html>\n','cursos@upinside.com.br','Robson V. Leite','robsonvleite@gmail.com','Robson Leite','2019-01-11 15:43:49','2019-01-04 14:34:01','2019-02-07 14:57:28');
/*!40000 ALTER TABLE `mail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_access`
--

DROP TABLE IF EXISTS `report_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `users` int(11) NOT NULL DEFAULT '1',
  `views` int(11) NOT NULL DEFAULT '1',
  `pages` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_access`
--

LOCK TABLES `report_access` WRITE;
/*!40000 ALTER TABLE `report_access` DISABLE KEYS */;
INSERT INTO `report_access` VALUES (1,1,2,193,'2019-02-11 18:12:15','2019-02-11 20:57:55'),(2,1,1,32,'2019-02-14 16:37:35','2019-02-14 16:39:23'),(3,1,1,67,'2023-10-17 14:27:49','2023-10-17 17:39:44'),(4,1,4,426,'2023-10-18 12:03:22','2023-10-18 20:05:35');
/*!40000 ALTER TABLE `report_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_online`
--

DROP TABLE IF EXISTS `report_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_online` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned DEFAULT NULL,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `agent` varchar(255) NOT NULL DEFAULT '',
  `pages` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_online`
--

LOCK TABLES `report_online` WRITE;
/*!40000 ALTER TABLE `report_online` DISABLE KEYS */;
INSERT INTO `report_online` VALUES (4,51,'::1','/app','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',31,'2019-02-14 16:37:38','2019-02-14 16:39:23');
/*!40000 ALTER TABLE `report_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '1',
  `forget` varchar(255) DEFAULT NULL,
  `document` varchar(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'confirmed' COMMENT 'registered, confirmed',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tipo` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  FULLTEXT KEY `full_text` (`first_name`,`last_name`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (52,'HENRIQUE - Colaborador','SALVADOR','hentaris@hotmail.com','$2y$10$cwDx2F8I62Byf1AO1ETTmOSEzDGRhv40IrAckxnfj5YvUCRxkbmRW',9,NULL,NULL,'confirmed','2023-10-17 14:32:20','2023-10-18 18:46:12','C'),(53,'HENRIQUE - Cliente','SALVADOR.','henttaris@gmail.com','$2y$10$cwDx2F8I62Byf1AO1ETTmOSEzDGRhv40IrAckxnfj5YvUCRxkbmRW',9,NULL,'08632778887','confirmed','2023-10-17 15:13:54','2023-10-18 19:56:37','C'),(54,'HENRIQUE TADEU','SALVADOR','henrique@librainfo.cim.br','$2y$10$EIkjmMrkae2xlEdtwvviyemwRu14sL23PgSMXzZF39lL94k5WcLwK',1,NULL,NULL,'confirmed','2023-10-18 18:51:18','2023-10-18 19:03:58',NULL),(55,'HENRIQUE TADEU','SALVADOR','edaris01@librainfo.cim.br','$2y$10$Ha2OvYGDj6zZ94OhaioBv.d/7717iNa/weqI2H.igaymuzOVmBoym',1,NULL,NULL,'confirmed','2023-10-18 19:04:17',NULL,NULL),(56,'HENRIQUE TADEU','SALVADOR','edaris02@librainfo.cim.br','$2y$10$wEmA/Si/gBAhJNhd69aB9eT.3p.dM/j2FXtAdH5DCMggDQMUjJ8ce',1,NULL,'93863284887','confirmed','2023-10-18 19:08:12','2023-10-18 19:11:11','F'),(57,'HENRIQUE TADEU','SALVADOR','edaris03@librainfo.cim.br','$2y$10$ldwZW734BS3Y5sZHRfZwIurSOBCDZf8LH04sivx6kdgnYfl3stB2a',1,NULL,NULL,'confirmed','2023-10-18 19:09:25',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fullstackphp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 17:47:42
