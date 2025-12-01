-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2025 at 08:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scm_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

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
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_01_063816_create_products_table', 1),
(5, '2025_12_01_063835_create_suppliers_table', 1),
(6, '2025_12_01_063846_create_warehouses_table', 1),
(7, '2025_12_01_063856_create_purchases_table', 1),
(8, '2025_12_01_063906_create_sales_table', 1),
(9, '2025_12_01_064956_create_stocks_table', 1),
(10, '2025_12_01_071344_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `unit` varchar(255) NOT NULL DEFAULT 'pcs',
  `purchase_price` decimal(10,2) NOT NULL,
  `sales_price` decimal(10,2) NOT NULL,
  `min_stock_alert` int(11) NOT NULL DEFAULT 10,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `unit`, `purchase_price`, `sales_price`, `min_stock_alert`, `description`, `created_at`, `updated_at`) VALUES
(1, 'dolore Light', 'SKU-10900', 'meter', 140.00, 1371.00, 6, 'Quo quasi quam dolores officiis et.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(2, 'sit Max', 'SKU-55925', 'pcs', 334.00, 837.00, 5, 'Nostrum quia quia tenetur qui in praesentium.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(3, 'voluptatem Pro', 'SKU-80501', 'pcs', 298.00, 1184.00, 18, 'Et voluptate aut facilis consectetur vitae aut odit.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(4, 'optio Pro', 'SKU-30273', 'pcs', 316.00, 894.00, 6, 'Quis voluptatibus deleniti sint.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(5, 'inventore Max', 'SKU-85687', 'pcs', 335.00, 791.00, 20, 'Tenetur enim harum corporis voluptatibus qui sequi.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(6, 'nisi Light', 'SKU-73751', 'kg', 369.00, 1302.00, 6, 'Alias esse animi et est.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(7, 'libero Max', 'SKU-90889', 'kg', 452.00, 1399.00, 7, 'Quia et qui animi ipsa optio ea veritatis quam.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(8, 'nam Light', 'SKU-98636', 'meter', 149.00, 1490.00, 19, 'Quis asperiores quasi ut sunt doloribus.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(9, 'nobis Light', 'SKU-71045', 'pcs', 222.00, 1370.00, 6, 'Non ut ut pariatur.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(10, 'mollitia Pro', 'SKU-987', 'meter', 412.00, 602.00, 15, 'Non voluptas officiis vel doloremque suscipit quae.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(11, 'architecto Light', 'SKU-85159', 'pcs', 349.00, 1488.00, 9, 'Quo molestiae tempora odio amet labore tenetur ad.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(12, 'voluptatibus Pro', 'SKU-36683', 'meter', 196.00, 982.00, 10, 'Quibusdam modi autem ullam vitae atque fugiat ab iure.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(13, 'ut Light', 'SKU-57197', 'pcs', 279.00, 744.00, 20, 'Consectetur hic rerum ut incidunt sed.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(14, 'alias Light', 'SKU-39008', 'meter', 157.00, 865.00, 19, 'Et quo fugit earum cupiditate et et velit.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(15, 'placeat Pro', 'SKU-32854', 'kg', 398.00, 1330.00, 17, 'Maiores ex rem accusamus at quis.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(16, 'perferendis Pro', 'SKU-10262', 'pcs', 173.00, 1161.00, 15, 'Maiores eos eaque deleniti aspernatur quae aut voluptatem.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(17, 'vero Light', 'SKU-34713', 'kg', 478.00, 912.00, 8, 'Voluptas similique assumenda sit quo enim dolor est ut.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(18, 'ipsum Max', 'SKU-34471', 'kg', 470.00, 1469.00, 11, 'Sit et explicabo voluptatem iste.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(19, 'fugiat Light', 'SKU-84364', 'meter', 115.00, 1446.00, 15, 'Deleniti saepe ipsa provident eum temporibus.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(20, 'molestiae Max', 'SKU-78251', 'kg', 233.00, 1460.00, 7, 'Voluptas magni ipsam est est eum in vel.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(21, 'totam Light', 'SKU-42342', 'pcs', 314.00, 1205.00, 7, 'Molestiae nihil ad impedit reiciendis est qui.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(22, 'quae Light', 'SKU-26565', 'pcs', 354.00, 678.00, 13, 'Velit sunt et voluptatem minima voluptate aliquid incidunt.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(23, 'id Max', 'SKU-55037', 'kg', 340.00, 694.00, 8, 'Magnam qui dolorem consectetur illum culpa est molestiae.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(24, 'aliquam Light', 'SKU-12351', 'pcs', 314.00, 1047.00, 16, 'Exercitationem sed explicabo est magnam cum fugiat.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(25, 'vel Light', 'SKU-81202', 'pcs', 455.00, 1130.00, 13, 'Rerum quis nihil ea.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(26, 'autem Max', 'SKU-68209', 'meter', 131.00, 958.00, 14, 'Quia vitae vitae eligendi laboriosam repellendus architecto aut.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(27, 'laborum Max', 'SKU-96977', 'kg', 193.00, 1071.00, 14, 'Non et qui dolore aut qui.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(28, 'error Max', 'SKU-60375', 'kg', 469.00, 1200.00, 15, 'Harum quas error distinctio architecto in rerum ut.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(29, 'sint Light', 'SKU-90381', 'meter', 234.00, 1115.00, 10, 'Quia non dolore voluptas modi soluta fuga.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(30, 'cumque Pro', 'SKU-19725', 'pcs', 477.00, 893.00, 7, 'Aperiam aut molestias non aut et fugiat aut.', '2025-12-01 01:07:53', '2025-12-01 01:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_date` date NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `invoice_no`, `supplier_id`, `purchase_date`, `total_amount`, `description`, `created_at`, `updated_at`) VALUES
(1, 'INV-1764572953673', 6, '2025-11-19', 37737.00, 'Demo purchase seeding', '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(2, 'INV-1764572953618', 5, '2025-11-21', 69857.00, 'Demo purchase seeding', '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(3, 'INV-1764572953474', 9, '2025-11-03', 79205.00, 'Demo purchase seeding', '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(4, 'INV-1764572953585', 8, '2025-11-01', 75425.00, 'Demo purchase seeding', '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(5, 'INV-1764572953469', 6, '2025-11-27', 36938.00, 'Demo purchase seeding', '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(6, 'INV-1764572953647', 7, '2025-11-03', 76875.00, 'Demo purchase seeding', '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(7, 'INV-1764572953650', 4, '2025-11-27', 31673.00, 'Demo purchase seeding', '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(8, 'INV-1764572953781', 6, '2025-11-24', 107445.00, 'Demo purchase seeding', '2025-12-01 01:09:13', '2025-12-01 01:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `sales_date` date NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('HbyNBxTlCxPu4TKtAVBbvGrVAycYXOYWA8XoH4Kw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGJnZEpjaHZZZVlXVXVlTWpyOWdCQ0dXUWlnaDJXTWozWFJrdUd3eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764573405);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `warehouse_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 15, 3, 49, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(2, 8, 3, 63, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(3, 4, 3, 28, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(4, 28, 3, 25, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(5, 26, 3, 90, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(6, 13, 3, 28, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(7, 24, 3, 270, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(8, 19, 3, 62, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(9, 13, 1, 91, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(10, 20, 1, 109, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(11, 3, 1, 50, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(12, 6, 1, 60, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(13, 5, 3, 32, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(14, 25, 3, 87, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(15, 13, 4, 72, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(16, 1, 4, 79, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(17, 27, 4, 30, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(18, 29, 3, 69, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(19, 11, 3, 62, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(20, 1, 3, 44, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(21, 16, 3, 27, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(22, 7, 1, 51, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(23, 28, 2, 77, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(24, 29, 2, 65, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(25, 23, 2, 64, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(26, 5, 2, 36, '2025-12-01 01:09:13', '2025-12-01 01:09:13'),
(27, 22, 2, 63, '2025-12-01 01:09:13', '2025-12-01 01:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact_person`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Stehr Inc', 'Ms. Willow Langosh', '(503) 571-5232', 'ondricka.danielle@example.com', '929 Hodkiewicz Spur Suite 213\nPort Sadyehaven, NM 93192', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(2, 'Collier Group', 'Dr. Antonetta Hackett', '(864) 306-6639', 'mkessler@example.net', '9678 Bruen Ports\nArnehaven, ID 88238', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(3, 'Larkin-Jacobson', 'Jordane Harvey', '228.687.6587', 'mokeefe@example.com', '9097 Gerlach Lake Suite 281\nJosephinemouth, PA 08900-4761', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(4, 'Hyatt, Lesch and Hammes', 'Van Hauck', '580-377-6815', 'lbotsford@example.org', '72323 Collier Path\nWest Elinoremouth, NH 28273-0171', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(5, 'Schmitt and Sons', 'Cornell Huels', '308-266-8509', 'benedict.hackett@example.net', '670 Maybelle Point\nSabinaland, AL 52627', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(6, 'Corkery LLC', 'Maya Bruen', '1-386-805-1280', 'rhickle@example.net', '7298 Kelli Expressway\nGleichnershire, MS 11920', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(7, 'Mohr, Farrell and Price', 'Emmet Maggio', '+1 (234) 545-4651', 'stephan.green@example.org', '887 Betty Course Suite 018\nNew Stephan, IN 43811-4710', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(8, 'Bechtelar Inc', 'Miss Verona Erdman', '442-931-5440', 'isobel.luettgen@example.org', '6773 Bernhard Spur\nKoelpinville, ND 94362', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(9, 'Trantow-Trantow', 'Raleigh Heaney', '+1 (716) 678-4026', 'keara46@example.com', '64395 Margarette Land\nPort Kaciehaven, KY 27356', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(10, 'Adams, Cummerata and Greenholt', 'Erna Bechtelar MD', '+1.234.357.1253', 'colten42@example.org', '760 Bode Green\nPort Montyville, LA 33800', '2025-12-01 01:07:53', '2025-12-01 01:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@admin.com', '2025-12-01 01:07:52', '$2y$12$zJZaWhrOXk5JTTLC6RFUPecv97uUgCWa2Y6X2oyG9FpTzSewnOFG6', 'QNM4oXvCCO', '2025-12-01 01:07:53', '2025-12-01 01:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `location`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Central Hub', 'Yasmineport', 'Magni repudiandae eum nemo eveniet.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(2, 'East Branch', 'East Jazmynside', 'Voluptates molestias qui velit dolor veniam.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(3, 'Main Warehouse', 'Malvinaberg', 'Dicta consequatur voluptatem voluptatem totam hic nisi culpa.', '2025-12-01 01:07:53', '2025-12-01 01:07:53'),
(4, 'North Depot', 'East Charley', 'Qui sed qui adipisci et.', '2025-12-01 01:07:53', '2025-12-01 01:07:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchases_invoice_no_unique` (`invoice_no`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_invoice_no_unique` (`invoice_no`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stocks_product_id_warehouse_id_unique` (`product_id`,`warehouse_id`),
  ADD KEY `stocks_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_phone_unique` (`phone`),
  ADD UNIQUE KEY `suppliers_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stocks_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
