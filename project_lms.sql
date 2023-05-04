-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: project_lms
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absensi`
--

DROP TABLE IF EXISTS `absensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absensi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `status` enum('Hadir','Izin','Sakit','Bolos') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_absensi_user1` (`user_id`),
  KEY `kelas_id` (`kelas_id`),
  CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_absensi_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absensi`
--

LOCK TABLES `absensi` WRITE;
/*!40000 ALTER TABLE `absensi` DISABLE KEYS */;
INSERT INTO `absensi` VALUES (1,1,1,'Bolos','Lagi Males Bu!','2022-07-11 04:54:56','2022-07-11 04:54:56'),(3,4,1,'Hadir',NULL,'2022-07-12 00:02:58','2022-07-12 00:02:58'),(4,4,1,'Izin','Acara Keluarga','2022-07-12 23:51:52','2022-07-12 23:51:52'),(5,4,1,'Hadir',NULL,'2022-07-14 15:48:11','2022-07-14 15:48:11'),(6,4,1,'Hadir',NULL,'2022-07-14 23:39:57','2022-07-14 23:39:57'),(7,2,2,'Bolos','Males','2022-07-15 06:13:45','2022-07-15 06:13:45');
/*!40000 ALTER TABLE `absensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_materi_has_user_materi1` (`materi_id`),
  KEY `fk_materi_has_user_user1` (`user_id`),
  KEY `fk_materi_has_user_tugas1` (`tugas_id`),
  CONSTRAINT `fk_materi_has_user_materi1` FOREIGN KEY (`materi_id`) REFERENCES `materi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materi_has_user_tugas1` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materi_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guru`
--

DROP TABLE IF EXISTS `guru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guru` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telpon` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_guru_user1` (`user_id`),
  CONSTRAINT `fk_guru_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guru`
--

LOCK TABLES `guru` WRITE;
/*!40000 ALTER TABLE `guru` DISABLE KEYS */;
INSERT INTO `guru` VALUES (1,'Laksamana Ktr','laksamana@gmail.com','055779464',3,'2022-07-14 23:03:20','2022-07-14 23:03:20'),(2,'Aisyah binti Abu Bakar','aisyah@gmail.com','081272189029',5,'2022-07-14 23:03:20','2022-07-14 23:03:20'),(5,'Bagas','bagas@gmail.com','045698745',16,'2022-08-12 00:06:05','2022-08-12 00:06:05');
/*!40000 ALTER TABLE `guru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES (1,'10A'),(2,'10B'),(5,'12A');
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materi`
--

DROP TABLE IF EXISTS `materi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi`
--

LOCK TABLES `materi` WRITE;
/*!40000 ALTER TABLE `materi` DISABLE KEYS */;
INSERT INTO `materi` VALUES (1,'Matematika','Haii, perkenalkan nama ibu, Sri Rahayu, kalian boleh panggil bu sri ataupun bu ayu atau bu rahayu juga boleh, kita akan mempelajari mata pelajaran Matematika kelas 10 selama 2 semester atau 1 tahun ini bersama yaaa, semoga kalian semua dapat belajar dengan semangat dan senang, karena belajar itu harus dengan hati yang senang, agar kelak kalian dapat share ilmu yang telah kalian dapatkan menjadi berguna bagi orang banyak.','2022-07-07 12:54:10','2022-07-07 12:54:10'),(2,'IPA','halooo','2022-07-07 12:54:10','2022-07-07 12:54:10'),(4,'G Peminatan','Wajib Dibawa','2022-07-15 02:13:55','2022-07-26 10:23:16'),(10,'Agama Islam','halo guys','2022-07-15 02:36:37','2022-07-15 02:36:37'),(11,'IPS','IPSSSS','2022-07-15 03:14:02','2022-07-15 03:14:02'),(12,'Seni Budaya','Senbud','2022-07-15 06:18:50','2022-07-15 06:18:50'),(15,'IT Terpadu','Teknologi Z','2022-07-26 10:22:58','2022-07-26 10:22:58');
/*!40000 ALTER TABLE `materi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materi_kelas`
--

DROP TABLE IF EXISTS `materi_kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materi_kelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `materi_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `materi_id` (`materi_id`),
  KEY `guru_id` (`guru_id`),
  KEY `kelas_id` (`kelas_id`),
  CONSTRAINT `materi_kelas_ibfk_1` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materi_kelas_ibfk_2` FOREIGN KEY (`materi_id`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materi_kelas_ibfk_3` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi_kelas`
--

LOCK TABLES `materi_kelas` WRITE;
/*!40000 ALTER TABLE `materi_kelas` DISABLE KEYS */;
INSERT INTO `materi_kelas` VALUES (1,1,1,2,'2022-07-01','2022-07-01'),(2,2,1,1,'2022-07-01','2022-07-01'),(4,4,1,1,'2022-07-15','2022-07-15'),(6,10,1,1,'2022-07-15','2022-07-15'),(7,11,2,2,'2022-07-15','2022-07-15'),(8,12,1,2,'2022-07-15','2022-07-15');
/*!40000 ALTER TABLE `materi_kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `murid`
--

DROP TABLE IF EXISTS `murid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `murid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `kelas_id` (`kelas_id`),
  CONSTRAINT `murid_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `murid_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `murid`
--

LOCK TABLES `murid` WRITE;
/*!40000 ALTER TABLE `murid` DISABLE KEYS */;
INSERT INTO `murid` VALUES (1,'Ryan k',1,4,'2022-07-14 23:27:31','2022-07-14 23:27:31'),(3,'Alif',2,2,'2022-07-15 03:31:41','2022-07-15 03:31:41'),(5,'Alex',5,5,'2022-08-12 00:29:36','2022-08-12 00:29:36');
/*!40000 ALTER TABLE `murid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertemuan`
--

DROP TABLE IF EXISTS `pertemuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pertemuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `file` varchar(255) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `materi_id` (`materi_id`),
  CONSTRAINT `pertemuan_ibfk_1` FOREIGN KEY (`materi_id`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertemuan`
--

LOCK TABLES `pertemuan` WRITE;
/*!40000 ALTER TABLE `pertemuan` DISABLE KEYS */;
INSERT INTO `pertemuan` VALUES (1,1,'Pertemuan Pertama','',2,'2022-07-08 11:25:17','2022-07-08 11:25:17'),(2,2,'KERJA!','20220708131622.ppt',2,'2022-07-08 06:16:22','2022-07-08 06:16:22'),(3,3,'Kerja!','20220708145908.docx',2,'2022-07-08 07:59:08','2022-07-08 07:59:08'),(4,4,'Pertemuan Ke-4','20220714224558.xlsx',2,'2022-07-14 15:45:58','2022-07-14 15:45:58'),(5,1,'Su','20220715102208.xlsx',11,'2022-07-15 03:22:08','2022-07-15 03:22:08'),(6,2,'sda','20220715102540.docx',11,'2022-07-15 03:25:40','2022-07-15 03:25:40'),(7,1,'Pertemuan Awal','20220715131930.docx',12,'2022-07-15 06:19:30','2022-07-15 06:19:30'),(9,1,'Wajib Dikumpulkan','Ada di lms',2,'2022-08-25 02:39:55','2022-08-25 02:39:55');
/*!40000 ALTER TABLE `pertemuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tugas`
--

DROP TABLE IF EXISTS `tugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tugas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` enum('Tugas','UAS','UTS','Ulangan Harian') NOT NULL,
  `file` varchar(255) NOT NULL,
  `jam_mulai` date NOT NULL,
  `jam_berakhir` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `materi_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `pertemuan_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `materi_id` (`materi_id`,`guru_id`),
  KEY `guru_id` (`guru_id`),
  KEY `pertemuan_id` (`pertemuan_id`),
  CONSTRAINT `tugas_ibfk_1` FOREIGN KEY (`materi_id`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tugas_ibfk_2` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tugas_ibfk_3` FOREIGN KEY (`pertemuan_id`) REFERENCES `pertemuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tugas`
--

LOCK TABLES `tugas` WRITE;
/*!40000 ALTER TABLE `tugas` DISABLE KEYS */;
INSERT INTO `tugas` VALUES (1,'Tugas','tes.xlsx','2022-07-07','2022-07-07','inin adalah tugas 1',2,1,1,'2022-07-07 11:40:53','2022-07-07 11:40:53'),(2,'Tugas','DOKUMENTASI_SIRA.pdf','2022-07-07','2022-07-08','Kerjain Sendiri!',2,1,2,'2022-07-07 04:41:19','2022-07-07 04:41:19'),(3,'Ulangan Harian','20220708150732.pdf','2022-07-08','2022-07-09','Kerjain Sendiri! Bos',2,1,3,'2022-07-08 08:07:32','2022-07-08 08:07:32'),(4,'Tugas','20220714224637.pptx','2022-07-15','2022-07-16','Kerjain Sendiri!',2,1,4,'2022-07-14 15:46:37','2022-07-14 15:46:37'),(5,'Tugas','20220715102236.pptx','2022-07-15','2022-07-16','Kerjain Sendiri!',11,2,5,'2022-07-15 03:22:36','2022-07-15 03:22:36'),(6,'Tugas','20220715102719.pptx','2022-07-15','2022-07-16','Kerjain Sendiri!',11,2,6,'2022-07-15 03:27:19','2022-07-15 03:27:19'),(7,'Tugas','20220715132000.xlsx','2022-07-15','2022-07-16','Kerjain Sendiri!',12,1,7,'2022-07-15 06:20:00','2022-07-15 06:20:00');
/*!40000 ALTER TABLE `tugas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tugas_upload`
--

DROP TABLE IF EXISTS `tugas_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tugas_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tugas_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tugas_id` (`tugas_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tugas_upload_ibfk_1` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tugas_upload_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tugas_upload`
--

LOCK TABLES `tugas_upload` WRITE;
/*!40000 ALTER TABLE `tugas_upload` DISABLE KEYS */;
INSERT INTO `tugas_upload` VALUES (1,1,4,'20220708101701.pptx','2022-07-08 03:17:01','2022-07-08 03:17:01'),(2,1,4,'20220708101750.pptx','2022-07-08 03:17:50','2022-07-08 03:17:50'),(3,2,4,'20220708101849.pptx','2022-07-08 03:18:49','2022-07-08 03:18:49'),(4,1,4,'20220708141350.pptx','2022-07-08 07:13:50','2022-07-08 07:13:50'),(5,1,4,'20220708141405.ppt','2022-07-08 07:14:05','2022-07-08 07:14:05'),(6,5,2,'20220715113333.docx','2022-07-15 04:33:33','2022-07-15 04:33:33'),(7,6,2,'20220715114116.docx','2022-07-15 04:41:16','2022-07-15 04:41:16');
/*!40000 ALTER TABLE `tugas_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) NOT NULL,
  `role` enum('Admin','Staff','Guru','Murid') NOT NULL,
  `nis` int(6) DEFAULT NULL,
  `nip` int(40) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telpon` varchar(45) NOT NULL,
  `alamat` text DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `updated_at` date NOT NULL DEFAULT current_timestamp(),
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `password_UNIQUE` (`password`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin Utama','Admin',NULL,NULL,'admin','admin@gmail.com','087878290192','Rumah Admin','$2y$10$WmFGAcBl8mmymVJ00YATpe32qJpYN884ozYG9pibKK.zi9k1onFT.','20220623164445.jpeg',NULL,'2022-06-28','2022-06-28'),(2,'Alif','Murid',NULL,NULL,'alif','alif@gmail.com','081291209901','Jl. Jak Persib','$2a$12$S3OaFe/HTgA5twyaObddmu5ghvpGBVPfiWfo54.1Yv8h8Z8k90iaa','20220628074932.jpeg',NULL,'2022-07-01','2022-06-28'),(3,'Sri Rahayu','Guru',NULL,NULL,'srirahayu2','srirahayu@gmail.com','087889109902','Jl. Kedondong dong','$2a$12$2mNUWT16cIPFKTP0rFPIguRAWamwU3pnGv/6gqSSfGZqkCSx1I9jC','20220630140700.jpg',NULL,'2022-07-11','2022-06-30'),(4,'Ryan Kur','Murid',NULL,NULL,'ryankur','ryankur@gmail.com','081299200913','Jl. Bandung Jalan-Jalan','$2y$10$uzSb0AB4kKlpa8L9FSmZNewjW29LJEkw.mTiWgZsjiGDOoWGI5InK','20220704132304.png','fe184eab4c3bb788326f0c32d2227640e1a6d0de8c126874eb54f3fb2342bb41c23ef57676263950','2022-08-11','2022-07-04'),(5,'Aisyah','Guru',NULL,NULL,'aisyah','aisyah@gmail.com','081277190912','Jl. Merdeka Islamiyah','$2y$10$e3I70QtsBN8iOvO8ePN4f.yKTu2FbPApvbpOzL4JP5sHSpvCYkKw6','20220713072924.jpg',NULL,'2022-07-13','2022-07-13'),(13,'Daffa Julistio','Admin',NULL,NULL,'daffa','daffa@gmail.com','0922973811111',NULL,'$2y$10$Kdf/hczQG9CfkPJPwDtpxecfwUxyvkn12KmgPA8paVnPXpzghYjI.',NULL,NULL,'2022-07-27','2022-07-27'),(16,'Torres','Admin',NULL,NULL,'benjamin','torresbs@gmail.com','05448781545',NULL,'$2y$10$YsxrOwZsWumgQdWERjU/.u6hFd9vXASLYydEaJbBhIPh/p29LyYey',NULL,'9936b107fbf9a7268af6da80444a7a4afc279d8969a67238f159f2567553fea45b2b637705639643','2022-08-11','2022-08-11'),(17,'Mendy','Guru',NULL,NULL,'jane','jane@gmail.com','05448799945',NULL,'$2y$10$P6lHdz5vKSmCEICWfb5MJed3szCkEnfpH.ZJvFAQHvGkEGaeBRriO',NULL,'202e6552d6084e234647a9dbe2482161f38dbba02f595d337f3f1502a326326514bee8dd49f283ff','2022-08-17','2022-08-17'),(18,'Jendy','Admin',NULL,NULL,'jane11','jane11@gmail.com','05448799945',NULL,'$2y$10$l5hyhzNuqIK0tclmF.A3O..0Swrq6jns5pO9IRdXFq.ZgXKw.Wod2',NULL,NULL,'2022-08-24','2022-08-24'),(19,'Agung','Admin',NULL,NULL,'agung11','agung11@gmail.com','12659855588',NULL,'$2y$10$Z4LDO5p01BT0/XtrhPpQYOZ6xDIJOX27OIEHDdUeB943bCQarslKi',NULL,'98cdaf0f623997d1d18a5194d6732412107e2ea9eb957ed1c8ea996fd6559362b61297c7d6f9785b','2022-08-25','2022-08-25');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-04 19:42:30
