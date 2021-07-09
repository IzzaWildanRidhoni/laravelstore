-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 09 Jul 2021 pada 16.10
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larashop_new`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('PUBLISH','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `books`
--

INSERT INTO `books` (`id`, `title`, `slug`, `description`, `author`, `publisher`, `cover`, `price`, `views`, `stock`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'The Book I', 'the-book', 'Description about the book', 'Muhammad Azamuddin', 'Indie', 'book-covers/YvYWJP3oMxFFoljkhaXSiPJ4m2ghKhKdSSr9rwrC.jpg', 199000.00, 0, 190, 'PUBLISH', 1, 1, NULL, '2020-12-15 02:22:07', '2020-12-15 02:39:57', NULL),
(2, 'How to be Ninja Developer', 'how-to-be-ninja-developer', 'The description', 'Muhammad Azamuddin', 'Indie', 'book-covers/jHkDYpgdlYWTuBWzrlFEIs40RvYAtZHE5V0Hdi6J.jpg', 299000.00, 0, 1, 'PUBLISH', 1, 1, NULL, '2020-12-15 03:44:34', '2021-07-08 06:41:46', NULL),
(4, 'How to be Rockstar Developer', 'how-to-be-rockstar-developer', 'The description about the book', 'Muhammad Azamuddin', 'Indie', 'book-covers/jEo54rhjbb8tCIXqzB5Hfu8XxAjORN2iEj1nVJSi.jpg', 290000.00, 0, 99, 'PUBLISH', 1, 1, NULL, '2020-12-15 03:46:40', '2021-07-08 06:41:59', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `book_category`
--

CREATE TABLE `book_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `book_category`
--

INSERT INTO `book_category` (`id`, `book_id`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 1, 3, NULL, NULL),
(3, 2, 5, NULL, NULL),
(4, 4, 7, NULL, NULL),
(5, 4, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `book_order`
--

CREATE TABLE `book_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `book_order`
--

INSERT INTO `book_order` (`id`, `order_id`, `book_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, NULL, NULL),
(2, 2, 4, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'berisi nama file image saja tanpa path',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Olah raga', 'olah-raga', 'category_image/vCck5nEmPP9KnKIpS2PYSdNWPBw4iIVaxF6i9MZp.jpg', 1, 1, NULL, NULL, '2020-12-14 09:46:08', '2021-07-08 06:40:18'),
(3, 'seni budaya', 'seni-budaya', 'category_image/iMvQiI3MBFJynp6JQB4ifY1DUWEbv7ziYCYpSeZL.jpg', 1, NULL, NULL, NULL, '2021-07-08 06:39:03', '2021-07-08 06:39:03'),
(4, 'sejarah', 'sejarah', 'category_image/OqjOqiadaJ6SbyWAJnPCIe5zbDrVNrcCmGMXMiJP.png', 1, NULL, NULL, NULL, '2021-07-08 06:39:24', '2021-07-08 06:39:24'),
(5, 'programming', 'programming', 'category_image/FNV8RSdgQHIz9IEMJuu1OloCz6Yu7sip31muOZfu.jpg', 1, NULL, NULL, NULL, '2021-07-08 06:39:36', '2021-07-08 06:39:36'),
(6, 'fiksi', 'fiksi', 'category_image/sm3GQEGHp6Le9qTlPbOdQ86UAdqMvQCE1C95QXR0.jpg', 1, NULL, NULL, NULL, '2021-07-08 06:39:44', '2021-07-08 06:39:44'),
(7, 'pendidikan dasar', 'pendidikan-dasar', 'category_image/M2AvoPIPXrZZszyKtObcpwBSAHbm7e2svQFlKdXL.jpg', 1, NULL, NULL, NULL, '2021-07-08 06:39:56', '2021-07-08 06:39:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_12_14_021856_penyesuaian_table_users', 2),
(6, '2020_12_14_092710_create_categories', 3),
(7, '2020_12_14_115414_create_books_table', 4),
(10, '2020_12_14_115606_create_book_category_table', 5),
(11, '2020_12_15_031924_create_orders_table', 6),
(12, '2020_12_15_032159_create_book_order_table', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` double(8,2) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('SUBMIT','PROCESS','FINISH','CANCEL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `invoice_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 299000.00, '202012140001', 'PROCESS', '2020-12-12 11:01:50', '2021-07-08 07:29:23'),
(2, 5, 580000.00, '202012250002', 'FINISH', '2020-12-25 11:01:57', '2021-07-08 07:29:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `roles`, `address`, `phone`, `avatar`, `status`) VALUES
(1, 'Administrator', 'administrator@larashop.test', NULL, '$2y$10$bVkzcLNUybkPB/87HSAhAundk.pqAv3u8t4jPeEX96ucKL9BR92hO', NULL, '2020-12-14 02:29:07', '2021-07-08 06:35:35', 'administrator', '[\"ADMIN\"]', 'Sarmili, Bintaro, Tangerang Selatan', '081392670813', 'avatars/1AjVjDfNIqc8bIJ9eThNAme6FTsZokRaSRdRRpl4.png', 'ACTIVE'),
(2, 'Muhammad Azamuddin', 'mas.azamuddin@gmail.com', NULL, '$2y$10$P7zYNFgcKVip77/.5k/dTup5mMCRq7cm7qg6nBWLOP7YLaIaYSDzG', NULL, '2020-12-14 03:20:07', '2021-07-08 06:35:52', 'azamuddin', '[\"CUSTOMER\"]', 'Jl Cempaka Sari III Jakarta Pusat\r\nKemayoran', '085781107766', 'avatars/uneZxB09fVRNvwcSafBU98ADah9bVZSiwQPrkaiM.png', 'ACTIVE'),
(4, 'Nadia N M', 'nadia.nm@gmail.com', NULL, '$2y$10$C3TgyddwCXcoca.m676Y9Osm//Qdc91FmK2nG8/3d9JULdEEYTOSq', NULL, '2020-12-15 03:48:42', '2021-07-08 06:36:09', 'nadia.nm', '[\"CUSTOMER\"]', NULL, '085781107755', 'avatars/2IWfrG6MOQySQfNB1XIaeVTFR9JpRi50QAJEeXBY.png', 'ACTIVE'),
(5, 'Johan Z D', 'johan.zd@gmail.com', NULL, '$2y$10$AKuoCook1Fuka8x10TyZwuLpxV4kB2I0JXPyFE0cpfQsqjgZQ1Pji', NULL, '2020-12-15 03:49:51', '2021-07-08 06:36:27', 'johan.zd', '[\"CUSTOMER\"]', NULL, '08578110744', 'avatars/W5VVr6vHJDkp6t9oevwnKNy5PYZzJ9uPFmhvHg78.png', 'ACTIVE'),
(6, 'wildan', 'wildan@gmail.com', NULL, '$2y$10$KmBVRyLJd43tNOsKfIdet.ctLLLBGiD/otr7JBMCDsyVnNQvlxKdC', NULL, '2021-07-09 00:10:20', '2021-07-09 00:10:20', 'wildan', '[\"STAFF\"]', 'kemloko bumiayu selopampang', '085643301532', 'avatars/G5iisFrjyYTQQZapi61eiEhXvyVOUg9Gc5Cwuo7U.png', 'ACTIVE'),
(7, 'yunika', 'yunika@gmail.com', NULL, '$2y$10$2/LNRpsKKMc3KKgRvCVjneTpxSWONZNyy7J8QMcUN9SUkSSfB07h6', NULL, '2021-07-09 00:13:10', '2021-07-09 00:13:10', 'yunika', '[\"CUSTOMER\"]', 'tanjung enim , palembang', '08612849190', 'avatars/Gte7HB188474LaTVCOkDUGJU7sVsiRismoJQ9cI7.png', 'ACTIVE');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_book_id_foreign` (`book_id`),
  ADD KEY `book_category_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `book_order`
--
ALTER TABLE `book_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_order_order_id_foreign` (`order_id`),
  ADD KEY `book_order_book_id_foreign` (`book_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `book_order`
--
ALTER TABLE `book_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `book_order`
--
ALTER TABLE `book_order`
  ADD CONSTRAINT `book_order_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
