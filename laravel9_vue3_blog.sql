-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2023 at 03:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel9_vue3_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'Phone', '2023-09-29 05:33:14', '2023-09-29 05:33:14'),
(5, 'Fruits', '2023-09-29 05:33:34', '2023-09-29 05:33:34'),
(6, 'Test', '2023-09-30 17:29:06', '2023-09-30 17:29:06'),
(7, 'PHP', '2023-10-15 12:00:52', '2023-10-15 12:00:52'),
(8, 'C', '2023-10-15 12:01:00', '2023-10-15 12:01:00'),
(9, 'JS', '2023-10-15 12:01:07', '2023-10-15 12:01:07');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_09_29_084410_create_categories_table', 2),
(7, '2023_09_30_225001_create_posts_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `imagePath` varchar(255) NOT NULL,
  `body` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `user_id`, `category_id`, `imagePath`, `body`, `created_at`, `updated_at`) VALUES
(1, 'This is test post', 'this-is-test-post-1', 4, 6, 'storage/postsImages/75MnbT4NutDB8dOIoNvNIv0CkqnpSXIOs5ORVhrD.jpg', 'This is test post', '2023-10-10 12:28:00', '2023-10-10 12:28:00'),
(2, 'This is laravel', 'this-is-laravel-2', 4, 4, 'storage/postsImages/kXzlDRXVdkfnjUR1ULuInw8plKst9IIVVbQ8u857.png', 'This is laravel.', '2023-10-10 12:55:00', '2023-10-10 12:55:00'),
(3, 'This is javascript', 'this-is-javascript-3', 4, 4, 'storage/postsImages/tvgb0IomtDksfBWY2ULeE0GQWGtqRqUpMFNVcABw.jpg', 'This is javascript.', '2023-10-10 12:56:06', '2023-10-10 12:56:06'),
(4, 'This is jquery', 'this-is-jquery-4', 4, 4, 'storage/postsImages/PRHRxA6lPsKRbsAJxG5XezINJaONUobcMqMx3VUq.png', 'This is jquery.', '2023-10-10 12:57:04', '2023-10-10 12:57:04'),
(5, 'This is C22 language', 'this-is-c22-language-5', 4, 6, 'storage/postsImages/eIbx2uDXBdd1hjzCA5P0caovElXVNGLCw8ZPnoRo.png', 'This is c language2', '2023-10-10 12:57:57', '2023-10-15 09:30:17'),
(6, 'This is c plus plus', 'this-is-c-plus-plus-6', 4, 4, 'storage/postsImages/C2kWddMeutWLuyZRgCUiNDjsDkon2RuLBAAtrWjj.jpg', 'This is c plus plus.', '2023-10-10 12:58:44', '2023-10-10 12:58:44'),
(8, 'Javascript is a light weight programming language', 'javascript-is-a-light-weight-programming-language-8', 5, 4, 'storage/postsImages/2BwoWzYFsIfivxLMCFtQih9umTzkSUPHDLnKcshu.jpg', 'Javascript is a light weight programming language', '2023-10-15 10:15:19', '2023-10-15 10:15:19');

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
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mechelle Johnson', 'xyko@mailinator.com', NULL, '$2y$10$oTkZy5rZPYbLtAH4sZOUiOd0kN3aJR27PjY5BGnMgvfQOq5xhgZZi', NULL, NULL, NULL, '2023-09-28 23:28:41', '2023-09-28 23:28:41'),
(2, 'Alexis Sargent', 'luwogusyk@mailinator.com', NULL, '$2y$10$NA7MqTVBGb7ETJYKfrX30.Rz4.Y.Z8n6sHsAUDdlx8xiHTtiZU.eW', NULL, NULL, NULL, '2023-09-29 00:19:53', '2023-09-29 00:19:53'),
(3, 'zakir', 'zakir@gmail.com', NULL, '$2a$12$Fqz7d26o1Xbs1V.09F0/KugP9InRzM8R4B4DGNov/VfLnEoZFZpvG\n', NULL, NULL, NULL, '2023-09-29 06:32:03', '2023-09-29 06:32:03'),
(4, 'Zakir', 'zakir@textiletoday.com.bd', NULL, '$2y$10$JGFn3v3LsA3x0jtlUkDSs.gbeCGwkcg/y4RmU7tvxczVCoNyExyYa', NULL, NULL, NULL, '2023-09-29 00:40:13', '2023-09-29 00:40:13'),
(5, 'Parvez', 'parvez@gmail.com', NULL, '$2y$10$pz0v6Y0jimqp3MJ.8HePNuArRKa.s9Dd.e.ZmZsQwnptuUAMdOiRm', NULL, NULL, NULL, '2023-10-15 10:13:38', '2023-10-15 10:13:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
