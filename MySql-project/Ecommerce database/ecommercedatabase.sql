-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 05:02 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommercedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admindata`
--

CREATE TABLE `admindata` (
  `id` int(11) NOT NULL,
  `emailaddress` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admindata`
--

INSERT INTO `admindata` (`id`, `emailaddress`, `password`) VALUES
(100, 'jakegyllin@gmail.com', '5498756dq');

-- --------------------------------------------------------

--
-- Table structure for table `customercards`
--

CREATE TABLE `customercards` (
  `id` int(11) NOT NULL,
  `customerid` int(11) DEFAULT NULL,
  `cardno` int(11) NOT NULL,
  `expirymonth` int(11) NOT NULL,
  `expiryyear` int(11) NOT NULL,
  `cardholdersname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customercards`
--

INSERT INTO `customercards` (`id`, `customerid`, `cardno`, `expirymonth`, `expiryyear`, `cardholdersname`) VALUES
(1, 1, 88798797, 3, 2025, 'Ram V');

-- --------------------------------------------------------

--
-- Table structure for table `customersdata`
--

CREATE TABLE `customersdata` (
  `id` int(11) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `secondname` varchar(200) DEFAULT NULL,
  `emailaddress` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contactno` varchar(50) NOT NULL,
  `address1` varchar(500) NOT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postalcode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customersdata`
--

INSERT INTO `customersdata` (`id`, `firstname`, `secondname`, `emailaddress`, `password`, `contactno`, `address1`, `address2`, `city`, `state`, `country`, `postalcode`) VALUES
(1, 'Ram', 'V', 'ramv122@gmail.com', 'ef44sdcv', '+9754', 'dcviufhv', 'tyfyfguy', 'Trivandrum', 'Kerala', 'India', '57977');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `paymentid` int(11) DEFAULT NULL,
  `itemquantity` int(50) NOT NULL,
  `price` float(9,2) NOT NULL,
  `grossamount` float(9,2) NOT NULL,
  `orderdate` datetime NOT NULL,
  `orderstatus` enum('Payment pending','Ready to dispach','On the way','Shipped','Delivered','Cancelled') DEFAULT NULL,
  `shippeddate` datetime NOT NULL,
  `address1` varchar(500) NOT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `postalcode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `productid`, `customerid`, `paymentid`, `itemquantity`, `price`, `grossamount`, `orderdate`, `orderstatus`, `shippeddate`, `address1`, `address2`, `city`, `state`, `country`, `postalcode`) VALUES
(1, 1, 1, 1, 1, 140000.00, 0.00, '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 'hrthrh', '[value-12]', 'Trivandrum', 'Kerala', 'India', '548949');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `paymentmethod` enum('Card','UPI','COD') DEFAULT NULL,
  `transactionid` varchar(50) NOT NULL,
  `paymentdate` datetime NOT NULL,
  `amount` float(9,2) NOT NULL,
  `status` enum('Paid','Cancelled','COD') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `paymentmethod`, `transactionid`, `paymentdate`, `amount`, `status`) VALUES
(1, 'UPI', 'rbhrthrt22', '0000-00-00 00:00:00', 14000.00, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `id` int(11) NOT NULL,
  `productcategory` varchar(200) NOT NULL,
  `categorydescription` varchar(500) NOT NULL,
  `productimage` varchar(1000) NOT NULL,
  `status` enum('Enabled','Disabled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`id`, `productcategory`, `categorydescription`, `productimage`, `status`) VALUES
(1, 'Electronics', 'Wide variety of electronic items...', 'urls...', 'Enabled');

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

CREATE TABLE `productimages` (
  `id` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `productimages` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`id`, `productid`, `productimages`) VALUES
(1, 1, 'urls..');

-- --------------------------------------------------------

--
-- Table structure for table `productrating`
--

CREATE TABLE `productrating` (
  `id` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `rating` enum('5','4','3','2','1') NOT NULL,
  `comments` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productrating`
--

INSERT INTO `productrating` (`id`, `productid`, `customerid`, `rating`, `comments`) VALUES
(1, 1, 1, '3', 'Avg experiance');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productcategoryid` int(11) DEFAULT NULL,
  `productname` varchar(200) NOT NULL,
  `productdescription` varchar(1000) NOT NULL,
  `price` float(9,2) NOT NULL,
  `discount` float(5,2) DEFAULT NULL,
  `mrp` float(9,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` enum('Available','Not available','Coming soon','Not deliverable') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productcategoryid`, `productname`, `productdescription`, `price`, `discount`, `mrp`, `stock`, `status`) VALUES
(1, 1, 'Samsung 4k led tv', 'This is the latest...', 140000.00, 10.00, 140000.00, 2, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL,
  `productid` int(11) DEFAULT NULL,
  `customerid` int(11) DEFAULT NULL,
  `itemquantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`id`, `productid`, `customerid`, `itemquantity`) VALUES
(1, 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admindata`
--
ALTER TABLE `admindata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emailaddress` (`emailaddress`);

--
-- Indexes for table `customercards`
--
ALTER TABLE `customercards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerid` (`customerid`);

--
-- Indexes for table `customersdata`
--
ALTER TABLE `customersdata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emailaddress` (`emailaddress`),
  ADD UNIQUE KEY `contactno` (`contactno`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`),
  ADD KEY `customerid` (`customerid`),
  ADD KEY `paymentid` (`paymentid`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`);

--
-- Indexes for table `productrating`
--
ALTER TABLE `productrating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`),
  ADD KEY `customerid` (`customerid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productcategoryid` (`productcategoryid`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`),
  ADD KEY `customerid` (`customerid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admindata`
--
ALTER TABLE `admindata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `customercards`
--
ALTER TABLE `customercards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customersdata`
--
ALTER TABLE `customersdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productimages`
--
ALTER TABLE `productimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productrating`
--
ALTER TABLE `productrating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customercards`
--
ALTER TABLE `customercards`
  ADD CONSTRAINT `customercards_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customersdata` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customersdata` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`paymentid`) REFERENCES `payments` (`id`);

--
-- Constraints for table `productimages`
--
ALTER TABLE `productimages`
  ADD CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`);

--
-- Constraints for table `productrating`
--
ALTER TABLE `productrating`
  ADD CONSTRAINT `productrating_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productrating_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customersdata` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productcategoryid`) REFERENCES `productcategory` (`id`);

--
-- Constraints for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`customerid`) REFERENCES `customersdata` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
