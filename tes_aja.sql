-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2024 pada 16.30
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tes_aja`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Laptops', 'laptops', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(2, 'Desktops', 'desktops', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(3, 'Phones', 'phones', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(4, 'Tablets', 'tablets', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(5, 'TVs', 'tvs', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(6, 'Cameras', 'cameras', '2024-06-21 09:16:13', '2024-06-21 09:16:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `country_visits`
--

CREATE TABLE `country_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) NOT NULL,
  `visits` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `country_visits`
--

INSERT INTO `country_visits` (`id`, `country`, `visits`, `created_at`, `updated_at`) VALUES
(1, 'United States', 3, '2024-06-21 09:15:16', '2024-06-21 09:22:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `percent_off`, `created_at`, `updated_at`) VALUES
(1, 'ABC123', 'fixed', 20, NULL, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(2, 'DEF456', 'percent', NULL, 40, '2024-06-21 09:16:13', '2024-06-21 09:16:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_10_16_185424_create_products_table', 1),
(25, '2019_10_17_195112_create_categories_table', 1),
(26, '2019_10_17_195227_add_category_id_to_products_table', 1),
(27, '2019_10_18_002421_create_coupons_table', 1),
(28, '2019_10_19_145706_add_images_column_to_products', 1),
(29, '2019_10_20_114921_create_tags_table', 1),
(30, '2019_10_20_115306_create_products_tags_table', 1),
(31, '2019_10_22_185425_create_orders_table', 1),
(32, '2019_10_22_190613_create_order_product_table', 1),
(33, '2019_11_09_002942_add_quantity_to_products_table', 1),
(34, '2020_06_27_012504_create_visits_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_email` varchar(255) NOT NULL,
  `billing_name` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `billing_city` varchar(255) NOT NULL,
  `billing_province` varchar(255) NOT NULL,
  `billing_postalcode` varchar(255) NOT NULL,
  `billing_phone` varchar(255) NOT NULL,
  `billing_name_on_card` varchar(255) NOT NULL,
  `billing_discount` int(11) NOT NULL DEFAULT 0,
  `billing_discount_code` varchar(255) DEFAULT NULL,
  `billing_subtotal` int(11) NOT NULL,
  `billing_tax` int(11) NOT NULL,
  `billing_total` int(11) NOT NULL,
  `payment_gateway` varchar(255) NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT 0,
  `error` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `billing_email`, `billing_name`, `billing_address`, `billing_city`, `billing_province`, `billing_postalcode`, `billing_phone`, `billing_name_on_card`, `billing_discount`, `billing_discount_code`, `billing_subtotal`, `billing_tax`, `billing_total`, `payment_gateway`, `shipped`, `error`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin@admin.com', 'Admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 0, NULL, 7386, 1551, 8937, 'stripe', 0, NULL, '2024-06-21 09:19:03', '2024-06-21 09:19:03'),
(2, 1, 'admin@admin.com', 'Admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 0, NULL, 7386, 1551, 8937, 'stripe', 0, NULL, '2024-06-21 09:19:13', '2024-06-21 09:19:13'),
(3, 1, 'admin@admin.com', 'Admin', 'admin', 'admin', 'admin', '1234', '1234', 'admin', 0, NULL, 7386, 1551, 8937, 'stripe', 0, NULL, '2024-06-21 09:19:25', '2024-06-21 09:19:25'),
(4, 1, 'admin@admin.com', 'Admin', 'Jl. Babakan Sari 3 RT 05 RW 15', 'admin', 'admin', '1234', '1234', 'admin', 0, NULL, 7386, 1551, 8937, 'stripe', 0, NULL, '2024-06-21 09:19:42', '2024-06-21 09:19:42'),
(5, 1, 'admin@admin.com', 'Admin', 'Jl. Babakan Sari 3 RT 05 RW 15', 'Bandung', 'Jawa Barat', '32342', '1234', 'admin', 0, NULL, 7386, 1551, 8937, 'stripe', 0, NULL, '2024-06-21 09:20:28', '2024-06-21 09:20:28'),
(6, 1, 'admin@admin.com', 'Admin', 'Jl. Babakan Sari 3 RT 05 RW 15', 'Bandung', 'Jawa Barat', '32342', '083820630348', 'Admin', 0, NULL, 7386, 1551, 8937, 'stripe', 0, NULL, '2024-06-21 09:21:20', '2024-06-21 09:21:20'),
(7, NULL, 'rzkysa0@gmail.com', 'Admin', 'Jl. Babakan Sari 3 RT 05 RW 15', 'Bandung', 'Jawa Barat', '32342', '083820630348', 'Admin', 0, NULL, 8730, 1833, 10563, 'stripe', 0, NULL, '2024-06-21 09:22:30', '2024-06-21 09:22:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_product`
--

INSERT INTO `order_product` (`id`, `product_id`, `order_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 52, 1, 1, '2024-06-21 09:19:03', '2024-06-21 09:19:03'),
(2, 52, 2, 1, '2024-06-21 09:19:13', '2024-06-21 09:19:13'),
(3, 52, 3, 1, '2024-06-21 09:19:25', '2024-06-21 09:19:25'),
(4, 52, 4, 1, '2024-06-21 09:19:42', '2024-06-21 09:19:42'),
(5, 52, 5, 1, '2024-06-21 09:20:28', '2024-06-21 09:20:28'),
(6, 52, 6, 1, '2024-06-21 09:21:20', '2024-06-21 09:21:20'),
(7, 110, 7, 1, '2024-06-21 09:22:30', '2024-06-21 09:22:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `images` text DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `image`, `images`, `featured`, `quantity`, `category_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'laptop0', 'laptop-0', '15 inches 1TB SSD 16 GB RAM', 2162, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(2, 'laptop1', 'laptop-1', '15 inches 1TB SSD 16 GB RAM', 4611, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(3, 'laptop2', 'laptop-2', '15 inches 1TB SSD 16 GB RAM', 2415, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(4, 'laptop3', 'laptop-3', '15 inches 1TB SSD 16 GB RAM', 9670, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(5, 'laptop4', 'laptop-4', '15 inches 1TB SSD 16 GB RAM', 8453, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(6, 'laptop5', 'laptop-5', '15 inches 1TB SSD 16 GB RAM', 1400, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(7, 'laptop6', 'laptop-6', '15 inches 1TB SSD 16 GB RAM', 2847, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(8, 'laptop7', 'laptop-7', '15 inches 1TB SSD 16 GB RAM', 6313, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(9, 'laptop8', 'laptop-8', '15 inches 1TB SSD 16 GB RAM', 8736, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(10, 'laptop9', 'laptop-9', '15 inches 1TB SSD 16 GB RAM', 6829, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(11, 'laptop10', 'laptop-10', '15 inches 1TB SSD 16 GB RAM', 7913, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(12, 'laptop11', 'laptop-11', '15 inches 1TB SSD 16 GB RAM', 2997, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(13, 'laptop12', 'laptop-12', '15 inches 1TB SSD 16 GB RAM', 6341, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(14, 'laptop13', 'laptop-13', '15 inches 1TB SSD 16 GB RAM', 9929, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(15, 'laptop14', 'laptop-14', '15 inches 1TB SSD 16 GB RAM', 3566, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(16, 'laptop15', 'laptop-15', '15 inches 1TB SSD 16 GB RAM', 6836, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(17, 'laptop16', 'laptop-16', '15 inches 1TB SSD 16 GB RAM', 2665, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(18, 'laptop17', 'laptop-17', '15 inches 1TB SSD 16 GB RAM', 4182, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(19, 'laptop18', 'laptop-18', '15 inches 1TB SSD 16 GB RAM', 7858, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(20, 'laptop19', 'laptop-19', '15 inches 1TB SSD 16 GB RAM', 4230, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(21, 'Desktop0', 'desktop-0', '15 inches 1TB SSD 16 GB RAM', 5634, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(22, 'Desktop1', 'desktop-1', '15 inches 1TB SSD 16 GB RAM', 9788, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(23, 'Desktop2', 'desktop-2', '15 inches 1TB SSD 16 GB RAM', 1391, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(24, 'Desktop3', 'desktop-3', '15 inches 1TB SSD 16 GB RAM', 5414, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(25, 'Desktop4', 'desktop-4', '15 inches 1TB SSD 16 GB RAM', 1780, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(26, 'Desktop5', 'desktop-5', '15 inches 1TB SSD 16 GB RAM', 7748, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(27, 'Desktop6', 'desktop-6', '15 inches 1TB SSD 16 GB RAM', 8650, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(28, 'Desktop7', 'desktop-7', '15 inches 1TB SSD 16 GB RAM', 6826, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(29, 'Desktop8', 'desktop-8', '15 inches 1TB SSD 16 GB RAM', 4350, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(30, 'Desktop9', 'desktop-9', '15 inches 1TB SSD 16 GB RAM', 9868, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(31, 'Desktop10', 'desktop-10', '15 inches 1TB SSD 16 GB RAM', 5003, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(32, 'Desktop11', 'desktop-11', '15 inches 1TB SSD 16 GB RAM', 9114, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(33, 'Desktop12', 'desktop-12', '15 inches 1TB SSD 16 GB RAM', 4486, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(34, 'Desktop13', 'desktop-13', '15 inches 1TB SSD 16 GB RAM', 1898, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(35, 'Desktop14', 'desktop-14', '15 inches 1TB SSD 16 GB RAM', 4528, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(36, 'Desktop15', 'desktop-15', '15 inches 1TB SSD 16 GB RAM', 8369, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(37, 'Desktop16', 'desktop-16', '15 inches 1TB SSD 16 GB RAM', 8913, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(38, 'Desktop17', 'desktop-17', '15 inches 1TB SSD 16 GB RAM', 6205, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(39, 'Desktop18', 'desktop-18', '15 inches 1TB SSD 16 GB RAM', 2766, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(40, 'Desktop19', 'desktop-19', '15 inches 1TB SSD 16 GB RAM', 9721, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(41, 'Phone0', 'phone-0', '15 inches 1TB SSD 16 GB RAM', 3183, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(42, 'Phone1', 'phone-1', '15 inches 1TB SSD 16 GB RAM', 5619, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(43, 'Phone2', 'phone-2', '15 inches 1TB SSD 16 GB RAM', 8880, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(44, 'Phone3', 'phone-3', '15 inches 1TB SSD 16 GB RAM', 6170, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(45, 'Phone4', 'phone-4', '15 inches 1TB SSD 16 GB RAM', 4493, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(46, 'Phone5', 'phone-5', '15 inches 1TB SSD 16 GB RAM', 7454, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(47, 'Phone6', 'phone-6', '15 inches 1TB SSD 16 GB RAM', 5067, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(48, 'Phone7', 'phone-7', '15 inches 1TB SSD 16 GB RAM', 5128, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(49, 'Phone8', 'phone-8', '15 inches 1TB SSD 16 GB RAM', 2335, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(50, 'Phone9', 'phone-9', '15 inches 1TB SSD 16 GB RAM', 7886, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(51, 'Phone10', 'phone-10', '15 inches 1TB SSD 16 GB RAM', 7561, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(52, 'Phone11', 'phone-11', '15 inches 1TB SSD 16 GB RAM', 7386, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 4, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:21:20'),
(53, 'Phone12', 'phone-12', '15 inches 1TB SSD 16 GB RAM', 3656, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(54, 'Phone13', 'phone-13', '15 inches 1TB SSD 16 GB RAM', 6722, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(55, 'Phone14', 'phone-14', '15 inches 1TB SSD 16 GB RAM', 7279, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(56, 'Phone15', 'phone-15', '15 inches 1TB SSD 16 GB RAM', 3519, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(57, 'Phone16', 'phone-16', '15 inches 1TB SSD 16 GB RAM', 4307, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(58, 'Phone17', 'phone-17', '15 inches 1TB SSD 16 GB RAM', 3725, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(59, 'Phone18', 'phone-18', '15 inches 1TB SSD 16 GB RAM', 2345, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(60, 'Phone19', 'phone-19', '15 inches 1TB SSD 16 GB RAM', 6221, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(61, 'Tablet0', 'tablet-0', '15 inches 1TB SSD 16 GB RAM', 2630, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(62, 'Tablet1', 'tablet-1', '15 inches 1TB SSD 16 GB RAM', 5933, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(63, 'Tablet2', 'tablet-2', '15 inches 1TB SSD 16 GB RAM', 8873, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(64, 'Tablet3', 'tablet-3', '15 inches 1TB SSD 16 GB RAM', 2809, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(65, 'Tablet4', 'tablet-4', '15 inches 1TB SSD 16 GB RAM', 4688, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(66, 'Tablet5', 'tablet-5', '15 inches 1TB SSD 16 GB RAM', 1614, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(67, 'Tablet6', 'tablet-6', '15 inches 1TB SSD 16 GB RAM', 9980, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(68, 'Tablet7', 'tablet-7', '15 inches 1TB SSD 16 GB RAM', 2763, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(69, 'Tablet8', 'tablet-8', '15 inches 1TB SSD 16 GB RAM', 6472, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(70, 'Tablet9', 'tablet-9', '15 inches 1TB SSD 16 GB RAM', 8386, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(71, 'Tablet10', 'tablet-10', '15 inches 1TB SSD 16 GB RAM', 5939, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(72, 'Tablet11', 'tablet-11', '15 inches 1TB SSD 16 GB RAM', 5600, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(73, 'Tablet12', 'tablet-12', '15 inches 1TB SSD 16 GB RAM', 4475, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(74, 'Tablet13', 'tablet-13', '15 inches 1TB SSD 16 GB RAM', 2696, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(75, 'Tablet14', 'tablet-14', '15 inches 1TB SSD 16 GB RAM', 3889, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(76, 'Tablet15', 'tablet-15', '15 inches 1TB SSD 16 GB RAM', 4196, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(77, 'Tablet16', 'tablet-16', '15 inches 1TB SSD 16 GB RAM', 2266, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(78, 'Tablet17', 'tablet-17', '15 inches 1TB SSD 16 GB RAM', 7353, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(79, 'Tablet18', 'tablet-18', '15 inches 1TB SSD 16 GB RAM', 4497, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(80, 'Tablet19', 'tablet-19', '15 inches 1TB SSD 16 GB RAM', 7747, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(81, 'TV0', 'tv-0', '15 inches 1TB SSD 16 GB RAM', 4676, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(82, 'TV1', 'tv-1', '15 inches 1TB SSD 16 GB RAM', 7277, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(83, 'TV2', 'tv-2', '15 inches 1TB SSD 16 GB RAM', 1673, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(84, 'TV3', 'tv-3', '15 inches 1TB SSD 16 GB RAM', 4621, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(85, 'TV4', 'tv-4', '15 inches 1TB SSD 16 GB RAM', 3694, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(86, 'TV5', 'tv-5', '15 inches 1TB SSD 16 GB RAM', 6212, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(87, 'TV6', 'tv-6', '15 inches 1TB SSD 16 GB RAM', 7609, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(88, 'TV7', 'tv-7', '15 inches 1TB SSD 16 GB RAM', 1900, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(89, 'TV8', 'tv-8', '15 inches 1TB SSD 16 GB RAM', 6651, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(90, 'TV9', 'tv-9', '15 inches 1TB SSD 16 GB RAM', 8359, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(91, 'TV10', 'tv-10', '15 inches 1TB SSD 16 GB RAM', 8794, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(92, 'TV11', 'tv-11', '15 inches 1TB SSD 16 GB RAM', 7161, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(93, 'TV12', 'tv-12', '15 inches 1TB SSD 16 GB RAM', 4089, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(94, 'TV13', 'tv-13', '15 inches 1TB SSD 16 GB RAM', 2483, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(95, 'TV14', 'tv-14', '15 inches 1TB SSD 16 GB RAM', 2201, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(96, 'TV15', 'tv-15', '15 inches 1TB SSD 16 GB RAM', 7535, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(97, 'TV16', 'tv-16', '15 inches 1TB SSD 16 GB RAM', 4498, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(98, 'TV17', 'tv-17', '15 inches 1TB SSD 16 GB RAM', 8547, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(99, 'TV18', 'tv-18', '15 inches 1TB SSD 16 GB RAM', 3810, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(100, 'TV19', 'tv-19', '15 inches 1TB SSD 16 GB RAM', 7562, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(101, 'Camera0', 'camera-0', '15 inches 1TB SSD 16 GB RAM', 7811, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13');
INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `image`, `images`, `featured`, `quantity`, `category_id`, `description`, `created_at`, `updated_at`) VALUES
(102, 'Camera1', 'camera-1', '15 inches 1TB SSD 16 GB RAM', 6194, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(103, 'Camera2', 'camera-2', '15 inches 1TB SSD 16 GB RAM', 8185, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(104, 'Camera3', 'camera-3', '15 inches 1TB SSD 16 GB RAM', 6528, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(105, 'Camera4', 'camera-4', '15 inches 1TB SSD 16 GB RAM', 1104, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(106, 'Camera5', 'camera-5', '15 inches 1TB SSD 16 GB RAM', 8035, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(107, 'Camera6', 'camera-6', '15 inches 1TB SSD 16 GB RAM', 9297, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(108, 'Camera7', 'camera-7', '15 inches 1TB SSD 16 GB RAM', 2317, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(109, 'Camera8', 'camera-8', '15 inches 1TB SSD 16 GB RAM', 2468, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(110, 'Camera9', 'camera-9', '15 inches 1TB SSD 16 GB RAM', 8730, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 9, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:22:30'),
(111, 'Camera10', 'camera-10', '15 inches 1TB SSD 16 GB RAM', 7754, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(112, 'Camera11', 'camera-11', '15 inches 1TB SSD 16 GB RAM', 7532, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(113, 'Camera12', 'camera-12', '15 inches 1TB SSD 16 GB RAM', 1021, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(114, 'Camera13', 'camera-13', '15 inches 1TB SSD 16 GB RAM', 1498, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(115, 'Camera14', 'camera-14', '15 inches 1TB SSD 16 GB RAM', 9525, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(116, 'Camera15', 'camera-15', '15 inches 1TB SSD 16 GB RAM', 2139, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(117, 'Camera16', 'camera-16', '15 inches 1TB SSD 16 GB RAM', 6226, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(118, 'Camera17', 'camera-17', '15 inches 1TB SSD 16 GB RAM', 4819, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(119, 'Camera18', 'camera-18', '15 inches 1TB SSD 16 GB RAM', 2947, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(120, 'Camera19', 'camera-19', '15 inches 1TB SSD 16 GB RAM', 9512, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-06-21 09:16:13', '2024-06-21 09:16:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 36, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(2, 22, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(3, 4, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(4, 27, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(5, 19, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(6, 2, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(7, 14, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(8, 80, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(9, 77, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(10, 102, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(11, 39, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(12, 116, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(13, 112, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(14, 44, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(15, 75, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(16, 34, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(17, 47, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(18, 87, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(19, 105, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(20, 8, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(21, 76, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(22, 10, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(23, 18, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(24, 19, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(25, 30, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(26, 48, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(27, 107, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(28, 30, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(29, 66, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(30, 42, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(31, 66, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(32, 39, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(33, 29, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(34, 112, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(35, 48, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(36, 43, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(37, 103, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(38, 2, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(39, 17, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(40, 30, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(41, 93, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(42, 93, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(43, 114, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(44, 98, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(45, 56, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(46, 119, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(47, 119, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(48, 67, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(49, 85, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(50, 108, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(51, 120, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(52, 74, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(53, 94, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(54, 17, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(55, 106, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(56, 29, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(57, 80, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(58, 111, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(59, 113, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(60, 102, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(61, 54, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(62, 114, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(63, 24, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(64, 58, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(65, 111, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(66, 73, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(67, 1, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(68, 37, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(69, 32, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(70, 38, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(71, 10, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(72, 6, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(73, 58, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(74, 102, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(75, 93, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(76, 45, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(77, 45, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(78, 2, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(79, 90, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(80, 39, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(81, 30, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(82, 49, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(83, 102, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(84, 116, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(85, 98, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(86, 60, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(87, 21, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(88, 95, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(89, 88, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(90, 84, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(91, 74, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(92, 15, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(93, 23, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(94, 28, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(95, 96, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(96, 77, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(97, 118, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(98, 58, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(99, 38, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(100, 5, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(101, 23, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(102, 107, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(103, 52, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(104, 27, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(105, 89, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(106, 54, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(107, 38, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(108, 39, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(109, 55, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(110, 118, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(111, 45, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(112, 90, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(113, 22, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(114, 72, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(115, 3, 2, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(116, 15, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(117, 38, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(118, 64, 1, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(119, 99, 3, '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(120, 26, 4, '2024-06-21 09:16:13', '2024-06-21 09:16:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Tag 0', 'tag-0', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(2, 'Tag 1', 'tag-1', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(3, 'Tag 2', 'tag-2', '2024-06-21 09:16:13', '2024-06-21 09:16:13'),
(4, 'Tag 3', 'tag-3', '2024-06-21 09:16:13', '2024-06-21 09:16:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `github_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `github_id`, `facebook_id`, `google_id`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Admin', 'admin@admin.com', 'users/default.png', NULL, NULL, NULL, NULL, '$2y$10$znl0mcQvPvRfAASEV0tccehaJbekT5yG0PDCfYq6DSGLxYvb/nktW', NULL, NULL, '2024-06-21 09:15:42', '2024-06-21 09:15:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`),
  ADD UNIQUE KEY `category_slug_unique` (`slug`);

--
-- Indeks untuk tabel `country_visits`
--
ALTER TABLE `country_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indeks untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indeks untuk tabel `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indeks untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indeks untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tag_product_id_foreign` (`product_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indeks untuk tabel `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `country_visits`
--
ALTER TABLE `country_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
