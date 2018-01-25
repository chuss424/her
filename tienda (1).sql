-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2018 a las 16:18:51
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `user_info` text COLLATE utf8_unicode_ci,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blocks`
--

CREATE TABLE `blocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci,
  `images` text COLLATE utf8_unicode_ci,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8_unicode_ci DEFAULT 'hide',
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `blocks`
--

INSERT INTO `blocks` (`id`, `category_id`, `name`, `url`, `icon`, `order`, `description`, `image`, `images`, `slug`, `status`, `user_id`, `user_type`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Powered by Laravel 5.3', '', 'ion ion-social-github-outline', 0, 'We have tried to make use of all features of Laravel 5.2 which help you to develop the website with all resources available online.​ ', '', NULL, 'powered-by-laravel-5-3', 'show', 1, 'App\\User', '2016/07/21/104902202', NULL, NULL, NULL),
(2, 1, 'Configure to your project', '', 'ion ion-ios-gear-outline', 0, 'Lavalite helps you to configure your Laravel projects easily. It acts as a bootstrapper for your Laravel Content Management System.', '', NULL, 'configure-to-your-project', 'show', 1, 'App\\User', '2016/07/21/104854884', NULL, NULL, NULL),
(3, 1, 'Online package builder', '', 'ion ion-ios-checkmark-outline', 0, 'The online package builder helps you to build Lavalite packages easily, The downloaded package with basic required files help you to finish your projects quickly.', '', NULL, 'online-package-builder', 'show', 1, 'App\\User', '2016/07/21/104846403', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `block_categories`
--

CREATE TABLE `block_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `status` enum('show','hide') COLLATE utf8_unicode_ci DEFAULT 'hide',
  `user_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `block_categories`
--

INSERT INTO `block_categories` (`id`, `name`, `slug`, `title`, `details`, `status`, `user_type`, `user_id`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Features', 'features', 'Packed with features you can\'t live without.', 'Visit our <a href=\"https://github.com/LavaLite/cms/wiki\">documentation</a> for more information.', 'show', 'App\\User', 1, '2016/10/31/163917964', NULL, '2016-07-20 12:17:48', '2016-11-01 18:08:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendars`
--

CREATE TABLE `calendars` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Draft','Calendar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Draft',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `calendars`
--

INSERT INTO `calendars` (`id`, `title`, `slug`, `color`, `location`, `status`, `start`, `end`, `details`, `created_by`, `assignee_id`, `user_id`, `user_type`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Board Meeting', 'board-meeting', 'rgb(60, 141, 188)', NULL, 'Calendar', '2016-07-19 00:00:00', '2016-07-19 01:00:00', NULL, NULL, NULL, 1, 'App\\User', NULL, NULL, '2016-07-20 13:35:17', '2016-07-20 13:38:08'),
(2, 'ALEXUS bday', 'alexus-bday', 'rgb(255, 0, 128)', NULL, 'Calendar', '2016-07-29 00:00:00', '2016-07-29 01:00:00', NULL, NULL, NULL, 1, 'App\\User', NULL, NULL, '2016-07-20 13:36:42', '2016-07-20 13:38:30'),
(3, 'Conference', 'conference', 'rgb(255, 133, 27)', NULL, 'Calendar', '2016-07-20 00:00:00', '2016-07-20 01:00:00', NULL, NULL, NULL, 1, 'App\\User', NULL, NULL, '2016-07-20 13:37:12', '2016-07-20 13:37:37'),
(4, 'Company meeting', 'company-meeting', 'rgb(57, 204, 204)', NULL, 'Calendar', '2016-07-08 00:00:00', '2016-07-08 01:00:00', NULL, NULL, NULL, 1, 'App\\User', NULL, NULL, '2016-07-20 13:37:28', '2016-07-20 13:37:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_det_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `url` varchar(600) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Oficina', '/oficina', '2018-01-03 17:31:31', '2017-12-14 19:47:01'),
(2, 'Escolar', '/escolar', '2018-01-03 17:31:33', '2017-12-14 19:49:54'),
(3, 'Computo', '/computo', '2018-01-03 17:33:22', '2018-01-02 23:10:33'),
(4, 'Papeles', '/papeles', '2018-01-03 17:33:26', '2018-01-02 23:10:46'),
(5, 'Coffee Breack', '/coffee_breack', '2018-01-08 21:26:37', '2018-01-02 23:10:54'),
(6, 'Limpieza', '/limpieza', '2018-01-03 17:33:41', '2018-01-02 23:11:03'),
(7, 'Ergonomía', '/ergonomia', '2018-01-03 17:33:46', '2018-01-02 23:11:13'),
(8, 'Arte', '/arte', '2018-01-03 17:33:53', '2018-01-02 23:11:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_productos`
--

CREATE TABLE `categoria_productos` (
  `productos_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_productos`
--

INSERT INTO `categoria_productos` (`productos_id`, `categoria_id`) VALUES
(10, 2),
(11, 2),
(12, 1),
(13, 1),
(14, 1),
(15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `reporting_to` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `api_token` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` enum('','male','female') COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `photo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci,
  `status` enum('draft','complete','verify','approve','publish','unpublish','archive') COLLATE utf8_unicode_ci DEFAULT 'draft',
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `reporting_to`, `name`, `email`, `password`, `api_token`, `remember_token`, `sex`, `dob`, `designation`, `mobile`, `phone`, `address`, `street`, `city`, `district`, `state`, `country`, `photo`, `web`, `permissions`, `status`, `user_id`, `user_type`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'Client', 'client@lavalite.org', '$2y$10$6byt7nab7ILCBjaLS.haYuCzyW.1W.ZYoGCmAlQ7o3LTGE19D292q', 'htbLp7G1gB6p0ztvLDzQ9rq5HmvsJ4OY8Wmu9KhuMUkZWzMErqsONckyBj5T', NULL, 'male', '2014-05-15', 'Super User', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://litepie.org', NULL, '', NULL, NULL, NULL, NULL, '2015-09-15 05:00:00', NULL),
(2, 0, 'jesus', 'superuser@lavalite.org', '$2y$10$1ZgpIlrIHKVQSKsKA7WeA.E5kdZlUjPiStqHWpdCxbhZLDSBH55Cm', 'UuVaa1EaSufFOurA4A4Ix8Rxp2h57leGaaufgxSmnrJzaXTp7pf4hu4x2wnJ', 'lLuOINmPuRhNozAeNWbJ2jW10WFrnKOuXxPtDBRi0e5MOsUnWy9InwL4q1Zl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, '2017-12-12 00:35:33', '2017-12-12 00:35:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `color`, `created_at`, `updated_at`) VALUES
(1, '#000000', '2017-12-14 15:36:06', '0000-00-00 00:00:00'),
(2, '#021cfd ', '2017-12-14 15:48:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color_productos`
--

CREATE TABLE `color_productos` (
  `productos_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `color_productos`
--

INSERT INTO `color_productos` (`productos_id`, `color_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default` tinyint(4) DEFAULT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `lat` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lng` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Show','Hide') COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `phone`, `mobile`, `email`, `default`, `website`, `details`, `address`, `street`, `city`, `state`, `country`, `zip`, `lat`, `lng`, `status`, `slug`, `user_id`, `user_type`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Renfos Technologies Pvt. Ltd.', '+91 484-4011 609', '+91 97444 89361', 'india@lavalite.org', NULL, 'http://lavalite.org', 'INFOPARK TBC\nJNI Stadium Complex, Kaloor\nKochi, Kerala,\nIndia, Pin - 682017', 'INFOPARK TBC, JNI Stadium Complex', 'Kaloor', 'Kochi', 'Kerala', 'India', 682017, '9.998856897222739', '76.30494149737547', 'Show', 'headoffice', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_products`
--

CREATE TABLE `det_products` (
  `id` int(11) NOT NULL,
  `cod` varchar(11) NOT NULL,
  `description` varchar(300) NOT NULL,
  `unidad` varchar(300) NOT NULL,
  `color` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `det_products`
--

INSERT INTO `det_products` (`id`, `cod`, `description`, `unidad`, `color`, `created_at`, `updated_at`) VALUES
(8, '000326', 'BLANCO P/LAPIZ CHICO', 'UNID', '#ffffff', '2017-12-19 03:20:06', '2017-12-19 03:20:06'),
(9, '000327', 'BLANCO P/LAPIZ GRANDE', 'UNID', '#ffffff', '2017-12-19 03:20:06', '2017-12-19 03:20:06'),
(10, '007623', 'FX-82ES PLUS 252 FUNCIONES', 'UNID', '#1d0e29', '2018-01-03 15:11:49', '2018-01-03 15:11:49'),
(11, '007543', 'A-4 PP 13 DIV.MULTICOLOR', 'UND', '#ffffff', '2018-01-17 21:36:17', '2018-01-17 21:36:17'),
(12, '000434', 'TAMAÑO OFICIO', 'UND', '#000000', '2018-01-17 21:38:50', '2018-01-17 21:38:50'),
(13, '008833', 'C/VARILLA METAL', 'CJAx50', '#89baef', '2018-01-17 21:41:49', '2018-01-17 21:41:49'),
(14, '005584', 'PLASTIFICADO OFICIO AMARILLO', 'UND', '#e6da48', '2018-01-17 21:46:07', '2018-01-17 21:46:07'),
(15, '005585', 'PLASTIFICADO OFICIO AZUL', 'UND', '#141c5a', '2018-01-17 21:46:07', '2018-01-17 21:46:07'),
(16, '005586', 'PLASTIFICADO OFICIO ROJO ', 'UND ', '#8d0a0d', '2018-01-17 21:46:08', '2018-01-17 21:46:08'),
(17, '005587', 'PLASTIFICADO OFICIO VERDE', 'UND', '#155104', '2018-01-17 21:46:08', '2018-01-17 21:46:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_products_productos`
--

CREATE TABLE `det_products_productos` (
  `productos_id` int(11) NOT NULL,
  `det_products_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `det_products_productos`
--

INSERT INTO `det_products_productos` (`productos_id`, `det_products_id`) VALUES
(10, 8),
(10, 9),
(11, 10),
(12, 11),
(13, 12),
(14, 13),
(15, 14),
(15, 15),
(15, 16),
(15, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `target` enum('_blank','_self') COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `uload_folder` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `key`, `url`, `icon`, `permission`, `role`, `name`, `description`, `target`, `order`, `uload_folder`, `slug`, `status`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'admin', '/admin', NULL, NULL, NULL, 'Admin', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(2, 0, 'user', '/user', NULL, NULL, NULL, 'User', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(3, 0, 'client', '/client', NULL, NULL, NULL, 'Client', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(4, 0, 'main', '', NULL, NULL, NULL, 'Main', 'Website main menu', NULL, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(5, 0, 'footer', '', NULL, NULL, NULL, 'Footer', 'Footer menu', NULL, 3, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(6, 0, 'social', '', NULL, NULL, NULL, 'Social', 'Social media menu', NULL, 3, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(7, 1, NULL, 'admin/menu/menu', 'fa fa-bars', NULL, '[\"superuser\"]', 'Menu', NULL, NULL, 6, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(8, 1, NULL, 'admin', 'fa fa-dashboard', NULL, NULL, 'Dashboard', NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(9, 6, NULL, 'https://twitter.com/lavalitecms', NULL, NULL, NULL, 'Twitter', NULL, '_blank', 11, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(10, 6, NULL, 'https://github.com/LavaLite', NULL, NULL, NULL, 'GitHub', NULL, '_blank', 12, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(11, 6, NULL, 'https://www.facebook.com/lavalite/', NULL, NULL, NULL, 'Facebook', NULL, '_blank', 13, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(18, 2, NULL, 'user', 'dashboard', NULL, NULL, 'Dashborad', NULL, NULL, 50, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(19, 1, NULL, 'admin/user/user', 'fa fa-users', NULL, '[\"superuser\"]', 'User', NULL, NULL, 1999, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(20, 19, NULL, 'admin/user/user', 'fa fa-user', NULL, NULL, 'Users', NULL, NULL, 1200, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(21, 19, NULL, 'admin/user/client', 'fa fa-user', NULL, NULL, 'Clients', NULL, NULL, 1202, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(22, 19, NULL, 'admin/user/team', 'fa fa-users', NULL, NULL, 'Team', NULL, NULL, 1202, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(23, 1, 'role', 'admin/roles/role', 'fa fa-check-circle-o', NULL, '[\"superuser\"]', 'Role', NULL, NULL, 190, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(24, 23, 'role', 'admin/roles/role', 'fa fa-newspaper-o', NULL, '[\"superuser\"]', 'Role', NULL, NULL, 190, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(25, 23, NULL, 'admin/roles/permission', 'fa fa-check-circle-o', NULL, '[\"superuser\"]', 'Permission', NULL, NULL, 190, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(26, 3, NULL, 'client', 'dashboard', NULL, NULL, 'Dashborad', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(27, 1, NULL, 'admin/calendar/calendar', 'fa fa-calendar', NULL, NULL, 'Calendars', NULL, NULL, 120, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(28, 2, NULL, 'user/calendar/calendar', 'date_range', NULL, NULL, 'Calendars', NULL, NULL, 120, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(29, 1, NULL, 'admin/message/message', 'fa fa-envelope-o', NULL, NULL, 'Message', NULL, NULL, 180, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(30, 2, NULL, 'user/message/message', 'message', NULL, NULL, 'Message', NULL, NULL, 180, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(31, 1, NULL, 'admin/alerts/notification', 'fa fa-bell-o', NULL, NULL, 'Notification', NULL, NULL, 190, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(32, 2, NULL, 'user/alerts/notification', 'notifications', NULL, NULL, 'Notification', NULL, NULL, 190, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(33, 3, NULL, 'notification', 'notifications', NULL, NULL, 'Notification', NULL, NULL, 190, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(34, 1, NULL, 'admin/task/task', 'fa fa-flag-o', NULL, NULL, 'Tasks', NULL, NULL, 220, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(35, 2, NULL, 'user/task/task', 'view_week', NULL, NULL, 'Tasks', NULL, NULL, 220, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(36, 3, NULL, 'client/task/task', 'view_week', NULL, NULL, 'Task', NULL, NULL, 220, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(37, 1, NULL, 'admin/block/block', 'fa fa-square', NULL, NULL, 'Blocks', NULL, NULL, 100, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(38, 37, NULL, 'admin/block/block', 'fa fa-square', NULL, NULL, 'Blocks', NULL, NULL, 101, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(39, 37, NULL, 'admin/block/category', 'fa fa-bars', NULL, NULL, 'Categories', NULL, NULL, 102, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(40, 1, NULL, 'admin/contact/contact', 'fa fa-newspaper-o', NULL, NULL, 'Contact', NULL, NULL, 190, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(41, 4, NULL, 'contact.htm', NULL, NULL, NULL, 'Contact', NULL, NULL, 190, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(42, 5, NULL, 'contact.htm', NULL, NULL, NULL, 'Contact', NULL, NULL, 190, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(43, 1, NULL, 'admin/page/page', 'fa fa-book', NULL, NULL, 'Pages', NULL, NULL, 5, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(44, 4, NULL, 'about-us.html', NULL, NULL, NULL, 'About Us', NULL, NULL, 8, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(45, 5, NULL, 'about-us.html', NULL, NULL, NULL, 'About Us', NULL, NULL, 8, NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `from_id` int(11) DEFAULT NULL,
  `from_type` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `to_type` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `folder` enum('Draft','Inbox','Sent','Junk') COLLATE utf8_unicode_ci DEFAULT NULL,
  `starred` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT NULL,
  `readed` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT NULL,
  `labels` mediumtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(77, '2015_01_05_100001_create_clients_table', 1),
(78, '2015_01_05_100001_create_users_table', 1),
(79, '2015_01_05_100010_create_password_resets_table', 1),
(80, '2015_08_05_100011_create_pages_table', 1),
(81, '2016_01_01_000017_create_revisions_table', 1),
(82, '2016_07_07_100001_create_tasks_table', 1),
(83, '2016_07_08_100001_create_messages_table', 1),
(84, '2016_07_14_100001_create_blocks_table', 1),
(85, '2016_07_18_100001_create_calendars_table', 1),
(86, '2017_01_02_100001_create_contacts_table', 1),
(87, '2017_01_10_100001_create_notifications_table', 1),
(88, '2017_02_20_100001_create_activities_table', 1),
(89, '2017_05_05_100001_create_menus_table', 1),
(90, '2017_05_23_100001_create_settings_table', 1),
(91, '2017_11_09_100001_create_roles_table', 1),
(92, '2017_11_09_100002_create_role_user_table', 1),
(93, '2017_11_09_100003_create_permissions_table', 1),
(94, '2017_11_09_100004_create_permission_user_table', 1),
(95, '2017_11_09_100005_create_permission_role_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notifiable_id` int(11) DEFAULT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `read_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('draft','complete','verify','approve','publish','unpublish','archive') COLLATE utf8_unicode_ci DEFAULT 'draft',
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_id`, `notifiable_type`, `data`, `read_at`, `slug`, `status`, `user_id`, `user_type`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'asunto', 1, 'o', 'ffff', '2017-12-13 17:10:00', NULL, 'complete', 1, NULL, NULL, '2017-12-13 05:00:00', '2017-12-13 05:00:00', '2017-12-13 05:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notify`
--

CREATE TABLE `notify` (
  `id` int(11) NOT NULL,
  `titulo` varchar(300) NOT NULL,
  `url` varchar(300) NOT NULL,
  `read_n` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `id_user_receiver` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notify`
--

INSERT INTO `notify` (`id`, `titulo`, `url`, `read_n`, `name`, `id_user_receiver`, `created_at`, `updated_at`) VALUES
(5, 'Han Aprobado tu solicitud Solicitud de marcadores', 'admin/solicitud', 1, 'Administrador - Jesus', 12, '2017-12-15 22:03:26', '2017-12-16 03:03:26'),
(6, 'Han Rechazado tu solicitud tercer pedido', 'admin/solicitud', 1, 'Administrador - Jesus', 12, '2017-12-15 22:03:26', '2017-12-16 03:03:26'),
(7, 'Han Aprobado tu solicitud segundo pedido', 'admin/solicitud', 1, 'Administrador - Jesus', 12, '2017-12-15 22:05:20', '2017-12-16 03:05:20'),
(8, 'Han Rechazado tu solicitud prueba', 'admin/solicitud', 1, 'Administrador - Jesus', 12, '2017-12-15 22:06:16', '2017-12-16 03:06:16'),
(9, 'Tienes una solicitud de Carpetas', 'admin/solicitud', 1, 'jesus', 1, '2017-12-15 22:15:02', '2017-12-16 03:15:02'),
(10, 'Han Aprobado tu solicitud Carpetas', 'admin/solicitud', 1, 'Administrador - Jesus', 12, '2017-12-15 22:15:41', '2017-12-16 03:15:41'),
(11, 'Tienes una solicitud de Carpetas azules', 'admin/solicitud', 1, 'jesus', 1, '2017-12-26 15:10:37', '2017-12-26 15:10:37'),
(12, 'Han modificado la solicitud Carpetas azules', 'admin/solicitud', 1, 'Sucursal - jesus', 1, '2017-12-26 18:21:58', '2017-12-26 18:21:58'),
(13, 'Han Aprobado tu solicitud Carpetas azules', 'admin/solicitud', 1, 'Administrador - Jesus', 12, '2017-12-26 18:23:43', '2017-12-26 18:23:43'),
(14, 'Tienes una solicitud de Pedido 1', 'admin/solicitud', 1, 'Sucursal Callao', 15, '2017-12-28 20:13:56', '2017-12-28 20:13:56'),
(15, 'Han Aprobado tu solicitud Pedido 1', 'admin/solicitud', 1, 'Administrador - Admin Callao', 16, '2017-12-28 20:18:51', '2017-12-28 20:18:51'),
(16, 'Han Aprobado una solicitud Pedido 1', 'admin/solicitud', 1, 'Administrador - Admin Callao', 14, '2017-12-28 20:16:16', '2017-12-28 20:16:16'),
(17, 'Han Aprobado tu solicitud Pedido 1', 'admin/solicitud', 0, 'Administrador - Admin Callao', 16, '2017-12-28 20:27:37', '2017-12-28 20:27:37'),
(18, 'Administrador - Admin Callaoha Aprobado una solicitud Pedido 1', 'admin/solicitud', 1, 'Administrador - Admin Callao', 14, '2017-12-28 20:27:47', '2017-12-28 20:27:47'),
(19, 'Tienes una solicitud de Producto: Archivador Acord. 6 Divisiones', 'admin/solicitud', 1, 'Mildred', 14, '2018-01-11 21:27:59', '2018-01-11 21:27:59'),
(20, 'Tienes una solicitud de Producto: Calculadora Cientifica', 'admin/solicitud', 1, 'Mildred', 14, '2018-01-11 21:56:13', '2018-01-11 21:56:13'),
(21, 'Tienes una solicitud de Producto: Borrador', 'admin/solicitud', 1, 'Mildred', 14, '2018-01-11 21:57:15', '2018-01-11 21:57:15'),
(22, 'Tienes una solicitud de Producto: Borrador', 'admin/solicitud', 1, 'Mildred Ramirez', 14, '2018-01-15 21:12:38', '2018-01-15 21:12:38'),
(23, 'Tienes una solicitud de Producto: Calculadora Cientifica', 'admin/solicitud', 1, 'Mildred Ramirez', 14, '2018-01-15 21:15:40', '2018-01-15 21:15:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `description` varchar(600) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_det_pro` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `observation` varchar(600) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `title`, `description`, `id_product`, `id_det_pro`, `cant`, `observation`, `status`, `created_at`, `updated_at`) VALUES
(1, 'prueba', 'sssss', 0, 0, 0, 'nei', 2, '2017-12-15 22:06:07', '2017-12-16 03:06:07'),
(2, 'segundo pedido', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0, 0, 0, 'ok', 1, '2017-12-15 22:05:15', '2017-12-16 03:05:15'),
(3, 'tercer pedido', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, 0, 0, 'este producto no esta disponible', 2, '2017-12-15 21:43:24', '2017-12-16 02:43:24'),
(4, 'Solicitud de marcadores', 'requiero este producto para el 15 de enero', 1, 1, 3, 'Se enviara una semana antes', 1, '2017-12-15 21:42:44', '2017-12-16 02:42:44'),
(5, 'Carpetas', 'carpetas negras', 1, 1, 2, 'correcto', 1, '2017-12-15 22:15:31', '2017-12-16 03:15:31'),
(6, 'Carpetas azules', 'requiero de carpetas azules lo mas pronto posible', 6, 5, 5, 'Se redujo la cantidad a 5 por motivo propio de la distribuidora', 1, '2017-12-26 18:23:34', '2017-12-26 18:23:34'),
(7, 'Pedido 1', 'este es un pedido', 10, 8, 4, 'ok', 1, '2017-12-28 20:27:37', '2017-12-28 20:27:37'),
(13, 'Producto: Borrador', 'El cliente Mildred Ramirez esta solicitando el producto: Borrador', 10, 8, 1, '', 0, '2018-01-15 21:12:08', '2018-01-15 21:12:08'),
(14, 'Producto: Calculadora Cientifica', 'El cliente Mildred Ramirez esta solicitando el producto: Calculadora Cientifica', 11, 10, 1, '', 0, '2018-01-15 21:15:30', '2018-01-15 21:15:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_users`
--

CREATE TABLE `orders_users` (
  `id_orders` int(11) NOT NULL,
  `id_users_sender` int(11) NOT NULL,
  `id_users_receiver` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orders_users`
--

INSERT INTO `orders_users` (`id_orders`, `id_users_sender`, `id_users_receiver`, `created_at`, `updated_at`) VALUES
(1, 12, 1, '2017-12-13 04:08:15', '2017-12-13 04:08:15'),
(2, 12, 1, '2017-12-13 21:31:48', '2017-12-13 21:31:48'),
(3, 12, 1, '2017-12-13 21:50:52', '2017-12-13 21:50:52'),
(4, 12, 1, '2017-12-15 22:46:05', '2017-12-15 22:46:05'),
(5, 12, 1, '2017-12-16 03:14:48', '2017-12-16 03:14:48'),
(6, 12, 1, '2017-12-26 15:10:20', '2017-12-26 15:10:20'),
(7, 16, 15, '2017-12-28 20:10:22', '2017-12-28 20:10:22'),
(13, 18, 14, '2018-01-15 21:12:08', '2018-01-15 21:12:08'),
(14, 18, 14, '2018-01-15 21:15:30', '2018-01-15 21:15:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `heading` text COLLATE utf8_unicode_ci,
  `sub_heading` text COLLATE utf8_unicode_ci,
  `abstract` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_keyword` text COLLATE utf8_unicode_ci,
  `meta_description` text COLLATE utf8_unicode_ci,
  `banner` mediumtext COLLATE utf8_unicode_ci,
  `images` text COLLATE utf8_unicode_ci,
  `compile` tinyint(1) DEFAULT '0',
  `view` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `category` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'default',
  `order` int(11) DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8_unicode_ci DEFAULT 'show',
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `name`, `title`, `heading`, `sub_heading`, `abstract`, `content`, `meta_title`, `meta_keyword`, `meta_description`, `banner`, `images`, `compile`, `view`, `category`, `order`, `slug`, `status`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'Home', 'Home', NULL, NULL, 'Home Page', NULL, NULL, NULL, NULL, NULL, NULL, 'page', 'default', 0, 'home', 'show', NULL, NULL, NULL, NULL),
(2, 'About Us', 'About Us', 'Meet Lavalite', NULL, NULL, '<div class=\"row\">\n                        <div class=\"col-md-12\">\n                            <div class=\"count-numerics\">\n                                <h2>Our mission is to make insurance<br>work better for businesses of all types and sizes.</h2>\n\n                                <ul class=\"list-inline row\">\n\n                                    <li class=\"col-md-3 col-xs-6\">\n                                        <div class=\"text-center\">\n                                            <div>\n                                                <figure class=\"js__counter\">1</figure>\n                                                <span>k+</span>\n                                            </div>\n\n                                            <h4>Set of pages</h4>\n\n                                      </div>\n\n                                    </li>\n\n                                    <li class=\"col-md-3 col-xs-6\">\n                                        <div class=\"text-center\">\n                                            <div>\n                                                <figure class=\"js__counter\">53</figure>\n                                            </div>\n\n                                            <h4>Categories</h4>\n\n                                        </div>\n\n                                    </li>\n\n                                    <li class=\"col-md-3 col-xs-6\">\n                                        <div class=\"text-center\">\n                                            <div>\n                                                <figure class=\"js__counter\">10</figure>\n                                                <span>x</span>\n                                            </div>\n\n                                            <h4>Save time</h4>\n\n                                        </div>\n\n                                    </li>\n\n                                    <li class=\"col-md-3 col-xs-6 s-counter-v1\">\n                                        <div class=\"text-center\">\n                                            <div>\n                                                <figure class=\"js__counter\">9</figure>\n                                            </div>\n\n                                            <h4>Formats to use</h4>\n\n                                        </div>\n\n                                    </li>\n\n                                  </ul>\n\n                            </div>\n\n                        </div>\n\n                    </div>\n<div class=\"row\">\n                        <div class=\"col-md-12\">\n                            <div class=\"promo-section\">\n                                <div class=\"row mln mrn\">\n                                    <div class=\"col-md-6 pln prn\">\n                                        <div class=\"content-section text-center\">\n                                            <h2>Creative Digital Agency</h2>\n                                            <span>You are in good hands.</span>\n                                            <p>It’s important to stay detail oriented with every project we tackle. Staying focused allows us to turn every project we complete into something we love.</p>\n                                            <p>The time has come to bring those ideas and plans to life. This is where we really begin to visualize your napkin sketches and make them into beautiful pixels.</p>\n                                            <h4>— John Doe</h4>\n                                        </div>\n                                    </div>\n                                    <div class=\"col-md-6 pln prn image-section\">\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n\n<div class=\"row features-section\">\n                        <div class=\"col-sm-5\">\n                            <div class=\"hor-centered-row\">\n                                <div class=\"hor-centered-row-col exp-num\"><span>9</span></div>\n                                <div class=\"hor-centered-row-col exp-year\">\n                                    <h4>\n                                        <span>Years</span>\n                                        <span>Experience</span>\n                                    </h4>\n                                    <p>Front-end Design &amp; Development.</p>\n                                </div>\n                            </div>\n                        </div>\n                        <div class=\"col-sm-7\">\n                            <div class=\"row mb40\">\n                                <div class=\"col-sm-6\">\n                                    <div class=\"feature-item\">\n                                        <i class=\"ti-mobile\"></i>\n                                        <h4>Responsive Layout</h4>\n                                        <p>This is where we sit down, grab a cup of coffee and dial in the details.</p>\n                                    </div>\n                                </div>\n                                <div class=\"col-sm-6\">\n                                    <div class=\"feature-item\">\n                                        <i class=\"ti-palette\"></i>\n                                        <h4>Fully Customizable</h4>\n                                        <p>This is where we sit down, grab a cup of coffee and dial in the details.</p>\n                                    </div>\n                                </div>\n                            </div>\n\n                            <div class=\"row\">\n                                <div class=\"col-sm-6\">\n                                    <div class=\"feature-item\">\n                                        <i class=\"ti-cup\"></i>\n                                        <h4>Endless Possibilities</h4>\n                                        <p>This is where we sit down, grab a cup of coffee and dial in the details.</p>\n                                    </div>\n                                </div>\n                                <div class=\"col-sm-6\">\n                                    <div class=\"feature-item\">\n                                        <i class=\"ti-crown\"></i>\n                                        <h4>Powerful Performance</h4>\n                                        <p>This is where we sit down, grab a cup of coffee and dial in the details.</p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>', NULL, NULL, 'This is a started theme for Lavalite cms, you can customize according to your requirement.', NULL, NULL, NULL, 'page', 'default', 0, 'about-us', 'show', NULL, NULL, NULL, NULL),
(3, 'Contact Us', 'Contact Us', 'Contact Us', NULL, NULL, '<p><br></p>', NULL, NULL, NULL, NULL, NULL, NULL, 'page', 'default', 0, 'contact', 'show', NULL, NULL, NULL, NULL),
(4, 'Page Not found', 'Page Not found', 'Page Not found', NULL, NULL, '<p><br></p>', NULL, NULL, NULL, NULL, NULL, NULL, 'page', 'default', 0, '404', 'show', NULL, NULL, NULL, NULL),
(5, '', NULL, '', NULL, '', '<p><br></p>', '', '', '', NULL, NULL, 0, 'default', 'default', 50, '', 'show', NULL, NULL, '2017-12-12 20:32:59', '2017-12-12 20:32:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'View Calendar', 'calendar.calendar.view', NULL, NULL, NULL, NULL),
(2, 'Create Calendar', 'calendar.calendar.create', NULL, NULL, NULL, NULL),
(3, 'Update Calendar', 'calendar.calendar.edit', NULL, NULL, NULL, NULL),
(4, 'Delete Calendar', 'calendar.calendar.delete', NULL, NULL, NULL, NULL),
(5, 'View Message', 'message.message.view', NULL, NULL, NULL, NULL),
(6, 'Create Message', 'message.message.create', NULL, NULL, NULL, NULL),
(7, 'Update Message', 'message.message.edit', NULL, NULL, NULL, NULL),
(8, 'Delete Message', 'message.message.delete', NULL, NULL, NULL, NULL),
(9, 'View Notification', 'alerts.notification.view', NULL, NULL, NULL, NULL),
(10, 'Create Notification', 'alerts.notification.create', NULL, NULL, NULL, NULL),
(11, 'Update Notification', 'alerts.notification.edit', NULL, NULL, NULL, NULL),
(12, 'Delete Notification', 'alerts.notification.delete', NULL, NULL, NULL, NULL),
(13, 'View Task', 'task.task.view', NULL, NULL, NULL, NULL),
(14, 'Create Task', 'task.task.create', NULL, NULL, NULL, NULL),
(15, 'Update Task', 'task.task.edit', NULL, NULL, NULL, NULL),
(16, 'Delete Task', 'task.task.delete', NULL, NULL, NULL, NULL),
(17, 'View Block', 'block.block.view', NULL, NULL, NULL, NULL),
(18, 'Create Block', 'block.block.create', NULL, NULL, NULL, NULL),
(19, 'Update Block', 'block.block.edit', NULL, NULL, NULL, NULL),
(20, 'Delete Block', 'block.block.delete', NULL, NULL, NULL, NULL),
(21, 'View Category', 'block.category.view', NULL, NULL, NULL, NULL),
(22, 'Create Category', 'block.category.create', NULL, NULL, NULL, NULL),
(23, 'Update Category', 'block.category.edit', NULL, NULL, NULL, NULL),
(24, 'Delete Category', 'block.category.delete', NULL, NULL, NULL, NULL),
(25, 'View Contact', 'contact.contact.view', NULL, NULL, NULL, NULL),
(26, 'Create Contact', 'contact.contact.create', NULL, NULL, NULL, NULL),
(27, 'Update Contact', 'contact.contact.edit', NULL, NULL, NULL, NULL),
(28, 'Delete Contact', 'contact.contact.delete', NULL, NULL, NULL, NULL),
(29, 'View Page', 'page.page.view', NULL, NULL, NULL, NULL),
(30, 'Create Page', 'page.page.create', NULL, NULL, NULL, NULL),
(31, 'Update Page', 'page.page.edit', NULL, NULL, NULL, NULL),
(32, 'Delete Page', 'page.page.delete', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_user`
--

CREATE TABLE `permission_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `marca` varchar(600) NOT NULL,
  `picture` varchar(300) NOT NULL,
  `type_pro` varchar(600) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `marca`, `picture`, `type_pro`, `created_at`, `updated_at`) VALUES
(10, 'Borrador', 'Artesco', '/pluton/images/productos/bzpvjqsnlyzcf3nkozpw.jpg', '4', '2018-01-17 22:00:41', '2018-01-17 22:00:41'),
(11, 'Calculadora Cientifica', 'Casio', '/pluton/images/productos/kfpgdlprnpula5eoavwt.jpg', '12', '2018-01-17 22:00:02', '2018-01-17 22:00:02'),
(12, 'Archivador Acord. 6 Divisiones', 'Artesco', '/pluton/images/productos/a0xruukahliwjwfef3w1.jpg', '1', '2018-01-17 21:36:17', '2018-01-17 21:36:17'),
(13, 'Archivador Acord. 6 Divisiones', 'Artesco', '/pluton/images/productos/6asuk40jobicsi5fwgw7.jpg', '1', '2018-01-17 21:38:50', '2018-01-17 21:38:50'),
(14, 'Folder colgante', 'Data Office', '/pluton/images/productos/tz0igywvbk20beoltli5.jpg', '1', '2018-01-17 21:41:49', '2018-01-17 21:41:49'),
(15, 'Archivador color', 'Artesco', '/pluton/images/productos/43lcdzwkk81am3ladqrr.jpg', '1', '2018-01-17 21:46:07', '2018-01-17 21:46:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisions`
--

CREATE TABLE `revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `revision_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revision_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `level`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Super User', 'superuser', NULL, 1, NULL, NULL, NULL),
(2, 'Admin', 'admin', NULL, 1, NULL, NULL, NULL),
(3, 'User', 'user', NULL, 1, NULL, NULL, NULL),
(4, 'Client', 'client', NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 2, 2, NULL, NULL),
(4, 3, 3, NULL, NULL),
(5, 2, 12, '2017-12-12 00:49:27', '2017-12-12 00:49:27'),
(6, 2, 14, NULL, NULL),
(7, 2, 15, '2017-12-28 20:06:37', '2017-12-28 20:06:37'),
(8, 2, 16, '2017-12-28 20:09:27', '2017-12-28 20:09:27'),
(9, 1, 18, '2018-01-11 17:04:47', '2018-01-11 17:04:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `control` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'text',
  `type` enum('System','Default','User') COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `package`, `module`, `name`, `value`, `file`, `control`, `type`, `slug`, `user_id`, `user_type`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'main.company.name', 'Main', 'Company', 'Company name', 'Lavalite', NULL, 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'main.company.address', 'Main', 'Company', 'Company address', 'Some value', NULL, 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'main.company.email', 'Main', 'Company', 'Company address', 'Company Email', NULL, 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'main.company.logo', 'Main', 'Company', 'Company logo', 'Some value', NULL, 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_required` time DEFAULT NULL,
  `time_taken` time DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `parent_id`, `start`, `end`, `category`, `task`, `time_required`, `time_taken`, `priority`, `status`, `created_by`, `slug`, `assigned_to`, `user_id`, `user_type`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, 'testing', NULL, NULL, NULL, 'completed', NULL, 'testing', NULL, 1, 'App\\User', NULL, NULL, '2016-07-19 16:43:26', '2016-07-19 16:43:58'),
(2, NULL, NULL, NULL, NULL, 'developing', NULL, NULL, NULL, 'in_progress', NULL, 'developing', NULL, 1, 'App\\User', NULL, NULL, '2016-07-19 16:43:38', '2017-12-13 22:45:31'),
(3, NULL, NULL, NULL, NULL, 'designing', NULL, NULL, NULL, 'in_progress', NULL, 'designing', NULL, 1, 'App\\User', NULL, NULL, '2016-07-19 16:43:53', '2016-07-19 16:43:56'),
(4, NULL, NULL, NULL, NULL, 'designing', NULL, NULL, NULL, 'in_progress', NULL, 'designing', NULL, 1, 'App\\User', NULL, NULL, '2016-07-19 16:43:53', '2016-07-19 16:43:56'),
(5, NULL, NULL, NULL, NULL, 'designingfff', NULL, NULL, NULL, 'in_progress', NULL, 'designing', NULL, 1, 'App\\User', NULL, NULL, '2017-12-13 16:43:53', '2016-07-19 16:43:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_pro`
--

CREATE TABLE `type_pro` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `name` varchar(600) NOT NULL,
  `url` varchar(600) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `type_pro`
--

INSERT INTO `type_pro` (`id`, `id_categoria`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Archivadores y Organizadores', '/oficina/archivadores_y_organizadores', '2018-01-02 00:00:00', '2018-01-02 00:00:00'),
(2, 1, 'Blocks y Cuadernos', '/oficina/blocks_y_cuadernos', '2018-01-02 00:00:00', '2018-01-02 00:00:00'),
(3, 2, 'Adhesivo Escolar', '/escolar/adhesivo_escolar', '2018-01-02 00:00:00', '2018-01-02 00:00:00'),
(4, 2, 'Pegamento Escolar', '/escolar/pegamento_escolar', '2018-01-02 00:00:00', '2018-01-02 00:00:00'),
(5, 1, 'Calculadoras', '/oficina/calculadoras', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(6, 1, 'Escritura', '/oficina/escritura', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(7, 1, 'Folder y Sobres', '/oficina/folder_y_sobres', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(8, 1, 'Perforadores y Engrapadores', '/oficina/perforadores_y_engrapadores', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(9, 1, 'Pegamentos y Adhesivos', '/oficina/pegamentos_y_adhesivos', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(10, 1, 'Pizarras', '/oficina/pizarras', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(11, 1, 'Productos para corte', '/oficina/producto_para_corte', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(12, 2, 'Calculadoras Escolar', '/escolar/calculadoras_escolar', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(13, 2, 'Ceramica y Pastas', '/escolar/ceramica_y_pastas', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(14, 2, 'Carturcheras', '/escolar/cartucheras/', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(15, 2, 'Blocks y Cuadernos', '/escolar/blocks_y_cuadernos', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(16, 2, 'Escritura', '/escolar/escritura', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(17, 2, 'Pintura', '/escolar/pintura', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(18, 2, 'Mochilas y Loncheras', '/escolar/mochila_y_lonchera', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(19, 3, 'Accesorios de Computo', '/computo/accesorios_de_computo', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(20, 3, 'Cd DVDs', '/computo/cd_dvds', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(21, 3, 'Memorias USB', '/computo/memorias_usb', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(22, 3, 'Cintas para Impresora', '/computo/cintas_para_impresora', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(23, 3, 'Tintas para Impresora', '/computo/tintas_para_impresora', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(24, 3, 'Toner para Impresoras', '/computo/toner_para_impresora', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(25, 3, 'Porta Laptops', '/computo/porta_laptops', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(26, 4, 'Papel Fotocopia', '/papeles/papel_fotocopia', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(27, 4, 'Papel Continuo', '/papeles/papel_continuo', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(28, 4, 'Papel Lustre', '/papeles/papel_lustre', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(29, 4, 'Papel Seda', '/papeles/papel_seda', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(30, 4, 'Cartulinas', '/papeles/cartulinas', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(31, 4, 'Cartones', '/papeles/cartones', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(32, 4, 'Papel bulky', '/papeles/papel_bulky', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(33, 4, 'Papel fotografico', '/papeles/papel_fotografico', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(34, 4, 'Papel Carbón', '/papeles/papel_carbon', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(35, 5, 'Café y Té', '/coffee_breack/cafe_y_te', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(36, 5, 'Alimentos', '/coffee_breack/alimentos', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(37, 5, 'Descartables', '/coffee_breack/descartables', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(38, 6, 'Ambientadores', '/limpieza/ambientadores', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(39, 6, 'Desinfectantes', '/limpieza/desinfectantes', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(40, 6, 'Esponjas', '/limpieza/esponjas', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(41, 6, 'Trapos', '/limpieza//trapos', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(42, 6, 'Lustrador', '/limpieza/lustrador', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(43, 6, 'Franela', '/limpieza/franela', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(44, 7, 'Pad para mouse', '/ergonomia/pad_para_mouse', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(45, 7, 'Apoyo para pies', '/ergonomia/apoyo_para_pies', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(46, 7, 'Mouse ergonomico', '/ergonomia/mouse_ergonomico', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(47, 7, 'Base para laptop', '/ergonomia/base_para_laptop', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(48, 8, 'Herramientas para pintar', '/arte/herramientas_para_pintar', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(49, 8, 'Herramientas para cortar', '/arte/herramientas_para_cortar', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(50, 8, 'Cerámica en Frío', '/arte/ceramieca_en_frio', '0000-00-00 00:00:00', '2018-01-02 00:00:00'),
(51, 8, 'Manualidades', '/arte/manualidades', '0000-00-00 00:00:00', '2018-01-02 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `reporting_to` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `api_token` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` enum('','male','female') COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dni` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ruc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `photo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci,
  `status` enum('New','Active','Suspended') COLLATE utf8_unicode_ci DEFAULT 'New',
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `reporting_to`, `name`, `email`, `password`, `api_token`, `remember_token`, `sex`, `dob`, `designation`, `dni`, `ruc`, `mobile`, `phone`, `address`, `street`, `city`, `district`, `state`, `country`, `photo`, `web`, `permissions`, `status`, `user_id`, `user_type`, `upload_folder`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'Jesus', 'superuser@lavalite.org', '$2y$10$HP148W4aZYGDLIqJ7w4PLO.GdTg9euZoCbQ9bhgfrq6nmAWeipPH6', 'HpWZYLbOWPW9vOV7Pqj0ksj5WqSagkYWaGETI2fXIfmXXeDMVjL0WzJU5Ol1', 'XENBtDLarDWxEOeLRSndGR9qtIeGCVrUk1amWqZVN9fQUEJouKT0uxh9WhJR', 'male', '0000-00-00', 'Administrador', '', '', '', '', '', '', '', '', '', 0, '[]', 'http://litepie.org', NULL, 'Active', NULL, NULL, NULL, NULL, '2015-09-15 05:00:00', '2017-12-12 03:08:35'),
(2, 0, 'Admin', 'admin@admin.com', '$2y$10$1ZgpIlrIHKVQSKsKA7WeA.E5kdZlUjPiStqHWpdCxbhZLDSBH55Cm', 'VEKnFbFDZU475KyokvwM9LOvnZOEKVPIpNC52NUQFMed8CtDXEAQhjXASWVQ', NULL, 'male', '0000-00-00', 'Admin', '', '', '', '', '', '', '', '', '', 0, '[]', 'http://litepie.org', NULL, 'Active', 14, NULL, NULL, NULL, '2015-09-15 05:00:00', '2017-12-08 04:30:14'),
(3, 0, 'User', 'user@user.com', '$2y$10$pDTEzeKVPsC08WdxnsuBOuLT6mAObZvmwNOaZs.gG2bVcUERBJJL2', 'HfHq1jCFafIqR6uDxYOlSJoerjhiPdmRwyvEVw4O3eD4u8RVHMMUiTdG73Vd', NULL, 'male', '2014-05-15', 'User', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://litepie.org', NULL, 'Active', NULL, NULL, NULL, NULL, '2015-09-15 05:00:00', NULL),
(12, 0, 'jesus', 'chuss@correo.com', '$2y$10$fN8QAy3NOQ1OJJMmDjKR2urt6.WHmiLUERkBA4i9lHk.SzqJc4t0m', 'qEzPkJcWygcoLcV4hyxBzBm410NYVtUvgl1nRVCLL1kmjUF6VqcavilVAxhb', 'rO9o5rtHbMBRglts2d7yEFeeVxx7ccJWNpzijKHibT6ZWvDP0Hx1iL2MFxDN', NULL, NULL, 'Sucursal', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 1, NULL, NULL, NULL, '2017-12-12 00:49:27', '2017-12-18 20:37:37'),
(14, 0, 'Root', 'root@lavalite.org', '$2y$10$HP148W4aZYGDLIqJ7w4PLO.GdTg9euZoCbQ9bhgfrq6nmAWeipPH6', 'HpWZYLbOWPW9vOV7Pqj0ksj5WqSagkYWaGETI2fXIfmXXeDMVjL0WzJU5Ol2', 'RG1yfK5oG0awMdWIHAQYkAKQ98i2AKoX8HU2URnSWBR3so2JuadDx1RzzJOo', 'male', '0000-00-00', 'Super usuario', '', '', '', '', '', '', '', '', '', 0, '[]', 'http://litepie.org', NULL, 'Active', NULL, NULL, NULL, NULL, '2015-09-15 05:00:00', '2017-12-12 03:08:35'),
(15, 0, 'Admin Callao', 'admincallao@hermer.com', '$2y$10$zPS5eUIG/D0ehKb7NkXeF.0pTY5eUAkxPv3cABSq2wHS73sgIBfmW', 'cxlnr61OvIf1YL9gEU81LBi90iHde8AzUFWtAnmSh8ORZF9l6Xcr8lOp7b64', 'f5iLWP1yFRfhWXipzli0ZLM5PkJM2sU32LHAZkxXoAbS9vBg0SmjdSp7r9zb', NULL, NULL, 'Administrador', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 14, NULL, NULL, NULL, '2017-12-28 20:06:37', '2017-12-28 20:06:37'),
(16, 0, 'Sucursal Callao', 'sucuarsalcallao@hermer.com', '$2y$10$SWdeMs.4ku885GQ7puzrV.m9VgRLThajmQcdBh2Mzliz2J4e0QWv2', 'xjx6aCjrctDXDSLo5flMhkwQGmIg9dwTQyReWFczVp0OS2RtMwsZjPJe9vgh', 'S1JQuDpdaoSCiJ9drYXzQgUTnp8ksXcPOuIkJMh4ws5HrmxLsnPLcvwV5RLC', NULL, NULL, 'Sucursal', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 15, NULL, NULL, NULL, '2017-12-28 20:09:27', '2017-12-28 20:09:27'),
(18, 0, 'Mildred Ramirez', 'mildreramirez14@hotmail.com', '$2y$10$3ajKwndzCSLpBBch3L21eewYtnDUzrYQu5klttUKxeidiq6N.CiAi', 'osAP7U8ff5zsiEXYN3nP2czvwZeSt5mxe7OAJIx8VWtzmK38ALbC5g749AYo', 'V98FZzoHAHNKrcbrcXAiKpPikdY9ZomxuBwaAmIxKHldvPbOZ2vWH0gF9VHX', 'female', NULL, 'Cliente', '24693625', '', '933616810', '04247436520', 'Av Angelica Gamarra', NULL, 'Los Olivos', 'Lima', 'Lima', NULL, NULL, NULL, NULL, 'Active', 14, NULL, NULL, NULL, '2018-01-11 17:04:47', '2018-01-12 18:00:21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `block_categories`
--
ALTER TABLE `block_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`),
  ADD UNIQUE KEY `clients_api_token_unique` (`api_token`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `det_products`
--
ALTER TABLE `det_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notify`
--
ALTER TABLE `notify`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_user_permission_id_index` (`permission_id`),
  ADD KEY `permission_user_user_id_index` (`user_id`);

--
-- Indices de la tabla `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revision_id_revision_type_index` (`revision_id`,`revision_type`),
  ADD KEY `revisions_user_id_index` (`user_id`),
  ADD KEY `revisions_field_index` (`field`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_index` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `type_pro`
--
ALTER TABLE `type_pro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `block_categories`
--
ALTER TABLE `block_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `calendars`
--
ALTER TABLE `calendars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `det_products`
--
ALTER TABLE `det_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `notify`
--
ALTER TABLE `notify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `permission_user`
--
ALTER TABLE `permission_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `type_pro`
--
ALTER TABLE `type_pro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
