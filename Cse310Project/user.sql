-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2020 at 06:39 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catId` int(255) NOT NULL,
  `catTitle` varchar(2000) NOT NULL,
  `catDescription` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catId`, `catTitle`, `catDescription`) VALUES
(1, 'Grocery', 'Where you can find your essential needs of your daily lives.'),
(2, 'Vegetables', 'Fresh vegetables to make your day more fresh '),
(3, 'Meat & Fish', 'Fresh meat and fish '),
(4, 'Premium Foods', 'Foreign Products ');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pId` int(20) NOT NULL,
  `pName` varchar(255) NOT NULL,
  `pDesc` varchar(255) NOT NULL,
  `pPrice` int(255) NOT NULL,
  `pDiscount` int(255) NOT NULL,
  `pQuantity` int(255) NOT NULL,
  `pPic` varchar(255) NOT NULL,
  `catId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pId`, `pName`, `pDesc`, `pPrice`, `pDiscount`, `pQuantity`, `pPic`, `catId`) VALUES
(1, 'Dano Milk', '500gm', 180, 0, 100, '', 1),
(2, 'Ispahani Mirzapur Tea ', '200gm', 200, 0, 100, '', 1),
(3, 'Nescafe Classic Coffee ', '200 gm', 300, 0, 100, '', 1),
(4, 'Mr Noodles Masala', '8 pack', 140, 0, 100, '', 1),
(5, 'Rice (Atop)', '1 kg', 100, 0, 100, '', 1),
(6, 'ACI Pure Salt ', '1 kg', 35, 0, 100, '', 1),
(7, 'Sugar', '1 Kg', 72, 0, 100, '', 1),
(8, 'Aloo- Potato', '1 kg', 35, 0, 100, '', 2),
(9, 'Onion- Peaj', '1 kg', 50, 0, 100, '', 2),
(10, 'Kacha Morich (Green Chilli )', '1 kg', 200, 0, 100, '', 2),
(11, 'Sosha', '1 kg', 40, 0, 100, '', 2),
(12, 'Lebu (Lemon)', '4pcs', 20, 0, 100, '', 2),
(13, 'Misti Kumra', '1 kg', 30, 0, 100, '', 2),
(14, 'Chicken (Broiler)', '1600gm', 272, 0, 100, '', 3),
(15, 'Chicken ( Deshi Lal Morog )', '1100gm', 450, 0, 100, '', 3),
(16, 'Beef Regular', '1kg', 600, 0, 50, '', 3),
(17, 'Mutton', '1kg', 1000, 0, 20, '', 3),
(18, 'Rui Fish', '1kg', 280, 0, 10, '', 3),
(19, 'Catla Fish', '2kg', 500, 0, 20, '', 3),
(20, 'Chingri (Bagda)', '1kg', 600, 0, 10, '', 3),
(21, 'Kitkat- 1pcs', 'Made in Thailand', 120, 10, 100, '', 4),
(22, 'Dairy Milk Bubbly-Big', '200gm', 450, 10, 20, '', 4),
(23, 'Pringles Onion Small', '500gm', 500, 10, 10, '', 4),
(24, 'Nutella', '500', 600, 15, 10, '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_type` varchar(200) NOT NULL DEFAULT 'normal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `phone`, `password`, `user_type`) VALUES
(1, 'Md. Sazidur Rahman', 'mdsazidur02@gmail.com', 1711342026, 'aaasasad', 'normal'),
(2, 'Md. Sazidur Rahman', 'md.sazidur.rahman@g.bracu.ac.bd', 1302311986, 'mansu123', 'admin'),
(3, 'yokko', 'yokkodumty@gmail.com', 1302311986, 'kulukulu12', 'normal'),
(4, 'Safi', 'safi@gadha.com', 1912306459, 'safigadha', 'normal'),
(5, 'abc', 'abc@123.com', 1234567822, 'helloworld', 'normal'),
(7, 'Jisan Uday', 'jisanuday27@gmail.com', 1123469875, 'chiglemansu', 'normal'),
(8, 'Arafat Hossain', 'thearft@gmail.com', 1222222222, 'chigle', 'normal'),
(9, 'Pranto', 'pranto123@gmail.com', 1912306459, 'lililii', 'normal'),
(10, 'shopnil', 'shopnil@yahoo.com', 1686098336, 'mansukulu', 'normal'),
(11, 'Ontor', 'ontor@gmail.com', 1302311986, 'kulukulu', 'normal'),
(12, 'Antar', 'antar@gmail.com', 1231234567, 'kulu123', 'normal'),
(13, 'hello', 'hello@gmail.com', 123456789, '123456789as9', 'normal'),
(14, 'hello123', 'hello123@gmail.com', 1234567891, 'kulukulu123', 'normal'),
(15, 'hello231', 'hello231@gmail.com', 1301234567, 'mansu!@#', 'normal'),
(17, 'hell', 'hell@gmail.com', 123464, '123456789', 'normal'),
(18, 'himi', 'himi@gmail.com', 132456, 'himihimi', 'normal'),
(19, 'rifat adar', 'rifatadar123@gmail.com', 1686098336, 'rifatadar', 'normal'),
(20, 'chigle mansu', 'chiglemansu123@gmail.com', 1123131312, 'mansu123', 'normal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pId`),
  ADD KEY `catId` (`catId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
