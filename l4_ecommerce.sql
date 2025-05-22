-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 02:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `l4_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `cart_product_quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user`, `product`, `cart_product_quantity`, `created_at`) VALUES
(5, 9, 2, 1, '2025-05-19 08:55:44'),
(6, 9, 1, 1, '2025-05-19 08:55:46'),
(7, 10, 2, 1, '2025-05-19 08:58:38'),
(8, 10, 1, 1, '2025-05-19 08:58:42'),
(16, 11, 2, 1, '2025-05-22 12:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `category_description` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_description`, `date_created`) VALUES
(1, 'electronics', 'electronics category', '2025-04-10 08:57:20'),
(2, 'home_utils', 'Home materials', '2025-04-10 08:57:20'),
(3, 'mechanics', 'mechanic products', '2025-04-10 08:57:20'),
(4, 'medical', 'medical products', '2025-04-10 08:57:20'),
(5, 'clothes', 'clothes', '2025-04-10 08:57:20'),
(6, 'furniture', 'furniture materials', '2025-04-10 08:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `direct_customer`
--

CREATE TABLE `direct_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_names` varchar(255) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_phone_number` varchar(20) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `ordered_product` int(11) DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `payment_method` enum('pod','flutterwave') DEFAULT NULL,
  `payment_status` enum('pending','completed','failed') DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer` int(11) DEFAULT NULL,
  `payment_method` enum('pod','flutterwave') DEFAULT NULL,
  `payment_status` enum('pending','completed','failed') DEFAULT 'pending',
  `delivery_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_ordered` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer`, `payment_method`, `payment_status`, `delivery_time`, `date_ordered`) VALUES
(144, 11, 'flutterwave', 'pending', '2025-05-22 08:21:47', '2025-05-22 08:21:47'),
(309, 11, '', 'pending', '2025-05-22 12:32:53', '2025-05-22 12:32:53'),
(529, 11, 'pod', 'pending', '2025-05-22 08:21:06', '2025-05-22 08:21:06'),
(639, 11, 'pod', 'pending', '2025-05-22 12:19:51', '2025-05-22 12:19:51'),
(651, 11, 'flutterwave', 'pending', '2025-05-22 12:36:18', '2025-05-22 12:36:18'),
(703, 11, '', 'pending', '2025-05-22 08:22:44', '2025-05-22 08:22:44'),
(902, 11, 'pod', 'pending', '2025-05-22 12:10:47', '2025-05-22 12:10:47');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` int(11) NOT NULL,
  `order_request` int(11) DEFAULT NULL,
  `item_ordered` int(11) DEFAULT NULL,
  `item_quantity` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `order_request`, `item_ordered`, `item_quantity`, `date_created`) VALUES
(1, 529, 2, 0, '2025-05-22 08:21:06'),
(2, 144, 1, 0, '2025-05-22 08:21:47'),
(3, 703, 2, 0, '2025-05-22 08:22:44'),
(4, 902, 2, 0, '2025-05-22 12:10:47'),
(5, 639, 1, 0, '2025-05-22 12:19:51'),
(6, 309, 1, 0, '2025-05-22 12:32:53'),
(7, 651, 1, 0, '2025-05-22 12:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_category` int(11) DEFAULT NULL,
  `product_tag` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_image`, `product_quantity`, `product_price`, `product_description`, `product_category`, `product_tag`, `created_at`) VALUES
(1, 'Mix fruits', 'https://png.pngitem.com/pimgs/s/121-1215558_basket-clipart-fruit-fruits-clipart-transparent-background-hd.png', 15, 1000.00, 'The Nike Jordan 4 Retro Midnight Navy has a strong history that will only get bigger with time. This Jordan 4 model with a white base and blue detailing was released by Nike on October 29, 2022. However, this model has been out on the secondary market for a while, why? Well, because on September 6th earlier this year, there was a burglary at a truck depot where these and $800,000 worth of other sneakers were stolen. Now that Nike has finally released these incredibly stylish sneakers, we\'ve got them too!', 5, 2, '2025-04-10 09:04:56'),
(2, 'Oranges', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl8VoZgOHDGgNeagIJHWkwN6L74tSc4V64Yg&s', 20, 2000.00, 'x Travis Scott Air Jordan 1 Low sneakers', 5, 1, '2025-04-10 09:04:56'),
(3, 'RTX 4060', 'https://www.function18.com/cdn/shop/files/Nike-Jordan-Pro-Golf-Cap-FV5296-010-1_2280x.progressive.png.jpg?v=1736751865', 20, 300000.00, 'Nvidia RTX 4060', 1, 4, '2025-04-10 09:09:21'),
(4, 'PS5 (Playstation 5)', 'https://drive.google.com/file/d/1C96XpO5eW8k4jwFp8Aqi4kvTp4Vr1ZaD/view?usp=drive_link', 5, 850000.00, 'playstation 5', 1, 3, '2025-04-10 09:09:21');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(100) DEFAULT NULL,
  `tag_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`, `tag_description`) VALUES
(1, 'Brand New', 'brand new'),
(2, 'Hot Sales', 'hot sales'),
(3, 'Black Friday', 'black friday'),
(4, 'promotions', 'promotions');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `phone_number`, `delivery_address`, `password`, `create_date`) VALUES
(1, '', 'mark@gmail.com', '089874372', 'Kigali Nyarugenge', '123', '2025-04-14 07:47:17'),
(3, 'Mark', 'email@gmail.com', '0798876212', 'Kigali Nyarugenge', '123', '2025-04-14 08:11:02'),
(4, 'Monday', 'monday@gmail.com', '0788763421', 'Kigali Kicukiro', '1234', '2025-04-14 08:17:30'),
(5, 'Tuesday', 'tuesday@gmail.com', '078876321', 'Kigali Nyarugenge', '1234', '2025-04-14 08:18:33'),
(6, 'fr98eh', 'ferf@gmail.com', '21345678983', 'Kigali Kicukiro', '1234', '2025-04-14 08:19:23'),
(7, 'riyarita', 'riya@gmail.com', '0789540180', 'KAGARAMA', 'KICUKIRO', '2025-05-14 07:28:46'),
(8, 'john', 'john@gmail.com', '0789540180', 'MUYANGE', 'KICUKIRO', '2025-05-14 10:36:47'),
(9, 'hamza', 'hamza@gmail.com', '0798203511', 'bugesera', 'muyange123', '2025-05-16 17:16:55'),
(10, 'eliabkanyacyaro', 'eliab@gmail.com', '0789540180', 'gahanga', '123', '2025-05-19 08:58:10'),
(11, 'ange', 'ange@gmail.com', '0789540180', 'KAGARAMA', '123', '2025-05-22 08:18:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `product` (`product`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `direct_customer`
--
ALTER TABLE `direct_customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `ordered_product` (`ordered_product`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer` (`customer`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`),
  ADD KEY `item_ordered` (`item_ordered`),
  ADD KEY `order_request` (`order_request`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_category` (`product_category`),
  ADD KEY `product_tag` (`product_tag`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `direct_customer`
--
ALTER TABLE `direct_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=903;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `direct_customer`
--
ALTER TABLE `direct_customer`
  ADD CONSTRAINT `direct_customer_ibfk_1` FOREIGN KEY (`ordered_product`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`item_ordered`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`order_request`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_category`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`product_tag`) REFERENCES `tags` (`tag_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
