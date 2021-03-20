-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 12 2021 г., 19:16
-- Версия сервера: 10.4.14-MariaDB
-- Версия PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `contacts` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `surname`, `status`, `phone`, `show_contacts`, `contacts`, `photo_profile`, `bg_profile`, `created_at`, `updated_at`) VALUES
(2, 1, 'Матиас', 'Привет!', '8-029-111-11-11', 1, NULL, '21_02_11_08_30_20.jpg', '21_02_11_11_56_18.jpg', '2021-02-04 18:19:29', '2021-02-11 20:56:18'),
(3, 2, 'Джонсон', 'Ола!', '8-029-333-33-33', 1, NULL, '21_02_09_11_36_35.jpg', '21_02_11_08_33_53.jpg', '2021-02-05 17:32:10', '2021-02-11 17:33:54'),
(4, 3, 'Лори', 'un do stress quatro!', '8-033-123-654-85', 1, NULL, '21_02_10_12_31_11.jpg', NULL, '2021-02-09 21:30:37', '2021-02-09 21:31:12'),
(5, 4, 'Темрали', 'Суть жизни – найти самого себя', '8-044-785-524-21', 1, NULL, '21_02_10_12_43_06.jpg', NULL, '2021-02-09 21:43:07', '2021-02-09 21:43:07'),
(6, 16, 'Патрик', 'Если ты искренне счастлив, без разницы, что люди думают.', '8-029-852-96-45', 1, NULL, '21_02_10_12_49_59.jpg', NULL, '2021-02-09 21:50:00', '2021-02-09 21:52:44');

-- --------------------------------------------------------

--
-- Структура таблицы `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `albums`
--

INSERT INTO `albums` (`id`, `user_id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Первый альбом', 'Начнем сначала', 'show', NULL, NULL),
(2, NULL, 'Второй ', 'Продолжаем', 'show', NULL, NULL),
(3, NULL, 'Третий', 'Не последний', 'show', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-11-06 16:31:36', '2020-11-06 16:31:36');

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'body', 'rich_text_box', 'Body', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'url', 'text', 'Url', 1, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'count', 'number', 'Count', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 7, 'lang', 'text', 'Lang', 1, 1, 1, 1, 1, 1, '{}', 6),
(62, 7, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 7),
(63, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(64, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(65, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(66, 8, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(67, 8, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(68, 8, 'files', 'image', 'Files', 0, 1, 1, 1, 1, 1, '{}', 4),
(69, 8, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 5),
(70, 8, 'album_id', 'text', 'Album Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(71, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(72, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(73, 8, 'galery_belongsto_album_relationship', 'relationship', 'albums', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Album\",\"table\":\"albums\",\"type\":\"belongsTo\",\"column\":\"album_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(74, 8, 'galery_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(75, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(76, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(77, 9, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(78, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(79, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(80, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(81, 10, 'music_id', 'text', 'Music Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(82, 10, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(83, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(84, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(85, 10, 'music_user_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":null}', 6),
(86, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(87, 11, 'user_id', 'number', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(88, 11, 'friend_id', 'number', 'Friend Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(89, 11, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 4),
(90, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(91, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(92, 11, 'friend_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":null}', 7),
(93, 1, 'user_hasmany_friend_relationship', 'relationship', 'friends', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Friend\",\"table\":\"friends\",\"type\":\"hasMany\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(94, 1, 'user_hasmany_friend_relationship_1', 'relationship', 'friends', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Friend\",\"table\":\"friends\",\"type\":\"hasMany\",\"column\":\"friend_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(95, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(96, 11, 'friend_belongsto_friend_relationship', 'relationship', 'friends', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"friends\",\"type\":\"belongsTo\",\"column\":\"friend_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":null}', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-11-06 16:31:35', '2020-11-20 17:06:54'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(7, 'maintexts', 'maintexts', 'Maintext', 'Maintexts', NULL, 'App\\Models\\Maintext', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-11-06 17:00:48', '2020-11-06 17:03:42'),
(8, 'galeries', 'galeries', 'Galery', 'Galeries', NULL, 'App\\Models\\Galery', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-11-06 17:11:43', '2020-11-06 17:20:48'),
(9, 'music', 'music', 'Music', 'Music', NULL, 'App\\Models\\Music', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-11-10 21:18:05', '2020-11-10 21:18:05'),
(10, 'music_users', 'music-users', 'Music User', 'Music Users', NULL, 'App\\Models\\MusicUser', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-11-10 21:31:10', '2020-11-10 21:31:10'),
(11, 'friends', 'friends', 'Friend', 'Friends', NULL, 'App\\Models\\Friend', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-11-20 16:53:18', '2020-11-20 16:53:18');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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
-- Структура таблицы `friends`
--

CREATE TABLE `friends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `friends`
--

INSERT INTO `friends` (`id`, `user_id`, `friend_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 15, NULL, '2020-11-20 17:35:25', '2020-11-20 17:35:25'),
(5, 2, 15, NULL, '2020-11-20 18:02:51', '2020-11-20 18:02:51'),
(6, 1, 3, NULL, '2020-12-14 18:35:48', '2020-12-14 18:35:48'),
(7, 1, 2, NULL, '2020-12-14 19:10:54', '2020-12-14 19:10:54'),
(8, 2, 1, NULL, '2020-12-18 18:30:06', '2020-12-18 18:30:06'),
(9, 3, 2, NULL, '2021-02-09 21:36:31', '2021-02-09 21:36:31'),
(10, 3, 4, NULL, '2021-02-09 21:36:49', '2021-02-09 21:36:49'),
(11, 3, 1, NULL, '2021-02-09 21:37:07', '2021-02-09 21:37:07'),
(12, 4, 2, NULL, '2021-02-09 21:45:01', '2021-02-09 21:45:01'),
(13, 4, 1, NULL, '2021-02-09 21:45:14', '2021-02-09 21:45:14'),
(14, 4, 19, NULL, '2021-02-09 21:45:27', '2021-02-09 21:45:27'),
(15, 16, 4, NULL, '2021-02-09 21:54:34', '2021-02-09 21:54:34'),
(16, 16, 3, NULL, '2021-02-09 21:55:09', '2021-02-09 21:55:09'),
(17, 1, 4, NULL, '2021-02-11 21:00:08', '2021-02-11 21:00:08');

-- --------------------------------------------------------

--
-- Структура таблицы `galeries`
--

CREATE TABLE `galeries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `album_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `galeries`
--

INSERT INTO `galeries` (`id`, `user_id`, `description`, `files`, `status`, `album_id`, `created_at`, `updated_at`) VALUES
(3, 1, '23-10-2020', '20_10_23_08_57_03.jpg', 'show', 3, '2020-10-23 17:57:03', '2020-10-23 17:57:03'),
(4, 1, '28-10-2020', '20_10_28_01_02_44.jpg', 'show', 1, '2020-10-27 22:02:45', '2020-10-27 22:02:45'),
(5, 1, '28-10-2020', '20_10_28_01_03_07.jpg', 'show', 1, '2020-10-27 22:03:07', '2020-10-27 22:03:07'),
(6, 1, '28-10-2020', '20_10_28_01_03_32.jpg', 'show', 1, '2020-10-27 22:03:32', '2020-10-27 22:03:32'),
(7, 1, '28-10-2020', '20_10_28_01_03_47.jpg', 'show', 2, '2020-10-27 22:03:48', '2020-10-27 22:03:48'),
(8, 1, '28-10-2020', '20_10_28_01_03_59.jpg', 'show', 2, '2020-10-27 22:03:59', '2020-10-27 22:03:59'),
(9, 1, '28-10-2020', '20_10_28_01_04_10.jpg', 'show', 2, '2020-10-27 22:04:10', '2020-10-27 22:04:10'),
(10, 1, '28-10-2020', '20_10_28_01_04_22.jpg', 'show', 1, '2020-10-27 22:04:22', '2020-10-27 22:04:22'),
(11, 1, '28-10-2020', '20_10_28_01_04_37.jpg', 'show', 3, '2020-10-27 22:04:37', '2020-10-27 22:04:37'),
(12, 1, '28-10-2020', '20_10_28_01_04_45.jpg', 'show', 3, '2020-10-27 22:04:45', '2020-10-27 22:04:45'),
(13, 1, '28-10-2020', '20_10_28_01_04_53.jpg', 'show', 3, '2020-10-27 22:04:54', '2020-10-27 22:04:54'),
(14, 1, '28-10-2020', '20_10_28_01_05_06.jpg', 'show', 1, '2020-10-27 22:05:06', '2020-10-27 22:05:06'),
(15, 1, NULL, 'galeries\\November2020\\KJjmKIeD9plll4DTpxXn.jpg', 'show', 1, '2020-11-06 17:21:00', '2020-11-06 17:21:54');

-- --------------------------------------------------------

--
-- Структура таблицы `last_messages`
--

CREATE TABLE `last_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `put_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `last_messages`
--

INSERT INTO `last_messages` (`id`, `user_id`, `friend_id`, `body`, `count`, `status`, `put_date`, `created_at`, `updated_at`) VALUES
(8, 1, 2, 'Для Марии', 4, NULL, '2021-02-10 01:24:13', '2020-12-18 18:58:57', '2021-02-09 22:24:13'),
(9, 2, 2, 'u1 trrtrtrt', 3, NULL, '2020-12-18 22:00:56', '2020-12-18 19:00:21', '2020-12-18 19:00:56'),
(10, 1, 3, 'Привет!', 1, NULL, '2021-02-10 01:23:49', '2021-02-09 22:23:49', '2021-02-09 22:23:49');

-- --------------------------------------------------------

--
-- Структура таблицы `mains`
--

CREATE TABLE `mains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `lang` enum('en','ru','pl','by') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ru',
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mains`
--

INSERT INTO `mains` (`id`, `user_id`, `comment`, `files`, `count`, `lang`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '<p>первый</p>\r\n', NULL, NULL, 'ru', 'show', '2020-10-10 18:53:40', '2020-10-10 18:53:40'),
(2, 1, '<p>первый</p>\r\n', NULL, NULL, 'ru', 'show', '2020-10-10 18:54:32', '2020-10-10 18:54:32'),
(3, 1, '', NULL, NULL, 'ru', 'show', '2020-10-19 16:20:20', '2020-10-19 16:20:20');

-- --------------------------------------------------------

--
-- Структура таблицы `maintexts`
--

CREATE TABLE `maintexts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) DEFAULT NULL,
  `lang` enum('en','ru','pl','by') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ru',
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `maintexts`
--

INSERT INTO `maintexts` (`id`, `name`, `body`, `url`, `count`, `lang`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Добро пожаловать на сайт!', 'Тело сайта (наполнить)', 'index', NULL, 'ru', 'show', NULL, NULL),
(2, 'Сообщества', 'Тело (наполнить)', 'groups', NULL, 'ru', 'show', NULL, NULL),
(3, 'Друзья', 'Тело (наполнить)', 'friends', NULL, 'ru', 'show', NULL, NULL),
(4, 'Новая статья (тест)', '<p><strong>Новая статья</strong></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Тест тест тест</strong></p>', 'test', NULL, 'ru', 'show', '2020-11-06 17:06:00', '2020-11-06 17:08:16');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(2, 'Setting_admin', '2020-11-06 18:08:44', '2020-11-06 18:08:44');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-11-06 16:31:35', '2020-11-06 16:31:35', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2020-11-06 16:31:35', '2020-11-06 16:31:35', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-11-06 16:31:35', '2020-11-06 16:31:35', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-11-06 16:31:35', '2020-11-06 16:31:35', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-11-06 16:31:35', '2020-11-06 16:31:35', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2020-11-06 16:31:35', '2020-11-06 16:31:35', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2020-11-06 16:31:35', '2020-11-06 16:31:35', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2020-11-06 16:31:35', '2020-11-06 16:31:35', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2020-11-06 16:31:35', '2020-11-06 16:31:35', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2020-11-06 16:31:35', '2020-11-06 16:31:35', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2020-11-06 16:31:36', '2020-11-06 16:31:36', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2020-11-06 16:31:36', '2020-11-06 16:31:36', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2020-11-06 16:31:36', '2020-11-06 16:31:36', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2020-11-06 16:31:36', '2020-11-06 16:31:36', 'voyager.hooks', NULL),
(15, 1, 'Maintexts', '', '_self', NULL, NULL, NULL, 15, '2020-11-06 17:00:48', '2020-11-06 17:00:48', 'voyager.maintexts.index', NULL),
(16, 1, 'Galeries', '', '_self', NULL, NULL, NULL, 16, '2020-11-06 17:11:43', '2020-11-06 17:11:43', 'voyager.galeries.index', NULL),
(17, 2, 'Ролевой доступ', 'admin/roles', '_self', 'voyager-params', '#aab5c0', NULL, 1, '2020-11-06 18:11:52', '2020-11-19 19:30:29', NULL, ''),
(19, 1, 'Music', '', '_self', NULL, NULL, NULL, 17, '2020-11-10 21:18:05', '2020-11-10 21:18:05', 'voyager.music.index', NULL),
(20, 1, 'Music Users', '', '_self', NULL, NULL, NULL, 18, '2020-11-10 21:31:10', '2020-11-10 21:31:10', 'voyager.music-users.index', NULL),
(21, 1, 'Friends', '', '_self', NULL, NULL, NULL, 19, '2020-11-20 16:53:18', '2020-11-20 16:53:18', 'voyager.friends.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` int(11) NOT NULL,
  `resiver_id` int(11) NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `resiver_id`, `body`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'любой текст', NULL, NULL, NULL),
(2, 0, 0, 'тест текст', NULL, NULL, NULL),
(3, 2, 1, 'тест текст', NULL, NULL, NULL),
(4, 3, 4, 'test test test', NULL, NULL, NULL),
(5, 5, 6, 'новое сообщение', NULL, NULL, NULL),
(6, 1, 2, 'привет', NULL, NULL, NULL),
(7, 2, 1, 'hello', NULL, NULL, NULL),
(8, 2, 1, 'khkjhkjhkjhk', NULL, NULL, NULL),
(9, 5, 3, 'khkhhkjhkhkhkhk', NULL, NULL, NULL),
(10, 2, 1, 'rtetetteetettretr', NULL, NULL, NULL),
(11, 1, 2, 'nm,n,mn,mn,n,m', NULL, NULL, NULL),
(12, 1, 2, ',kf ,kf ,kf', NULL, NULL, NULL),
(13, 2, 3, 'asdadadsadsadsadsadsads', NULL, NULL, NULL),
(14, 1, 2, '02/12/2020 test', NULL, NULL, NULL),
(15, 2, 1, 'last test', NULL, NULL, NULL),
(16, 1, 2, 'привет', NULL, '2020-12-02 17:09:18', '2020-12-02 17:09:18'),
(17, 1, 2, 'новое сообщение', NULL, '2020-12-02 18:18:20', '2020-12-02 18:18:20'),
(18, 1, 2, 'проверка времени', NULL, NULL, NULL),
(19, 1, 2, 'тест', NULL, '2020-12-02 18:22:44', '2020-12-02 18:22:44'),
(20, 1, 2, 'jlkjlkjlkj jljjlkjlkjl jlkjlkjl jkljlkjlk jhllkjlk hljlkj hlhlhj jhjlkhkl', NULL, '2020-12-02 18:29:07', '2020-12-02 18:29:07'),
(21, 1, 2, 'jljlkjl', NULL, '2020-12-14 17:06:42', '2020-12-14 17:06:42'),
(22, 1, 2, 'новое сообщение', NULL, '2020-12-14 17:07:34', '2020-12-14 17:07:34'),
(23, 1, 2, '12345', NULL, NULL, NULL),
(24, 2, 1, '98765', NULL, NULL, NULL),
(25, 2, 1, '456895', NULL, NULL, NULL),
(26, 2, 2, 'hkjhkjhkjhk', NULL, '2020-12-14 17:17:18', '2020-12-14 17:17:18'),
(27, 2, 1, 'новое', NULL, '2020-12-14 17:17:48', '2020-12-14 17:17:48'),
(28, 1, 2, '45464665', NULL, '2020-12-14 17:18:08', '2020-12-14 17:18:08'),
(29, 1, 2, 'цуцкцкцуукуц', NULL, NULL, NULL),
(30, 1, 2, ';lk;lkl;k;lk;lk;', NULL, '2020-12-14 17:21:51', '2020-12-14 17:21:51'),
(31, 2, 1, 'n,mnbbncvbvcvb', NULL, '2020-12-14 17:22:19', '2020-12-14 17:22:19'),
(32, 1, 2, '4444444', NULL, NULL, NULL),
(33, 1, 2, '555555555', NULL, '2020-12-14 17:24:39', '2020-12-14 17:24:39'),
(34, 1, 2, 'аааааа', NULL, '2020-12-14 17:25:40', '2020-12-14 17:25:40'),
(35, 2, 1, 'ммммммм', NULL, '2020-12-14 17:26:16', '2020-12-14 17:26:16'),
(36, 2, 1, 'рррррр', NULL, '2020-12-14 17:26:46', '2020-12-14 17:26:46'),
(37, 1, 2, 'кккккккк', NULL, '2020-12-14 17:31:43', '2020-12-14 17:31:43'),
(38, 1, 2, 'вввввввв', NULL, NULL, NULL),
(39, 1, 2, '111111111111111', NULL, '2020-12-14 17:39:35', '2020-12-14 17:39:35'),
(40, 1, 2, '222222222222222222', NULL, '2020-12-14 17:43:45', '2020-12-14 17:43:45'),
(41, 1, 2, '3333333333333', NULL, '2020-12-14 17:44:14', '2020-12-14 17:44:14'),
(42, 2, 1, '4444444444444444444444', NULL, '2020-12-14 17:44:39', '2020-12-14 17:44:39'),
(43, 1, 2, '55555555555555', NULL, '2020-12-14 17:47:07', '2020-12-14 17:47:07'),
(44, 2, 1, '66666666666', NULL, '2020-12-14 17:48:27', '2020-12-14 17:48:27'),
(45, 1, 2, '77777777777777', NULL, '2020-12-14 17:48:53', '2020-12-14 17:48:53'),
(46, 2, 1, '888888888888888', NULL, '2020-12-14 17:49:04', '2020-12-14 17:49:04'),
(47, 1, 2, '99999999999999999', NULL, '2020-12-14 17:49:14', '2020-12-14 17:49:14'),
(48, 1, 2, '11111111111111111', NULL, '2020-12-14 17:50:09', '2020-12-14 17:50:09'),
(49, 2, 1, '222222222222222', NULL, '2020-12-14 17:50:15', '2020-12-14 17:50:15'),
(50, 1, 2, '333333333333333', NULL, '2020-12-14 17:50:27', '2020-12-14 17:50:27'),
(51, 2, 1, '4444444444444', NULL, '2020-12-14 17:50:35', '2020-12-14 17:50:35'),
(52, 1, 2, '55555555555', NULL, '2020-12-14 17:50:43', '2020-12-14 17:50:43'),
(53, 2, 1, '66666666666666', NULL, '2020-12-14 17:50:48', '2020-12-14 17:50:48'),
(54, 1, 2, '7777777777', NULL, '2020-12-14 17:51:11', '2020-12-14 17:51:11'),
(55, 2, 1, '888888888888', NULL, '2020-12-14 17:51:16', '2020-12-14 17:51:16'),
(56, 1, 2, '999999999999', NULL, '2020-12-14 17:51:22', '2020-12-14 17:51:22'),
(57, 2, 1, '1010101010', NULL, '2020-12-14 17:51:29', '2020-12-14 17:51:29'),
(58, 1, 2, '11111111111111', NULL, '2020-12-14 17:51:36', '2020-12-14 17:51:36'),
(59, 2, 1, '2222222222222222222', NULL, '2020-12-14 17:51:41', '2020-12-14 17:51:41'),
(60, 1, 2, '333333333', NULL, '2020-12-14 17:51:46', '2020-12-14 17:51:46'),
(61, 2, 1, '44444444444444', NULL, '2020-12-14 17:51:51', '2020-12-14 17:51:51'),
(62, 1, 2, '5555555555555', NULL, '2020-12-14 17:52:01', '2020-12-14 17:52:01'),
(63, 2, 1, '666666666666666', NULL, '2020-12-14 17:52:06', '2020-12-14 17:52:06'),
(64, 1, 2, '7777777777777', NULL, '2020-12-14 17:52:12', '2020-12-14 17:52:12'),
(65, 2, 1, '8888888888888', NULL, '2020-12-14 17:52:16', '2020-12-14 17:52:16'),
(66, 1, 2, '11111111111111111111', NULL, '2020-12-14 17:55:10', '2020-12-14 17:55:10'),
(67, 2, 1, '2222222222222', NULL, '2020-12-14 17:55:23', '2020-12-14 17:55:23'),
(68, 1, 2, '33333333333333333', NULL, '2020-12-14 17:56:12', '2020-12-14 17:56:12'),
(69, 2, 1, '4444444444', NULL, '2020-12-14 17:56:22', '2020-12-14 17:56:22'),
(70, 1, 2, '555555555555', NULL, '2020-12-14 17:56:34', '2020-12-14 17:56:34'),
(71, 2, 1, '6666666666666', NULL, '2020-12-14 17:56:39', '2020-12-14 17:56:39'),
(72, 1, 2, '7777777777', NULL, '2020-12-14 17:56:49', '2020-12-14 17:56:49'),
(73, 2, 1, '888888888888', NULL, '2020-12-14 17:56:57', '2020-12-14 17:56:57'),
(74, 1, 2, '999999999999', NULL, '2020-12-14 17:57:06', '2020-12-14 17:57:06'),
(75, 1, 2, '1111111111111', NULL, '2020-12-14 17:57:46', '2020-12-14 17:57:46'),
(76, 2, 1, '22222222222222', NULL, '2020-12-14 17:57:50', '2020-12-14 17:57:50'),
(77, 1, 2, '3333333333', NULL, '2020-12-14 17:57:56', '2020-12-14 17:57:56'),
(78, 1, 2, 'AAAAAAAAAAAAAA', NULL, '2020-12-14 18:06:02', '2020-12-14 18:06:02'),
(79, 2, 1, 'BBBBBBBBBBBBBBB', NULL, '2020-12-14 18:06:08', '2020-12-14 18:06:08'),
(80, 1, 2, 'CCCCCCCCC', NULL, '2020-12-14 18:06:15', '2020-12-14 18:06:15'),
(81, 2, 1, 'DDDDDDDDDDDD', NULL, '2020-12-14 18:06:21', '2020-12-14 18:06:21'),
(82, 1, 2, '111111111111111111', NULL, '2020-12-14 18:07:59', '2020-12-14 18:07:59'),
(83, 2, 1, '2222222222', NULL, '2020-12-14 18:08:03', '2020-12-14 18:08:03'),
(84, 1, 2, '333333333', NULL, '2020-12-14 18:08:09', '2020-12-14 18:08:09'),
(85, 2, 1, '4444444444', NULL, '2020-12-14 18:08:13', '2020-12-14 18:08:13'),
(86, 1, 2, '5555555555', NULL, '2020-12-14 18:08:22', '2020-12-14 18:08:22'),
(87, 2, 1, '6666666666', NULL, '2020-12-14 18:08:27', '2020-12-14 18:08:27'),
(88, 1, 2, '777777777777', NULL, '2020-12-14 18:08:32', '2020-12-14 18:08:32'),
(89, 2, 1, '8888888888', NULL, '2020-12-14 18:08:36', '2020-12-14 18:08:36'),
(90, 1, 2, '999999999999', NULL, '2020-12-14 18:08:42', '2020-12-14 18:08:42'),
(91, 2, 1, '101010', NULL, '2020-12-14 18:08:47', '2020-12-14 18:08:47'),
(92, 1, 2, '1111', NULL, '2020-12-14 18:08:51', '2020-12-14 18:08:51'),
(93, 2, 1, '121212', NULL, '2020-12-14 18:08:56', '2020-12-14 18:08:56'),
(94, 1, 2, '13131313', NULL, '2020-12-14 18:09:04', '2020-12-14 18:09:04'),
(95, 2, 1, '1414147', NULL, '2020-12-14 18:09:09', '2020-12-14 18:09:09'),
(96, 1, 2, '111111111111111', NULL, '2020-12-14 18:09:14', '2020-12-14 18:09:14'),
(97, 2, 1, '222222222', NULL, '2020-12-14 18:09:17', '2020-12-14 18:09:17'),
(98, 1, 2, '36333333333333333', NULL, '2020-12-14 18:09:22', '2020-12-14 18:09:22'),
(99, 2, 1, '444444444', NULL, '2020-12-14 18:09:26', '2020-12-14 18:09:26'),
(100, 1, 2, '1111111111', NULL, '2020-12-14 18:11:35', '2020-12-14 18:11:35'),
(101, 2, 1, '2222', NULL, '2020-12-14 18:11:38', '2020-12-14 18:11:38'),
(102, 1, 2, '3333333333', NULL, '2020-12-14 18:11:42', '2020-12-14 18:11:42'),
(103, 2, 1, '44444444444', NULL, '2020-12-14 18:11:45', '2020-12-14 18:11:45'),
(104, 1, 2, '555555555', NULL, '2020-12-14 18:11:50', '2020-12-14 18:11:50'),
(105, 2, 1, '666666666666', NULL, '2020-12-14 18:11:53', '2020-12-14 18:11:53'),
(106, 1, 2, '777777777777', NULL, '2020-12-14 18:11:57', '2020-12-14 18:11:57'),
(107, 2, 1, '888888888888', NULL, '2020-12-14 18:12:00', '2020-12-14 18:12:00'),
(108, 1, 2, '99999999999', NULL, '2020-12-14 18:12:04', '2020-12-14 18:12:04'),
(109, 2, 1, '11111111111111111111', NULL, '2020-12-14 18:12:09', '2020-12-14 18:12:09'),
(110, 1, 2, '22222222222222', NULL, '2020-12-14 18:12:12', '2020-12-14 18:12:12'),
(111, 2, 1, '3333333333333333333', NULL, '2020-12-14 18:12:16', '2020-12-14 18:12:16'),
(112, 1, 2, '4444444444444', NULL, '2020-12-14 18:12:20', '2020-12-14 18:12:20'),
(113, 2, 1, '555555555555', NULL, '2020-12-14 18:12:23', '2020-12-14 18:12:23'),
(114, 1, 2, '66666666666', NULL, '2020-12-14 18:12:27', '2020-12-14 18:12:27'),
(115, 2, 1, '7777777777777', NULL, '2020-12-14 18:12:31', '2020-12-14 18:12:31'),
(116, 1, 2, '888888888888888', NULL, '2020-12-14 18:12:35', '2020-12-14 18:12:35'),
(117, 1, 15, 'ghfgfh', NULL, '2020-12-18 17:08:02', '2020-12-18 17:08:02'),
(118, 1, 2, 'jljljk', NULL, '2020-12-18 17:10:10', '2020-12-18 17:10:10'),
(119, 1, 15, 'lkjlkjlkj', NULL, '2020-12-18 17:10:34', '2020-12-18 17:10:34'),
(120, 1, 4, 'kjljkjlk', NULL, '2020-12-18 17:10:47', '2020-12-18 17:10:47'),
(121, 1, 15, 'dgfdgf', NULL, '2020-12-18 17:22:26', '2020-12-18 17:22:26'),
(122, 1, 2, '46546546465', NULL, '2020-12-18 17:24:34', '2020-12-18 17:24:34'),
(123, 1, 3, '45649687897', NULL, '2020-12-18 17:33:38', '2020-12-18 17:33:38'),
(124, 1, 3, '8989', NULL, '2020-12-18 17:52:49', '2020-12-18 17:52:49'),
(125, 1, 15, 'jljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipo', NULL, '2020-12-18 17:56:55', '2020-12-18 17:56:55'),
(126, 1, 15, 'jljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipo', NULL, '2020-12-18 18:00:27', '2020-12-18 18:00:27'),
(127, 1, 15, 'hgkhkhjhkhkhkhkhkhkhkhkhkhkhkhkhkhkjhkjhkjhkjhkjhkjhkjhkjhgkhkhjhkhkhkhkhkhkhkhkhkhkhkhkhkhkjhkjhkjhkjhkjhkjhkjhkj', NULL, '2020-12-18 18:01:28', '2020-12-18 18:01:28'),
(128, 1, 15, 'jljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljljjjfdkkl;k;lk;k;k;ipipipoipipipipipipipipipipipipojljljl', NULL, '2020-12-18 18:03:11', '2020-12-18 18:03:11'),
(129, 1, 4, '65464654654', NULL, '2020-12-18 18:03:55', '2020-12-18 18:03:55'),
(130, 1, 3, '3', NULL, '2020-12-18 18:22:12', '2020-12-18 18:22:12'),
(131, 1, 2, '2', NULL, '2020-12-18 18:22:22', '2020-12-18 18:22:22'),
(132, 1, 15, '4', NULL, '2020-12-18 18:22:30', '2020-12-18 18:22:30'),
(133, 1, 4, 't2', NULL, '2020-12-18 18:22:48', '2020-12-18 18:22:48'),
(134, 1, 4, 't2 25', NULL, '2020-12-18 18:23:41', '2020-12-18 18:23:41'),
(135, 1, 2, 'u2 8', NULL, '2020-12-18 18:26:14', '2020-12-18 18:26:14'),
(136, 1, 3, 'u3 9', NULL, '2020-12-18 18:26:36', '2020-12-18 18:26:36'),
(137, 1, 15, '4n 6', NULL, '2020-12-18 18:27:41', '2020-12-18 18:27:41'),
(138, 1, 3, 'u3 9', NULL, '2020-12-18 18:27:53', '2020-12-18 18:27:53'),
(139, 1, 4, 't2 5', NULL, '2020-12-18 18:28:06', '2020-12-18 18:28:06'),
(140, 2, 1, 'rtrrututuy', NULL, '2020-12-18 18:30:17', '2020-12-18 18:30:17'),
(141, 2, 1, 'u1 8', NULL, '2020-12-18 18:30:31', '2020-12-18 18:30:31'),
(142, 1, 2, 'u2 5', NULL, '2020-12-18 18:31:49', '2020-12-18 18:31:49'),
(143, 1, 2, 'u2 56465456', NULL, '2020-12-18 18:32:23', '2020-12-18 18:32:23'),
(144, 1, 2, 'u2 new', NULL, '2020-12-18 18:33:28', '2020-12-18 18:33:28'),
(145, 1, 2, 'u2 jlkjljl', NULL, '2020-12-18 18:58:57', '2020-12-18 18:58:57'),
(146, 2, 1, 'u1 k;k;k;k;', NULL, '2020-12-18 18:59:24', '2020-12-18 18:59:24'),
(147, 2, 2, 'u1 new ', NULL, '2020-12-18 19:00:21', '2020-12-18 19:00:21'),
(148, 2, 2, 'u1 k;k;k;k;k', NULL, '2020-12-18 19:00:47', '2020-12-18 19:00:47'),
(149, 2, 2, 'u1 trrtrtrt', NULL, '2020-12-18 19:00:56', '2020-12-18 19:00:56'),
(150, 2, 1, 'u1 bbbbb', NULL, '2020-12-18 19:01:11', '2020-12-18 19:01:11'),
(151, 1, 3, 'Привет!', NULL, '2021-02-09 22:23:49', '2021-02-09 22:23:49'),
(152, 1, 2, 'Для Марии', NULL, '2021-02-09 22:24:13', '2021-02-09 22:24:13');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_09_170918_create_maintexts_table', 2),
(5, '2020_10_10_212835_create_mains_table', 3),
(6, '2020_10_14_210207_create_galeries_table', 4),
(7, '2020_10_14_210819_create_albums_table', 4),
(8, '2020_10_21_192902_create_publications_table', 5),
(9, '2020_10_28_201552_create_properties_table', 6),
(10, '2020_10_30_190824_create_music_table', 7),
(11, '2020_10_30_193330_create_music_users_table', 8),
(12, '2020_11_03_202423_create_movies_table', 9),
(13, '2020_11_03_225055_create_movie_users_table', 10),
(14, '2020_11_04_201727_create_friends_table', 11),
(15, '2016_01_01_000000_add_voyager_user_fields', 12),
(16, '2016_01_01_000000_create_data_types_table', 12),
(17, '2016_05_19_173453_create_menu_table', 12),
(18, '2016_10_21_190000_create_roles_table', 12),
(19, '2016_10_21_190000_create_settings_table', 12),
(20, '2016_11_30_135954_create_permission_table', 12),
(21, '2016_11_30_141208_create_permission_role_table', 12),
(22, '2016_12_26_201236_data_types__add__server_side', 12),
(23, '2017_01_13_000000_add_route_to_menu_items_table', 12),
(24, '2017_01_14_005015_create_translations_table', 12),
(25, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 12),
(26, '2017_03_06_000000_add_controller_to_data_types_table', 12),
(27, '2017_04_21_000000_add_order_to_data_rows_table', 12),
(28, '2017_07_05_210000_add_policyname_to_data_types_table', 12),
(29, '2017_08_05_000000_add_group_to_settings_table', 12),
(30, '2017_11_26_013050_add_user_role_relationship', 12),
(31, '2017_11_26_015000_create_user_roles_table', 12),
(32, '2018_03_11_000000_add_user_settings', 12),
(33, '2018_03_14_000000_add_details_to_data_types_table', 12),
(34, '2018_03_16_000000_make_settings_value_nullable', 12),
(35, '2016_01_01_000000_create_pages_table', 13),
(36, '2016_01_01_000000_create_posts_table', 13),
(37, '2016_02_15_204651_create_categories_table', 13),
(38, '2017_04_11_000000_alter_post_nullable_fields_table', 13),
(39, '2020_11_30_200509_create_messages_table', 14),
(40, '2020_12_14_214223_create_last_messages_table', 15),
(41, '2021_02_04_195631_create_accounts_table', 16);

-- --------------------------------------------------------

--
-- Структура таблицы `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `movies`
--

INSERT INTO `movies` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'брат', 1, '2020-12-18 16:23:39', '2020-12-18 16:23:39'),
(2, 'поймай меня', 1, '2020-12-18 16:29:53', '2020-12-18 16:29:53'),
(3, 'если сможешь', 1, '2020-12-18 16:29:53', '2020-12-18 16:29:53'),
(4, 'Игра на понижение', 3, '2021-02-09 21:32:51', '2021-02-09 21:32:51');

-- --------------------------------------------------------

--
-- Структура таблицы `movie_users`
--

CREATE TABLE `movie_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `movie_users`
--

INSERT INTO `movie_users` (`id`, `movie_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-12-18 16:23:39', '2020-12-18 16:23:39'),
(2, 2, 1, '2020-12-18 16:29:53', '2020-12-18 16:29:53'),
(3, 3, 1, '2020-12-18 16:29:53', '2020-12-18 16:29:53'),
(4, 4, 3, '2021-02-09 21:32:51', '2021-02-09 21:32:51');

-- --------------------------------------------------------

--
-- Структура таблицы `music`
--

CREATE TABLE `music` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `music`
--

INSERT INTO `music` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(33, 'Земфира', 1, '2020-10-30 18:11:01', '2020-10-30 18:11:01'),
(34, 'Сплин', 1, '2020-10-30 18:11:01', '2020-10-30 18:11:01'),
(35, 'Чайф', 1, '2020-10-30 18:11:01', '2020-10-30 18:11:01'),
(36, 'Би2', 1, '2020-10-30 18:11:01', '2020-10-30 18:11:01'),
(37, 'Крематорий', 1, '2020-10-30 18:11:28', '2020-10-30 18:11:28'),
(39, 'Линда', 1, '2020-10-30 18:17:54', '2020-10-30 18:17:54'),
(53, 'Бутусов', 1, '2020-11-04 15:51:53', '2020-11-04 15:51:53'),
(54, 'jljlkjlk', 1, '2020-11-30 16:30:08', '2020-11-30 16:30:08'),
(55, 'Меладзе', 2, '2021-02-09 20:39:02', '2021-02-09 20:39:02'),
(56, 'Монатик', 2, '2021-02-09 20:39:02', '2021-02-09 20:39:02'),
(57, 'Монеточка', 2, '2021-02-09 20:39:02', '2021-02-09 20:39:02'),
(58, 'Intelligency', 3, '2021-02-09 21:32:51', '2021-02-09 21:32:51'),
(59, 'Little Big', 3, '2021-02-09 21:32:51', '2021-02-09 21:32:51'),
(60, 'MARUV', 3, '2021-02-09 21:32:51', '2021-02-09 21:32:51'),
(61, 'Время и Стекло', 4, '2021-02-09 21:44:39', '2021-02-09 21:44:39'),
(62, 'LOBODA', 4, '2021-02-09 21:44:39', '2021-02-09 21:44:39'),
(63, 'KAZKA', 16, '2021-02-09 21:51:37', '2021-02-09 21:51:37'),
(64, 'Потап и Настя', 16, '2021-02-09 21:51:37', '2021-02-09 21:51:37'),
(65, 'Burito', 16, '2021-02-09 21:51:37', '2021-02-09 21:51:37');

-- --------------------------------------------------------

--
-- Структура таблицы `music_users`
--

CREATE TABLE `music_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `music_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `music_users`
--

INSERT INTO `music_users` (`id`, `music_id`, `user_id`, `created_at`, `updated_at`) VALUES
(38, 33, 1, '2020-10-30 18:11:01', '2020-10-30 18:11:01'),
(39, 34, 1, '2020-10-30 18:11:01', '2020-10-30 18:11:01'),
(40, 35, 1, '2020-10-30 18:11:01', '2020-10-30 18:11:01'),
(44, 39, 1, '2020-10-30 18:17:54', '2020-10-30 18:17:54'),
(59, 53, 1, '2020-11-04 15:51:53', '2020-11-04 15:51:53'),
(60, 36, 1, '2020-11-29 21:07:23', '2020-11-29 21:07:23'),
(62, 55, 2, '2021-02-09 20:39:02', '2021-02-09 20:39:02'),
(63, 56, 2, '2021-02-09 20:39:02', '2021-02-09 20:39:02'),
(64, 57, 2, '2021-02-09 20:39:02', '2021-02-09 20:39:02'),
(65, 58, 3, '2021-02-09 21:32:51', '2021-02-09 21:32:51'),
(66, 59, 3, '2021-02-09 21:32:51', '2021-02-09 21:32:51'),
(67, 60, 3, '2021-02-09 21:32:51', '2021-02-09 21:32:51'),
(68, 61, 4, '2021-02-09 21:44:39', '2021-02-09 21:44:39'),
(69, 62, 4, '2021-02-09 21:44:39', '2021-02-09 21:44:39'),
(70, 63, 16, '2021-02-09 21:51:37', '2021-02-09 21:51:37'),
(71, 64, 16, '2021-02-09 21:51:37', '2021-02-09 21:51:37'),
(72, 65, 16, '2021-02-09 21:51:37', '2021-02-09 21:51:37');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-11-06 16:31:36', '2020-11-06 16:31:36');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(2, 'browse_bread', NULL, '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(3, 'browse_database', NULL, '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(4, 'browse_media', NULL, '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(5, 'browse_compass', NULL, '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(6, 'browse_menus', 'menus', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(7, 'read_menus', 'menus', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(8, 'edit_menus', 'menus', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(9, 'add_menus', 'menus', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(10, 'delete_menus', 'menus', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(11, 'browse_roles', 'roles', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(12, 'read_roles', 'roles', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(13, 'edit_roles', 'roles', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(14, 'add_roles', 'roles', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(15, 'delete_roles', 'roles', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(16, 'browse_users', 'users', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(17, 'read_users', 'users', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(18, 'edit_users', 'users', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(19, 'add_users', 'users', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(20, 'delete_users', 'users', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(21, 'browse_settings', 'settings', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(22, 'read_settings', 'settings', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(23, 'edit_settings', 'settings', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(24, 'add_settings', 'settings', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(25, 'delete_settings', 'settings', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(26, 'browse_categories', 'categories', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(27, 'read_categories', 'categories', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(28, 'edit_categories', 'categories', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(29, 'add_categories', 'categories', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(30, 'delete_categories', 'categories', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(31, 'browse_posts', 'posts', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(32, 'read_posts', 'posts', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(33, 'edit_posts', 'posts', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(34, 'add_posts', 'posts', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(35, 'delete_posts', 'posts', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(36, 'browse_pages', 'pages', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(37, 'read_pages', 'pages', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(38, 'edit_pages', 'pages', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(39, 'add_pages', 'pages', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(40, 'delete_pages', 'pages', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(41, 'browse_hooks', NULL, '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(42, 'browse_maintexts', 'maintexts', '2020-11-06 17:00:48', '2020-11-06 17:00:48'),
(43, 'read_maintexts', 'maintexts', '2020-11-06 17:00:48', '2020-11-06 17:00:48'),
(44, 'edit_maintexts', 'maintexts', '2020-11-06 17:00:48', '2020-11-06 17:00:48'),
(45, 'add_maintexts', 'maintexts', '2020-11-06 17:00:48', '2020-11-06 17:00:48'),
(46, 'delete_maintexts', 'maintexts', '2020-11-06 17:00:48', '2020-11-06 17:00:48'),
(47, 'browse_galeries', 'galeries', '2020-11-06 17:11:43', '2020-11-06 17:11:43'),
(48, 'read_galeries', 'galeries', '2020-11-06 17:11:43', '2020-11-06 17:11:43'),
(49, 'edit_galeries', 'galeries', '2020-11-06 17:11:43', '2020-11-06 17:11:43'),
(50, 'add_galeries', 'galeries', '2020-11-06 17:11:43', '2020-11-06 17:11:43'),
(51, 'delete_galeries', 'galeries', '2020-11-06 17:11:43', '2020-11-06 17:11:43'),
(52, 'browse_music', 'music', '2020-11-10 21:18:05', '2020-11-10 21:18:05'),
(53, 'read_music', 'music', '2020-11-10 21:18:05', '2020-11-10 21:18:05'),
(54, 'edit_music', 'music', '2020-11-10 21:18:05', '2020-11-10 21:18:05'),
(55, 'add_music', 'music', '2020-11-10 21:18:05', '2020-11-10 21:18:05'),
(56, 'delete_music', 'music', '2020-11-10 21:18:05', '2020-11-10 21:18:05'),
(57, 'browse_music_users', 'music_users', '2020-11-10 21:31:10', '2020-11-10 21:31:10'),
(58, 'read_music_users', 'music_users', '2020-11-10 21:31:10', '2020-11-10 21:31:10'),
(59, 'edit_music_users', 'music_users', '2020-11-10 21:31:10', '2020-11-10 21:31:10'),
(60, 'add_music_users', 'music_users', '2020-11-10 21:31:10', '2020-11-10 21:31:10'),
(61, 'delete_music_users', 'music_users', '2020-11-10 21:31:10', '2020-11-10 21:31:10'),
(62, 'browse_friends', 'friends', '2020-11-20 16:53:18', '2020-11-20 16:53:18'),
(63, 'read_friends', 'friends', '2020-11-20 16:53:18', '2020-11-20 16:53:18'),
(64, 'edit_friends', 'friends', '2020-11-20 16:53:18', '2020-11-20 16:53:18'),
(65, 'add_friends', 'friends', '2020-11-20 16:53:18', '2020-11-20 16:53:18'),
(66, 'delete_friends', 'friends', '2020-11-20 16:53:18', '2020-11-20 16:53:18');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-06 16:31:36', '2020-11-06 16:31:36');

-- --------------------------------------------------------

--
-- Структура таблицы `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `born` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maritalStatus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aboutMe` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `properties`
--

INSERT INTO `properties` (`id`, `user_id`, `born`, `gender`, `city`, `maritalStatus`, `aboutMe`, `created_at`, `updated_at`) VALUES
(1, 1, '1994-01-10', 'Мужской', 'Гомель', 'married', 'Что-то', '2020-10-28 18:13:33', '2020-12-04 16:23:23'),
(2, 2, '1986-06-04', 'Женский', 'Минск', 'inSearch', '', '2020-12-04 16:25:55', '2021-02-09 20:39:02'),
(3, 3, '2000-11-23', 'Женский', 'Гомель', 'inRelationship', '', '2020-12-04 18:17:51', '2021-02-09 21:38:16'),
(4, 4, '2000-01-01', 'Мужской', 'Солигорск', 'idle', '', '2021-01-15 18:00:30', '2021-02-09 21:44:39'),
(5, 16, '1987-06-25', 'Женский', 'Брест', 'married', '', '2021-02-09 21:51:37', '2021-02-09 21:51:37');

-- --------------------------------------------------------

--
-- Структура таблицы `publications`
--

CREATE TABLE `publications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','private','for_friends','hide','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `publications`
--

INSERT INTO `publications` (`id`, `body`, `status`, `type`, `group_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '<p>запись 3</p>', 'active', '', 0, 1, '2020-10-21 17:23:06', '2020-10-21 17:23:06'),
(2, '<p>привет</p>', 'active', '', 0, 1, '2020-10-21 17:38:00', '2020-10-21 17:38:00'),
(3, '<p>1</p>', 'active', '', 0, 1, '2020-10-21 17:40:23', '2020-10-21 17:40:23'),
(4, '<p>2</p>', 'active', '', 0, 1, '2020-10-21 17:40:45', '2020-10-21 17:40:45'),
(5, '<p>3</p>', 'active', '', 0, 1, '2020-10-21 17:40:49', '2020-10-21 17:40:49'),
(6, '<p>5</p>', 'active', '', 0, 1, '2020-10-21 17:40:53', '2020-10-21 17:40:53'),
(7, '<p>Hello world!</p>', 'active', '', 0, 1, '2020-11-11 17:54:44', '2020-11-11 17:54:44'),
(8, '<p><strong>Good evening!&nbsp;<img alt=\"smiley\" src=\"http://localhost:8000/ckeditor-m/ckeditor/plugins/smiley/images/regular_smile.png\" style=\"height:23px; width:23px\" title=\"smiley\" /></strong></p>', 'active', '', 0, 1, '2020-11-12 18:48:45', '2020-11-12 18:48:45'),
(11, '<p><img alt=\"\" src=\"https://inflowers.by/wp-content/uploads/2019/06/2006201903.jpg\" style=\"height:167px; width:250px\" /></p>', 'active', '', 0, 1, '2021-02-05 17:38:15', '2021-02-05 17:38:15'),
(13, '<p><img alt=\"\" src=\"https://img4.socratify.net/d38ba8920b42260956_600x401.jpg\" style=\"height:366px; width:550px\" /></p>', 'active', '', 0, 2, '2021-02-09 21:21:32', '2021-02-09 21:21:32'),
(14, '<p><img alt=\"\" src=\"https://avatars.mds.yandex.net/get-zen_doc/2417275/pub_5ea5a451007c871a15901c60_5ea819bee62e151463c46f58/scale_1200\" style=\"height:309px; width:550px\" /></p>', 'active', '', 0, 3, '2021-02-09 21:33:59', '2021-02-09 21:33:59'),
(15, '<p><img alt=\"\" src=\"https://www.okino.ua/media/var/article/2015/12/27/best_2015.jpg\" style=\"height:284px; width:550px\" /></p>', 'active', '', 0, 4, '2021-02-09 21:46:40', '2021-02-09 21:46:40'),
(16, '<p>Самое главное, наслаждаться жизнью и быть счастливым &ndash; это все, что имеет значение.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.fresher.ru/manager_content/4-2017/prekrasnoe-cvetenie-yaponskoj-ajvy-v-krymu/3.jpg\" style=\"height:366px; width:550px\" /></p>', 'active', '', 0, 16, '2021-02-09 21:54:03', '2021-02-09 21:54:03');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-11-06 16:31:35', '2020-11-06 16:31:35'),
(2, 'user', 'Normal User', '2020-11-06 16:31:35', '2020-11-06 16:31:35');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Сетка', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\November2020\\yJ63qNFGEaeMtVLUIfNp.jpg', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-11-06 16:31:36', '2020-11-06 16:31:36'),
(31, 'menu_items', 'title', 17, 'en', 'Админка', '2020-11-19 19:27:36', '2020-11-19 19:27:36'),
(32, 'menu_items', 'title', 17, 'fr', 'Админка', '2020-11-19 19:30:29', '2020-11-19 19:30:29'),
(33, 'data_rows', 'display_name', 1, 'en', 'ID', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(34, 'data_rows', 'display_name', 21, 'en', 'Role', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(35, 'data_rows', 'display_name', 2, 'en', 'Name', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(36, 'data_rows', 'display_name', 3, 'en', 'Email', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(37, 'data_rows', 'display_name', 8, 'en', 'Avatar', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(38, 'data_rows', 'display_name', 4, 'en', 'Password', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(39, 'data_rows', 'display_name', 5, 'en', 'Remember Token', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(40, 'data_rows', 'display_name', 11, 'en', 'Settings', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(41, 'data_rows', 'display_name', 6, 'en', 'Created At', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(42, 'data_rows', 'display_name', 7, 'en', 'Updated At', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(43, 'data_rows', 'display_name', 9, 'en', 'Role', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(44, 'data_rows', 'display_name', 10, 'en', 'Roles', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(45, 'data_rows', 'display_name', 93, 'en', 'friends', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(46, 'data_rows', 'display_name', 94, 'en', 'friends', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(47, 'data_types', 'display_name_singular', 1, 'en', 'User', '2020-11-20 17:06:54', '2020-11-20 17:06:54'),
(48, 'data_types', 'display_name_plural', 1, 'en', 'Users', '2020-11-20 17:06:54', '2020-11-20 17:06:54');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `sub`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Алексей', 'user1@mail.ru', '', 'users/default.png', NULL, '$2y$10$P1UyPe8lQ92zCn4y1BvsgOOUvBx1YcMAIokqMtFD7JLB9S6/bPhDm', NULL, NULL, '2020-10-09 13:57:33', '2021-02-09 19:34:20'),
(2, 2, 'Мария', 'user2@mail.ru', '', 'users\\November2020\\sbUUH3ZAVMPFDp10mRIe.jpg', NULL, '$2y$10$AXeLAFmexPVVmpU7Vv6QPe7zwIcTCMH5u3M4hKLOqb318S6s5/rYe', NULL, '{\"locale\":\"en\"}', '2020-11-04 16:00:00', '2021-02-05 17:32:10'),
(3, NULL, 'Эдита', 'user3@mail.ru', '', 'users/default.png', NULL, '$2y$10$lc0lEm0fWTD2Fm6aWIYUGuVHdgVZ/zrznhCye3vMxZSjxYj/Aa.Vq', NULL, '{\"locale\":\"en\"}', '2020-11-04 16:01:26', '2021-02-09 21:30:37'),
(4, 2, 'Ибрагим', 'usertest2@mail.ru', '', 'users/default.png', NULL, '$2y$10$6FglVOFkApE.8Tb7PjoWl.0/To1R3ni1.7RMPwG78RtX0JFesw0gi', NULL, NULL, '2020-11-18 16:25:16', '2021-02-09 21:43:07'),
(16, 2, 'Джулия', 'testprofile@mail.ru', NULL, 'users/default.png', NULL, '$2y$10$maBhgAJwaW/z80htnU4kjemqwcbKiDhpZSZTRDfvFJAYCXRZvconC', NULL, NULL, '2021-02-05 16:08:47', '2021-02-05 16:08:47');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(3, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `galeries`
--
ALTER TABLE `galeries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `last_messages`
--
ALTER TABLE `last_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mains`
--
ALTER TABLE `mains`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `maintexts`
--
ALTER TABLE `maintexts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movie_users`
--
ALTER TABLE `movie_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `music_users`
--
ALTER TABLE `music_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Индексы таблицы `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `friends`
--
ALTER TABLE `friends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `galeries`
--
ALTER TABLE `galeries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `last_messages`
--
ALTER TABLE `last_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `mains`
--
ALTER TABLE `mains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `maintexts`
--
ALTER TABLE `maintexts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `movie_users`
--
ALTER TABLE `movie_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `music`
--
ALTER TABLE `music`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT для таблицы `music_users`
--
ALTER TABLE `music_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `publications`
--
ALTER TABLE `publications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
