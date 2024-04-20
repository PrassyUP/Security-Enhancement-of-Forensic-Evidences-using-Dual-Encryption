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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `add_crime` */

insert  into `add_crime`(`crime_num`,`station_num`,`fname`,`lname`,`designation`,`case_num`,`type_of_crime`,`latitude`,`longitude`,`status`,`date`) values 
(12,'6','Prazzy','prabhakar','ASI','case101','murder','9.98162089525688','76.29926364476223','requested','2024-03-01'),
(11,'6','cfvgbhn','fcvgbh','fgh','345','dfgh','9.982883086129284','76.28837585449219','status','2024-03-14'),
(10,'6','crime','file','palakkad','crime101','murder','oklooll','lkiool','status','2024-03-01'),
(9,'5','crime3','crime3','crime3','crime3','wfw','kdjfskd','fsdddd','requested','2024-03-04'),
(8,'5','crime2','crime2','crime2','crime2','wfwwef','kdjfskdfjl','sdvd','requested','2024-03-04'),
(7,'5','crime1','crime1','crime','crime','sjfhsjkfh','kdjfskdfj','jdfhf','status','2024-03-08');

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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `add_forensic_staff` */

insert  into `add_forensic_staff`(`fs_id`,`login_id`,`fname`,`lname`,`gender`,`dob`,`state`,`district`,`city`,`address`,`pincode`,`phone`,`alt_phone`,`email`,`doj`,`photo`) values 
(34,60,'Prassy','up','female','2020-01-13','mmmmm','mmmmm','mmmm','mmmmm','652398','5632568955','5263417895','prassy@gmail.com','2024-03-05','static/e8902fa9-975a-4de9-bc6d-0cc081e6cb4fPicture1.jpg'),
(35,63,'shinyy','shine','female','2024-03-01','kerala','palakkad','ottapalam','abcdefghijklmnop','652398','1236547896','6541239877','shiny@gmail.com','2024-03-02','static/89ec6f1e-289d-48c5-a9f5-e42a2f460b4cPicture1.png'),
(33,59,'Ronald','Jose','male','2024-03-13','Kerala','Thrissur','Thalore','Meleth','680306','7412589632','742589632','Rono@gmail.com','2024-03-14','static/aaa401fd-41a8-41f4-acbd-c25a623ca109closeup-shot-metal-handcuffs-white.jpg'),
(32,54,'kalluu','kalluu','male','2024-03-07','kalluu','kalluu','kalluuu','kalluu','655565','65523366','5266322','kallu@gmail.com','2024-03-15','static/Screenshot.png'),
(31,53,'allu','alluu','male','2024-03-14','aaaaaa','aaaaa','aaaa','aaaa','111111','56322556','6663225','klklkk@gmail.com','2024-03-14','Screenshot (9).png');

/*Table structure for table `assign_staff` */

DROP TABLE IF EXISTS `assign_staff`;

CREATE TABLE `assign_staff` (
  `assign_id` int NOT NULL AUTO_INCREMENT,
  `fs_id` int DEFAULT NULL,
  `crime_num` int DEFAULT NULL,
  `assign_status` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`assign_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `assign_staff` */

insert  into `assign_staff`(`assign_id`,`fs_id`,`crime_num`,`assign_status`) values 
(11,32,9,'examination'),
(10,31,9,'collection'),
(9,31,7,'examination'),
(8,32,7,'collection'),
(7,32,7,'collection'),
(12,35,12,'collection'),
(13,35,12,'examination');

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `attnd_id` int NOT NULL AUTO_INCREMENT,
  `fs_id` int DEFAULT NULL,
  `status` varchar(300) DEFAULT NULL,
  `date` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`attnd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `attendance` */

insert  into `attendance`(`attnd_id`,`fs_id`,`status`,`date`) values 
(77,35,'status','2024-03-20 14:38:11'),
(76,35,'status','2024-03-20 14:36:54'),
(75,35,'status','2024-03-20 14:18:44'),
(74,31,'status','2024-03-20 10:34:21'),
(73,31,'status','2024-03-20 10:33:01'),
(72,31,'status','2024-03-18 14:57:37'),
(71,31,'status','2024-03-18 14:51:04'),
(70,31,'status','2024-03-18 14:39:44'),
(69,31,'status','2024-03-18 14:34:24'),
(68,31,'status','2024-03-18 14:25:43'),
(67,31,'status','2024-03-18 14:14:33'),
(66,31,'status','2024-03-18 13:22:36'),
(65,33,'status','2024-03-18 13:22:16'),
(64,34,'status','2024-03-18 13:16:14'),
(63,31,'status','2024-03-18 12:54:29'),
(62,31,'status','2024-03-18 10:18:01'),
(61,31,'status','2024-03-15 14:06:08'),
(60,31,'status','2024-03-15 11:47:19'),
(59,31,'status','2024-03-15 11:35:50'),
(58,31,'status','2024-03-15 11:09:44'),
(57,31,'status','2024-03-15 10:44:54'),
(56,31,'status','2024-03-13 15:33:48'),
(55,32,'status','2024-03-13 15:33:32'),
(54,31,'status','2024-03-13 15:23:50'),
(53,32,'status','2024-03-13 15:23:31'),
(52,32,'status','2024-03-13 14:26:28'),
(51,31,'status','2024-03-13 14:25:57'),
(50,31,'status','2024-03-13 14:25:14'),
(49,31,'status','2024-03-13 14:23:26'),
(48,32,'status','2024-03-13 14:22:06'),
(47,31,'status','2024-03-13 14:20:32'),
(46,32,'status','2024-03-13 11:34:25'),
(45,31,'status','2024-03-13 11:34:05'),
(44,32,'status','2024-03-13 11:18:57'),
(43,31,'status','2024-03-13 11:16:45');

/*Table structure for table `audio` */

DROP TABLE IF EXISTS `audio`;

CREATE TABLE `audio` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `fs_id` int DEFAULT NULL,
  `crime_num` int DEFAULT NULL,
  `audio` varchar(300) DEFAULT NULL,
  `date_time` varchar(300) DEFAULT NULL,
  `a_status_` varchar(300) DEFAULT NULL,
  `private_key` text,
  `en_symmetric_key` blob,
  PRIMARY KEY (`a_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `audio` */

insert  into `audio`(`a_id`,`fs_id`,`crime_num`,`audio`,`date_time`,`a_status_`,`private_key`,`en_symmetric_key`) values 
(1,31,9,'static/f71654c0-7e4d-4190-9480-7896874435b6_finger_encryptedsample-3s.mp3','2024-03-15 11:47:40','status','static/1ee55ad3-51c5-4bfe-a2bb-fc04508224a2_private.pem','static/29ad99e5-5da0-4b72-88a7-b3483f900e32_encrypted_symmetric_key.bin'),
(2,35,12,'static/a4a0abb2-f371-43dd-9c2a-be4208e2894d_finger_encryptedsample-3s.mp3','2024-03-20 14:29:11','status','static/2e9816a5-5394-4b36-9676-d0c19a46c504_private.pem','static/38f80436-374f-4f37-ad01-48d6c4782ea7_encrypted_symmetric_key.bin'),
(3,35,12,'static/4d75b909-bfe4-4300-9e60-ff69b86b46e0_finger_encryptedsample-3s.mp3','2024-03-20 14:29:43','status','static/97bc713d-3460-49a4-bf80-8cbb1d700b7a_private.pem','static/0ef28816-8555-4ef4-a31a-8380bd565d84_encrypted_symmetric_key.bin');

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `court` */

insert  into `court`(`court_id`,`login_id`,`crt_reg_num`,`c_name`,`ty_crt`,`state`,`district`,`address`,`pincode`,`email`,`phone1`,`phone2`,`officer_name`) values 
(16,61,'court123','court2','pppppp','ppppp','pppppp','pppppp','635214','court@gmail.com','3256988965','5632569856','prassy'),
(15,58,'reed111','dfgg','sdfg','sdfg','efwfe','kjdfsk','563214','lkk@gmail.com','3698521470','2147899526','hjkkkkkk'),
(14,57,'reg1','dfgggg','sdfgg','sdfgg','scfvgn','kjdfskfj','563214','lpkk@gmail.com','3698521470','2147899526','hjkkkkkk'),
(13,56,'ssssss','sssssss','sssssss','qqqqqqqqqq','qqqqqqq','qqqqqqqqqq','1111111111','ooo@gmail.com','111111111','333333333','werrrrr');

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
  `private_key` text,
  `en_symmetric_key` blob,
  PRIMARY KEY (`fp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fingerprint` */

insert  into `fingerprint`(`fp_id`,`crime_num`,`fs_id`,`pattern`,`ref_point`,`met_of_coll`,`add_info`,`image`,`date_time`,`f_status`,`private_key`,`en_symmetric_key`) values 
(6,9,31,'qqqqqq','qqqqq','qqqqq','qqqqq','Screenshot (8).png','date','fstatus',NULL,NULL),
(5,7,32,'qqqqqq','qqqqq','qqqqq','qqqqq','Screenshot (9).png','date','fstatus',NULL,NULL),
(7,9,31,'wefwefr','awrsetdryfugi','5sdrtyugi','dryftughbknj','static/cc0a7c27-d295-4ae1-b5bb-f075642da3da_finger_encryptedScreenshot (10).png','2024-03-15 10:46:00','pending','static/55f7b5ac-3c8b-4213-b470-232f6e75e495_private.pem','static/140d8aa3-6bd9-4dc5-b534-ebbfa31ee47a_encrypted_symmetric_key.bin'),
(8,9,31,'wsredtrfyguh','sdtryfgtubhjn','tfcygvjbhknj','dryftughjl','static/32c995ef-b3c4-43e4-8ebb-96923ac3e9df_finger_encryptedhandcuff.jpg','2024-03-15 11:10:05','pending','static/29365a8e-6b29-4f35-a6aa-70026d614a63_private.pem','static/5d0eceb2-3bd6-4e94-a8f7-44879fc03818_encrypted_symmetric_key.bin'),
(9,9,31,'wsredtrfyguh','sdtryfgtubhjn','tfcygvjbhknj','dryftughjl','static/58258c34-47f3-4943-a8bc-33b71c575c9e_finger_encryptedPicture1.jpg','2024-03-15 14:06:28','pending','static/989996ec-a608-42ce-b486-f14547ee29d0_private.pem','static/0d0acc34-3824-48d4-a602-9b0748c024c0_encrypted_symmetric_key.bin'),
(10,12,35,'abcdefg','2','abcd','aaaaaa','static/ea40122b-fe13-4b28-971b-47a1b910a8c5_finger_encryptedScreenshot (11).png','2024-03-20 14:19:49','pending','static/76cd727f-b29f-4c40-867e-afee69e749d1_private.pem','static/6ebed8ac-60c3-4cc4-be8b-58b9c6bbd47c_encrypted_symmetric_key.bin');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `foot_print` */

insert  into `foot_print`(`foot_id`,`crime_num`,`fs_id`,`left_len`,`left_width`,`right_len`,`right_width`,`add_info`,`height`,`gender`,`date_time`,`ft_status`) values 
(4,9,31,'789','dvsvsd','sdvds','sdvsdv','sfsfsfsf','sef','male','date','status'),
(8,12,35,'23','23','52','23','jdhskjfh','23','male','date','status');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hair_test` */

insert  into `hair_test`(`hair_id`,`crime_num`,`fs_id`,`hair_fiber`,`dia_medu`,`dia_hair`,`which_part`,`pre_barr_bodies`,`animal_or_human`,`gender`,`ht_status`) values 
(2,7,31,'hair','hair','hair','head','hhhh','human','female','status'),
(3,9,32,'hair','hair','hair','head','hhhh','human','female','status'),
(11,12,35,'hair','hair','hair','head','hhhh','human','male','status'),
(10,12,35,'hair','hair','hair','head','hhhh','human','male','status'),
(6,12,35,'hair','hair','hair','head','hhhh','human','female','status'),
(7,12,35,'hair','hair','hair','head','hhhh','human','female','status'),
(8,12,35,'hair','hair','hair','head','hhhh','human','male','status'),
(9,12,35,'hair','hair','hair','head','hhhh','human','male','status'),
(12,12,35,'hairttt','hairttt','hair','head','hhhh','human','male','status'),
(13,12,35,'hairttt','hairttt','hair','head','hhhh','human','male','status'),
(14,12,35,'aaaa','aaaa','aaaa','aaaaa','aaaaa','aaaa','male','status');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(300) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `usertype` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(63,'staff2','staff2','staff'),
(62,'policestation','policestation','police'),
(61,'court2','court','court'),
(60,'prassyup','prassyup','staff'),
(59,'rono','rono','staff'),
(58,'3court','3court','court'),
(57,'2court','2court','court'),
(56,'1court','1court','court'),
(55,'1police','1police','police'),
(54,'2staff','2staff','staff'),
(53,'1staff','1staff','staff'),
(43,'admin','admin','admin');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `policestation` */

insert  into `policestation`(`station_id`,`login_id`,`st_reg_num`,`zone`,`district`,`city`,`pincode`,`station_name`,`address`,`email`,`phone`,`alt_phone`) values 
(6,62,'station2','kkkkk','kkkkk','kkkkk','563289','station','kkkkkkk','police@gmail.com','3256987412','2145879632'),
(5,55,'station1','zone','asdadad','sdafaf','365214','ottapalam','adasdahajh','mkil@gamil.com','652398741','22353366');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `post_mortem` */

insert  into `post_mortem`(`pm_id`,`crime_num`,`fs_id`,`body_temp`,`change_in_eye`,`livor_mortis`,`degradation`,`time_snc_death_in_hrs`,`degradation_time`,`date_time`,`pm_status`) values 
(4,9,32,'1111','1111','1111','1111','111111','1111','2024-03-13 14:26:56','status'),
(3,7,31,'1111','1111','1111','1111','111111','1111','2024-03-13 11:18:14','status'),
(5,12,35,'1111','1111','1111','1111','111111','1111','2024-03-20 14:39:30','status'),
(6,12,35,'1111','1111','1111','1111','111111','1111','2024-03-20 14:39:48','status'),
(7,12,35,'1111222','1111','222','222','111111','1111','2024-03-20 14:49:53','status');

/*Table structure for table `request_evidence` */

DROP TABLE IF EXISTS `request_evidence`;

CREATE TABLE `request_evidence` (
  `req_ev_no` int NOT NULL AUTO_INCREMENT,
  `crime_num` int DEFAULT NULL,
  `court_id` int DEFAULT NULL,
  `evidence_status` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`req_ev_no`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `request_evidence` */

insert  into `request_evidence`(`req_ev_no`,`crime_num`,`court_id`,`evidence_status`) values 
(16,12,15,'accepted'),
(15,8,13,'accepted'),
(14,9,13,'accepted');

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
  `teeth_indent` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `temp_typ_teeth` varchar(300) DEFAULT NULL,
  `per_typ_teeth` varchar(300) DEFAULT NULL,
  `date_time` varchar(300) DEFAULT NULL,
  `t_status` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`teeth_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teeth` */

insert  into `teeth`(`teeth_id`,`crime_num`,`fs_id`,`root_diver`,`appear`,`color`,`edge`,`teeth_indent`,`temp_typ_teeth`,`per_typ_teeth`,`date_time`,`t_status`) values 
(2,7,31,'2222','2222','zscasc','scacasc','sdvv','sdgsgw','sdgsgs','2024-03-13 11:18:37','status'),
(3,9,32,'2222','2222','zscasc','scacasc','sdvv','sdgsgw','sdgsgs','2024-03-13 14:27:06','status'),
(4,12,35,'weeerr','jkshdfkdjsfh','jshfkjdh','slfkflkfj','jsdf','222222','klsfj','2024-03-20 14:50:29','status');

/*Table structure for table `video` */

DROP TABLE IF EXISTS `video`;

CREATE TABLE `video` (
  `v_id` int NOT NULL AUTO_INCREMENT,
  `fs_id` int DEFAULT NULL,
  `crime_num` int DEFAULT NULL,
  `video` varchar(300) DEFAULT NULL,
  `date_time` varchar(300) DEFAULT NULL,
  `v_status_` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `private_key` text,
  `en_symmetric_key` blob,
  PRIMARY KEY (`v_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `video` */

insert  into `video`(`v_id`,`fs_id`,`crime_num`,`video`,`date_time`,`v_status_`,`private_key`,`en_symmetric_key`) values 
(1,31,9,'static/7c4db6cf-de30-4c86-9d31-12fb35e6c397_finger_encryptedvideo (240p).mp4','2024-03-15 11:47:30','status','static/127acba7-6fd6-4aef-b9bc-610fa7aa627d_private.pem','static/6d42e4c0-e639-46cc-9bb9-006f38550dce_encrypted_symmetric_key.bin'),
(2,35,12,'static/e1018325-12f9-439d-8996-b028c24b3a47_finger_encryptedvideo (240p).mp4','2024-03-20 14:28:42','status','static/c86cd996-342d-4736-8743-f934713dd7be_private.pem','static/8c1c0b7f-77db-4d1c-919e-df38a64ae539_encrypted_symmetric_key.bin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
