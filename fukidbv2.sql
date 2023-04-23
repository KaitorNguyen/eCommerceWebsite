-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: fukidb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add category',4,'add_category'),(14,'Can change category',4,'change_category'),(15,'Can delete category',4,'delete_category'),(16,'Can view category',4,'view_category'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add shop',8,'add_shop'),(30,'Can change shop',8,'change_shop'),(31,'Can delete shop',8,'delete_shop'),(32,'Can view shop',8,'view_shop'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add application',10,'add_application'),(38,'Can change application',10,'change_application'),(39,'Can delete application',10,'delete_application'),(40,'Can view application',10,'view_application'),(41,'Can add access token',11,'add_accesstoken'),(42,'Can change access token',11,'change_accesstoken'),(43,'Can delete access token',11,'delete_accesstoken'),(44,'Can view access token',11,'view_accesstoken'),(45,'Can add grant',12,'add_grant'),(46,'Can change grant',12,'change_grant'),(47,'Can delete grant',12,'delete_grant'),(48,'Can view grant',12,'view_grant'),(49,'Can add refresh token',13,'add_refreshtoken'),(50,'Can change refresh token',13,'change_refreshtoken'),(51,'Can delete refresh token',13,'delete_refreshtoken'),(52,'Can view refresh token',13,'view_refreshtoken'),(53,'Can add id token',14,'add_idtoken'),(54,'Can change id token',14,'change_idtoken'),(55,'Can delete id token',14,'delete_idtoken'),(56,'Can view id token',14,'view_idtoken'),(57,'Can add comment',15,'add_comment'),(58,'Can change comment',15,'change_comment'),(59,'Can delete comment',15,'delete_comment'),(60,'Can view comment',15,'view_comment'),(61,'Can add review',16,'add_review'),(62,'Can change review',16,'change_review'),(63,'Can delete review',16,'delete_review'),(64,'Can view review',16,'view_review');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_shops_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-18 16:38:18.340147','1','Health & Beauty',1,'[{\"added\": {}}]',4,1),(2,'2023-04-18 16:38:45.759019','2','Men\'s Fashion & Accessories',1,'[{\"added\": {}}]',4,1),(3,'2023-04-18 16:38:58.049113','3','Women\'s Fashion & Accessories',1,'[{\"added\": {}}]',4,1),(4,'2023-04-18 16:39:21.416678','4','Sports & Travel',1,'[{\"added\": {}}]',4,1),(5,'2023-04-18 19:31:47.548050','1','Classic Store',1,'[{\"added\": {}}]',8,1),(6,'2023-04-18 19:46:19.224959','5','Body Soap & Shower Gel',1,'[{\"added\": {}}]',4,1),(7,'2023-04-18 19:50:14.135917','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',1,'[{\"added\": {}}]',9,1),(8,'2023-04-18 21:18:38.468278','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,1),(9,'2023-04-18 21:19:55.277562','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,1),(10,'2023-04-18 22:18:49.566805','2','Xả Khô Nashi Instant Mask Styling 150ML',1,'[{\"added\": {}}]',9,1),(11,'2023-04-18 22:26:35.611020','2','Unilever',1,'[{\"added\": {}}]',8,1),(12,'2023-04-18 22:29:03.787503','3','Sữa Tắm Lifebuoy Detox Diệt Khuẩn Trà Xanh & Khổ Qua 800G chiết xuất từ thiên nhiên ngừa mùi cơ thể và sạch sâu khỏi bụi mịn (Chai)',1,'[{\"added\": {}}]',9,1),(13,'2023-04-19 20:53:02.441040','4','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml',1,'[{\"added\": {}}]',9,1),(14,'2023-04-19 20:58:44.662640','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(15,'2023-04-19 20:58:58.599242','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(16,'2023-04-19 20:59:42.821250','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,1),(17,'2023-04-19 21:08:05.393840','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(18,'2023-04-19 21:08:15.412000','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(19,'2023-04-19 21:09:34.942200','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,1),(20,'2023-04-19 21:11:35.988806','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(21,'2023-04-19 21:12:56.657341','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\", \"description\"]}}]',9,1),(22,'2023-04-19 21:13:39.858030','2','Xả Khô Nashi Instant Mask Styling 150ML',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(23,'2023-04-19 21:15:18.319181','2','Xả Khô Nashi Instant Mask Styling 150ML',2,'[{\"changed\": {\"fields\": [\"Image\", \"description\"]}}]',9,1),(24,'2023-04-19 21:16:44.914985','3','Sữa Tắm Lifebuoy Detox Diệt Khuẩn Trà Xanh & Khổ Qua 800G chiết xuất từ thiên nhiên ngừa mùi cơ thể và sạch sâu khỏi bụi mịn (Chai)',2,'[{\"changed\": {\"fields\": [\"Image\", \"description\"]}}]',9,1),(25,'2023-04-19 21:16:55.666784','3','Sữa Tắm Lifebuoy Detox Diệt Khuẩn Trà Xanh & Khổ Qua 800G chiết xuất từ thiên nhiên ngừa mùi cơ thể và sạch sâu khỏi bụi mịn (Chai)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(26,'2023-04-19 21:17:10.209968','4','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(27,'2023-04-19 21:17:45.472536','4','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml',2,'[{\"changed\": {\"fields\": [\"Image\", \"description\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'contenttypes','contenttype'),(11,'oauth2_provider','accesstoken'),(10,'oauth2_provider','application'),(12,'oauth2_provider','grant'),(14,'oauth2_provider','idtoken'),(13,'oauth2_provider','refreshtoken'),(7,'sessions','session'),(4,'shops','category'),(15,'shops','comment'),(9,'shops','product'),(16,'shops','review'),(8,'shops','shop'),(5,'shops','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-18 16:29:25.550324'),(2,'contenttypes','0002_remove_content_type_name','2023-04-18 16:29:25.572980'),(3,'auth','0001_initial','2023-04-18 16:29:25.683428'),(4,'auth','0002_alter_permission_name_max_length','2023-04-18 16:29:25.703435'),(5,'auth','0003_alter_user_email_max_length','2023-04-18 16:29:25.707559'),(6,'auth','0004_alter_user_username_opts','2023-04-18 16:29:25.711248'),(7,'auth','0005_alter_user_last_login_null','2023-04-18 16:29:25.715248'),(8,'auth','0006_require_contenttypes_0002','2023-04-18 16:29:25.718592'),(9,'auth','0007_alter_validators_add_error_messages','2023-04-18 16:29:25.722602'),(10,'auth','0008_alter_user_username_max_length','2023-04-18 16:29:25.726262'),(11,'auth','0009_alter_user_last_name_max_length','2023-04-18 16:29:25.730264'),(12,'auth','0010_alter_group_name_max_length','2023-04-18 16:29:25.740059'),(13,'auth','0011_update_proxy_permissions','2023-04-18 16:29:25.744063'),(14,'auth','0012_alter_user_first_name_max_length','2023-04-18 16:29:25.748061'),(15,'shops','0001_initial','2023-04-18 16:29:25.859700'),(16,'admin','0001_initial','2023-04-18 16:31:12.151343'),(17,'admin','0002_logentry_remove_auto_add','2023-04-18 16:31:12.157121'),(18,'admin','0003_logentry_add_action_flag_choices','2023-04-18 16:31:12.161121'),(19,'sessions','0001_initial','2023-04-18 16:31:12.180425'),(20,'shops','0002_shop','2023-04-18 17:11:54.157355'),(21,'shops','0003_alter_shop_user_product','2023-04-18 19:14:42.478953'),(22,'shops','0004_product_description_shop_description','2023-04-18 21:16:13.395174'),(23,'shops','0005_alter_product_shop','2023-04-18 22:05:13.366629'),(24,'shops','0006_user_avatar','2023-04-19 03:22:07.502616'),(25,'shops','0007_shop_avatar_alter_product_unique_together','2023-04-19 22:51:26.210359'),(26,'oauth2_provider','0001_initial','2023-04-22 02:47:08.240540'),(27,'oauth2_provider','0002_auto_20190406_1805','2023-04-22 02:47:08.271837'),(28,'oauth2_provider','0003_auto_20201211_1314','2023-04-22 02:47:08.318650'),(29,'oauth2_provider','0004_auto_20200902_2022','2023-04-22 02:47:08.521882'),(30,'oauth2_provider','0005_auto_20211222_2352','2023-04-22 02:47:08.553173'),(31,'oauth2_provider','0006_alter_application_client_secret','2023-04-22 02:47:08.584370'),(32,'shops','0008_review_comment','2023-04-22 08:24:46.146027'),(33,'shops','0009_alter_comment_unique_together','2023-04-22 19:36:45.739827');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5i060zd6au3pytkgr7mo1rxhsj6rb4l2','.eJxVjEEOwiAQRe_C2hBAwNal-56BzAwzUjU0Ke3KeHdD0oVu_3vvv1WCfStpb7ymOaursur0uyHQk2sH-QH1vmha6rbOqLuiD9r0tGR-3Q7376BAK73OFDybyC6Ck4wAITCaaEebvRjjCIInkQENkzDFM9I4WAuOjKC7qM8XFXw5MA:1pooKU:UqE1RDmIHo43XVOqjC_8hGnb8qjeRp5Ge7vady0CGno','2023-05-02 16:37:18.944599');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_shops_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'bGXTv10SOAtoGHhuAXh4LOPmm7Pt0v','2023-04-22 13:01:56.246931','read write',1,1,'2023-04-22 03:01:56.247933','2023-04-22 03:01:56.247933',NULL,NULL),(2,'Bg1XOLxI7kXBmTavKe8TlP9RDgWUm7','2023-04-23 15:44:25.317429','read write',1,1,'2023-04-23 05:44:25.318426','2023-04-23 05:44:25.318426',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_shops_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'z9iWJZj2v2KUhZUrlVcAxDI6H9AlVpXUMRzCbPaH','','confidential','password','pbkdf2_sha256$600000$VGmJ1BV2xEOmxksCZGk52j$8EBSIK9mE1LLr501dbL+7vyGjS8h/ZPOjhNE6bRMAlo=','',1,0,'2023-04-22 02:57:05.202855','2023-04-22 02:57:05.202855','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_shops_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_shops_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_shops_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'cAj6msTjxgEj5TVtqZw58p59JU4A7w',1,1,1,'2023-04-22 03:01:56.251439','2023-04-22 03:01:56.251439',NULL),(2,'JR8JjqN1QmCMZjieScYVw3o6OHNqLD',2,1,1,'2023-04-23 05:44:25.319871','2023-04-23 05:44:25.319871',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_category`
--

DROP TABLE IF EXISTS `shops_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_category`
--

LOCK TABLES `shops_category` WRITE;
/*!40000 ALTER TABLE `shops_category` DISABLE KEYS */;
INSERT INTO `shops_category` VALUES (5,'Body Soap & Shower Gel'),(1,'Health & Beauty'),(2,'Men\'s Fashion & Accessories'),(4,'Sports & Travel'),(3,'Women\'s Fashion & Accessories');
/*!40000 ALTER TABLE `shops_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_comment`
--

DROP TABLE IF EXISTS `shops_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint NOT NULL,
  `reply_to_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shops_comment_reply_to_id_de0a475f_fk_shops_comment_id` (`reply_to_id`),
  KEY `shops_comment_user_id_c61bfefb_fk_shops_user_id` (`user_id`),
  KEY `shops_comment_product_id_cf48e9c7` (`product_id`),
  CONSTRAINT `shops_comment_product_id_cf48e9c7_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`),
  CONSTRAINT `shops_comment_reply_to_id_de0a475f_fk_shops_comment_id` FOREIGN KEY (`reply_to_id`) REFERENCES `shops_comment` (`id`),
  CONSTRAINT `shops_comment_user_id_c61bfefb_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_comment`
--

LOCK TABLES `shops_comment` WRITE;
/*!40000 ALTER TABLE `shops_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_product`
--

DROP TABLE IF EXISTS `shops_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,3) NOT NULL,
  `category_id` bigint NOT NULL,
  `shop_id` bigint NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_product_name_shop_id_62390af0_uniq` (`name`,`shop_id`),
  KEY `shops_product_category_id_75a38fc1_fk_shops_category_id` (`category_id`),
  KEY `shops_product_shop_id_b4feef5b_fk_shops_shop_id` (`shop_id`),
  CONSTRAINT `shops_product_category_id_75a38fc1_fk_shops_category_id` FOREIGN KEY (`category_id`) REFERENCES `shops_category` (`id`),
  CONSTRAINT `shops_product_shop_id_b4feef5b_fk_shops_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `shops_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_product`
--

LOCK TABLES `shops_product` WRITE;
/*!40000 ALTER TABLE `shops_product` DISABLE KEYS */;
INSERT INTO `shops_product` VALUES (1,1,'2023-04-18 19:50:14.133922','2023-04-19 21:12:56.095996','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml','fukimedia/products/2023/04/sua-tam-bbw-noir-768x768_fksd5e',250000.000,5,1,'<p>Sản phẩm sữa tắm Bath &amp; Body Works l&agrave; một trong những thương hiệu rất lớn ở Mỹ, sữa tắm với c&ocirc;ng dụng gi&uacute;p l&agrave;m sạch, cung cấp độ ẩm v&agrave; lưu lại hương thơm cho m&aacute;i t&oacute;c v&agrave; l&agrave;n da khỏe mạnh. Sản phẩm c&ograve;n rất tiện lợi cho nam v&igrave; chức năng 2 trong 1 vừa tắm to&agrave;n th&acirc;n v&agrave; gội sạch, vừa đem lại hương thơm m&aacute;t cho m&aacute;i t&oacute;c.</p>\r\n\r\n<ul>\r\n	<li>Sản phẩm rất gọn nhẹ đơn giản nhưng chất lượng. Đặc biệt sản phẩm giữ m&ugrave;i hương rất l&acirc;u, đem lại cho bạn một ng&agrave;y d&agrave;i thật năng động v&agrave; thoải m&aacute;i.</li>\r\n	<li>Ngo&agrave;i ra sản phẩm c&ograve;n chứa c&aacute;c hạt dưỡng ẩm, nu&ocirc;i dưỡng l&agrave;n da thật săn chắc v&agrave; đem đến vẻ khỏe khoắn cho cơ thể bạn.</li>\r\n</ul>\r\n\r\n<p><strong>Đặc điểm Sữa tắm gội cho nam Bath &amp; Body Works:</strong></p>\r\n\r\n<ul>\r\n	<li>Th&agrave;nh phần chứa những chất dưỡng ẩm, dưỡng da cực kỳ tốt. Gi&uacute;p l&agrave;m mềm da hiệu quả, phục hồi da bị ch&aacute;y nắng, da bạn sẽ khỏe v&agrave; tr&agrave;n đầy sức sống hơn.</li>\r\n	<li>C&ocirc;ng thức chuy&ecirc;n biệt nu&ocirc;i dưỡng da tối ưu d&agrave;nh cho nam giới.</li>\r\n	<li>Th&iacute;ch hợp với mọi l&agrave;n da. Kể cả da nhạy cảm.</li>\r\n	<li>Dễ dang kết hợp với xịt thơm, lotion c&ugrave;ng d&ograve;ng để dưỡng da tốt hơn &amp; thơm l&acirc;u hơn.</li>\r\n	<li>Đa dạng m&ugrave;i hương: sang trọng tinh tế, năng động ph&oacute;ng kho&aacute;ng, hương trầm nội lực hoặc tươi m&aacute;t cuốn h&uacute;t.</li>\r\n</ul>\r\n\r\n<p><strong>M&ugrave;i hương:</strong></p>\r\n\r\n<p><strong><strong>Noir</strong>:&nbsp;</strong>Bạch đậu khấu đen, vani kh&oacute;i v&agrave; một ch&uacute;t xạ hương. M&ugrave;i hương của sự sang trọng v&agrave; lịch l&atilde;m. Hương thơm ngọt ng&agrave;o của vani v&agrave; th&ecirc;m sự b&iacute; ẩn trọng kh&oacute;i xạ hương tạo th&ecirc;m n&eacute;t quyến rũ, cuốn h&uacute;t cho ph&aacute;i mạnh.</p>\r\n\r\n<p><img alt=\"\" src=\"https://res.cloudinary.com/dygnuycoh/image/upload/v1/fukimedia/ckeditors/products/2023/04/20/bath-body-works-noir_mjystq\" style=\"height:672px; width:672px\" /></p>'),(2,1,'2023-04-18 22:18:49.564769','2023-04-19 21:15:17.662071','Xả Khô Nashi Instant Mask Styling 150ML','fukimedia/products/2023/04/xa-kho-nashi-instant_sjnjji',420000.000,5,1,'<h3><strong>C&Ocirc;NG DỤNG CỦA XẢ KH&Ocirc; NASHI INSTANT MASK STYLING</strong></h3>\r\n\r\n<p>Xả kh&ocirc; Nashi Argan Instant được tạo n&ecirc;n với sự kết hợp của c&aacute;c th&agrave;nh phần tự nhi&ecirc;n v&agrave; sinh học trong đ&oacute; c&oacute; dầu hạt lanh, dầu argan được chứng nhận cung cấp th&ecirc;m độ ẩm. Dầu Argan được coi l&agrave; &ldquo;Gold of Morocco&rdquo;, l&agrave; một loại dầu tự nhi&ecirc;n được đ&aacute;nh gi&aacute; cao trong nhiều thế kỷ. Loại dầu n&agrave;y ng&agrave;y c&agrave;ng phổ biến, n&oacute; mang lại cho m&aacute;i t&oacute;c sự mềm mại độc đ&aacute;o, c&oacute; t&aacute;c dụng chống oxy h&oacute;a v&agrave; cũng c&oacute; thể ngăn ngừa t&oacute;c chẻ ngọn v&agrave; g&atilde;y rụng. Xịt dưỡng ẩm Nashi n&agrave;y cũng chứa dầu hạt lanh, gi&uacute;p t&oacute;c mềm mượt hơn, bảo vệ t&oacute;c chống lại nhiệt v&agrave; c&aacute;c cuộc tấn c&ocirc;ng b&ecirc;n ngo&agrave;i. Tất cả c&aacute;c bao b&igrave; của Nashi đều th&acirc;n thiện với m&ocirc;i trường v&agrave; c&oacute; thể t&aacute;i chế.</p>\r\n\r\n<p><img alt=\"\" src=\"https://res.cloudinary.com/dygnuycoh/image/upload/v1/fukimedia/ckeditors/products/2023/04/20/xa-kho-nashi-instant-2-768x768_jqgxkq\" style=\"height:768px; width:768px\" /></p>\r\n\r\n<p><strong>Đối tượng sử dụng:</strong></p>\r\n\r\n<p>Tuyệt vời cho kh&aacute;ch h&agrave;ng c&oacute; m&aacute;i t&oacute;c x&ugrave; rối, t&oacute;c mỏng v&agrave; nhờn rất nhanh, thường xuy&ecirc;n sử dụng m&aacute;y duỗi t&oacute;c m&agrave; kh&ocirc;ng muốn sử dụng dầu xả ướt.</p>\r\n\r\n<h3><strong>HƯỚNG DẪN SỬ DỤNG XẢ KH&Ocirc; NASHI INSTANT MASK STYLING</strong></h3>\r\n\r\n<p>Sau khi gội đầu v&agrave; lau kh&ocirc; t&oacute;c, xịt sản phẩm l&ecirc;n to&agrave;n bộ phần t&oacute;c cần tạo kiểu, d&ugrave;ng lược chải đều hoặc d&ugrave;ng tay xoa nhẹ nh&agrave;ng cho sản phẩm thấm đều v&agrave;o t&oacute;c, tạo kiểu theo &yacute; muốn.</p>\r\n\r\n<p>Kh&ocirc;ng rửa sạch, chỉ cần l&agrave;m kh&ocirc; t&oacute;c.</p>\r\n\r\n<p>Mẹo: xịt nhẹ l&ecirc;n t&oacute;c kh&ocirc; để kh&ocirc;i phục lại sự ho&agrave;n hảo của kiểu t&oacute;c v&agrave;o buổi s&aacute;ng.</p>\r\n\r\n<p>Sử dụng kết hợp với dầu gội cặp nashi, dầu dưỡng t&oacute;c Nashi Argan Oil, v&agrave; dầu hấp t&oacute;c Nashi Argan Deep Infusion để c&oacute; hiệu quả tốt nhất</p>\r\n\r\n<p><strong>Hướng dẫn bảo quản:</strong></p>\r\n\r\n<p>- Để sản phẩm ở nhiệt độ ph&ograve;ng,tho&aacute;ng m&aacute;t.</p>\r\n\r\n<p>- Đậy k&iacute;n nắp sau khi sử dụng.</p>\r\n\r\n<p>- Tr&aacute;nh &aacute;nh s&aacute;ng hoặc nơi gần nguồn điện,ẩm mốc.</p>\r\n\r\n<p>- Tr&aacute;nh xa tầm tay trẻ em.</p>'),(3,1,'2023-04-18 22:29:03.786499','2023-04-19 21:16:55.054195','Sữa Tắm Lifebuoy Detox Diệt Khuẩn Trà Xanh & Khổ Qua 800G chiết xuất từ thiên nhiên ngừa mùi cơ thể và sạch sâu khỏi bụi mịn (Chai)','fukimedia/products/2023/04/LifebuoyMatcha_tmwuuc',195000.000,5,2,'<p><strong>Sữa Tắm Lifebuoy Detox Diệt Khuẩn Tr&agrave; Xanh &amp; Khổ Qua 800G chiết xuất từ thi&ecirc;n nhi&ecirc;n ngừa m&ugrave;i cơ thể v&agrave; sạch s&acirc;u khỏi bụi mịn (Chai)</strong></p>\r\n\r\n<p>- Hằng ng&agrave;y l&agrave;n da của ch&uacute;ng ta phải tiếp x&uacute;c với v&ocirc; số bụi bẩn &ocirc; nhiễm v&agrave; vi khuẩn, đặc biệt l&agrave; bụi si&ecirc;u mịn PM2.5.</p>\r\n\r\n<p>- C&ocirc;ng thức với 2 th&agrave;nh phần 100% từ thi&ecirc;n nhi&ecirc;n, gồm Matcha chống oxy h&oacute;a v&agrave; Khổ qua diệt khuẩn</p>\r\n\r\n<p>- L&agrave;m sạch s&acirc;u, detox loại bỏ bụi &ocirc; nhiễm si&ecirc;u mịn PM2.5 v&agrave; vi khuẩn hằng ng&agrave;y</p>\r\n\r\n<p>- Loại bỏ những nguy&ecirc;n nh&acirc;n g&acirc;y n&ecirc;n c&aacute;c vấn đề về da như ngứa, ửng đỏ, nổi mụn</p>\r\n\r\n<p>- Lifebuoy l&agrave; nh&atilde;n hiệu sạch khuẩn số 1 thế giới</p>\r\n\r\n<p>- Ph&acirc;n tử ion bạc gi&uacute;p ph&aacute; vỡ lớp vỏ tế b&agrave;o v&agrave; c&aacute;c th&agrave;nh phần của vi khuẩn</p>'),(4,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',560000.000,5,1,'<p>Sữa rửa mặt Jack Black Balancing Foam Cleanser kh&ocirc;ng chứa sulfate v&agrave; gi&agrave;u chất chống oxy h&oacute;a thẩm thấu s&acirc;u v&agrave;o lỗ ch&acirc;n l&ocirc;ng để kiểm so&aacute;t mụn v&agrave; những đốm đen. Dạng bọt kh&ocirc;ng chứa dầu gi&uacute;p ngăn ngừa sự h&igrave;nh th&agrave;nh mụn v&agrave; đốm đen mới m&agrave; kh&ocirc;ng l&agrave;m kh&ocirc; da.</p>\r\n\r\n<p>Sự kết hợp độc đ&aacute;o của axit Salicylic v&agrave; Lactic, chiết xuất từ củ nghệ, L&ocirc; hội v&agrave; Bisabolol gi&uacute;p cải thiện v&agrave; l&agrave;m mịn kết cấu da, gi&uacute;p l&agrave;m dịu da bị vi&ecirc;m v&agrave; gi&uacute;p da chống lại c&aacute;c t&aacute;c nh&acirc;n g&acirc;y mụn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://res.cloudinary.com/dygnuycoh/image/upload/v1/fukimedia/ckeditors/products/2023/04/20/srm-jack-black-balancing_xuouak\" style=\"height:636px; width:635px\" /></p>\r\n\r\n<p><strong>Đặc t&iacute;nh:</strong></p>\r\n\r\n<ul>\r\n	<li>Kh&ocirc;ng chứa dầu</li>\r\n	<li>Thuần chay</li>\r\n	<li>Kh&ocirc;ng chứa Sulfate</li>\r\n	<li>Kh&ocirc;ng chứa cồn</li>\r\n	<li>Kh&ocirc;ng&nbsp;chứa Paraben</li>\r\n	<li>Kh&ocirc;ng chứa chất&nbsp;tạo&nbsp;m&agrave;u</li>\r\n	<li>Kh&ocirc;ng chứa hương liệu</li>\r\n	<li>B&aacute;c sĩ da liễu đ&atilde; thử nghiệm</li>\r\n	<li>Kh&ocirc;ng độc hại</li>\r\n</ul>\r\n\r\n<h3>Th&agrave;nh phần ch&iacute;nh</h3>\r\n\r\n<ul>\r\n	<li><strong>0,5% Axit salicylic:</strong>&nbsp;Loại bỏ hầu hết c&aacute;c vết th&acirc;m do mụn v&agrave; mụn đầu đen, đồng thời gi&uacute;p ngăn ngừa mụn h&igrave;nh th&agrave;nh.</li>\r\n	<li><strong>Chiết xuất từ củ nghệ:</strong>&nbsp;Được sử dụng trong y học Trung Quốc v&agrave; Ấn Độ hơn 2500 năm, củ nghệ l&agrave; một loại củ thực vật c&oacute; t&aacute;c dụng th&iacute;ch nghi mạnh mẽ v&agrave; l&agrave; chất chống oxy h&oacute;a tự nhi&ecirc;n gi&uacute;p da chống lại c&aacute;c t&aacute;c nh&acirc;n b&ecirc;n ngo&agrave;i g&acirc;y stress. L&agrave; một liệu ph&aacute;p tự nhi&ecirc;n được biết đến gi&uacute;p l&agrave;m sạch nhẹ nh&agrave;ng, nu&ocirc;i dưỡng v&agrave; c&acirc;n bằng da.</li>\r\n	<li><strong>Axit Lactic:</strong>&nbsp;Nhẹ nh&agrave;ng lột tế b&agrave;o chết gi&uacute;p l&agrave;n da mềm mại v&agrave; đồng đều hơn, đồng thời cải thiện độ ẩm của da.</li>\r\n	<li><strong>L&ocirc; hội:</strong>&nbsp;Một loại chất th&iacute;ch nghi c&oacute; t&aacute;c dụng l&agrave;m dịu gi&uacute;p da đ&aacute;p ứng với c&aacute;c t&aacute;c nh&acirc;n g&acirc;y stress c&oacute; thể g&acirc;y ra phản ứng vi&ecirc;m.</li>\r\n	<li><strong>Bisabolol:</strong>&nbsp;Được biết đến gi&uacute;p đ&aacute;nh bại vi khuẩn c&oacute; hại v&agrave; gi&uacute;p giảm thiểu sự xuất hiện của đỏ da v&agrave; l&agrave;m dịu da.</li>\r\n</ul>\r\n\r\n<h3>C&aacute;ch sử dụng</h3>\r\n\r\n<p>Cho 1-2 lần bơm ra tay, thoa l&ecirc;n da mặt ẩm v&agrave; m&aacute;t xa theo chuyển động tr&ograve;n.&nbsp;Rửa kỹ bằng nước ấm v&agrave; vỗ nhẹ cho kh&ocirc;.&nbsp;Sử dụng buổi s&aacute;ng v&agrave; buổi tối.</p>');
/*!40000 ALTER TABLE `shops_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_review`
--

DROP TABLE IF EXISTS `shops_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `rate` smallint NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_review_product_id_user_id_0b25d746_uniq` (`product_id`,`user_id`),
  KEY `shops_review_user_id_360896f9_fk_shops_user_id` (`user_id`),
  CONSTRAINT `shops_review_product_id_32e1afbb_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`),
  CONSTRAINT `shops_review_user_id_360896f9_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_review`
--

LOCK TABLES `shops_review` WRITE;
/*!40000 ALTER TABLE `shops_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_shop`
--

DROP TABLE IF EXISTS `shops_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_shop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `shops_shop_user_id_84155b5b_fk_shops_user_id` (`user_id`),
  CONSTRAINT `shops_shop_user_id_84155b5b_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_shop`
--

LOCK TABLES `shops_shop` WRITE;
/*!40000 ALTER TABLE `shops_shop` DISABLE KEYS */;
INSERT INTO `shops_shop` VALUES (1,1,'2023-04-18 19:31:47.547047','2023-04-22 02:32:38.584858','Classic Store',1,NULL,''),(2,1,'2023-04-18 22:26:35.611020','2023-04-18 22:26:35.611020','Unilever',1,'<p>Chăm S&oacute;c Gia Đ&igrave;nh N&acirc;ng Tầm Cuộc Sống</p>',NULL);
/*!40000 ALTER TABLE `shops_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_user`
--

DROP TABLE IF EXISTS `shops_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_user`
--

LOCK TABLES `shops_user` WRITE;
/*!40000 ALTER TABLE `shops_user` DISABLE KEYS */;
INSERT INTO `shops_user` VALUES (1,'pbkdf2_sha256$600000$hGkEyTHYw9Qu3zg1eVqm22$Osq7lDqsZ5TyeGh15PFkK2pnQxUJ5NuugxIAaZ59W98=','2023-04-18 16:37:18.942558',1,'admin','','','admin@gmail.com',1,1,'2023-04-18 16:34:38.170462',NULL);
/*!40000 ALTER TABLE `shops_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_user_groups`
--

DROP TABLE IF EXISTS `shops_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_user_groups_user_id_group_id_96e497f3_uniq` (`user_id`,`group_id`),
  KEY `shops_user_groups_group_id_67ba31aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `shops_user_groups_group_id_67ba31aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `shops_user_groups_user_id_0b76fe3f_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_user_groups`
--

LOCK TABLES `shops_user_groups` WRITE;
/*!40000 ALTER TABLE `shops_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_user_user_permissions`
--

DROP TABLE IF EXISTS `shops_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_user_user_permissions_user_id_permission_id_4f52b5d1_uniq` (`user_id`,`permission_id`),
  KEY `shops_user_user_perm_permission_id_0d33e52c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `shops_user_user_perm_permission_id_0d33e52c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `shops_user_user_permissions_user_id_8755d56a_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_user_user_permissions`
--

LOCK TABLES `shops_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `shops_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-23 12:56:23
