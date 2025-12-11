/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - itenaryplanning
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`itenaryplanning` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `itenaryplanning`;

/*Table structure for table `advertisement` */

DROP TABLE IF EXISTS `advertisement`;

CREATE TABLE `advertisement` (
  `advertisement_id` int(10) NOT NULL AUTO_INCREMENT,
  `touroperator_id` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`advertisement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `advertisement` */

insert  into `advertisement`(`advertisement_id`,`touroperator_id`,`date`,`subject`,`content`,`image`) values 
(1,NULL,NULL,'nm,','hjk',NULL),
(2,NULL,NULL,'de','ff',NULL),
(3,NULL,NULL,'er','df',NULL),
(4,NULL,NULL,'abcd','efghijklmn',NULL),
(5,NULL,NULL,'lhkkj','hgjhhg',NULL),
(9,1,'2022-10-12','er','wer','/static/advertisement/20221012160357.jpg'),
(11,2,'2022-10-18','hjkhj','bnm','/static/advertisement/20221018204016.jpg'),
(13,4,'2022-11-05','hkbekbfk','hvdhhjd','/static/advertisement/20221105133231.jpg'),
(14,2,'2022-11-05','abcde','adfghjkl','/static/advertisement/20221105134541.jpg'),
(15,2,'2022-11-05','gh','tyu','/static/advertisement/20221105134645.jpg'),
(16,2,'2022-11-05','qwe','wrr','/static/advertisement/20221105134843.jpg');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values 
(102,'hill  '),
(110,'historical'),
(111,'beach');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `feedback` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `touroperator_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`feedback_id`,`user_id`,`feedback`,`date`,`touroperator_id`) values 
(1,2,'good','2022-10-02',NULL),
(2,0,'','2023-01-05',NULL),
(3,0,'','2023-01-05',NULL),
(10,0,'','2023-01-05',NULL),
(11,16,'verygd','2023-01-05',NULL),
(13,16,'verygd','2023-01-05',NULL),
(14,16,'verygd','2023-01-05',NULL),
(16,16,'verygd','2023-01-05',NULL),
(17,16,'verygd','2023-01-05',NULL),
(18,16,'verygd','2023-01-05',NULL),
(20,16,'verygd','2023-01-05',NULL),
(21,16,'verygd','2023-01-05',NULL),
(22,16,'verygd','2023-01-05',NULL),
(35,16,'verygd','2023-01-05',NULL),
(36,16,'verygd','2023-01-05',NULL),
(37,16,'verygd','2023-01-05',NULL),
(38,16,'verygd','2023-01-05',NULL),
(39,16,'verygd','2023-01-05',NULL),
(40,16,'verygd','2023-01-05',NULL),
(41,16,'verygd','2023-01-05',NULL),
(42,16,'verygd','2023-01-05',NULL),
(43,16,'verygd','2023-01-05',NULL),
(44,16,'verygd','2023-01-05',NULL),
(45,16,'verygd','2023-01-05',NULL),
(46,16,'verygd','2023-01-05',NULL),
(47,16,'verygd','2023-01-05',NULL),
(48,16,'verygd','2023-01-05',NULL),
(49,16,'verygd','2023-01-05',NULL),
(50,16,'verygd','2023-01-05',NULL),
(51,16,'verygd','2023-01-05',NULL),
(52,16,'verygd','2023-01-05',NULL),
(53,16,'verygd','2023-01-05',NULL),
(54,16,'vrygd','2023-01-05',NULL),
(55,16,'vg','2023-01-05',NULL),
(56,16,'gr','2023-01-05',NULL),
(57,16,'ff','2023-01-05',NULL);

/*Table structure for table `food` */

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `food_id` int(10) NOT NULL AUTO_INCREMENT,
  `tourpackage_id` int(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `time` time(6) DEFAULT NULL,
  `food_details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `food` */

insert  into `food`(`food_id`,`tourpackage_id`,`day`,`time`,`food_details`) values 
(15,4,'0','07:00:00.000000','sdfggh'),
(17,7,'jebkjfhke','00:00:00.000000','kjbhfkh'),
(19,4,'1','00:00:00.000000','wedrfghj');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`user_type`) values 
(1,'admin@gmail.com','admin','admin'),
(2,'operator@gmail.com','123','tour_operator'),
(4,'op@gmail.com','mpm','tour_operator'),
(5,'sdfg@gmail.com','123','tour_operator'),
(6,'rfd','o','tour_operator'),
(7,'efgh@gmail.com','1234','tour_operator'),
(9,'sdfgh','1234','tour_operator'),
(11,'mufi@gmail.com','mufi123','tour_operator'),
(16,'tyy','123456','user'),
(17,'fh','12','user');

/*Table structure for table `offers` */

DROP TABLE IF EXISTS `offers`;

CREATE TABLE `offers` (
  `offer_id` int(10) NOT NULL AUTO_INCREMENT,
  `created_on` varchar(20) DEFAULT NULL,
  `touroperator_id` int(10) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `offer_details` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`offer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `offers` */

insert  into `offers`(`offer_id`,`created_on`,`touroperator_id`,`valid_from`,`valid_to`,`offer_details`) values 
(4,'2022-10-19',2,'2022-10-12','2022-10-14','bbbbbbbe'),
(5,'2022-11-05',4,'2022-11-11','2022-12-04','kqbjkr');

/*Table structure for table `other_services` */

DROP TABLE IF EXISTS `other_services`;

CREATE TABLE `other_services` (
  `service_id` int(10) NOT NULL AUTO_INCREMENT,
  `tourpackage_id` int(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `other_services` */

insert  into `other_services`(`service_id`,`tourpackage_id`,`day`,`title`,`description`) values 
(1,NULL,'ry','thnn','fegh,gn'),
(2,NULL,'3','ert','sdfghhjkl'),
(3,2,'gj','gj','gj'),
(4,2,'gjhgf','ghjk','hjk'),
(5,4,'m,','uuj','fryghujh'),
(6,7,'jqlnrlqfj','wyegywge','hgsudgus'),
(7,4,'4','title','sdrtyghjk');

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `user_id` int(10) DEFAULT NULL,
  `rating_id` int(10) NOT NULL AUTO_INCREMENT,
  `rating` varchar(5) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

insert  into `rating`(`user_id`,`rating_id`,`rating`,`date`) values 
(2,1,'4','2022-10-02');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `review_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_lid` int(10) DEFAULT NULL,
  `review` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `tourpackage_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert  into `review`(`review_id`,`user_lid`,`review`,`date`,`tourpackage_id`) values 
(1,2,'good','2022-10-04',1),
(2,2,'super','2022-10-12',4),
(3,2,'adipoli','2022-11-23',4),
(4,16,'fj','2023-01-05',NULL),
(5,16,'fy','2023-01-05',NULL);

/*Table structure for table `stay` */

DROP TABLE IF EXISTS `stay`;

CREATE TABLE `stay` (
  `stay_id` int(10) NOT NULL AUTO_INCREMENT,
  `tourpackage_id` int(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `stay_planned_at` varchar(25) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `stay` */

insert  into `stay`(`stay_id`,`tourpackage_id`,`day`,`stay_planned_at`,`place`) values 
(1,NULL,'tyyoip[','yt8800','fyio'),
(2,2,'hghc','gj','gg'),
(3,2,'ljlo;','lkj;oo;','hgig'),
(5,4,'yujik','tyu','fghj'),
(6,4,'4','gv resort','calicut'),
(7,7,'3','4','bjkja');

/*Table structure for table `tour_operator` */

DROP TABLE IF EXISTS `tour_operator`;

CREATE TABLE `tour_operator` (
  `touroperator_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `phone_no` decimal(10,0) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `licence_certificate` varchar(200) DEFAULT NULL,
  `login_id` int(10) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`touroperator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tour_operator` */

insert  into `tour_operator`(`touroperator_id`,`name`,`phone_no`,`email`,`licence_certificate`,`login_id`,`status`,`photo`,`place`) values 
(1,'grtt',0,'yyjuk',NULL,1,'blocked',NULL,NULL),
(2,'op',9090909090,'op@gmail.com',NULL,4,'blocked',NULL,NULL),
(3,'sdsd',1234567890,'sdfg@gmail.com',NULL,5,'blocked',NULL,NULL),
(4,'qwe',234567,'rfd',NULL,6,'rejected',NULL,NULL),
(5,'yhj',123456789,'sdfgh','/static/touroperator/20221105124228.jpg',9,'blocked',NULL,'edfg'),
(6,'thashreefa',9876543211,'thashri@gmail.com','/static/touroperator/20221105125508.jpg',10,'approved',NULL,'vengara'),
(7,'mufeena',4567893210,'mufi@gmail.com','/static/touroperator/20221105134339.jpg',11,'pending',NULL,'iringallor'),
(8,'njan',678905432,'njan@gmail.com',NULL,NULL,'pending',NULL,'mpm'),
(9,'sana',1234567890,'sanaaa@gmail.com','/static/touroperator/20221206124439.jpg',12,'pending',NULL,'calicut');

/*Table structure for table `tour_packeges` */

DROP TABLE IF EXISTS `tour_packeges`;

CREATE TABLE `tour_packeges` (
  `tourpackeges_id` int(10) NOT NULL AUTO_INCREMENT,
  `touroperator_id` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`tourpackeges_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tour_packeges` */

insert  into `tour_packeges`(`tourpackeges_id`,`touroperator_id`,`date`,`title`,`description`,`amount`) values 
(1,NULL,NULL,'hjklghj','ghj',0),
(4,2,'2022-10-18','nm','bnmkdhbejk',9567),
(5,2,'2022-10-18','ghj','fghj',12345),
(6,2,'2022-11-05','hjk','rtyu',898989),
(7,4,'2022-11-05','manali jebndjfah','n dnfkbkdb',7000);

/*Table structure for table `travel` */

DROP TABLE IF EXISTS `travel`;

CREATE TABLE `travel` (
  `travel_id` int(10) NOT NULL AUTO_INCREMENT,
  `tourpackage_id` int(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `places_covered` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`travel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `travel` */

insert  into `travel`(`travel_id`,`tourpackage_id`,`day`,`places_covered`) values 
(1,NULL,'iiopop','t8oii'),
(2,2,'erfhgj','fhgj'),
(3,2,'ghjh','hdjhd'),
(4,4,'hj','asdfghjkl;'),
(5,7,'2','4');

/*Table structure for table `tree` */

DROP TABLE IF EXISTS `tree`;

CREATE TABLE `tree` (
  `nodeid` int(10) NOT NULL,
  `venueid` int(10) DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `parentnodeid` int(10) DEFAULT NULL,
  `level` int(100) DEFAULT NULL,
  PRIMARY KEY (`nodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tree` */

insert  into `tree`(`nodeid`,`venueid`,`distance`,`parentnodeid`,`level`) values 
(0,12,0,0,1);

/*Table structure for table `tree_table` */

DROP TABLE IF EXISTS `tree_table`;

CREATE TABLE `tree_table` (
  `nod_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) DEFAULT NULL,
  `venue_id` int(10) DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  `distance` varchar(100) DEFAULT NULL,
  `parentnode_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`nod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tree_table` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_no` decimal(10,0) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `house_name` varchar(20) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `pincode` decimal(10,0) DEFAULT NULL,
  `district` varchar(20) DEFAULT NULL,
  `login_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`email`,`phone_no`,`gender`,`dob`,`house_name`,`place`,`pincode`,`district`,`login_id`) values 
(4,'tyy','tyy@gmail.com',1234567890,'Female','0000-00-00','vgj','dgji',123456789,'dgjj',16),
(5,'fh','hhgmail.com',9999999999,'Female','2002-01-02','gh','ghu',12356678,'vh',17);

/*Table structure for table `venues` */

DROP TABLE IF EXISTS `venues`;

CREATE TABLE `venues` (
  `venue_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) DEFAULT NULL,
  `district` varchar(20) DEFAULT NULL,
  `place` varchar(25) DEFAULT NULL,
  `photo1` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `latitude` varchar(90) DEFAULT NULL,
  `longitude` varchar(90) DEFAULT NULL,
  `photo2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `venues` */

insert  into `venues`(`venue_id`,`category_id`,`district`,`place`,`photo1`,`description`,`latitude`,`longitude`,`photo2`) values 
(1,100,'jjjj','Calicut beach','/static/venuephoto1/20221012153052.jpg','ohj','11.34','75.25','/static/venuephoto2/20221012153052.jpg'),
(2,NULL,'calicut',NULL,'/static/venuephoto1/20221012151204.jpg','ertyuijk','90','56','/static/venuephoto2/20221012151204.jpg'),
(6,101,'fg','sdf','/static/venuephoto1/20221012153848.jpg','fgh','45','79','/static/venuephoto2/20221012153838.jpg'),
(7,102,'idukki','moonnar','/static/venuephoto1/20221105120424.jpg','mountain place','45','78','/static/venuephoto2/20221105120424.jpg'),
(10,108,'idukki','thanghal para','/static/venuephoto1/20221110201025.jpg','asdfghjkl','123','234','/static/venuephoto2/20221110201025.jpg'),
(11,101,'kozhikkode','hilite mall','/static/venuephoto1/20221111200301.jpg','biggest mall in calicut','45','67','/static/venuephoto2/20221111200301.jpg'),
(12,111,'calicut','kappad beach','/static/venuephoto1/20221210133334.jpg','sdvnm','4567','64','/static/venuephoto2/20221210133334.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
