-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2026 at 05:42 AM
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
-- Database: `nook32_pos (1)`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(4, 'Coffee Frappes'),
(6, 'Matcha'),
(7, 'Non-Coffee'),
(5, 'Non-Coffee Frappes'),
(3, 'Nook Specials'),
(9, 'Pastries and Croffles'),
(1, 'Regular Coffee'),
(2, 'Signature'),
(8, 'Soda');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `quantity` decimal(10,3) NOT NULL DEFAULT 0.000,
  `unit` varchar(30) NOT NULL,
  `low_stock_limit` decimal(10,2) NOT NULL DEFAULT 5.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `item_name`, `quantity`, `unit`, `low_stock_limit`, `created_at`, `updated_at`) VALUES
(1, 'Coffee Beans', 1.982, 'kg', 2.00, '2026-10-15 09:35:55', '2026-11-18 03:34:59'),
(2, 'Fresh Milk', 9.460, 'L', 2.00, '2026-10-15 10:26:51', '2026-11-03 14:28:55'),
(4, 'Ice', 10.000, 'kg', 2.00, '2026-10-15 10:27:44', '2026-10-15 10:27:44'),
(6, 'Espresso Cups', 100.000, 'pcs', 20.00, '2026-10-15 10:28:38', '2026-10-15 10:28:38'),
(7, 'Sugar Syrup', 2.000, 'L', 0.50, '2026-10-15 10:29:15', '2026-10-15 10:29:15'),
(8, 'Chocolate Sauce', 2.000, 'L', 0.50, '2026-10-15 10:29:39', '2026-10-15 10:29:39'),
(9, 'Caramel Syrup', 1.955, 'L', 0.50, '2026-10-15 10:30:12', '2026-11-03 14:28:55'),
(10, 'Vanilla Syrup', 2.000, 'L', 0.50, '2026-10-15 10:30:25', '2026-10-15 10:30:25'),
(11, 'White Chocolate Sauce', 2.000, 'L', 0.50, '2026-10-15 10:57:01', '2026-10-15 10:57:01'),
(12, 'Vanilla Ice Cream', 2.000, 'kg', 0.50, '2026-10-15 10:57:57', '2026-10-15 10:57:57'),
(13, 'Biscoff Sauce', 2.000, 'kg', 0.50, '2026-10-15 10:58:36', '2026-10-15 10:58:36'),
(14, 'Orange Syrup', 2.000, 'L', 0.50, '2026-10-15 10:59:09', '2026-10-15 10:59:09'),
(15, 'Coffee Jelly', 2.000, 'kg', 0.50, '2026-10-15 11:10:06', '2026-10-15 11:10:06'),
(16, 'Strawberry Syrup', 2.000, 'L', 0.50, '2026-10-15 11:19:12', '2026-10-15 11:19:12'),
(17, 'Ube Syrup', 2.000, 'L', 0.50, '2026-10-15 11:20:39', '2026-10-15 11:20:39'),
(18, 'Cookies and Cream', 5.000, 'pack', 5.00, '2026-10-15 11:22:23', '2026-10-15 11:22:58'),
(19, 'Matcha Powder', 2.000, 'kg', 0.50, '2026-10-15 11:26:19', '2026-10-15 11:26:19'),
(20, 'Coffee Beans', 10.000, 'kg', 2.00, '2026-11-10 13:11:04', '2026-11-10 13:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cash_received` decimal(10,2) DEFAULT NULL,
  `change_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('cash','qr') NOT NULL,
  `payment_reference` varchar(150) DEFAULT NULL,
  `payment_status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `order_status` enum('pending','processing','completed') NOT NULL DEFAULT 'pending',
  `discount_type` enum('none','pwd','senior') NOT NULL DEFAULT 'none',
  `discount_customer_name` varchar(150) DEFAULT NULL,
  `discount_id_number` varchar(80) DEFAULT NULL,
  `vat_exempt_amount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `subtotal`, `discount_amount`, `total_amount`, `cash_received`, `change_amount`, `payment_method`, `payment_reference`, `payment_status`, `order_status`, `discount_type`, `discount_customer_name`, `discount_id_number`, `vat_exempt_amount`) VALUES
(1, NULL, '2026-10-13 12:54:12', 120.00, 0.00, 120.00, NULL, NULL, 'cash', NULL, 'pending', 'completed', 'none', NULL, NULL, 0.00),
(2, NULL, '2026-10-13 13:11:17', 120.00, 0.00, 120.00, 150.00, 30.00, 'cash', NULL, 'paid', 'completed', 'none', NULL, NULL, 0.00),
(3, NULL, '2026-10-13 13:12:04', 120.00, 0.00, 120.00, NULL, NULL, 'qr', '12345', 'paid', 'completed', 'none', NULL, NULL, 0.00),
(4, NULL, '2026-10-13 13:18:06', 120.00, 0.00, 120.00, 200.00, 80.00, 'cash', NULL, 'paid', 'completed', 'none', NULL, NULL, 0.00),
(5, NULL, '2026-10-15 06:48:45', 140.00, 0.00, 140.00, 200.00, 60.00, 'cash', NULL, 'paid', 'completed', 'none', NULL, NULL, 0.00),
(6, 1, '2026-10-15 08:47:18', 150.00, 0.00, 150.00, NULL, NULL, 'qr', '123456', 'paid', 'completed', 'none', NULL, NULL, 0.00),
(7, 1, '2026-10-15 14:00:48', 270.00, 0.00, 270.00, 300.00, 30.00, 'cash', NULL, 'paid', 'completed', 'none', NULL, NULL, 0.00),
(8, 1, '2026-10-19 09:30:20', 120.00, 0.00, 120.00, NULL, NULL, 'qr', '564321', 'paid', 'completed', 'none', NULL, NULL, 0.00),
(12, 1, '2026-11-02 05:18:02', 290.00, 0.00, 290.00, NULL, NULL, 'qr', '123456', 'pending', 'pending', 'none', NULL, NULL, 0.00),
(13, 1, '2026-11-03 14:25:56', 300.00, 0.00, 300.00, NULL, NULL, 'qr', '12345', 'paid', 'completed', 'none', NULL, NULL, 0.00),
(14, 1, '2026-11-18 03:34:45', 120.00, 0.00, 120.00, NULL, NULL, 'qr', '1233', 'paid', 'completed', 'none', NULL, NULL, 0.00),
(22, 1, '2026-11-19 03:19:04', 270.00, 48.21, 192.86, 250.00, 57.14, 'cash', NULL, 'paid', 'completed', 'pwd', 'ADMIN', '123456', 28.93),
(23, 1, '2026-11-19 03:20:08', 150.00, 26.79, 107.14, 150.00, 42.86, 'cash', NULL, 'paid', 'completed', 'pwd', 'admin', '123456', 16.07),
(24, 1, '2026-11-19 03:38:16', 320.00, 64.00, 256.00, 300.00, 44.00, 'cash', NULL, 'paid', 'completed', 'pwd', 'admin', '123455', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_inventory_deductions`
--

CREATE TABLE `order_inventory_deductions` (
  `order_id` int(11) NOT NULL,
  `deducted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_inventory_deductions`
--

INSERT INTO `order_inventory_deductions` (`order_id`, `deducted_at`) VALUES
(3, '2026-10-15 14:01:27'),
(7, '2026-10-15 14:00:48'),
(8, '2026-11-03 14:29:05'),
(13, '2026-11-03 14:28:55'),
(14, '2026-11-18 03:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(150) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `item_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `product_name`, `quantity`, `unit_price`, `item_total`) VALUES
(1, 1, 1, 'Americano', 1, 120.00, 120.00),
(2, 2, 1, 'Americano', 1, 120.00, 120.00),
(3, 3, 1, 'Americano', 1, 120.00, 120.00),
(4, 4, 1, 'Americano', 1, 120.00, 120.00),
(5, 5, 12, 'Nook Latte (8oz)', 1, 140.00, 140.00),
(6, 6, 5, 'Caramel Latte', 1, 150.00, 150.00),
(7, 7, 1, 'Americano', 1, 120.00, 120.00),
(8, 7, 5, 'Caramel Latte', 1, 150.00, 150.00),
(9, 8, 1, 'Americano', 1, 120.00, 120.00),
(16, 12, 36, 'Nutella Almond', 1, 140.00, 140.00),
(17, 12, 37, 'Cookies and Cream', 1, 150.00, 150.00),
(18, 13, 5, 'Caramel Latte', 2, 150.00, 300.00),
(19, 14, 1, 'Americano', 1, 120.00, 120.00),
(20, 22, 3, 'Mocha', 1, 150.00, 150.00),
(21, 22, 1, 'Americano', 1, 120.00, 120.00),
(22, 23, 5, 'Caramel Latte', 1, 150.00, 150.00),
(23, 24, 11, 'Biscoff Latte', 1, 180.00, 180.00),
(24, 24, 2, 'Latte', 1, 140.00, 140.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(150) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `availability` enum('available','unavailable') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `image`, `price`, `availability`) VALUES
(1, 1, 'Americano', 'assets/images/americano.jpg', 120.00, 'available'),
(2, 1, 'Latte', 'assets/images/americano.jpg', 140.00, 'available'),
(3, 1, 'Mocha', 'assets/images/americano.jpg', 150.00, 'available'),
(4, 1, 'Spanish Latte', 'assets/images/americano.jpg', 150.00, 'available'),
(5, 1, 'Caramel Latte', 'assets/images/americano.jpg', 150.00, 'available'),
(6, 1, 'Vanilla Latte', 'assets/images/americano.jpg', 160.00, 'available'),
(7, 1, 'White Mocha', 'assets/images/americano.jpg', 160.00, 'available'),
(8, 2, 'Ube Latte', 'assets/images/americano.jpg', 170.00, 'available'),
(9, 2, 'Caramel White Mocha', 'assets/images/americano.jpg', 170.00, 'available'),
(10, 2, 'Sea Salt Vanilla Latte (Iced Only)', 'assets/images/americano.jpg', 170.00, 'available'),
(11, 2, 'Biscoff Latte', 'assets/images/americano.jpg', 180.00, 'available'),
(12, 3, 'Nook Latte (8oz)', 'assets/images/americano.jpg', 140.00, 'available'),
(13, 3, 'Affogato (8oz)', 'assets/images/americano.jpg', 170.00, 'available'),
(14, 4, 'Caramel Frappe', 'assets/images/americano.jpg', 190.00, 'available'),
(15, 4, 'Mocha Frappe', 'assets/images/americano.jpg', 190.00, 'available'),
(16, 4, 'Coffee Jelly Frappe', 'assets/images/americano.jpg', 190.00, 'available'),
(17, 5, 'Vanilla Frappe', 'assets/images/americano.jpg', 160.00, 'available'),
(18, 5, 'Chocolate Frappe', 'assets/images/americano.jpg', 160.00, 'available'),
(19, 5, 'Strawberries & Cream Frappe', 'assets/images/americano.jpg', 160.00, 'available'),
(20, 5, 'Ube Frappe', 'assets/images/americano.jpg', 160.00, 'available'),
(21, 5, 'Cookies & Cream Frappe', 'assets/images/americano.jpg', 170.00, 'available'),
(22, 5, 'Matcha Frappe', 'assets/images/americano.jpg', 170.00, 'available'),
(23, 5, 'Biscoff Frappe', 'assets/images/americano.jpg', 190.00, 'available'),
(24, 6, 'Matcha Latte', 'assets/images/americano.jpg', 160.00, 'available'),
(25, 6, 'Dirty Matcha', 'assets/images/americano.jpg', 170.00, 'available'),
(26, 6, 'Strawberry Matcha (Iced Only)', 'assets/images/americano.jpg', 170.00, 'available'),
(27, 6, 'Ube Matcha', 'assets/images/americano.jpg', 180.00, 'available'),
(28, 7, 'Choco Latte', 'assets/images/americano.jpg', 120.00, 'available'),
(29, 7, 'Strawberry Milk (Iced Only)', 'assets/images/americano.jpg', 120.00, 'available'),
(30, 7, 'Passionate Iced Tea (Iced Only)', 'assets/images/americano.jpg', 130.00, 'available'),
(31, 7, 'Peach Yuzu Iced Tea (Iced Only)', 'assets/images/americano.jpg', 130.00, 'available'),
(32, 8, 'Green Apple Soda', 'assets/images/americano.jpg', 110.00, 'available'),
(33, 8, 'Blueberry Soda', 'assets/images/americano.jpg', 110.00, 'available'),
(34, 8, 'Strawberry Soda', 'assets/images/americano.jpg', 110.00, 'available'),
(35, 8, 'Passion Fruit Soda', 'assets/images/americano.jpg', 110.00, 'available'),
(36, 9, 'Nutella Almond', 'assets/images/americano.jpg', 140.00, 'available'),
(37, 9, 'Cookies and Cream', 'assets/images/americano.jpg', 150.00, 'available'),
(38, 9, 'Biscoff and Cream', 'assets/images/americano.jpg', 160.00, 'available');

-- --------------------------------------------------------

--
-- Table structure for table `product_recipes`
--

CREATE TABLE `product_recipes` (
  `recipe_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recipe_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_recipes`
--

INSERT INTO `product_recipes` (`recipe_id`, `product_id`, `recipe_name`, `created_at`) VALUES
(1, 1, 'Americano', '2026-10-15 10:22:11'),
(2, 2, 'Latte', '2026-10-15 10:32:55'),
(3, 3, 'Mocha', '2026-10-15 10:42:43'),
(4, 4, 'Spanish Latte', '2026-10-15 10:46:05'),
(5, 5, 'Caramel Latte', '2026-10-15 10:46:05'),
(6, 6, 'Vanilla Latte', '2026-10-15 10:55:24'),
(7, 7, 'White Mocha', '2026-10-15 10:55:24'),
(8, 13, 'Affogato', '2026-10-15 11:04:12'),
(9, 9, 'Caramel White Mocha', '2026-10-15 11:06:00'),
(10, 10, 'Sea Salt Vanilla Latte', '2026-10-15 11:06:28'),
(11, 11, 'Biscoff Latte', '2026-10-15 11:06:46'),
(12, 15, 'Mocha Frappe', '2026-10-15 11:08:33'),
(13, 16, 'Coffee Jelly Frappe', '2026-10-15 11:10:21'),
(14, 17, 'Vanilla Frappe', '2026-10-15 11:11:10'),
(15, 18, 'Chocolate Frappe', '2026-10-15 11:12:18'),
(16, 19, 'Strawberries & Cream Frappe', '2026-10-15 11:17:13'),
(17, 20, 'Ube Frappe', '2026-10-15 11:20:54'),
(18, 21, 'Cookies & Cream Frappe', '2026-10-15 11:23:16'),
(19, 22, 'Matcha Frappe', '2026-10-15 11:26:33'),
(20, 23, 'Biscoff Frappe', '2026-10-15 11:27:10'),
(21, 8, 'Ube Latte', '2026-10-15 11:37:38'),
(22, 12, 'Nook Latte (8oz)', '2026-10-15 11:37:38'),
(23, 14, 'Caramel Frappe', '2026-10-15 11:37:38'),
(24, 24, 'Matcha Latte', '2026-10-15 11:37:38'),
(25, 25, 'Dirty Matcha', '2026-10-15 11:37:38');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipe_ingredient_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `quantity_required` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipe_ingredient_id`, `recipe_id`, `inventory_id`, `quantity_required`) VALUES
(1, 1, 1, 0.018),
(2, 2, 1, 0.018),
(3, 2, 2, 0.200),
(4, 3, 1, 0.018),
(5, 3, 2, 0.180),
(6, 3, 8, 0.020),
(7, 4, 1, 0.018),
(8, 4, 2, 0.180),
(9, 4, 7, 0.020),
(10, 5, 1, 0.018),
(11, 5, 2, 0.180),
(12, 5, 9, 0.015),
(13, 6, 1, 0.018),
(14, 6, 2, 0.180),
(15, 6, 10, 0.015),
(16, 7, 1, 0.018),
(17, 7, 2, 0.180),
(18, 7, 8, 0.020),
(19, 8, 1, 0.018),
(20, 8, 12, 0.060),
(22, 9, 1, 0.018),
(23, 9, 2, 0.180),
(24, 9, 9, 0.015),
(25, 9, 11, 0.020),
(29, 10, 1, 0.018),
(30, 10, 2, 0.180),
(31, 10, 10, 0.015),
(32, 11, 1, 0.018),
(33, 11, 2, 0.180),
(34, 11, 13, 0.020),
(35, 12, 1, 0.018),
(36, 12, 2, 0.150),
(37, 12, 4, 0.150),
(38, 12, 8, 0.025),
(42, 13, 1, 0.018),
(43, 13, 2, 0.150),
(44, 13, 4, 0.150),
(45, 13, 15, 0.050),
(49, 14, 2, 0.150),
(50, 14, 4, 0.150),
(51, 14, 10, 0.020),
(52, 15, 2, 0.150),
(53, 15, 4, 0.150),
(54, 15, 8, 0.025),
(55, 16, 2, 0.150),
(56, 16, 4, 0.150),
(58, 16, 16, 0.025),
(59, 17, 2, 0.150),
(60, 17, 4, 0.150),
(61, 17, 17, 0.025),
(62, 18, 18, 0.030),
(63, 18, 2, 0.150),
(64, 18, 4, 0.150),
(66, 19, 2, 0.150),
(67, 19, 4, 0.150),
(68, 19, 19, 0.005),
(69, 20, 2, 0.150),
(70, 20, 4, 0.150),
(72, 20, 13, 0.030),
(73, 21, 1, 0.018),
(74, 21, 2, 0.180),
(75, 21, 17, 0.020),
(76, 22, 1, 0.018),
(77, 22, 2, 0.150),
(78, 22, 14, 0.015),
(79, 23, 1, 0.018),
(80, 23, 2, 0.150),
(81, 23, 4, 0.150),
(82, 23, 9, 0.020),
(86, 24, 2, 0.200),
(87, 24, 19, 0.005),
(89, 25, 1, 0.018),
(90, 25, 2, 0.180),
(91, 25, 19, 0.005);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','cashier') NOT NULL DEFAULT 'cashier',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'Nook32 Administrator', 'admin', '$2y$10$owGto.3Js08qL7UXgDWkxeBBWzibftB2IbMoZLtxP3cprC.BEFxea', 'admin', '2026-10-13 13:29:58'),
(2, 'Nook32 Cashier', 'cashier1', '$2y$10$UFirNwC6pYels7PA9Rhpn.eR.TlvQAxrJ2XxIaYqQHWpiWfo1JxVq', 'cashier', '2026-10-19 09:34:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_inventory_deductions`
--
ALTER TABLE `order_inventory_deductions`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_recipes`
--
ALTER TABLE `product_recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`recipe_ingredient_id`),
  ADD UNIQUE KEY `recipe_id` (`recipe_id`,`inventory_id`),
  ADD KEY `fk_ingredient_inventory` (`inventory_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
