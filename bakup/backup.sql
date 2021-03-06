-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: pam
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb7u1

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
-- Table structure for table `core_settings`
--

DROP TABLE IF EXISTS `core_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_settings`
--

LOCK TABLES `core_settings` WRITE;
/*!40000 ALTER TABLE `core_settings` DISABLE KEYS */;
INSERT INTO `core_settings` VALUES ('date_format','g:ia -- m/d/y','g:ia -- m/d/y'),('lang_direction','ltr','ltr'),('status_message','This site has been disabled by a super-administrator.','This site has been disabled by a super-administrator.');
/*!40000 ALTER TABLE `core_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sites`
--

DROP TABLE IF EXISTS `core_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique ref` (`ref`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sites`
--

LOCK TABLES `core_sites` WRITE;
/*!40000 ALTER TABLE `core_sites` DISABLE KEYS */;
INSERT INTO `core_sites` VALUES (1,'Default Site','default','192.168.0.167',1,1445311110,0);
/*!40000 ALTER TABLE `core_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_users`
--

DROP TABLE IF EXISTS `core_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_users`
--

LOCK TABLES `core_users` WRITE;
/*!40000 ALTER TABLE `core_users` DISABLE KEYS */;
INSERT INTO `core_users` VALUES (1,'arjint2004@gmail.com','1cb5058e2e063230cf04ed3c2f6cec4753ed103f','c81bf',1,'',1,'',1445311110,1445311110,'admin',NULL,NULL);
/*!40000 ALTER TABLE `core_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_blog`
--

DROP TABLE IF EXISTS `default_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_blog` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` enum('no','1 day','1 week','2 weeks','1 month','3 months','always') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3 months',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_blog`
--

LOCK TABLES `default_blog` WRITE;
/*!40000 ALTER TABLE `default_blog` DISABLE KEYS */;
INSERT INTO `default_blog` VALUES (1,'2015-10-20 06:44:00',NULL,1,1,'sdfdsf','dfds','dfdsfdsf',0,'sdfdsf','','',1,1445323440,0,'3 months','draft','wysiwyg-advanced','ce88186404e24929790170e624684917');
/*!40000 ALTER TABLE `default_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_blog_categories`
--

DROP TABLE IF EXISTS `default_blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_blog_categories`
--

LOCK TABLES `default_blog_categories` WRITE;
/*!40000 ALTER TABLE `default_blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_ci_sessions`
--

DROP TABLE IF EXISTS `default_ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_ci_sessions`
--

LOCK TABLES `default_ci_sessions` WRITE;
/*!40000 ALTER TABLE `default_ci_sessions` DISABLE KEYS */;
INSERT INTO `default_ci_sessions` VALUES ('5e88ef17c836d98bad18d7b6a7ede357','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445336652,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('74cab6abc467d61f4a9794cd2f21b859','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445353943,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('e34c8a77e32b7625eb63c04f1c4ea08b','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445376832,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a0c6ceea062c7c4566f27531dbaf7d98','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445420426,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('d00f5e994f558ebc5e6169f8e428e3b4','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36',1445382438,''),('06400631afa4a7f21c869564e5cf8ee9','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445412281,''),('e8625113006aac0f894bfef8c113b0e2','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445413218,''),('8f60bc1a3bf4c8b84941a4911d88240f','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445420431,''),('8b5d0269bb1c1aafc208ec9469a8c55f','192.168.0.100','Mozilla/5.0 (Linux; U; Android 4.1.1; en-us; U7015 Build/JRO03C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobi',1445419217,''),('11b63f042a4c9b8978375bad6a76220d','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445420870,''),('2e975c3c6265fd7346e385ed37d067a8','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445420879,''),('dd4c5567fca71b6d990ac606695cbd2c','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445425136,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c6df3cc25067e359c3b7207dc374d309','192.168.0.110','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445426168,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('065cffe7780bedc80696ec4412c35fa8','192.168.0.107','Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mob',1445423518,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('370193aaf2da52ad8bdc512381bea545','192.168.0.110','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445422648,''),('fa1d39ae1cedce75a02a68a6a9f7c1ea','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425370,'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),('55d0b1d22b2a0d5d1790fa5ca68f9b17','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425373,''),('61e5120e7a32911b38f626fdc3a0920d','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425383,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('9077358259f98d9a50fba7a39bca49cf','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425388,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('80850956a2f24e1115e0dd4d33652495','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425388,''),('32da0de64c87a553d28b0f254ad597f6','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425395,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a4384ece17733a864611dee33ef63f64','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425398,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('558b82a6a74dc1801fd94ca28a604531','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425398,''),('392e82ae4733aec213e2e2d56403fd39','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425400,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('659ecf9ed6d7ef7283bacd00dffd4aa5','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425404,''),('4b555ae67e45e29dd701bd1da5cf8a5a','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425404,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('ed382d587e72770769a680c94452dcc2','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445422637,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('292d6665a91b57405cf972bfcb0f230c','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425576,''),('548cbea540c382909953ed074533ded4','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425576,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('2b066691855b50c0afe470839399e053','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425579,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('afb688cdd74bf6779da5c65253360ad6','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425584,''),('c0ed14df21956c453382cf6a56c395ef','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425584,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('d1259f7d543e24df4c79d6c213e6bdb1','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425594,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('75b3edf0db644cc98fa3b25bedb2be36','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425598,''),('602a149a58d3b39c11e31d68b316c8a5','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425598,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('079f89717b9790bc7c744f962636c65c','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425602,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a813d04540f16866a0691fe0b1387cd6','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425607,''),('2e73aee78fd97d6aa3286c28d6e7aece','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425607,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('bafffd9e1438b45acf7c02044d10199f','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425613,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3d766c35f55b7802fa58a8db42e17b77','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425617,''),('957705d9d09248e3d1e266df0bee852e','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425617,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('4355a3314e106983f0de4eb37d33e7f0','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425695,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('61b33ed7c56137f024a6894412fc57d6','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425700,''),('b8d4a1cadc2bedb82f8ce800f41bdff7','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425700,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('5207499b851cf75ffd70699370c69467','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425703,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('07745a2265e5b1d744c889eea7f967b6','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425707,''),('6879e9ecbe92c5d7b101a0f63a55500f','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425708,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('803c9ac0d45e11eb177eb9a7fa6591da','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425724,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('7bba5ba2d36964258aa9d5ad7c6ecfd6','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425728,''),('fcf700725c79346ab5bf8eba9200df97','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425728,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('b7fe6bfb97c4a11542ed752616f38dd5','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425730,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('017e2e25b178ec12c878e6b12bc9257d','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425734,''),('63a33b4c40de37e69fe18894fb0c2622','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425735,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('d66776c9161d8981a4e5f3b5b2903c32','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425926,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('9da1f57cb2fd06bfe22efa66b49f5084','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425931,''),('8abbe02c31051016920ff5175a8821cb','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425932,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('0ae3e5b9b3d79da522bc75fc094d2907','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425986,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c649a00f59a22ba873622a1216570b0d','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; MZ-m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0',1445425992,''),('220edba84aa19852c520a9142198e18d','192.168.0.200','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445425992,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('b83d9996f8cdb2d5201bcb22284fc95d','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445434228,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('db2ebd48b8547619e6560b43cbad39a6','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445432567,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('16de2034d7615b6fa00e6ad2b9f8ebbd','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445433497,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('962cee978512baf64289a80bd9715815','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445434530,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('640e936b65e9a349dd8d77d537185033','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445444536,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('85e125b53929d76a20a4d0d4fa6915c1','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445440655,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('e8c552810dfb355856f59ed31d14ab97','192.168.0.108','WSDAPI',1445440938,''),('71c4712086676b993bf1f464ea33a8b5','192.168.0.108','DavClnt',1445443759,'a:1:{s:14:\"admin_redirect\";s:19:\"admin/pam/inputdata\";}'),('4f90e2c29267adbf02fa09f98ddfe389','192.168.0.108','Microsoft-WebDAV-MiniRedir/6.3.9600',1445443768,'a:1:{s:14:\"admin_redirect\";s:19:\"admin/pam/inputdata\";}'),('60fa64b562aaa58f517eaea2fa411b22','192.168.0.108','Microsoft-WebDAV-MiniRedir/6.3.9600',1445443774,'a:1:{s:14:\"admin_redirect\";s:19:\"admin/pam/inputdata\";}'),('4e5c2b2889f43679517beba37ee4bdc5','192.168.0.108','Microsoft-WebDAV-MiniRedir/6.3.9600',1445443779,'a:1:{s:14:\"admin_redirect\";s:19:\"admin/pam/inputdata\";}'),('c93a5eb3846d4c5844e3fbcc21f56159','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445469463,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a6d81cb9aea94c0d5120eed30a1226b8','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445522235,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('feb3ca02d07d8e8f165c6f8e5b789d9d','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445475692,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('f5604f44a80583dd81d846e3fb3eeb5e','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445480849,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('d333c3bb332358a13c0037c2909d1da8','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445482312,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('634c87f1adb9a6b4c4da8c8ff1d5a42a','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445503761,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('6f72454026407f78cf1b2c17697b7551','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445505313,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('f3dad62dd4bcc1569270e5e7d0267965','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445508033,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('6202b14bc8236f6eb193087135cf2777','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445524351,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('128b25acc9a05ec733d9b8516b6ea79c','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445558673,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('6f99cc5ba5b2bcc2c318bdde5a3a4f45','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445558673,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('cc084e294a98756e33b68f5761336649','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445617922,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('5f2f96d306349a0f4a98e4f8933b2894','192.168.0.107','Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mob',1445574572,''),('2ac33aba991c7a6b92b3a1e0d29a2bb7','192.168.0.107','Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mob',1445574573,''),('5d947adf4534240130fed85b1001138b','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445588022,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('cc03e8feb193d3d7cc474162db9ca7a1','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445590171,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('8980e0cd44174c77aeda5a5ded69cdc4','192.168.0.107','Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mob',1445604235,''),('483695840ac2073b83ebdec27c5c34fd','192.168.0.107','Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mob',1445604236,''),('c2eef68b30042b1ff7e083b51d7d1a73','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445646490,''),('a2065bb171c73321e766364bd8873e35','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445648431,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('5626b83c61d463bade76d99a4be4ab05','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445658802,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('abbee8c43c3010e42636f1ab60039cf2','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445661461,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('114f9a07fbf140ef5811528a291946a2','192.168.0.100','Mozilla/5.0 (Linux; U; Android 4.1.1; en-us; U7015 Build/JRO03C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobi',1445653658,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('9373ebcff777bfe72e6fa23a588639c0','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445661816,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('525c08551fb0de415f00af497531fe31','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445662978,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('e4f3ff31884fd9ff950119fd70af4fe6','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445678744,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('fb2baa7fc5d624a45b40ef67666aa4b1','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445675017,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('16d639694ec6fed98b2e1c9272c893c3','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445678542,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('202d4e03756d6f75fffd2b9807716f12','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445720308,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('711a4af3866955bf442646b9cdecefc0','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445772803,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('6c601c685032d9ebf813a7b32bcbe83b','192.168.0.101','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445882533,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('441b5fcef953455a3f2c3aef053647ca','192.168.0.101','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1445777775,'a:1:{s:14:\"admin_redirect\";s:14:\"admin/pam/cari\";}'),('3311a437ead205ad79ec53c229acf1e9','192.168.0.103','Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0',1445785663,'a:1:{s:14:\"admin_redirect\";s:14:\"admin/pam/cari\";}'),('8886117b2c4a68c7e952ee3de8495dfd','192.168.0.103','Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0',1445785669,''),('0201f85a97a721363018b9fd33eb2439','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445826218,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('962ccfe7289509a0fabb4f4117851a19','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445948172,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3b0448dae930c895f74c4ecf132c4abf','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445841369,'a:1:{s:14:\"admin_redirect\";s:19:\"admin/pam/inputdata\";}'),('ad16ddaab5b968762022a15e5f33918f','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445841370,''),('8a6445b12522454901f40e4c9232b120','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445953127,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('79391525fe9ca64ba4876087043c038e','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1445958890,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a60c367b9705ee632a0b4485d29b6628','192.168.0.102','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1445997413,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c00104960ffbac90b0d38c54dea14b47','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1446109974,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('988f158054b5d6a1fd4cf3d40fcadcc5','192.168.0.103','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1446162494,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('85ac1132e1784795956c37bbf650c750','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1446113651,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('4afd37a2177bad0622147e4ee62367af','192.168.0.104','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1446243658,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('e073322eb1b32ed9dc1af613eaf2321a','192.168.0.108','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1446278331,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('917f29212ccae6735ca8e0d81e23b590','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446294326,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('f48ac1e19126da16604baf7abbadedb8','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446295301,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('0ade47a21d3a4356d77910fc113f68f5','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446296218,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('f30c1d9ba657b215ed3f8487609485a9','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446296219,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('cdef56620a4e73c6636612572e0ef824','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446296332,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('08d75e987c8af9e930d9f7e2f8cc2ceb','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446296334,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('34d105cdd37e4783af2d7ce9226c6cf0','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446296417,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a6630f0a32d937bf4ca3deb193c9ac87','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446296770,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('ddd67660d350fa421b343f2bd1472315','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446296462,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('93b1d1be43b18cde518194fc306e2835','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446300839,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('6912b02648f2432450b40789ce8152d5','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446300841,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('f6130f6ec16c2c79d75724ea47d0ede2','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446301045,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('731234b963f6d99a9c3ce97a2b87fff5','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446326964,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('1a37d016770ac74fd05a33345a4aea5d','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446337802,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('5d6e621cac78f138c9896aae980c9ff1','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446337903,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('ec912a16b2ffca5f0c3939a3718d3d16','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446341157,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('12fa6e1a9f6e9ce467b75c7a9a332e1c','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446341159,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('6f4d4442a62ce9197488054c32585714','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446341160,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('d5be838e304295188b4a32a6951b907e','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446342879,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('cee8973a4dc8162e060e3c81b1f5b52f','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1446364479,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('19117b222a84660e517b37f445c07072','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446344000,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('e21120e8f8b629fab941424dd2820f74','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446351899,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('9d90b7f3957eab026103a9fade004204','192.168.0.103','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1446357038,'a:1:{s:14:\"admin_redirect\";s:14:\"admin/pam/cari\";}'),('46d16d1a08e381ca9145cd90d4c672e1','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446359175,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('7d300d4ddb7516e3db6b4ece70252460','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446360442,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('d6045f9159fc95b2ec3c39a64007135e','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446361153,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('2a37e9091fb96e3099c2fe6b10b753d8','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446364630,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('02568e73f2e361530a23cbed315ed125','192.168.0.167','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446363865,'a:1:{s:14:\"admin_redirect\";s:14:\"admin/pam/cari\";}'),('ce4dda5c47c6c3d6d0f7c5d655a8abef','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446364631,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('f7b73bfcf7696e14d65988f7d3f0bfec','192.168.0.103','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.22',1446377381,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('95deac1271ab3c24ba03c72ecd86565f','127.0.0.1','Mozilla/5.0 (Macintosh; ARM Mac OS X) AppleWebKit/538.15 (KHTML, like Gecko) Safari/538.15 Version/6.0 Debian/7.8 (3.8.2',1446378707,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('46c5c4ffa2142eca4f96d279b57195d7','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1446392672,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('4681c3d6ac34f11691155cfbbdcc3329','127.0.0.1','Mozilla/5.0 (X11; Linux armv7l; rv:31.0) Gecko/20100101 Firefox/31.0 Iceweasel/31.8.0',1446420016,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('eac16b01945e210d3b830bc574392333','192.168.0.105','Mozilla/5.0 (Windows NT 6.3; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0',1446476072,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('d3c74d44d87dd6e7317fc251d647d4d8','192.168.0.101','Mozilla/5.0 (Linux; Android 5.1; m2 note Build/LMY47D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile',1446422089,''),('67cc99ac9ff088cc1e90058661ca12a3','127.0.0.1','Mozilla/5.0 (X11; Linux armv7l; rv:31.0) Gecko/20100101 Firefox/31.0 Iceweasel/31.8.0',1446439591,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('fbd6ae472043c0ab6f975425d88e980a','127.0.0.1','Mozilla/5.0 (X11; Linux armv7l; rv:31.0) Gecko/20100101 Firefox/31.0 Iceweasel/31.8.0',1446455425,'a:6:{s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('157a16e3019371e7fd0e093785b86f2b','127.0.0.1','Mozilla/5.0 (X11; Linux armv7l; rv:31.0) Gecko/20100101 Firefox/31.0 Iceweasel/31.8.0',1446461320,'a:5:{s:5:\"email\";s:20:\"arjint2004@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
/*!40000 ALTER TABLE `default_ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_comment_blacklists`
--

DROP TABLE IF EXISTS `default_comment_blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_comment_blacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_comment_blacklists`
--

LOCK TABLES `default_comment_blacklists` WRITE;
/*!40000 ALTER TABLE `default_comment_blacklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_comment_blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_comments`
--

DROP TABLE IF EXISTS `default_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `entry_title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_comments`
--

LOCK TABLES `default_comments` WRITE;
/*!40000 ALTER TABLE `default_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_contact_log`
--

DROP TABLE IF EXISTS `default_contact_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_contact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_contact_log`
--

LOCK TABLES `default_contact_log` WRITE;
/*!40000 ALTER TABLE `default_contact_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_contact_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_data_field_assignments`
--

DROP TABLE IF EXISTS `default_data_field_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_data_field_assignments`
--

LOCK TABLES `default_data_field_assignments` WRITE;
/*!40000 ALTER TABLE `default_data_field_assignments` DISABLE KEYS */;
INSERT INTO `default_data_field_assignments` VALUES (1,1,1,1,'yes','no',NULL,NULL),(2,1,2,2,'no','no',NULL,NULL),(3,1,3,3,'yes','no',NULL,NULL),(4,2,3,4,'yes','no',NULL,NULL),(5,3,3,5,'no','no',NULL,NULL),(6,4,3,6,'no','no',NULL,NULL),(7,5,3,7,'no','no',NULL,NULL),(8,6,3,8,'no','no',NULL,NULL),(9,7,3,9,'no','no',NULL,NULL),(10,8,3,10,'no','no',NULL,NULL),(11,9,3,11,'no','no',NULL,NULL),(12,10,3,12,'no','no',NULL,NULL),(13,11,3,13,'no','no',NULL,NULL),(14,12,3,14,'no','no',NULL,NULL),(15,13,3,15,'no','no',NULL,NULL),(16,14,3,16,'no','no',NULL,NULL);
/*!40000 ALTER TABLE `default_data_field_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_data_fields`
--

DROP TABLE IF EXISTS `default_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_data_fields`
--

LOCK TABLES `default_data_fields` WRITE;
/*!40000 ALTER TABLE `default_data_fields` DISABLE KEYS */;
INSERT INTO `default_data_fields` VALUES (1,'lang:blog:intro_label','intro','blogs','wysiwyg','a:2:{s:11:\"editor_type\";s:6:\"simple\";s:10:\"allow_tags\";s:1:\"y\";}',NULL,'no'),(2,'lang:pages:body_label','body','pages','wysiwyg','a:2:{s:11:\"editor_type\";s:8:\"advanced\";s:10:\"allow_tags\";s:1:\"y\";}',NULL,'no'),(3,'lang:user:first_name_label','first_name','users','text','a:2:{s:10:\"max_length\";i:50;s:13:\"default_value\";N;}',NULL,'no'),(4,'lang:user:last_name_label','last_name','users','text','a:2:{s:10:\"max_length\";i:50;s:13:\"default_value\";N;}',NULL,'no'),(5,'lang:profile_company','company','users','text','a:2:{s:10:\"max_length\";i:100;s:13:\"default_value\";N;}',NULL,'no'),(6,'lang:profile_bio','bio','users','textarea','a:3:{s:12:\"default_text\";N;s:10:\"allow_tags\";N;s:12:\"content_type\";N;}',NULL,'no'),(7,'lang:user:lang','lang','users','pyro_lang','a:1:{s:12:\"filter_theme\";s:3:\"yes\";}',NULL,'no'),(8,'lang:profile_dob','dob','users','datetime','a:5:{s:8:\"use_time\";s:2:\"no\";s:10:\"start_date\";s:5:\"-100Y\";s:8:\"end_date\";N;s:7:\"storage\";s:4:\"unix\";s:10:\"input_type\";s:8:\"dropdown\";}',NULL,'no'),(9,'lang:profile_gender','gender','users','choice','a:5:{s:11:\"choice_data\";s:34:\" : Not Telling\nm : Male\nf : Female\";s:11:\"choice_type\";s:8:\"dropdown\";s:13:\"default_value\";N;s:11:\"min_choices\";N;s:11:\"max_choices\";N;}',NULL,'no'),(10,'lang:profile_phone','phone','users','text','a:2:{s:10:\"max_length\";i:20;s:13:\"default_value\";N;}',NULL,'no'),(11,'lang:profile_mobile','mobile','users','text','a:2:{s:10:\"max_length\";i:20;s:13:\"default_value\";N;}',NULL,'no'),(12,'lang:profile_address_line1','address_line1','users','text','a:2:{s:10:\"max_length\";N;s:13:\"default_value\";N;}',NULL,'no'),(13,'lang:profile_address_line2','address_line2','users','text','a:2:{s:10:\"max_length\";N;s:13:\"default_value\";N;}',NULL,'no'),(14,'lang:profile_address_line3','address_line3','users','text','a:2:{s:10:\"max_length\";N;s:13:\"default_value\";N;}',NULL,'no'),(15,'lang:profile_address_postcode','postcode','users','text','a:2:{s:10:\"max_length\";i:20;s:13:\"default_value\";N;}',NULL,'no'),(16,'lang:profile_website','website','users','url',NULL,NULL,'no');
/*!40000 ALTER TABLE `default_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_data_streams`
--

DROP TABLE IF EXISTS `default_data_streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_data_streams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `permissions` text COLLATE utf8_unicode_ci,
  `is_hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_data_streams`
--

LOCK TABLES `default_data_streams` WRITE;
/*!40000 ALTER TABLE `default_data_streams` DISABLE KEYS */;
INSERT INTO `default_data_streams` VALUES (1,'lang:blog:blog_title','blog','blogs',NULL,NULL,'a:2:{i:0;s:2:\"id\";i:1;s:7:\"created\";}',NULL,'title',NULL,'no',NULL),(2,'Default','def_page_fields','pages',NULL,'A simple page type with a WYSIWYG editor that will get you started adding content.','a:2:{i:0;s:2:\"id\";i:1;s:7:\"created\";}',NULL,'title',NULL,'no',NULL),(3,'lang:user_profile_fields_label','profiles','users',NULL,'Profiles for users module','a:1:{i:0;s:12:\"display_name\";}','display_name','title',NULL,'no',NULL);
/*!40000 ALTER TABLE `default_data_streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_def_page_fields`
--

DROP TABLE IF EXISTS `default_def_page_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_def_page_fields` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_def_page_fields`
--

LOCK TABLES `default_def_page_fields` WRITE;
/*!40000 ALTER TABLE `default_def_page_fields` DISABLE KEYS */;
INSERT INTO `default_def_page_fields` VALUES (1,'2015-10-20 03:18:41',NULL,1,NULL,'<p>Welcome to our homepage. We have not quite finished setting up our website yet, but please add us to your bookmarks and come back soon.</p>'),(2,'2015-10-20 03:18:41',NULL,1,NULL,'<p>To contact us please fill out the form below.</p>\n				{{ contact:form name=\"text|required\" email=\"text|required|valid_email\" subject=\"dropdown|Support|Sales|Feedback|Other\" message=\"textarea\" attachment=\"file|zip\" }}\n					<div><label for=\"name\">Name:</label>{{ name }}</div>\n					<div><label for=\"email\">Email:</label>{{ email }}</div>\n					<div><label for=\"subject\">Subject:</label>{{ subject }}</div>\n					<div><label for=\"message\">Message:</label>{{ message }}</div>\n					<div><label for=\"attachment\">Attach  a zip file:</label>{{ attachment }}</div>\n				{{ /contact:form }}'),(3,'2015-10-20 03:18:41',NULL,1,NULL,'{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}'),(4,'2015-10-20 03:18:41',NULL,1,NULL,'{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}\n\n{{ search:results }}\n\n	{{ total }} results for \"{{ query }}\".\n\n	<hr />\n\n	{{ entries }}\n\n		<article>\n			<h4>{{ singular }}: <a href=\"{{ url }}\">{{ title }}</a></h4>\n			<p>{{ description }}</p>\n		</article>\n\n	{{ /entries }}\n\n        {{ pagination }}\n\n{{ /search:results }}'),(5,'2015-10-20 03:18:41',NULL,1,NULL,'<p>We cannot find the page you are looking for, please click <a title=\"Home\" href=\"{{ pages:url id=\'1\' }}\">here</a> to go to the homepage.</p>');
/*!40000 ALTER TABLE `default_def_page_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_email_templates`
--

DROP TABLE IF EXISTS `default_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_email_templates`
--

LOCK TABLES `default_email_templates` WRITE;
/*!40000 ALTER TABLE `default_email_templates` DISABLE KEYS */;
INSERT INTO `default_email_templates` VALUES (1,'comments','Comment Notification','Email that is sent to admin when someone creates a comment','You have just received a comment from {{ name }}','<h3>You have received a comment from {{ name }}</h3>\n				<p>\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}<br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>\n				<p>{{ comment }}</p>\n				<p>View Comment: {{ redirect_url }}</p>','en',1,'comments'),(2,'contact','Contact Notification','Template for the contact form','{{ settings:site_name }} :: {{ subject }}','This message was sent via the contact form on with the following details:\n				<hr />\n				IP Address: {{ sender_ip }}\n				OS {{ sender_os }}\n				Agent {{ sender_agent }}\n				<hr />\n				{{ message }}\n\n				{{ name }},\n\n				{{ email }}','en',1,'pages'),(3,'registered','New User Registered','Email sent to the site contact e-mail when a new user registers','{{ settings:site_name }} :: You have just received a registration from {{ name }}','<h3>You have received a registration from {{ name }}</h3>\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}</strong><br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>','en',1,'users'),(4,'activation','Activation Email','The email which contains the activation code that is sent to a new user','{{ settings:site_name }} - Account Activation','<p>Hello {{ user:first_name }},</p>\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\n				<p><a href=\"{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}\">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\n				<p>&nbsp;</p>\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\n				<p><a href=\"{{ url:site }}users/activate\">{{ url:site }}users/activate</a></p>\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>','en',1,'users'),(5,'forgotten_password','Forgotten Password Email','The email that is sent containing a password reset code','{{ settings:site_name }} - Forgotten Password','<p>Hello {{ user:first_name }},</p>\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href=\"{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}\">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>','en',1,'users'),(6,'new_password','New Password Email','After a password is reset this email is sent containing the new password','{{ settings:site_name }} - New Password','<p>Hello {{ user:first_name }},</p>\n				<p>Your new password is: {{ new_password }}</p>\n				<p>After logging in you may change your password by visiting <a href=\"{{ url:site }}edit-profile\">{{ url:site }}edit-profile</a></p>','en',1,'users');
/*!40000 ALTER TABLE `default_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_file_folders`
--

DROP TABLE IF EXISTS `default_file_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_file_folders`
--

LOCK TABLES `default_file_folders` WRITE;
/*!40000 ALTER TABLE `default_file_folders` DISABLE KEYS */;
INSERT INTO `default_file_folders` VALUES (2,0,'pam-module','Pam Module','local','',1445313266,0,0),(3,0,'untitled-folder','Untitled Folder','local','',1446001391,1446001391,0);
/*!40000 ALTER TABLE `default_file_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_files`
--

DROP TABLE IF EXISTS `default_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_files` (
  `id` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_files`
--

LOCK TABLES `default_files` WRITE;
/*!40000 ALTER TABLE `default_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_groups`
--

DROP TABLE IF EXISTS `default_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_groups`
--

LOCK TABLES `default_groups` WRITE;
/*!40000 ALTER TABLE `default_groups` DISABLE KEYS */;
INSERT INTO `default_groups` VALUES (1,'admin','Administrator'),(2,'user','User');
/*!40000 ALTER TABLE `default_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_keywords`
--

DROP TABLE IF EXISTS `default_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_keywords`
--

LOCK TABLES `default_keywords` WRITE;
/*!40000 ALTER TABLE `default_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_keywords_applied`
--

DROP TABLE IF EXISTS `default_keywords_applied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_keywords_applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_keywords_applied`
--

LOCK TABLES `default_keywords_applied` WRITE;
/*!40000 ALTER TABLE `default_keywords_applied` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_keywords_applied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_migrations`
--

DROP TABLE IF EXISTS `default_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_migrations`
--

LOCK TABLES `default_migrations` WRITE;
/*!40000 ALTER TABLE `default_migrations` DISABLE KEYS */;
INSERT INTO `default_migrations` VALUES (129);
/*!40000 ALTER TABLE `default_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_modules`
--

DROP TABLE IF EXISTS `default_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_modules`
--

LOCK TABLES `default_modules` WRITE;
/*!40000 ALTER TABLE `default_modules` DISABLE KEYS */;
INSERT INTO `default_modules` VALUES (1,'a:25:{s:2:\"en\";s:8:\"Settings\";s:2:\"ar\";s:18:\"الإعدادات\";s:2:\"br\";s:15:\"Configurações\";s:2:\"pt\";s:15:\"Configurações\";s:2:\"cs\";s:10:\"Nastavení\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"el\";s:18:\"Ρυθμίσεις\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fa\";s:14:\"تنظیمات\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"fr\";s:11:\"Paramètres\";s:2:\"he\";s:12:\"הגדרות\";s:2:\"id\";s:10:\"Pengaturan\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"ru\";s:18:\"Настройки\";s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"tw\";s:12:\"網站設定\";s:2:\"cn\";s:12:\"网站设定\";s:2:\"hu\";s:14:\"Beállítások\";s:2:\"th\";s:21:\"ตั้งค่า\";s:2:\"se\";s:14:\"Inställningar\";}','settings','1.0.0',NULL,'a:25:{s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"ar\";s:161:\"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.\";s:2:\"pt\";s:113:\"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.\";s:2:\"cs\";s:102:\"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.\";s:2:\"el\";s:230:\"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.\";s:2:\"fa\";s:105:\"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.\";s:2:\"fr\";s:118:\"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.\";s:2:\"he\";s:116:\"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"lt\";s:104:\"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"pl\";s:103:\"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"ru\";s:135:\"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.\";s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.\";s:2:\"tw\";s:99:\"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。\";s:2:\"cn\";s:99:\"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。\";s:2:\"hu\";s:125:\"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...\";s:2:\"th\";s:232:\"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น\";s:2:\"se\";s:84:\"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.\";}',1,0,1,'settings',1,1,1,1445311264),(2,'a:11:{s:2:\"en\";s:12:\"Streams Core\";s:2:\"pt\";s:14:\"Núcleo Fluxos\";s:2:\"fr\";s:10:\"Noyau Flux\";s:2:\"el\";s:23:\"Πυρήνας Ροών\";s:2:\"se\";s:18:\"Streams grundmodul\";s:2:\"tw\";s:14:\"Streams 核心\";s:2:\"cn\";s:14:\"Streams 核心\";s:2:\"ar\";s:31:\"الجداول الأساسية\";s:2:\"it\";s:12:\"Streams Core\";s:2:\"fa\";s:26:\"هسته استریم ها\";s:2:\"fi\";s:13:\"Striimit ydin\";}','streams_core','1.0.0',NULL,'a:11:{s:2:\"en\";s:29:\"Core data module for streams.\";s:2:\"pt\";s:37:\"Módulo central de dados para fluxos.\";s:2:\"fr\";s:32:\"Noyau de données pour les Flux.\";s:2:\"el\";s:113:\"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.\";s:2:\"se\";s:50:\"Streams grundmodul för enklare hantering av data.\";s:2:\"tw\";s:29:\"Streams 核心資料模組。\";s:2:\"cn\";s:29:\"Streams 核心资料模组。\";s:2:\"ar\";s:57:\"وحدة البيانات الأساسية للجداول\";s:2:\"it\";s:17:\"Core dello Stream\";s:2:\"fa\";s:48:\"ماژول مرکزی برای استریم ها\";s:2:\"fi\";s:48:\"Ydin datan hallinoiva moduuli striimejä varten.\";}',1,0,0,'0',1,1,1,1445311264),(3,'a:21:{s:2:\"en\";s:15:\"Email Templates\";s:2:\"ar\";s:48:\"قوالب الرسائل الإلكترونية\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"pt\";s:17:\"Modelos de e-mail\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"el\";s:22:\"Δυναμικά email\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"fa\";s:26:\"قالب های ایمیل\";s:2:\"fr\";s:17:\"Modèles d\'emails\";s:2:\"he\";s:12:\"תבניות\";s:2:\"id\";s:14:\"Template Email\";s:2:\"lt\";s:22:\"El. laiškų šablonai\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"ru\";s:25:\"Шаблоны почты\";s:2:\"sl\";s:14:\"Email predloge\";s:2:\"tw\";s:12:\"郵件範本\";s:2:\"cn\";s:12:\"邮件范本\";s:2:\"hu\";s:15:\"E-mail sablonok\";s:2:\"fi\";s:25:\"Sähköposti viestipohjat\";s:2:\"th\";s:33:\"แม่แบบอีเมล\";s:2:\"se\";s:12:\"E-postmallar\";}','templates','1.1.0',NULL,'a:21:{s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"ar\";s:97:\"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"pt\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"da\";s:49:\"Opret, redigér og gem dynamiske emailskabeloner.\";s:2:\"el\";s:108:\"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinámicas\";s:2:\"fa\";s:92:\"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا\";s:2:\"fr\";s:61:\"Créer, éditer et sauver dynamiquement des modèles d\'emails\";s:2:\"he\";s:54:\"ניהול של תבניות דואר אלקטרוני\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"ru\";s:127:\"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны\";s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"tw\";s:61:\"新增、編輯與儲存可顯示動態資料的 email 範本\";s:2:\"cn\";s:61:\"新增、编辑与储存可显示动态资料的 email 范本\";s:2:\"hu\";s:63:\"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat\";s:2:\"fi\";s:66:\"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.\";s:2:\"th\";s:129:\"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก\";s:2:\"se\";s:49:\"Skapa, redigera och spara dynamiska E-postmallar.\";}',1,0,1,'structure',1,1,1,1445311264),(4,'a:25:{s:2:\"en\";s:7:\"Add-ons\";s:2:\"ar\";s:16:\"الإضافات\";s:2:\"br\";s:12:\"Complementos\";s:2:\"pt\";s:12:\"Complementos\";s:2:\"cs\";s:8:\"Doplňky\";s:2:\"da\";s:7:\"Add-ons\";s:2:\"de\";s:13:\"Erweiterungen\";s:2:\"el\";s:16:\"Πρόσθετα\";s:2:\"es\";s:9:\"Agregados\";s:2:\"fa\";s:17:\"افزونه ها\";s:2:\"fi\";s:9:\"Lisäosat\";s:2:\"fr\";s:10:\"Extensions\";s:2:\"he\";s:12:\"תוספות\";s:2:\"id\";s:7:\"Pengaya\";s:2:\"it\";s:7:\"Add-ons\";s:2:\"lt\";s:7:\"Priedai\";s:2:\"nl\";s:7:\"Add-ons\";s:2:\"pl\";s:12:\"Rozszerzenia\";s:2:\"ru\";s:20:\"Дополнения\";s:2:\"sl\";s:11:\"Razširitve\";s:2:\"tw\";s:12:\"附加模組\";s:2:\"cn\";s:12:\"附加模组\";s:2:\"hu\";s:14:\"Bővítmények\";s:2:\"th\";s:27:\"ส่วนเสริม\";s:2:\"se\";s:8:\"Tillägg\";}','addons','2.0.0',NULL,'a:25:{s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"ar\";s:91:\"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"pt\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"cs\";s:68:\"Umožňuje administrátorům vidět seznam nainstalovaných modulů.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"el\";s:152:\"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los módulos instalados.\";s:2:\"fa\";s:93:\"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت\";s:2:\"fi\";s:60:\"Listaa järjestelmänvalvojalle käytössä olevat moduulit.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installés\";s:2:\"he\";s:160:\"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"pl\";s:81:\"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.\";s:2:\"ru\";s:83:\"Список модулей, которые установлены на сайте.\";s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameščenih modulov.\";s:2:\"tw\";s:54:\"管理員可以檢視目前已經安裝模組的列表\";s:2:\"cn\";s:54:\"管理员可以检视目前已经安装模组的列表\";s:2:\"hu\";s:79:\"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.\";s:2:\"th\";s:162:\"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน\";s:2:\"se\";s:67:\"Gör det möjligt för administratören att se installerade mouler.\";}',0,0,1,'0',1,1,1,1445311264),(5,'a:17:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"fa\";s:8:\"بلاگ\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"tw\";s:6:\"文章\";s:2:\"cn\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}','blog','2.0.0',NULL,'a:25:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fa\";s:44:\"مقالات منتشر شده در بلاگ\";s:2:\"fr\";s:34:\"Poster des articles d\'actualités.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"tw\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"cn\";s:42:\"发表新闻讯息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}',1,1,1,'content',1,1,1,1445311264),(6,'a:25:{s:2:\"en\";s:8:\"Comments\";s:2:\"ar\";s:18:\"التعليقات\";s:2:\"br\";s:12:\"Comentários\";s:2:\"pt\";s:12:\"Comentários\";s:2:\"cs\";s:11:\"Komentáře\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"el\";s:12:\"Σχόλια\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"fa\";s:10:\"نظرات\";s:2:\"he\";s:12:\"תגובות\";s:2:\"id\";s:8:\"Komentar\";s:2:\"it\";s:8:\"Commenti\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"ru\";s:22:\"Комментарии\";s:2:\"sl\";s:10:\"Komentarji\";s:2:\"tw\";s:6:\"回應\";s:2:\"cn\";s:6:\"回应\";s:2:\"hu\";s:16:\"Hozzászólások\";s:2:\"th\";s:33:\"ความคิดเห็น\";s:2:\"se\";s:11:\"Kommentarer\";}','comments','1.1.0',NULL,'a:25:{s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"ar\";s:152:\"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.\";s:2:\"br\";s:97:\"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"pt\";s:100:\"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"cs\";s:100:\"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.\";s:2:\"da\";s:83:\"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"de\";s:65:\"Benutzer und Gäste können für fast alles Kommentare schreiben.\";s:2:\"el\";s:224:\"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.\";s:2:\"fa\";s:168:\"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند\";s:2:\"fi\";s:107:\"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.\";s:2:\"he\";s:94:\"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"pl\";s:93:\"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.\";s:2:\"ru\";s:187:\"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.\";s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"tw\";s:75:\"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。\";s:2:\"cn\";s:75:\"用户和访客可以针对新闻、页面与照片等内容发表回应。\";s:2:\"hu\";s:117:\"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).\";s:2:\"th\";s:240:\"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย\";s:2:\"se\";s:98:\"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.\";}',0,0,1,'content',1,1,1,1445311264),(7,'a:25:{s:2:\"en\";s:7:\"Contact\";s:2:\"ar\";s:14:\"الإتصال\";s:2:\"br\";s:7:\"Contato\";s:2:\"pt\";s:8:\"Contacto\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"el\";s:22:\"Επικοινωνία\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fa\";s:18:\"تماس با ما\";s:2:\"fi\";s:13:\"Ota yhteyttä\";s:2:\"fr\";s:7:\"Contact\";s:2:\"he\";s:17:\"יצירת קשר\";s:2:\"id\";s:6:\"Kontak\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"lt\";s:18:\"Kontaktinė formą\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"ru\";s:27:\"Обратная связь\";s:2:\"sl\";s:7:\"Kontakt\";s:2:\"tw\";s:12:\"聯絡我們\";s:2:\"cn\";s:12:\"联络我们\";s:2:\"hu\";s:9:\"Kapcsolat\";s:2:\"th\";s:18:\"ติดต่อ\";s:2:\"se\";s:7:\"Kontakt\";}','contact','1.0.0',NULL,'a:25:{s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"ar\";s:157:\"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.\";s:2:\"br\";s:139:\"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.\";s:2:\"pt\";s:116:\"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.\";s:2:\"cs\";s:149:\"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.\";s:2:\"da\";s:123:\"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"de\";s:119:\"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"el\";s:273:\"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.\";s:2:\"fa\";s:239:\"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.\";s:2:\"es\";s:156:\"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.\";s:2:\"fr\";s:122:\"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.\";s:2:\"he\";s:155:\"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"lt\";s:124:\"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.\";s:2:\"ru\";s:234:\"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.\";s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.\";s:2:\"tw\";s:147:\"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。\";s:2:\"cn\";s:147:\"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。\";s:2:\"th\";s:316:\"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา\";s:2:\"hu\";s:156:\"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.\";s:2:\"se\";s:53:\"Lägger till ett kontaktformulär till din webbplats.\";}',0,0,0,'0',1,1,1,1445311264),(8,'a:24:{s:2:\"en\";s:5:\"Files\";s:2:\"ar\";s:16:\"الملفّات\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"pt\";s:9:\"Ficheiros\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"da\";s:5:\"Filer\";s:2:\"de\";s:7:\"Dateien\";s:2:\"el\";s:12:\"Αρχεία\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fa\";s:13:\"فایل ها\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"he\";s:10:\"קבצים\";s:2:\"id\";s:4:\"File\";s:2:\"it\";s:4:\"File\";s:2:\"lt\";s:6:\"Failai\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"ru\";s:10:\"Файлы\";s:2:\"sl\";s:8:\"Datoteke\";s:2:\"tw\";s:6:\"檔案\";s:2:\"cn\";s:6:\"档案\";s:2:\"hu\";s:7:\"Fájlok\";s:2:\"th\";s:12:\"ไฟล์\";s:2:\"se\";s:5:\"Filer\";}','files','2.0.0',NULL,'a:24:{s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"ar\";s:50:\"إدارة ملفات ومجلّدات موقعك.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"pt\";s:59:\"Permite gerir facilmente os ficheiros e pastas do seu site.\";s:2:\"cs\";s:43:\"Spravujte soubory a složky na vašem webu.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"el\";s:100:\"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fa\";s:79:\"مدیریت فایل های چند رسانه ای و فولدر ها سایت\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"fr\";s:46:\"Gérer les fichiers et dossiers de votre site.\";s:2:\"he\";s:47:\"ניהול תיקיות וקבצים שבאתר\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"lt\";s:28:\"Katalogų ir bylų valdymas.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"ru\";s:78:\"Управление файлами и папками вашего сайта.\";s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaši strani\";s:2:\"tw\";s:33:\"管理網站中的檔案與目錄\";s:2:\"cn\";s:33:\"管理网站中的档案与目录\";s:2:\"hu\";s:41:\"Fájlok és mappák kezelése az oldalon.\";s:2:\"th\";s:141:\"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ\";s:2:\"se\";s:45:\"Hanterar filer och mappar för din webbplats.\";}',0,0,1,'content',1,1,1,1445311264),(9,'a:24:{s:2:\"en\";s:6:\"Groups\";s:2:\"ar\";s:18:\"المجموعات\";s:2:\"br\";s:6:\"Grupos\";s:2:\"pt\";s:6:\"Grupos\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"da\";s:7:\"Grupper\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"el\";s:12:\"Ομάδες\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fa\";s:13:\"گروه ها\";s:2:\"fi\";s:7:\"Ryhmät\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"he\";s:12:\"קבוצות\";s:2:\"id\";s:4:\"Grup\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"lt\";s:7:\"Grupės\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"ru\";s:12:\"Группы\";s:2:\"sl\";s:7:\"Skupine\";s:2:\"tw\";s:6:\"群組\";s:2:\"cn\";s:6:\"群组\";s:2:\"hu\";s:9:\"Csoportok\";s:2:\"th\";s:15:\"กลุ่ม\";s:2:\"se\";s:7:\"Grupper\";}','groups','1.0.0',NULL,'a:24:{s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"ar\";s:100:\"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.\";s:2:\"br\";s:72:\"Usuários podem ser inseridos em grupos para gerenciar suas permissões.\";s:2:\"pt\";s:74:\"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.\";s:2:\"cs\";s:77:\"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"de\";s:85:\"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"el\";s:168:\"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.\";s:2:\"es\";s:75:\"Los usuarios podrán ser colocados en grupos para administrar sus permisos.\";s:2:\"fa\";s:149:\"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد\";s:2:\"fi\";s:84:\"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.\";s:2:\"he\";s:62:\"נותן אפשרות לאסוף משתמשים לקבוצות\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"lt\";s:67:\"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"ru\";s:134:\"Пользователей можно объединять в группы, для управления правами доступа.\";s:2:\"sl\";s:64:\"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj\";s:2:\"tw\";s:45:\"用戶可以依群組分類並管理其權限\";s:2:\"cn\";s:45:\"用户可以依群组分类并管理其权限\";s:2:\"hu\";s:73:\"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.\";s:2:\"th\";s:84:\"สามารถวางผู้ใช้ลงในกลุ่มเพื่\";s:2:\"se\";s:76:\"Användare kan delas in i grupper för att hantera roller och behörigheter.\";}',0,0,1,'users',1,1,1,1445311264),(10,'a:17:{s:2:\"en\";s:8:\"Keywords\";s:2:\"ar\";s:21:\"كلمات البحث\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"pt\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"Nøgleord\";s:2:\"el\";s:27:\"Λέξεις Κλειδιά\";s:2:\"fa\";s:21:\"کلمات کلیدی\";s:2:\"fr\";s:10:\"Mots-Clés\";s:2:\"id\";s:10:\"Kata Kunci\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"tw\";s:6:\"鍵詞\";s:2:\"cn\";s:6:\"键词\";s:2:\"hu\";s:11:\"Kulcsszavak\";s:2:\"fi\";s:10:\"Avainsanat\";s:2:\"sl\";s:15:\"Ključne besede\";s:2:\"th\";s:15:\"คำค้น\";s:2:\"se\";s:9:\"Nyckelord\";}','keywords','1.1.0',NULL,'a:17:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"ar\";s:124:\"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.\";s:2:\"br\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"pt\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nøgleord for at organisere dit indhold.\";s:2:\"el\";s:181:\"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.\";s:2:\"fa\";s:110:\"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا\";s:2:\"fr\";s:87:\"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"tw\";s:64:\"集中管理可用於標題與內容的鍵詞(keywords)列表。\";s:2:\"cn\";s:64:\"集中管理可用于标题与内容的键词(keywords)列表。\";s:2:\"hu\";s:65:\"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.\";s:2:\"fi\";s:92:\"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.\";s:2:\"sl\";s:82:\"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.\";s:2:\"th\";s:189:\"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ\";s:2:\"se\";s:61:\"Hantera nyckelord för att organisera webbplatsens innehåll.\";}',0,0,1,'data',1,1,1,1445311264),(11,'a:15:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"pt\";s:12:\"Manutenção\";s:2:\"ar\";s:14:\"الصيانة\";s:2:\"el\";s:18:\"Συντήρηση\";s:2:\"hu\";s:13:\"Karbantartás\";s:2:\"fa\";s:15:\"نگه داری\";s:2:\"fi\";s:9:\"Ylläpito\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"id\";s:12:\"Pemeliharaan\";s:2:\"it\";s:12:\"Manutenzione\";s:2:\"se\";s:10:\"Underhåll\";s:2:\"sl\";s:12:\"Vzdrževanje\";s:2:\"th\";s:39:\"การบำรุงรักษา\";s:2:\"tw\";s:6:\"維護\";s:2:\"cn\";s:6:\"维护\";}','maintenance','1.0.0',NULL,'a:15:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"pt\";s:68:\"Gerir o cache do seu site e exportar informações da base de dados.\";s:2:\"ar\";s:81:\"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.\";s:2:\"el\";s:142:\"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";s:2:\"it\";s:65:\"Gestisci la cache del sito e esporta le informazioni dal database\";s:2:\"fa\";s:73:\"مدیریت کش سایت و صدور اطلاعات از دیتابیس\";s:2:\"fr\";s:71:\"Gérer le cache du site et exporter les contenus de la base de données\";s:2:\"fi\";s:59:\"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.\";s:2:\"hu\";s:66:\"Az oldal gyorsítótár kezelése és az adatbázis exportálása.\";s:2:\"se\";s:76:\"Underhåll webbplatsens cache och exportera data från webbplatsens databas.\";s:2:\"sl\";s:69:\"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.\";s:2:\"th\";s:150:\"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล\";s:2:\"tw\";s:45:\"經由管理介面手動刪除暫存資料。\";s:2:\"cn\";s:45:\"经由管理介面手动删除暂存资料。\";}',0,0,1,'data',1,1,1,1445311264),(12,'a:25:{s:2:\"en\";s:10:\"Navigation\";s:2:\"ar\";s:14:\"الروابط\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"da\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"es\";s:11:\"Navegación\";s:2:\"fa\";s:11:\"منو ها\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"he\";s:10:\"ניווט\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"sl\";s:10:\"Navigacija\";s:2:\"tw\";s:12:\"導航選單\";s:2:\"cn\";s:12:\"导航选单\";s:2:\"th\";s:36:\"ตัวช่วยนำทาง\";s:2:\"hu\";s:11:\"Navigáció\";s:2:\"se\";s:10:\"Navigation\";}','navigation','1.1.0',NULL,'a:25:{s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"ar\";s:85:\"إدارة روابط وقوائم ومجموعات الروابط في الموقع.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.\";s:2:\"pt\";s:93:\"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.\";s:2:\"cs\";s:73:\"Správa odkazů v navigaci a všech souvisejících navigačních skupin.\";s:2:\"da\";s:82:\"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.\";s:2:\"de\";s:76:\"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen\";s:2:\"el\";s:207:\"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.\";s:2:\"es\";s:102:\"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.\";s:2:\"fa\";s:68:\"مدیریت منو ها و گروه های مربوط به آنها\";s:2:\"fi\";s:91:\"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.\";s:2:\"fr\";s:97:\"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"he\";s:73:\"ניהול שלוחות תפריטי ניווט וקבוצות ניווט\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"pl\";s:95:\"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.\";s:2:\"ru\";s:136:\"Управление ссылками в меню навигации и группах, к которым они принадлежат.\";s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"tw\";s:72:\"管理導航選單中的連結，以及它們所隸屬的導航群組。\";s:2:\"cn\";s:72:\"管理导航选单中的连结，以及它们所隶属的导航群组。\";s:2:\"th\";s:108:\"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง\";s:2:\"se\";s:33:\"Hantera länkar och länkgrupper.\";s:2:\"hu\";s:100:\"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.\";}',0,0,1,'structure',1,1,1,1445311264),(13,'a:25:{s:2:\"en\";s:5:\"Pages\";s:2:\"ar\";s:14:\"الصفحات\";s:2:\"br\";s:8:\"Páginas\";s:2:\"pt\";s:8:\"Páginas\";s:2:\"cs\";s:8:\"Stránky\";s:2:\"da\";s:5:\"Sider\";s:2:\"de\";s:6:\"Seiten\";s:2:\"el\";s:14:\"Σελίδες\";s:2:\"es\";s:8:\"Páginas\";s:2:\"fa\";s:14:\"صفحه ها \";s:2:\"fi\";s:5:\"Sivut\";s:2:\"fr\";s:5:\"Pages\";s:2:\"he\";s:8:\"דפים\";s:2:\"id\";s:7:\"Halaman\";s:2:\"it\";s:6:\"Pagine\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"pl\";s:6:\"Strony\";s:2:\"ru\";s:16:\"Страницы\";s:2:\"sl\";s:6:\"Strani\";s:2:\"tw\";s:6:\"頁面\";s:2:\"cn\";s:6:\"页面\";s:2:\"hu\";s:7:\"Oldalak\";s:2:\"th\";s:21:\"หน้าเพจ\";s:2:\"se\";s:5:\"Sidor\";}','pages','2.2.0',NULL,'a:25:{s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"ar\";s:99:\"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.\";s:2:\"br\";s:82:\"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.\";s:2:\"pt\";s:86:\"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.\";s:2:\"cs\";s:74:\"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.\";s:2:\"da\";s:71:\"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.\";s:2:\"de\";s:49:\"Füge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"el\";s:152:\"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.\";s:2:\"es\";s:77:\"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fa\";s:96:\"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید\";s:2:\"fi\";s:47:\"Lisää mitä tahansa sisältöä sivustollesi.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.\";s:2:\"he\";s:35:\"ניהול דפי תוכן האתר\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"lt\";s:46:\"Pridėkite nuosavus puslapius betkokio turinio\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj własne strony z dowolną treścią do witryny.\";s:2:\"ru\";s:134:\"Управление информационными страницами сайта, с произвольным содержимым.\";s:2:\"sl\";s:44:\"Dodaj stran s kakršno koli vsebino želite.\";s:2:\"tw\";s:39:\"為您的網站新增自定的頁面。\";s:2:\"cn\";s:39:\"为您的网站新增自定的页面。\";s:2:\"th\";s:168:\"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ\";s:2:\"hu\";s:67:\"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.\";s:2:\"se\";s:39:\"Lägg till egna sidor till webbplatsen.\";}',1,1,1,'content',1,1,1,1445311264),(14,'a:25:{s:2:\"en\";s:11:\"Permissions\";s:2:\"ar\";s:18:\"الصلاحيات\";s:2:\"br\";s:11:\"Permissões\";s:2:\"pt\";s:11:\"Permissões\";s:2:\"cs\";s:12:\"Oprávnění\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"el\";s:20:\"Δικαιώματα\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fa\";s:15:\"اجازه ها\";s:2:\"fi\";s:16:\"Käyttöoikeudet\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"he\";s:12:\"הרשאות\";s:2:\"id\";s:9:\"Perizinan\";s:2:\"it\";s:8:\"Permessi\";s:2:\"lt\";s:7:\"Teisės\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"ru\";s:25:\"Права доступа\";s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"tw\";s:6:\"權限\";s:2:\"cn\";s:6:\"权限\";s:2:\"hu\";s:14:\"Jogosultságok\";s:2:\"th\";s:18:\"สิทธิ์\";s:2:\"se\";s:13:\"Behörigheter\";}','permissions','1.0.0',NULL,'a:25:{s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"ar\";s:127:\"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.\";s:2:\"br\";s:68:\"Controle quais tipos de usuários podem ver certas seções no site.\";s:2:\"pt\";s:75:\"Controle quais os tipos de utilizadores podem ver certas secções no site.\";s:2:\"cs\";s:93:\"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"el\";s:180:\"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.\";s:2:\"fa\";s:59:\"مدیریت اجازه های گروه های کاربری\";s:2:\"fi\";s:72:\"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.\";s:2:\"fr\";s:104:\"Permet de définir les autorisations des groupes d\'utilisateurs pour afficher les différentes sections.\";s:2:\"he\";s:75:\"ניהול הרשאות כניסה לאיזורים מסוימים באתר\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.\";s:2:\"ru\";s:209:\"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.\";s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.\";s:2:\"tw\";s:81:\"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。\";s:2:\"cn\";s:81:\"用来控制不同类别的用户，设定其浏览特定网站内容的权限。\";s:2:\"hu\";s:129:\"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.\";s:2:\"th\";s:117:\"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง\";s:2:\"se\";s:27:\"Hantera gruppbehörigheter.\";}',0,0,1,'users',1,1,1,1445311264),(15,'a:24:{s:2:\"en\";s:9:\"Redirects\";s:2:\"ar\";s:18:\"التوجيهات\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"pt\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"Přesměrování\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"el\";s:30:\"Ανακατευθύνσεις\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fa\";s:17:\"انتقال ها\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"he\";s:12:\"הפניות\";s:2:\"id\";s:8:\"Redirect\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"ru\";s:30:\"Перенаправления\";s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"tw\";s:6:\"轉址\";s:2:\"cn\";s:6:\"转址\";s:2:\"hu\";s:17:\"Átirányítások\";s:2:\"pl\";s:14:\"Przekierowania\";s:2:\"th\";s:42:\"เปลี่ยนเส้นทาง\";s:2:\"se\";s:14:\"Omdirigeringar\";}','redirects','1.0.0',NULL,'a:24:{s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"ar\";s:47:\"التوجيه من رابط URL إلى آخر.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"pt\";s:40:\"Redirecionamentos de uma URL para outra.\";s:2:\"cs\";s:43:\"Přesměrujte z jedné adresy URL na jinou.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"el\";s:81:\"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fa\";s:63:\"انتقال دادن یک صفحه به یک آدرس دیگر\";s:2:\"fi\";s:45:\"Uudelleenohjaa käyttäjän paikasta toiseen.\";s:2:\"fr\";s:34:\"Redirection d\'une URL à un autre.\";s:2:\"he\";s:43:\"הפניות מכתובת אחת לאחרת\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"lt\";s:56:\"Peradresuokite puslapį iš vieno adreso (URL) į kitą.\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"ru\";s:78:\"Перенаправления с одного адреса на другой.\";s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"tw\";s:33:\"將網址轉址、重新定向。\";s:2:\"cn\";s:33:\"将网址转址、重新定向。\";s:2:\"hu\";s:38:\"Egy URL átirányítása egy másikra.\";s:2:\"pl\";s:44:\"Przekierowanie z jednego adresu URL na inny.\";s:2:\"th\";s:123:\"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง\";s:2:\"se\";s:38:\"Omdirigera från en URL till en annan.\";}',0,0,1,'structure',1,1,1,1445311264),(16,'a:10:{s:2:\"en\";s:6:\"Search\";s:2:\"br\";s:7:\"Procura\";s:2:\"fr\";s:9:\"Recherche\";s:2:\"se\";s:4:\"Sök\";s:2:\"ar\";s:10:\"البحث\";s:2:\"tw\";s:6:\"搜尋\";s:2:\"cn\";s:6:\"搜寻\";s:2:\"it\";s:7:\"Ricerca\";s:2:\"fa\";s:10:\"جستجو\";s:2:\"fi\";s:4:\"Etsi\";}','search','1.0.0',NULL,'a:10:{s:2:\"en\";s:72:\"Search through various types of content with this modular search system.\";s:2:\"br\";s:73:\"Procure por vários tipos de conteúdo com este sistema de busca modular.\";s:2:\"fr\";s:84:\"Rechercher parmi différents types de contenus avec système de recherche modulaire.\";s:2:\"se\";s:36:\"Sök igenom olika typer av innehåll\";s:2:\"ar\";s:102:\"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.\";s:2:\"tw\";s:63:\"此模組可用以搜尋網站中不同類型的資料內容。\";s:2:\"cn\";s:63:\"此模组可用以搜寻网站中不同类型的资料内容。\";s:2:\"it\";s:71:\"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare\";s:2:\"fa\";s:115:\"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.\";s:2:\"fi\";s:76:\"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.\";}',0,0,0,'0',1,1,1,1445311264),(17,'a:20:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"ar\";s:23:\"خريطة الموقع\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"pt\";s:12:\"Mapa do Site\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Χάρτης Ιστότοπου\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fa\";s:17:\"نقشه سایت\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"id\";s:10:\"Peta Situs\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"lt\";s:16:\"Svetainės medis\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"ru\";s:21:\"Карта сайта\";s:2:\"tw\";s:12:\"網站地圖\";s:2:\"cn\";s:12:\"网站地图\";s:2:\"th\";s:21:\"ไซต์แมพ\";s:2:\"hu\";s:13:\"Oldaltérkép\";s:2:\"se\";s:9:\"Sajtkarta\";}','sitemap','1.3.0',NULL,'a:21:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"ar\";s:120:\"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.\";s:2:\"br\";s:102:\"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"pt\";s:102:\"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.\";s:2:\"el\";s:190:\"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.\";s:2:\"es\";s:111:\"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.\";s:2:\"fa\";s:150:\"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"fr\";s:106:\"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"lt\";s:86:\"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"ru\";s:144:\"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.\";s:2:\"tw\";s:84:\"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。\";s:2:\"cn\";s:84:\"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。\";s:2:\"th\";s:202:\"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.\";s:2:\"hu\";s:94:\"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.\";s:2:\"se\";s:86:\"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.\";}',0,1,0,'content',1,1,1,1445311264),(18,'a:25:{s:2:\"en\";s:5:\"Users\";s:2:\"ar\";s:20:\"المستخدمون\";s:2:\"br\";s:9:\"Usuários\";s:2:\"pt\";s:12:\"Utilizadores\";s:2:\"cs\";s:11:\"Uživatelé\";s:2:\"da\";s:7:\"Brugere\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"el\";s:14:\"Χρήστες\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fa\";s:14:\"کاربران\";s:2:\"fi\";s:12:\"Käyttäjät\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"he\";s:14:\"משתמשים\";s:2:\"id\";s:8:\"Pengguna\";s:2:\"it\";s:6:\"Utenti\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"Użytkownicy\";s:2:\"ru\";s:24:\"Пользователи\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"tw\";s:6:\"用戶\";s:2:\"cn\";s:6:\"用户\";s:2:\"hu\";s:14:\"Felhasználók\";s:2:\"th\";s:27:\"ผู้ใช้งาน\";s:2:\"se\";s:10:\"Användare\";}','users','1.1.0',NULL,'a:25:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"ar\";s:133:\"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.\";s:2:\"br\";s:125:\"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.\";s:2:\"pt\";s:125:\"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.\";s:2:\"cs\";s:103:\"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.\";s:2:\"el\";s:208:\"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.\";s:2:\"fa\";s:151:\"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید\";s:2:\"fi\";s:126:\"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gérer via le panneau de contrôle\";s:2:\"he\";s:62:\"ניהול משתמשים: רישום, הפעלה ומחיקה\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"lt\";s:106:\"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.\";s:2:\"ru\";s:155:\"Управление зарегистрированными пользователями, активирование новых пользователей.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče\";s:2:\"tw\";s:87:\"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。\";s:2:\"cn\";s:87:\"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。\";s:2:\"th\";s:210:\"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม\";s:2:\"hu\";s:120:\"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.\";s:2:\"se\";s:111:\"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.\";}',0,0,1,'0',1,1,1,1445311264),(19,'a:25:{s:2:\"en\";s:9:\"Variables\";s:2:\"ar\";s:20:\"المتغيّرات\";s:2:\"br\";s:10:\"Variáveis\";s:2:\"pt\";s:10:\"Variáveis\";s:2:\"cs\";s:10:\"Proměnné\";s:2:\"da\";s:8:\"Variable\";s:2:\"de\";s:9:\"Variablen\";s:2:\"el\";s:20:\"Μεταβλητές\";s:2:\"es\";s:9:\"Variables\";s:2:\"fa\";s:16:\"متغییرها\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"fr\";s:9:\"Variables\";s:2:\"he\";s:12:\"משתנים\";s:2:\"id\";s:8:\"Variabel\";s:2:\"it\";s:9:\"Variabili\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"ru\";s:20:\"Переменные\";s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"tw\";s:12:\"系統變數\";s:2:\"cn\";s:12:\"系统变数\";s:2:\"th\";s:18:\"ตัวแปร\";s:2:\"se\";s:9:\"Variabler\";s:2:\"hu\";s:10:\"Változók\";}','variables','1.0.0',NULL,'a:25:{s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"ar\";s:97:\"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.\";s:2:\"br\";s:61:\"Gerencia as variáveis globais acessíveis de qualquer lugar.\";s:2:\"pt\";s:58:\"Gerir as variáveis globais acessíveis de qualquer lugar.\";s:2:\"cs\";s:56:\"Spravujte globální proměnné přístupné odkudkoliv.\";s:2:\"da\";s:51:\"Håndtér globale variable som kan tilgås overalt.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.\";s:2:\"el\";s:129:\"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fa\";s:136:\"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.\";s:2:\"fr\";s:92:\"Gérer des variables globales pour pouvoir y accéder depuis n\'importe quel endroit du site.\";s:2:\"he\";s:96:\"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"lt\";s:64:\"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.\";s:2:\"ru\";s:136:\"Управление глобальными переменными, которые доступны в любом месте сайта.\";s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"th\";s:148:\"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.\";s:2:\"tw\";s:45:\"管理此網站內可存取的全局變數。\";s:2:\"cn\";s:45:\"管理此网站内可存取的全局变数。\";s:2:\"hu\";s:62:\"Globális változók kezelése a hozzáféréshez, bárhonnan.\";s:2:\"se\";s:66:\"Hantera globala variabler som kan avändas över hela webbplatsen.\";}',0,0,1,'data',1,1,1,1445311264),(20,'a:23:{s:2:\"en\";s:7:\"Widgets\";s:2:\"br\";s:7:\"Widgets\";s:2:\"pt\";s:7:\"Widgets\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"da\";s:7:\"Widgets\";s:2:\"de\";s:7:\"Widgets\";s:2:\"el\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"fa\";s:13:\"ویجت ها\";s:2:\"fi\";s:9:\"Vimpaimet\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"id\";s:6:\"Widget\";s:2:\"it\";s:7:\"Widgets\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Виджеты\";s:2:\"sl\";s:9:\"Vtičniki\";s:2:\"tw\";s:9:\"小組件\";s:2:\"cn\";s:9:\"小组件\";s:2:\"hu\";s:9:\"Widget-ek\";s:2:\"th\";s:21:\"วิดเจ็ต\";s:2:\"se\";s:8:\"Widgetar\";s:2:\"ar\";s:14:\"الودجتس\";}','widgets','1.2.0',NULL,'a:23:{s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"ar\";s:132:\"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ\"ودجتس\".\";s:2:\"br\";s:77:\"Gerenciar pequenas seções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"pt\";s:74:\"Gerir pequenas secções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"cs\";s:56:\"Spravujte malé funkční části webu neboli \"Widgety\".\";s:2:\"da\";s:74:\"Håndter små sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentständige Bereiche, genannt \"Widgets\".\";s:2:\"el\";s:149:\"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeñas secciones de lógica autocontenida en bloques o \"Widgets\"\";s:2:\"fa\";s:76:\"مدیریت قسمت های کوچکی از سایت به طور مستقل\";s:2:\"fi\";s:81:\"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai \"Vimpaimia\".\";s:2:\"fr\";s:41:\"Gérer des mini application ou \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"lt\";s:43:\"Nedidelių, savarankiškų blokų valdymas.\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"ru\";s:91:\"Управление небольшими, самостоятельными блоками.\";s:2:\"sl\";s:61:\"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)\";s:2:\"tw\";s:103:\"可將小段的程式碼透過小組件來管理。即所謂 \"Widgets\"，或稱為小工具、部件。\";s:2:\"cn\";s:103:\"可将小段的程式码透过小组件来管理。即所谓 \"Widgets\"，或称为小工具、部件。\";s:2:\"hu\";s:56:\"Önálló kis logikai tömbök vagy widget-ek kezelése.\";s:2:\"th\";s:152:\"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต\";s:2:\"se\";s:83:\"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.\";}',1,0,1,'content',1,1,1,1445311264),(21,'a:10:{s:2:\"en\";s:7:\"WYSIWYG\";s:2:\"br\";s:7:\"WYSIWYG\";s:2:\"fa\";s:7:\"WYSIWYG\";s:2:\"fr\";s:7:\"WYSIWYG\";s:2:\"pt\";s:7:\"WYSIWYG\";s:2:\"se\";s:15:\"HTML-redigerare\";s:2:\"tw\";s:7:\"WYSIWYG\";s:2:\"cn\";s:7:\"WYSIWYG\";s:2:\"ar\";s:27:\"المحرر الرسومي\";s:2:\"it\";s:7:\"WYSIWYG\";}','wysiwyg','1.0.0',NULL,'a:11:{s:2:\"en\";s:60:\"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.\";s:2:\"br\";s:64:\"Provém o editor WYSIWYG para o PyroCMS fornecido pelo CKEditor.\";s:2:\"fa\";s:73:\"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. \";s:2:\"fr\";s:63:\"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor\";s:2:\"pt\";s:61:\"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.\";s:2:\"el\";s:113:\"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.\";s:2:\"se\";s:37:\"Redigeringsmodul för HTML, CKEditor.\";s:2:\"tw\";s:83:\"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。\";s:2:\"cn\";s:83:\"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。\";s:2:\"ar\";s:76:\"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.\";s:2:\"it\";s:57:\"Fornisce l\'editor WYSIWYG per PtroCMS creato con CKEditor\";}',0,0,0,'0',1,1,1,1445311264),(22,'a:2:{s:2:\"en\";s:3:\"Pam\";s:2:\"fr\";s:3:\"Pam\";}','pam','2.1',NULL,'a:2:{s:2:\"en\";s:50:\"Software administrasi SPAMDES TIRTO ROSO GAMPLONG.\";s:2:\"fr\";s:50:\"Software administrasi SPAMDES TIRTO ROSO GAMPLONG.\";}',0,0,1,'content',1,1,0,1445354679),(25,'a:1:{s:2:\"en\";s:6:\"Sample\";}','sample','2.1',NULL,'a:1:{s:2:\"en\";s:32:\"This is a PyroCMS module sample.\";}',0,1,1,'content',0,0,0,1445312283),(30,'a:2:{s:2:\"en\";s:7:\"Sliders\";s:2:\"fr\";s:7:\"Sliders\";}','sliders','1.1.0',NULL,'a:2:{s:2:\"en\";s:59:\"Add Nivo Sliders to your site and display featured content.\";s:2:\"fr\";s:68:\"Ajoutez un slider à votre site et affichez du contenu promotionnel.\";}',0,0,1,'content',0,0,0,1445313304);
/*!40000 ALTER TABLE `default_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_navigation_groups`
--

DROP TABLE IF EXISTS `default_navigation_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abbrev` (`abbrev`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_navigation_groups`
--

LOCK TABLES `default_navigation_groups` WRITE;
/*!40000 ALTER TABLE `default_navigation_groups` DISABLE KEYS */;
INSERT INTO `default_navigation_groups` VALUES (1,'Header','header'),(2,'Sidebar','sidebar'),(3,'Footer','footer');
/*!40000 ALTER TABLE `default_navigation_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_navigation_links`
--

DROP TABLE IF EXISTS `default_navigation_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id` (`navigation_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_navigation_links`
--

LOCK TABLES `default_navigation_links` WRITE;
/*!40000 ALTER TABLE `default_navigation_links` DISABLE KEYS */;
INSERT INTO `default_navigation_links` VALUES (1,'Home',NULL,'page',1,'','','',1,1,NULL,NULL,''),(2,'Blog',NULL,'module',NULL,'blog','','',1,2,NULL,NULL,''),(3,'Contact',NULL,'page',2,'','','',1,3,NULL,NULL,'');
/*!40000 ALTER TABLE `default_navigation_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_page_types`
--

DROP TABLE IF EXISTS `default_page_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_page_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `stream_id` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  `save_as_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `content_label` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_page_types`
--

LOCK TABLES `default_page_types` WRITE;
/*!40000 ALTER TABLE `default_page_types` DISABLE KEYS */;
INSERT INTO `default_page_types` VALUES (1,'default','Default','A simple page type with a WYSIWYG editor that will get you started adding content.',2,NULL,NULL,NULL,'<h2>{{ page:title }}</h2>\n\n{{ body }}','','','default',1445311121,'n',NULL,NULL);
/*!40000 ALTER TABLE `default_page_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pages`
--

DROP TABLE IF EXISTS `default_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_no_index` tinyint(1) DEFAULT NULL,
  `meta_robots_no_follow` tinyint(1) DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pages`
--

LOCK TABLES `default_pages` WRITE;
/*!40000 ALTER TABLE `default_pages` DISABLE KEYS */;
INSERT INTO `default_pages` VALUES (1,'home','','Home','home',0,'1','1',NULL,NULL,NULL,'',NULL,NULL,NULL,0,0,'live',1445311121,0,'',1,1,1445311121),(2,'contact','','Contact','contact',0,'1','2',NULL,NULL,NULL,'',NULL,NULL,NULL,0,0,'live',1445311121,0,'',0,1,1445311121),(3,'search','','Search','search',0,'1','3',NULL,NULL,NULL,'',NULL,NULL,NULL,0,0,'live',1445311121,0,'',0,1,1445311121),(4,'results','','Results','search/results',3,'1','4',NULL,NULL,NULL,'',NULL,NULL,NULL,0,0,'live',1445311121,0,'',0,0,1445311121),(5,'404','','Page missing','404',0,'1','5',NULL,NULL,NULL,'',NULL,NULL,NULL,0,0,'live',1445311121,0,'',0,1,1445311121);
/*!40000 ALTER TABLE `default_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pams`
--

DROP TABLE IF EXISTS `default_pams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `jquery` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pams`
--

LOCK TABLES `default_pams` WRITE;
/*!40000 ALTER TABLE `default_pams` DISABLE KEYS */;
INSERT INTO `default_pams` VALUES (1,2,0);
/*!40000 ALTER TABLE `default_pams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pelanggan`
--

DROP TABLE IF EXISTS `default_pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pelanggan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nomor` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `jenis` enum('normal','umum','gratis') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pelanggan`
--

LOCK TABLES `default_pelanggan` WRITE;
/*!40000 ALTER TABLE `default_pelanggan` DISABLE KEYS */;
INSERT INTO `default_pelanggan` VALUES (1,1,'SUGIYONO','1','62','normal'),(2,2,'RUSMANTO','1','62','normal'),(3,3,'M TOHIR','1','62','normal'),(4,4,'SUDARMAJI','1','62','normal'),(5,5,'NGADIMAN','1','62','normal'),(6,6,'SUPARDI','1','62','normal'),(7,7,'RONDIYAH','1','','normal'),(8,8,'ARIS PRAWOTO','1','','normal'),(9,9,'SURITNO','1','','normal'),(10,10,'SUTIRAH','1','','normal'),(11,11,'ARIF JOKO TRIYANTO','1','','normal'),(12,12,'AWALUDIN','1','','normal'),(13,13,'GIMANTO','1','','normal'),(14,14,'ASWANTO S','1','','normal'),(15,15,'SALAMUN','1','','normal'),(16,16,'SYAMSUHADI','1','','normal'),(17,17,'SUKARDI','1','','normal'),(18,18,'JUMADI','1','','normal'),(19,19,'SUKIDI','1','','normal'),(20,20,'R KURNIADI','1','','normal'),(21,21,'ZAROWI','1','','normal'),(22,22,'SUMARIYO','1','','normal'),(23,23,'BAMBANG YULIANTO','1','','normal'),(24,24,'DAHRONI','1','','normal'),(25,25,'SINUNG P','1','','normal'),(26,26,'KHOMAERI','1','','normal'),(27,27,'BUDIYARTO','1','','normal'),(28,28,'SUGIYARTO','1','','normal'),(29,29,'NY WAGINAH','1','','normal'),(30,30,'KODARJI','1','','normal'),(31,31,'MASJID BAITURROHMAN','1','','gratis'),(32,32,'RAMIJO','1','','normal'),(33,33,'MARIYEM','1','','normal'),(34,34,'SUGIYANTO','1','','normal'),(35,35,'SURYADI','1','','normal'),(36,36,'SURYONO HS','1','','normal'),(37,37,'NURYANTO SUDARMO','1','','normal'),(38,38,'RAMIYEM','1','','normal'),(39,39,'WIDIYATUN','1','','normal'),(40,40,'SUWARJI','1','','normal'),(41,41,'SUWARJONO','1','','normal'),(42,42,'WASIMIN','1','','normal'),(43,43,'RIYANTO SUDARMO','1','','normal'),(44,44,'SUPRIYANTO','1','','normal'),(45,45,'SUGIYANTI','1','','normal'),(46,46,'WIDODO','1','','normal'),(47,47,'SAMSINUNG','1','','normal'),(48,48,'ABDUL ROHMAN','1','','normal'),(49,49,'AGUNG HIDAYAT','1','','normal'),(50,50,'M GARJIDTO','1','','normal'),(51,51,'DWI SANTOSO','1','','normal'),(52,52,'SOGIMAN / MARDI U','1','','normal'),(53,53,'SURONO','1','','normal'),(54,54,'GILIG EKO CAHYONO','1','','normal'),(55,55,'SURYONO','1','','normal'),(56,56,'SOKIJAN','1','','normal'),(57,57,'PARIJO','1','','normal'),(58,58,'SUPARMAN','1','','normal'),(59,59,'SUKIRMAN','1','','normal'),(60,60,'SUWARDI','1','','normal'),(61,61,'MULYONO','1','','normal'),(62,62,'BUDIAWAN','1','','normal'),(63,63,'SUDARMAN','1','','normal'),(64,64,'DADANG','1','','normal'),(65,65,'Suharno','1','','normal'),(66,66,'UNAWAN','1','','normal'),(67,67,'AGIYANTO','1','','normal'),(68,68,'RINA','1','','normal'),(69,69,'SURATIMIN/ AMSYAR SYAHBANI','1','','normal'),(70,70,'SUPARDI','1','','normal'),(71,71,'MAULANA','1','','normal'),(72,72,'WARIS KURNIAWAN','1','','normal'),(73,73,'P.KODARJI','1','','normal'),(74,74,'WIYONO','1','','normal'),(75,75,'LEGIMIN','1','','normal'),(76,1,'JUMARI','2','','normal'),(77,2,'SUKADAR','2','','normal'),(78,3,'EKO SUSANTO','2','','normal'),(79,4,'WARGINO','2','','normal'),(80,5,'MOMON','2','','normal'),(81,6,'SUGIWARTO','2','','normal'),(82,7,'MARTOREKOH','2','','normal'),(83,8,'AMIN','2','','normal'),(84,9,'ROHMADI','2','','normal'),(85,10,'ZAZIM','2','','normal'),(86,11,'HARYADI','2','','normal'),(87,12,'M MAHFUD','2','','normal'),(88,13,'HARYATNO','2','','normal'),(89,14,'TRI HANDOKO','2','','normal'),(90,15,'SUNDARI','2','','normal'),(91,16,'SAMSUL RIZAL','2','','normal'),(92,17,'HUSEIN EFENDI','2','','normal'),(93,18,'PURWATMO','2','','normal'),(94,19,'MUSHOLA MUTAQOROBIN','2','','umum'),(95,20,'PAIDI','2','','normal'),(96,21,'SUNASTRIATMO','2','','normal'),(97,22,'SUNGATNO','2','','normal'),(98,23,'AGUNG NUGROHO ','2','','normal'),(99,24,'TUGIYARTO','2','','normal'),(100,25,'SUWAJI','2','','normal'),(101,26,'SALIYEM / NUR','2','','normal'),(102,27,'SAMSUDI','2','','normal'),(103,28,'IDANG SIHABUDIN','2','','normal'),(104,29,'TUPAN','2','','normal'),(105,30,'TURIDI','2','','normal'),(106,31,'WASIRAN','2','','normal'),(107,32,'SUNARTO','2','','normal'),(108,33,'KUWAT IMAN DIKROMO','2','','normal'),(109,34,'ISKAMTO','2','','normal'),(110,35,'JUBAIDI','2','','normal'),(111,36,'MUSLIH / PONIDI','2','','normal'),(112,37,'MUSHOLA NURUL IMAN','2','','umum'),(113,38,'TUGIYO','2','','normal'),(114,39,'SUMADI','2','','normal'),(115,40,'BUDIMIN','2','','normal'),(116,41,'SUPRIYO','2','','normal'),(117,42,'PAENO','2','','normal'),(118,43,'MUSIMIN','2','','normal'),(119,44,'ISWANTO','2','','normal'),(120,45,'HARYANTO','2','','normal'),(121,46,'SRIWAHYUNI','2','','normal'),(122,47,'SUTONO','2','','normal'),(123,48,'JUMINGIN','2','','normal'),(124,49,'MARYONO','2','','normal'),(125,50,'GIYARTO','2','','normal'),(126,51,'NY SEMINEM','2','','normal'),(127,52,'HARIS','2','','normal'),(128,53,'MASJID AL-FALLAH','2','','gratis'),(129,54,'GIYONO','2','','normal'),(130,55,'SALIYEM / TOFA','2','','normal'),(131,56,'IRPAN AL ERPAN','2','','normal'),(132,57,'SUMARYANTO','2','','normal'),(133,58,'SUHIRJAN','2','','normal'),(134,59,'HARDONO','2','','normal'),(135,60,'KARYONO','2','','normal'),(136,61,'SUPARMAN SUPRAPTO','2','','normal'),(137,62,'MARWOTO','2','','normal'),(138,63,'APRIMAN','2','','normal'),(139,64,'ANGKORO BRAHMO','2','','normal'),(140,65,'SUKO RAHARJO','2','','normal'),(141,66,'BINTORO MALIS RUJITO','2','','normal'),(142,67,'UMARHADI','2','','normal'),(143,68,'ASBIN A','2','','normal'),(144,69,'R TRIYANUNG','2','','normal'),(145,70,'MUSHOLA AL-ADDIEN','2','','umum'),(146,71,'SD MUH GAMPLONG','2','','normal'),(147,72,'AHYADI','2','','normal'),(148,73,'SUPARDI','2','','normal'),(149,74,'MUJILAN','2','','normal'),(150,75,'PAULUS PRASAJA','2','','normal'),(151,76,'SUBEKTI','2','','normal'),(152,77,'JARIMIN','2','','normal'),(153,78,'KEL. LEMBU LESTARI','2','','normal'),(154,79,'TUPON','2','','normal'),(155,80,'TUGIYAT','2','','normal'),(156,81,'SARJIYEM','2','','normal'),(157,82,'ZUWARNO','2','','normal'),(158,83,'ISMAN','2','','normal'),(159,84,'MUSHOLA NURUL YAQIN','2','','umum'),(160,85,'PARDINEM','2','','normal'),(161,86,'TUPAN 2','2','','normal'),(162,87,'NGADIYO','2','','normal'),(163,88,'Haryanto B','2','','normal'),(164,1,'NY KAMIYEM / SUGENG','3','','normal'),(165,2,'SUHARJO','3','','normal'),(166,3,'YUDHO MURWANTO','3','','normal'),(167,4,'WIYONO / SUTO','3','','normal'),(168,5,'AGUS SUBADI','3','','normal'),(169,6,'AGUS YUNIAWAN','3','','normal'),(170,7,'KUSNUHADI','3','','normal'),(171,8,'IBNU PUJARTO','3','','normal'),(172,9,'IBO KUNCORO','3','','normal'),(173,10,'HERUTOYO','3','','normal'),(174,11,'DWI ATMO WIBOWO','3','','normal'),(175,12,'SUMARMUJI','3','','normal'),(176,13,'SUPARTINI','3','','normal'),(177,14,'WIDARDI','3','','normal'),(178,15,'KIMIN','3','','normal'),(179,16,'DARYANTO','3','','normal'),(180,17,'KARYONO','3','','normal'),(181,18,'IWAN','3','','normal'),(182,19,'SARDIYANTO','3','','normal'),(183,20,'SANTOSO','3','','normal'),(184,21,'SUPRI','3','','normal'),(185,22,'RISYANTONO','3','','normal'),(186,23,'SUSITEM','3','','normal'),(187,24,'HANJONO','3','','normal'),(188,25,'NARKO','3','','normal'),(189,26,'FENDI DAFNAN EFENDI','3','','normal'),(190,27,'SUDIYONO','3','','normal'),(191,28,'KUNCORO','3','','normal'),(192,29,'SURASMAN','3','','normal'),(193,30,'MUSHOLA SAWO','3','','umum'),(194,31,'MARSENO','3','','normal'),(195,32,'SUKIJO','3','','normal'),(196,33,'WAHYUDI','3','','normal'),(197,34,'SUPADI','3','','normal'),(198,35,'MAKAM','3','','normal'),(199,36,'MUSHOLA AN NUR','3','','umum'),(200,37,'BUDI HARYANTO','3','','normal'),(201,38,'SUBADI','3','','normal'),(202,39,'SULASTRI','3','','normal'),(203,40,'SUJADI','3','','normal'),(204,41,'BAMBANG','3','','normal'),(205,42,'MARYANTO','3','','normal'),(206,43,'SUPRIATI','3','','normal'),(207,44,'MURSODO','3','','normal'),(208,45,'SAMURI','3','','normal'),(209,46,'WESTI','3','','normal'),(210,47,'SUPOMO','3','','normal'),(211,48,'ISMAN','3','','normal'),(212,49,'MURSARI','3','','normal'),(213,50,'PURNOMO','3','','normal'),(214,51,'MULYATI','3','','normal'),(215,52,'SARJANI','3','','normal'),(216,53,'Bp Suwar','3','','normal'),(217,54,'Bp Jemirin','3','','normal'),(218,1,'M SUSILOWATI','4','','normal'),(219,2,'SUDIBYO','4','','normal'),(220,3,'SADAR WIJAYANTO','4','','normal'),(221,4,'ANDREAS FEBRU','4','','normal'),(222,5,'ES SULISTIYOWATI','4','','normal'),(223,6,'SRI LESTARI','4','','normal'),(224,7,'NURKHOLIK','4','','normal'),(225,8,'SUMIYATI','4','','normal'),(226,9,'SUHARYANTO','4','','normal'),(227,10,'SUPRIYATMAN','4','','normal'),(228,11,'TRISMINAH','4','','normal'),(229,12,'SUGIYARTO','4','','normal'),(230,13,'SUYUDI','4','','normal'),(231,14,'RUSMANTO','4','','normal'),(232,15,'BASUKI','4','','normal'),(233,16,'ARIS / KUSMIYATI','4','','normal'),(234,17,'TUN SUMARYATI','4','','normal'),(235,18,'TANGGUH','4','','normal'),(236,19,'Mmasjid attaubah','4','','gratis'),(237,20,'ny rismilati','4','','normal'),(238,21,'SUPIRYANTO','4','','normal'),(239,22,'KARDIYO','4','','normal'),(240,23,'BANIYO','4','','normal'),(241,24,'KASMAT','4','','normal'),(242,25,'HADIDJAH','4','','normal'),(243,26,'PUTUT HERI P','4','','normal'),(244,27,'SUTARJI','4','','normal'),(245,28,'SUHARYONO','4','','normal'),(246,29,'HARTOPO','4','','normal'),(247,30,'SUPRIYANTO','4','','normal'),(248,31,'SUTOPO','4','','normal'),(249,32,'EKO MADE','4','','normal'),(250,33,'YUKRI','4','','normal'),(251,34,'SUDIYONO','4','','normal'),(252,35,'MUSHOLA MUNAWAROH','4','','umum'),(253,36,'DERBA IDAWATI','4','','normal'),(254,37,'WAHYU ADE SETIYAWAN','4','','normal'),(255,38,'IBU SUMI','4','','normal'),(256,39,'SUBARJONO','4','','normal'),(257,40,'RIYANTO / BU MUMUNG','4','','normal'),(258,41,'GIYANTO','4','','normal'),(259,42,'ASMIRANTO','4','','normal'),(260,43,'ASROFIANTO','4','','normal'),(261,44,'IR SUPARMAN','4','','normal'),(262,45,'MUZIATI','4','','normal'),(263,46,'JUREMI','4','','normal'),(264,47,'MUHAMMAD ZUHDI','4','','normal'),(265,48,'SUHARYANTO','4','','normal'),(266,49,'SUWARTO','4','','normal'),(267,50,'AHMAD TOHIRMAN','4','','normal'),(268,51,'WARNYOTO','4','','normal'),(269,52,'NGATEMI','4','','normal'),(270,53,'SIYAMSIH','4','','normal'),(271,54,'KARSINAH','4','','normal'),(272,55,'FUDUL MUNTOK','4','','normal'),(273,56,'TK ABA MUHAMMADIYAH','4','','normal'),(274,57,'GEDUNG MUHAMMADIYAH','4','','normal'),(275,58,'SUGIATO/ ATO','4','','normal'),(276,59,'PARYADI','4','','normal'),(277,60,'BU UPIK RAHAYU','4','','normal'),(278,61,'NGEBAK','4','','normal'),(279,62,'TM','4','','normal'),(280,63,'MARYANTO','4','','normal'),(281,64,'KRISWANDI','4','','normal'),(282,65,'SUPARJO','4','','normal'),(283,66,'SITI WAHIBAH ','4','','normal'),(284,67,'SIHONO SANTOSO','4','','normal'),(285,68,'BAKSO SER','4','','normal'),(286,69,'PAK JITO / MIE AYAM','4','','normal'),(287,70,'TENANG / ARJO TULUS','4','','normal'),(288,71,'P.DANANG','4','','normal'),(289,72,'AMAR','4','','normal'),(290,73,'SUYANTO','4','','normal'),(291,74,'WARDANI','4','','normal'),(292,1,'SARAHNO','5','','normal'),(293,2,'SUDARMI','5','','normal'),(294,3,'SUHARJO','5','','normal'),(295,4,'TRIYANTO','5','','normal'),(296,5,'KANA WIHARWATI','5','','normal'),(297,6,'SUMARNO','5','','normal'),(298,7,'JIMAN','5','','normal'),(299,8,'JAMADI','5','','normal'),(300,9,'WASITO','5','','normal'),(301,10,'GITO SISWOYO','5','','normal'),(302,11,'BADAKIM.H','5','','normal'),(303,12,'SONTIYAH','5','','normal'),(304,13,'NGATIYEM','5','','normal'),(305,14,'ABU BAKAR','5','','normal'),(306,15,'MUSHOLA ISTIQOMAH ','5','','umum'),(307,16,'MUHRODIN','5','','normal'),(308,17,'JOKO MULYANTO','5','','normal'),(309,18,'MAKAM DUKOH','5','','normal'),(310,19,'SIROT MULYONO','5','','normal');
/*!40000 ALTER TABLE `default_pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pembayaran`
--

DROP TABLE IF EXISTS `default_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pembayaran` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(12) NOT NULL,
  `bulan` date NOT NULL,
  `baca_meter` int(7) NOT NULL,
  `harus_bayar` int(13) NOT NULL,
  `dibayar` int(13) NOT NULL,
  `selisih` int(13) NOT NULL,
  `tanggal` datetime NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pembayaran`
--

LOCK TABLES `default_pembayaran` WRITE;
/*!40000 ALTER TABLE `default_pembayaran` DISABLE KEYS */;
INSERT INTO `default_pembayaran` VALUES (1,1,'2015-08-01',263,0,0,0,'0000-00-00 00:00:00',0),(2,2,'2015-08-01',196,0,0,0,'0000-00-00 00:00:00',0),(3,3,'2015-08-01',302,0,0,0,'0000-00-00 00:00:00',0),(4,4,'2015-08-01',417,0,0,0,'0000-00-00 00:00:00',0),(5,5,'2015-08-01',178,0,0,0,'0000-00-00 00:00:00',0),(6,6,'2015-08-01',252,0,0,0,'0000-00-00 00:00:00',0),(7,7,'2015-08-01',118,0,0,0,'0000-00-00 00:00:00',0),(8,8,'2015-08-01',114,0,0,0,'0000-00-00 00:00:00',0),(9,9,'2015-08-01',274,0,0,0,'0000-00-00 00:00:00',0),(10,10,'2015-08-01',202,0,0,0,'0000-00-00 00:00:00',0),(11,11,'2015-08-01',60,0,0,0,'0000-00-00 00:00:00',0),(12,12,'2015-08-01',69,0,0,0,'0000-00-00 00:00:00',0),(13,13,'2015-08-01',8,0,0,0,'0000-00-00 00:00:00',0),(14,14,'2015-08-01',269,0,0,0,'0000-00-00 00:00:00',0),(15,15,'2015-08-01',229,0,0,0,'0000-00-00 00:00:00',0),(16,16,'2015-08-01',395,0,0,0,'0000-00-00 00:00:00',0),(17,17,'2015-08-01',112,0,0,0,'0000-00-00 00:00:00',0),(18,18,'2015-08-01',221,0,0,0,'0000-00-00 00:00:00',0),(19,19,'2015-08-01',207,0,0,0,'0000-00-00 00:00:00',0),(20,20,'2015-08-01',206,0,0,0,'0000-00-00 00:00:00',0),(21,21,'2015-08-01',296,0,0,0,'0000-00-00 00:00:00',0),(22,22,'2015-08-01',229,0,0,0,'0000-00-00 00:00:00',0),(23,23,'2015-08-01',228,0,0,0,'0000-00-00 00:00:00',0),(24,24,'2015-08-01',200,0,0,0,'0000-00-00 00:00:00',0),(25,25,'2015-08-01',55,0,0,0,'0000-00-00 00:00:00',0),(26,26,'2015-08-01',355,0,0,0,'0000-00-00 00:00:00',0),(27,27,'2015-08-01',83,0,0,0,'0000-00-00 00:00:00',0),(28,28,'2015-08-01',357,0,0,0,'0000-00-00 00:00:00',0),(29,29,'2015-08-01',53,0,0,0,'0000-00-00 00:00:00',0),(30,30,'2015-08-01',139,0,0,0,'0000-00-00 00:00:00',0),(31,31,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(32,32,'2015-08-01',305,0,0,0,'0000-00-00 00:00:00',0),(33,33,'2015-08-01',100,0,0,0,'0000-00-00 00:00:00',0),(34,34,'2015-08-01',40,0,0,0,'0000-00-00 00:00:00',0),(35,35,'2015-08-01',239,0,0,0,'0000-00-00 00:00:00',0),(36,36,'2015-08-01',632,0,0,0,'0000-00-00 00:00:00',0),(37,37,'2015-08-01',203,0,0,0,'0000-00-00 00:00:00',0),(38,38,'2015-08-01',220,0,0,0,'0000-00-00 00:00:00',0),(39,39,'2015-08-01',34,0,0,0,'0000-00-00 00:00:00',0),(40,40,'2015-08-01',326,0,0,0,'0000-00-00 00:00:00',0),(41,41,'2015-08-01',338,0,0,0,'0000-00-00 00:00:00',0),(42,42,'2015-08-01',235,0,0,0,'0000-00-00 00:00:00',0),(43,43,'2015-08-01',34,0,0,0,'0000-00-00 00:00:00',0),(44,44,'2015-08-01',29,0,0,0,'0000-00-00 00:00:00',0),(45,45,'2015-08-01',261,0,0,0,'0000-00-00 00:00:00',0),(46,46,'2015-08-01',142,0,0,0,'0000-00-00 00:00:00',0),(47,47,'2015-08-01',83,0,0,0,'0000-00-00 00:00:00',0),(48,48,'2015-08-01',442,0,0,0,'0000-00-00 00:00:00',0),(49,49,'2015-08-01',176,0,0,0,'0000-00-00 00:00:00',0),(50,50,'2015-08-01',140,0,0,0,'0000-00-00 00:00:00',0),(51,51,'2015-08-01',609,0,0,0,'0000-00-00 00:00:00',0),(52,52,'2015-08-01',260,0,0,0,'0000-00-00 00:00:00',0),(53,53,'2015-08-01',210,0,0,0,'0000-00-00 00:00:00',0),(54,54,'2015-08-01',110,0,0,0,'0000-00-00 00:00:00',0),(55,55,'2015-08-01',445,0,0,0,'0000-00-00 00:00:00',0),(56,56,'2015-08-01',91,0,0,0,'0000-00-00 00:00:00',0),(57,57,'2015-08-01',103,0,0,0,'0000-00-00 00:00:00',0),(58,58,'2015-08-01',283,0,0,0,'0000-00-00 00:00:00',0),(59,59,'2015-08-01',220,0,0,0,'0000-00-00 00:00:00',0),(60,60,'2015-08-01',265,0,0,0,'0000-00-00 00:00:00',0),(61,61,'2015-08-01',93,0,0,0,'0000-00-00 00:00:00',0),(62,62,'2015-08-01',92,0,0,0,'0000-00-00 00:00:00',0),(63,63,'2015-08-01',134,0,0,0,'0000-00-00 00:00:00',0),(64,64,'2015-08-01',267,0,0,0,'0000-00-00 00:00:00',0),(65,65,'2015-08-01',66,0,0,0,'0000-00-00 00:00:00',0),(66,66,'2015-08-01',14,0,0,0,'0000-00-00 00:00:00',0),(67,67,'2015-08-01',255,0,0,0,'0000-00-00 00:00:00',0),(68,68,'2015-08-01',425,0,0,0,'0000-00-00 00:00:00',0),(69,69,'2015-08-01',517,0,0,0,'0000-00-00 00:00:00',0),(70,70,'2015-08-01',159,0,0,0,'0000-00-00 00:00:00',0),(71,71,'2015-08-01',37,0,0,0,'0000-00-00 00:00:00',0),(72,72,'2015-08-01',35,0,0,0,'0000-00-00 00:00:00',0),(73,73,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(74,74,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(75,75,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(76,76,'2015-08-01',144,0,0,0,'0000-00-00 00:00:00',0),(77,77,'2015-08-01',378,0,0,0,'0000-00-00 00:00:00',0),(78,78,'2015-08-01',285,0,0,0,'0000-00-00 00:00:00',0),(79,79,'2015-08-01',405,0,0,0,'0000-00-00 00:00:00',0),(80,80,'2015-08-01',57,0,0,0,'0000-00-00 00:00:00',0),(81,81,'2015-08-01',236,0,0,0,'0000-00-00 00:00:00',0),(82,82,'2015-08-01',86,0,0,0,'0000-00-00 00:00:00',0),(83,83,'2015-08-01',223,0,0,0,'0000-00-00 00:00:00',0),(84,84,'2015-08-01',394,0,0,0,'0000-00-00 00:00:00',0),(85,85,'2015-08-01',348,0,0,0,'0000-00-00 00:00:00',0),(86,86,'2015-08-01',217,0,0,0,'0000-00-00 00:00:00',0),(87,87,'2015-08-01',277,0,0,0,'0000-00-00 00:00:00',0),(88,88,'2015-08-01',136,0,0,0,'0000-00-00 00:00:00',0),(89,89,'2015-08-01',148,0,0,0,'0000-00-00 00:00:00',0),(90,90,'2015-08-01',86,0,0,0,'0000-00-00 00:00:00',0),(91,91,'2015-08-01',140,0,0,0,'0000-00-00 00:00:00',0),(92,92,'2015-08-01',151,0,0,0,'0000-00-00 00:00:00',0),(93,93,'2015-08-01',360,0,0,0,'0000-00-00 00:00:00',0),(94,94,'2015-08-01',100,0,0,0,'0000-00-00 00:00:00',0),(95,95,'2015-08-01',125,0,0,0,'0000-00-00 00:00:00',0),(96,96,'2015-08-01',455,0,0,0,'0000-00-00 00:00:00',0),(97,97,'2015-08-01',276,0,0,0,'0000-00-00 00:00:00',0),(98,98,'2015-08-01',365,0,0,0,'0000-00-00 00:00:00',0),(99,99,'2015-08-01',73,0,0,0,'0000-00-00 00:00:00',0),(100,100,'2015-08-01',418,0,0,0,'0000-00-00 00:00:00',0),(101,101,'2015-08-01',107,0,0,0,'0000-00-00 00:00:00',0),(102,102,'2015-08-01',255,0,0,0,'0000-00-00 00:00:00',0),(103,103,'2015-08-01',208,0,0,0,'0000-00-00 00:00:00',0),(104,104,'2015-08-01',330,0,0,0,'0000-00-00 00:00:00',0),(105,105,'2015-08-01',222,0,0,0,'0000-00-00 00:00:00',0),(106,106,'2015-08-01',248,0,0,0,'0000-00-00 00:00:00',0),(107,107,'2015-08-01',210,0,0,0,'0000-00-00 00:00:00',0),(108,108,'2015-08-01',620,0,0,0,'0000-00-00 00:00:00',0),(109,109,'2015-08-01',409,0,0,0,'0000-00-00 00:00:00',0),(110,110,'2015-08-01',96,0,0,0,'0000-00-00 00:00:00',0),(111,111,'2015-08-01',297,0,0,0,'0000-00-00 00:00:00',0),(112,112,'2015-08-01',100,0,0,0,'0000-00-00 00:00:00',0),(113,113,'2015-08-01',379,0,0,0,'0000-00-00 00:00:00',0),(114,114,'2015-08-01',189,0,0,0,'0000-00-00 00:00:00',0),(115,115,'2015-08-01',226,0,0,0,'0000-00-00 00:00:00',0),(116,116,'2015-08-01',160,0,0,0,'0000-00-00 00:00:00',0),(117,117,'2015-08-01',232,0,0,0,'0000-00-00 00:00:00',0),(118,118,'2015-08-01',24,0,0,0,'0000-00-00 00:00:00',0),(119,119,'2015-08-01',390,0,0,0,'0000-00-00 00:00:00',0),(120,120,'2015-08-01',188,0,0,0,'0000-00-00 00:00:00',0),(121,121,'2015-08-01',114,0,0,0,'0000-00-00 00:00:00',0),(122,122,'2015-08-01',167,0,0,0,'0000-00-00 00:00:00',0),(123,123,'2015-08-01',391,0,0,0,'0000-00-00 00:00:00',0),(124,124,'2015-08-01',186,0,0,0,'0000-00-00 00:00:00',0),(125,125,'2015-08-01',195,0,0,0,'0000-00-00 00:00:00',0),(126,126,'2015-08-01',543,0,0,0,'0000-00-00 00:00:00',0),(127,127,'2015-08-01',196,0,0,0,'0000-00-00 00:00:00',0),(128,128,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(129,129,'2015-08-01',91,0,0,0,'0000-00-00 00:00:00',0),(130,130,'2015-08-01',308,0,0,0,'0000-00-00 00:00:00',0),(131,131,'2015-08-01',187,0,0,0,'0000-00-00 00:00:00',0),(132,132,'2015-08-01',270,0,0,0,'0000-00-00 00:00:00',0),(133,133,'2015-08-01',167,0,0,0,'0000-00-00 00:00:00',0),(134,134,'2015-08-01',124,0,0,0,'0000-00-00 00:00:00',0),(135,135,'2015-08-01',180,0,0,0,'0000-00-00 00:00:00',0),(136,136,'2015-08-01',217,0,0,0,'0000-00-00 00:00:00',0),(137,137,'2015-08-01',194,0,0,0,'0000-00-00 00:00:00',0),(138,138,'2015-08-01',176,0,0,0,'0000-00-00 00:00:00',0),(139,139,'2015-08-01',275,0,0,0,'0000-00-00 00:00:00',0),(140,140,'2015-08-01',221,0,0,0,'0000-00-00 00:00:00',0),(141,141,'2015-08-01',152,0,0,0,'0000-00-00 00:00:00',0),(142,142,'2015-08-01',144,0,0,0,'0000-00-00 00:00:00',0),(143,143,'2015-08-01',316,0,0,0,'0000-00-00 00:00:00',0),(144,144,'2015-08-01',565,0,0,0,'0000-00-00 00:00:00',0),(145,145,'2015-08-01',69,0,0,0,'0000-00-00 00:00:00',0),(146,146,'2015-08-01',104,0,0,0,'0000-00-00 00:00:00',0),(147,147,'2015-08-01',82,0,0,0,'0000-00-00 00:00:00',0),(148,148,'2015-08-01',111,0,0,0,'0000-00-00 00:00:00',0),(149,149,'2015-08-01',141,0,0,0,'0000-00-00 00:00:00',0),(150,150,'2015-08-01',331,0,0,0,'0000-00-00 00:00:00',0),(151,151,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(152,152,'2015-08-01',214,0,0,0,'0000-00-00 00:00:00',0),(153,153,'2015-08-01',97,0,0,0,'0000-00-00 00:00:00',0),(154,154,'2015-08-01',110,0,0,0,'0000-00-00 00:00:00',0),(155,155,'2015-08-01',21,0,0,0,'0000-00-00 00:00:00',0),(156,156,'2015-08-01',88,0,0,0,'0000-00-00 00:00:00',0),(157,157,'2015-08-01',55,0,0,0,'0000-00-00 00:00:00',0),(158,158,'2015-08-01',33,0,0,0,'0000-00-00 00:00:00',0),(159,159,'2015-08-01',13,0,0,0,'0000-00-00 00:00:00',0),(160,160,'2015-08-01',62,0,0,0,'0000-00-00 00:00:00',0),(161,161,'2015-08-01',43,0,0,0,'0000-00-00 00:00:00',0),(162,162,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(163,163,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(164,164,'2015-08-01',416,0,0,0,'0000-00-00 00:00:00',0),(165,165,'2015-08-01',6,0,0,0,'0000-00-00 00:00:00',0),(166,166,'2015-08-01',428,0,0,0,'0000-00-00 00:00:00',0),(167,167,'2015-08-01',122,0,0,0,'0000-00-00 00:00:00',0),(168,168,'2015-08-01',136,0,0,0,'0000-00-00 00:00:00',0),(169,169,'2015-08-01',216,0,0,0,'0000-00-00 00:00:00',0),(170,170,'2015-08-01',20,0,0,0,'0000-00-00 00:00:00',0),(171,171,'2015-08-01',83,0,0,0,'0000-00-00 00:00:00',0),(172,172,'2015-08-01',250,0,0,0,'0000-00-00 00:00:00',0),(173,173,'2015-08-01',128,0,0,0,'0000-00-00 00:00:00',0),(174,174,'2015-08-01',235,0,0,0,'0000-00-00 00:00:00',0),(175,175,'2015-08-01',198,0,0,0,'0000-00-00 00:00:00',0),(176,176,'2015-08-01',19,0,0,0,'0000-00-00 00:00:00',0),(177,177,'2015-08-01',56,0,0,0,'0000-00-00 00:00:00',0),(178,178,'2015-08-01',227,0,0,0,'0000-00-00 00:00:00',0),(179,179,'2015-08-01',722,0,0,0,'0000-00-00 00:00:00',0),(180,180,'2015-08-01',143,0,0,0,'0000-00-00 00:00:00',0),(181,181,'2015-08-01',197,0,0,0,'0000-00-00 00:00:00',0),(182,182,'2015-08-01',89,0,0,0,'0000-00-00 00:00:00',0),(183,183,'2015-08-01',278,0,0,0,'0000-00-00 00:00:00',0),(184,184,'2015-08-01',148,0,0,0,'0000-00-00 00:00:00',0),(185,185,'2015-08-01',193,0,0,0,'0000-00-00 00:00:00',0),(186,186,'2015-08-01',59,0,0,0,'0000-00-00 00:00:00',0),(187,187,'2015-08-01',391,0,0,0,'0000-00-00 00:00:00',0),(188,188,'2015-08-01',133,0,0,0,'0000-00-00 00:00:00',0),(189,189,'2015-08-01',95,0,0,0,'0000-00-00 00:00:00',0),(190,190,'2015-08-01',17,0,0,0,'0000-00-00 00:00:00',0),(191,191,'2015-08-01',54,0,0,0,'0000-00-00 00:00:00',0),(192,192,'2015-08-01',64,0,0,0,'0000-00-00 00:00:00',0),(193,193,'2015-08-01',17,0,0,0,'0000-00-00 00:00:00',0),(194,194,'2015-08-01',105,0,0,0,'0000-00-00 00:00:00',0),(195,195,'2015-08-01',73,0,0,0,'0000-00-00 00:00:00',0),(196,196,'2015-08-01',320,0,0,0,'0000-00-00 00:00:00',0),(197,197,'2015-08-01',160,0,0,0,'0000-00-00 00:00:00',0),(198,198,'2015-08-01',15,0,0,0,'0000-00-00 00:00:00',0),(199,199,'2015-08-01',85,0,0,0,'0000-00-00 00:00:00',0),(200,200,'2015-08-01',197,0,0,0,'0000-00-00 00:00:00',0),(201,201,'2015-08-01',102,0,0,0,'0000-00-00 00:00:00',0),(202,202,'2015-08-01',195,0,0,0,'0000-00-00 00:00:00',0),(203,203,'2015-08-01',130,0,0,0,'0000-00-00 00:00:00',0),(204,204,'2015-08-01',7,0,0,0,'0000-00-00 00:00:00',0),(205,205,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(206,206,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(207,207,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(208,208,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(209,209,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(210,210,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(211,211,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(212,212,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(213,213,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(214,214,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(215,215,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(216,216,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(217,217,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(218,218,'2015-08-01',178,0,0,0,'0000-00-00 00:00:00',0),(219,219,'2015-08-01',145,0,0,0,'0000-00-00 00:00:00',0),(220,220,'2015-08-01',160,0,0,0,'0000-00-00 00:00:00',0),(221,221,'2015-08-01',220,0,0,0,'0000-00-00 00:00:00',0),(222,222,'2015-08-01',78,0,0,0,'0000-00-00 00:00:00',0),(223,223,'2015-08-01',318,0,0,0,'0000-00-00 00:00:00',0),(224,224,'2015-08-01',161,0,0,0,'0000-00-00 00:00:00',0),(225,225,'2015-08-01',286,0,0,0,'0000-00-00 00:00:00',0),(226,226,'2015-08-01',348,0,0,0,'0000-00-00 00:00:00',0),(227,227,'2015-08-01',205,0,0,0,'0000-00-00 00:00:00',0),(228,228,'2015-08-01',125,0,0,0,'0000-00-00 00:00:00',0),(229,229,'2015-08-01',168,0,0,0,'0000-00-00 00:00:00',0),(230,230,'2015-08-01',11,0,0,0,'0000-00-00 00:00:00',0),(231,231,'2015-08-01',151,0,0,0,'0000-00-00 00:00:00',0),(232,232,'2015-08-01',286,0,0,0,'0000-00-00 00:00:00',0),(233,233,'2015-08-01',214,0,0,0,'0000-00-00 00:00:00',0),(234,234,'2015-08-01',140,0,0,0,'0000-00-00 00:00:00',0),(235,235,'2015-08-01',301,0,0,0,'0000-00-00 00:00:00',0),(236,236,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(237,237,'2015-08-01',217,0,0,0,'0000-00-00 00:00:00',0),(238,238,'2015-08-01',15,0,0,0,'0000-00-00 00:00:00',0),(239,239,'2015-08-01',13,0,0,0,'0000-00-00 00:00:00',0),(240,240,'2015-08-01',45,0,0,0,'0000-00-00 00:00:00',0),(241,241,'2015-08-01',11,0,0,0,'0000-00-00 00:00:00',0),(242,242,'2015-08-01',10,0,0,0,'0000-00-00 00:00:00',0),(243,243,'2015-08-01',70,0,0,0,'0000-00-00 00:00:00',0),(244,244,'2015-08-01',82,0,0,0,'0000-00-00 00:00:00',0),(245,245,'2015-08-01',21,0,0,0,'0000-00-00 00:00:00',0),(246,246,'2015-08-01',125,0,0,0,'0000-00-00 00:00:00',0),(247,247,'2015-08-01',272,0,0,0,'0000-00-00 00:00:00',0),(248,248,'2015-08-01',3,0,0,0,'0000-00-00 00:00:00',0),(249,249,'2015-08-01',67,0,0,0,'0000-00-00 00:00:00',0),(250,250,'2015-08-01',109,0,0,0,'0000-00-00 00:00:00',0),(251,251,'2015-08-01',72,0,0,0,'0000-00-00 00:00:00',0),(252,252,'2015-08-01',33,0,0,0,'0000-00-00 00:00:00',0),(253,253,'2015-08-01',175,0,0,0,'0000-00-00 00:00:00',0),(254,254,'2015-08-01',65,0,0,0,'0000-00-00 00:00:00',0),(255,255,'2015-08-01',12,0,0,0,'0000-00-00 00:00:00',0),(256,256,'2015-08-01',41,0,0,0,'0000-00-00 00:00:00',0),(257,257,'2015-08-01',395,0,0,0,'0000-00-00 00:00:00',0),(258,258,'2015-08-01',93,0,0,0,'0000-00-00 00:00:00',0),(259,259,'2015-08-01',80,0,0,0,'0000-00-00 00:00:00',0),(260,260,'2015-08-01',194,0,0,0,'0000-00-00 00:00:00',0),(261,261,'2015-08-01',169,0,0,0,'0000-00-00 00:00:00',0),(262,262,'2015-08-01',86,0,0,0,'0000-00-00 00:00:00',0),(263,263,'2015-08-01',470,0,0,0,'0000-00-00 00:00:00',0),(264,264,'2015-08-01',147,0,0,0,'0000-00-00 00:00:00',0),(265,265,'2015-08-01',318,0,0,0,'0000-00-00 00:00:00',0),(266,266,'2015-08-01',61,0,0,0,'0000-00-00 00:00:00',0),(267,267,'2015-08-01',89,0,0,0,'0000-00-00 00:00:00',0),(268,268,'2015-08-01',199,0,0,0,'0000-00-00 00:00:00',0),(269,269,'2015-08-01',161,0,0,0,'0000-00-00 00:00:00',0),(270,270,'2015-08-01',250,0,0,0,'0000-00-00 00:00:00',0),(271,271,'2015-08-01',92,0,0,0,'0000-00-00 00:00:00',0),(272,272,'2015-08-01',57,0,0,0,'0000-00-00 00:00:00',0),(273,273,'2015-08-01',40,0,0,0,'0000-00-00 00:00:00',0),(274,274,'2015-08-01',34,0,0,0,'0000-00-00 00:00:00',0),(275,275,'2015-08-01',318,0,0,0,'0000-00-00 00:00:00',0),(276,276,'2015-08-01',327,0,0,0,'0000-00-00 00:00:00',0),(277,277,'2015-08-01',80,0,0,0,'0000-00-00 00:00:00',0),(278,278,'2015-08-01',19,0,0,0,'0000-00-00 00:00:00',0),(279,279,'2015-08-01',11,0,0,0,'0000-00-00 00:00:00',0),(280,280,'2015-08-01',40,0,0,0,'0000-00-00 00:00:00',0),(281,281,'2015-08-01',10,0,0,0,'0000-00-00 00:00:00',0),(282,282,'2015-08-01',124,0,0,0,'0000-00-00 00:00:00',0),(283,283,'2015-08-01',100,0,0,0,'0000-00-00 00:00:00',0),(284,284,'2015-08-01',60,0,0,0,'0000-00-00 00:00:00',0),(285,285,'2015-08-01',45,0,0,0,'0000-00-00 00:00:00',0),(286,286,'2015-08-01',227,0,0,0,'0000-00-00 00:00:00',0),(287,287,'2015-08-01',80,0,0,0,'0000-00-00 00:00:00',0),(288,288,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(289,289,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(290,290,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(291,291,'2015-08-01',0,0,0,0,'0000-00-00 00:00:00',0),(292,292,'2015-08-01',212,0,0,0,'0000-00-00 00:00:00',0),(293,293,'2015-08-01',169,0,0,0,'0000-00-00 00:00:00',0),(294,294,'2015-08-01',15,0,0,0,'0000-00-00 00:00:00',0),(295,295,'2015-08-01',275,0,0,0,'0000-00-00 00:00:00',0),(296,296,'2015-08-01',28,0,0,0,'0000-00-00 00:00:00',0),(297,297,'2015-08-01',79,0,0,0,'0000-00-00 00:00:00',0),(298,298,'2015-08-01',67,0,0,0,'0000-00-00 00:00:00',0),(299,299,'2015-08-01',109,0,0,0,'0000-00-00 00:00:00',0),(300,300,'2015-08-01',318,0,0,0,'0000-00-00 00:00:00',0),(301,301,'2015-08-01',34,0,0,0,'0000-00-00 00:00:00',0),(302,302,'2015-08-01',200,0,0,0,'0000-00-00 00:00:00',0),(303,303,'2015-08-01',73,0,0,0,'0000-00-00 00:00:00',0),(304,304,'2015-08-01',34,0,0,0,'0000-00-00 00:00:00',0),(305,305,'2015-08-01',35,0,0,0,'0000-00-00 00:00:00',0),(306,306,'2015-08-01',104,0,0,0,'0000-00-00 00:00:00',0),(307,307,'2015-08-01',20,0,0,0,'0000-00-00 00:00:00',0),(308,308,'2015-08-01',86,0,0,0,'0000-00-00 00:00:00',0),(309,309,'2015-08-01',14,0,0,0,'0000-00-00 00:00:00',0),(310,310,'2015-08-01',165,0,0,0,'0000-00-00 00:00:00',0),(311,1,'2015-09-01',274,0,0,0,'0000-00-00 00:00:00',0),(312,2,'2015-09-01',204,0,0,0,'0000-00-00 00:00:00',1),(313,3,'2015-09-01',311,0,0,0,'0000-00-00 00:00:00',1),(314,4,'2015-09-01',431,0,0,0,'0000-00-00 00:00:00',1),(315,5,'2015-09-01',199,0,0,0,'0000-00-00 00:00:00',0),(316,6,'2015-09-01',269,0,0,0,'0000-00-00 00:00:00',1),(317,7,'2015-09-01',121,0,0,0,'0000-00-00 00:00:00',1),(318,8,'2015-09-01',116,0,0,0,'0000-00-00 00:00:00',1),(319,9,'2015-09-01',295,0,0,0,'0000-00-00 00:00:00',0),(320,10,'2015-09-01',207,0,0,0,'0000-00-00 00:00:00',1),(321,11,'2015-09-01',65,0,0,0,'0000-00-00 00:00:00',1),(322,12,'2015-09-01',79,0,0,0,'0000-00-00 00:00:00',0),(323,13,'2015-09-01',8,0,0,0,'0000-00-00 00:00:00',0),(324,14,'2015-09-01',296,0,0,0,'0000-00-00 00:00:00',0),(325,15,'2015-09-01',232,0,0,0,'0000-00-00 00:00:00',0),(326,16,'2015-09-01',397,0,0,0,'0000-00-00 00:00:00',1),(327,17,'2015-09-01',117,0,0,0,'0000-00-00 00:00:00',0),(328,18,'2015-09-01',229,0,0,0,'0000-00-00 00:00:00',0),(329,19,'2015-09-01',227,0,0,0,'0000-00-00 00:00:00',0),(330,20,'2015-09-01',213,0,0,0,'0000-00-00 00:00:00',0),(331,21,'2015-09-01',316,0,0,0,'0000-00-00 00:00:00',1),(332,22,'2015-09-01',256,0,0,0,'0000-00-00 00:00:00',0),(333,23,'2015-09-01',246,0,0,0,'0000-00-00 00:00:00',0),(334,24,'2015-09-01',204,0,0,0,'0000-00-00 00:00:00',0),(335,25,'2015-09-01',58,0,0,0,'0000-00-00 00:00:00',1),(336,26,'2015-09-01',441,0,0,0,'0000-00-00 00:00:00',0),(337,27,'2015-09-01',84,0,0,0,'0000-00-00 00:00:00',0),(338,28,'2015-09-01',394,0,0,0,'0000-00-00 00:00:00',1),(339,29,'2015-09-01',56,0,0,0,'0000-00-00 00:00:00',1),(340,30,'2015-09-01',140,0,0,0,'0000-00-00 00:00:00',1),(341,31,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(342,32,'2015-09-01',318,0,0,0,'0000-00-00 00:00:00',0),(343,33,'2015-09-01',100,0,0,0,'0000-00-00 00:00:00',0),(344,34,'2015-09-01',53,0,0,0,'0000-00-00 00:00:00',0),(345,35,'2015-09-01',242,0,0,0,'0000-00-00 00:00:00',0),(346,36,'2015-09-01',641,0,0,0,'0000-00-00 00:00:00',0),(347,37,'2015-09-01',212,0,0,0,'0000-00-00 00:00:00',1),(348,38,'2015-09-01',228,0,0,0,'0000-00-00 00:00:00',1),(349,39,'2015-09-01',35,0,0,0,'0000-00-00 00:00:00',1),(350,40,'2015-09-01',330,0,0,0,'0000-00-00 00:00:00',0),(351,41,'2015-09-01',341,0,0,0,'0000-00-00 00:00:00',0),(352,42,'2015-09-01',235,0,0,0,'0000-00-00 00:00:00',0),(353,43,'2015-09-01',35,0,0,0,'0000-00-00 00:00:00',0),(354,44,'2015-09-01',34,0,0,0,'0000-00-00 00:00:00',0),(355,45,'2015-09-01',267,0,0,0,'0000-00-00 00:00:00',0),(356,46,'2015-09-01',146,0,0,0,'0000-00-00 00:00:00',0),(357,47,'2015-09-01',88,0,0,0,'0000-00-00 00:00:00',1),(358,48,'2015-09-01',464,0,0,0,'0000-00-00 00:00:00',0),(359,49,'2015-09-01',199,0,0,0,'0000-00-00 00:00:00',1),(360,50,'2015-09-01',150,0,0,0,'0000-00-00 00:00:00',0),(361,51,'2015-09-01',626,0,0,0,'0000-00-00 00:00:00',0),(362,52,'2015-09-01',273,0,0,0,'0000-00-00 00:00:00',1),(363,53,'2015-09-01',221,0,0,0,'0000-00-00 00:00:00',1),(364,54,'2015-09-01',115,0,0,0,'0000-00-00 00:00:00',0),(365,55,'2015-09-01',499,0,0,0,'0000-00-00 00:00:00',0),(366,56,'2015-09-01',96,0,0,0,'0000-00-00 00:00:00',1),(367,57,'2015-09-01',108,0,0,0,'0000-00-00 00:00:00',1),(368,58,'2015-09-01',291,0,0,0,'0000-00-00 00:00:00',0),(369,59,'2015-09-01',229,0,0,0,'0000-00-00 00:00:00',0),(370,60,'2015-09-01',282,0,0,0,'0000-00-00 00:00:00',1),(371,61,'2015-09-01',101,0,0,0,'0000-00-00 00:00:00',0),(372,62,'2015-09-01',92,0,0,0,'0000-00-00 00:00:00',1),(373,63,'2015-09-01',139,0,0,0,'0000-00-00 00:00:00',1),(374,64,'2015-09-01',281,0,0,0,'0000-00-00 00:00:00',0),(375,65,'2015-09-01',69,0,0,0,'0000-00-00 00:00:00',0),(376,66,'2015-09-01',14,0,0,0,'0000-00-00 00:00:00',1),(377,67,'2015-09-01',270,0,0,0,'0000-00-00 00:00:00',0),(378,68,'2015-09-01',439,0,0,0,'0000-00-00 00:00:00',1),(379,69,'2015-09-01',539,0,0,0,'0000-00-00 00:00:00',0),(380,70,'2015-09-01',164,0,0,0,'0000-00-00 00:00:00',1),(381,71,'2015-09-01',38,0,0,0,'0000-00-00 00:00:00',0),(382,72,'2015-09-01',36,0,0,0,'0000-00-00 00:00:00',0),(383,73,'2015-09-01',24,0,0,0,'0000-00-00 00:00:00',1),(384,74,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(385,75,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(386,76,'2015-09-01',156,0,0,0,'0000-00-00 00:00:00',0),(387,77,'2015-09-01',394,0,0,0,'0000-00-00 00:00:00',0),(388,78,'2015-09-01',305,0,0,0,'0000-00-00 00:00:00',0),(389,79,'2015-09-01',429,0,0,0,'0000-00-00 00:00:00',1),(390,80,'2015-09-01',57,0,0,0,'0000-00-00 00:00:00',1),(391,81,'2015-09-01',237,0,0,0,'0000-00-00 00:00:00',0),(392,82,'2015-09-01',94,0,0,0,'0000-00-00 00:00:00',1),(393,83,'2015-09-01',230,0,0,0,'0000-00-00 00:00:00',1),(394,84,'2015-09-01',417,0,0,0,'0000-00-00 00:00:00',1),(395,85,'2015-09-01',363,0,0,0,'0000-00-00 00:00:00',0),(396,86,'2015-09-01',238,0,0,0,'0000-00-00 00:00:00',0),(397,87,'2015-09-01',293,0,0,0,'0000-00-00 00:00:00',1),(398,88,'2015-09-01',139,0,0,0,'0000-00-00 00:00:00',1),(399,89,'2015-09-01',153,0,0,0,'0000-00-00 00:00:00',1),(400,90,'2015-09-01',91,0,0,0,'0000-00-00 00:00:00',0),(401,91,'2015-09-01',155,0,0,0,'0000-00-00 00:00:00',0),(402,92,'2015-09-01',183,0,0,0,'0000-00-00 00:00:00',0),(403,93,'2015-09-01',380,0,0,0,'0000-00-00 00:00:00',0),(404,94,'2015-09-01',107,0,0,0,'0000-00-00 00:00:00',0),(405,95,'2015-09-01',133,0,0,0,'0000-00-00 00:00:00',1),(406,96,'2015-09-01',493,0,0,0,'0000-00-00 00:00:00',0),(407,97,'2015-09-01',293,0,0,0,'0000-00-00 00:00:00',1),(408,98,'2015-09-01',397,0,0,0,'0000-00-00 00:00:00',1),(409,99,'2015-09-01',81,0,0,0,'0000-00-00 00:00:00',0),(410,100,'2015-09-01',451,0,0,0,'0000-00-00 00:00:00',1),(411,101,'2015-09-01',108,0,0,0,'0000-00-00 00:00:00',1),(412,102,'2015-09-01',279,0,0,0,'0000-00-00 00:00:00',1),(413,103,'2015-09-01',218,0,0,0,'0000-00-00 00:00:00',1),(414,104,'2015-09-01',340,0,0,0,'0000-00-00 00:00:00',1),(415,105,'2015-09-01',229,0,0,0,'0000-00-00 00:00:00',0),(416,106,'2015-09-01',270,0,0,0,'0000-00-00 00:00:00',0),(417,107,'2015-09-01',220,0,0,0,'0000-00-00 00:00:00',1),(418,108,'2015-09-01',710,0,0,0,'0000-00-00 00:00:00',0),(419,109,'2015-09-01',428,0,0,0,'0000-00-00 00:00:00',1),(420,110,'2015-09-01',101,0,0,0,'0000-00-00 00:00:00',1),(421,111,'2015-09-01',306,0,0,0,'0000-00-00 00:00:00',0),(422,112,'2015-09-01',102,0,0,0,'0000-00-00 00:00:00',1),(423,113,'2015-09-01',389,0,0,0,'0000-00-00 00:00:00',1),(424,114,'2015-09-01',199,0,0,0,'0000-00-00 00:00:00',1),(425,115,'2015-09-01',249,0,0,0,'0000-00-00 00:00:00',1),(426,116,'2015-09-01',171,0,0,0,'0000-00-00 00:00:00',1),(427,117,'2015-09-01',249,0,0,0,'0000-00-00 00:00:00',1),(428,118,'2015-09-01',24,0,0,0,'0000-00-00 00:00:00',1),(429,119,'2015-09-01',412,0,0,0,'0000-00-00 00:00:00',1),(430,120,'2015-09-01',201,0,0,0,'0000-00-00 00:00:00',1),(431,121,'2015-09-01',124,0,0,0,'0000-00-00 00:00:00',1),(432,122,'2015-09-01',168,0,0,0,'0000-00-00 00:00:00',0),(433,123,'2015-09-01',412,0,0,0,'0000-00-00 00:00:00',1),(434,124,'2015-09-01',198,0,0,0,'0000-00-00 00:00:00',1),(435,125,'2015-09-01',217,0,0,0,'0000-00-00 00:00:00',0),(436,126,'2015-09-01',567,0,0,0,'0000-00-00 00:00:00',1),(437,127,'2015-09-01',199,0,0,0,'0000-00-00 00:00:00',0),(438,128,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(439,129,'2015-09-01',97,0,0,0,'0000-00-00 00:00:00',1),(440,130,'2015-09-01',315,0,0,0,'0000-00-00 00:00:00',1),(441,131,'2015-09-01',203,0,0,0,'0000-00-00 00:00:00',1),(442,132,'2015-09-01',274,0,0,0,'0000-00-00 00:00:00',1),(443,133,'2015-09-01',167,0,0,0,'0000-00-00 00:00:00',0),(444,134,'2015-09-01',128,0,0,0,'0000-00-00 00:00:00',1),(445,135,'2015-09-01',191,0,0,0,'0000-00-00 00:00:00',0),(446,136,'2015-09-01',221,0,0,0,'0000-00-00 00:00:00',1),(447,137,'2015-09-01',194,0,0,0,'0000-00-00 00:00:00',1),(448,138,'2015-09-01',177,0,0,0,'0000-00-00 00:00:00',1),(449,139,'2015-09-01',302,0,0,0,'0000-00-00 00:00:00',1),(450,140,'2015-09-01',239,0,0,0,'0000-00-00 00:00:00',0),(451,141,'2015-09-01',178,0,0,0,'0000-00-00 00:00:00',1),(452,142,'2015-09-01',165,0,0,0,'0000-00-00 00:00:00',1),(453,143,'2015-09-01',340,0,0,0,'0000-00-00 00:00:00',0),(454,144,'2015-09-01',598,0,0,0,'0000-00-00 00:00:00',1),(455,145,'2015-09-01',73,0,0,0,'0000-00-00 00:00:00',1),(456,146,'2015-09-01',104,0,0,0,'0000-00-00 00:00:00',0),(457,147,'2015-09-01',89,0,0,0,'0000-00-00 00:00:00',1),(458,148,'2015-09-01',122,0,0,0,'0000-00-00 00:00:00',1),(459,149,'2015-09-01',152,0,0,0,'0000-00-00 00:00:00',1),(460,150,'2015-09-01',405,0,0,0,'0000-00-00 00:00:00',1),(461,151,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(462,152,'2015-09-01',240,0,0,0,'0000-00-00 00:00:00',1),(463,153,'2015-09-01',109,0,0,0,'0000-00-00 00:00:00',0),(464,154,'2015-09-01',121,0,0,0,'0000-00-00 00:00:00',0),(465,155,'2015-09-01',25,0,0,0,'0000-00-00 00:00:00',1),(466,156,'2015-09-01',97,0,0,0,'0000-00-00 00:00:00',0),(467,157,'2015-09-01',68,0,0,0,'0000-00-00 00:00:00',1),(468,158,'2015-09-01',82,0,0,0,'0000-00-00 00:00:00',1),(469,159,'2015-09-01',16,0,0,0,'0000-00-00 00:00:00',1),(470,160,'2015-09-01',89,0,0,0,'0000-00-00 00:00:00',0),(471,161,'2015-09-01',63,0,0,0,'0000-00-00 00:00:00',1),(472,162,'2015-09-01',63,0,0,0,'0000-00-00 00:00:00',1),(473,163,'2015-09-01',10,0,0,0,'0000-00-00 00:00:00',1),(474,164,'2015-09-01',439,0,0,0,'0000-00-00 00:00:00',1),(475,165,'2015-09-01',10,0,0,0,'0000-00-00 00:00:00',0),(476,166,'2015-09-01',441,0,0,0,'0000-00-00 00:00:00',1),(477,167,'2015-09-01',130,0,0,0,'0000-00-00 00:00:00',1),(478,168,'2015-09-01',201,0,0,0,'0000-00-00 00:00:00',0),(479,169,'2015-09-01',242,0,0,0,'0000-00-00 00:00:00',0),(480,170,'2015-09-01',20,0,0,0,'0000-00-00 00:00:00',1),(481,171,'2015-09-01',94,0,0,0,'0000-00-00 00:00:00',0),(482,172,'2015-09-01',262,0,0,0,'0000-00-00 00:00:00',1),(483,173,'2015-09-01',134,0,0,0,'0000-00-00 00:00:00',1),(484,174,'2015-09-01',256,0,0,0,'0000-00-00 00:00:00',0),(485,175,'2015-09-01',211,0,0,0,'0000-00-00 00:00:00',1),(486,176,'2015-09-01',20,0,0,0,'0000-00-00 00:00:00',0),(487,177,'2015-09-01',59,0,0,0,'0000-00-00 00:00:00',0),(488,178,'2015-09-01',239,0,0,0,'0000-00-00 00:00:00',1),(489,179,'2015-09-01',864,0,0,0,'0000-00-00 00:00:00',0),(490,180,'2015-09-01',158,0,0,0,'0000-00-00 00:00:00',1),(491,181,'2015-09-01',208,0,0,0,'0000-00-00 00:00:00',1),(492,182,'2015-09-01',90,0,0,0,'0000-00-00 00:00:00',0),(493,183,'2015-09-01',284,0,0,0,'0000-00-00 00:00:00',1),(494,184,'2015-09-01',148,0,0,0,'0000-00-00 00:00:00',1),(495,185,'2015-09-01',210,0,0,0,'0000-00-00 00:00:00',1),(496,186,'2015-09-01',69,0,0,0,'0000-00-00 00:00:00',0),(497,187,'2015-09-01',435,0,0,0,'0000-00-00 00:00:00',0),(498,188,'2015-09-01',148,0,0,0,'0000-00-00 00:00:00',0),(499,189,'2015-09-01',138,0,0,0,'0000-00-00 00:00:00',1),(500,190,'2015-09-01',17,0,0,0,'0000-00-00 00:00:00',0),(501,191,'2015-09-01',55,0,0,0,'0000-00-00 00:00:00',1),(502,192,'2015-09-01',67,0,0,0,'0000-00-00 00:00:00',0),(503,193,'2015-09-01',17,0,0,0,'0000-00-00 00:00:00',1),(504,194,'2015-09-01',112,0,0,0,'0000-00-00 00:00:00',0),(505,195,'2015-09-01',93,0,0,0,'0000-00-00 00:00:00',1),(506,196,'2015-09-01',353,0,0,0,'0000-00-00 00:00:00',1),(507,197,'2015-09-01',170,0,0,0,'0000-00-00 00:00:00',1),(508,198,'2015-09-01',16,0,0,0,'0000-00-00 00:00:00',0),(509,199,'2015-09-01',85,0,0,0,'0000-00-00 00:00:00',0),(510,200,'2015-09-01',222,0,0,0,'0000-00-00 00:00:00',0),(511,201,'2015-09-01',105,0,0,0,'0000-00-00 00:00:00',0),(512,202,'2015-09-01',212,0,0,0,'0000-00-00 00:00:00',1),(513,203,'2015-09-01',138,0,0,0,'0000-00-00 00:00:00',0),(514,204,'2015-09-01',12,0,0,0,'0000-00-00 00:00:00',0),(515,205,'2015-09-01',13,0,0,0,'0000-00-00 00:00:00',0),(516,206,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(517,207,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(518,208,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(519,209,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(520,210,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(521,211,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(522,212,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(523,213,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(524,214,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(525,215,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(526,216,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',1),(527,217,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(528,218,'2015-09-01',178,0,0,0,'0000-00-00 00:00:00',0),(529,219,'2015-09-01',146,0,0,0,'0000-00-00 00:00:00',0),(530,220,'2015-09-01',176,0,0,0,'0000-00-00 00:00:00',0),(531,221,'2015-09-01',222,0,0,0,'0000-00-00 00:00:00',0),(532,222,'2015-09-01',83,0,0,0,'0000-00-00 00:00:00',1),(533,223,'2015-09-01',340,0,0,0,'0000-00-00 00:00:00',0),(534,224,'2015-09-01',171,0,0,0,'0000-00-00 00:00:00',1),(535,225,'2015-09-01',314,0,0,0,'0000-00-00 00:00:00',1),(536,226,'2015-09-01',377,0,0,0,'0000-00-00 00:00:00',0),(537,227,'2015-09-01',230,0,0,0,'0000-00-00 00:00:00',1),(538,228,'2015-09-01',130,0,0,0,'0000-00-00 00:00:00',0),(539,229,'2015-09-01',201,0,0,0,'0000-00-00 00:00:00',1),(540,230,'2015-09-01',25,0,0,0,'0000-00-00 00:00:00',0),(541,231,'2015-09-01',157,0,0,0,'0000-00-00 00:00:00',1),(542,232,'2015-09-01',312,0,0,0,'0000-00-00 00:00:00',1),(543,233,'2015-09-01',220,0,0,0,'0000-00-00 00:00:00',0),(544,234,'2015-09-01',160,0,0,0,'0000-00-00 00:00:00',0),(545,235,'2015-09-01',307,0,0,0,'0000-00-00 00:00:00',0),(546,236,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(547,237,'2015-09-01',248,0,0,0,'0000-00-00 00:00:00',0),(548,238,'2015-09-01',17,0,0,0,'0000-00-00 00:00:00',0),(549,239,'2015-09-01',13,0,0,0,'0000-00-00 00:00:00',0),(550,240,'2015-09-01',45,0,0,0,'0000-00-00 00:00:00',0),(551,241,'2015-09-01',11,0,0,0,'0000-00-00 00:00:00',0),(552,242,'2015-09-01',10,0,0,0,'0000-00-00 00:00:00',0),(553,243,'2015-09-01',70,0,0,0,'0000-00-00 00:00:00',1),(554,244,'2015-09-01',82,0,0,0,'0000-00-00 00:00:00',1),(555,245,'2015-09-01',21,0,0,0,'0000-00-00 00:00:00',0),(556,246,'2015-09-01',125,0,0,0,'0000-00-00 00:00:00',0),(557,247,'2015-09-01',282,0,0,0,'0000-00-00 00:00:00',0),(558,248,'2015-09-01',3,0,0,0,'0000-00-00 00:00:00',0),(559,249,'2015-09-01',73,0,0,0,'0000-00-00 00:00:00',0),(560,250,'2015-09-01',125,0,0,0,'0000-00-00 00:00:00',0),(561,251,'2015-09-01',92,0,0,0,'0000-00-00 00:00:00',0),(562,252,'2015-09-01',40,0,0,0,'0000-00-00 00:00:00',0),(563,253,'2015-09-01',184,0,0,0,'0000-00-00 00:00:00',1),(564,254,'2015-09-01',65,0,0,0,'0000-00-00 00:00:00',1),(565,255,'2015-09-01',12,0,0,0,'0000-00-00 00:00:00',0),(566,256,'2015-09-01',52,0,0,0,'0000-00-00 00:00:00',0),(567,257,'2015-09-01',432,0,0,0,'0000-00-00 00:00:00',0),(568,258,'2015-09-01',111,0,0,0,'0000-00-00 00:00:00',1),(569,259,'2015-09-01',80,0,0,0,'0000-00-00 00:00:00',1),(570,260,'2015-09-01',202,0,0,0,'0000-00-00 00:00:00',1),(571,261,'2015-09-01',181,0,0,0,'0000-00-00 00:00:00',1),(572,262,'2015-09-01',91,0,0,0,'0000-00-00 00:00:00',1),(573,263,'2015-09-01',505,0,0,0,'0000-00-00 00:00:00',0),(574,264,'2015-09-01',181,0,0,0,'0000-00-00 00:00:00',0),(575,265,'2015-09-01',335,0,0,0,'0000-00-00 00:00:00',1),(576,266,'2015-09-01',72,0,0,0,'0000-00-00 00:00:00',1),(577,267,'2015-09-01',89,0,0,0,'0000-00-00 00:00:00',1),(578,268,'2015-09-01',210,0,0,0,'0000-00-00 00:00:00',0),(579,269,'2015-09-01',166,0,0,0,'0000-00-00 00:00:00',1),(580,270,'2015-09-01',265,0,0,0,'0000-00-00 00:00:00',0),(581,271,'2015-09-01',95,0,0,0,'0000-00-00 00:00:00',0),(582,272,'2015-09-01',59,0,0,0,'0000-00-00 00:00:00',0),(583,273,'2015-09-01',40,0,0,0,'0000-00-00 00:00:00',0),(584,274,'2015-09-01',43,0,0,0,'0000-00-00 00:00:00',1),(585,275,'2015-09-01',340,0,0,0,'0000-00-00 00:00:00',1),(586,276,'2015-09-01',355,0,0,0,'0000-00-00 00:00:00',1),(587,277,'2015-09-01',100,0,0,0,'0000-00-00 00:00:00',0),(588,278,'2015-09-01',19,0,0,0,'0000-00-00 00:00:00',0),(589,279,'2015-09-01',11,0,0,0,'0000-00-00 00:00:00',1),(590,280,'2015-09-01',40,0,0,0,'0000-00-00 00:00:00',0),(591,281,'2015-09-01',10,0,0,0,'0000-00-00 00:00:00',0),(592,282,'2015-09-01',152,0,0,0,'0000-00-00 00:00:00',0),(593,283,'2015-09-01',111,0,0,0,'0000-00-00 00:00:00',1),(594,284,'2015-09-01',62,0,0,0,'0000-00-00 00:00:00',0),(595,285,'2015-09-01',51,0,0,0,'0000-00-00 00:00:00',1),(596,286,'2015-09-01',240,0,0,0,'0000-00-00 00:00:00',0),(597,287,'2015-09-01',108,0,0,0,'0000-00-00 00:00:00',0),(598,288,'2015-09-01',7,0,0,0,'0000-00-00 00:00:00',0),(599,289,'2015-09-01',19,0,0,0,'0000-00-00 00:00:00',0),(600,290,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(601,291,'2015-09-01',0,0,0,0,'0000-00-00 00:00:00',0),(602,292,'2015-09-01',220,0,0,0,'0000-00-00 00:00:00',0),(603,293,'2015-09-01',169,0,0,0,'0000-00-00 00:00:00',0),(604,294,'2015-09-01',15,0,0,0,'0000-00-00 00:00:00',1),(605,295,'2015-09-01',300,0,0,0,'0000-00-00 00:00:00',1),(606,296,'2015-09-01',28,0,0,0,'0000-00-00 00:00:00',1),(607,297,'2015-09-01',87,0,0,0,'0000-00-00 00:00:00',1),(608,298,'2015-09-01',70,0,0,0,'0000-00-00 00:00:00',1),(609,299,'2015-09-01',113,0,0,0,'0000-00-00 00:00:00',1),(610,300,'2015-09-01',327,0,0,0,'0000-00-00 00:00:00',0),(611,301,'2015-09-01',37,0,0,0,'0000-00-00 00:00:00',0),(612,302,'2015-09-01',219,0,0,0,'0000-00-00 00:00:00',1),(613,303,'2015-09-01',82,0,0,0,'0000-00-00 00:00:00',1),(614,304,'2015-09-01',42,0,0,0,'0000-00-00 00:00:00',0),(615,305,'2015-09-01',39,0,0,0,'0000-00-00 00:00:00',1),(616,306,'2015-09-01',104,0,0,0,'0000-00-00 00:00:00',1),(617,307,'2015-09-01',20,0,0,0,'0000-00-00 00:00:00',1),(618,308,'2015-09-01',99,0,0,0,'0000-00-00 00:00:00',0),(619,309,'2015-09-01',29,0,0,0,'0000-00-00 00:00:00',0),(620,310,'2015-09-01',165,0,0,0,'0000-00-00 00:00:00',1),(621,1,'2015-10-01',300,0,0,0,'2015-10-20 17:05:39',0),(622,2,'2015-10-01',215,0,0,0,'2015-10-20 17:05:39',0),(623,3,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(624,4,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(625,5,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(626,6,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(627,7,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(628,8,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(629,9,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(630,10,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(631,11,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(632,12,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(633,13,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(634,14,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(635,15,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(636,16,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(637,17,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(638,18,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(639,19,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(640,20,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(641,21,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(642,22,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(643,23,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(644,24,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(645,25,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(646,26,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(647,27,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(648,28,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(649,29,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(650,30,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(651,31,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(652,32,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(653,33,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(654,34,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(655,35,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(656,36,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(657,37,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(658,38,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(659,39,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(660,40,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(661,41,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(662,42,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(663,43,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(664,44,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(665,45,'2015-10-01',0,0,0,0,'2015-10-20 17:19:39',0),(666,46,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(667,47,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(668,48,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(669,49,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(670,50,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(671,51,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(672,52,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(673,53,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(674,54,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(675,55,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(676,56,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(677,57,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(678,58,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(679,59,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(680,60,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(681,61,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(682,62,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(683,63,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(684,64,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(685,65,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(686,66,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(687,67,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(688,68,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(689,69,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(690,70,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(691,71,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(692,72,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(693,73,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(694,74,'2015-10-01',12,0,0,0,'2015-10-20 17:19:40',0),(695,75,'2015-10-01',9,0,0,0,'2015-10-20 17:19:40',0),(696,76,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(697,77,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(698,78,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(699,79,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(700,80,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(701,81,'2015-10-01',0,0,0,0,'2015-10-20 17:19:40',0),(702,82,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(703,83,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(704,84,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(705,85,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(706,86,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(707,87,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(708,88,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(709,89,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(710,90,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(711,91,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(712,92,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(713,93,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(714,94,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(715,95,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(716,96,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(717,97,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(718,98,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(719,99,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(720,100,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(721,101,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(722,102,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(723,103,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(724,104,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(725,105,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(726,106,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(727,107,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(728,108,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(729,109,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(730,110,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(731,111,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(732,112,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(733,113,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(734,114,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(735,115,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(736,116,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(737,117,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(738,118,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(739,119,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(740,120,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(741,121,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(742,122,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(743,123,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(744,124,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(745,125,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(746,126,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(747,127,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(748,128,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(749,129,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(750,130,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(751,131,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(752,132,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(753,133,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(754,134,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(755,135,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(756,136,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(757,137,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(758,138,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(759,139,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(760,140,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(761,141,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(762,142,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(763,143,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(764,144,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(765,145,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(766,146,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(767,147,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(768,148,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(769,149,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(770,150,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(771,151,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(772,152,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(773,153,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(774,154,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(775,155,'2015-10-01',0,0,0,0,'2015-10-20 17:19:41',0),(776,156,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(777,157,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(778,158,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(779,159,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(780,160,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(781,161,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(782,162,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(783,163,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(784,164,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(785,165,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(786,166,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(787,167,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(788,168,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(789,169,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(790,170,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(791,171,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(792,172,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(793,173,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(794,174,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(795,175,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(796,176,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(797,177,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(798,178,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(799,179,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(800,180,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(801,181,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(802,182,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(803,183,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(804,184,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(805,185,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(806,186,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(807,187,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(808,188,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(809,189,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(810,190,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(811,191,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(812,192,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(813,193,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(814,194,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(815,195,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(816,196,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(817,197,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(818,198,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(819,199,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(820,200,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(821,201,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(822,202,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(823,203,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(824,204,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(825,205,'2015-10-01',0,0,0,0,'2015-10-20 17:19:42',0),(826,206,'2015-10-01',6,0,0,0,'2015-10-20 17:19:42',0),(827,207,'2015-10-01',66,0,0,0,'2015-10-20 17:19:42',1),(828,208,'2015-10-01',14,0,0,0,'2015-10-20 17:19:42',0),(829,209,'2015-10-01',4,0,0,0,'2015-10-20 17:19:42',0),(830,210,'2015-10-01',48,0,0,0,'2015-10-20 17:19:42',1),(831,211,'2015-10-01',30,0,0,0,'2015-10-20 17:19:42',0),(832,212,'2015-10-01',38,0,0,0,'2015-10-20 17:19:42',1),(833,213,'2015-10-01',50,0,0,0,'2015-10-20 17:19:42',0),(834,214,'2015-10-01',15,0,0,0,'2015-10-20 17:19:43',0),(835,215,'2015-10-01',21,0,0,0,'2015-10-20 17:19:43',1),(836,216,'2015-10-01',26,0,0,0,'2015-10-20 17:19:43',1),(837,217,'2015-10-01',11,0,0,0,'2015-10-20 17:19:43',1),(838,218,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(839,219,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(840,220,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(841,221,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(842,222,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(843,223,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(844,224,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(845,225,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(846,226,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(847,227,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(848,228,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(849,229,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(850,230,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(851,231,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(852,232,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(853,233,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(854,234,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(855,235,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(856,236,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(857,237,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(858,238,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(859,239,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(860,240,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(861,241,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(862,242,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(863,243,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(864,244,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(865,245,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(866,246,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(867,247,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(868,248,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(869,249,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(870,250,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(871,251,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(872,252,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(873,253,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(874,254,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(875,255,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(876,256,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(877,257,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(878,258,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(879,259,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(880,260,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(881,261,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(882,262,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(883,263,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(884,264,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(885,265,'2015-10-01',0,0,0,0,'2015-10-20 17:19:43',0),(886,266,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(887,267,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(888,268,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(889,269,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(890,270,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(891,271,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(892,272,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(893,273,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(894,274,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(895,275,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(896,276,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(897,277,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(898,278,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(899,279,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(900,280,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(901,281,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(902,282,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(903,283,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(904,284,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(905,285,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(906,286,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(907,287,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(908,288,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(909,289,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(910,290,'2015-10-01',9,0,0,0,'2015-10-20 17:19:44',1),(911,291,'2015-10-01',21,0,0,0,'2015-10-20 17:19:44',1),(912,292,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(913,293,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(914,294,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(915,295,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(916,296,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(917,297,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(918,298,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(919,299,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(920,300,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(921,301,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(922,302,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(923,303,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(924,304,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(925,305,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(926,306,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(927,307,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(928,308,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(929,309,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(930,310,'2015-10-01',0,0,0,0,'2015-10-20 17:19:44',0),(931,1,'2015-11-01',300,0,0,0,'2015-10-20 18:43:25',0),(932,2,'2015-11-01',215,0,0,0,'2015-10-20 18:43:25',0),(933,3,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(934,4,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(935,5,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(936,6,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(937,7,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(938,8,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(939,9,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(940,10,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(941,11,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(942,12,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(943,13,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(944,14,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(945,15,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(946,16,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(947,17,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(948,18,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(949,19,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(950,20,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(951,21,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(952,22,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(953,23,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(954,24,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(955,25,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(956,26,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(957,27,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(958,28,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(959,29,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(960,30,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(961,31,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(962,32,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(963,33,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(964,34,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(965,35,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(966,36,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(967,37,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(968,38,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(969,39,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(970,40,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(971,41,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(972,42,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(973,43,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(974,44,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(975,45,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(976,46,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(977,47,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(978,48,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(979,49,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(980,50,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(981,51,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(982,52,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(983,53,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(984,54,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(985,55,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(986,56,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(987,57,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(988,58,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(989,59,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(990,60,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(991,61,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(992,62,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(993,63,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(994,64,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(995,65,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(996,66,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(997,67,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(998,68,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(999,69,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(1000,70,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(1001,71,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(1002,72,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(1003,73,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(1004,74,'2015-11-01',0,0,0,0,'2015-10-20 18:43:25',0),(1005,75,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1006,76,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1007,77,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1008,78,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1009,79,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1010,80,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1011,81,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1012,82,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1013,83,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1014,84,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1015,85,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1016,86,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1017,87,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1018,88,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1019,89,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1020,90,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1021,91,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1022,92,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1023,93,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1024,94,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1025,95,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1026,96,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1027,97,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1028,98,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1029,99,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1030,100,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1031,101,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1032,102,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1033,103,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1034,104,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1035,105,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1036,106,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1037,107,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1038,108,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1039,109,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1040,110,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1041,111,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1042,112,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1043,113,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1044,114,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1045,115,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1046,116,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1047,117,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1048,118,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1049,119,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1050,120,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1051,121,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1052,122,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1053,123,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1054,124,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1055,125,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1056,126,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1057,127,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1058,128,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1059,129,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1060,130,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1061,131,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1062,132,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1063,133,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1064,134,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1065,135,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1066,136,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1067,137,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1068,138,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1069,139,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1070,140,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1071,141,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1072,142,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1073,143,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1074,144,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1075,145,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1076,146,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1077,147,'2015-11-01',0,0,0,0,'2015-10-20 18:43:26',0),(1078,148,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1079,149,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1080,150,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1081,151,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1082,152,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1083,153,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1084,154,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1085,155,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1086,156,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1087,157,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1088,158,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1089,159,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1090,160,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1091,161,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1092,162,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1093,163,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1094,164,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1095,165,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1096,166,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1097,167,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1098,168,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1099,169,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1100,170,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1101,171,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1102,172,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1103,173,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1104,174,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1105,175,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1106,176,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1107,177,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1108,178,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1109,179,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1110,180,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1111,181,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1112,182,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1113,183,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1114,184,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1115,185,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1116,186,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1117,187,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1118,188,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1119,189,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1120,190,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1121,191,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1122,192,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1123,193,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1124,194,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1125,195,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1126,196,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1127,197,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1128,198,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1129,199,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1130,200,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1131,201,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1132,202,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1133,203,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1134,204,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1135,205,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1136,206,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1137,207,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1138,208,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1139,209,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1140,210,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1141,211,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1142,212,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1143,213,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1144,214,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1145,215,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1146,216,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1147,217,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1148,218,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1149,219,'2015-11-01',0,0,0,0,'2015-10-20 18:43:27',0),(1150,220,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1151,221,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1152,222,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1153,223,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1154,224,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1155,225,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1156,226,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1157,227,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1158,228,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1159,229,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1160,230,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1161,231,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1162,232,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1163,233,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1164,234,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1165,235,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1166,236,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1167,237,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1168,238,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1169,239,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1170,240,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1171,241,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1172,242,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1173,243,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1174,244,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1175,245,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1176,246,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1177,247,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1178,248,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1179,249,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1180,250,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1181,251,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1182,252,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1183,253,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1184,254,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1185,255,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1186,256,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1187,257,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1188,258,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1189,259,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1190,260,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1191,261,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1192,262,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1193,263,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1194,264,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1195,265,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1196,266,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1197,267,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1198,268,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1199,269,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1200,270,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1201,271,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1202,272,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1203,273,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1204,274,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1205,275,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1206,276,'2015-11-01',0,0,0,0,'2015-10-20 18:43:28',0),(1207,277,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1208,278,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1209,279,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1210,280,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1211,281,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1212,282,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1213,283,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1214,284,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1215,285,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1216,286,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1217,287,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1218,288,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1219,289,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1220,290,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1221,291,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1222,292,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1223,293,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1224,294,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1225,295,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1226,296,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1227,297,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1228,298,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1229,299,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1230,300,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1231,301,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1232,302,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1233,303,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1234,304,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1235,305,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1236,306,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1237,307,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1238,308,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1239,309,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0),(1240,310,'2015-11-01',0,0,0,0,'2015-10-20 18:43:29',0);
/*!40000 ALTER TABLE `default_pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_permissions`
--

DROP TABLE IF EXISTS `default_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_permissions`
--

LOCK TABLES `default_permissions` WRITE;
/*!40000 ALTER TABLE `default_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pnama_rekening`
--

DROP TABLE IF EXISTS `default_pnama_rekening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pnama_rekening` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pnama_rekening`
--

LOCK TABLES `default_pnama_rekening` WRITE;
/*!40000 ALTER TABLE `default_pnama_rekening` DISABLE KEYS */;
INSERT INTO `default_pnama_rekening` VALUES (1,'Bayar Listrik'),(2,'Tenaga Maintenence'),(3,'Official'),(4,'Rapat'),(5,'Iuran Pelanggan'),(6,'pasang Baru'),(7,'Alat dan Bahan'),(8,'Konsumsi'),(9,'Setor Bank'),(10,'Pengadaan Barang');
/*!40000 ALTER TABLE `default_pnama_rekening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pneraca`
--

DROP TABLE IF EXISTS `default_pneraca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pneraca` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `kode_rek` varchar(5) NOT NULL,
  `keterangan` text NOT NULL,
  `debit` int(11) NOT NULL,
  `kredit` int(11) NOT NULL,
  `file` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pneraca`
--

LOCK TABLES `default_pneraca` WRITE;
/*!40000 ALTER TABLE `default_pneraca` DISABLE KEYS */;
INSERT INTO `default_pneraca` VALUES (1,'2015-10-12','10','Beli Tinta Printer RGB BLACK',0,100000,''),(2,'2015-10-19','10','Kabel Powe usb dan memory microSD (Untuk komponen komputer billing)',0,145000,''),(3,'2015-10-21','2','Insentif petugas pengecekkan pompa untuk bulan juli-agustus-september (Diterima Surmono)',0,300000,''),(4,'2015-10-21','6','Biaya Tenaga pemasangan SR Bp Purbo (Diterima Surmono)',0,150000,''),(5,'2015-10-19','10','Beli komputer raspberry untuk billing ',0,550000,''),(7,'2015-10-19','10','Beli Box Komputer',0,100000,''),(8,'2015-10-26','1','Bayar Listrik Pompa (Diterima Iwan)',0,2120000,''),(9,'2015-10-20','10','Beli Spidol Permanent',0,20000,''),(10,'2015-10-26','2','Biaya Tenaga Pasang SR baru Dan Beli Material pemasangan (Pralon, Keni, Konsumsi, Semen, Lem Dll)',0,500000,''),(11,'2015-10-27','6','Biaya Pasang Baru @darti:450000, Harso:150000 (Kurang 300000), Sudar:450000 (Dari Suryono)',1050000,0,''),(12,'2015-10-26','6','Biaya Pasang Baru (Dari Suryono)',1350000,0,''),(13,'2015-10-31','10','beli monitor billing',0,850000,''),(14,'2015-10-31','10','beli converter hdmi to vga',0,110000,''),(15,'2015-10-31','10','beli keyboard ',0,85000,''),(16,'2015-09-10','9','Menabung  Di bank di pegang Bp Purwatmo',0,500000,''),(17,'2015-09-10','2','Biaya Tenaga untuk menyedot air Progo selama 1 Bulan ',0,1200000,''),(18,'2015-09-10','2','Biaya LAS Pipa',0,150000,''),(19,'2015-09-10','3','Bayar Hutang Ke Toko Umbulkencono',0,2000000,''),(20,'2015-09-09','2','Tenaga kuras Bak',0,75000,''),(21,'2015-09-10','1','Listrik Bak penampungan',0,50000,''),(22,'2015-09-10','2','Tenaga penagihan dan Baca Meter',0,500000,''),(23,'2015-09-10','8','Konsumsi Rapat',0,50000,''),(24,'2015-09-10','3','Bayar Hutang Kepada pak surmono',0,475000,''),(25,'2015-09-10','3','Tenaga Penerima Pembayaran',0,300000,''),(26,'2015-09-10','3','Jasa Perhitungan dan print kwitansi',0,200000,''),(27,'2015-09-10','10','Bensin Sedot Air',0,368000,''),(28,'2015-09-10','10','Beli Pipa ',0,1000000,''),(29,'2015-09-10','1','Bayar listrik Pompa',0,1000000,''),(30,'2015-09-16','8','Konsumsi Tukang Bor 1 Minggu',0,326000,''),(31,'2015-09-05','1','Bayar listrik Pompa',0,600000,''),(32,'2015-09-05','1','Bayar listrik Pompa',0,1000000,''),(33,'2015-10-15','1','Bayar listrik Pompa',0,1206000,''),(34,'2015-09-01','5','Iuran Pelanggan di bayar di Bulan September',6500000,0,''),(35,'2015-09-01','5','Tagihan tunggakan pelanggan',1500000,0,''),(36,'2015-09-01','6','Tagihan tunggakan pelanggan',1200000,0,''),(37,'2015-10-27','2','Pembelian\nKeni 20000\nSemen 53000\nkonsumsi 50000\nsikat bak 25000\ntenaga kuras bak 125000\ntenaga pasang baru 300000\nbeli pipa 297000',0,870000,''),(39,'2015-11-02','2','iuran',0,0,'/home/pi/www/kwitansi/02-November-2015_kwitansi_Tenaga_Maintenence.txt');
/*!40000 ALTER TABLE `default_pneraca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_profiles`
--

DROP TABLE IF EXISTS `default_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8_unicode_ci,
  `dob` int(11) DEFAULT NULL,
  `gender` set('m','f','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_profiles`
--

LOCK TABLES `default_profiles` WRITE;
/*!40000 ALTER TABLE `default_profiles` DISABLE KEYS */;
INSERT INTO `default_profiles` VALUES (1,NULL,NULL,NULL,NULL,1,'Asbin Arjinto','Asbin','Arjinto','','en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `default_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_redirects`
--

DROP TABLE IF EXISTS `default_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302',
  PRIMARY KEY (`id`),
  KEY `from` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_redirects`
--

LOCK TABLES `default_redirects` WRITE;
/*!40000 ALTER TABLE `default_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_sample`
--

DROP TABLE IF EXISTS `default_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_sample`
--

LOCK TABLES `default_sample` WRITE;
/*!40000 ALTER TABLE `default_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_search_index`
--

DROP TABLE IF EXISTS `default_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_search_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `keyword_hash` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_edit_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_delete_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`module`,`entry_key`,`entry_id`(190)),
  FULLTEXT KEY `full search` (`title`,`description`,`keywords`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_search_index`
--

LOCK TABLES `default_search_index` WRITE;
/*!40000 ALTER TABLE `default_search_index` DISABLE KEYS */;
INSERT INTO `default_search_index` VALUES (1,'Home','',NULL,NULL,'pages','pages:page','pages:pages','1','home','admin/pages/edit/1','admin/pages/delete/1'),(2,'Contact','',NULL,NULL,'pages','pages:page','pages:pages','2','contact','admin/pages/edit/2','admin/pages/delete/2'),(3,'Search','',NULL,NULL,'pages','pages:page','pages:pages','3','search','admin/pages/edit/3','admin/pages/delete/3'),(4,'Results','',NULL,NULL,'pages','pages:page','pages:pages','4','search/results','admin/pages/edit/4','admin/pages/delete/4'),(5,'Page missing','',NULL,NULL,'pages','pages:page','pages:pages','5','404','admin/pages/edit/5','admin/pages/delete/5');
/*!40000 ALTER TABLE `default_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_settings`
--

DROP TABLE IF EXISTS `default_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique_slug` (`slug`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_settings`
--

LOCK TABLES `default_settings` WRITE;
/*!40000 ALTER TABLE `default_settings` DISABLE KEYS */;
INSERT INTO `default_settings` VALUES ('activation_email','Activation Email','Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.','select','1','','0=activate_by_admin|1=activate_by_email|2=no_activation',0,1,'users',961),('addons_upload','Addons Upload Permissions','Keeps mere admins from uploading addons by default','text','0','1','',1,0,'',0),('admin_force_https','Force HTTPS for Control Panel?','Allow only the HTTPS protocol when using the Control Panel?','radio','0','','1=Yes|0=No',1,1,'',0),('admin_theme','Control Panel Theme','Select the theme for the control panel.','','','pyrocms','func:get_themes',1,0,'',0),('akismet_api_key','Akismet API Key','Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.','text','','','',0,1,'integration',981),('api_enabled','API Enabled','Allow API access to all modules which have an API controller.','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),('api_user_keys','API User Keys','Allow users to sign up for API keys (if the API is Enabled).','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),('auto_username','Auto Username','Create the username automatically, meaning users can skip making one on registration.','radio','1','','1=Enabled|0=Disabled',0,1,'users',964),('cdn_domain','CDN Domain','CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.','text','','','',0,1,'integration',1000),('ckeditor_config','CKEditor Config','You can find a list of valid configuration items in <a target=\"_blank\" href=\"http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html\">CKEditor\'s documentation.</a>','textarea','','{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\n$(\'textarea#intro.wysiwyg-simple\').ckeditor({\n	toolbar: [\n		[\'pyroimages\'],\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\n	  ],\n	extraPlugins: \'pyroimages\',\n	width: \'99%\',\n	height: 100,\n	dialog_backgroundCoverColor: \'#000\',\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\n	language: \'{{ global:current_language }}\'\n});\n\n{{# this is the config for all wysiwyg-simple textareas #}}\n$(\'textarea.wysiwyg-simple\').ckeditor({\n	toolbar: [\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\n	  ],\n	width: \'99%\',\n	height: 100,\n	dialog_backgroundCoverColor: \'#000\',\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\n	language: \'{{ global:current_language }}\'\n});\n\n{{# and this is the advanced editor #}}\n$(\'textarea.wysiwyg-advanced\').ckeditor({\n	toolbar: [\n		[\'Maximize\'],\n		[\'pyroimages\', \'pyrofiles\'],\n		[\'Cut\',\'Copy\',\'Paste\',\'PasteFromWord\'],\n		[\'Undo\',\'Redo\',\'-\',\'Find\',\'Replace\'],\n		[\'Link\',\'Unlink\'],\n		[\'Table\',\'HorizontalRule\',\'SpecialChar\'],\n		[\'Bold\',\'Italic\',\'StrikeThrough\'],\n		[\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\n		[\'Format\', \'FontSize\', \'Subscript\',\'Superscript\', \'NumberedList\',\'BulletedList\',\'Outdent\',\'Indent\',\'Blockquote\'],\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\n	],\n	extraPlugins: \'pyroimages,pyrofiles\',\n	width: \'99%\',\n	height: 400,\n	dialog_backgroundCoverColor: \'#000\',\n	removePlugins: \'elementspath\',\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\n	language: \'{{ global:current_language }}\'\n});','',1,1,'wysiwyg',993),('comment_markdown','Allow Markdown','Do you want to allow visitors to post comments using Markdown?','select','0','0','0=Text Only|1=Allow Markdown',1,1,'comments',965),('comment_order','Comment Order','Sort order in which to display comments.','select','ASC','ASC','ASC=Oldest First|DESC=Newest First',1,1,'comments',966),('contact_email','Contact E-mail','All e-mails from users, guests and the site will go to this e-mail address.','text','arjint2004@gmail.com','','',1,1,'email',979),('currency','Currency','The currency symbol for use on products, services, etc.','text','&pound;','','',1,1,'',994),('dashboard_rss','Dashboard RSS Feed','Link to an RSS feed that will be displayed on the dashboard.','text','https://www.pyrocms.com/blog/rss/all.rss','','',0,1,'',990),('dashboard_rss_count','Dashboard RSS Items','How many RSS items would you like to display on the dashboard?','text','5','5','',1,1,'',989),('date_format','Date Format','How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.','text','F j, Y','','',1,1,'',995),('default_theme','Default Theme','Select the theme you want users to see by default.','','default','default','func:get_themes',1,0,'',0),('enable_comments','Enable Comments','Enable comments.','radio','1','1','1=Enabled|0=Disabled',1,1,'comments',968),('enable_profiles','Enable profiles','Allow users to add and edit profiles.','radio','1','','1=Enabled|0=Disabled',1,1,'users',963),('enable_registration','Enable user registration','Allow users to register in your site.','radio','1','','1=Enabled|0=Disabled',0,1,'users',961),('files_cache','Files Cache','When outputting an image via site.com/files what shall we set the cache expiration for?','select','480','480','0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days',1,1,'files',986),('files_cf_api_key','Rackspace Cloud Files API Key','You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.','text','','','',0,1,'files',989),('files_cf_username','Rackspace Cloud Files Username','To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href=\"https://manage.rackspacecloud.com/APIAccess.do\">Find your credentials</a>','text','','','',0,1,'files',990),('files_enabled_providers','Enabled File Storage Providers','Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below','checkbox','0','0','amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files',0,1,'files',994),('files_s3_access_key','Amazon S3 Access Key','To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href=\"https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials\">Find your credentials</a>','text','','','',0,1,'files',993),('files_s3_geographic_location','Amazon S3 Geographic Location','Either US or EU. If you change this you must also change the S3 URL.','radio','US','US','US=United States|EU=Europe',1,1,'files',991),('files_s3_secret_key','Amazon S3 Secret Key','You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.','text','','','',0,1,'files',992),('files_s3_url','Amazon S3 URL','Change this if using one of Amazon\'s EU locations or a custom domain.','text','http://{{ bucket }}.s3.amazonaws.com/','http://{{ bucket }}.s3.amazonaws.com/','',0,1,'files',991),('files_upload_limit','Filesize Limit','Maximum filesize to allow when uploading. Specify the size in MB. Example: 5','text','5','5','',1,1,'files',987),('frontend_enabled','Site Status','Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.','radio','1','','1=Open|0=Closed',1,1,'',988),('ga_email','Google Analytic E-mail','E-mail address used for Google Analytics, we need this to show the graph on the dashboard.','text','','','',0,1,'integration',983),('ga_password','Google Analytic Password','This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href=\"https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US\" target=\"_blank\">Authorized Access to your Google Account</a>','password','','','',0,1,'integration',982),('ga_profile','Google Analytic Profile ID','Profile ID for this website in Google Analytics','text','','','',0,1,'integration',984),('ga_tracking','Google Tracking Code','Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6','text','','','',0,1,'integration',985),('mail_line_endings','Email Line Endings','Change from the standard \\r\\n line ending to PHP_EOL for some email servers.','select','1','1','0=PHP_EOL|1=\\r\\n',0,1,'email',972),('mail_protocol','Mail Protocol','Select desired email protocol.','select','mail','mail','mail=Mail|sendmail=Sendmail|smtp=SMTP',1,1,'email',977),('mail_sendmail_path','Sendmail Path','Path to server sendmail binary.','text','','','',0,1,'email',972),('mail_smtp_host','SMTP Host Name','The host name of your smtp server.','text','','','',0,1,'email',976),('mail_smtp_pass','SMTP password','SMTP password.','password','','','',0,1,'email',975),('mail_smtp_port','SMTP Port','SMTP port number.','text','','','',0,1,'email',974),('mail_smtp_user','SMTP User Name','SMTP user name.','text','','','',0,1,'email',973),('meta_topic','Meta Topic','Two or three words describing this type of company/website.','text','Content Management','Add your slogan here','',0,1,'',998),('moderate_comments','Moderate Comments','Force comments to be approved before they appear on the site.','radio','1','1','1=Enabled|0=Disabled',1,1,'comments',967),('pam_setting','Pam Setting','A Yes or No option for the Pam module','select','1','1','1=Yes|0=No',1,1,'pam',0),('profile_visibility','Profile Visibility','Specify who can view user profiles on the public site','select','public','','public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member',0,1,'users',960),('records_per_page','Records Per Page','How many records should we show per page in the admin section?','select','25','','10=10|25=25|50=50|100=100',1,1,'',992),('registered_email','User Registered Email','Send a notification email to the contact e-mail when someone registers.','radio','1','','1=Enabled|0=Disabled',0,1,'users',962),('rss_feed_items','Feed item count','How many items should we show in RSS/blog feeds?','select','25','','10=10|25=25|50=50|100=100',1,1,'',991),('sample_setting','Sample Setting','A Yes or No option for the Sample module','select','1','1','1=Yes|0=No',1,1,'sample',0),('server_email','Server E-mail','All e-mails to users will come from this e-mail address.','text','admin@localhost','','',1,1,'email',978),('site_lang','Site Language','The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.','select','en','en','func:get_supported_lang',1,1,'',997),('site_name','Site Name','The name of the website for page titles and for use around the site.','text','Un-named Website','','',1,1,'',1000),('site_public_lang','Public Languages','Which are the languages really supported and offered on the front-end of your website?','checkbox','en','en','func:get_supported_lang',1,1,'',996),('site_slogan','Site Slogan','The slogan of the website for page titles and for use around the site','text','','Add your slogan here','',0,1,'',999),('unavailable_message','Unavailable Message','When the site is turned off or there is a major problem, this message will show to users.','textarea','Sorry, this website is currently unavailable.','','',0,1,'',987);
/*!40000 ALTER TABLE `default_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_theme_options`
--

DROP TABLE IF EXISTS `default_theme_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_theme_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox','colour-picker') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_theme_options`
--

LOCK TABLES `default_theme_options` WRITE;
/*!40000 ALTER TABLE `default_theme_options` DISABLE KEYS */;
INSERT INTO `default_theme_options` VALUES (1,'pyrocms_recent_comments','Recent Comments','Would you like to display recent comments on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(2,'pyrocms_news_feed','News Feed','Would you like to display the news feed on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(3,'pyrocms_quick_links','Quick Links','Would you like to display quick links on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(4,'pyrocms_analytics_graph','Analytics Graph','Would you like to display the graph on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(5,'show_breadcrumbs','Show Breadcrumbs','Would you like to display breadcrumbs?','radio','yes','yes','yes=Yes|no=No',1,'default'),(6,'layout','Layout','Which type of layout shall we use?','select','2 column','2 column','2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page',1,'default');
/*!40000 ALTER TABLE `default_theme_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_users`
--

DROP TABLE IF EXISTS `default_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_users`
--

LOCK TABLES `default_users` WRITE;
/*!40000 ALTER TABLE `default_users` DISABLE KEYS */;
INSERT INTO `default_users` VALUES (1,'arjint2004@gmail.com','1cb5058e2e063230cf04ed3c2f6cec4753ed103f','c81bf',1,'',1,'',1445311110,1446456181,'admin',NULL,'7b855b39ce238eb373f7d0634987267b607ee1a5');
/*!40000 ALTER TABLE `default_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_variables`
--

DROP TABLE IF EXISTS `default_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_variables`
--

LOCK TABLES `default_variables` WRITE;
/*!40000 ALTER TABLE `default_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widget_areas`
--

DROP TABLE IF EXISTS `default_widget_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_widget_areas`
--

LOCK TABLES `default_widget_areas` WRITE;
/*!40000 ALTER TABLE `default_widget_areas` DISABLE KEYS */;
INSERT INTO `default_widget_areas` VALUES (1,'sidebar','Sidebar');
/*!40000 ALTER TABLE `default_widget_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widget_instances`
--

DROP TABLE IF EXISTS `default_widget_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_widget_instances`
--

LOCK TABLES `default_widget_instances` WRITE;
/*!40000 ALTER TABLE `default_widget_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_widget_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widgets`
--

DROP TABLE IF EXISTS `default_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_widgets`
--

LOCK TABLES `default_widgets` WRITE;
/*!40000 ALTER TABLE `default_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-02 22:11:02
