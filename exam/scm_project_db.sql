-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2025 at 01:36 AM
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
-- Database: `scm_project_db`
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
(4, '2025_12_01_223844_create_personal_access_tokens_table', 1),
(5, '2025_12_01_224243_create_products_table', 1),
(6, '2025_12_01_224256_create_suppliers_table', 1),
(7, '2025_12_01_224308_create_warehouses_table', 1),
(8, '2025_12_01_224339_create_purchases_table', 1),
(9, '2025_12_01_224436_create_sales_table', 1),
(10, '2025_12_01_224449_create_stocks_table', 1),
(11, '2025_12_01_224509_create_purchase_items_table', 1),
(12, '2025_12_01_224523_create_sale_items_table', 1);

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
  `unit` varchar(255) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `sales_price` decimal(10,2) NOT NULL,
  `min_stock_alert` int(11) NOT NULL DEFAULT 10,
  `current_stock` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `unit`, `purchase_price`, `sales_price`, `min_stock_alert`, `current_stock`, `description`, `created_at`, `updated_at`) VALUES
(1, 'soluta Base', 'SKU-24537', 'meter', 316.00, 601.00, 13, 391, 'Et laboriosam qui minus quidem omnis est.', '2025-12-01 17:13:03', '2025-12-01 17:13:15'),
(2, 'ut Pro', 'SKU-77858', 'kg', 143.00, 1168.00, 11, 124, 'Porro optio sunt nemo veritatis qui deserunt.', '2025-12-01 17:13:03', '2025-12-01 17:13:08'),
(3, 'sed Light', 'SKU-18269', 'meter', 415.00, 1423.00, 9, 282, 'Dolore exercitationem dicta eos provident.', '2025-12-01 17:13:03', '2025-12-01 17:13:09'),
(4, 'odio Base', 'SKU-22266', 'meter', 279.00, 871.00, 5, 136, 'Libero molestiae velit praesentium quidem.', '2025-12-01 17:13:03', '2025-12-01 17:13:11'),
(5, 'voluptates Base', 'SKU-69923', 'kg', 242.00, 822.00, 17, 146, 'Sit eligendi et iure sequi velit in ut iusto.', '2025-12-01 17:13:03', '2025-12-01 17:13:13'),
(6, 'dolore Light', 'SKU-45093', 'meter', 456.00, 1443.00, 16, 120, 'Repellendus quisquam dolores nisi temporibus cum.', '2025-12-01 17:13:03', '2025-12-01 17:13:12'),
(7, 'aperiam Light', 'SKU-85443', 'kg', 349.00, 874.00, 5, 115, 'In expedita aut alias totam quos.', '2025-12-01 17:13:03', '2025-12-01 17:13:10'),
(8, 'non Pro', 'SKU-19236', 'pcs', 103.00, 1331.00, 7, 331, 'Incidunt id placeat expedita ea et veritatis repellendus.', '2025-12-01 17:13:03', '2025-12-01 17:13:13'),
(9, 'velit Base', 'SKU-77608', 'pcs', 492.00, 667.00, 6, 232, 'Voluptatibus cumque iusto est sit neque dignissimos nam nulla.', '2025-12-01 17:13:04', '2025-12-01 17:13:04'),
(10, 'praesentium Pro', 'SKU-42125', 'box', 346.00, 631.00, 5, 261, 'Expedita est non repellat eligendi.', '2025-12-01 17:13:04', '2025-12-01 17:13:16'),
(11, 'dolorem Base', 'SKU-15924', 'box', 218.00, 1078.00, 19, 251, 'Suscipit nam quisquam voluptatibus commodi repellat.', '2025-12-01 17:13:04', '2025-12-01 17:13:15'),
(12, 'voluptatem Pro', 'SKU-70955', 'kg', 334.00, 732.00, 19, 435, 'Porro veniam laboriosam cum et at recusandae eveniet.', '2025-12-01 17:13:04', '2025-12-01 17:13:15'),
(13, 'qui Max', 'SKU-65982', 'pcs', 152.00, 1073.00, 9, 336, 'Illo quia reiciendis aut aliquam.', '2025-12-01 17:13:04', '2025-12-01 17:13:06'),
(14, 'sint Max', 'SKU-10740', 'kg', 143.00, 1430.00, 18, 88, 'Est ut aut minima voluptatem deleniti soluta.', '2025-12-01 17:13:04', '2025-12-01 17:13:15'),
(15, 'et Max', 'SKU-32476', 'pcs', 393.00, 1089.00, 15, 50, 'Odio pariatur vel quia facere pariatur eos eos repellendus.', '2025-12-01 17:13:04', '2025-12-01 17:13:12'),
(16, 'impedit Pro', 'SKU-48103', 'pcs', 157.00, 734.00, 11, 268, 'Consequatur laboriosam magni id neque et officia iusto repellat.', '2025-12-01 17:13:04', '2025-12-01 17:13:15'),
(17, 'eum Pro', 'SKU-9743', 'box', 389.00, 783.00, 7, 270, 'Ut dolores illo voluptatibus veniam et voluptas.', '2025-12-01 17:13:04', '2025-12-01 17:13:15'),
(18, 'aliquam Base', 'SKU-5628', 'box', 156.00, 940.00, 13, 363, 'Et illum qui id.', '2025-12-01 17:13:04', '2025-12-01 17:13:08'),
(19, 'quibusdam Light', 'SKU-64849', 'pcs', 333.00, 1424.00, 8, 341, 'Dolores ea assumenda sint sequi aut quaerat.', '2025-12-01 17:13:04', '2025-12-01 17:13:08'),
(20, 'quia Pro', 'SKU-43741', 'pcs', 136.00, 1058.00, 14, 141, 'Qui in earum quia ipsum est veniam.', '2025-12-01 17:13:04', '2025-12-01 17:13:14'),
(21, 'voluptatum Light', 'SKU-42086', 'box', 465.00, 1268.00, 11, 190, 'Debitis officiis modi occaecati eveniet dignissimos.', '2025-12-01 17:13:04', '2025-12-01 17:13:14'),
(22, 'voluptate Pro', 'SKU-10518', 'kg', 397.00, 1158.00, 5, 0, 'Corrupti placeat voluptatibus officiis quia voluptatem.', '2025-12-01 17:13:04', '2025-12-01 17:13:04'),
(23, 'blanditiis Pro', 'SKU-48057', 'pcs', 108.00, 881.00, 7, 297, 'Rerum non accusantium qui illo occaecati.', '2025-12-01 17:13:04', '2025-12-01 17:13:11'),
(24, 'corrupti Max', 'SKU-6859', 'box', 321.00, 1100.00, 19, 295, 'Rerum ipsam expedita occaecati quis praesentium.', '2025-12-01 17:13:04', '2025-12-01 17:13:15'),
(25, 'quam Base', 'SKU-56223', 'kg', 118.00, 1386.00, 14, 121, 'Magnam est numquam nihil facilis incidunt.', '2025-12-01 17:13:04', '2025-12-01 17:13:05'),
(26, 'est Max', 'SKU-26151', 'meter', 102.00, 652.00, 16, 138, 'Qui aut necessitatibus sed est voluptas quia.', '2025-12-01 17:13:04', '2025-12-01 17:13:05'),
(27, 'explicabo Light', 'SKU-80331', 'meter', 108.00, 1276.00, 5, 408, 'Est et quos eum.', '2025-12-01 17:13:04', '2025-12-01 17:13:12'),
(28, 'harum Base', 'SKU-84618', 'pcs', 416.00, 1028.00, 19, 25, 'Sed ut soluta maxime enim sed est.', '2025-12-01 17:13:04', '2025-12-01 17:13:07'),
(29, 'ad Pro', 'SKU-35698', 'box', 130.00, 783.00, 11, 354, 'Expedita qui sit inventore esse minus.', '2025-12-01 17:13:04', '2025-12-01 17:13:08'),
(30, 'officiis Light', 'SKU-33764', 'kg', 192.00, 1378.00, 7, 179, 'Officia dolores at magnam architecto nesciunt et.', '2025-12-01 17:13:04', '2025-12-01 17:13:15');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `invoice_no`, `supplier_id`, `purchase_date`, `total_amount`, `note`, `created_at`, `updated_at`) VALUES
(1, 'PUR-546639', 2, '2025-02-21', 11630.00, 'Omnis repellat qui.', '2025-12-01 17:13:06', '2025-12-01 17:13:07'),
(2, 'PUR-862501', 2, '2025-01-10', 16016.00, 'Sint voluptatum quia.', '2025-12-01 17:13:06', '2025-12-01 17:13:07'),
(3, 'PUR-656684', 2, '2025-08-02', 25686.00, 'Et voluptatem deserunt quidem.', '2025-12-01 17:13:06', '2025-12-01 17:13:08'),
(4, 'PUR-327763', 2, '2025-08-23', 41500.00, 'Officiis nemo suscipit et.', '2025-12-01 17:13:06', '2025-12-01 17:13:08'),
(5, 'PUR-605648', 2, '2025-04-01', 31050.00, 'Voluptatem eum voluptatem cupiditate.', '2025-12-01 17:13:06', '2025-12-01 17:13:09'),
(6, 'PUR-502170', 2, '2025-11-20', 53772.00, 'Iusto quisquam consequatur nesciunt.', '2025-12-01 17:13:06', '2025-12-01 17:13:09'),
(7, 'PUR-900315', 2, '2025-11-28', 59266.00, 'Nisi ut rerum.', '2025-12-01 17:13:06', '2025-12-01 17:13:09'),
(8, 'PUR-756468', 2, '2025-10-14', 49971.00, 'Saepe recusandae architecto quaerat.', '2025-12-01 17:13:06', '2025-12-01 17:13:10'),
(9, 'PUR-784361', 2, '2025-05-29', 85792.00, 'Sint eum qui.', '2025-12-01 17:13:06', '2025-12-01 17:13:10'),
(10, 'PUR-1065', 2, '2025-06-22', 62366.00, 'Qui beatae ullam.', '2025-12-01 17:13:06', '2025-12-01 17:13:11'),
(11, 'PUR-820781', 2, '2025-09-02', 77625.00, 'Ut et omnis laudantium.', '2025-12-01 17:13:06', '2025-12-01 17:13:11'),
(12, 'PUR-18254', 2, '2025-10-09', 65798.00, 'Magni qui et.', '2025-12-01 17:13:06', '2025-12-01 17:13:12'),
(13, 'PUR-795634', 2, '2025-04-01', 55084.00, 'Odio maxime fuga necessitatibus.', '2025-12-01 17:13:06', '2025-12-01 17:13:12'),
(14, 'PUR-270891', 2, '2024-12-09', 8540.00, 'Quisquam facilis fugiat.', '2025-12-01 17:13:06', '2025-12-01 17:13:12'),
(15, 'PUR-679165', 2, '2025-02-04', 39272.00, 'Quod consequuntur facilis nesciunt.', '2025-12-01 17:13:06', '2025-12-01 17:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `product_id`, `warehouse_id`, `quantity`, `unit_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 13, 2, 50, 152.00, 7600.00, '2025-12-01 17:13:06', '2025-12-01 17:13:06'),
(2, 1, 29, 1, 31, 130.00, 4030.00, '2025-12-01 17:13:06', '2025-12-01 17:13:06'),
(3, 2, 27, 1, 52, 108.00, 5616.00, '2025-12-01 17:13:07', '2025-12-01 17:13:07'),
(4, 2, 28, 1, 25, 416.00, 10400.00, '2025-12-01 17:13:07', '2025-12-01 17:13:07'),
(5, 3, 19, 3, 54, 333.00, 17982.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(6, 3, 24, 2, 24, 321.00, 7704.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(7, 4, 2, 1, 34, 143.00, 4862.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(8, 4, 5, 3, 67, 242.00, 16214.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(9, 4, 11, 1, 30, 218.00, 6540.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(10, 4, 18, 3, 89, 156.00, 13884.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(11, 5, 2, 1, 90, 143.00, 12870.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(12, 5, 23, 3, 90, 108.00, 9720.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(13, 5, 27, 3, 35, 108.00, 3780.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(14, 5, 29, 2, 36, 130.00, 4680.00, '2025-12-01 17:13:08', '2025-12-01 17:13:08'),
(15, 6, 6, 1, 52, 456.00, 23712.00, '2025-12-01 17:13:09', '2025-12-01 17:13:09'),
(16, 6, 12, 2, 90, 334.00, 30060.00, '2025-12-01 17:13:09', '2025-12-01 17:13:09'),
(17, 7, 11, 1, 50, 218.00, 10900.00, '2025-12-01 17:13:09', '2025-12-01 17:13:09'),
(18, 7, 14, 1, 75, 143.00, 10725.00, '2025-12-01 17:13:09', '2025-12-01 17:13:09'),
(19, 7, 21, 2, 57, 465.00, 26505.00, '2025-12-01 17:13:09', '2025-12-01 17:13:09'),
(20, 7, 30, 1, 58, 192.00, 11136.00, '2025-12-01 17:13:09', '2025-12-01 17:13:09'),
(21, 8, 3, 3, 93, 415.00, 38595.00, '2025-12-01 17:13:09', '2025-12-01 17:13:09'),
(22, 8, 16, 2, 36, 157.00, 5652.00, '2025-12-01 17:13:09', '2025-12-01 17:13:09'),
(23, 8, 23, 1, 53, 108.00, 5724.00, '2025-12-01 17:13:09', '2025-12-01 17:13:09'),
(24, 9, 1, 1, 69, 316.00, 21804.00, '2025-12-01 17:13:10', '2025-12-01 17:13:10'),
(25, 9, 4, 2, 67, 279.00, 18693.00, '2025-12-01 17:13:10', '2025-12-01 17:13:10'),
(26, 9, 5, 2, 86, 242.00, 20812.00, '2025-12-01 17:13:10', '2025-12-01 17:13:10'),
(27, 9, 7, 1, 29, 349.00, 10121.00, '2025-12-01 17:13:10', '2025-12-01 17:13:10'),
(28, 9, 12, 1, 43, 334.00, 14362.00, '2025-12-01 17:13:10', '2025-12-01 17:13:10'),
(29, 10, 1, 2, 54, 316.00, 17064.00, '2025-12-01 17:13:10', '2025-12-01 17:13:10'),
(30, 10, 7, 2, 86, 349.00, 30014.00, '2025-12-01 17:13:10', '2025-12-01 17:13:10'),
(31, 10, 20, 2, 87, 136.00, 11832.00, '2025-12-01 17:13:10', '2025-12-01 17:13:10'),
(32, 10, 23, 3, 32, 108.00, 3456.00, '2025-12-01 17:13:11', '2025-12-01 17:13:11'),
(33, 11, 4, 3, 69, 279.00, 19251.00, '2025-12-01 17:13:11', '2025-12-01 17:13:11'),
(34, 11, 8, 1, 95, 103.00, 9785.00, '2025-12-01 17:13:11', '2025-12-01 17:13:11'),
(35, 11, 10, 2, 69, 346.00, 23874.00, '2025-12-01 17:13:11', '2025-12-01 17:13:11'),
(36, 11, 16, 2, 93, 157.00, 14601.00, '2025-12-01 17:13:11', '2025-12-01 17:13:11'),
(37, 11, 17, 3, 26, 389.00, 10114.00, '2025-12-01 17:13:11', '2025-12-01 17:13:11'),
(38, 12, 8, 1, 32, 103.00, 3296.00, '2025-12-01 17:13:11', '2025-12-01 17:13:11'),
(39, 12, 11, 3, 74, 218.00, 16132.00, '2025-12-01 17:13:11', '2025-12-01 17:13:11'),
(40, 12, 12, 3, 80, 334.00, 26720.00, '2025-12-01 17:13:11', '2025-12-01 17:13:11'),
(41, 12, 15, 3, 50, 393.00, 19650.00, '2025-12-01 17:13:12', '2025-12-01 17:13:12'),
(42, 13, 6, 3, 68, 456.00, 31008.00, '2025-12-01 17:13:12', '2025-12-01 17:13:12'),
(43, 13, 12, 3, 64, 334.00, 21376.00, '2025-12-01 17:13:12', '2025-12-01 17:13:12'),
(44, 13, 27, 2, 25, 108.00, 2700.00, '2025-12-01 17:13:12', '2025-12-01 17:13:12'),
(45, 14, 14, 2, 28, 143.00, 4004.00, '2025-12-01 17:13:12', '2025-12-01 17:13:12'),
(46, 14, 27, 1, 42, 108.00, 4536.00, '2025-12-01 17:13:12', '2025-12-01 17:13:12'),
(47, 15, 1, 3, 67, 316.00, 21172.00, '2025-12-01 17:13:12', '2025-12-01 17:13:12'),
(48, 15, 20, 2, 67, 136.00, 9112.00, '2025-12-01 17:13:12', '2025-12-01 17:13:12'),
(49, 15, 24, 3, 28, 321.00, 8988.00, '2025-12-01 17:13:12', '2025-12-01 17:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `sale_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `invoice_no`, `customer_name`, `sale_date`, `total_amount`, `note`, `created_at`, `updated_at`) VALUES
(1, 'SAL-358641', 'Ms. Lorna Carter III', '2025-11-14', 22420.00, 'Beatae quo voluptatem.', '2025-12-01 17:13:12', '2025-12-01 17:13:13'),
(2, 'SAL-399309', 'Elliott Osinski', '2025-09-01', 12102.00, 'Totam dolor voluptates.', '2025-12-01 17:13:13', '2025-12-01 17:13:14'),
(3, 'SAL-670981', 'Marc Kunze DDS', '2025-10-17', 10706.00, 'Reprehenderit odit animi suscipit.', '2025-12-01 17:13:13', '2025-12-01 17:13:14'),
(4, 'SAL-698124', 'Norene VonRueden Jr.', '2025-08-02', 20120.00, 'Sunt neque.', '2025-12-01 17:13:13', '2025-12-01 17:13:15'),
(5, 'SAL-723871', 'Daren Reinger', '2025-07-26', 16008.00, 'Dolor non ab et.', '2025-12-01 17:13:13', '2025-12-01 17:13:15'),
(6, 'SAL-809748', 'Cleveland Mraz', '2025-10-20', 32412.00, 'Enim quidem animi.', '2025-12-01 17:13:13', '2025-12-01 17:13:15'),
(7, 'SAL-314684', 'Mr. Raheem Strosin', '2025-11-10', 11334.00, 'Sint vitae id.', '2025-12-01 17:13:13', '2025-12-01 17:13:15'),
(8, 'SAL-132281', 'Prof. Lavada Wisoky I', '2025-06-27', 1262.00, 'Velit praesentium earum.', '2025-12-01 17:13:13', '2025-12-01 17:13:15'),
(9, 'SAL-616112', 'Prof. Randy Toy IV', '2025-08-18', 4207.00, 'Natus minima nisi.', '2025-12-01 17:13:13', '2025-12-01 17:13:16'),
(10, 'SAL-611699', 'Prof. Marley McKenzie', '2025-09-23', 3155.00, 'Ut cupiditate est et.', '2025-12-01 17:13:13', '2025-12-01 17:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `warehouse_id`, `quantity`, `unit_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 2, 14, 1331.00, 18634.00, '2025-12-01 17:13:13', '2025-12-01 17:13:13'),
(2, 1, 10, 2, 6, 631.00, 3786.00, '2025-12-01 17:13:13', '2025-12-01 17:13:13'),
(3, 2, 5, 1, 7, 822.00, 5754.00, '2025-12-01 17:13:13', '2025-12-01 17:13:13'),
(4, 2, 20, 2, 6, 1058.00, 6348.00, '2025-12-01 17:13:14', '2025-12-01 17:13:14'),
(5, 3, 20, 3, 7, 1058.00, 7406.00, '2025-12-01 17:13:14', '2025-12-01 17:13:14'),
(6, 3, 24, 1, 3, 1100.00, 3300.00, '2025-12-01 17:13:14', '2025-12-01 17:13:14'),
(7, 4, 21, 1, 15, 1268.00, 19020.00, '2025-12-01 17:13:14', '2025-12-01 17:13:14'),
(8, 4, 24, 3, 1, 1100.00, 1100.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(9, 5, 1, 1, 6, 601.00, 3606.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(10, 5, 30, 3, 9, 1378.00, 12402.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(11, 6, 14, 1, 15, 1430.00, 21450.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(12, 6, 17, 2, 14, 783.00, 10962.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(13, 7, 11, 2, 1, 1078.00, 1078.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(14, 7, 12, 2, 10, 732.00, 7320.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(15, 7, 16, 2, 4, 734.00, 2936.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(16, 8, 10, 3, 2, 631.00, 1262.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(17, 9, 1, 2, 7, 601.00, 4207.00, '2025-12-01 17:13:15', '2025-12-01 17:13:15'),
(18, 10, 10, 2, 5, 631.00, 3155.00, '2025-12-01 17:13:16', '2025-12-01 17:13:16');

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
('0ebVNs5pn2bFgWnZBSZmSrKjgxbF0fL2tTFEyf8l', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGgyRmF4YlJaRTNDSk90WW03bEJEUnZVcFhhRmNoWTRqUmc5c2hEQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764632060);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `warehouse_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 63, '2025-12-01 17:13:04', '2025-12-01 17:13:10'),
(2, 3, 1, 189, '2025-12-01 17:13:04', '2025-12-01 17:13:04'),
(3, 8, 1, 32, '2025-12-01 17:13:04', '2025-12-01 17:13:11'),
(4, 9, 2, 232, '2025-12-01 17:13:04', '2025-12-01 17:13:04'),
(5, 10, 3, 203, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(6, 11, 2, 97, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(7, 12, 3, 64, '2025-12-01 17:13:05', '2025-12-01 17:13:12'),
(8, 13, 1, 286, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(9, 16, 3, 143, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(10, 17, 2, 244, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(11, 18, 1, 274, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(12, 19, 1, 287, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(13, 21, 1, 133, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(14, 23, 2, 122, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(15, 24, 1, 244, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(16, 25, 2, 121, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(17, 26, 3, 138, '2025-12-01 17:13:05', '2025-12-01 17:13:05'),
(18, 27, 2, 25, '2025-12-01 17:13:05', '2025-12-01 17:13:12'),
(19, 29, 1, 31, '2025-12-01 17:13:06', '2025-12-01 17:13:06'),
(20, 30, 3, 121, '2025-12-01 17:13:06', '2025-12-01 17:13:06'),
(21, 13, 2, 50, NULL, '2025-12-01 17:13:06'),
(23, 27, 1, 42, NULL, '2025-12-01 17:13:12'),
(24, 28, 1, 25, NULL, '2025-12-01 17:13:07'),
(25, 19, 3, 54, NULL, '2025-12-01 17:13:08'),
(26, 24, 2, 24, NULL, '2025-12-01 17:13:08'),
(27, 2, 1, 90, NULL, '2025-12-01 17:13:08'),
(28, 5, 3, 67, NULL, '2025-12-01 17:13:08'),
(29, 11, 1, 50, NULL, '2025-12-01 17:13:09'),
(30, 18, 3, 89, NULL, '2025-12-01 17:13:08'),
(32, 23, 3, 32, NULL, '2025-12-01 17:13:11'),
(33, 27, 3, 35, NULL, '2025-12-01 17:13:08'),
(34, 29, 2, 36, NULL, '2025-12-01 17:13:08'),
(35, 6, 1, 52, NULL, '2025-12-01 17:13:09'),
(36, 12, 2, 80, NULL, '2025-12-01 17:13:09'),
(38, 14, 1, 60, NULL, '2025-12-01 17:13:09'),
(39, 21, 2, 57, NULL, '2025-12-01 17:13:09'),
(40, 30, 1, 58, NULL, '2025-12-01 17:13:09'),
(41, 3, 3, 93, NULL, '2025-12-01 17:13:09'),
(42, 16, 2, 89, NULL, '2025-12-01 17:13:11'),
(43, 23, 1, 53, NULL, '2025-12-01 17:13:09'),
(45, 4, 2, 67, NULL, '2025-12-01 17:13:10'),
(46, 5, 2, 86, NULL, '2025-12-01 17:13:10'),
(47, 7, 1, 29, NULL, '2025-12-01 17:13:10'),
(48, 12, 1, 43, NULL, '2025-12-01 17:13:10'),
(49, 1, 2, 47, NULL, '2025-12-01 17:13:10'),
(50, 7, 2, 86, NULL, '2025-12-01 17:13:10'),
(51, 20, 2, 61, NULL, '2025-12-01 17:13:12'),
(53, 4, 3, 69, NULL, '2025-12-01 17:13:11'),
(55, 10, 2, 58, NULL, '2025-12-01 17:13:11'),
(57, 17, 3, 26, NULL, '2025-12-01 17:13:11'),
(59, 11, 3, 74, NULL, '2025-12-01 17:13:11'),
(61, 15, 3, 50, NULL, '2025-12-01 17:13:12'),
(62, 6, 3, 68, NULL, '2025-12-01 17:13:12'),
(65, 14, 2, 28, NULL, '2025-12-01 17:13:12'),
(67, 1, 3, 67, NULL, '2025-12-01 17:13:12'),
(69, 24, 3, 27, NULL, '2025-12-01 17:13:12');

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
(1, 'Spinka Inc Ltd.', 'Sofia Beier Jr.', '951.993.0742', 'hal63@example.org', '5095 Reilly Ranch\nThielburgh, MT 78508-6682', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(2, 'King, Bailey and Gutmann Ltd.', 'Garrett Sauer IV', '1-360-549-2193', 'estevan.smith@example.net', '283 Predovic Locks Apt. 432\nFrancoburgh, MO 86795-6941', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(3, 'Lakin-Mohr Ltd.', 'Paolo Barrows', '336.800.6583', 'janis41@example.net', '3516 Bashirian Roads Suite 817\nSkyeport, AZ 38816', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(4, 'Buckridge Ltd Ltd.', 'Vickie Leuschke', '+1-502-877-9842', 'buster95@example.org', '9467 Josie Plains\nWisokyland, MT 41735-7321', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(5, 'Pouros, Kshlerin and Konopelski Ltd.', 'Opal Emard', '+1-910-944-7021', 'schuppe.kaley@example.org', '985 Fermin Rapid Apt. 525\nRaushire, MI 70559', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(6, 'Abshire-Mills Ltd.', 'Eloise Gleichner', '518.640.6893', 'abbigail.thompson@example.net', '5528 Kuvalis Throughway\nNorth Arno, CO 20780-5592', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(7, 'West, Sanford and Paucek Ltd.', 'Crystel Grant', '(754) 793-3446', 'savanna81@example.com', '42631 Moen Isle Suite 701\nAlexieshire, AR 40648-2976', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(8, 'Hansen-Kling Ltd.', 'Mina Huel', '(774) 434-0772', 'mante.valentine@example.net', '473 Leslie Alley Apt. 207\nLangworthshire, ME 69812-4919', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(9, 'Hettinger Ltd Ltd.', 'Wava Lang', '904-702-2896', 'marmstrong@example.com', '26161 Lynn Run Suite 895\nUriahbury, PA 42710-8636', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(10, 'Mueller, Bahringer and Rempel Ltd.', 'Prof. Lina Ledner', '+1 (712) 461-1077', 'rbatz@example.net', '91450 Marian Station\nNew Jaunitahaven, PA 25896-8551', '2025-12-01 17:13:03', '2025-12-01 17:13:03');

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
(1, 'Admin User', 'admin@admin.com', NULL, '$2y$12$j4hCW9F.5fmpzoPDp7YDQOcCFMK5e7jjVv50JpZSuW2rsxT89/476', NULL, '2025-12-01 17:13:03', '2025-12-01 17:13:03');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `location`, `created_at`, `updated_at`) VALUES
(1, 'North Godown', 'Toyburgh', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(2, 'Central Godown', 'Feeneyberg', '2025-12-01 17:13:03', '2025-12-01 17:13:03'),
(3, 'East Godown', 'West Hilario', '2025-12-01 17:13:03', '2025-12-01 17:13:03');

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
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_items_product_id_foreign` (`product_id`),
  ADD KEY `purchase_items_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_invoice_no_unique` (`invoice_no`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_items_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_items_product_id_foreign` (`product_id`),
  ADD KEY `sale_items_warehouse_id_foreign` (`warehouse_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_items_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_items_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

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
