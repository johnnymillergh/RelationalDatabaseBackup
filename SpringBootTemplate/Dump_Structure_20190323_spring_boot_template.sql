-- MySQL dump 10.13  Distrib 5.7.25, for macos10.14 (x86_64)
--
-- Host: localhost    Database: spring_boot_template
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Current Database: `spring_boot_template`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `spring_boot_template` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `spring_boot_template`;

--
-- Table structure for table `t_permission`
--

DROP TABLE IF EXISTS `t_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_permission` (
  `id` bigint(64) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `name` varchar(50) NOT NULL COMMENT 'Permission name',
  `url` varchar(1000) DEFAULT NULL COMMENT 'URL.\n类型为页面时，代表前端路由地址，类型为按钮时，代表后端接口地址',
  `type` int(2) NOT NULL COMMENT 'Permission type. 页面-1，按钮-2',
  `permission` varchar(50) DEFAULT NULL COMMENT 'Permission expression',
  `method` varchar(50) DEFAULT NULL COMMENT 'Request method of API',
  `sort` int(11) NOT NULL COMMENT 'Sort',
  `parent_id` bigint(64) NOT NULL COMMENT 'Primary key of parent',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Permission Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `name` varchar(50) NOT NULL COMMENT 'Role name',
  `description` varchar(100) DEFAULT NULL COMMENT 'Role description',
  `create_time` datetime DEFAULT NULL COMMENT 'Create time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1072806379238068225 DEFAULT CHARSET=utf8 COMMENT='Role Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_role_permission`
--

DROP TABLE IF EXISTS `t_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_permission` (
  `role_id` bigint(64) NOT NULL COMMENT 'Part of primary key: foreign key of role',
  `permission_id` bigint(64) NOT NULL COMMENT 'Part of primary key: foreign key of permission',
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Role-permission Relation Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `username` varchar(50) NOT NULL COMMENT 'Username',
  `password` varchar(60) NOT NULL COMMENT 'Password',
  `nickname` varchar(255) DEFAULT NULL COMMENT 'Nickname',
  `phone` varchar(11) DEFAULT NULL COMMENT 'Cellphone number',
  `email` varchar(50) DEFAULT NULL COMMENT 'Email',
  `birthday` bigint(13) DEFAULT NULL COMMENT 'Birthday',
  `sex` int(2) DEFAULT NULL COMMENT 'Gender. Male-1, Female-2',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT 'Status. Enabled-1，Disenabled-0',
  `create_time` datetime DEFAULT NULL COMMENT 'Create time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='User Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_role` (
  `user_id` bigint(64) NOT NULL COMMENT 'Part of primary key: foreign key of user table',
  `role_id` bigint(64) NOT NULL COMMENT 'Part of primary key: foreign key of role table',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User-role Relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_table`
--

DROP TABLE IF EXISTS `test_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `content` varchar(100) DEFAULT NULL COMMENT 'Max length: 100 characters',
  `created_time` datetime DEFAULT NULL COMMENT 'Created time (Default format: yyyy-MM-dd HH:mm:ss)',
  `created_person` int(11) DEFAULT NULL COMMENT 'Created person’s primary key',
  `modified_time` datetime DEFAULT NULL COMMENT 'Modified time (Default format: yyyy-MM-dd HH:mm:ss)',
  `modified_person` int(11) DEFAULT NULL COMMENT 'Modified person’s primary key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-23 23:36:18
