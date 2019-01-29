-- MySQL dump 10.13  Distrib 8.0.12, for osx10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: myamiko
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activation_codes`
--

DROP TABLE IF EXISTS `activation_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `activation_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `is_verified` tinyint(3) unsigned NOT NULL COMMENT '0 is pending of use, 1 is using, 2 is active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activation_codes`
--

LOCK TABLES `activation_codes` WRITE;
/*!40000 ALTER TABLE `activation_codes` DISABLE KEYS */;
INSERT INTO `activation_codes` VALUES (1,'argenisbg@gmail.com','276-921-287','2019-01-04',1,'2019-01-05 02:45:22','2019-01-05 02:46:37'),(2,'me@soymariomoreno.com','489-529-258','2019-01-05',1,'2019-01-05 09:55:11','2019-01-05 09:56:22');
/*!40000 ALTER TABLE `activation_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_state_id_foreign` (`state_id`),
  KEY `addresses_city_id_foreign` (`city_id`),
  CONSTRAINT `addresses_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `addresses_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Conocido',NULL,NULL,NULL,'2019-01-05 02:53:22','2019-01-05 02:53:22'),(4,'default',NULL,NULL,NULL,'2019-01-05 11:31:57','2019-01-05 11:31:57');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmation_accounts`
--

DROP TABLE IF EXISTS `confirmation_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `confirmation_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `is_verified` tinyint(3) unsigned NOT NULL COMMENT '0 is pending of use, 1 is using, 2 is active',
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `confirmation_accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `confirmation_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmation_accounts`
--

LOCK TABLES `confirmation_accounts` WRITE;
/*!40000 ALTER TABLE `confirmation_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmation_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gateways` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways`
--

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2018_12_10_160541_create_states_table',1),(2,'2018_12_10_160548_create_cities_table',1),(3,'2018_12_10_160553_create_addresses_table',1),(4,'2018_12_10_162721_create_rols_table',1),(5,'2018_12_10_163248_create_personal_informations_table',1),(6,'2018_12_10_164937_create_users_table',1),(7,'2018_12_10_172835_create_confirmation_accounts_table',1),(8,'2018_12_10_173217_create_activation_codes_table',1),(9,'2018_12_10_175118_create_schools_table',1),(10,'2018_12_10_183500_create_school_administrators_table',1),(11,'2018_12_10_190126_create_school_classrooms_table',1),(12,'2018_12_10_193045_create_payment_methods_table',1),(13,'2018_12_10_193125_create_gateways_table',1),(14,'2018_12_10_193215_create_plans_table',1),(15,'2018_12_10_193832_create_suscriptions_table',1),(16,'2018_12_11_152602_create_school_taxes_table',1),(17,'2018_12_11_152628_create_school_type_services_table',1),(18,'2018_12_11_152640_create_school_items_table',1),(19,'2018_12_11_153920_create_school_invoice_frequencies_table',1),(20,'2018_12_11_181428_create_school_students_table',1),(21,'2018_12_11_184421_create_school_invoices_table',1),(22,'2018_12_11_184508_create_school_invoice_items_table',1),(23,'2018_12_11_184558_create_school_student_guardians_table',1),(24,'2018_12_11_184706_create_school_invoice_receipts_table',1),(25,'2018_12_12_100000_create_password_resets_table',1),(26,'2018_12_12_190659_add_avatar_to_school_classrooms_table',1),(27,'2018_12_12_194425_create_school_late_fees_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `is_verified` tinyint(3) unsigned NOT NULL COMMENT '0 is pending of use, 1 is using, 2 is change',
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_user_id_foreign` (`user_id`),
  KEY `password_resets_email_index` (`email`),
  CONSTRAINT `password_resets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_four` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_user_id_foreign` (`user_id`),
  CONSTRAINT `payment_methods_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_informations`
--

DROP TABLE IF EXISTS `personal_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `personal_informations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personal_informations_address_id_foreign` (`address_id`),
  CONSTRAINT `personal_informations_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_informations`
--

LOCK TABLES `personal_informations` WRITE;
/*!40000 ALTER TABLE `personal_informations` DISABLE KEYS */;
INSERT INTO `personal_informations` VALUES (2,'Alfredo Argenis','Barraza Guillén','2313','ceo',NULL,'2019-01-05 02:47:51','2019-01-05 02:47:51'),(3,'Mario','Moreno','3432','cto',NULL,'2019-01-05 09:56:45','2019-01-05 09:56:45');
/*!40000 ALTER TABLE `personal_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `tax` double(8,2) NOT NULL,
  `year_discount` double(8,2) NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'basic','basic',100.00,12.00,2018.00,'1',NULL,NULL);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rols`
--

DROP TABLE IF EXISTS `rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rols` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rols`
--

LOCK TABLES `rols` WRITE;
/*!40000 ALTER TABLE `rols` DISABLE KEYS */;
INSERT INTO `rols` VALUES (1,'super',NULL,NULL,NULL);
/*!40000 ALTER TABLE `rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_administrators`
--

DROP TABLE IF EXISTS `school_administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_administrators` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `invitation` tinyint(4) NOT NULL COMMENT '0 not accepted, 1 accepted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_administrators_school_id_foreign` (`school_id`),
  KEY `school_administrators_user_id_foreign` (`user_id`),
  CONSTRAINT `school_administrators_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `school_administrators_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_administrators`
--

LOCK TABLES `school_administrators` WRITE;
/*!40000 ALTER TABLE `school_administrators` DISABLE KEYS */;
INSERT INTO `school_administrators` VALUES (1,1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `school_administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_classrooms`
--

DROP TABLE IF EXISTS `school_classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_classrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(10) unsigned NOT NULL,
  `school_administrator_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 archived, 1 active, 2 deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_classrooms_school_id_foreign` (`school_id`),
  KEY `school_classrooms_school_administrator_id_foreign` (`school_administrator_id`),
  CONSTRAINT `school_classrooms_school_administrator_id_foreign` FOREIGN KEY (`school_administrator_id`) REFERENCES `school_administrators` (`id`),
  CONSTRAINT `school_classrooms_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_classrooms`
--

LOCK TABLES `school_classrooms` WRITE;
/*!40000 ALTER TABLE `school_classrooms` DISABLE KEYS */;
INSERT INTO `school_classrooms` VALUES (1,1,1,'Spanish 3','2th Class','Juancracio','Pérez','albertogar197@gmail.com','7876765421',1,'2019-01-10 06:30:18','2019-01-10 06:30:18',''),(2,1,1,'Spanish 3','2th Class','Juancracio','Pérez','albertogar197@gmail.com','7876765421',1,'2019-01-10 23:06:34','2019-01-10 23:06:34',''),(3,1,1,'Web','Web','Mario','Moreno','mario@gmail.com','1123123123',1,'2019-01-10 23:38:23','2019-01-10 23:38:23','eiXH4ZhD_400x400_1547141843.jpg');
/*!40000 ALTER TABLE `school_classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_invoice_frequencies`
--

DROP TABLE IF EXISTS `school_invoice_frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_invoice_frequencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_invoice_frequencies`
--

LOCK TABLES `school_invoice_frequencies` WRITE;
/*!40000 ALTER TABLE `school_invoice_frequencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_invoice_frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_invoice_items`
--

DROP TABLE IF EXISTS `school_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_invoice_items` (
  `school_invoice_id` int(10) unsigned DEFAULT NULL,
  `school_item_id` int(10) unsigned DEFAULT NULL,
  `school_tax_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `school_invoice_items_school_invoice_id_foreign` (`school_invoice_id`),
  KEY `school_invoice_items_school_item_id_foreign` (`school_item_id`),
  KEY `school_invoice_items_school_tax_id_foreign` (`school_tax_id`),
  CONSTRAINT `school_invoice_items_school_invoice_id_foreign` FOREIGN KEY (`school_invoice_id`) REFERENCES `school_invoices` (`id`),
  CONSTRAINT `school_invoice_items_school_item_id_foreign` FOREIGN KEY (`school_item_id`) REFERENCES `school_items` (`id`),
  CONSTRAINT `school_invoice_items_school_tax_id_foreign` FOREIGN KEY (`school_tax_id`) REFERENCES `school_taxes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_invoice_items`
--

LOCK TABLES `school_invoice_items` WRITE;
/*!40000 ALTER TABLE `school_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_invoice_receipts`
--

DROP TABLE IF EXISTS `school_invoice_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_invoice_receipts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `refund` tinyint(4) NOT NULL,
  `refund_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_invoice_receipts_user_id_foreign` (`user_id`),
  CONSTRAINT `school_invoice_receipts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_invoice_receipts`
--

LOCK TABLES `school_invoice_receipts` WRITE;
/*!40000 ALTER TABLE `school_invoice_receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_invoice_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_invoices`
--

DROP TABLE IF EXISTS `school_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `school_student_id` int(10) unsigned DEFAULT NULL,
  `type` tinyint(3) unsigned NOT NULL COMMENT 'Type of invoice, 0 is one time, 1 is recurrent',
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency_id` int(11) NOT NULL,
  `number_of_payments` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `status` int(10) unsigned NOT NULL COMMENT '0=draft, 1=active, 2=archived, 3=deleted',
  `sent_invoice` int(10) unsigned NOT NULL COMMENT '0= not sent, 1= sent, 2= re sent',
  `discount_applied` int(10) unsigned NOT NULL COMMENT '0 = no discount, 1 = all school, 2=classroom, 3= individual',
  `discount` double(8,2) NOT NULL,
  `paid` int(10) unsigned NOT NULL COMMENT '0= not paid, 1=paid, 2=partial paid',
  `paid_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_invoices_user_id_foreign` (`user_id`),
  KEY `school_invoices_school_student_id_foreign` (`school_student_id`),
  CONSTRAINT `school_invoices_school_student_id_foreign` FOREIGN KEY (`school_student_id`) REFERENCES `school_students` (`id`),
  CONSTRAINT `school_invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_invoices`
--

LOCK TABLES `school_invoices` WRITE;
/*!40000 ALTER TABLE `school_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_items`
--

DROP TABLE IF EXISTS `school_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_type_service_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `school_tax_id` int(10) unsigned NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 = archived, 1 = active, 2 = deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_items_school_type_service_id_foreign` (`school_type_service_id`),
  KEY `school_items_school_tax_id_foreign` (`school_tax_id`),
  CONSTRAINT `school_items_school_tax_id_foreign` FOREIGN KEY (`school_tax_id`) REFERENCES `school_taxes` (`id`),
  CONSTRAINT `school_items_school_type_service_id_foreign` FOREIGN KEY (`school_type_service_id`) REFERENCES `school_type_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_items`
--

LOCK TABLES `school_items` WRITE;
/*!40000 ALTER TABLE `school_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_late_fees`
--

DROP TABLE IF EXISTS `school_late_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_late_fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_invoice_id` int(10) unsigned DEFAULT NULL,
  `extra_days` int(11) NOT NULL,
  `percent_fee` double(8,2) NOT NULL,
  `amount_fee` decimal(10,2) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_late_fees_user_id_foreign` (`user_id`),
  CONSTRAINT `school_late_fees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_late_fees`
--

LOCK TABLES `school_late_fees` WRITE;
/*!40000 ALTER TABLE `school_late_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_late_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_student_guardians`
--

DROP TABLE IF EXISTS `school_student_guardians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_student_guardians` (
  `student_id` int(10) unsigned NOT NULL,
  `guardian_id` int(10) unsigned NOT NULL,
  `mandatory_guardian` int(11) NOT NULL,
  `invitation` int(11) NOT NULL,
  `join_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `school_student_guardians_student_id_foreign` (`student_id`),
  KEY `school_student_guardians_guardian_id_foreign` (`guardian_id`),
  CONSTRAINT `school_student_guardians_guardian_id_foreign` FOREIGN KEY (`guardian_id`) REFERENCES `users` (`id`),
  CONSTRAINT `school_student_guardians_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `school_students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_student_guardians`
--

LOCK TABLES `school_student_guardians` WRITE;
/*!40000 ALTER TABLE `school_student_guardians` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_student_guardians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_students`
--

DROP TABLE IF EXISTS `school_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classroom_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `allergies` int(11) NOT NULL,
  `allergies_notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `medications` int(11) NOT NULL,
  `medical_notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `blood_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(8,2) NOT NULL,
  `height` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_students_classroom_id_foreign` (`classroom_id`),
  CONSTRAINT `school_students_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `school_classrooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_students`
--

LOCK TABLES `school_students` WRITE;
/*!40000 ALTER TABLE `school_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_taxes`
--

DROP TABLE IF EXISTS `school_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_taxes`
--

LOCK TABLES `school_taxes` WRITE;
/*!40000 ALTER TABLE `school_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_type_services`
--

DROP TABLE IF EXISTS `school_type_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `school_type_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_type_services`
--

LOCK TABLES `school_type_services` WRITE;
/*!40000 ALTER TABLE `school_type_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_type_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schools_email_unique` (`email`),
  KEY `schools_user_id_foreign` (`user_id`),
  KEY `schools_address_id_foreign` (`address_id`),
  CONSTRAINT `schools_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `schools_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,1,'Amiko School Test','','me@amiko.io','923422121','2000-01-18','2000-01-18','amiko.io',NULL,NULL,NULL,1,'2019-01-05 02:53:22','2019-01-05 02:53:22'),(3,2,'Amiko','i-avatar_1546666316.png','hi@amiko.io','232323','2019-01-04','2019-01-04','amiko.io',NULL,NULL,NULL,4,'2019-01-05 11:31:57','2019-01-05 11:31:57');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscriptions`
--

DROP TABLE IF EXISTS `suscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `suscriptions` (
  `user_id` int(10) unsigned DEFAULT NULL,
  `plan_id` int(10) unsigned DEFAULT NULL,
  `current_price` decimal(10,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `payment_period` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `suscriptions_user_id_foreign` (`user_id`),
  KEY `suscriptions_plan_id_foreign` (`plan_id`),
  CONSTRAINT `suscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `suscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscriptions`
--

LOCK TABLES `suscriptions` WRITE;
/*!40000 ALTER TABLE `suscriptions` DISABLE KEYS */;
INSERT INTO `suscriptions` VALUES (1,1,0.00,'2019-01-04',2,'2019-01-05 03:17:47','2019-01-05 03:17:47'),(1,1,0.00,'2019-01-04',2,'2019-01-05 03:19:29','2019-01-05 03:19:29'),(2,1,1.00,'2019-01-05',2,'2019-01-05 11:32:27','2019-01-05 11:32:27');
/*!40000 ALTER TABLE `suscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol_id` int(10) unsigned NOT NULL,
  `personal_information_id` int(10) unsigned DEFAULT NULL,
  `type_user` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 is a user of the system root, 2 is user',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'When 0, user is inactive and with 1 user is active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_rol_id_foreign` (`rol_id`),
  KEY `users_personal_information_id_foreign` (`personal_information_id`),
  CONSTRAINT `users_personal_information_id_foreign` FOREIGN KEY (`personal_information_id`) REFERENCES `personal_informations` (`id`),
  CONSTRAINT `users_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `rols` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alfredoar58','argenisbg@gmail.com',NULL,'$2y$10$USiz6znfFan/FASET5yyl.wD5jqxHI2OuC8qewDJe8oAx1T5Aql4S','9611286553',NULL,1,2,1,1,NULL,'2019-01-05 02:47:51','2019-01-05 02:47:51'),(2,'mariomoreno','me@soymariomoreno.com',NULL,'$2y$10$XWEfZDT5abW5UsWIGaAsmONl3d63PtKntQnSB.XzOlQuLLZsodzZC','23423',NULL,1,3,1,1,NULL,'2019-01-05 09:56:45','2019-01-05 09:56:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-28 19:18:13
