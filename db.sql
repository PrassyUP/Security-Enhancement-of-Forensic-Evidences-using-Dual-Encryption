/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.31 : Database - cloudencryption
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cloudencryption` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cloudencryption`;

/*Table structure for table `add_crime` */

DROP TABLE IF EXISTS `add_crime`;

CREATE TABLE `add_crime` (
  `crime_num` int NOT NULL AUTO_INCREMENT,
  `station_num` varchar(300) DEFAULT NULL,
  `fname` varchar(300) DEFAULT NULL,
  `lname` varchar(300) DEFAULT NULL,
  `designation` varchar(300) DEFAULT NULL,
  `case_num` varchar(300) DEFAULT NULL,
  `type_of_crime` varchar(300) DEFAULT NULL,
  `latitude` varchar(300) DEFAULT NULL,
  `longitude` varchar(300) DEFAULT NULL,
  `status` varchar(300) DEFAULT NULL,
  `date` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`crime_num`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `add_crime` */

insert  into `add_crime`(`crime_num`,`station_num`,`fname`,`lname`,`designation`,`case_num`,`type_of_crime`,`latitude`,`longitude`,`status`,`date`) values 
(1,'5','ancd','jhfkjhf','fkjakfj','kfjk','lkjfkafj','kxjdfdk','kseirei','lkdjf','13/05/2001');

/*Table structure for table `add_forensic_staff` */

DROP TABLE IF EXISTS `add_forensic_staff`;

CREATE TABLE `add_forensic_staff` (
  `fs_id` int NOT NULL AUTO_INCREMENT,
  `login_id` int DEFAULT NULL,
  `fname` varchar(300) DEFAULT NULL,
  `lname` varchar(300) DEFAULT NULL,
  `gender` varchar(300) DEFAULT NULL,
  `dob` varchar(300) DEFAULT NULL,
  `state` varchar(300) DEFAULT NULL,
  `district` varchar(300) DEFAULT NULL,
  `city` varchar(300) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `pincode` varchar(300) DEFAULT NULL,
  `phone` varchar(300) DEFAULT NULL,
  `alt_phone` varchar(300) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `doj` varchar(300) DEFAULT NULL,
  `photo` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`fs_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `add_forensic_staff` */

insert  into `add_forensic_staff`(`fs_id`,`login_id`,`fname`,`lname`,`gender`,`dob`,`state`,`district`,`city`,`address`,`pincode`,`phone`,`alt_phone`,`email`,`doj`,`photo`) values 
(6,9,'kkk','aaaaakkk','female','2024-02-15','sfjijff','wfrwfrw','adfafqq','dfsfsf','56666','32589787','4894894894894','abcd@gmail.com','2012-06-07',''),
(5,8,'prassy','aaaaakkk','female','2024-02-15','sfjijff','wfrwfrw','adfafqq','dfsfsf','56666','32589787','4894894894894','abcd@gmail.com','2012-06-07',''),
(7,10,'aaa','efwefwe','male','2024-02-13','efge','egwe','efgwgfwe','ege','56655','6512333','66465468','zdwdq@gmail.com','2012-03-02',''),
(8,13,'sandy','sand','female','2024-02-28','aaaaaa','aaaaaa','aaaaaa','wfegsgd','3256622','65656565','65786565','sandy@gmail.com','2024-02-22','');

/*Table structure for table `assign_staff` */

DROP TABLE IF EXISTS `assign_staff`;

CREATE TABLE `assign_staff` (
  `assign_id` int NOT NULL AUTO_INCREMENT,
  `fs_id` int DEFAULT NULL,
  `crime_num` int DEFAULT NULL,
  `status` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`assign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `assign_staff` */

insert  into `assign_staff`(`assign_id`,`fs_id`,`crime_num`,`status`) values 
(1,5,1,'assign'),
(2,7,1,'assign'),
(3,7,1,'examination'),
(4,6,1,'examination'),
(5,6,1,'collection');

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `attnd_id` int NOT NULL AUTO_INCREMENT,
  `fs_id` int DEFAULT NULL,
  `status` varchar(300) DEFAULT NULL,
  `date` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`attnd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `attendance` */

/*Table structure for table `court` */

DROP TABLE IF EXISTS `court`;

CREATE TABLE `court` (
  `court_id` int NOT NULL AUTO_INCREMENT,
  `login_id` int DEFAULT NULL,
  `crt_reg_num` varchar(300) DEFAULT NULL,
  `c_name` varchar(300) DEFAULT NULL,
  `ty_crt` varchar(300) DEFAULT NULL,
  `state` varchar(300) DEFAULT NULL,
  `district` varchar(300) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `pincode` varchar(300) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `phone1` varchar(300) DEFAULT NULL,
  `phone2` varchar(300) DEFAULT NULL,
  `officer_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`court_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `court` */

insert  into `court`(`court_id`,`login_id`,`crt_reg_num`,`c_name`,`ty_crt`,`state`,`district`,`address`,`pincode`,`email`,`phone1`,`phone2`,`officer_name`) values 
(1,1,'123','','','','','','','','','',''),
(2,2,'123','aaa','qwe','qwrt','asd','ewadwd','23456','abcd@gmail.com','23244521','131314','shfkwhr'),
(3,10,'123','aaa','qwe','qwrt','asd','ewadwd','23456','abcd@gmail.com','23244521','131314','shfkwhr'),
(4,11,'12365','uixfisu','erset','eeeee','eeeee','ttttt','369852','qwer@gmail.com','963258741','789654123','jhajhga'),
(5,14,'12365','uixfisu','erset','eeeee','eeeee','ttttt','369852','qwer@gmail.com','963258741','4634655','jhajhga'),
(6,15,'12365','uixfisu','erset','eeeee','eeeee','ttttt','369852','qwer@gmail.com','963258741','4634655','jhajhga'),
(7,16,'1236','uixfisu','erset','eeeee','eeeee','ttttt','369852','qwer@gmail.com','963258741','4634655','jhajhga');

/*Table structure for table `fingerprint` */

DROP TABLE IF EXISTS `fingerprint`;

CREATE TABLE `fingerprint` (
  `fp_id` int NOT NULL AUTO_INCREMENT,
  `crime_num` int DEFAULT NULL,
  `fs_id` int DEFAULT NULL,
  `pattern` varchar(300) DEFAULT NULL,
  `ref_point` varchar(300) DEFAULT NULL,
  `met_of_coll` varchar(300) DEFAULT NULL,
  `add_info` varchar(300) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `date_time` varchar(300) DEFAULT NULL,
  `f_status` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`fp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fingerprint` */

/*Table structure for table `foot_print` */

DROP TABLE IF EXISTS `foot_print`;

CREATE TABLE `foot_print` (
  `foot_id` int NOT NULL AUTO_INCREMENT,
  `crime_num` int DEFAULT NULL,
  `fs_id` int DEFAULT NULL,
  `left_len` varchar(300) DEFAULT NULL,
  `left_width` varchar(300) DEFAULT NULL,
  `right_len` varchar(300) DEFAULT NULL,
  `right_width` varchar(300) DEFAULT NULL,
  `add_info` varchar(300) DEFAULT NULL,
  `height` varchar(300) DEFAULT NULL,
  `gender` varchar(300) DEFAULT NULL,
  `date_time` varchar(300) DEFAULT NULL,
  `ft_status` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`foot_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `foot_print` */

/*Table structure for table `hair_test` */

DROP TABLE IF EXISTS `hair_test`;

CREATE TABLE `hair_test` (
  `hair_id` int NOT NULL AUTO_INCREMENT,
  `crime_num` int DEFAULT NULL,
  `fs_id` int DEFAULT NULL,
  `hair_fiber` varchar(300) DEFAULT NULL,
  `dia_medu` varchar(300) DEFAULT NULL,
  `dia_hair` varchar(300) DEFAULT NULL,
  `which_part` varchar(300) DEFAULT NULL,
  `pre_barr_bodies` varchar(300) DEFAULT NULL,
  `animal_or_human` varchar(300) DEFAULT NULL,
  `gender` varchar(300) DEFAULT NULL,
  `ht_status` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`hair_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hair_test` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(300) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `usertype` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'prassy','prassy123','court'),
(3,'abcd','123','staff'),
(4,'abcd','123','staff'),
(5,'abcd','123','staff'),
(6,'abcd','123','staff'),
(7,'abcd','1234','staff'),
(8,'abcd','dcba','staff'),
(9,'abcd','dcba','staff'),
(10,'prassy','123','court'),
(11,'abcd','abcd123','court'),
(12,'sandy','sandy123','staff'),
(13,'sandyy','sandyy123','staff'),
(14,'abcd','','court'),
(15,'abcdef','abcdef','court'),
(16,'abcdef','abcdef','court'),
(17,'police','police123','police'),
(18,'police','police123','police'),
(19,'police','police123','police'),
(20,'police','police123','police'),
(21,'police','police123','police'),
(22,'police','police123','police');

/*Table structure for table `policestation` */

DROP TABLE IF EXISTS `policestation`;

CREATE TABLE `policestation` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `login_id` int DEFAULT NULL,
  `st_reg_num` varchar(300) DEFAULT NULL,
  `zone` varchar(300) DEFAULT NULL,
  `district` varchar(300) DEFAULT NULL,
  `city` varchar(300) DEFAULT NULL,
  `pincode` varchar(300) DEFAULT NULL,
  `station_name` varchar(300) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `phone` varchar(300) DEFAULT NULL,
  `alt_phone` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `policestation` */

insert  into `policestation`(`station_id`,`login_id`,`st_reg_num`,`zone`,`district`,`city`,`pincode`,`station_name`,`address`,`email`,`phone`,`alt_phone`) values 
(1,4,'123','abcd','palakkad','ottapalam','456987','station1','abcdefghijklmno','pcd@gmail.com','456321789','5632893'),
(2,21,'123','aaaaa','bbbbb','cccccc','64569895','mmmmm','nnnnnn','mno@gmail.com','4565465465','23655411'),
(3,22,'123','aaaaa','bbbbb','cccccc','64569895','mmmmm','nnnnnn','mno@gmail.com','4565465465','23655411');

/*Table structure for table `post_mortem` */

DROP TABLE IF EXISTS `post_mortem`;

CREATE TABLE `post_mortem` (
  `pm_id` int NOT NULL AUTO_INCREMENT,
  `crime_num` int DEFAULT NULL,
  `fs_id` int DEFAULT NULL,
  `body_temp` varchar(300) DEFAULT NULL,
  `change_in_eye` varchar(300) DEFAULT NULL,
  `livor_mortis` varchar(300) DEFAULT NULL,
  `degradation` varchar(300) DEFAULT NULL,
  `time_snc_death_in_hrs` varchar(300) DEFAULT NULL,
  `degradation_time` varchar(300) DEFAULT NULL,
  `date_time` varchar(300) DEFAULT NULL,
  `pm_status` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`pm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `post_mortem` */

/*Table structure for table `request_evidence` */

DROP TABLE IF EXISTS `request_evidence`;

CREATE TABLE `request_evidence` (
  `req_ev_no` int NOT NULL AUTO_INCREMENT,
  `case_num` varchar(300) DEFAULT NULL,
  `court_id` int DEFAULT NULL,
  `status` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`req_ev_no`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `request_evidence` */

insert  into `request_evidence`(`req_ev_no`,`case_num`,`court_id`,`status`) values 
(1,'kfjk',1,'requested');

/*Table structure for table `teeth` */

DROP TABLE IF EXISTS `teeth`;

CREATE TABLE `teeth` (
  `teeth_id` int NOT NULL AUTO_INCREMENT,
  `crime_num` int DEFAULT NULL,
  `fs_id` int DEFAULT NULL,
  `root_diver` varchar(300) DEFAULT NULL,
  `appear` varchar(300) DEFAULT NULL,
  `color` varchar(300) DEFAULT NULL,
  `edge` varchar(300) DEFAULT NULL,
  `teeth_ident` varchar(300) DEFAULT NULL,
  `temp_typ_teeth` varchar(300) DEFAULT NULL,
  `per_typ_teeth` varchar(300) DEFAULT NULL,
  `date_time` varchar(300) DEFAULT NULL,
  `t_status` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`teeth_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teeth` */

/*Table structure for table `video_audio` */

DROP TABLE IF EXISTS `video_audio`;

CREATE TABLE `video_audio` (
  `va_id` int NOT NULL AUTO_INCREMENT,
  `fs_id` int DEFAULT NULL,
  `crime_num` int DEFAULT NULL,
  `audio` varchar(300) DEFAULT NULL,
  `video` varchar(300) DEFAULT NULL,
  `date_time` varchar(300) DEFAULT NULL,
  `va_status_` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`va_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `video_audio` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
