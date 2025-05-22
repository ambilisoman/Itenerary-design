/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - itinerarydesign
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`itinerarydesign` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `itinerarydesign`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add category',7,'add_category'),
(26,'Can change category',7,'change_category'),
(27,'Can delete category',7,'delete_category'),
(28,'Can view category',7,'view_category'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add venue',9,'add_venue'),
(34,'Can change venue',9,'change_venue'),
(35,'Can delete venue',9,'delete_venue'),
(36,'Can view venue',9,'view_venue'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add tourpackage',11,'add_tourpackage'),
(42,'Can change tourpackage',11,'change_tourpackage'),
(43,'Can delete tourpackage',11,'delete_tourpackage'),
(44,'Can view tourpackage',11,'view_tourpackage'),
(45,'Can add touroperator',12,'add_touroperator'),
(46,'Can change touroperator',12,'change_touroperator'),
(47,'Can delete touroperator',12,'delete_touroperator'),
(48,'Can view touroperator',12,'view_touroperator'),
(49,'Can add rating',13,'add_rating'),
(50,'Can change rating',13,'change_rating'),
(51,'Can delete rating',13,'delete_rating'),
(52,'Can view rating',13,'view_rating'),
(53,'Can add feedback',14,'add_feedback'),
(54,'Can change feedback',14,'change_feedback'),
(55,'Can delete feedback',14,'delete_feedback'),
(56,'Can view feedback',14,'view_feedback'),
(57,'Can add complaints',15,'add_complaints'),
(58,'Can change complaints',15,'change_complaints'),
(59,'Can delete complaints',15,'delete_complaints'),
(60,'Can view complaints',15,'view_complaints'),
(61,'Can add advertisement',16,'add_advertisement'),
(62,'Can change advertisement',16,'change_advertisement'),
(63,'Can delete advertisement',16,'delete_advertisement'),
(64,'Can view advertisement',16,'view_advertisement');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(16,'myapp','advertisement'),
(7,'myapp','category'),
(15,'myapp','complaints'),
(14,'myapp','feedback'),
(8,'myapp','login'),
(13,'myapp','rating'),
(12,'myapp','touroperator'),
(11,'myapp','tourpackage'),
(10,'myapp','user'),
(9,'myapp','venue'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-09-27 10:31:43.392915'),
(2,'auth','0001_initial','2024-09-27 10:31:43.528395'),
(3,'admin','0001_initial','2024-09-27 10:31:43.820009'),
(4,'admin','0002_logentry_remove_auto_add','2024-09-27 10:31:43.893265'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-09-27 10:31:43.902951'),
(6,'contenttypes','0002_remove_content_type_name','2024-09-27 10:31:43.948068'),
(7,'auth','0002_alter_permission_name_max_length','2024-09-27 10:31:43.986839'),
(8,'auth','0003_alter_user_email_max_length','2024-09-27 10:31:44.001019'),
(9,'auth','0004_alter_user_username_opts','2024-09-27 10:31:44.009188'),
(10,'auth','0005_alter_user_last_login_null','2024-09-27 10:31:44.048879'),
(11,'auth','0006_require_contenttypes_0002','2024-09-27 10:31:44.053210'),
(12,'auth','0007_alter_validators_add_error_messages','2024-09-27 10:31:44.061521'),
(13,'auth','0008_alter_user_username_max_length','2024-09-27 10:31:44.073162'),
(14,'auth','0009_alter_user_last_name_max_length','2024-09-27 10:31:44.086149'),
(15,'auth','0010_alter_group_name_max_length','2024-09-27 10:31:44.097599'),
(16,'auth','0011_update_proxy_permissions','2024-09-27 10:31:44.107618'),
(17,'myapp','0001_initial','2024-09-27 10:31:44.251923'),
(18,'sessions','0001_initial','2024-09-27 10:31:44.600305'),
(19,'myapp','0002_auto_20240927_1605','2024-09-27 10:35:21.976573'),
(20,'myapp','0003_auto_20240928_1515','2024-09-28 09:45:43.385888'),
(21,'myapp','0004_auto_20240928_1652','2024-09-28 11:22:38.251556'),
(22,'myapp','0005_auto_20240929_1227','2024-09-29 06:57:27.285982');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('kamwnqlnsolye5hsarxecr7xuu14xxde','MTI1ZGJhYWE5MWVkZDQ1ZTkxN2IxNDYzNThjY2I3YTE4NTY3NTI1ZTp7ImxpZCI6MX0=','2024-10-13 09:05:39.821369');

/*Table structure for table `myapp_advertisement` */

DROP TABLE IF EXISTS `myapp_advertisement`;

CREATE TABLE `myapp_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `VENUE_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_advertisement_VENUE_id_9b6544a3_fk_myapp_venue_id` (`VENUE_id`),
  CONSTRAINT `myapp_advertisement_VENUE_id_9b6544a3_fk_myapp_venue_id` FOREIGN KEY (`VENUE_id`) REFERENCES `myapp_venue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_advertisement` */

/*Table structure for table `myapp_category` */

DROP TABLE IF EXISTS `myapp_category`;

CREATE TABLE `myapp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_category` */

insert  into `myapp_category`(`id`,`categoryname`) values 
(1,'family pack');

/*Table structure for table `myapp_complaints` */

DROP TABLE IF EXISTS `myapp_complaints`;

CREATE TABLE `myapp_complaints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `complaint` varchar(200) NOT NULL,
  `reply` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_complaints_USER_id_f1892848_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_complaints_USER_id_f1892848_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_complaints` */

insert  into `myapp_complaints`(`id`,`date`,`complaint`,`reply`,`status`,`USER_id`) values 
(1,'2024-09-26','Very bad service.but good atmosphere','ok','replyed',1);

/*Table structure for table `myapp_feedback` */

DROP TABLE IF EXISTS `myapp_feedback`;

CREATE TABLE `myapp_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `USER_id` int(11) NOT NULL,
  `VENUE_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_USER_id_fce7ccff_fk_myapp_user_id` (`USER_id`),
  KEY `myapp_feedback_VENUE_id_344fa9af_fk_myapp_venue_id` (`VENUE_id`),
  CONSTRAINT `myapp_feedback_USER_id_fce7ccff_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`),
  CONSTRAINT `myapp_feedback_VENUE_id_344fa9af_fk_myapp_venue_id` FOREIGN KEY (`VENUE_id`) REFERENCES `myapp_venue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_feedback` */

insert  into `myapp_feedback`(`id`,`feedback`,`date`,`USER_id`,`VENUE_id`) values 
(7,'very good','2024-09-25',1,1),
(8,'average service','2024-09-19',1,1);

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`username`,`password`,`type`) values 
(1,'gautham','gautham123','admin'),
(2,'abinav','123','touropeator');

/*Table structure for table `myapp_rating` */

DROP TABLE IF EXISTS `myapp_rating`;

CREATE TABLE `myapp_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `rating` varchar(200) NOT NULL,
  `review` varchar(200) NOT NULL,
  `USER_id` int(11) NOT NULL,
  `VENUE_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_rating_USER_id_bc9cb943_fk_myapp_user_id` (`USER_id`),
  KEY `myapp_rating_VENUE_id_99d15827_fk_myapp_venue_id` (`VENUE_id`),
  CONSTRAINT `myapp_rating_USER_id_bc9cb943_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`),
  CONSTRAINT `myapp_rating_VENUE_id_99d15827_fk_myapp_venue_id` FOREIGN KEY (`VENUE_id`) REFERENCES `myapp_venue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_rating` */

insert  into `myapp_rating`(`id`,`date`,`rating`,`review`,`USER_id`,`VENUE_id`) values 
(2,'2024-09-29','5','very good',1,1),
(3,'2024-09-15','4','poor',1,1),
(6,'2024-09-25','3','more poor',1,1);

/*Table structure for table `myapp_touroperator` */

DROP TABLE IF EXISTS `myapp_touroperator`;

CREATE TABLE `myapp_touroperator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `place` varchar(200) NOT NULL,
  `post` varchar(200) NOT NULL,
  `pin` varchar(200) NOT NULL,
  `district` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `proof` varchar(200) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_touroperator_LOGIN_id_82d7ff9a_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_touroperator_LOGIN_id_82d7ff9a_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_touroperator` */

insert  into `myapp_touroperator`(`id`,`image`,`name`,`phone`,`email`,`place`,`post`,`pin`,`district`,`state`,`proof`,`LOGIN_id`,`status`) values 
(2,'','anandu','9876543219','anandu@1234','mahi','mahi','673619','kannur','kerala','',2,'approved'),
(4,'','gautham','1234567898','gautham@1234','payyoli','payyoli','67234','kozhikode','keralea','',1,'rejected');

/*Table structure for table `myapp_tourpackage` */

DROP TABLE IF EXISTS `myapp_tourpackage`;

CREATE TABLE `myapp_tourpackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `touroperator` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `amount` varchar(200) NOT NULL,
  `VENUE_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_tourpackage_VENUE_id_6c379795_fk_myapp_venue_id` (`VENUE_id`),
  CONSTRAINT `myapp_tourpackage_VENUE_id_6c379795_fk_myapp_venue_id` FOREIGN KEY (`VENUE_id`) REFERENCES `myapp_venue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_tourpackage` */

/*Table structure for table `myapp_user` */

DROP TABLE IF EXISTS `myapp_user`;

CREATE TABLE `myapp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `profile` varchar(200) NOT NULL,
  `place` varchar(200) NOT NULL,
  `post` varchar(200) NOT NULL,
  `pin` varchar(200) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  `district` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_user` */

insert  into `myapp_user`(`id`,`name`,`image`,`email`,`phone`,`profile`,`place`,`post`,`pin`,`LOGIN_id`,`district`) values 
(1,'abinav','','abinavedavana@gmail.com','7898998768','','malikadav','karuviserry','673616',2,'kozhikode');

/*Table structure for table `myapp_venue` */

DROP TABLE IF EXISTS `myapp_venue`;

CREATE TABLE `myapp_venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venuename` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `CATEGORY_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_venue_CATEGORY_id_64252e80_fk_myapp_category_id` (`CATEGORY_id`),
  CONSTRAINT `myapp_venue_CATEGORY_id_64252e80_fk_myapp_category_id` FOREIGN KEY (`CATEGORY_id`) REFERENCES `myapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_venue` */

insert  into `myapp_venue`(`id`,`venuename`,`photo`,`CATEGORY_id`) values 
(1,'abinav','/media/20240927-164326.jpg',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
