-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for techtrial
CREATE DATABASE IF NOT EXISTS `techtrial` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `techtrial`;

-- Dumping structure for table techtrial.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table techtrial.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table techtrial.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table techtrial.migrations: ~6 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2021_06_25_185126_property', 1),
	(5, '2021_06_25_191223_property_type', 1),
	(6, '2021_06_25_223234_page', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table techtrial.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table techtrial.pages: ~1 rows (approximately)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `page`, `created_at`, `updated_at`) VALUES
	(1, 2, '2021-06-26 01:35:35', '2021-06-26 01:35:35');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table techtrial.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table techtrial.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table techtrial.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `county` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bedrooms` int(11) NOT NULL,
  `bathrooms` int(11) NOT NULL,
  `page` int(11) NOT NULL DEFAULT '1',
  `price` double NOT NULL,
  `type` tinyint(4) NOT NULL,
  `for_sale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table techtrial.properties: ~31 rows (approximately)
DELETE FROM `properties`;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `uuid`, `county`, `country`, `town`, `description`, `address`, `image`, `thumbnail`, `latitude`, `longitude`, `bedrooms`, `bathrooms`, `page`, `price`, `type`, `for_sale`, `created_at`, `updated_at`) VALUES
	(1, 'a3592473-2f62-409e-a81c-ed860f754db1', 'FCT', 'Nigeria', 'Ajaokuta', 'ddddddddd', 'FCT', 'http://techtrial.test/images/1624671294.png', 'http://techtrial.test/thumbnails/1624671294.png', NULL, NULL, 1, 1, 1, 150000, 4, 'sale', '2021-06-26 01:34:54', '2021-06-26 01:34:54'),
	(2, 'fb6dd119-9661-3101-aba5-47ba67f0f9fb', 'South Carolina', 'Greenland', 'Osvaldofurt', 'Iste dolore magnam velit fuga. Libero officiis expedita autem. Et omnis harum a facilis. Delectus dolores nihil hic et non quia.', '3234 Wunsch Fall', 'https://lorempixel.com/1000/400/city/?31072', 'https://lorempixel.com/100/100/city/?42307', '-42.5481820', '116.3011210', 4, 6, 2, 1490480, 4, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(3, 'beabb50d-3e44-3167-b21c-8921b762b262', 'Nevada', 'Liberia', 'Schusterland', 'Rerum sunt quam laudantium voluptate quis deleniti perspiciatis. Facilis commodi libero et nesciunt omnis. Provident molestiae minus adipisci.', '449 Gutmann Club', 'https://lorempixel.com/1000/400/city/?11433', 'https://lorempixel.com/100/100/city/?60756', '66.7011080', '-114.6893660', 7, 1, 2, 790959, 7, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(4, '5cf40a3a-58e5-31a1-ae57-57aadb0c2cc1', 'New Mexico', 'Haiti', 'Alanisstad', 'Voluptates quam libero sapiente occaecati accusamus eius numquam. Consequuntur placeat culpa hic vero debitis quos.', '5936 Donnelly Mount Suite 520', 'https://lorempixel.com/1000/400/city/?20016', 'https://lorempixel.com/100/100/city/?12072', '12.3956120', '12.9754700', 4, 1, 2, 2101798, 2, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(5, 'ca254ba9-e7d9-33f4-8bd4-3797bcdfb0bf', 'Virginia', 'Philippines', 'Port Deja', 'Dolores numquam vel in magni et iure quos. Vel quasi et consectetur labore. Odit facere corporis doloremque quisquam molestias labore expedita delectus. Optio velit sequi optio provident cupiditate reiciendis.', '79391 Elta Crescent', 'https://lorempixel.com/1000/400/city/?14899', 'https://lorempixel.com/100/100/city/?84057', '47.1229120', '95.3094500', 10, 3, 2, 348997, 3, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(6, '1e3d9836-09f0-3093-8540-20714ae4e551', 'South Dakota', 'Chile', 'Gardnerview', 'Quo dolores autem reiciendis quia laborum maxime. Aut et in similique. Doloremque quas suscipit id.', '860 Jovany Plaza', 'https://lorempixel.com/1000/400/city/?71100', 'https://lorempixel.com/100/100/city/?43638', '69.7915900', '-16.7928730', 9, 5, 2, 1730425, 6, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(7, 'f5862dd2-ecd1-3833-9bed-b76e73baa738', 'Texas', 'Armenia', 'Connview', 'Et et dolor voluptatem magni quia. Odio veniam voluptatibus quia iusto voluptatem omnis. Officia iure vel aut ut.', '39181 Williamson Tunnel', 'https://lorempixel.com/1000/400/city/?14375', 'https://lorempixel.com/100/100/city/?81733', '-79.4867620', '-44.0157120', 12, 7, 2, 381114, 7, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(8, 'e9045f60-2fc9-3ba8-9c75-269ef3f3064f', 'Maryland', 'India', 'West Ebonyburgh', 'Recusandae sint repudiandae optio officia nihil molestias non. Maiores consequatur corrupti officiis reiciendis neque saepe aut. Harum odio enim pariatur et repellat ullam est.', '444 Gorczany Place Suite 049', 'https://lorempixel.com/1000/400/city/?57925', 'https://lorempixel.com/100/100/city/?87180', '15.2802600', '-91.8788030', 7, 9, 2, 2282222, 4, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(9, 'dd3bd68d-88a4-344a-af08-23a283641060', 'Oklahoma', 'Reunion', 'Lake Virginiestad', 'At aut a officiis voluptatem saepe perferendis aliquam est. Impedit et quia quo.', '49525 Breitenberg Squares Apt. 647', 'https://lorempixel.com/1000/400/city/?77013', 'https://lorempixel.com/100/100/city/?49802', '79.9485630', '90.3439860', 7, 6, 2, 913160, 4, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(10, 'f949ec2d-46c0-34ab-a102-f037db0aceef', 'Mississippi', 'Azerbaijan', 'Maximusland', 'Libero dolores accusantium qui voluptas laborum. Velit soluta hic ratione quos et eum. Earum vero soluta eos et aut autem. Placeat laborum beatae dolor minus.', '2083 Emerald Common', 'https://lorempixel.com/1000/400/city/?89163', 'https://lorempixel.com/100/100/city/?14403', '71.4949890', '-64.7613250', 8, 6, 2, 403260, 5, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(11, '6b57f3e4-b61d-3394-8511-994ac4131e0b', 'Wyoming', 'British Indian Ocean Territory (Chagos Archipelago)', 'West Darron', 'Omnis sint omnis voluptates doloremque suscipit commodi id. Est rerum aut at voluptatem accusantium cupiditate. Excepturi iste molestiae qui sed esse ad tempore.', '885 Schroeder Estates Suite 097', 'https://lorempixel.com/1000/400/city/?59488', 'https://lorempixel.com/100/100/city/?86143', '83.3851970', '-63.9672240', 5, 1, 2, 1508400, 1, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(12, '85ba8046-b7f1-39c5-b5a3-c74f6eeaa6f8', 'West Virginia', 'Pitcairn Islands', 'Sandrineport', 'Quibusdam iusto dolore quidem in consequatur. Voluptatem aperiam aliquid sed nam voluptas impedit dignissimos. Quidem ut quia cupiditate. Omnis est voluptatem sint. Corrupti ea eligendi consectetur et.', '3203 Bernier Station', 'https://lorempixel.com/1000/400/city/?63115', 'https://lorempixel.com/100/100/city/?91020', '-28.4544480', '33.1459330', 4, 3, 2, 1618798, 1, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(13, '24bc9c51-b2ad-3b39-847b-6673383c93d7', 'Rhode Island', 'Central African Republic', 'Hermistonview', 'Ipsa laboriosam sint minima eaque eum exercitationem. Non consequatur voluptatibus quos molestias illo. Consectetur exercitationem sit et architecto dicta. Rem alias totam aut est est repellendus.', '31346 Nadia Street Apt. 562', 'https://lorempixel.com/1000/400/city/?80373', 'https://lorempixel.com/100/100/city/?25637', '-62.0784690', '-143.5339430', 7, 3, 2, 539050, 7, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(14, '0921b618-9ec4-3a49-88e5-959c63659e42', 'Kansas', 'Bahamas', 'East Elisabeth', 'Voluptatibus corrupti rem ut veritatis molestiae nesciunt corrupti. Voluptates velit consequatur id dolor. Non blanditiis voluptas dicta et eos facere est. Rerum maiores corporis aut consequatur mollitia porro libero.', '726 Ryan Causeway', 'https://lorempixel.com/1000/400/city/?74319', 'https://lorempixel.com/100/100/city/?54190', '-36.7584150', '144.3869420', 5, 8, 2, 1610041, 4, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(15, '15538d49-56f5-387e-949a-47301403e8a6', 'Colorado', 'Malta', 'Jacobiland', 'Est aut maiores et. Veniam sed ipsam eum reiciendis similique corrupti quas.', '631 Esperanza River Apt. 526', 'https://lorempixel.com/1000/400/city/?95304', 'https://lorempixel.com/100/100/city/?43484', '-37.7426630', '62.2185350', 12, 4, 2, 1877444, 1, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(16, '40781b42-5d0e-347a-8ad2-92fae44bc424', 'Idaho', 'Estonia', 'New Jaronfort', 'Optio quis sunt ea et eum. Quia et sint eos molestias nulla laudantium. Inventore aut reprehenderit sed quo enim praesentium.', '713 Cronin Overpass', 'https://lorempixel.com/1000/400/city/?64354', 'https://lorempixel.com/100/100/city/?38495', '-76.6506890', '-119.3376140', 11, 7, 2, 2397068, 2, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(17, '086036ed-8676-33d6-9684-cad5fcedd014', 'Hawaii', 'Reunion', 'West Jordihaven', 'Deserunt sit maxime unde sunt sed repellendus expedita. Quia magni et rem omnis aliquam dolores quas. Quidem est distinctio id corrupti.', '523 Nitzsche Road', 'https://lorempixel.com/1000/400/city/?20032', 'https://lorempixel.com/100/100/city/?67444', '-7.2069650', '-150.0870890', 2, 3, 2, 1824087, 6, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(18, 'ef197435-2947-3e1e-a1cb-939a9a03c615', 'Idaho', 'Belize', 'Alenaport', 'Nihil eum blanditiis quia nostrum voluptatem et. Dolorem impedit asperiores consequatur dolores voluptates. Natus et omnis pariatur quasi est quia.', '1484 Spinka Loaf Apt. 941', 'https://lorempixel.com/1000/400/city/?32606', 'https://lorempixel.com/100/100/city/?11546', '-41.6115980', '-162.5872830', 3, 2, 2, 2802148, 1, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(19, '657c3ab8-0bad-3c8a-8463-7b5042cb2137', 'Kansas', 'New Caledonia', 'Treymouth', 'Qui voluptas quis vel qui suscipit a. Porro officia tempora ipsa. Quibusdam omnis aut molestiae et.', '4613 Alysson Circles', 'https://lorempixel.com/1000/400/city/?96379', 'https://lorempixel.com/100/100/city/?98389', '54.9688960', '79.3136740', 10, 3, 2, 1397495, 5, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(20, '410fe435-655b-3a4b-806f-e34446de500d', 'Kansas', 'Turks and Caicos Islands', 'West Newton', 'Explicabo quibusdam sunt nobis magni. Sit ut id velit quibusdam distinctio facere qui. Reprehenderit ut omnis nihil assumenda excepturi enim. Aut reiciendis voluptates nobis et in.', '86155 Lambert Point', 'https://lorempixel.com/1000/400/city/?26417', 'https://lorempixel.com/100/100/city/?51817', '-20.5429120', '118.6494330', 12, 3, 2, 635951, 5, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(21, 'e62b3322-6522-34f8-9608-553c693a2b51', 'Minnesota', 'Cameroon', 'Roobborough', 'Libero necessitatibus voluptas esse et accusantium et. Est aut voluptatibus saepe corporis. Et sunt porro optio quo earum magni voluptas. Laboriosam error eum cumque ad possimus. Incidunt corrupti doloribus quia libero.', '853 Ryan Manor', 'https://lorempixel.com/1000/400/city/?47890', 'https://lorempixel.com/100/100/city/?20687', '43.2334710', '-85.2034570', 1, 1, 2, 727139, 7, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(22, '0068b400-03ba-33e1-bc05-415ea5f2b300', 'Illinois', 'Uganda', 'New Dovieville', 'Eum et et optio illum error dolore a rerum. Libero sint consequatur sint ut saepe quam aperiam. Reiciendis blanditiis nesciunt illum cumque magni recusandae.', '82125 Schinner Trail', 'https://lorempixel.com/1000/400/city/?42177', 'https://lorempixel.com/100/100/city/?69718', '-63.5500940', '-179.1704440', 6, 7, 2, 301933, 7, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(23, '36b5a17c-ee7b-3241-8f4d-250b06b51960', 'Indiana', 'Ecuador', 'Lake Harveytown', 'Dolorem nihil aut commodi iste. Veniam quis nostrum reiciendis aut provident qui. Ea tenetur molestias repellendus modi suscipit voluptas ipsum dolor.', '897 Timmy Rue Suite 085', 'https://lorempixel.com/1000/400/city/?73593', 'https://lorempixel.com/100/100/city/?72861', '13.6966490', '179.2390960', 5, 8, 2, 2850766, 1, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(24, 'dbc4ca25-4457-35bf-ac4e-597e86da8a96', 'Maryland', 'Bosnia and Herzegovina', 'West Cynthia', 'Atque fugiat quod voluptate. Iste est iusto veniam. Voluptas enim optio unde.', '8478 Wisozk Walks Apt. 315', 'https://lorempixel.com/1000/400/city/?89409', 'https://lorempixel.com/100/100/city/?81198', '69.2847980', '-97.6168490', 1, 7, 2, 2413098, 2, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(25, 'b15f44aa-16e3-3132-a7ed-d797b15f3937', 'South Carolina', 'Niger', 'Jeffmouth', 'Incidunt id possimus dolore nihil vel eum. Maiores fuga non quae voluptatem tempore neque. Doloribus debitis commodi maxime possimus voluptas. Blanditiis quas deserunt omnis omnis consectetur omnis harum provident.', '42820 Roob Landing', 'https://lorempixel.com/1000/400/city/?37900', 'https://lorempixel.com/100/100/city/?18005', '42.1619860', '-131.0378240', 6, 7, 2, 145773, 4, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(26, '2d825a4e-df24-302e-8b3e-92ce0466764a', 'Nebraska', 'Lesotho', 'West Maggie', 'Quasi autem minus totam impedit consectetur unde consectetur. Quod beatae occaecati in est aut distinctio. Omnis velit voluptatum voluptas ut porro praesentium.', '36441 Schiller Mill Apt. 573', 'https://lorempixel.com/1000/400/city/?78112', 'https://lorempixel.com/100/100/city/?42859', '14.6534860', '29.5543900', 11, 2, 2, 2429756, 6, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(27, '62392757-082f-358a-8d44-d4e12df6e465', 'Pennsylvania', 'Turkey', 'East Jadaton', 'Expedita eveniet voluptas fugit asperiores deleniti. Dicta sit velit aliquid veniam sed enim. Perspiciatis impedit error nisi voluptas sed sunt sit facilis. Facilis nam qui numquam incidunt rerum amet.', '43955 Eli Oval', 'https://lorempixel.com/1000/400/city/?39796', 'https://lorempixel.com/100/100/city/?45957', '14.7569220', '-57.2872580', 6, 4, 2, 1962851, 7, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(28, 'b523e45c-6b6b-3434-99b0-7531546a26bd', 'Texas', 'Taiwan', 'South Margaret', 'Consectetur voluptatem ut consectetur eius ratione voluptas. Expedita aliquid et qui sunt. Ut recusandae atque sit laudantium. Facere aut eum dolorem a autem sit.', '7668 Heath Port', 'https://lorempixel.com/1000/400/city/?40009', 'https://lorempixel.com/100/100/city/?96984', '-43.0049430', '0.6527520', 8, 4, 2, 1983141, 5, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(29, 'ccd2f872-9df7-357c-b5eb-60b89441df1d', 'Alaska', 'Guinea', 'Dejonmouth', 'Sed consequuntur magnam dolores itaque exercitationem consectetur quasi magni. Nemo beatae dolorem voluptas totam est labore in. Beatae necessitatibus tempore ut voluptas ut unde. Eaque recusandae a sapiente nesciunt eum dolorum. Consequatur deserunt repudiandae ea dolorem ipsum.', '407 Quitzon Freeway', 'https://lorempixel.com/1000/400/city/?70788', 'https://lorempixel.com/100/100/city/?31471', '61.0875680', '-46.0068670', 9, 2, 2, 1893051, 3, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(30, 'e6839acb-643a-38af-8208-190322317e39', 'Connecticut', 'Canada', 'Port Roberta', 'Distinctio tempora libero occaecati dolor dolorem aliquid enim. Tenetur consequuntur et commodi qui quia dolorem officiis doloribus. Enim a mollitia numquam voluptatem tempora est optio. Ut et enim deleniti dolorum qui est possimus.', '8411 Dawson Plains Suite 983', 'https://lorempixel.com/1000/400/city/?77144', 'https://lorempixel.com/100/100/city/?59814', '-79.7078110', '2.2161050', 12, 1, 2, 888197, 2, 'sale', '2020-01-08 12:55:38', '2020-01-08 12:55:38'),
	(31, '1ec2adff-54c1-3339-ba2d-627960c351f9', 'Massachusetts', 'Vanuatu', 'Wuckertmouth', 'Error sed aliquid similique tempora incidunt molestiae. Neque et corrupti beatae et voluptas molestiae natus.', '477 Garnett Springs', 'https://lorempixel.com/1000/400/city/?53176', 'https://lorempixel.com/100/100/city/?48460', '-45.5882370', '122.9256240', 8, 1, 2, 240766, 6, 'rent', '2020-01-08 12:55:38', '2020-01-08 12:55:38');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Dumping structure for table techtrial.property_types
CREATE TABLE IF NOT EXISTS `property_types` (
  `id` int(11) NOT NULL,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table techtrial.property_types: ~7 rows (approximately)
DELETE FROM `property_types`;
/*!40000 ALTER TABLE `property_types` DISABLE KEYS */;
INSERT INTO `property_types` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
	(4, 'Terraced', 'Terraced houses are common in old industrial towns and cities such as Manchester, Bath and areas of central London. Terraced houses became extremely popular to provide high-density accommodation for the working class in the 19th century. Terraced houses are structurally built the same and both sides of each house shares walls with neighbours.', '2021-06-26 01:35:35', '2021-06-26 01:35:35'),
	(7, 'Bungalow', 'The word ‘bungalow’, originates from the Indian word ‘Bangla’, which in the 19th century referred to houses that were built in a Bengali style. Houses that were made in Bengali style were traditionally very small and only one storey high and detached.', '2021-06-26 01:35:35', '2021-06-26 01:35:35'),
	(2, 'Detatched', 'Detached houses are more likely to be the property types we all dream of owning. They tend to be more private as they are single standing properties, and do not share walls with other houses. Due to its privacy, detached houses are a lot more expensive and high in demand.', '2021-06-26 01:35:35', '2021-06-26 01:35:35'),
	(3, 'Semi-detached', 'Semi-detached properties are a lot more common for homeowners to purchase/rent. There are a lot more semi-detached properties in the UK as they save a lot of space as they are houses paired together by a common wall. Semi-detached properties are fantastic options for homeowners to extend at the back and side and have an element of privacy too.', '2021-06-26 01:35:35', '2021-06-26 01:35:35'),
	(6, 'Cottage', 'It says it in the name. It is the end of a terraced house and only one side shares a common wall, while the other is detached.', '2021-06-26 01:35:35', '2021-06-26 01:35:35'),
	(5, 'End of Terrace', 'It says it in the name. It is the end of a terraced house and only one side shares a common wall, while the other is detached.', '2021-06-26 01:35:35', '2021-06-26 01:35:35'),
	(1, 'Flat', 'rom studio flats, to maisonettes and 2-storey flats, a flat is a living area that is self-contained and in one part of a building. A building is usually split into individual flats and the communal areas are those that are shared e.g. lifts, stairwells, receptions etc.', '2021-06-26 01:35:35', '2021-06-26 01:35:35');
/*!40000 ALTER TABLE `property_types` ENABLE KEYS */;

-- Dumping structure for table techtrial.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table techtrial.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
