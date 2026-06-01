-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: fsbm_db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `activites`
--

DROP TABLE IF EXISTS `activites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `bilan` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `club_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activites_club_id_foreign` (`club_id`),
  CONSTRAINT `activites_club_id_foreign` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activites`
--

LOCK TABLES `activites` WRITE;
/*!40000 ALTER TABLE `activites` DISABLE KEYS */;
/*!40000 ALTER TABLE `activites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actualites`
--

DROP TABLE IF EXISTS `actualites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actualites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `contenu` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `categorie` varchar(255) DEFAULT NULL,
  `club_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actualites_club_id_foreign` (`club_id`),
  CONSTRAINT `actualites_club_id_foreign` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actualites`
--

LOCK TABLES `actualites` WRITE;
/*!40000 ALTER TABLE `actualites` DISABLE KEYS */;
INSERT INTO `actualites` VALUES (2,'Practical workshops Stimulation and the first realization','Practical workshops allow students to gain hands-on experience and improve their technical and teamwork skills. They create an interactive environment where learning becomes more engaging and productive.','actualites/XPQhP6KLoLwNkPqWEQmcXk5Fx6SxNj13A44yV9YA.png','Workshops',NULL,'2026-05-24 15:02:43','2026-05-24 15:40:17','2026-05-05',NULL),(3,'Club CIK FSBM – School Caravan','In collaboration with Fondation Al Ayadi Al Bayda pour le Développement, the club organized a medical and awareness caravan for students at École Aéroport Nouaceur. The activity included medical check-ups, educational activities, and entertaining moments that brought joy to the children while promoting health awareness and solidarity.','actualites/b6VG5BEFjGgrwweWY9M42bul7BMnXIK2vP8btOmf.png','Caravane',NULL,'2026-05-24 15:10:19','2026-05-24 15:40:27','2026-04-27',NULL),(4,'Infinity Space – Serious Games Conference','Infinity Space organized an enriching conference led by Mohamed Moussetad about the importance of Serious Games in learning and education. The event highlighted how games can be powerful educational tools that help students understand logic, rules, and problem-solving in an interactive way. Participants greatly appreciated this inspiring and informative experience.','actualites/FkqtCWClkS3eB4HFe0zQVNGIUMmBROiB5hKAMrnw.png','Formation',NULL,'2026-05-24 15:14:21','2026-05-24 15:40:45','2026-05-02',NULL),(5,'ClubHelios – Prophetic Biography Exhibition','Helios contributed to an enriching exhibition focused on the life and teachings of the Prophet ﷺ. The activity combined learning, interaction, and inspiration, creating memorable moments and promoting values of respect, knowledge, and community spirit.','actualites/Idz0UiF02rLl4ZnA3QGWLIBM1javElk3CjlZGzOP.png','Culturel',NULL,'2026-05-24 15:19:42','2026-05-24 15:59:42','2026-05-19',NULL),(6,'CSE – Formation en Secourisme','Retour en images sur la première séance de la formation en secourisme organisée par le CSE, en collaboration avec la Commission Nationale de Secours et de Sauvetage. 🚑\r\nUne séance enrichissante marquée par l’apprentissage, l’échange et la participation active des étudiants. Merci aux formateurs, aux invités et à tous les participants pour leur engagement. D’autres séances arrivent très bientôt !','actualites/JEZDUk5V9NlaCSsJWhKpRIeIf4KWDBkaTOHVGzwj.png','Formation',NULL,'2026-05-24 15:22:13','2026-05-24 15:41:21','2026-03-18',NULL),(7,'Soft Skills Club – Journée Pédagogique « Apprendre à apprendre »','Le Soft Skills Club a co-organisé la Journée pédagogique « Apprendre à apprendre » avec la Faculté des Sciences Ben M’Sick. 📚\r\nÀ travers plusieurs ateliers interactifs autour du leadership, de la mémorisation et du développement personnel, les étudiants ont découvert des méthodes pratiques pour améliorer leur parcours académique et professionnel. Merci à tous les intervenants et participants pour cette journée enrichissante.','actualites/eggDy1KPHlVLp2c8XwRIarjd4JmZQtLUca8OgTYw.png','Workshops',NULL,'2026-05-24 16:04:03','2026-05-24 16:04:03','2026-03-18',NULL),(8,'AIDEV – She Builds AI: From Idea to Real Project','À l’occasion du 8 mars, le club AIDEV a organisé le workshop She Builds AI – From Idea to Real Project, réunissant des jeunes femmes passionnées par l’intelligence artificielle. 💫\r\nÀ travers plusieurs étapes pratiques, les participantes ont collaboré pour transformer leurs idées en projets concrets dans une ambiance inspirante marquée par la créativité, la curiosité et l’apprentissage.','actualites/qN1S0caCFQ8k36i5Hbb1XDgNN6BJIXDJIMdZJI2j.png','Workshops',NULL,'2026-05-24 16:07:32','2026-05-24 16:07:32','2026-04-25',NULL);
/*!40000 ALTER TABLE `actualites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annonces_institutionnelles`
--

DROP TABLE IF EXISTS `annonces_institutionnelles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annonces_institutionnelles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `contenu` text NOT NULL,
  `datePublication` date DEFAULT NULL,
  `utilisateur_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `annonces_institutionnelles_utilisateur_id_foreign` (`utilisateur_id`),
  CONSTRAINT `annonces_institutionnelles_utilisateur_id_foreign` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annonces_institutionnelles`
--

LOCK TABLES `annonces_institutionnelles` WRITE;
/*!40000 ALTER TABLE `annonces_institutionnelles` DISABLE KEYS */;
/*!40000 ALTER TABLE `annonces_institutionnelles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clubs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `domaine` varchar(255) DEFAULT NULL,
  `categorie` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `statut` enum('actif','inactif') NOT NULL DEFAULT 'actif',
  `anneeCreation` int(11) DEFAULT NULL,
  `parrain` varchar(255) DEFAULT NULL,
  `president_nom` varchar(255) DEFAULT NULL,
  `president_email` varchar(255) DEFAULT NULL,
  `mot_president` text DEFAULT NULL,
  `nb_activites` varchar(255) DEFAULT NULL,
  `nb_membres` int(11) DEFAULT NULL,
  `membres_bureau` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`membres_bureau`)),
  `programme_annuel` varchar(255) DEFAULT NULL,
  `programme_fichier` varchar(255) DEFAULT NULL,
  `responsable_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clubs_responsable_id_foreign` (`responsable_id`),
  CONSTRAINT `clubs_responsable_id_foreign` FOREIGN KEY (`responsable_id`) REFERENCES `utilisateurs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'CtrlArt-FSBM',NULL,NULL,NULL,'Culturel',NULL,'logos/UU0dBxpTlOFTHaBFmhrvlADq7tHUo32kGs1fa3AL.jpg','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-29 10:00:28'),(2,'Club Sciences et Technologies FSBM',NULL,NULL,NULL,'Scientifique',NULL,'logos/sciences-tech.png','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(3,'Club Infinity Space FSBM','infinity.space.fsbm@gmail.com','@infinity_space_fsbm','Ce club propose diverses formations, organise des jeux et des activités ludiques, et encourage également le volontariat. Il vise à développer les compétences des jeunes, renforcer l’esprit d’équipe et créer un espace qui allie apprentissage, divertissement et engagement communautaire.','Scientifique','développement personnel','logos/0DER0u7U26IoEjzQQDORQ2w934yKicuL92o3gjzW.jpg','actif',2025,'mohammed aitdaoud','Rawi Anas','arawi293@gmail.com','C’est avec un immense plaisir que je m’adresse à vous aujourd’hui. Notre club s’engage à offrir un espace d’apprentissage, de créativité et de collaboration où chaque membre peut développer ses compétences et contribuer positivement à la communauté. Nous croyons en la force du travail d’équipe, de l’innovation et du volontariat, et nous continuerons à œuvrer pour offrir des opportunités enrichissantes à tous',NULL,100,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-27 18:01:28'),(4,'Club ABC Junior FSBM',NULL,NULL,NULL,'Entrepreneuriat',NULL,'logos/jVdbSaZJLEAcxyciex2iQzwQr25FmN6uaFWv1UrO.jpg','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-31 19:20:01'),(5,'Club Soft Skills FSBM',NULL,NULL,NULL,'Entrepreneuriat',NULL,'logos/soft-skills.png','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(6,'Club Cinéma FSBM',NULL,NULL,NULL,'Culturel',NULL,NULL,'actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(7,'Club Ibn Khaldoun FSBM',NULL,NULL,NULL,'Culturel',NULL,'logos/eAbV09o2auGtkmk17hug6HtpJ0Fc1F2oCY63Jami.jpg','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-31 19:19:34'),(8,'Club Digital and Cybersecurity FSBM',NULL,NULL,NULL,'Scientifique',NULL,NULL,'actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(9,'Club Innovation, Création et Entrepreneuriat FSBM',NULL,NULL,NULL,'Entrepreneuriat',NULL,NULL,'actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(10,'AI & DEV Community FSBM',NULL,NULL,NULL,'Scientifique',NULL,'logos/aidev.png','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(11,'Club Robotique & IoT FSBM',NULL,NULL,NULL,'Scientifique',NULL,'logos/robotique.png','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(12,'Club Santé et Sport FSBM',NULL,NULL,NULL,'Sport',NULL,'logos/sante-sport.png','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(13,'Club Art Identité Digital FSBM',NULL,NULL,NULL,'Culturel',NULL,'logos/art-identite.png','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(14,'Club Education Sportive FSBM',NULL,NULL,NULL,'Sport',NULL,NULL,'actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(15,'Club Santé et Environnement FSBM',NULL,NULL,NULL,'Humanitaire',NULL,'logos/sante-env.png','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(16,'Club Des Étudiants Internationaux FSBM',NULL,NULL,NULL,'Culturel',NULL,NULL,'actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(17,'Club Lions FSBM',NULL,NULL,NULL,'Humanitaire',NULL,'logos/lions.png','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(18,'Epik Leaders FSBM',NULL,NULL,NULL,'Entrepreneuriat',NULL,NULL,'actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(19,'HELIOS FSBM',NULL,NULL,NULL,'Scientifique',NULL,'logos/2eb1Q77d7GDvIdZ2SvovhPvuvtf6tiYq2thXoiof.jpg','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-26 20:25:58'),(20,'Enactus FSBM',NULL,NULL,NULL,'Entrepreneuriat',NULL,'logos/enactus.png','actif',2020,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-19 16:41:28'),(21,'Club Qoran FSBM','clubcoranfsbm@gmail.com','@club_coran_fsbm','Le Club Qoran FSBM est un espace estudiantin dédié à la récitation, la mémorisation et la compréhension du Saint Coran. Nous réunissons des étudiants passionnés qui souhaitent approfondir leur relation avec le Livre d Allah, dans une atmosphère de fraternité, de sérieux et de bienveillance au sein de la Faculté des Sciences Ben M Sik.','Culturel','Culturel','logos/uN3CJ63qkeF2xmJkGJu5LKpwUsDHjrPQTeHdtNsV.jpg','actif',2026,'Soumia MORDANE','EL MANSSOURI Hanae','ELMANSSOURIHANAE@GMAIL.COM','Je tiens à remercier chaleureusement la direction de notre faculté pour son soutien continu, les membres du bureau pour leur dévouement infatigable, ainsi que vous tous, qui faites vivre ce club par votre présence et votre enthousiasme.',NULL,322,'\"[{\\\"nom\\\":\\\"AIT ELMAKKI\\\",\\\"prenom\\\":\\\"Soukaina \\\",\\\"email\\\":\\\"\\\",\\\"role\\\":\\\"Vice-pr\\u00e9sident\\\",\\\"est_bureau\\\":true,\\\"id\\\":1779573973677},{\\\"nom\\\":\\\"naji\\\",\\\"prenom\\\":\\\"wiam\\\",\\\"email\\\":\\\"\\\",\\\"role\\\":\\\"Tr\\u00e9sorier\\\",\\\"est_bureau\\\":true,\\\"id\\\":1779574061731},{\\\"nom\\\":\\\"ACHIK\\\",\\\"prenom\\\":\\\"Meryem \\\",\\\"email\\\":\\\"\\\",\\\"role\\\":\\\"Secr\\u00e9taire\\\",\\\"est_bureau\\\":true,\\\"id\\\":1779574107832},{\\\"nom\\\":\\\"HANBAL\\\",\\\"prenom\\\":\\\"Assia\\\",\\\"email\\\":\\\"\\\",\\\"role\\\":\\\"Responsable \\u00c9v\\u00e9nements\\\",\\\"est_bureau\\\":true,\\\"id\\\":1779574221640},{\\\"nom\\\":\\\"Benali\\\",\\\"prenom\\\":\\\"Douae\\\",\\\"email\\\":\\\"\\\",\\\"role\\\":\\\"Membre\\\",\\\"est_bureau\\\":false,\\\"id\\\":1779574277520},{\\\"nom\\\":\\\"hafid\\\",\\\"prenom\\\":\\\"sara\\\",\\\"email\\\":\\\"\\\",\\\"role\\\":\\\"Membre\\\",\\\"est_bureau\\\":false,\\\"id\\\":1779574322477}]\"',NULL,NULL,NULL,'2026-05-19 16:41:28','2026-05-24 16:09:52');
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comptes`
--

DROP TABLE IF EXISTS `comptes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comptes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  `dateCreation` date DEFAULT NULL,
  `dateSuppression` date DEFAULT NULL,
  `utilisateur_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comptes_utilisateur_id_foreign` (`utilisateur_id`),
  CONSTRAINT `comptes_utilisateur_id_foreign` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comptes`
--

LOCK TABLES `comptes` WRITE;
/*!40000 ALTER TABLE `comptes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comptes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_adhesion`
--

DROP TABLE IF EXISTS `demandes_adhesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_adhesion` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `club_id` bigint(20) unsigned NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `filiere` varchar(255) DEFAULT NULL,
  `code_apogee` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `carte_etudiant` varchar(255) DEFAULT NULL,
  `statut` enum('en_attente','accepte','rejete') DEFAULT 'en_attente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `demandes_adhesion_club_id_foreign` (`club_id`),
  CONSTRAINT `demandes_adhesion_club_id_foreign` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_adhesion`
--

LOCK TABLES `demandes_adhesion` WRITE;
/*!40000 ALTER TABLE `demandes_adhesion` DISABLE KEYS */;
INSERT INTO `demandes_adhesion` VALUES (1,21,'nago','douaa','nagodouaa@gmail.com','0663624831','MI',NULL,'HHHH',NULL,'rejete','2026-05-20 18:42:26','2026-05-23 11:50:30'),(2,21,'NAGO','DOUAA','nagodouaa@gmail.com','0663624831','MI',NULL,'hhhh',NULL,'rejete','2026-05-22 20:06:18','2026-05-23 21:20:44'),(3,21,'naggour','douaa','naggourdouaa@gmail.com','0663624831','MI',NULL,'CLUB',NULL,'accepte','2026-05-22 21:07:37','2026-05-22 21:08:17'),(4,21,'naggour','douaa','naggourdouaa@gmail.com','0663624831','MI',NULL,'parce......',NULL,'accepte','2026-05-22 21:22:47','2026-05-22 21:23:08'),(5,21,'nago','douaa','naggourdouaa@gmail.com','0663624831','MI',NULL,'parce///',NULL,'rejete','2026-05-22 21:27:43','2026-05-23 11:51:13'),(6,21,'nag','doua','naggourdouaa@gmail.com','066364534','PC',NULL,'PARC',NULL,'rejete','2026-05-23 21:30:28','2026-05-23 21:30:51'),(7,21,'naggour','douaa','naggourdouaa@gmail','0663624831','MI',NULL,'parc......',NULL,'en_attente','2026-05-23 21:32:07','2026-05-23 21:32:07'),(8,21,'naggour','douaa','naggourdouaa@gmail.com','0663624831','MI','2356965','......',NULL,'accepte','2026-05-31 18:11:26','2026-05-31 18:13:54'),(9,21,'naggour','douaa','naggourdouaa@gmail.com','0663624831','MI','2356876','......',NULL,'en_attente','2026-05-31 18:23:22','2026-05-31 18:23:22'),(10,21,'naggour','douaa','naggourdouaa@gmail.com','0663624831','MI','2379087',';;;;;','cartes_etudiants/1eS8Ku0laaCZdbkyAdkNj2EiGMpUGrvq6tN8yRue.png','en_attente','2026-05-31 18:55:10','2026-05-31 18:55:10'),(11,21,'naggour','douaa','naggourdouaa@gmail.com','0663624831','MI','2344789',';;;;;','cartes_etudiants/pHN4YYq4MKktCwUouJCCemWUiMkJJBYJkFyCSd2L.png','en_attente','2026-05-31 19:03:54','2026-05-31 19:03:54');
/*!40000 ALTER TABLE `demandes_adhesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_evenement`
--

DROP TABLE IF EXISTS `demandes_evenement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_evenement` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `club` varchar(255) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `type_evenement` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `heure` varchar(20) DEFAULT NULL,
  `lieu` varchar(255) DEFAULT NULL,
  `participants` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `affiche` varchar(255) DEFAULT NULL,
  `programme` varchar(255) DEFAULT NULL,
  `besoins_logistiques` text DEFAULT NULL,
  `statut` enum('en_attente','accepte','refuse') DEFAULT 'en_attente',
  `club_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_evenement`
--

LOCK TABLES `demandes_evenement` WRITE;
/*!40000 ALTER TABLE `demandes_evenement` DISABLE KEYS */;
INSERT INTO `demandes_evenement` VALUES (2,'Qoran Responsable','naggourdouaa@gmail.com',NULL,NULL,'formation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Captation Vidéo','accepte',21,'2026-05-24 19:35:32','2026-05-24 19:35:55'),(3,'Douaa Naggour','naggourdouaa@gmail.com','0612345678','AIDEV Club','Introduction à l’Intelligence Artificielle','Conférence','2026-06-01','04:04','Amphithéâtre 8',50,'Conférence destinée aux étudiants pour découvrir les bases de l’intelligence artificielle et ses applications dans différents domaines.',NULL,NULL,'Internet, Vidéoprojecteur','en_attente',21,'2026-05-24 20:05:53','2026-05-24 20:05:53');
/*!40000 ALTER TABLE `demandes_evenement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evenements`
--

DROP TABLE IF EXISTS `evenements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evenements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `contenu` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `lieu` varchar(255) DEFAULT NULL,
  `heure` varchar(255) DEFAULT NULL,
  `affiche` varchar(255) DEFAULT NULL,
  `club_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `statut` enum('en_attente','valide','refuse') DEFAULT 'en_attente',
  PRIMARY KEY (`id`),
  KEY `evenements_club_id_foreign` (`club_id`),
  CONSTRAINT `evenements_club_id_foreign` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evenements`
--

LOCK TABLES `evenements` WRITE;
/*!40000 ALTER TABLE `evenements` DISABLE KEYS */;
INSERT INTO `evenements` VALUES (7,'“معرض السيرة النبوية”','حظات جميلة عشناها في “معرض السيرة النبوية”، بين العلم، المحبة وروح التعاون','evenements/IZuk04LNX61jzlKdWdFoLqLXpBTKmtne6kbbxlgK.png','2026-05-15','théatre faculté des sciences ben m\'sik','00:00',NULL,21,'2026-05-23 19:27:22','2026-05-24 14:12:00','valide'),(8,'Quelques moments forts de DigInnov 2026','Une journée riche en échanges, en culture et en innovation','evenements/wfImLDkmhSVP1FbtqVnan9plbjhs0btawbNNx4Nv.png','2026-04-30','faculté des sciences ben m\'sik','09:30',NULL,21,'2026-05-23 19:31:37','2026-05-24 14:12:06','valide'),(9,'ختتام مسابقة حفظ وتجويد القرآن الكريم في دورتها الأولى 1447ه',NULL,'evenements/hrmEBMZ42oG7BYEVQgpxDt7SQvcUrHLo4Sc4Wiy4.png','2026-04-06',NULL,'11:11',NULL,21,'2026-05-24 14:11:37','2026-05-24 14:12:14','refuse'),(10,'Action Solidaire – Maison des Orphelins','Une journée remplie de partage, de solidarité et de belles émotions ✨\r\nLe club a eu le plaisir d’organiser une action solidaire à la maison des orphelins, marquée par des activités, des moments de joie et de complicité avec les enfants. Cette initiative reflète l’importance de la bienveillance et de l’engagement solidaire au sein de la communauté.','evenements/LBHkxxMOoAqg8noSNdCj1iyNAIPmGW5BkjcED8Ul.png','2026-05-23','maison des orphelins','10:52',NULL,3,'2026-05-24 17:53:43','2026-05-24 17:53:43','en_attente'),(11,'Conférence Serious Games','Infinity Space a organisé une conférence enrichissante animée par Mohamed Moussetad autour des Serious Games 🎮📚\r\nCet événement a permis aux participants de découvrir comment le jeu peut devenir un véritable outil d’apprentissage et de développement des compétences, dans une ambiance interactive et inspirante.','evenements/dOE3NdVyySuGDiSaEcN74iE34yIrkaePN0gTAcHb.png','2026-05-02','TD 16','14:56',NULL,3,'2026-05-24 17:58:05','2026-05-24 17:58:05','en_attente'),(12,'Tournoi Gaming','Des moments forts, du suspense et une ambiance exceptionnelle ont marqué ce tournoi gaming 🎮⚽\r\nMerci à tous les participants pour leur énergie et leur fair-play, et félicitations aux gagnants pour leurs performances remarquables et leurs médailles bien méritées 🏅🚀','evenements/vNd2XFTL8X2vqJ8Yr81NpZskQ1TOUm90cqG8E4xX.png','2026-04-20','Amphi 7',NULL,NULL,3,'2026-05-24 18:01:00','2026-05-24 18:01:00','en_attente'),(13,'ختتام مسابقة حفظ وتجويد القرآن الكريم في دورتها الأولى 1447ه',NULL,'evenements/TOMkGYWKdgoe3368TuMfcz4yRdJWknN9dLID0vYa.png','2026-04-15','AMPHI 8',NULL,NULL,21,'2026-05-24 20:12:00','2026-05-24 20:12:24','valide');
/*!40000 ALTER TABLE `evenements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscriptions`
--

DROP TABLE IF EXISTS `inscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filiere` varchar(255) NOT NULL,
  `statut` enum('confirmee','annulee','en_attente') NOT NULL DEFAULT 'en_attente',
  `dateInscription` date DEFAULT NULL,
  `utilisateur_id` bigint(20) unsigned NOT NULL,
  `evenement_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inscriptions_utilisateur_id_foreign` (`utilisateur_id`),
  KEY `inscriptions_evenement_id_foreign` (`evenement_id`),
  CONSTRAINT `inscriptions_evenement_id_foreign` FOREIGN KEY (`evenement_id`) REFERENCES `evenements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `inscriptions_utilisateur_id_foreign` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscriptions`
--

LOCK TABLES `inscriptions` WRITE;
/*!40000 ALTER TABLE `inscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias`
--

DROP TABLE IF EXISTS `medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nomFichier` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `dateAjout` date DEFAULT NULL,
  `activite_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medias_activite_id_foreign` (`activite_id`),
  CONSTRAINT `medias_activite_id_foreign` FOREIGN KEY (`activite_id`) REFERENCES `activites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias`
--

LOCK TABLES `medias` WRITE;
/*!40000 ALTER TABLE `medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (12,'0001_01_01_000001_create_cache_table',1),(13,'0001_01_01_000002_create_jobs_table',1),(14,'2026_05_06_203457_create_utilisateurs_table',1),(15,'2026_05_06_203521_create_comptes_table',1),(16,'2026_05_06_203536_create_clubs_table',1),(17,'2026_05_06_203547_create_annonces_institutionnelles_table',1),(18,'2026_05_06_203604_create_actualites_table',1),(19,'2026_05_06_203617_create_evenements_table',1),(20,'2026_05_06_203630_create_activites_table',1),(21,'2026_05_06_203655_create_programmes_annuels_table',1),(22,'2026_05_06_203712_create_inscriptions_table',1),(23,'2026_05_06_203723_create_medias_table',1),(24,'2026_05_06_215805_create_personal_access_tokens_table',2),(25,'2026_05_09_144030_create_sessions_table',3),(26,'2026_05_19_210544_add_details_to_clubs_table',4),(27,'2026_05_20_120949_create_demandes_adhesion_table',5),(28,'2026_05_20_121058_create_demandes_adhesion_table',6),(29,'2026_05_20_203901_add_columns_to_demandes_adhesion_table',6),(30,'2026_05_21_201101_add_club_id_to_utilisateurs_table',7),(31,'2026_05_22_203042_add_club_id_to_utilisateurs_table',7),(32,'2026_05_22_214527_add_statut_to_evenements_table',8),(33,'2026_05_23_195934_add_programme_fichier_to_clubs_table',9),(34,'2026_05_26_210409_add_club_instagram_to_actualites_table',10),(35,'2026_05_26_222938_add_instagram_to_clubs_table',11),(36,'2026_05_26_223344_add_code_apogee_to_demandes_adhesion_table',12),(37,'2026_05_31_204748_add_carte_etudiant_to_demandes_adhesion_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\Utilisateur',3,'auth_token','9c519a2d8f1dc8abed56874fd7e22362ade22c4d1a905f5dc6f3f9b0de145f4b','[\"*\"]',NULL,NULL,'2026-05-06 20:33:48','2026-05-06 20:33:48'),(2,'App\\Models\\Utilisateur',4,'auth_token','1f4ab0e13c6c9ace1efa167b499cdb016a607c480d257eb051b29daa694414e9','[\"*\"]',NULL,NULL,'2026-05-06 20:34:46','2026-05-06 20:34:46'),(3,'App\\Models\\Utilisateur',4,'auth_token','8cf5233e11c4774ee33b7a6b9cdd4198417612e1dd3a5c49799f6b334d6aeb63','[\"*\"]',NULL,NULL,'2026-05-06 20:36:32','2026-05-06 20:36:32'),(4,'App\\Models\\Utilisateur',5,'auth_token','84601dcbfb7135286379eb0cd3d3e97ef81e8e0df33a51d2f582e5d0f0bb57dd','[\"*\"]',NULL,NULL,'2026-05-08 09:04:48','2026-05-08 09:04:48'),(5,'App\\Models\\Utilisateur',5,'auth_token','f7759864f4c75ef1aa6b664a7bffd99072b121f559b75c49cc93cea4d5d55fd9','[\"*\"]',NULL,NULL,'2026-05-08 09:05:39','2026-05-08 09:05:39'),(6,'App\\Models\\Utilisateur',5,'auth_token','c2cae217e30eabd537adf6e9c95d169326e0fd6ae323a4345d4a869c43adbe8f','[\"*\"]',NULL,NULL,'2026-05-08 15:14:50','2026-05-08 15:14:50'),(7,'App\\Models\\Utilisateur',7,'auth_token','6888b0f0307af9f2f091e89b3908e4186c9e4303d24cc71003dbad33b891bebf','[\"*\"]',NULL,NULL,'2026-05-08 15:31:35','2026-05-08 15:31:35'),(8,'App\\Models\\Utilisateur',7,'auth_token','a9c944d8377934f2d8a742338888e0a0277629e25af9deba73189a80311c2142','[\"*\"]',NULL,NULL,'2026-05-08 15:33:03','2026-05-08 15:33:03'),(9,'App\\Models\\Utilisateur',8,'auth_token','18bab06e16b8626c56f24eb8b801b4372aa239d4b7792e136f20c4952e7301d2','[\"*\"]',NULL,NULL,'2026-05-11 17:47:06','2026-05-11 17:47:06'),(10,'App\\Models\\Utilisateur',8,'auth_token','dde2f5532514891c05b6d066ec90c641c60ddc45e44643ac05d2aaa4982fea9b','[\"*\"]',NULL,NULL,'2026-05-11 17:48:16','2026-05-11 17:48:16'),(11,'App\\Models\\Utilisateur',8,'auth_token','19a7c1d3d8e6ee89bf19888bbd64817618a746b74c756160dcf8599ba141ebe9','[\"*\"]',NULL,NULL,'2026-05-11 18:02:19','2026-05-11 18:02:19'),(12,'App\\Models\\Utilisateur',8,'auth_token','e1c61afb4424a7e88a0778e33a38d983a0035cdce8c39eb88f9e910d8440d7db','[\"*\"]',NULL,NULL,'2026-05-11 18:05:59','2026-05-11 18:05:59'),(13,'App\\Models\\Utilisateur',8,'auth_token','4b6f0c7d4db1b9837f0ecaa3c8062ffe21db2f2f6290c3807e357c1aaf9adc91','[\"*\"]',NULL,NULL,'2026-05-11 18:07:38','2026-05-11 18:07:38'),(14,'App\\Models\\Utilisateur',8,'auth_token','f19587c05028496f5e3b5f826600075d39834e8334ccbb37c9b0e665472e78cb','[\"*\"]',NULL,NULL,'2026-05-11 18:09:23','2026-05-11 18:09:23'),(15,'App\\Models\\Utilisateur',8,'auth_token','760612fa56454347d72580e1548c4127e86fc4954ef36516c29ef2c4f9b963b6','[\"*\"]',NULL,NULL,'2026-05-11 18:11:06','2026-05-11 18:11:06'),(16,'App\\Models\\Utilisateur',8,'auth_token','2f1861074c3eb9aba194f2bd2474f22703122759ec40ea0b42291a335d591950','[\"*\"]',NULL,NULL,'2026-05-11 18:15:46','2026-05-11 18:15:46'),(17,'App\\Models\\Utilisateur',8,'auth_token','9e55277ebb13f11481064edccb77da5c79cfc2daac77ded39371a63bcdb0564c','[\"*\"]',NULL,NULL,'2026-05-11 18:18:16','2026-05-11 18:18:16'),(18,'App\\Models\\Utilisateur',8,'auth_token','2198fe12f2eb07f0d47883db1bfcff5d59aa71b5271ff0e0b97234eff36ee50b','[\"*\"]',NULL,NULL,'2026-05-11 18:20:36','2026-05-11 18:20:36'),(19,'App\\Models\\Utilisateur',8,'auth_token','05ab8e07ae388f901041853fd2bdb175ac2bb11e007971c25e261a60e29b3d0d','[\"*\"]',NULL,NULL,'2026-05-11 18:21:36','2026-05-11 18:21:36'),(20,'App\\Models\\Utilisateur',8,'auth_token','407f907de43038b6757a18154dab3ebabfbb4572d9d6d4e84c099217299a7508','[\"*\"]',NULL,NULL,'2026-05-11 18:26:42','2026-05-11 18:26:42'),(21,'App\\Models\\Utilisateur',8,'auth_token','50869ae9fdc6e8e83e8a6df4024c7a16e1de8952491e5daac9595c428d3f3431','[\"*\"]',NULL,NULL,'2026-05-11 18:40:03','2026-05-11 18:40:03'),(22,'App\\Models\\Utilisateur',8,'auth_token','b641d3eb6bdfa171e8875a5ea206544363a5f79777396737e9fc0d434936a08f','[\"*\"]',NULL,NULL,'2026-05-11 18:44:55','2026-05-11 18:44:55'),(23,'App\\Models\\Utilisateur',8,'auth_token','3b9587cc2627507f81f51b23b70b76ed45d0c5a77515a14da600b2872c361a5a','[\"*\"]',NULL,NULL,'2026-05-11 19:40:10','2026-05-11 19:40:10'),(24,'App\\Models\\Utilisateur',8,'auth_token','a605b2ce6e438eba9b25b7aef56bff3d0b3c974b43b07eb86ab3051e42333f53','[\"*\"]',NULL,NULL,'2026-05-11 19:49:57','2026-05-11 19:49:57'),(25,'App\\Models\\Utilisateur',8,'auth_token','c630c63e5119f8c715c5f6d2a601583f8b1b95af804e420033d2a365482b78f1','[\"*\"]',NULL,NULL,'2026-05-11 19:59:05','2026-05-11 19:59:05'),(26,'App\\Models\\Utilisateur',8,'auth_token','6b87fd4a2b9b7903a9a9c25ab0a3a8b854d01885bae5d2d57c0c88c10830b162','[\"*\"]',NULL,NULL,'2026-05-11 20:11:46','2026-05-11 20:11:46'),(27,'App\\Models\\Utilisateur',8,'auth_token','46e98bc448ac259313a86eb8d224438c405d0ac2ab5c50a3460b9197aa0ed0c2','[\"*\"]',NULL,NULL,'2026-05-11 20:19:43','2026-05-11 20:19:43'),(28,'App\\Models\\Utilisateur',8,'auth_token','09e36671e82215bc2742fd86ce95921dbf687595b2aa02ba8f56c88e488b4366','[\"*\"]',NULL,NULL,'2026-05-11 20:35:08','2026-05-11 20:35:08'),(29,'App\\Models\\Utilisateur',8,'auth_token','8f192a33e56e04dcc3362d5894d45090ca568467d540bd67f0b077fb72ba6f31','[\"*\"]',NULL,NULL,'2026-05-12 07:42:22','2026-05-12 07:42:22'),(30,'App\\Models\\Utilisateur',8,'auth_token','31dfb8c921454c61df160148716f54110fb44cf9a76ef0feb2c2dcf471cf2df1','[\"*\"]',NULL,NULL,'2026-05-12 07:45:23','2026-05-12 07:45:23'),(31,'App\\Models\\Utilisateur',8,'auth_token','829012557bae97ae10160a8bbbc8f04e5a8a36d13e5e4c15651ecb4d9005ce58','[\"*\"]',NULL,NULL,'2026-05-12 07:56:01','2026-05-12 07:56:01'),(32,'App\\Models\\Utilisateur',8,'auth_token','b1d3a8d5d9a97cf4dd9ab1693823a581752266ed97ca32a2d5d88bf5f1a2627b','[\"*\"]',NULL,NULL,'2026-05-12 08:01:03','2026-05-12 08:01:03'),(33,'App\\Models\\Utilisateur',8,'auth_token','cf1f29fdfd68bc7a1da3958069136bc446f1eeb551666d01a95655e7ff35578a','[\"*\"]',NULL,NULL,'2026-05-12 08:02:42','2026-05-12 08:02:42'),(34,'App\\Models\\Utilisateur',8,'auth_token','2dd52ad8220aaa3ece0f5fbd76d4a635e660e60956f01dda409bdf9e504787b1','[\"*\"]',NULL,NULL,'2026-05-12 08:03:26','2026-05-12 08:03:26'),(35,'App\\Models\\Utilisateur',8,'auth_token','58c5b20f3777a71f15f9cd763c88d9b4ede1404bd60025cd1b9c8d67286e33d5','[\"*\"]',NULL,NULL,'2026-05-12 08:07:04','2026-05-12 08:07:04'),(36,'App\\Models\\Utilisateur',8,'auth_token','512a105560efb06917ce5bdfb78ee8c29e5cc29cd48b458b0ead188edcf7efde','[\"*\"]',NULL,NULL,'2026-05-12 08:08:23','2026-05-12 08:08:23'),(37,'App\\Models\\Utilisateur',8,'auth_token','21d6684e822effc0a70f78e1cfd8bcb5b90858df6aaa7e71a89e5977fd6ab164','[\"*\"]',NULL,NULL,'2026-05-12 08:13:50','2026-05-12 08:13:50'),(38,'App\\Models\\Utilisateur',8,'auth_token','262c5bffd3af38c0af35dea2c09dd392910138bb40c3369eb1fc24eaeb0a7632','[\"*\"]',NULL,NULL,'2026-05-12 08:16:33','2026-05-12 08:16:33'),(39,'App\\Models\\Utilisateur',8,'auth_token','c1d1949b654eef7b61a49df463a4f1be8daca6e6b2e392a9811db0dc377c5bc4','[\"*\"]',NULL,NULL,'2026-05-12 08:32:43','2026-05-12 08:32:43'),(40,'App\\Models\\Utilisateur',8,'auth_token','4287df72fe8595921a961375d72857256edd5d5be7094ab459aab09b584d90c7','[\"*\"]',NULL,NULL,'2026-05-12 09:06:19','2026-05-12 09:06:19'),(41,'App\\Models\\Utilisateur',8,'auth_token','c37c340ea107661eb17203aa7de41dd7cecfeb998d8c4444a163492abaf64c06','[\"*\"]',NULL,NULL,'2026-05-12 09:10:43','2026-05-12 09:10:43'),(42,'App\\Models\\Utilisateur',8,'auth_token','dc08d463e83cf08bb64d98356dc389ca4e7c80884afd74fb4dac6bbb0fc40e3d','[\"*\"]',NULL,NULL,'2026-05-12 09:26:09','2026-05-12 09:26:09'),(43,'App\\Models\\Utilisateur',8,'auth_token','a67df86632722a339f274d382e302f9a3d923124797d815e7ecaefd9179c76da','[\"*\"]',NULL,NULL,'2026-05-12 09:36:03','2026-05-12 09:36:03'),(44,'App\\Models\\Utilisateur',8,'auth_token','d58bcde9e9f122f7152ae8d44237c780c28505eb9e5d8916d06c9aa723843e64','[\"*\"]',NULL,NULL,'2026-05-12 18:52:15','2026-05-12 18:52:15'),(45,'App\\Models\\Utilisateur',8,'auth_token','9a722ea958bb8b106868b3273fc87f2a3e7faf4ea96c4c1f406dcb9109a0482f','[\"*\"]',NULL,NULL,'2026-05-12 18:54:41','2026-05-12 18:54:41'),(46,'App\\Models\\Utilisateur',8,'auth_token','310441624cbb6f0bfe52f03446a7ec513b578525f49bde7e1417691fcfd5340e','[\"*\"]',NULL,NULL,'2026-05-12 18:57:41','2026-05-12 18:57:41'),(47,'App\\Models\\Utilisateur',8,'auth_token','1f1965667f0c46013808e234f63737a69fe3516687b2d67f27f4ce1212e20f4f','[\"*\"]',NULL,NULL,'2026-05-12 19:05:22','2026-05-12 19:05:22'),(48,'App\\Models\\Utilisateur',8,'auth_token','2abc908606b74c5bc757314fd84eecfee533310314660ff6feb79a0738595947','[\"*\"]',NULL,NULL,'2026-05-12 19:10:41','2026-05-12 19:10:41'),(49,'App\\Models\\Utilisateur',8,'auth_token','e9bd80cd9223ceac00e6c334494135a2f727dead138819b5ac8e15ec711f6241','[\"*\"]',NULL,NULL,'2026-05-12 19:16:14','2026-05-12 19:16:14'),(50,'App\\Models\\Utilisateur',8,'auth_token','5438ca24fcf399e72e6aff5ce7a1671c81937fe6bc7f756a608b218b2ed46366','[\"*\"]',NULL,NULL,'2026-05-12 19:22:28','2026-05-12 19:22:28'),(51,'App\\Models\\Utilisateur',8,'auth_token','808c986be03eccbdda568a75ab320833fffb46ed9963daeb305f1d0bf1ac1e74','[\"*\"]',NULL,NULL,'2026-05-12 19:46:32','2026-05-12 19:46:32'),(52,'App\\Models\\Utilisateur',8,'auth_token','86a07a486f2e53be543190474533ec79a5c685641515b615aa0a2f8d3591ebd1','[\"*\"]',NULL,NULL,'2026-05-13 09:18:21','2026-05-13 09:18:21'),(53,'App\\Models\\Utilisateur',8,'auth_token','aef4022a436548e352efa10919a88d67fee0652436a11eeca81b01932590085d','[\"*\"]',NULL,NULL,'2026-05-13 09:23:23','2026-05-13 09:23:23'),(54,'App\\Models\\Utilisateur',8,'auth_token','d43bd3422829acd62612b985447f07d67cbfda095a79a9f42339d06e2995ff5e','[\"*\"]',NULL,NULL,'2026-05-13 09:27:11','2026-05-13 09:27:11'),(55,'App\\Models\\Utilisateur',8,'auth_token','3d6fe7d0a2032d8b7dd8fbcf1c6437a2b5447368e5294d65ac31153d2a58cbdc','[\"*\"]',NULL,NULL,'2026-05-13 09:31:36','2026-05-13 09:31:36'),(56,'App\\Models\\Utilisateur',8,'auth_token','4734d6c3bb20da3ed8b770770d465f6bbb2c8b27c4f9eac4af96e7766357237e','[\"*\"]',NULL,NULL,'2026-05-13 09:44:44','2026-05-13 09:44:44'),(57,'App\\Models\\Utilisateur',8,'auth_token','5f7ca2f06625813c81381abfa3470d9c5448209854ded072aefd488aee0b9144','[\"*\"]',NULL,NULL,'2026-05-13 09:46:12','2026-05-13 09:46:12'),(58,'App\\Models\\Utilisateur',8,'auth_token','ad84349a192d17cf71b43e7017dedaff70003c66c30d55262c041c65a444d86a','[\"*\"]',NULL,NULL,'2026-05-13 09:52:06','2026-05-13 09:52:06'),(59,'App\\Models\\Utilisateur',8,'auth_token','b7ca29ec7861852092b7f4d04dd5913b34a5558d6f9f4219170dc64dff72653a','[\"*\"]',NULL,NULL,'2026-05-13 09:57:35','2026-05-13 09:57:35'),(60,'App\\Models\\Utilisateur',8,'auth_token','9a500375d1afbab28b6c78ef3345c02563fcd0d01b2ab5b4f20c739b6c2d67b5','[\"*\"]',NULL,NULL,'2026-05-13 09:59:19','2026-05-13 09:59:19'),(61,'App\\Models\\Utilisateur',8,'auth_token','dbc03bf2559bdb72ceb48109c2aff3cefe5c8545300395d1a2268747199ce544','[\"*\"]',NULL,NULL,'2026-05-13 10:00:59','2026-05-13 10:00:59'),(62,'App\\Models\\Utilisateur',8,'auth_token','e407c9d6217a710dc76fcc1d244f32c02a54ee628c065cc242a80d781019e947','[\"*\"]',NULL,NULL,'2026-05-13 10:25:37','2026-05-13 10:25:37'),(63,'App\\Models\\Utilisateur',8,'auth_token','5eed88dc8a63d431455dd32d76eb5ba6553f4ac218f17b36aa626ad59e7c4ef1','[\"*\"]',NULL,NULL,'2026-05-13 10:35:53','2026-05-13 10:35:53'),(64,'App\\Models\\Utilisateur',8,'auth_token','22c2c34e6bdbf2f18862a3f0bbfadc3a2ae57f262e7d1ca62be985e0a91f9f18','[\"*\"]',NULL,NULL,'2026-05-13 10:37:11','2026-05-13 10:37:11'),(65,'App\\Models\\Utilisateur',8,'auth_token','977ebc81bba44714d876a919111a2307665dc5e8f7e4a00237591b9e4afa8598','[\"*\"]',NULL,NULL,'2026-05-13 10:52:48','2026-05-13 10:52:48'),(66,'App\\Models\\Utilisateur',8,'auth_token','11c720410b57761c9e76644e073d0fbf788b459d8495a6506cfbc501dd198757','[\"*\"]',NULL,NULL,'2026-05-13 11:24:12','2026-05-13 11:24:12'),(67,'App\\Models\\Utilisateur',8,'auth_token','187c0662967236ae04ccd02c734996b90e4753c174d8173e87fc3459a20e790e','[\"*\"]',NULL,NULL,'2026-05-13 11:45:02','2026-05-13 11:45:02'),(68,'App\\Models\\Utilisateur',8,'auth_token','094b8acfba2b04099c523e13c069b9aaa11bf52708ac21114a20b38b6dcf156f','[\"*\"]',NULL,NULL,'2026-05-13 17:41:25','2026-05-13 17:41:25'),(69,'App\\Models\\Utilisateur',8,'auth_token','98080b8536da7598745bbe15213b6c49cbf75ca330ce080179217065f220893f','[\"*\"]',NULL,NULL,'2026-05-13 17:48:36','2026-05-13 17:48:36'),(70,'App\\Models\\Utilisateur',8,'auth_token','03af2e5cd75f0d5c6a19c06d8290818d9b3a430294e626ecbda392b02be2a4cc','[\"*\"]',NULL,NULL,'2026-05-13 18:35:37','2026-05-13 18:35:37'),(71,'App\\Models\\Utilisateur',8,'auth_token','163147e18aded9bb65bedb68ef5e52559013c4463adfabfbe364cecc15ae342f','[\"*\"]',NULL,NULL,'2026-05-13 18:43:56','2026-05-13 18:43:56'),(72,'App\\Models\\Utilisateur',8,'auth_token','bf1b3d2a3be0e849f00a016728a7d62c520c6a57eb7a66346675effe3dfb2dfc','[\"*\"]',NULL,NULL,'2026-05-13 18:51:09','2026-05-13 18:51:09'),(73,'App\\Models\\Utilisateur',8,'auth_token','3803d0ca867fe4e3c477f3744d5b47dc211377f6d7132feb0a1d5e161495275a','[\"*\"]',NULL,NULL,'2026-05-13 18:54:13','2026-05-13 18:54:13'),(74,'App\\Models\\Utilisateur',8,'auth_token','aff708dc211a8db1290729bd8955f4ba10e8e3f95fda060859000fc3a72c0a9e','[\"*\"]',NULL,NULL,'2026-05-13 18:56:00','2026-05-13 18:56:00'),(75,'App\\Models\\Utilisateur',8,'auth_token','e3008f67eb589ee9d721cdad02220d96ce895570a39f99a1d13064d18bbfa667','[\"*\"]',NULL,NULL,'2026-05-14 05:51:48','2026-05-14 05:51:48'),(76,'App\\Models\\Utilisateur',8,'auth_token','9953ad67523ae28efc9c37d2fafd7dd1f1c16349fba33e8a86ba0af584b1e3ed','[\"*\"]',NULL,NULL,'2026-05-14 05:53:29','2026-05-14 05:53:29'),(77,'App\\Models\\Utilisateur',8,'auth_token','563160393f35395e5ff070b8953ea971fa8e9ee7fb5be6b3d47ed4b15b1c6aa7','[\"*\"]',NULL,NULL,'2026-05-14 06:05:20','2026-05-14 06:05:20'),(78,'App\\Models\\Utilisateur',8,'auth_token','0335baa8b2bbe305a704da49097162682509cba038a3db2fb5d45594f5550e63','[\"*\"]',NULL,NULL,'2026-05-14 06:22:10','2026-05-14 06:22:10'),(79,'App\\Models\\Utilisateur',8,'auth_token','c7a688960e77b62d4301e3b3199411af080c8f411881e8c6e2ec899c9a8a3d2a','[\"*\"]',NULL,NULL,'2026-05-14 06:22:40','2026-05-14 06:22:40'),(80,'App\\Models\\Utilisateur',8,'auth_token','60cb160dce109d1b607fb6c43d097611f693a763f74104085293d2b5fe5e56a2','[\"*\"]',NULL,NULL,'2026-05-14 06:33:18','2026-05-14 06:33:18'),(81,'App\\Models\\Utilisateur',8,'auth_token','5de711ad780af1bdc6482d9eb05340e63c9ca353c4c56cfce3d75277d153b94e','[\"*\"]',NULL,NULL,'2026-05-14 06:41:09','2026-05-14 06:41:09'),(82,'App\\Models\\Utilisateur',8,'auth_token','fc5fe0531cda8812000c1d888c9e3123bef744e9c245b87a10b021e877bc254c','[\"*\"]',NULL,NULL,'2026-05-14 07:43:15','2026-05-14 07:43:15'),(83,'App\\Models\\Utilisateur',8,'auth_token','d631ebfd20999c0187bffa6ee8a9507c5612d8e312252d5cccd2f90cc14e22da','[\"*\"]',NULL,NULL,'2026-05-14 11:03:12','2026-05-14 11:03:12'),(84,'App\\Models\\Utilisateur',8,'auth_token','bd0c12d9185c11ec6eb436ae8068575797887d66645dd848d04e2ee11ad36cc7','[\"*\"]',NULL,NULL,'2026-05-14 11:27:29','2026-05-14 11:27:29'),(85,'App\\Models\\Utilisateur',8,'auth_token','598143a57f4af94733f5c7828b9187d6727b3e31b82831f4437a07216721ecd4','[\"*\"]',NULL,NULL,'2026-05-14 11:31:32','2026-05-14 11:31:32'),(86,'App\\Models\\Utilisateur',8,'auth_token','9a0aba2014cae9bd91b16da6f3c309964c49d21353cbcd78d487fb2c7f51c54c','[\"*\"]',NULL,NULL,'2026-05-14 11:51:46','2026-05-14 11:51:46'),(87,'App\\Models\\Utilisateur',8,'auth_token','9b5a7f9bab4cab08a6188958d13703f0f1efc7b5be4d7a7bc0525f7f17209226','[\"*\"]',NULL,NULL,'2026-05-14 12:04:49','2026-05-14 12:04:49'),(88,'App\\Models\\Utilisateur',8,'auth_token','541b55aa7f03e75cf8ada3a624893f27066f28871a88d37420af43d1b4610cc6','[\"*\"]',NULL,NULL,'2026-05-14 12:23:52','2026-05-14 12:23:52'),(89,'App\\Models\\Utilisateur',8,'auth_token','92e7651441cbce4c2ecdbb254098467153a3253fb9428b84c4668ef2e0a9a119','[\"*\"]',NULL,NULL,'2026-05-14 12:37:53','2026-05-14 12:37:53'),(90,'App\\Models\\Utilisateur',8,'auth_token','7a575ad7813c43283ef575fdba3071ebec4082166a873e1dbe34f2cf7dfe4833','[\"*\"]',NULL,NULL,'2026-05-14 12:51:06','2026-05-14 12:51:06'),(91,'App\\Models\\Utilisateur',8,'auth_token','18140644dbc016084249469d32013ef6860bce2f62c79ebcb70a9b6791c9bf18','[\"*\"]',NULL,NULL,'2026-05-20 18:51:56','2026-05-20 18:51:56'),(92,'App\\Models\\Utilisateur',8,'auth_token','49edc7f541c55eb7e20182c118fbb4e4bed7af984978e2a67606c99c15b1bce7','[\"*\"]',NULL,NULL,'2026-05-20 18:52:07','2026-05-20 18:52:07'),(93,'App\\Models\\Utilisateur',9,'auth_token','4756869b522a95b5a4fab5863b99096884486273971a5b26bb6a1a74a078cb14','[\"*\"]',NULL,NULL,'2026-05-22 19:03:55','2026-05-22 19:03:55'),(94,'App\\Models\\Utilisateur',9,'auth_token','a7f29871e4e6a1d2ffcfcdbd1f5ed0db5eb34405db08efa0cc0d130a008537db','[\"*\"]',NULL,NULL,'2026-05-22 19:04:34','2026-05-22 19:04:34'),(95,'App\\Models\\Utilisateur',9,'auth_token','5fe54f7ca764c3d8f59f99639ea88a7533e84c3d153dee2155e192a0312280f2','[\"*\"]',NULL,NULL,'2026-05-22 19:08:23','2026-05-22 19:08:23'),(96,'App\\Models\\Utilisateur',9,'auth_token','39855ca17c7658a8f0f1d03c03f72e793c7f7e8eaf97c51c901bb57ec6c19f1d','[\"*\"]',NULL,NULL,'2026-05-22 19:08:26','2026-05-22 19:08:26'),(97,'App\\Models\\Utilisateur',9,'auth_token','071a91df5419e0e0323a4fb38bb6093c3322ed7594e76c8c445463507a58dabd','[\"*\"]',NULL,NULL,'2026-05-22 19:18:29','2026-05-22 19:18:29'),(98,'App\\Models\\Utilisateur',9,'auth_token','8782d2ca50c0c0931bbfb49451ee95150ee7c85fa2be1f551c695bbe8916d2a4','[\"*\"]',NULL,NULL,'2026-05-22 19:22:04','2026-05-22 19:22:04'),(99,'App\\Models\\Utilisateur',9,'auth_token','1c180eeb6403693a0fd604a235c21583a032ce33e5dc753bf605b3f61f9d8f70','[\"*\"]',NULL,NULL,'2026-05-22 19:23:31','2026-05-22 19:23:31'),(100,'App\\Models\\Utilisateur',9,'auth_token','069936c72a1f2c8437dd0be708b5154d2a81a8c1bc1500674f3e064fff3270f8','[\"*\"]',NULL,NULL,'2026-05-22 19:23:43','2026-05-22 19:23:43'),(101,'App\\Models\\Utilisateur',9,'auth_token','9fa76fe6d724e161fcd67efa62dc892e705f196849cbe8cb412369d1b4cbdccc','[\"*\"]',NULL,NULL,'2026-05-22 19:28:56','2026-05-22 19:28:56'),(102,'App\\Models\\Utilisateur',9,'auth_token','3e6e86496fbcf708d8a8792f91950a5119e58c7f7e99a90ba2d1de1aad662c5f','[\"*\"]',NULL,NULL,'2026-05-22 19:29:35','2026-05-22 19:29:35'),(103,'App\\Models\\Utilisateur',9,'auth_token','7e9efc73ce4181efb3251585de19e3591c447098175a0f592abf17b0f8d1bf30','[\"*\"]',NULL,NULL,'2026-05-22 19:30:03','2026-05-22 19:30:03'),(104,'App\\Models\\Utilisateur',9,'auth_token','d388c628326de9361007ff5b6cfb4120bfaad1d7c8b3377636743aaa7a96b82b','[\"*\"]',NULL,NULL,'2026-05-22 19:33:36','2026-05-22 19:33:36'),(105,'App\\Models\\Utilisateur',9,'auth_token','32adbed021d66fa94458d79754cabb0135d68a492084774bfdd6a56c26b4a0cc','[\"*\"]',NULL,NULL,'2026-05-22 19:33:56','2026-05-22 19:33:56'),(106,'App\\Models\\Utilisateur',9,'auth_token','f82e5204a5dba224771f05d93fd48d7d753ed49e5137b3bf888acfb98534c32d','[\"*\"]',NULL,NULL,'2026-05-22 19:36:10','2026-05-22 19:36:10'),(107,'App\\Models\\Utilisateur',9,'auth_token','03232a677daf25e4b08f0a79dbc591b576d81b641b548f783baf0477dd49a981','[\"*\"]',NULL,NULL,'2026-05-22 19:38:36','2026-05-22 19:38:36'),(108,'App\\Models\\Utilisateur',9,'auth_token','57a207bdc386fdaa6ad91cb0f3ebe01b86f9583dea27824a4f90dee9824c8c0d','[\"*\"]',NULL,NULL,'2026-05-22 19:50:08','2026-05-22 19:50:08'),(109,'App\\Models\\Utilisateur',9,'auth_token','85ffb6554a316e515e4a956bf66934858d4450150490fc844bfd7c7c50666346','[\"*\"]','2026-05-22 20:00:16',NULL,'2026-05-22 19:59:41','2026-05-22 20:00:16'),(110,'App\\Models\\Utilisateur',9,'auth_token','0d6c2b989d1fb46bf1469ea5261fe9bb9aac5bac5b316eea2e68753440a628f3','[\"*\"]',NULL,NULL,'2026-05-22 20:00:28','2026-05-22 20:00:28'),(111,'App\\Models\\Utilisateur',9,'auth_token','e7893f2ea04f216362080755c29a893084751a4f75d683a2bacc750a39aec6f3','[\"*\"]',NULL,NULL,'2026-05-22 20:01:00','2026-05-22 20:01:00'),(112,'App\\Models\\Utilisateur',9,'auth_token','11e80b3951780a815cede509ff41b43a2f0918418c71a8602767815d90777f0d','[\"*\"]',NULL,NULL,'2026-05-22 20:04:33','2026-05-22 20:04:33'),(113,'App\\Models\\Utilisateur',9,'auth_token','ce2db6bf600faf7aa15d7f2626270d609a92a51f9a46b87eb687e320fd819bbf','[\"*\"]',NULL,NULL,'2026-05-22 20:06:27','2026-05-22 20:06:27'),(114,'App\\Models\\Utilisateur',9,'auth_token','6931384b232cc076f5ae062d1558d980975f45c5ca28570b7f5d4fd23357a43a','[\"*\"]',NULL,NULL,'2026-05-22 20:06:35','2026-05-22 20:06:35'),(115,'App\\Models\\Utilisateur',9,'auth_token','7fd585d8e35038b91f47060bdf8eaac3c5f75e6ae2d72d1a5a376237887daf59','[\"*\"]',NULL,NULL,'2026-05-22 20:27:34','2026-05-22 20:27:34'),(116,'App\\Models\\Utilisateur',9,'auth_token','f7e54f69c13b55407433da5181a02a71adc739bcd207b2f6220ac4f6cff82784','[\"*\"]',NULL,NULL,'2026-05-22 21:01:01','2026-05-22 21:01:01'),(117,'App\\Models\\Utilisateur',9,'auth_token','967b57567b5264ec1334277dc95786c010cf09d2b1c251b72da086076699666f','[\"*\"]','2026-05-22 21:06:39',NULL,'2026-05-22 21:05:11','2026-05-22 21:06:39'),(118,'App\\Models\\Utilisateur',9,'auth_token','8cea373f4e095ce3fabc3624ce34e59bcab8483a746b19946b946b4b68c77c12','[\"*\"]','2026-05-22 21:08:28',NULL,'2026-05-22 21:07:44','2026-05-22 21:08:28'),(119,'App\\Models\\Utilisateur',9,'auth_token','6ebe85f870629d6fd190661bceac23f138055956a2d1bceef465517089276c5d','[\"*\"]','2026-05-22 21:21:44',NULL,'2026-05-22 21:21:40','2026-05-22 21:21:44'),(120,'App\\Models\\Utilisateur',9,'auth_token','8e3a2bf260d16c0784435c12d9b24719b15b8758be3ad073d846e4a916e007d4','[\"*\"]','2026-05-22 21:23:12',NULL,'2026-05-22 21:22:57','2026-05-22 21:23:12'),(121,'App\\Models\\Utilisateur',9,'auth_token','291718dc80566e34ba392e71a56be9adfe5c78726ab2266b455f1d51afc241a7','[\"*\"]','2026-05-22 21:30:06',NULL,'2026-05-22 21:27:50','2026-05-22 21:30:06'),(122,'App\\Models\\Utilisateur',9,'auth_token','90712a1f9cf0fd66013edb2565ef28f24f3a96cc374f79a2838e377c7bf580a6','[\"*\"]','2026-05-23 11:46:27',NULL,'2026-05-23 11:45:40','2026-05-23 11:46:27'),(123,'App\\Models\\Utilisateur',9,'auth_token','bfef4ccacfd49ae530355b330651b519d59d4dc66927f9beaa85f07d9c71db97','[\"*\"]','2026-05-23 11:58:21',NULL,'2026-05-23 11:50:55','2026-05-23 11:58:21'),(124,'App\\Models\\Utilisateur',9,'auth_token','cdae1c5f7698969b86997eb03c4a56f2983621b874ee0adbf3710fd37e843c7e','[\"*\"]','2026-05-23 12:23:32',NULL,'2026-05-23 12:23:17','2026-05-23 12:23:32'),(125,'App\\Models\\Utilisateur',9,'auth_token','05b182befe9fc282ac6a95f4266f571b78011732df39df8beb09d2e1b2b1a2c2','[\"*\"]','2026-05-23 12:28:41',NULL,'2026-05-23 12:28:29','2026-05-23 12:28:41'),(126,'App\\Models\\Utilisateur',9,'auth_token','99fe1770572b1e8ff68a7de0456233ed189c73c06db707b781ad4eaf5b60bf10','[\"*\"]','2026-05-23 12:44:05',NULL,'2026-05-23 12:44:00','2026-05-23 12:44:05'),(127,'App\\Models\\Utilisateur',9,'auth_token','9ddf655ae7ef9d26e002ce1827a8f1c39b466e2f3dc80eda258aedd78c036627','[\"*\"]','2026-05-23 13:23:17',NULL,'2026-05-23 13:23:12','2026-05-23 13:23:17'),(128,'App\\Models\\Utilisateur',9,'auth_token','3ce085afd368c3866aab68dcb20ea6484219d8730d9167d4189db86bd34e8568','[\"*\"]','2026-05-23 13:44:50',NULL,'2026-05-23 13:35:55','2026-05-23 13:44:50'),(129,'App\\Models\\Utilisateur',9,'auth_token','15be4d02740384f5f00637018fcd450691e6902f603290f81521703c76a69442','[\"*\"]','2026-05-23 13:48:19',NULL,'2026-05-23 13:44:54','2026-05-23 13:48:19'),(130,'App\\Models\\Utilisateur',9,'auth_token','741b29a280642338ba7dfdc5ad489c0f642000c85526badef2439074dc14a999','[\"*\"]','2026-05-23 13:48:41',NULL,'2026-05-23 13:48:37','2026-05-23 13:48:41'),(131,'App\\Models\\Utilisateur',9,'auth_token','53d32e0deb80a89620ac31cdfe372d5c052cc73228f6762fe04602905e772405','[\"*\"]','2026-05-23 13:53:05',NULL,'2026-05-23 13:53:00','2026-05-23 13:53:05'),(132,'App\\Models\\Utilisateur',9,'auth_token','51adb024c2482eb10e9d5c51c090749f8e0b3ed9c7bd8407512733b4a5f19551','[\"*\"]','2026-05-23 14:03:14',NULL,'2026-05-23 13:56:56','2026-05-23 14:03:14'),(133,'App\\Models\\Utilisateur',9,'auth_token','a2d05137818b85a8679dafaa3419796caa7466a8c65fefcc7a205d9a1ead8659','[\"*\"]','2026-05-23 14:10:21',NULL,'2026-05-23 14:06:14','2026-05-23 14:10:21'),(134,'App\\Models\\Utilisateur',9,'auth_token','3673574790963e1791e2ff119e054c798d73bc336551678c95a7c407e2aad9fd','[\"*\"]','2026-05-23 14:11:06',NULL,'2026-05-23 14:10:46','2026-05-23 14:11:06'),(135,'App\\Models\\Utilisateur',9,'auth_token','8a4d59873799899a2db0e3418a99f811438d376da50226bde29a626f4bc29a37','[\"*\"]','2026-05-23 14:11:36',NULL,'2026-05-23 14:11:25','2026-05-23 14:11:36'),(136,'App\\Models\\Utilisateur',9,'auth_token','8388e9965ba0935d8d0b901d83baaf0595b8a8ef40989ea7bd684f8188d6a99a','[\"*\"]','2026-05-23 14:12:24',NULL,'2026-05-23 14:12:20','2026-05-23 14:12:24'),(137,'App\\Models\\Utilisateur',9,'auth_token','728bc40083597dd4827b72824d7df4f19512d8a094d7b90dd7cdee33da286327','[\"*\"]','2026-05-23 15:16:26',NULL,'2026-05-23 15:16:21','2026-05-23 15:16:26'),(138,'App\\Models\\Utilisateur',9,'auth_token','8d2c7195af3e011b3c4e4ecd68d4bac7e6290abedadd24fd2c609a1a775f1d7d','[\"*\"]','2026-05-23 15:39:03',NULL,'2026-05-23 15:38:16','2026-05-23 15:39:03'),(139,'App\\Models\\Utilisateur',9,'auth_token','3fc3d6e79fdc42bd374afd6eaf6b6add9e9c8d9852e19cb762d46868d8c6532c','[\"*\"]','2026-05-23 15:39:33',NULL,'2026-05-23 15:39:20','2026-05-23 15:39:33'),(140,'App\\Models\\Utilisateur',9,'auth_token','6e17cd0aee0e7ee8490d312a289f9eb77982c58905be841e63654278d747ae05','[\"*\"]','2026-05-23 15:47:47',NULL,'2026-05-23 15:47:43','2026-05-23 15:47:47'),(141,'App\\Models\\Utilisateur',9,'auth_token','555f528b37185beca1cdfbaa9dc51b93787df6b259ec65974fd6eba21c7e59e6','[\"*\"]','2026-05-23 16:11:34',NULL,'2026-05-23 16:11:29','2026-05-23 16:11:34'),(142,'App\\Models\\Utilisateur',9,'auth_token','c286edde9cfe122f6e4dd0c7e9e83a394e49c82d8515502e6d8775831bb3cdaa','[\"*\"]','2026-05-23 17:02:00',NULL,'2026-05-23 17:01:56','2026-05-23 17:02:00'),(143,'App\\Models\\Utilisateur',9,'auth_token','bc4749fdd2d00f9ffd8c152254a6b3dac6e03e953029140f4ec788fd4038f2a5','[\"*\"]','2026-05-23 17:54:50',NULL,'2026-05-23 17:54:38','2026-05-23 17:54:50'),(144,'App\\Models\\Utilisateur',9,'auth_token','69115926ea88020442bc4b373d30b9dee1ea8b00e6bbe299edba74b3e1fb1b24','[\"*\"]','2026-05-23 18:09:14',NULL,'2026-05-23 18:05:14','2026-05-23 18:09:14'),(145,'App\\Models\\Utilisateur',9,'auth_token','6897b88d269dbdb707ee68765a70f91bc0deb6273961b2e8848920623b9ced24','[\"*\"]','2026-05-23 18:46:51',NULL,'2026-05-23 18:46:00','2026-05-23 18:46:51'),(146,'App\\Models\\Utilisateur',9,'auth_token','6d0e1a3cc84ff722a697be527d33eeaaca632aa94a9ca94a39f6a28672604735','[\"*\"]','2026-05-23 18:47:30',NULL,'2026-05-23 18:47:22','2026-05-23 18:47:30'),(147,'App\\Models\\Utilisateur',9,'auth_token','50a0f05a3b00a67a062615f43b5cf199f4990af3ccba57a31764b1b7b72173e7','[\"*\"]','2026-05-23 18:49:33',NULL,'2026-05-23 18:49:28','2026-05-23 18:49:33'),(148,'App\\Models\\Utilisateur',9,'auth_token','1009f5704fd146a25d4cbd210bd814d4691263c3ca34820c3a38c166bdeee33a','[\"*\"]','2026-05-23 18:55:09',NULL,'2026-05-23 18:53:04','2026-05-23 18:55:09'),(149,'App\\Models\\Utilisateur',9,'auth_token','6350e518b711d62b547dc7c3c3971aaa037309c19af290c44d9c885ed624bfa1','[\"*\"]','2026-05-23 19:31:37',NULL,'2026-05-23 19:14:49','2026-05-23 19:31:37'),(150,'App\\Models\\Utilisateur',9,'auth_token','2348bece78cf53c7af99aa30e7e64a37b6e52087629953ea32ea8fb2fa6fbd5a','[\"*\"]','2026-05-23 19:54:16',NULL,'2026-05-23 19:54:11','2026-05-23 19:54:16'),(151,'App\\Models\\Utilisateur',9,'auth_token','3146b5a8993859336b90270e6eeb6d55d9b9b793850153d5f346a122d2c5039b','[\"*\"]','2026-05-23 20:00:07',NULL,'2026-05-23 19:56:56','2026-05-23 20:00:07'),(152,'App\\Models\\Utilisateur',9,'auth_token','cfa6dace2c547b7766496644e9a8729c088388e6858f4669e592c97bcc0864da','[\"*\"]','2026-05-23 20:08:52',NULL,'2026-05-23 20:05:22','2026-05-23 20:08:52'),(153,'App\\Models\\Utilisateur',9,'auth_token','7ef5a5cfc86ee83cb6129d2f55b5908dfe6f1e1c332242d8dcd11bafba76d010','[\"*\"]','2026-05-23 20:12:03',NULL,'2026-05-23 20:09:38','2026-05-23 20:12:03'),(154,'App\\Models\\Utilisateur',9,'auth_token','21fe757da78d7a0cff6be56b97a3f037b96510595d64abb591a548945eda093a','[\"*\"]','2026-05-23 20:12:37',NULL,'2026-05-23 20:12:32','2026-05-23 20:12:37'),(155,'App\\Models\\Utilisateur',9,'auth_token','32618c8e64dc2c3bee1b90187365830db782f5f3bde51c280df9200a01e606d0','[\"*\"]','2026-05-23 20:13:39',NULL,'2026-05-23 20:13:34','2026-05-23 20:13:39'),(156,'App\\Models\\Utilisateur',9,'auth_token','15e2e862445172cb548774daabe521fdeaf4b0b6b0babad2dbf9152460de4e90','[\"*\"]','2026-05-23 20:52:53',NULL,'2026-05-23 20:52:49','2026-05-23 20:52:53'),(157,'App\\Models\\Utilisateur',9,'auth_token','6bbae54a8e662cb8dfbcdc1b57266c79fd06683ba672d34f50fa68b13463e2dc','[\"*\"]','2026-05-23 21:01:02',NULL,'2026-05-23 21:00:58','2026-05-23 21:01:02'),(158,'App\\Models\\Utilisateur',9,'auth_token','840649f6488dea1ec61f1eb81be5b16ea854e9331c5101f7b32b051aabf2fef1','[\"*\"]','2026-05-23 21:04:29',NULL,'2026-05-23 21:04:13','2026-05-23 21:04:29'),(159,'App\\Models\\Utilisateur',9,'auth_token','493f15bf7b3b5854927ff90965a0c1886dba29a02cc0d46140a9312f93919277','[\"*\"]','2026-05-23 21:04:56',NULL,'2026-05-23 21:04:51','2026-05-23 21:04:56'),(160,'App\\Models\\Utilisateur',9,'auth_token','9bc8da3357d0f4405fa66ca90e889f136e2a3551c1dddd2bacb157081af72ec7','[\"*\"]','2026-05-23 21:21:15',NULL,'2026-05-23 21:20:30','2026-05-23 21:21:15'),(161,'App\\Models\\Utilisateur',9,'auth_token','ffb9b26199867d4dde8f8bf0a47e018a424a2286ce669d07dc03adeffbe66e41','[\"*\"]','2026-05-23 21:21:23',NULL,'2026-05-23 21:21:19','2026-05-23 21:21:23'),(162,'App\\Models\\Utilisateur',9,'auth_token','927addd6732f3725de2a7a31bf677dc4153429c12f619aad5a45422446a19cf5','[\"*\"]','2026-05-23 21:26:32',NULL,'2026-05-23 21:26:28','2026-05-23 21:26:32'),(163,'App\\Models\\Utilisateur',9,'auth_token','cb6a4537768f6140fc921549054c2e272e4c3a93cd573a3ab7c38a75cddfc6bd','[\"*\"]','2026-05-23 21:29:24',NULL,'2026-05-23 21:29:18','2026-05-23 21:29:24'),(164,'App\\Models\\Utilisateur',9,'auth_token','260753c3604d4727628b9fbd6902c07ae8ef6a1d2a74ea53192f3743064a8f36','[\"*\"]','2026-05-23 21:30:51',NULL,'2026-05-23 21:30:37','2026-05-23 21:30:51'),(165,'App\\Models\\Utilisateur',9,'auth_token','849bc59a6564b1278b1a9f426547bc915b9a8e5a4aba7597ad22bb81abe0d7af','[\"*\"]','2026-05-23 21:32:20',NULL,'2026-05-23 21:32:16','2026-05-23 21:32:20'),(166,'App\\Models\\Utilisateur',9,'auth_token','dc8ddcf68504cae5df6370655076569125641eec2214e7a834f36441ca4593a4','[\"*\"]','2026-05-24 10:20:34',NULL,'2026-05-24 10:20:27','2026-05-24 10:20:34'),(167,'App\\Models\\Utilisateur',9,'auth_token','8d6736c445cf926552ecdd2e9c4714338f3d2ca2aaa196eedd6d2c54c8449947','[\"*\"]','2026-05-24 10:24:29',NULL,'2026-05-24 10:24:25','2026-05-24 10:24:29'),(168,'App\\Models\\Utilisateur',9,'auth_token','b7a02ceb28eeb17344653d978ee6b2c6dfd525c37fd6520f23a8094567d8ce65','[\"*\"]','2026-05-24 10:41:27',NULL,'2026-05-24 10:41:23','2026-05-24 10:41:27'),(169,'App\\Models\\Utilisateur',8,'auth_token','c838225487066a8df89ddf5530ba88a21933c1696acf1862d7ec31879964a5b7','[\"*\"]',NULL,NULL,'2026-05-24 10:45:26','2026-05-24 10:45:26'),(170,'App\\Models\\Utilisateur',8,'auth_token','cb1ed40589a958317d5283c09af5fc1ec9ef62a6c034687bf3d9fb895c2c1047','[\"*\"]','2026-05-24 10:59:42',NULL,'2026-05-24 10:46:06','2026-05-24 10:59:42'),(171,'App\\Models\\Utilisateur',8,'auth_token','a6dafbd46c90c6c9c00452df41254147d6941d008a769fc0307ae3eac26cae07','[\"*\"]','2026-05-24 11:06:35',NULL,'2026-05-24 11:02:23','2026-05-24 11:06:35'),(172,'App\\Models\\Utilisateur',8,'auth_token','d898a3f5fc688f02087d48a358cc7ca63687b49abe65486aabeded435805aa86','[\"*\"]','2026-05-24 11:12:54',NULL,'2026-05-24 11:12:49','2026-05-24 11:12:54'),(173,'App\\Models\\Utilisateur',8,'auth_token','ea1876a51338f12dd96746813968221e2d129f997a0b9e3c2ac9fde4e8014812','[\"*\"]','2026-05-24 11:15:28',NULL,'2026-05-24 11:14:57','2026-05-24 11:15:28'),(174,'App\\Models\\Utilisateur',9,'auth_token','d8987af73fbda6a5252109ff9426d1498052879aa2d7cb1246041ba30df29787','[\"*\"]','2026-05-24 11:26:53',NULL,'2026-05-24 11:26:47','2026-05-24 11:26:53'),(175,'App\\Models\\Utilisateur',8,'auth_token','317c17f7a3300eefff134109667fdddbbad6f738c8c081ef1e2b9dcdbd949efe','[\"*\"]','2026-05-24 11:28:57',NULL,'2026-05-24 11:28:34','2026-05-24 11:28:57'),(176,'App\\Models\\Utilisateur',9,'auth_token','242715f4d04e5c5c46705c7f1ef3ebff08999f256a20b6779c0d6aa53196f6b4','[\"*\"]','2026-05-24 11:29:11',NULL,'2026-05-24 11:29:06','2026-05-24 11:29:11'),(177,'App\\Models\\Utilisateur',8,'auth_token','3b0af48e4ea92585d49c821a7e9dfecc170252b185b89da16b0cfbe2df5a7471','[\"*\"]','2026-05-24 11:29:22',NULL,'2026-05-24 11:29:17','2026-05-24 11:29:22'),(178,'App\\Models\\Utilisateur',8,'auth_token','ceb2c4509cede1640c0d6a524f3bfb22ec60ab04b7bcee9f40f011f25afe9488','[\"*\"]','2026-05-24 11:36:46',NULL,'2026-05-24 11:36:41','2026-05-24 11:36:46'),(179,'App\\Models\\Utilisateur',8,'auth_token','90c3f6b75a4ff3588df8e95041c9849ea819edca2f3921826585ba53197fc7df','[\"*\"]','2026-05-24 11:38:50',NULL,'2026-05-24 11:38:45','2026-05-24 11:38:50'),(180,'App\\Models\\Utilisateur',9,'auth_token','9352704528b6bca25becb7fb4ddf2368355a7422536c6a75f1a4cbbd4ac39cd4','[\"*\"]','2026-05-24 11:51:26',NULL,'2026-05-24 11:51:21','2026-05-24 11:51:26'),(181,'App\\Models\\Utilisateur',8,'auth_token','65889bb8ab1e76d9e8b954351c5b89da21fda2e5c54fa58c815c6f68f913268d','[\"*\"]','2026-05-24 12:04:31',NULL,'2026-05-24 12:04:00','2026-05-24 12:04:31'),(182,'App\\Models\\Utilisateur',8,'auth_token','c8cf4a60ef1c97317e9b0e2d28e5c0cf4e56309810d6f0909595f252cccb94a7','[\"*\"]','2026-05-24 12:04:49',NULL,'2026-05-24 12:04:43','2026-05-24 12:04:49'),(183,'App\\Models\\Utilisateur',8,'auth_token','86d3f772a424ddbbeb109332f0c74493da4d0921b0cb7df0306d0d8d783a51d6','[\"*\"]','2026-05-24 13:05:59',NULL,'2026-05-24 13:05:20','2026-05-24 13:05:59'),(184,'App\\Models\\Utilisateur',9,'auth_token','53c4c6f7c82508f9259bd0b7f4783c9c74886ad04e0549285cd6871f464fa4ac','[\"*\"]','2026-05-24 13:06:36',NULL,'2026-05-24 13:06:32','2026-05-24 13:06:36'),(185,'App\\Models\\Utilisateur',8,'auth_token','ccb6c74d46187ca757b7409919cd605d5b9c6b20e01df7883c1ce24ba74680ac','[\"*\"]','2026-05-24 13:16:15',NULL,'2026-05-24 13:16:09','2026-05-24 13:16:15'),(186,'App\\Models\\Utilisateur',8,'auth_token','f3a92294de7c71404fda47066079a3220202a95a0efc157415a6caf9de809edd','[\"*\"]','2026-05-24 13:36:48',NULL,'2026-05-24 13:36:43','2026-05-24 13:36:48'),(187,'App\\Models\\Utilisateur',8,'auth_token','29ecddd6ef515bc3314b1cb2ed528dd3663917cce9245fbf304d4e10a0b01c52','[\"*\"]','2026-05-24 13:52:27',NULL,'2026-05-24 13:52:21','2026-05-24 13:52:27'),(188,'App\\Models\\Utilisateur',9,'auth_token','aa3c287b71579a2c3ddb3272626bac71850fa9c75cb3f5791661173b8ccdb49e','[\"*\"]','2026-05-24 14:11:35',NULL,'2026-05-24 13:53:07','2026-05-24 14:11:35'),(189,'App\\Models\\Utilisateur',8,'auth_token','ac2ef44cac925e9db1925e5be3fa34121cb8f8c380a8208757f7b811a8e29a7d','[\"*\"]','2026-05-24 14:12:14',NULL,'2026-05-24 14:11:50','2026-05-24 14:12:14'),(190,'App\\Models\\Utilisateur',9,'auth_token','bf1a7a75d6e50edadcc29d77d75548e37937f0ca134cdc4c18a17ef84bf964b0','[\"*\"]','2026-05-24 14:13:32',NULL,'2026-05-24 14:13:28','2026-05-24 14:13:32'),(191,'App\\Models\\Utilisateur',8,'auth_token','928b5e2d79171abe2dfa513097f59bef388b805e0b77a2e6cea8a9da0b92a720','[\"*\"]','2026-05-24 14:55:46',NULL,'2026-05-24 14:14:46','2026-05-24 14:55:46'),(192,'App\\Models\\Utilisateur',8,'auth_token','6a8d24a459ede4beec849676343f3cb3fea7073d71aa2e2768a5e1872ac087e6','[\"*\"]','2026-05-24 15:01:26',NULL,'2026-05-24 15:01:10','2026-05-24 15:01:26'),(193,'App\\Models\\Utilisateur',8,'auth_token','aad19eae793d9d82e8f40587fcd2546b4ee9df4e6f3cde669336ff2d9e31d415','[\"*\"]','2026-05-24 15:02:44',NULL,'2026-05-24 15:01:34','2026-05-24 15:02:44'),(194,'App\\Models\\Utilisateur',8,'auth_token','beacc2c4ee36724cbaa5344610b9f9ac8585b5472316bd07b1270e0a03932ede','[\"*\"]','2026-05-24 15:22:13',NULL,'2026-05-24 15:09:21','2026-05-24 15:22:13'),(195,'App\\Models\\Utilisateur',8,'auth_token','d6cc1aaf652d7eecb2383e984648f0c281414ce1e95c0f9bbb255ef1e8ad740f','[\"*\"]','2026-05-24 15:41:21',NULL,'2026-05-24 15:40:01','2026-05-24 15:41:21'),(196,'App\\Models\\Utilisateur',8,'auth_token','d2e3970bc7e1ab2f722163810476b749591be675613a77ced59f63587c6676e2','[\"*\"]','2026-05-24 15:59:42',NULL,'2026-05-24 15:59:10','2026-05-24 15:59:42'),(197,'App\\Models\\Utilisateur',8,'auth_token','c1459192362d274f1eabf18e5321e8739c6669c1b698a820fb0522eb80ffa589','[\"*\"]','2026-05-24 16:04:02',NULL,'2026-05-24 16:02:32','2026-05-24 16:04:02'),(198,'App\\Models\\Utilisateur',8,'auth_token','2759e7eb500d36e24ad323a94a0caea328a9a893f15e7ae89b0c4333515b7548','[\"*\"]','2026-05-24 16:07:32',NULL,'2026-05-24 16:06:31','2026-05-24 16:07:32'),(199,'App\\Models\\Utilisateur',8,'auth_token','094c9288c0f867d4cbc8dcbf80d6819f89d761c92ed16a08b8223bf6f3fc8dd2','[\"*\"]','2026-05-24 16:09:07',NULL,'2026-05-24 16:08:31','2026-05-24 16:09:07'),(200,'App\\Models\\Utilisateur',8,'auth_token','54b074422e557b3e4157a696d8cdea4469562e252b3ed64208eb3f72b5ca0653','[\"*\"]','2026-05-24 16:12:45',NULL,'2026-05-24 16:09:39','2026-05-24 16:12:45'),(201,'App\\Models\\Utilisateur',10,'auth_token','a3efdf9035d0fd57e0becad2f311b096e55e6bbecfdfa8863ad0dba0ba6ff6e0','[\"*\"]',NULL,NULL,'2026-05-24 16:12:44','2026-05-24 16:12:44'),(202,'App\\Models\\Utilisateur',10,'auth_token','66f197084e42ebd9934ee04e860123510eb214304e89fdf5f0ca5234a9fa2e08','[\"*\"]','2026-05-24 16:13:03',NULL,'2026-05-24 16:12:59','2026-05-24 16:13:03'),(203,'App\\Models\\Utilisateur',10,'auth_token','099065e23a8feeb183fa5f7eb32d7a565f96b90aa65482d627701abff25115ba','[\"*\"]','2026-05-24 17:34:20',NULL,'2026-05-24 17:34:12','2026-05-24 17:34:20'),(204,'App\\Models\\Utilisateur',10,'auth_token','4f8ded4a1cc92235534180603579a51eb2dddb4acbd0f2c0d13f35756e516bac','[\"*\"]','2026-05-24 17:48:40',NULL,'2026-05-24 17:43:14','2026-05-24 17:48:40'),(205,'App\\Models\\Utilisateur',10,'auth_token','820c6edaaa9225ae5878889574c04a5acb2dbb6a87c6c519f64a2675a130b93d','[\"*\"]','2026-05-24 18:01:00',NULL,'2026-05-24 17:49:20','2026-05-24 18:01:00'),(206,'App\\Models\\Utilisateur',8,'auth_token','ab303ceb5fe3e24e4c5ba7eadc9d553e0c003fae69c72fbd26b03a95fdfadc01','[\"*\"]','2026-05-24 18:06:15',NULL,'2026-05-24 18:02:30','2026-05-24 18:06:15'),(207,'App\\Models\\Utilisateur',11,'auth_token','a269926f732cb6bd7f98bce22a61915163a8962adc3bf7b1ee7047f70544166e','[\"*\"]',NULL,NULL,'2026-05-24 18:06:14','2026-05-24 18:06:14'),(208,'App\\Models\\Utilisateur',11,'auth_token','a5de4c94ff6d3b6990d51864890c743b22ac2356b820a932ec4c43f5ff606b63','[\"*\"]','2026-05-24 18:07:27',NULL,'2026-05-24 18:07:23','2026-05-24 18:07:27'),(209,'App\\Models\\Utilisateur',8,'auth_token','a56500c1dd3c73e8b40c303e5bdbe4cff75b711186c34dcdceaa1d9e68797400','[\"*\"]','2026-05-24 18:14:07',NULL,'2026-05-24 18:14:00','2026-05-24 18:14:07'),(210,'App\\Models\\Utilisateur',8,'auth_token','ce431cf1096695711268b183acc545a0d575af838462192aa2969f37c56c3b9a','[\"*\"]','2026-05-24 18:14:21',NULL,'2026-05-24 18:14:15','2026-05-24 18:14:21'),(211,'App\\Models\\Utilisateur',11,'auth_token','6dac1a3dd50162b29fb8ab4db5d48073e5da1e89394ebf16b72ead29029e3b46','[\"*\"]','2026-05-24 18:15:56',NULL,'2026-05-24 18:15:51','2026-05-24 18:15:56'),(212,'App\\Models\\Utilisateur',9,'auth_token','332f77074cadb30d87917156260b8eac06655f3f7c44ffc1f8565185034f74b8','[\"*\"]','2026-05-24 18:16:48',NULL,'2026-05-24 18:16:43','2026-05-24 18:16:48'),(213,'App\\Models\\Utilisateur',8,'auth_token','ab277c771f752624625c3b4a4f9518a7b8766d100af0ecc4d7141a9ab25a4f0e','[\"*\"]','2026-05-24 19:01:16',NULL,'2026-05-24 19:01:09','2026-05-24 19:01:16'),(214,'App\\Models\\Utilisateur',9,'auth_token','df5c713d2707e67cc97d687ba1ce1a22e6a924eb04fd72dbcb9a253f45c11efb','[\"*\"]','2026-05-24 19:10:54',NULL,'2026-05-24 19:10:49','2026-05-24 19:10:54'),(215,'App\\Models\\Utilisateur',8,'auth_token','7034ddd6510ab6b7507f012ad507246da4818d80962ec6b894f7d75d8fea326c','[\"*\"]','2026-05-24 19:18:03',NULL,'2026-05-24 19:17:57','2026-05-24 19:18:03'),(216,'App\\Models\\Utilisateur',8,'auth_token','9d0dfaabd78933b367f2f5be681ba46e61ab51c00d8f854f39fda1377a0be736','[\"*\"]','2026-05-24 19:29:41',NULL,'2026-05-24 19:29:18','2026-05-24 19:29:41'),(217,'App\\Models\\Utilisateur',9,'auth_token','eab62546084b80c04fd6480474f8e250cbfe5872739eb5cbf25d0486f73d999f','[\"*\"]','2026-05-24 19:29:58',NULL,'2026-05-24 19:29:53','2026-05-24 19:29:58'),(218,'App\\Models\\Utilisateur',8,'auth_token','366e8dd42886353c899e1616f3976e0046614e6048f1cde1eb8c02ec3a2fb28e','[\"*\"]','2026-05-24 19:32:02',NULL,'2026-05-24 19:31:55','2026-05-24 19:32:02'),(219,'App\\Models\\Utilisateur',9,'auth_token','4ba1ce64cfda2301a4754166b50ced2cc60e943601642c202535f6c36bd15994','[\"*\"]','2026-05-24 19:34:52',NULL,'2026-05-24 19:34:42','2026-05-24 19:34:52'),(220,'App\\Models\\Utilisateur',8,'auth_token','435a03102c98f0dd428a39a66857006b912f331d12e6072f60177b9c4f50de7c','[\"*\"]','2026-05-24 19:35:55',NULL,'2026-05-24 19:35:40','2026-05-24 19:35:55'),(221,'App\\Models\\Utilisateur',9,'auth_token','6c5ffe353494262e5d135db1949dbe3b8bacc3588e3c0b9f6e4200e05663f01c','[\"*\"]','2026-05-24 19:57:17',NULL,'2026-05-24 19:57:12','2026-05-24 19:57:17'),(222,'App\\Models\\Utilisateur',8,'auth_token','b02cdf266bcab692dc48ef15fa686d7ed043afa05b66c8b43af9b9489a1dd885','[\"*\"]','2026-05-24 20:06:17',NULL,'2026-05-24 20:06:08','2026-05-24 20:06:17'),(223,'App\\Models\\Utilisateur',10,'auth_token','b280460f0a09faf07c93a226421a96633df34261ca3c26565e5bb21c9963e632','[\"*\"]','2026-05-24 20:07:27',NULL,'2026-05-24 20:07:22','2026-05-24 20:07:27'),(224,'App\\Models\\Utilisateur',8,'auth_token','a843df677268e71caf4c5fd5af193e4562d574975e8f92daab979438772fe9a5','[\"*\"]','2026-05-24 20:08:00',NULL,'2026-05-24 20:07:53','2026-05-24 20:08:00'),(225,'App\\Models\\Utilisateur',8,'auth_token','98bbee856304abbd8ab560d91cbb378dd3654be1683f18bcf0bc5c418fab9c5d','[\"*\"]','2026-05-24 20:10:18',NULL,'2026-05-24 20:10:11','2026-05-24 20:10:18'),(226,'App\\Models\\Utilisateur',9,'auth_token','d5db9ec8c889ef90874bd2547ad9900d11d8831cf46c56026977865698ea5671','[\"*\"]','2026-05-24 20:11:59',NULL,'2026-05-24 20:10:43','2026-05-24 20:11:59'),(227,'App\\Models\\Utilisateur',8,'auth_token','31aba5b891cf6511b293b1cd098ca65cb4a0724ccd44935b17790024e10243ad','[\"*\"]','2026-05-24 20:12:24',NULL,'2026-05-24 20:12:12','2026-05-24 20:12:24'),(228,'App\\Models\\Utilisateur',8,'auth_token','287328ecbf9eb8e35909144d2b5a241af62069c98cda80879ad1185d03afc7fd','[\"*\"]','2026-05-25 08:30:59',NULL,'2026-05-25 08:30:52','2026-05-25 08:30:59'),(229,'App\\Models\\Utilisateur',9,'auth_token','40d0c3eedb3aff47876597df6c39e648e52a2f319e061f8e7a09898ac5fa04b7','[\"*\"]','2026-05-25 08:31:29',NULL,'2026-05-25 08:31:25','2026-05-25 08:31:29'),(230,'App\\Models\\Utilisateur',8,'auth_token','ed986b9c6f13710c6deecb190ba25cb90a0d5d1be44129cad92f4cfc1be07e44','[\"*\"]','2026-05-25 08:52:03',NULL,'2026-05-25 08:51:56','2026-05-25 08:52:03'),(231,'App\\Models\\Utilisateur',8,'auth_token','efbab37d1d2c0388fc040731d40d0386298756a69531bf7ffb09b7915a6811bc','[\"*\"]','2026-05-25 10:31:59',NULL,'2026-05-25 10:31:50','2026-05-25 10:31:59'),(232,'App\\Models\\Utilisateur',8,'auth_token','f14b5f7efdce895f2d26ff794fd0bd304a00c394c5edb8158b0f18058c07a941','[\"*\"]','2026-05-25 10:33:23',NULL,'2026-05-25 10:33:14','2026-05-25 10:33:23'),(233,'App\\Models\\Utilisateur',9,'auth_token','627cc873f3e6a42a0afd4eeea0d8295ded785252dd69837f4bd640b06d11a913','[\"*\"]','2026-05-25 10:33:54',NULL,'2026-05-25 10:33:48','2026-05-25 10:33:54'),(234,'App\\Models\\Utilisateur',9,'auth_token','e653ad39ce28ce331dacf1b12a9fa31e4f822c43b4e98379a43197f71ded8026','[\"*\"]','2026-05-25 11:14:44',NULL,'2026-05-25 11:14:38','2026-05-25 11:14:44'),(235,'App\\Models\\Utilisateur',8,'auth_token','2bfb6698f8b5b206c4a9a2f95b8dd0488ff0bb941f2e41d889115af5e3877f0f','[\"*\"]','2026-05-25 11:16:24',NULL,'2026-05-25 11:16:15','2026-05-25 11:16:24'),(236,'App\\Models\\Utilisateur',8,'auth_token','e8879a29662f1e5a0c0bed1e1f144af38ac5eb4f1a4808c9dc2e495092aeebdf','[\"*\"]','2026-05-25 12:41:53',NULL,'2026-05-25 12:41:46','2026-05-25 12:41:53'),(237,'App\\Models\\Utilisateur',9,'auth_token','a5b01c65415408793c8ce1f4e2f33cf26f32e74d478255f2a0cdbc6f9821092e','[\"*\"]','2026-05-25 12:44:07',NULL,'2026-05-25 12:44:03','2026-05-25 12:44:07'),(238,'App\\Models\\Utilisateur',9,'auth_token','337ddaf5a6eb34ab118a2ebc3d20d0201b8532fb8af5b8aa5a9481e0c35564e3','[\"*\"]','2026-05-25 12:45:44',NULL,'2026-05-25 12:45:40','2026-05-25 12:45:44'),(239,'App\\Models\\Utilisateur',9,'auth_token','23190ed964234db19f0c8a87bba75c2c07a4a2bcf59d594920dd59e8843557eb','[\"*\"]','2026-05-25 12:47:42',NULL,'2026-05-25 12:47:37','2026-05-25 12:47:42'),(240,'App\\Models\\Utilisateur',8,'auth_token','0ec56c471a47e780143a4f61c4ebbb27f16253c323881eb2b73a0c4bd639e43a','[\"*\"]','2026-05-25 19:36:02',NULL,'2026-05-25 19:35:54','2026-05-25 19:36:02'),(241,'App\\Models\\Utilisateur',8,'auth_token','ba60a4b92bd4a238bcc91ddcfc127b19717c8952227390dc89a0d8b212f04aab','[\"*\"]','2026-05-25 19:48:35',NULL,'2026-05-25 19:46:45','2026-05-25 19:48:35'),(242,'App\\Models\\Utilisateur',8,'auth_token','1587c90e0000a5cab954c41ff78b3e26c2b4dee06f82333c15df647183170290','[\"*\"]','2026-05-25 19:54:54',NULL,'2026-05-25 19:49:08','2026-05-25 19:54:54'),(243,'App\\Models\\Utilisateur',8,'auth_token','e03834a498fccb10f98586ec5e783474e889b4ece445619cc5dc13d74ce002e0','[\"*\"]','2026-05-25 19:56:55',NULL,'2026-05-25 19:55:15','2026-05-25 19:56:55'),(244,'App\\Models\\Utilisateur',8,'auth_token','e5e4357157ff1f81f5045e188d7e779724a78ecb978ebd8ed36d8ed3f6f98e5b','[\"*\"]','2026-05-25 20:01:58',NULL,'2026-05-25 20:01:51','2026-05-25 20:01:58'),(245,'App\\Models\\Utilisateur',9,'auth_token','921fbd6c55493f46a3aaa882c06ae7656b6de6210c6274b0f512f6d50677cbda','[\"*\"]','2026-05-25 20:03:35',NULL,'2026-05-25 20:03:30','2026-05-25 20:03:35'),(246,'App\\Models\\Utilisateur',8,'auth_token','01b8f48a9cae1a0b6a4e00fee385b50cf104aa2748ff6928b443ec2851d441f0','[\"*\"]','2026-05-25 20:05:12',NULL,'2026-05-25 20:05:05','2026-05-25 20:05:12'),(247,'App\\Models\\Utilisateur',8,'auth_token','c55dbec7aaf9b816bad344fd239a4f7e84ceb492c7fe07fb3620db1a32495cbc','[\"*\"]','2026-05-26 13:38:01',NULL,'2026-05-26 13:37:53','2026-05-26 13:38:01'),(248,'App\\Models\\Utilisateur',8,'auth_token','5f28091b79edf7731b4a9225a5d2275a738896e87c36b7df2be0bc8537638988','[\"*\"]','2026-05-26 13:47:11',NULL,'2026-05-26 13:47:04','2026-05-26 13:47:11'),(249,'App\\Models\\Utilisateur',8,'auth_token','90cfe5b4ec2a0da3f6087d5424b577e178a6d9800a1573d6a333ee2e9ccd2c67','[\"*\"]','2026-05-26 14:13:16',NULL,'2026-05-26 14:13:08','2026-05-26 14:13:16'),(250,'App\\Models\\Utilisateur',9,'auth_token','6af09ede09a76968c9e842b2bb0f317d3840c26bc2d9c116e5711029b8214c7a','[\"*\"]','2026-05-26 14:13:59',NULL,'2026-05-26 14:13:54','2026-05-26 14:13:59'),(251,'App\\Models\\Utilisateur',11,'auth_token','28d91b93843c81df138fe1ed8781b2d860f22753a30d53a9623b59af17639aab','[\"*\"]','2026-05-26 14:18:56',NULL,'2026-05-26 14:18:52','2026-05-26 14:18:56'),(252,'App\\Models\\Utilisateur',9,'auth_token','5d2f06ab73246c90becaa45505e58c31a2391da7e37a0e32a5dd95450c51b794','[\"*\"]','2026-05-26 14:32:59',NULL,'2026-05-26 14:32:54','2026-05-26 14:32:59'),(253,'App\\Models\\Utilisateur',8,'auth_token','fb9de814f001d4a128a078d24f2d01afad4d912c0e8f6283f5d6662777b9c34b','[\"*\"]','2026-05-26 14:33:54',NULL,'2026-05-26 14:33:47','2026-05-26 14:33:54'),(254,'App\\Models\\Utilisateur',8,'auth_token','0c1c2c1c1635a01794bdddf9ac7d8cae5ed53cf029926b197520c32afec01b78','[\"*\"]','2026-05-26 19:23:43',NULL,'2026-05-26 19:23:35','2026-05-26 19:23:43'),(255,'App\\Models\\Utilisateur',9,'auth_token','299119739ad1be645fac8573fbd0cc5fedc696bf70df4b9b3c52ae2f445f87f9','[\"*\"]','2026-05-26 20:00:51',NULL,'2026-05-26 20:00:45','2026-05-26 20:00:51'),(256,'App\\Models\\Utilisateur',11,'auth_token','14b39089cfcb1fd8be0804f916720d2b3b05e4c7a86daa44be25777075929747','[\"*\"]','2026-05-26 20:17:31',NULL,'2026-05-26 20:17:25','2026-05-26 20:17:31'),(257,'App\\Models\\Utilisateur',11,'auth_token','b2b470b6f94b1d2ee20e19cdb5423dd7127a6abe26fa5b6a3a21c830036b4df6','[\"*\"]','2026-05-26 20:21:32',NULL,'2026-05-26 20:21:28','2026-05-26 20:21:32'),(258,'App\\Models\\Utilisateur',11,'auth_token','f7ead9eb88ea8f53626b4cc7a79d6cf3376fd10aa8827f05618aa1b1705b8747','[\"*\"]','2026-05-26 20:21:56',NULL,'2026-05-26 20:21:51','2026-05-26 20:21:56'),(259,'App\\Models\\Utilisateur',11,'auth_token','7caf7d1b7e343d1be314758404d355990a4b960936024967070836c818e29d85','[\"*\"]','2026-05-26 20:25:58',NULL,'2026-05-26 20:25:44','2026-05-26 20:25:58'),(260,'App\\Models\\Utilisateur',11,'auth_token','fea33837fcbc659352c9e154e2375c1f4baa8281c224a11db1b9598f27ea51d0','[\"*\"]','2026-05-26 20:28:31',NULL,'2026-05-26 20:28:24','2026-05-26 20:28:31'),(261,'App\\Models\\Utilisateur',10,'auth_token','276ceeb8f1bfbd489b3c7ae960ed9cfbe5e143aa53dd107c19469a03fc65e2d5','[\"*\"]','2026-05-26 20:28:55',NULL,'2026-05-26 20:28:32','2026-05-26 20:28:55'),(262,'App\\Models\\Utilisateur',10,'auth_token','4f762375cf3dbf18d6aa9695f436ec1bcc222787f2ff1b3e0007d2015727f3bd','[\"*\"]','2026-05-27 18:01:28',NULL,'2026-05-27 18:00:50','2026-05-27 18:01:28'),(263,'App\\Models\\Utilisateur',8,'auth_token','e9f5f8fc5333d4b4d76208cff5e0936b6c56450740af002a2663d627ed4e2837','[\"*\"]','2026-05-27 18:06:52',NULL,'2026-05-27 18:06:43','2026-05-27 18:06:52'),(264,'App\\Models\\Utilisateur',8,'auth_token','977298d0c79574fddaa05d2469bf247fcb1b3b7dffedef6939a2232ad63d084a','[\"*\"]','2026-05-27 18:35:49',NULL,'2026-05-27 18:35:40','2026-05-27 18:35:49'),(265,'App\\Models\\Utilisateur',8,'auth_token','1a82beb95b6739c3637ea600385c91a9777090ecec48cdf29b5c95eee8fb0ed9','[\"*\"]','2026-05-28 12:59:00',NULL,'2026-05-28 12:58:52','2026-05-28 12:59:00'),(266,'App\\Models\\Utilisateur',8,'auth_token','686d2f288a9c281236c26e0eb3c5cb6100cfb5bef2917e7131d311518c6bbb9e','[\"*\"]','2026-05-28 17:50:26',NULL,'2026-05-28 17:50:19','2026-05-28 17:50:26'),(267,'App\\Models\\Utilisateur',8,'auth_token','0c9730fc933c174e091f129c966b2e36c93f749d8654d151bd4ee8e09235b1dd','[\"*\"]','2026-05-28 18:10:41',NULL,'2026-05-28 18:09:30','2026-05-28 18:10:41'),(268,'App\\Models\\Utilisateur',8,'auth_token','60c20d6b43bf8586379151ad3d2c9d091d40e7cea117df4eb40db047af3aa2fe','[\"*\"]','2026-05-28 18:33:43',NULL,'2026-05-28 18:33:35','2026-05-28 18:33:43'),(269,'App\\Models\\Utilisateur',8,'auth_token','cb2d679193174064f1fca6fa12d08b3c7dbe94a0227a06b23b946605f389f7e5','[\"*\"]','2026-05-28 18:35:31',NULL,'2026-05-28 18:35:24','2026-05-28 18:35:31'),(270,'App\\Models\\Utilisateur',8,'auth_token','acb446d631a0e7e16b130fd5d521b238c69d2d5c82c155301dfc2de0ec9518b5','[\"*\"]','2026-05-28 19:17:02',NULL,'2026-05-28 19:16:54','2026-05-28 19:17:02'),(271,'App\\Models\\Utilisateur',8,'auth_token','8984c3b6c12881dafca9a1261311ebedcce5579d28538f06c86aeff4e39d1045','[\"*\"]','2026-05-28 20:48:54',NULL,'2026-05-28 20:48:45','2026-05-28 20:48:54'),(272,'App\\Models\\Utilisateur',8,'auth_token','615d34a43688a3b454b9ce6bec34da5e73a06179558a00dbf809b385f6681388','[\"*\"]','2026-05-29 09:59:47',NULL,'2026-05-29 09:57:59','2026-05-29 09:59:47'),(273,'App\\Models\\Utilisateur',12,'auth_token','046b91918913f8776857ea64ae3de03a80ddfcea5f649551474a03bd5c96f086','[\"*\"]','2026-05-29 10:00:28',NULL,'2026-05-29 10:00:08','2026-05-29 10:00:28'),(274,'App\\Models\\Utilisateur',11,'auth_token','5fc04ea4eada04b5d36cd22bb135930b1d7c17d4d1b3d19519795647cf675876','[\"*\"]','2026-05-29 10:00:48',NULL,'2026-05-29 10:00:40','2026-05-29 10:00:48'),(275,'App\\Models\\Utilisateur',8,'auth_token','eedbaa83df1edb34630cb3aaefa88a24579117a8d0fb7ad96f2474f4cc706093','[\"*\"]','2026-05-29 10:09:59',NULL,'2026-05-29 10:09:47','2026-05-29 10:09:59'),(276,'App\\Models\\Utilisateur',9,'auth_token','5634734b04f83ead23dd36be638c9346782f82370c9fa51cbe131cc86183d771','[\"*\"]','2026-05-29 10:11:15',NULL,'2026-05-29 10:11:09','2026-05-29 10:11:15'),(277,'App\\Models\\Utilisateur',8,'auth_token','2e80ef717a5c2196096348ab20d65f0c55cdb379600cd024defbd8f73613c484','[\"*\"]','2026-05-29 10:22:02',NULL,'2026-05-29 10:21:49','2026-05-29 10:22:02'),(278,'App\\Models\\Utilisateur',9,'auth_token','2b6fcabe5cb633f9af5f9f63b8ff55bfa4969d9e5417f8491b9d6aaf920ce9f8','[\"*\"]','2026-05-29 10:22:56',NULL,'2026-05-29 10:22:47','2026-05-29 10:22:56'),(279,'App\\Models\\Utilisateur',9,'auth_token','b53f7f5fd6e76e4885b6c586bd2c9571a38a7334070638c50b3703f4d0ae05c7','[\"*\"]','2026-05-29 10:58:27',NULL,'2026-05-29 10:58:22','2026-05-29 10:58:27'),(280,'App\\Models\\Utilisateur',8,'auth_token','42d1b586a4ab1a3f8534241a4a574fcb3876f16ee4b9c246e9ad80f393145b66','[\"*\"]','2026-05-31 17:44:12',NULL,'2026-05-31 17:43:48','2026-05-31 17:44:12'),(281,'App\\Models\\Utilisateur',8,'auth_token','3f4345a9733576acd40475cf2437c3cc7f6943e7e28e0212b6dd94c866febb8d','[\"*\"]','2026-05-31 17:46:23',NULL,'2026-05-31 17:44:30','2026-05-31 17:46:23'),(282,'App\\Models\\Utilisateur',8,'auth_token','6242ca08c6fefb75507131fc95b4bba0080f93081f5138cc110823651d2e8b06','[\"*\"]','2026-05-31 17:53:07',NULL,'2026-05-31 17:52:57','2026-05-31 17:53:07'),(283,'App\\Models\\Utilisateur',9,'auth_token','d4d330debe6596c2c2bbb8f1310d6ddadaed97bf7f499167ccfb4709e0d99f1b','[\"*\"]','2026-05-31 18:14:08',NULL,'2026-05-31 18:12:51','2026-05-31 18:14:08'),(284,'App\\Models\\Utilisateur',8,'auth_token','2571157649b82a3a9a7c553216ef420774907d172c64d063b037043cc9641cb1','[\"*\"]','2026-05-31 18:14:18',NULL,'2026-05-31 18:14:11','2026-05-31 18:14:18'),(285,'App\\Models\\Utilisateur',9,'auth_token','130894f1544dcf544d15603959f1be79c945248d6a3236915cbee72ba568ecad','[\"*\"]','2026-05-31 18:23:56',NULL,'2026-05-31 18:23:52','2026-05-31 18:23:56'),(286,'App\\Models\\Utilisateur',9,'auth_token','1bc99e97862cefd8077eab8cb36516eb4acda547ab244259b6dc0452b3c7c41d','[\"*\"]','2026-05-31 18:44:48',NULL,'2026-05-31 18:24:10','2026-05-31 18:44:48'),(287,'App\\Models\\Utilisateur',9,'auth_token','688bedc1ba735466bb9499873acd13e130cf0956a2ea49295ee9d14428bd5151','[\"*\"]','2026-05-31 18:53:54',NULL,'2026-05-31 18:53:49','2026-05-31 18:53:54'),(288,'App\\Models\\Utilisateur',9,'auth_token','f07d925e500a8ad5bfb4add571a34beececabaa9de4c7cd0ff81658a50aafa10','[\"*\"]','2026-05-31 19:02:48',NULL,'2026-05-31 18:55:16','2026-05-31 19:02:48'),(289,'App\\Models\\Utilisateur',9,'auth_token','5eacd392748bb8e68d7b8881ffc46ae4d7ab4ee2cdb85038ee46279b6f593e3a','[\"*\"]','2026-05-31 19:04:40',NULL,'2026-05-31 19:04:09','2026-05-31 19:04:40'),(290,'App\\Models\\Utilisateur',9,'auth_token','37611b585c0d603707bcd340410f58bd1c77660acd52026e94ff31213da0407c','[\"*\"]','2026-05-31 19:16:43',NULL,'2026-05-31 19:04:55','2026-05-31 19:16:43'),(291,'App\\Models\\Utilisateur',11,'auth_token','5b9a12b9bb469d426d557349c1305b06579656398c5a6dde64e7da5b964e5f27','[\"*\"]','2026-05-31 19:17:20',NULL,'2026-05-31 19:17:16','2026-05-31 19:17:20'),(292,'App\\Models\\Utilisateur',8,'auth_token','2d97f9af2d9b8990e7bb41f8944c24f1807213c12cdf9ba83a4becb13881ad4f','[\"*\"]','2026-05-31 19:18:57',NULL,'2026-05-31 19:17:29','2026-05-31 19:18:57'),(293,'App\\Models\\Utilisateur',17,'auth_token','f72ac3981ef44bfb5a79e83f670a387f61995213461c32500c115adef46fdce8','[\"*\"]','2026-05-31 19:19:34',NULL,'2026-05-31 19:19:03','2026-05-31 19:19:34'),(294,'App\\Models\\Utilisateur',14,'auth_token','eb598adcc9192d32b1e434ae432dfb3831a21c1d44f0febffd0bb484a0ab6aab','[\"*\"]','2026-05-31 19:20:01',NULL,'2026-05-31 19:19:45','2026-05-31 19:20:01'),(295,'App\\Models\\Utilisateur',8,'auth_token','adf8cd7a53bfb4836cc64093552619050dc007fabb2a3ae466d24ccecf46ae07','[\"*\"]','2026-06-01 05:53:13',NULL,'2026-06-01 05:53:05','2026-06-01 05:53:13'),(296,'App\\Models\\Utilisateur',8,'auth_token','baea74dea9c548066ea405a40028f167d8a4319d4afc325b4b3d59243d681ee2','[\"*\"]','2026-06-01 06:02:12',NULL,'2026-06-01 06:02:05','2026-06-01 06:02:12'),(297,'App\\Models\\Utilisateur',9,'auth_token','ef80f8ffd7d40d0f6901f5d00e374363808ef9e3dedc8743681438bf9dccd851','[\"*\"]','2026-06-01 06:06:49',NULL,'2026-06-01 06:06:45','2026-06-01 06:06:49');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programmes_annuels`
--

DROP TABLE IF EXISTS `programmes_annuels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programmes_annuels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `annee` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `club_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programmes_annuels_club_id_foreign` (`club_id`),
  CONSTRAINT `programmes_annuels_club_id_foreign` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programmes_annuels`
--

LOCK TABLES `programmes_annuels` WRITE;
/*!40000 ALTER TABLE `programmes_annuels` DISABLE KEYS */;
/*!40000 ALTER TABLE `programmes_annuels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('e0Jf35Wlv9THymVL4tpyP2d1qwbds1cnD3QfEue5',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 OPR/130.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1JRNjF2THpnNmJIN2hhdm9VeEtMYUxSTmpvbHh2VThMcUlDWHVLWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1778337668);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `dateCreation` date DEFAULT NULL,
  `statut` enum('actif','inactif') NOT NULL DEFAULT 'actif',
  `role` enum('administrateur','responsable_vie_estudiantine','responsable_club','membre_autorise') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `club_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `utilisateurs_email_unique` (`email`),
  KEY `utilisateurs_club_id_foreign` (`club_id`),
  CONSTRAINT `utilisateurs_club_id_foreign` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (8,'Admin','FSBM','admin@fsbm.ma','$2y$12$lROfSQU4tWWPbgUKQUHJReBq8vwmLsX6BuHYdMhTaNKgnkA3TKh8G',NULL,NULL,'actif','administrateur','2026-05-11 17:47:05','2026-05-24 12:04:31',NULL),(9,'Responsable','Qoran','qoran@fsbm.ma','$2y$12$ldB3A8VP0e0itW3OipoFzuNEVFRfuL4x7YfqphQZSFa6Akppdj5ky',NULL,NULL,'actif','responsable_club','2026-05-22 20:44:31','2026-05-24 11:28:56',21),(10,'infinity','space','infinity.space.fsbm@fsbm.ma','$2y$12$/rqUKcljSRuvmUT8VIdXj..kN1Kc8BPm9DWYA9RAu0kUP.7SCEjmW',NULL,NULL,'actif','responsable_club','2026-05-24 16:12:44','2026-05-28 18:10:40',3),(11,'EL MIR','Hasnae','helios@fsbm.ma','$2y$12$gZYyucVwryP4VgUC8LS6Nu3tVNbt3hks9Zspur0nWYTRiqroLfoHm',NULL,NULL,'actif','responsable_club','2026-05-24 18:06:14','2026-05-24 18:06:14',19),(12,'Responsable','CtrlArt','ctrlart@fsbm.ma','$2y$12$N2ZAjdwZmgxhTdg5OB.h1uEZVZHA4OHprsjxdl0sHTGEkHySARuHW',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-29 09:58:56',1),(13,'Responsable','SciencesTech','sciences.tech@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',2),(14,'Responsable','ABCJunior','abc.junior@fsbm.ma','$2y$12$7oIa0/vMf33pyRv7vpBKQO8eUGf1.78JwQAbx456ehtUMgBwgoXia',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-31 19:18:33',4),(15,'Responsable','SoftSkills','soft.skills@fsbm.ma','$2y$12$y/oaGFogMYU1kQ.DBmecCOO./VHpjM9AQKr0N4Nc5JUyIo3mwwuFi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-29 09:59:11',5),(16,'Responsable','Cinema','cinema@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',6),(17,'Responsable','IbnKhaldoun','ibn.khaldoun@fsbm.ma','$2y$12$XRA7Yy/Mojcw17fkSciFvuDER12oruzmNEfUE.UsWkVLBcQx5WZgu',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-31 19:18:56',7),(18,'Responsable','Digital','digital.cyber@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',8),(19,'Responsable','Innovation','innovation.cik@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',9),(20,'Responsable','AIDev','ai.dev@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',10),(21,'Responsable','Robotique','robotique@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',11),(22,'Responsable','SanteSport','sante.sport@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',12),(23,'Responsable','ArtIdentite','art.identite@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',13),(24,'Responsable','EducationSportive','education.sportive@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',14),(25,'Responsable','SanteEnv','sante.env@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',15),(26,'Responsable','Internationaux','etudiants.inter@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',16),(27,'Responsable','Lions','lions@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',17),(28,'Responsable','Epik','epik.leaders@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',18),(29,'Responsable','Helios','helios.fsbm@fsbm.ma','$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-24 20:12:53',19),(30,'Responsable','Enactus','enactus@fsbm.ma','$2y$12$s0AGNE19rcTPfI/Bal8o5u5eVsQqSN3opn1Y3N/PHRiym74Bia2sq',NULL,NULL,'actif','responsable_club','2026-05-24 20:12:53','2026-05-29 09:59:46',20);
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-01 12:36:06
