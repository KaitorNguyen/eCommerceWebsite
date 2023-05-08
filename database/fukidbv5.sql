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
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'Customer'),(1,'Employee'),(2,'Seller');
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add category',4,'add_category'),(14,'Can change category',4,'change_category'),(15,'Can delete category',4,'delete_category'),(16,'Can view category',4,'view_category'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add shop',8,'add_shop'),(30,'Can change shop',8,'change_shop'),(31,'Can delete shop',8,'delete_shop'),(32,'Can view shop',8,'view_shop'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add application',10,'add_application'),(38,'Can change application',10,'change_application'),(39,'Can delete application',10,'delete_application'),(40,'Can view application',10,'view_application'),(41,'Can add access token',11,'add_accesstoken'),(42,'Can change access token',11,'change_accesstoken'),(43,'Can delete access token',11,'delete_accesstoken'),(44,'Can view access token',11,'view_accesstoken'),(45,'Can add grant',12,'add_grant'),(46,'Can change grant',12,'change_grant'),(47,'Can delete grant',12,'delete_grant'),(48,'Can view grant',12,'view_grant'),(49,'Can add refresh token',13,'add_refreshtoken'),(50,'Can change refresh token',13,'change_refreshtoken'),(51,'Can delete refresh token',13,'delete_refreshtoken'),(52,'Can view refresh token',13,'view_refreshtoken'),(53,'Can add id token',14,'add_idtoken'),(54,'Can change id token',14,'change_idtoken'),(55,'Can delete id token',14,'delete_idtoken'),(56,'Can view id token',14,'view_idtoken'),(57,'Can add comment',15,'add_comment'),(58,'Can change comment',15,'change_comment'),(59,'Can delete comment',15,'delete_comment'),(60,'Can view comment',15,'view_comment'),(61,'Can add review',16,'add_review'),(62,'Can change review',16,'change_review'),(63,'Can delete review',16,'delete_review'),(64,'Can view review',16,'view_review'),(65,'Can add notification',17,'add_notification'),(66,'Can change notification',17,'change_notification'),(67,'Can delete notification',17,'delete_notification'),(68,'Can view notification',17,'view_notification'),(69,'Can add payment method',18,'add_paymentmethod'),(70,'Can change payment method',18,'change_paymentmethod'),(71,'Can delete payment method',18,'delete_paymentmethod'),(72,'Can view payment method',18,'view_paymentmethod'),(73,'Can add cart',19,'add_cart'),(74,'Can change cart',19,'change_cart'),(75,'Can delete cart',19,'delete_cart'),(76,'Can view cart',19,'view_cart'),(77,'Can add order detail',20,'add_orderdetail'),(78,'Can change order detail',20,'change_orderdetail'),(79,'Can delete order detail',20,'delete_orderdetail'),(80,'Can view order detail',20,'view_orderdetail'),(81,'Can add order',21,'add_order'),(82,'Can change order',21,'change_order'),(83,'Can delete order',21,'delete_order'),(84,'Can view order',21,'view_order'),(85,'Can add cart item',22,'add_cartitem'),(86,'Can change cart item',22,'change_cartitem'),(87,'Can delete cart item',22,'delete_cartitem'),(88,'Can view cart item',22,'view_cartitem');
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
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_shops_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-18 16:38:18.340147','1','Health & Beauty',1,'[{\"added\": {}}]',4,1),(2,'2023-04-18 16:38:45.759019','2','Men\'s Fashion & Accessories',1,'[{\"added\": {}}]',4,1),(3,'2023-04-18 16:38:58.049113','3','Women\'s Fashion & Accessories',1,'[{\"added\": {}}]',4,1),(4,'2023-04-18 16:39:21.416678','4','Sports & Travel',1,'[{\"added\": {}}]',4,1),(5,'2023-04-18 19:31:47.548050','1','Classic Store',1,'[{\"added\": {}}]',8,1),(6,'2023-04-18 19:46:19.224959','5','Body Soap & Shower Gel',1,'[{\"added\": {}}]',4,1),(7,'2023-04-18 19:50:14.135917','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',1,'[{\"added\": {}}]',9,1),(8,'2023-04-18 21:18:38.468278','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,1),(9,'2023-04-18 21:19:55.277562','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,1),(10,'2023-04-18 22:18:49.566805','2','Xả Khô Nashi Instant Mask Styling 150ML',1,'[{\"added\": {}}]',9,1),(11,'2023-04-18 22:26:35.611020','2','Unilever',1,'[{\"added\": {}}]',8,1),(12,'2023-04-18 22:29:03.787503','3','Sữa Tắm Lifebuoy Detox Diệt Khuẩn Trà Xanh & Khổ Qua 800G chiết xuất từ thiên nhiên ngừa mùi cơ thể và sạch sâu khỏi bụi mịn (Chai)',1,'[{\"added\": {}}]',9,1),(13,'2023-04-19 20:53:02.441040','4','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml',1,'[{\"added\": {}}]',9,1),(14,'2023-04-19 20:58:44.662640','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(15,'2023-04-19 20:58:58.599242','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(16,'2023-04-19 20:59:42.821250','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,1),(17,'2023-04-19 21:08:05.393840','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(18,'2023-04-19 21:08:15.412000','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(19,'2023-04-19 21:09:34.942200','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,1),(20,'2023-04-19 21:11:35.988806','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(21,'2023-04-19 21:12:56.657341','1','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml',2,'[{\"changed\": {\"fields\": [\"Image\", \"description\"]}}]',9,1),(22,'2023-04-19 21:13:39.858030','2','Xả Khô Nashi Instant Mask Styling 150ML',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(23,'2023-04-19 21:15:18.319181','2','Xả Khô Nashi Instant Mask Styling 150ML',2,'[{\"changed\": {\"fields\": [\"Image\", \"description\"]}}]',9,1),(24,'2023-04-19 21:16:44.914985','3','Sữa Tắm Lifebuoy Detox Diệt Khuẩn Trà Xanh & Khổ Qua 800G chiết xuất từ thiên nhiên ngừa mùi cơ thể và sạch sâu khỏi bụi mịn (Chai)',2,'[{\"changed\": {\"fields\": [\"Image\", \"description\"]}}]',9,1),(25,'2023-04-19 21:16:55.666784','3','Sữa Tắm Lifebuoy Detox Diệt Khuẩn Trà Xanh & Khổ Qua 800G chiết xuất từ thiên nhiên ngừa mùi cơ thể và sạch sâu khỏi bụi mịn (Chai)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(26,'2023-04-19 21:17:10.209968','4','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(27,'2023-04-19 21:17:45.472536','4','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml',2,'[{\"changed\": {\"fields\": [\"Image\", \"description\"]}}]',9,1),(28,'2023-05-02 09:50:15.553677','1','Employee',1,'[{\"added\": {}}]',2,1),(29,'2023-05-02 09:50:29.080803','2','Seller',1,'[{\"added\": {}}]',2,1),(30,'2023-05-02 09:50:38.232688','3','Customer',1,'[{\"added\": {}}]',2,1),(31,'2023-05-02 09:51:20.338241','2','employee',1,'[{\"added\": {}}]',5,1),(32,'2023-05-06 10:15:50.206325','1','admin',2,'[{\"changed\": {\"fields\": [\"Password\", \"Groups\", \"Avatar\"]}}]',5,1),(33,'2023-05-08 10:03:26.898791','1','Trực tiếp',1,'[{\"added\": {}}]',18,1),(34,'2023-05-08 10:03:35.640739','2','Momo',1,'[{\"added\": {}}]',18,1),(35,'2023-05-08 10:03:42.801579','3','ZaloPay',1,'[{\"added\": {}}]',18,1),(36,'2023-05-08 10:04:19.090264','4','PayPal',1,'[{\"added\": {}}]',18,1),(37,'2023-05-08 10:04:59.108570','5','Stripe',1,'[{\"added\": {}}]',18,1);
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
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'contenttypes','contenttype'),(11,'oauth2_provider','accesstoken'),(10,'oauth2_provider','application'),(12,'oauth2_provider','grant'),(14,'oauth2_provider','idtoken'),(13,'oauth2_provider','refreshtoken'),(19,'orders','cart'),(22,'orders','cartitem'),(21,'orders','order'),(20,'orders','orderdetail'),(18,'orders','paymentmethod'),(7,'sessions','session'),(4,'shops','category'),(15,'shops','comment'),(17,'shops','notification'),(9,'shops','product'),(16,'shops','review'),(8,'shops','shop'),(5,'shops','user');
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
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-18 16:29:25.550324'),(2,'contenttypes','0002_remove_content_type_name','2023-04-18 16:29:25.572980'),(3,'auth','0001_initial','2023-04-18 16:29:25.683428'),(4,'auth','0002_alter_permission_name_max_length','2023-04-18 16:29:25.703435'),(5,'auth','0003_alter_user_email_max_length','2023-04-18 16:29:25.707559'),(6,'auth','0004_alter_user_username_opts','2023-04-18 16:29:25.711248'),(7,'auth','0005_alter_user_last_login_null','2023-04-18 16:29:25.715248'),(8,'auth','0006_require_contenttypes_0002','2023-04-18 16:29:25.718592'),(9,'auth','0007_alter_validators_add_error_messages','2023-04-18 16:29:25.722602'),(10,'auth','0008_alter_user_username_max_length','2023-04-18 16:29:25.726262'),(11,'auth','0009_alter_user_last_name_max_length','2023-04-18 16:29:25.730264'),(12,'auth','0010_alter_group_name_max_length','2023-04-18 16:29:25.740059'),(13,'auth','0011_update_proxy_permissions','2023-04-18 16:29:25.744063'),(14,'auth','0012_alter_user_first_name_max_length','2023-04-18 16:29:25.748061'),(15,'shops','0001_initial','2023-04-18 16:29:25.859700'),(16,'admin','0001_initial','2023-04-18 16:31:12.151343'),(17,'admin','0002_logentry_remove_auto_add','2023-04-18 16:31:12.157121'),(18,'admin','0003_logentry_add_action_flag_choices','2023-04-18 16:31:12.161121'),(19,'sessions','0001_initial','2023-04-18 16:31:12.180425'),(20,'shops','0002_shop','2023-04-18 17:11:54.157355'),(21,'shops','0003_alter_shop_user_product','2023-04-18 19:14:42.478953'),(22,'shops','0004_product_description_shop_description','2023-04-18 21:16:13.395174'),(23,'shops','0005_alter_product_shop','2023-04-18 22:05:13.366629'),(24,'shops','0006_user_avatar','2023-04-19 03:22:07.502616'),(25,'shops','0007_shop_avatar_alter_product_unique_together','2023-04-19 22:51:26.210359'),(26,'oauth2_provider','0001_initial','2023-04-22 02:47:08.240540'),(27,'oauth2_provider','0002_auto_20190406_1805','2023-04-22 02:47:08.271837'),(28,'oauth2_provider','0003_auto_20201211_1314','2023-04-22 02:47:08.318650'),(29,'oauth2_provider','0004_auto_20200902_2022','2023-04-22 02:47:08.521882'),(30,'oauth2_provider','0005_auto_20211222_2352','2023-04-22 02:47:08.553173'),(31,'oauth2_provider','0006_alter_application_client_secret','2023-04-22 02:47:08.584370'),(32,'shops','0008_review_comment','2023-04-22 08:24:46.146027'),(33,'shops','0009_alter_comment_unique_together','2023-04-22 19:36:45.739827'),(34,'shops','0010_user_is_verified_user_role_notification','2023-05-02 09:49:17.153662'),(35,'orders','0001_initial','2023-05-06 10:32:31.441436'),(36,'orders','0002_order_alter_cart_user_orderdetail','2023-05-06 10:47:25.944431'),(37,'orders','0003_remove_cart_created_date_remove_cart_product_and_more','2023-05-08 09:59:12.971700'),(38,'orders','0004_paymentmethod_active','2023-05-08 10:07:07.878049');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `django_session` VALUES ('5i060zd6au3pytkgr7mo1rxhsj6rb4l2','.eJxVjEEOwiAQRe_C2hBAwNal-56BzAwzUjU0Ke3KeHdD0oVu_3vvv1WCfStpb7ymOaursur0uyHQk2sH-QH1vmha6rbOqLuiD9r0tGR-3Q7376BAK73OFDybyC6Ck4wAITCaaEebvRjjCIInkQENkzDFM9I4WAuOjKC7qM8XFXw5MA:1pooKU:UqE1RDmIHo43XVOqjC_8hGnb8qjeRp5Ge7vady0CGno','2023-05-02 16:37:18.944599'),('l0uuxakupx0jtrba0h1t8otha9wkpgtq','.eJxVjEEOwiAQRe_C2hBAwNal-56BzAwzUjU0Ke3KeHdD0oVu_3vvv1WCfStpb7ymOaursur0uyHQk2sH-QH1vmha6rbOqLuiD9r0tGR-3Q7376BAK73OFDybyC6Ck4wAITCaaEebvRjjCIInkQENkzDFM9I4WAuOjKC7qM8XFXw5MA:1ptmdv:JO-Mw3xMBcFCGrOOb4LYv6wuIVkE96nKhle6PGfqXso','2023-05-16 09:49:55.942474'),('yn1o7ep2irgjzzkjzfniws19y1pfb3dv','.eJxVjEEOgjAQRe_StWnaUujg0j1naDozHYsaSCisjHcXEha6_e-9_1YxbWuJW81LHFldlVWX3w0TPfN0AH6k6T5rmqd1GVEfij5p1cPM-XU73b-DkmrZa3LQIoAYQ21vPYt0GLz0AXPjW2AI1oIgOiHPbI1PGaUzrgPaURPU5wvoRzfl:1pvExJ:sJQ37LjIUHTIRisfLlOWc1Jm6jw5Ts7szx6eaUbUWlY','2023-05-20 10:15:57.868940');
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
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'bGXTv10SOAtoGHhuAXh4LOPmm7Pt0v','2023-04-22 13:01:56.246931','read write',1,1,'2023-04-22 03:01:56.247933','2023-04-22 03:01:56.247933',NULL,NULL),(2,'Bg1XOLxI7kXBmTavKe8TlP9RDgWUm7','2023-04-23 15:44:25.317429','read write',1,1,'2023-04-23 05:44:25.318426','2023-04-23 05:44:25.318426',NULL,NULL),(3,'NMpuJdqFbvo59oniBckC9fKVKoqnv3','2023-05-02 19:56:36.203663','read write',1,3,'2023-05-02 09:56:36.204653','2023-05-02 09:56:36.204653',NULL,NULL),(4,'ShekijO900I2ErORn0TnStyPmAnfjC','2023-05-02 19:59:20.171407','read write',1,2,'2023-05-02 09:59:20.171407','2023-05-02 09:59:20.171407',NULL,NULL),(5,'tnXJodIdNmlq4ULPVizqdWCwGrlPCu','2023-05-02 20:01:28.676432','read write',1,3,'2023-05-02 10:01:28.676432','2023-05-02 10:01:28.676432',NULL,NULL),(6,'TvXEeZvpF98L3N2vdnPzoERiOcrMoy','2023-05-02 20:03:37.077166','read write',1,4,'2023-05-02 10:03:37.077166','2023-05-02 10:03:37.077166',NULL,NULL),(7,'8XPgrqSOTaOdUQ9z613XPHUPpgP5q0','2023-05-02 20:04:00.247018','read write',1,5,'2023-05-02 10:04:00.248015','2023-05-02 10:04:00.248015',NULL,NULL),(8,'KF5MUMYtAXl2j9vHRZjDzRtemvlRQZ','2023-05-02 20:06:31.019255','read write',1,1,'2023-05-02 10:06:31.020254','2023-05-02 10:06:31.020254',NULL,NULL),(9,'2PLDYTISbzj5BE8yW0vMyuJ3I5j8yk','2023-05-02 20:07:55.315579','read write',1,4,'2023-05-02 10:07:55.315579','2023-05-02 10:07:55.315579',NULL,NULL),(10,'8LrHdNt7gISnWA4VrftHE4enKLxzm9','2023-05-02 20:09:01.131346','read write',1,5,'2023-05-02 10:09:01.131346','2023-05-02 10:09:01.131346',NULL,NULL),(11,'vp6G1hxUYp5wOCx2qGr9BJj5c1MOqp','2023-05-02 20:10:25.641435','read write',1,1,'2023-05-02 10:10:25.641435','2023-05-02 10:10:25.641435',NULL,NULL),(12,'j0gBoFUoi63Rj2083BniPx4P4VRDZe','2023-05-02 20:14:09.095440','read write',1,4,'2023-05-02 10:14:09.095440','2023-05-02 10:14:09.095440',NULL,NULL);
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
  `client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
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
  `jti` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'cAj6msTjxgEj5TVtqZw58p59JU4A7w',1,1,1,'2023-04-22 03:01:56.251439','2023-04-22 03:01:56.251439',NULL),(2,'JR8JjqN1QmCMZjieScYVw3o6OHNqLD',2,1,1,'2023-04-23 05:44:25.319871','2023-04-23 05:44:25.319871',NULL),(3,'yELsZCTEIjYGiUvyXSFdc5FFxb6yCu',3,1,3,'2023-05-02 09:56:36.206646','2023-05-02 09:56:36.206646',NULL),(4,'Q6vkJOZh9FURrzKm62cJcp1j8y9Xfu',4,1,2,'2023-05-02 09:59:20.171915','2023-05-02 09:59:20.172695',NULL),(5,'nyRkARKpUD2Sr8eArxghbSGEVLv4fX',5,1,3,'2023-05-02 10:01:28.677506','2023-05-02 10:01:28.677506',NULL),(6,'jdf0BAXbDNa81Q8JmVpsIMrgIf8T64',6,1,4,'2023-05-02 10:03:37.078153','2023-05-02 10:03:37.078153',NULL),(7,'q6Nl3gH4uQp66KAoD0rCSnJIslDBDL',7,1,5,'2023-05-02 10:04:00.248015','2023-05-02 10:04:00.248015',NULL),(8,'3eCpqSbCVIjbuHB4lJBXngvItzcQFK',8,1,1,'2023-05-02 10:06:31.021251','2023-05-02 10:06:31.021251',NULL),(9,'Ueuhk9ptLOsmafZQhWEmwZmRiCkIMR',9,1,4,'2023-05-02 10:07:55.316576','2023-05-02 10:07:55.316576',NULL),(10,'7AemVuIZuvcd5I5YjsfUm6BLzScTt5',10,1,5,'2023-05-02 10:09:01.132107','2023-05-02 10:09:01.132107',NULL),(11,'jJqvpVhM2iTTgSbTJcHauFc3INYQUO',11,1,1,'2023-05-02 10:10:25.642429','2023-05-02 10:10:25.642429',NULL),(12,'JZ92XBEjOolHlCHW9NqgroGLNaR3f1',12,1,4,'2023-05-02 10:14:09.096439','2023-05-02 10:14:09.096439',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_cart`
--

DROP TABLE IF EXISTS `orders_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_cart_user_id_121a069e_fk_shops_user_id` (`user_id`),
  CONSTRAINT `orders_cart_user_id_121a069e_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_cart`
--

LOCK TABLES `orders_cart` WRITE;
/*!40000 ALTER TABLE `orders_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_cartitem`
--

DROP TABLE IF EXISTS `orders_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,3) NOT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_cartitem_cart_id_529df5fa_fk_orders_cart_id` (`cart_id`),
  KEY `orders_cartitem_product_id_55063ee7_fk_shops_product_id` (`product_id`),
  CONSTRAINT `orders_cartitem_cart_id_529df5fa_fk_orders_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `orders_cart` (`id`),
  CONSTRAINT `orders_cartitem_product_id_55063ee7_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_cartitem`
--

LOCK TABLES `orders_cartitem` WRITE;
/*!40000 ALTER TABLE `orders_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` decimal(10,3) NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_payment_method_id_532d9073_fk_orders_pa` (`payment_method_id`),
  KEY `orders_order_user_id_e9b59eb1_fk_shops_user_id` (`user_id`),
  CONSTRAINT `orders_order_payment_method_id_532d9073_fk_orders_pa` FOREIGN KEY (`payment_method_id`) REFERENCES `orders_paymentmethod` (`id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderdetail`
--

DROP TABLE IF EXISTS `orders_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,3) NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderdetail_order_id_8d02dd1f_fk_orders_order_id` (`order_id`),
  KEY `orders_orderdetail_product_id_3ecd225e_fk_shops_product_id` (`product_id`),
  CONSTRAINT `orders_orderdetail_order_id_8d02dd1f_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderdetail_product_id_3ecd225e_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderdetail`
--

LOCK TABLES `orders_orderdetail` WRITE;
/*!40000 ALTER TABLE `orders_orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_paymentmethod`
--

DROP TABLE IF EXISTS `orders_paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_paymentmethod` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_paymentmethod`
--

LOCK TABLES `orders_paymentmethod` WRITE;
/*!40000 ALTER TABLE `orders_paymentmethod` DISABLE KEYS */;
INSERT INTO `orders_paymentmethod` VALUES (1,'Trực tiếp',1),(2,'Momo',1),(3,'ZaloPay',1),(4,'PayPal',1),(5,'Stripe',1);
/*!40000 ALTER TABLE `orders_paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_category`
--

DROP TABLE IF EXISTS `shops_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_category`
--

LOCK TABLES `shops_category` WRITE;
/*!40000 ALTER TABLE `shops_category` DISABLE KEYS */;
INSERT INTO `shops_category` VALUES (5,'Body Soap & Shower Gel'),(8,'Book'),(6,'Electronic Device'),(2,'Fashion & Accessories'),(3,'Food'),(1,'Health & Beauty'),(7,'Pet'),(4,'Sports & Travel');
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
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_comment`
--

LOCK TABLES `shops_comment` WRITE;
/*!40000 ALTER TABLE `shops_comment` DISABLE KEYS */;
INSERT INTO `shops_comment` VALUES (1,1,'2023-05-02 10:06:07.717427','2023-05-02 10:06:07.717427','Sản phẩm rất tốt, giao hàng nhanh',1,NULL,5),(2,1,'2023-05-02 10:07:36.894312','2023-05-02 10:07:36.894312','Cảm ơn bạn',1,1,1),(3,1,'2023-05-02 10:08:49.327703','2023-05-02 10:08:49.327703','Sản phẩm giữ mùi hương lâu không bạn?',1,1,4),(4,1,'2023-05-02 10:10:14.304590','2023-05-02 10:10:14.304590','Cũng lâu đó :))',1,3,5),(5,1,'2023-05-02 10:12:29.435665','2023-05-02 10:12:29.435665','Sản phẩm sẽ lưu hương khoảng 2 đến 3 tiếng.',1,3,1),(6,1,'2023-05-02 10:15:11.603661','2023-05-02 10:15:11.603661','Sản phẩm rất tuyệt',1,NULL,4),(7,1,'2023-05-02 10:15:32.644276','2023-05-02 10:15:32.644276','Giao hàng nhanh',2,NULL,4);
/*!40000 ALTER TABLE `shops_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_notification`
--

DROP TABLE IF EXISTS `shops_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender` int NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `recipient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shops_notification_recipient_id_43e53350_fk_shops_user_id` (`recipient_id`),
  CONSTRAINT `shops_notification_recipient_id_43e53350_fk_shops_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_notification`
--

LOCK TABLES `shops_notification` WRITE;
/*!40000 ALTER TABLE `shops_notification` DISABLE KEYS */;
INSERT INTO `shops_notification` VALUES (1,3,'Đăng kí trở thành nhà bán hàng - seller','2023-05-02 09:52:08.915702',1),(2,3,'Đăng kí trở thành nhà bán hàng - seller','2023-05-02 09:52:08.917402',2),(3,2,'Đã xác nhận tài khoản seller thành công.','2023-05-02 09:59:42.493963',3);
/*!40000 ALTER TABLE `shops_notification` ENABLE KEYS */;
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,3) NOT NULL,
  `category_id` bigint NOT NULL,
  `shop_id` bigint NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_product_name_shop_id_62390af0_uniq` (`name`,`shop_id`),
  KEY `shops_product_category_id_75a38fc1_fk_shops_category_id` (`category_id`),
  KEY `shops_product_shop_id_b4feef5b_fk_shops_shop_id` (`shop_id`),
  CONSTRAINT `shops_product_category_id_75a38fc1_fk_shops_category_id` FOREIGN KEY (`category_id`) REFERENCES `shops_category` (`id`),
  CONSTRAINT `shops_product_shop_id_b4feef5b_fk_shops_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `shops_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_product`
--

LOCK TABLES `shops_product` WRITE;
/*!40000 ALTER TABLE `shops_product` DISABLE KEYS */;
INSERT INTO `shops_product` VALUES (1,1,'2023-04-18 19:50:14.133922','2023-04-19 21:12:56.095996','Sữa Tắm Nam Bath & Body Works Men’s Collection 295ml','fukimedia/products/2023/04/sua-tam-bbw-noir-768x768_fksd5e',250000.000,5,1,'<p>Sản phẩm sữa tắm Bath &amp; Body Works l&agrave; một trong những thương hiệu rất lớn ở Mỹ, sữa tắm với c&ocirc;ng dụng gi&uacute;p l&agrave;m sạch, cung cấp độ ẩm v&agrave; lưu lại hương thơm cho m&aacute;i t&oacute;c v&agrave; l&agrave;n da khỏe mạnh. Sản phẩm c&ograve;n rất tiện lợi cho nam v&igrave; chức năng 2 trong 1 vừa tắm to&agrave;n th&acirc;n v&agrave; gội sạch, vừa đem lại hương thơm m&aacute;t cho m&aacute;i t&oacute;c.</p>\r\n\r\n<ul>\r\n	<li>Sản phẩm rất gọn nhẹ đơn giản nhưng chất lượng. Đặc biệt sản phẩm giữ m&ugrave;i hương rất l&acirc;u, đem lại cho bạn một ng&agrave;y d&agrave;i thật năng động v&agrave; thoải m&aacute;i.</li>\r\n	<li>Ngo&agrave;i ra sản phẩm c&ograve;n chứa c&aacute;c hạt dưỡng ẩm, nu&ocirc;i dưỡng l&agrave;n da thật săn chắc v&agrave; đem đến vẻ khỏe khoắn cho cơ thể bạn.</li>\r\n</ul>\r\n\r\n<p><strong>Đặc điểm Sữa tắm gội cho nam Bath &amp; Body Works:</strong></p>\r\n\r\n<ul>\r\n	<li>Th&agrave;nh phần chứa những chất dưỡng ẩm, dưỡng da cực kỳ tốt. Gi&uacute;p l&agrave;m mềm da hiệu quả, phục hồi da bị ch&aacute;y nắng, da bạn sẽ khỏe v&agrave; tr&agrave;n đầy sức sống hơn.</li>\r\n	<li>C&ocirc;ng thức chuy&ecirc;n biệt nu&ocirc;i dưỡng da tối ưu d&agrave;nh cho nam giới.</li>\r\n	<li>Th&iacute;ch hợp với mọi l&agrave;n da. Kể cả da nhạy cảm.</li>\r\n	<li>Dễ dang kết hợp với xịt thơm, lotion c&ugrave;ng d&ograve;ng để dưỡng da tốt hơn &amp; thơm l&acirc;u hơn.</li>\r\n	<li>Đa dạng m&ugrave;i hương: sang trọng tinh tế, năng động ph&oacute;ng kho&aacute;ng, hương trầm nội lực hoặc tươi m&aacute;t cuốn h&uacute;t.</li>\r\n</ul>\r\n\r\n<p><strong>M&ugrave;i hương:</strong></p>\r\n\r\n<p><strong><strong>Noir</strong>:&nbsp;</strong>Bạch đậu khấu đen, vani kh&oacute;i v&agrave; một ch&uacute;t xạ hương. M&ugrave;i hương của sự sang trọng v&agrave; lịch l&atilde;m. Hương thơm ngọt ng&agrave;o của vani v&agrave; th&ecirc;m sự b&iacute; ẩn trọng kh&oacute;i xạ hương tạo th&ecirc;m n&eacute;t quyến rũ, cuốn h&uacute;t cho ph&aacute;i mạnh.</p>\r\n\r\n<p><img alt=\"\" src=\"https://res.cloudinary.com/dygnuycoh/image/upload/v1/fukimedia/ckeditors/products/2023/04/20/bath-body-works-noir_mjystq\" style=\"height:672px; width:672px\" /></p>'),(2,1,'2023-04-18 22:18:49.564769','2023-04-19 21:15:17.662071','Xả Khô Nashi Instant Mask Styling 150ML','fukimedia/products/2023/04/xa-kho-nashi-instant_sjnjji',420000.000,5,1,'<h3><strong>C&Ocirc;NG DỤNG CỦA XẢ KH&Ocirc; NASHI INSTANT MASK STYLING</strong></h3>\r\n\r\n<p>Xả kh&ocirc; Nashi Argan Instant được tạo n&ecirc;n với sự kết hợp của c&aacute;c th&agrave;nh phần tự nhi&ecirc;n v&agrave; sinh học trong đ&oacute; c&oacute; dầu hạt lanh, dầu argan được chứng nhận cung cấp th&ecirc;m độ ẩm. Dầu Argan được coi l&agrave; &ldquo;Gold of Morocco&rdquo;, l&agrave; một loại dầu tự nhi&ecirc;n được đ&aacute;nh gi&aacute; cao trong nhiều thế kỷ. Loại dầu n&agrave;y ng&agrave;y c&agrave;ng phổ biến, n&oacute; mang lại cho m&aacute;i t&oacute;c sự mềm mại độc đ&aacute;o, c&oacute; t&aacute;c dụng chống oxy h&oacute;a v&agrave; cũng c&oacute; thể ngăn ngừa t&oacute;c chẻ ngọn v&agrave; g&atilde;y rụng. Xịt dưỡng ẩm Nashi n&agrave;y cũng chứa dầu hạt lanh, gi&uacute;p t&oacute;c mềm mượt hơn, bảo vệ t&oacute;c chống lại nhiệt v&agrave; c&aacute;c cuộc tấn c&ocirc;ng b&ecirc;n ngo&agrave;i. Tất cả c&aacute;c bao b&igrave; của Nashi đều th&acirc;n thiện với m&ocirc;i trường v&agrave; c&oacute; thể t&aacute;i chế.</p>\r\n\r\n<p><img alt=\"\" src=\"https://res.cloudinary.com/dygnuycoh/image/upload/v1/fukimedia/ckeditors/products/2023/04/20/xa-kho-nashi-instant-2-768x768_jqgxkq\" style=\"height:768px; width:768px\" /></p>\r\n\r\n<p><strong>Đối tượng sử dụng:</strong></p>\r\n\r\n<p>Tuyệt vời cho kh&aacute;ch h&agrave;ng c&oacute; m&aacute;i t&oacute;c x&ugrave; rối, t&oacute;c mỏng v&agrave; nhờn rất nhanh, thường xuy&ecirc;n sử dụng m&aacute;y duỗi t&oacute;c m&agrave; kh&ocirc;ng muốn sử dụng dầu xả ướt.</p>\r\n\r\n<h3><strong>HƯỚNG DẪN SỬ DỤNG XẢ KH&Ocirc; NASHI INSTANT MASK STYLING</strong></h3>\r\n\r\n<p>Sau khi gội đầu v&agrave; lau kh&ocirc; t&oacute;c, xịt sản phẩm l&ecirc;n to&agrave;n bộ phần t&oacute;c cần tạo kiểu, d&ugrave;ng lược chải đều hoặc d&ugrave;ng tay xoa nhẹ nh&agrave;ng cho sản phẩm thấm đều v&agrave;o t&oacute;c, tạo kiểu theo &yacute; muốn.</p>\r\n\r\n<p>Kh&ocirc;ng rửa sạch, chỉ cần l&agrave;m kh&ocirc; t&oacute;c.</p>\r\n\r\n<p>Mẹo: xịt nhẹ l&ecirc;n t&oacute;c kh&ocirc; để kh&ocirc;i phục lại sự ho&agrave;n hảo của kiểu t&oacute;c v&agrave;o buổi s&aacute;ng.</p>\r\n\r\n<p>Sử dụng kết hợp với dầu gội cặp nashi, dầu dưỡng t&oacute;c Nashi Argan Oil, v&agrave; dầu hấp t&oacute;c Nashi Argan Deep Infusion để c&oacute; hiệu quả tốt nhất</p>\r\n\r\n<p><strong>Hướng dẫn bảo quản:</strong></p>\r\n\r\n<p>- Để sản phẩm ở nhiệt độ ph&ograve;ng,tho&aacute;ng m&aacute;t.</p>\r\n\r\n<p>- Đậy k&iacute;n nắp sau khi sử dụng.</p>\r\n\r\n<p>- Tr&aacute;nh &aacute;nh s&aacute;ng hoặc nơi gần nguồn điện,ẩm mốc.</p>\r\n\r\n<p>- Tr&aacute;nh xa tầm tay trẻ em.</p>'),(3,1,'2023-04-18 22:29:03.786499','2023-04-19 21:16:55.054195','Sữa Tắm Lifebuoy Detox Diệt Khuẩn Trà Xanh & Khổ Qua 800G chiết xuất từ thiên nhiên ngừa mùi cơ thể và sạch sâu khỏi bụi mịn (Chai)','fukimedia/products/2023/04/LifebuoyMatcha_tmwuuc',195000.000,5,2,'<p><strong>Sữa Tắm Lifebuoy Detox Diệt Khuẩn Tr&agrave; Xanh &amp; Khổ Qua 800G chiết xuất từ thi&ecirc;n nhi&ecirc;n ngừa m&ugrave;i cơ thể v&agrave; sạch s&acirc;u khỏi bụi mịn (Chai)</strong></p>\r\n\r\n<p>- Hằng ng&agrave;y l&agrave;n da của ch&uacute;ng ta phải tiếp x&uacute;c với v&ocirc; số bụi bẩn &ocirc; nhiễm v&agrave; vi khuẩn, đặc biệt l&agrave; bụi si&ecirc;u mịn PM2.5.</p>\r\n\r\n<p>- C&ocirc;ng thức với 2 th&agrave;nh phần 100% từ thi&ecirc;n nhi&ecirc;n, gồm Matcha chống oxy h&oacute;a v&agrave; Khổ qua diệt khuẩn</p>\r\n\r\n<p>- L&agrave;m sạch s&acirc;u, detox loại bỏ bụi &ocirc; nhiễm si&ecirc;u mịn PM2.5 v&agrave; vi khuẩn hằng ng&agrave;y</p>\r\n\r\n<p>- Loại bỏ những nguy&ecirc;n nh&acirc;n g&acirc;y n&ecirc;n c&aacute;c vấn đề về da như ngứa, ửng đỏ, nổi mụn</p>\r\n\r\n<p>- Lifebuoy l&agrave; nh&atilde;n hiệu sạch khuẩn số 1 thế giới</p>\r\n\r\n<p>- Ph&acirc;n tử ion bạc gi&uacute;p ph&aacute; vỡ lớp vỏ tế b&agrave;o v&agrave; c&aacute;c th&agrave;nh phần của vi khuẩn</p>'),(4,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Sữa rửa mặt Jack Black Balancing Foam Cleanser 150ml','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',560000.000,5,1,'<p>Sữa rửa mặt Jack Black Balancing Foam Cleanser kh&ocirc;ng chứa sulfate v&agrave; gi&agrave;u chất chống oxy h&oacute;a thẩm thấu s&acirc;u v&agrave;o lỗ ch&acirc;n l&ocirc;ng để kiểm so&aacute;t mụn v&agrave; những đốm đen. Dạng bọt kh&ocirc;ng chứa dầu gi&uacute;p ngăn ngừa sự h&igrave;nh th&agrave;nh mụn v&agrave; đốm đen mới m&agrave; kh&ocirc;ng l&agrave;m kh&ocirc; da.</p>\r\n\r\n<p>Sự kết hợp độc đ&aacute;o của axit Salicylic v&agrave; Lactic, chiết xuất từ củ nghệ, L&ocirc; hội v&agrave; Bisabolol gi&uacute;p cải thiện v&agrave; l&agrave;m mịn kết cấu da, gi&uacute;p l&agrave;m dịu da bị vi&ecirc;m v&agrave; gi&uacute;p da chống lại c&aacute;c t&aacute;c nh&acirc;n g&acirc;y mụn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://res.cloudinary.com/dygnuycoh/image/upload/v1/fukimedia/ckeditors/products/2023/04/20/srm-jack-black-balancing_xuouak\" style=\"height:636px; width:635px\" /></p>\r\n\r\n<p><strong>Đặc t&iacute;nh:</strong></p>\r\n\r\n<ul>\r\n	<li>Kh&ocirc;ng chứa dầu</li>\r\n	<li>Thuần chay</li>\r\n	<li>Kh&ocirc;ng chứa Sulfate</li>\r\n	<li>Kh&ocirc;ng chứa cồn</li>\r\n	<li>Kh&ocirc;ng&nbsp;chứa Paraben</li>\r\n	<li>Kh&ocirc;ng chứa chất&nbsp;tạo&nbsp;m&agrave;u</li>\r\n	<li>Kh&ocirc;ng chứa hương liệu</li>\r\n	<li>B&aacute;c sĩ da liễu đ&atilde; thử nghiệm</li>\r\n	<li>Kh&ocirc;ng độc hại</li>\r\n</ul>\r\n\r\n<h3>Th&agrave;nh phần ch&iacute;nh</h3>\r\n\r\n<ul>\r\n	<li><strong>0,5% Axit salicylic:</strong>&nbsp;Loại bỏ hầu hết c&aacute;c vết th&acirc;m do mụn v&agrave; mụn đầu đen, đồng thời gi&uacute;p ngăn ngừa mụn h&igrave;nh th&agrave;nh.</li>\r\n	<li><strong>Chiết xuất từ củ nghệ:</strong>&nbsp;Được sử dụng trong y học Trung Quốc v&agrave; Ấn Độ hơn 2500 năm, củ nghệ l&agrave; một loại củ thực vật c&oacute; t&aacute;c dụng th&iacute;ch nghi mạnh mẽ v&agrave; l&agrave; chất chống oxy h&oacute;a tự nhi&ecirc;n gi&uacute;p da chống lại c&aacute;c t&aacute;c nh&acirc;n b&ecirc;n ngo&agrave;i g&acirc;y stress. L&agrave; một liệu ph&aacute;p tự nhi&ecirc;n được biết đến gi&uacute;p l&agrave;m sạch nhẹ nh&agrave;ng, nu&ocirc;i dưỡng v&agrave; c&acirc;n bằng da.</li>\r\n	<li><strong>Axit Lactic:</strong>&nbsp;Nhẹ nh&agrave;ng lột tế b&agrave;o chết gi&uacute;p l&agrave;n da mềm mại v&agrave; đồng đều hơn, đồng thời cải thiện độ ẩm của da.</li>\r\n	<li><strong>L&ocirc; hội:</strong>&nbsp;Một loại chất th&iacute;ch nghi c&oacute; t&aacute;c dụng l&agrave;m dịu gi&uacute;p da đ&aacute;p ứng với c&aacute;c t&aacute;c nh&acirc;n g&acirc;y stress c&oacute; thể g&acirc;y ra phản ứng vi&ecirc;m.</li>\r\n	<li><strong>Bisabolol:</strong>&nbsp;Được biết đến gi&uacute;p đ&aacute;nh bại vi khuẩn c&oacute; hại v&agrave; gi&uacute;p giảm thiểu sự xuất hiện của đỏ da v&agrave; l&agrave;m dịu da.</li>\r\n</ul>\r\n\r\n<h3>C&aacute;ch sử dụng</h3>\r\n\r\n<p>Cho 1-2 lần bơm ra tay, thoa l&ecirc;n da mặt ẩm v&agrave; m&aacute;t xa theo chuyển động tr&ograve;n.&nbsp;Rửa kỹ bằng nước ấm v&agrave; vỗ nhẹ cho kh&ocirc;.&nbsp;Sử dụng buổi s&aacute;ng v&agrave; buổi tối.</p>'),(5,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Nike Jordan 1','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',100000.000,2,4,NULL),(6,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Nike Air Max','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',200000.000,2,4,NULL),(7,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Thức Ăn Cho Mèo Nhập Khẩu Đức','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',2000000.000,7,3,NULL),(8,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Quần Addidas X Gucci Limited','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',1000000.000,2,7,NULL),(9,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Bóng Ngoại Hạng Anh','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',5000000.000,4,7,NULL),(10,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Khô Gà Lá Chanh','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',1000000.000,3,5,NULL),(11,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Mực Rim','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',900000.000,3,5,NULL),(12,1,'2023-04-19 20:53:00.621216','2023-04-19 21:17:44.880458','Da Heo Chiên Giòn','fukimedia/products/2023/04/sua-rua-mat-jack-black-tri-mun_dmvzyi',700000.000,3,5,NULL),(13,1,'2023-05-02 10:02:46.695111','2023-05-02 10:02:46.695111','Thực Phẩm Bảo Vệ Sức Khỏe DHC Bổ Sung Vitamin C Hard Capsule Viên Nang Cứng 180v','fukimedia/products/2023/05/DHCVitaminC_ygigtp',265000.000,1,8,'Thực Phẩm Bảo Vệ Sức Khỏe DHC Bổ Sung Vitamin C Hard Capsule Viên Nang Cứng 180v\n\nThực Phẩm Bảo Vệ Sức Khỏe DHC Bổ Sung Vitamin C Hard Capsule Viên Nang Cứng bổ sung vitamin C, vitamin B2 cho cơ thể; hỗ trợ duy trì sức khỏe của da, hỗ trợ giảm thâm da; giúp da sáng mịn. Sản phẩm có thành phần chính là Vitamin C có thể hấp thụ vào cơ thể cao gấp 3 lần sản phẩm thông thường, giúp thúc đẩy quá trình sản sinh năng lượng, tăng cường sức dẻo dai cho cơ thể, hoạt hoá tế bào và chống oxy hoá. Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh.');
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
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_review_product_id_user_id_0b25d746_uniq` (`product_id`,`user_id`),
  KEY `shops_review_user_id_360896f9_fk_shops_user_id` (`user_id`),
  CONSTRAINT `shops_review_product_id_32e1afbb_fk_shops_product_id` FOREIGN KEY (`product_id`) REFERENCES `shops_product` (`id`),
  CONSTRAINT `shops_review_user_id_360896f9_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_review`
--

LOCK TABLES `shops_review` WRITE;
/*!40000 ALTER TABLE `shops_review` DISABLE KEYS */;
INSERT INTO `shops_review` VALUES (1,1,'2023-05-02 10:03:51.458661','2023-05-02 10:03:51.461449',4,'Mùi hương thơm',1,4),(2,1,'2023-05-02 10:04:28.414007','2023-05-02 10:04:28.416901',5,'Sản phẩm tốt, giữ mùi hương lâu',1,5);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `shops_shop_user_id_84155b5b_fk_shops_user_id` (`user_id`),
  CONSTRAINT `shops_shop_user_id_84155b5b_fk_shops_user_id` FOREIGN KEY (`user_id`) REFERENCES `shops_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_shop`
--

LOCK TABLES `shops_shop` WRITE;
/*!40000 ALTER TABLE `shops_shop` DISABLE KEYS */;
INSERT INTO `shops_shop` VALUES (1,1,'2023-04-18 19:31:47.547047','2023-04-22 02:32:38.584858','Classic Store',1,NULL,''),(2,1,'2023-04-18 22:26:35.611020','2023-04-18 22:26:35.611020','Unilever',1,'<p>Chăm S&oacute;c Gia Đ&igrave;nh N&acirc;ng Tầm Cuộc Sống</p>',NULL),(3,1,'2023-04-18 22:26:35.611020','2023-04-18 22:26:35.611020','Sen Cưng',1,NULL,NULL),(4,1,'2023-04-18 22:26:35.611020','2023-04-18 22:26:35.611020','Nike',1,NULL,NULL),(5,1,'2023-04-18 22:26:35.611020','2023-04-18 22:26:35.611020','Thầy Ba',1,NULL,NULL),(6,1,'2023-04-18 22:26:35.611020','2023-04-18 22:26:35.611020','Mixi Food',1,NULL,NULL),(7,1,'2023-04-18 22:26:35.611020','2023-04-18 22:26:35.611020','Addidas',1,NULL,NULL),(8,1,'2023-05-02 10:01:40.146533','2023-05-02 10:01:40.146533','Watsons',3,NULL,'');
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
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `role` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_user`
--

LOCK TABLES `shops_user` WRITE;
/*!40000 ALTER TABLE `shops_user` DISABLE KEYS */;
INSERT INTO `shops_user` VALUES (1,'pbkdf2_sha256$600000$DfbbCMOpVRJifAwxKwNKiJ$SimKvzEi2N6lHqZ1pgKlBGKAatJFG4I8Aximwk2c12c=','2023-05-06 10:15:57.866797',1,'admin','','','admin@gmail.com',1,1,'2023-04-18 16:34:38.000000','fukimedia/users/2023/05/avatar_admin_qimnbq',1,'E'),(2,'pbkdf2_sha256$600000$mAEfJjmTZjIEp5LhMpdogL$WA3LAQuNvME0eTBnA1EkMQIPih6CHPz737IDAVmPT0c=',NULL,0,'employee','','','',1,1,'2023-05-02 09:50:42.000000','fukimedia/users/2023/05/avatar_employee_zoxq08',1,'E'),(3,'pbkdf2_sha256$600000$Ii35pfImXfINWfKYoSYnvb$9pY8oKmn75Ysz7zIF3K3NGrOsnDwfbnbAK9hF3rnoA0=',NULL,0,'seller','','','',0,1,'2023-05-02 09:52:07.826396','fukimedia/users/2023/05/avatar_seller_ors4ml',1,'S'),(4,'pbkdf2_sha256$600000$k5PUIg1zu2dSwQnA0zdFDE$VqcbFxuP0y+00v47Zss54BQkz22piNzsNyf0NYpE+hQ=',NULL,0,'customer','','','',0,1,'2023-05-02 09:52:39.167265','fukimedia/users/2023/05/avatar_customer_bvyk1j',1,'C'),(5,'pbkdf2_sha256$600000$sQQPdbSLUR5MDanonoUQLi$y0o8PcWlGi30q5yo+wSrjG9ymXIgeDNDDSEAzOk+n74=',NULL,0,'sakura','','','',0,1,'2023-05-02 09:56:14.819855','fukimedia/users/2023/05/sakura_cqnvek',1,'C');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_user_groups`
--

LOCK TABLES `shops_user_groups` WRITE;
/*!40000 ALTER TABLE `shops_user_groups` DISABLE KEYS */;
INSERT INTO `shops_user_groups` VALUES (5,1,1),(1,2,1),(2,3,2),(3,4,3),(4,5,3);
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

-- Dump completed on 2023-05-08 17:10:56
