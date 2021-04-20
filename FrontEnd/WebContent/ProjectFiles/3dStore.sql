-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 09, 2021 at 12:09 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `3dStore`
--

-- --------------------------------------------------------

--
-- Table structure for table `Blogs`
--

CREATE TABLE `Blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(10000) NOT NULL,
  `imgPath` varchar(300) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Blogs`
--

INSERT INTO `Blogs` (`id`, `title`, `date`, `description`, `imgPath`, `status`) VALUES
(2, 'test title', '2021-04-08', 'test title', 'custom3Ddesigns.png', 'Published'),
(3, 'test title2', '2021-04-08', 'test des', 'gig.png', 'Published'),
(4, 'test title3', '2021-04-08', 'test des', 'review designervendor.png', 'Published'),
(5, 'test title4', '2021-04-08', 'test des', 'customItems3.png', 'Published');

-- --------------------------------------------------------

--
-- Table structure for table `Categoris`
--

CREATE TABLE `Categoris` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Categoris`
--

INSERT INTO `Categoris` (`id`, `name`) VALUES
(1, 'Toys'),
(2, 'Gadgets'),
(3, 'Action Figures'),
(4, 'Jewelery'),
(5, 'Household Items');

-- --------------------------------------------------------

--
-- Table structure for table `Chat`
--

CREATE TABLE `Chat` (
  `id` int(11) NOT NULL,
  `incomeId` varchar(500) NOT NULL,
  `outGoingId` varchar(500) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `conversationId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Chat`
--

INSERT INTO `Chat` (`id`, `incomeId`, `outGoingId`, `msg`, `conversationId`) VALUES
(12, '1', '11', 'hi', 6),
(13, '11', '1', 'hey', 6);

-- --------------------------------------------------------

--
-- Table structure for table `Conversation`
--

CREATE TABLE `Conversation` (
  `id` int(11) NOT NULL,
  `senderId` int(11) NOT NULL,
  `receiverId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Conversation`
--

INSERT INTO `Conversation` (`id`, `senderId`, `receiverId`) VALUES
(6, 11, 1),
(7, 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `custom_Designs`
--

CREATE TABLE `custom_Designs` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `filePath` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `custom_Designs`
--

INSERT INTO `custom_Designs` (`id`, `orderId`, `filePath`) VALUES
(6, 51, '_productRequests__productRequests__productRequests_analyzeDesignersVendors.stl');

-- --------------------------------------------------------

--
-- Table structure for table `Custom_Orders`
--

CREATE TABLE `Custom_Orders` (
  `id` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `venderId` int(11) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `category` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `filePath` varchar(300) NOT NULL,
  `material` int(11) NOT NULL,
  `preferedSize` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `designDurationMins` float DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Custom_Orders`
--

INSERT INTO `Custom_Orders` (`id`, `customerId`, `venderId`, `description`, `category`, `name`, `filePath`, `material`, `preferedSize`, `date`, `type`, `status`, `designDurationMins`, `rating`) VALUES
(51, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-04-08 09:23:20', 'Design', 'Finished', 1, 2),
(52, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-04-08 09:23:20', 'Design', 'Accepted1', 1, 2),
(53, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-03-08 09:23:20', 'Design', 'Accepted1', 1, 2),
(54, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-02-08 09:23:20', 'Design', 'Finished', 1, 2),
(55, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-01-08 09:23:20', 'Design', 'Accepted1', 1, 2),
(56, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-07-08 09:23:20', 'Design', 'Accepted1', 1, 2),
(57, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-01-08 09:23:20', 'Design', 'Finished', 1, 2),
(58, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-02-08 09:23:20', 'Design', 'Accepted1', 1, 2),
(59, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-03-08 09:23:20', 'Design', 'Accepted1', 1, 2),
(60, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-04-08 09:23:20', 'Design', 'Finished', 1, 2),
(61, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-06-08 09:23:20', 'Design', 'Accepted1', 1, 2),
(62, 11, 4, 'design 1 description', 4, 'design 1', 'customItems4.png', 0, 0, '2021-06-08 09:23:20', 'Design', 'Accepted1', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `designCats`
--

CREATE TABLE `designCats` (
  `id` int(11) NOT NULL,
  `designerId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designCats`
--

INSERT INTO `designCats` (`id`, `designerId`, `categoryId`) VALUES
(18, 3, 3),
(19, 3, 2),
(20, 3, 5),
(21, 3, 4),
(22, 3, 1),
(23, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(20) NOT NULL,
  `description` varchar(300) NOT NULL,
  `availableMaterials` varchar(20) NOT NULL,
  `img1Path` varchar(500) NOT NULL,
  `img2Path` varchar(500) NOT NULL,
  `img3Path` varchar(500) NOT NULL,
  `img4Path` varchar(500) NOT NULL,
  `stlPath` varchar(500) NOT NULL,
  `type` varchar(10) NOT NULL,
  `category` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`id`, `name`, `price`, `description`, `availableMaterials`, `img1Path`, `img2Path`, `img3Path`, `img4Path`, `stlPath`, `type`, `category`, `userId`) VALUES
(3, 'item5', '10000', 'des5', '[\"6\",\"4\"]', 'customItems3.png', 'customItems4.png', 'customItems5.png', 'designersVendorRecommend.png', '', 'product', 0, 0),
(4, 'item5', '10000', 'des5', '[\"8\",\"6\",\"1\",\"4\"]', 'customItems3.png', 'customItems4.png', 'customItems5.png', 'designersVendorRecommend.png', '', 'product', 0, 0),
(5, 'item5', '10000', 'des5', '[\"8\",\"6\",\"1\",\"4\"]', 'customItems3.png', 'customItems4.png', 'customItems5.png', 'designersVendorRecommend.png', '', 'product', 0, 0),
(6, 'item9', '30000', 'des test', '[\"9\",\"6\"]', 'customItems5.png', 'designersVendorRecommend.png', 'paymentOptions.png', 'review designervendor.png', '', 'product', 0, 0),
(7, 'item9', '30000', 'des test', '[\"9\",\"6\"]', 'customItems5.png', 'designersVendorRecommend.png', 'paymentOptions.png', 'review designervendor.png', '', 'product', 0, 0),
(8, 'item9', '30000', 'des test', '[\"9\",\"6\"]', 'customItems5.png', 'designersVendorRecommend.png', 'paymentOptions.png', 'review designervendor.png', '', 'product', 0, 0),
(9, 'item9', '30000', 'des test', '[\"9\",\"6\"]', 'customItems5.png', 'designersVendorRecommend.png', 'paymentOptions.png', 'review designervendor.png', '', 'product', 0, 0),
(10, 'item3', '1200', 'descrip33', '[\"6\",\"1\"]', 'customItems1.png', 'customItems2.png', 'customItems3.png', 'customItems4.png', '', 'product', 0, 0),
(11, 'design1', '1000', 'design des', '', 'analyzeDesignersVendors.png', 'custom3Ddesigns.png', 'custom3Dproducts.png', 'customItems1.png', 'analyzeDesignersVendors copy.stl', 'product', 0, 0),
(12, '2design1', '1000', 'des', '', 'customItems1.png', 'customItems2.png', 'customItems3.png', 'customItems4.png', 'analyzeDesignersVendors copy.stl', 'product', 0, 0),
(13, 'item22', '1000', 'sss', '', 'customItems4.png', 'customItems5.png', 'designersVendorRecommend.png', 'paymentOptions.png', 'analyzeDesignersVendors copy.stl', 'product', 0, 0),
(14, 'design1', '1000', 'design description', '', 'analyzeDesignersVendors.png', 'custom3Ddesigns.png', 'custom3Dproducts.png', 'customItems1.png', 'analyzeDesignersVendors copy.stl', 'product', 0, 0),
(15, 'design1', '1000', 'design description', '', 'analyzeDesignersVendors.png', 'custom3Ddesigns.png', 'custom3Dproducts.png', 'customItems1.png', 'customItems2.png', 'product', 0, 0),
(16, 'design1', '1000', 'design description', '', 'analyzeDesignersVendors.png', 'custom3Ddesigns.png', 'custom3Dproducts.png', 'customItems1.png', 'analyzeDesignersVendors copy.stl', 'product', 0, 0),
(17, 'design1', '1000', 'design description', '', 'analyzeDesignersVendors.png', 'custom3Ddesigns.png', 'custom3Dproducts.png', 'customItems1.png', 'analyzeDesignersVendors copy.stl', 'product', 0, 0),
(18, 'design1', '1000', 'design description', '', 'analyzeDesignersVendors.png', 'custom3Ddesigns.png', 'custom3Dproducts.png', 'customItems1.png', 'analyzeDesignersVendors copy.stl', 'product', 0, 0),
(19, 'design1', '1000', 'design des', '', 'analyzeDesignersVendors.png', 'custom3Ddesigns.png', 'custom3Dproducts.png', 'customItems1.png', '', 'product', 0, 0),
(20, 'design12222', '1000', 'design des', '', 'customItems3.png', 'customItems4.png', 'customItems5.png', 'designersVendorRecommend.png', '', 'product', 5, 0),
(21, 'item1098098080', '10000', 'dessss', '[\"8\",\"4\"]', 'customItems2.png', 'customItems3.png', 'customItems4.png', 'customItems5.png', '', 'product', 2, 0),
(22, 'designer1', '1000', 'kjhkjkh', '', 'customItems1.png', 'customItems2.png', 'customItems3.png', 'customItems4.png', '', 'design', 2, 4),
(23, 'designer1', '1000', 'jbjhbjhjhjhbjhbjh', '', 'analyzeDesignersVendors.png', 'customItems1.png', 'customItems2.png', 'customItems3.png', 'custom3Ddesigns copy.stl', 'design', 3, 3),
(24, 'testDesign', '1234', 'testDesign Description', '', 'customItems5.png', 'designersVendorRecommend.png', 'paymentOptions.png', 'review designervendor.png', 'customItems5 copy.stl', 'design', 5, 3),
(25, 'designer1', '10000', 'dddddd', '[\"9\",\"6\"]', 'custom3Dproducts.png', 'customItems1.png', 'customItems2.png', 'customItems3.png', '', 'product', 5, 1),
(26, 'designer1', '1000', 'dddd', '[\"9\",\"8\"]', 'customItems1.png', 'customItems2.png', 'customItems3.png', 'customItems4.png', '', 'product', 5, 2),
(27, 'designer1', '1000', 'ssss', '[\"9\",\"6\"]', 'customItems4.png', 'designersVendorRecommend.png', 'paymentOptions.png', 'review designervendor.png', '', 'product', 3, 1),
(28, 'design 1', '1000', 'ssss', '', 'customItems1.png', 'customItems2.png', 'customItems3.png', 'customItems4.png', 'custom3Ddesigns copy.stl', 'design', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Materials`
--

CREATE TABLE `Materials` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Materials`
--

INSERT INTO `Materials` (`id`, `name`) VALUES
(1, 'Plastic-ABS'),
(2, 'HIPS'),
(3, 'T-Glase'),
(4, 'Plastic-PLA'),
(5, 'LayBrick'),
(6, 'Metal'),
(7, 'Nylon'),
(8, 'LayWood'),
(9, 'Ceramics');

-- --------------------------------------------------------

--
-- Table structure for table `Notifications`
--

CREATE TABLE `Notifications` (
  `id` int(11) NOT NULL,
  `receiverId` int(11) NOT NULL,
  `senderId` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `orderId` int(11) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Notifications`
--

INSERT INTO `Notifications` (`id`, `receiverId`, `senderId`, `type`, `description`, `orderId`, `date`) VALUES
(179, 4, 11, 'Request', 'You have received a Custom Design Request !', 51, '2021-04-08 07:23:20'),
(180, 11, 4, 'Request', 'Your Design Request Sent Successfully !', 51, '2021-04-08 07:23:20'),
(181, 11, 4, 'Quotation', 'Your Design Request has been Accepted with a quotation ', 51, '2021-04-08 08:32:22'),
(182, 4, 11, 'Quotation', 'Your Quotation Has been Sent Successfully ! ', 51, '2021-04-08 08:32:22'),
(183, 4, 11, 'Quotation-Accept', 'Your Quotation Has been Accepted !', 51, '2021-04-08 08:34:19'),
(184, 11, 4, 'Quotation-Accept', 'You Have Accepted Quotation For Product Request !', 51, '2021-04-08 08:34:19'),
(185, 11, 4, 'Design', 'Your Requested Design Has been Uploaded !', 51, '2021-04-08 08:35:27'),
(186, 4, 11, 'Design', 'Design Has been Uploaded Successfully !', 51, '2021-04-08 08:35:27'),
(187, 11, 4, 'Rate', 'Rate For Your Design', 51, '2021-04-08 08:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tp` varchar(10) NOT NULL,
  `productList` varchar(10000) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`id`, `name`, `address`, `email`, `tp`, `productList`, `status`) VALUES
(1, 'nayana lakshitha', 'no 3/4', 'nayana1995@gmail.com', '0711397206', '[{\"id\":\"22\",\"name\":\"designer1\",\"price\":\"1000\",\"description\":\"kjhkjkh\",\"availableMaterials\":\"\",\"img1Path\":\"customItems1.png\",\"img2Path\":\"customItems2.png\",\"img3Path\":\"customItems3.png\",\"img4Path\":\"customItems4.png\",\"stlPath\":\"\",\"type\":\"design\",\"category\":\"2\",\"qty\":1},{\"id\":\"23\",\"name\":\"designer1\",\"price\":\"1000\",\"description\":\"jbjhbjhjhjhbjhbjh\",\"availableMaterials\":\"\",\"img1Path\":\"analyzeDesignersVendors.png\",\"img2Path\":\"customItems1.png\",\"img3Path\":\"customItems2.png\",\"img4Path\":\"customItems3.png\",\"stlPath\":\"custom3Ddesigns copy.stl\",\"type\":\"design\",\"category\":\"3\",\"qty\":1},{\"id\":\"11\",\"name\":\"design1\",\"price\":\"1000\",\"description\":\"design des\",\"availableMaterials\":\"\",\"img1Path\":\"analyzeDesignersVendors.png\",\"img2Path\":\"custom3Ddesigns.png\",\"img3Path\":\"custom3Dproducts.png\",\"img4Path\":\"customItems1.png\",\"stlPath\":\"analyzeDesignersVendors copy.stl\",\"type\":\"product\",\"category\":\"0\",\"qty\":1},{\"id\":\"16\",\"name\":\"design1\",\"price\":\"1000\",\"description\":\"design description\",\"availableMaterials\":\"\",\"img1Path\":\"analyzeDesignersVendors.png\",\"img2Path\":\"custom3Ddesigns.png\",\"img3Path\":\"custom3Dproducts.png\",\"img4Path\":\"customItems1.png\",\"stlPath\":\"analyzeDesignersVendors copy.stl\",\"type\":\"product\",\"category\":\"0\",\"qty\":1}]', 'Placed'),
(3, 'nayana1 lakshitha', 'no 3/4', 'nayana1995@gmail.com', '711397206', '[{\"id\":\"22\",\"name\":\"designer1\",\"price\":\"1000\",\"description\":\"kjhkjkh\",\"availableMaterials\":\"\",\"img1Path\":\"customItems1.png\",\"img2Path\":\"customItems2.png\",\"img3Path\":\"customItems3.png\",\"img4Path\":\"customItems4.png\",\"stlPath\":\"\",\"type\":\"design\",\"category\":\"2\",\"qty\":1},{\"id\":\"23\",\"name\":\"designer1\",\"price\":\"1000\",\"description\":\"jbjhbjhjhjhbjhbjh\",\"availableMaterials\":\"\",\"img1Path\":\"analyzeDesignersVendors.png\",\"img2Path\":\"customItems1.png\",\"img3Path\":\"customItems2.png\",\"img4Path\":\"customItems3.png\",\"stlPath\":\"custom3Ddesigns copy.stl\",\"type\":\"design\",\"category\":\"3\",\"qty\":1},{\"id\":\"12\",\"name\":\"2design1\",\"price\":\"1000\",\"description\":\"des\",\"availableMaterials\":\"\",\"img1Path\":\"customItems1.png\",\"img2Path\":\"customItems2.png\",\"img3Path\":\"customItems3.png\",\"img4Path\":\"customItems4.png\",\"stlPath\":\"analyzeDesignersVendors copy.stl\",\"type\":\"product\",\"category\":\"0\",\"qty\":1},{\"id\":\"14\",\"name\":\"design1\",\"price\":\"1000\",\"description\":\"design description\",\"availableMaterials\":\"\",\"img1Path\":\"analyzeDesignersVendors.png\",\"img2Path\":\"custom3Ddesigns.png\",\"img3Path\":\"custom3Dproducts.png\",\"img4Path\":\"customItems1.png\",\"stlPath\":\"analyzeDesignersVendors copy.stl\",\"type\":\"product\",\"category\":\"0\",\"qty\":1}]', 'Placed'),
(6, 'rayan liyanage', 'no 3/4', 'rayan@gmail.com', '711397206', '[{\"id\":\"12\",\"name\":\"2design1\",\"price\":\"1000\",\"description\":\"des\",\"availableMaterials\":\"\",\"img1Path\":\"customItems1.png\",\"img2Path\":\"customItems2.png\",\"img3Path\":\"customItems3.png\",\"img4Path\":\"customItems4.png\",\"stlPath\":\"analyzeDesignersVendors copy.stl\",\"type\":\"product\",\"category\":\"0\",\"qty\":1},{\"id\":\"11\",\"name\":\"design1\",\"price\":\"1000\",\"description\":\"design des\",\"availableMaterials\":\"\",\"img1Path\":\"analyzeDesignersVendors.png\",\"img2Path\":\"custom3Ddesigns.png\",\"img3Path\":\"custom3Dproducts.png\",\"img4Path\":\"customItems1.png\",\"stlPath\":\"analyzeDesignersVendors copy.stl\",\"type\":\"product\",\"category\":\"0\",\"qty\":1}]', 'Placed'),
(7, ' ', '', '', '', '[{\"id\":\"22\",\"name\":\"designer1\",\"price\":\"1000\",\"description\":\"kjhkjkh\",\"availableMaterials\":\"\",\"img1Path\":\"customItems1.png\",\"img2Path\":\"customItems2.png\",\"img3Path\":\"customItems3.png\",\"img4Path\":\"customItems4.png\",\"stlPath\":\"\",\"type\":\"design\",\"category\":\"2\",\"qty\":1}]', 'Placed'),
(8, ' ', '', '', '', '[{\"id\":\"22\",\"name\":\"designer1\",\"price\":\"1000\",\"description\":\"kjhkjkh\",\"availableMaterials\":\"\",\"img1Path\":\"customItems1.png\",\"img2Path\":\"customItems2.png\",\"img3Path\":\"customItems3.png\",\"img4Path\":\"customItems4.png\",\"stlPath\":\"\",\"type\":\"design\",\"category\":\"2\",\"qty\":1}]', 'Placed'),
(9, ' ', '', '', '', '', 'Placed'),
(10, ' ', '', '', '', '', 'Placed'),
(11, ' ', '', '', '', '', 'Placed');

-- --------------------------------------------------------

--
-- Table structure for table `Printers`
--

CREATE TABLE `Printers` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `point` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Printers`
--

INSERT INTO `Printers` (`id`, `name`, `point`) VALUES
(1, 'Replicator', 0.31),
(2, 'SD300 Pro', 0.21),
(3, 'uPrint', 0.27),
(4, 'V-Flash', 0.06),
(5, '3D Touch', 0.14);

-- --------------------------------------------------------

--
-- Table structure for table `Quotation`
--

CREATE TABLE `Quotation` (
  `id` int(11) NOT NULL,
  `customOrderId` int(11) NOT NULL,
  `quotationFile` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Quotation`
--

INSERT INTO `Quotation` (`id`, `customOrderId`, `quotationFile`) VALUES
(37, 51, '_quotations__quotations__quotations__quotations_Quotation (2) (1).pdf');

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `description` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`id`, `productId`, `userId`, `description`) VALUES
(1, 22, 11, 'good product'),
(2, 23, 11, 'totally impressed'),
(3, 25, 0, 'nice');

-- --------------------------------------------------------

--
-- Table structure for table `upVotes`
--

CREATE TABLE `upVotes` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upVotes`
--

INSERT INTO `upVotes` (`id`, `userId`, `productId`) VALUES
(12, 11, 28),
(13, 11, 28),
(14, 11, 28),
(15, 11, 3),
(16, 12, 3),
(17, 11, 4),
(18, 11, 5),
(19, 11, 3),
(20, 11, 4),
(21, 11, 5),
(22, 11, 5),
(23, 11, 6),
(24, 11, 7),
(25, 12, 8),
(26, 11, 3),
(27, 11, 4),
(28, 11, 9),
(29, 11, 10),
(30, 11, 11),
(31, 11, 12),
(32, 11, 3),
(33, 11, 5),
(34, 11, 4),
(35, 11, 3),
(36, 11, 28),
(37, 11, 28),
(38, 12, 3),
(39, 12, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `bDay` date DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `tp` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `rating` float NOT NULL,
  `noOfRaters` int(11) NOT NULL,
  `avgDuration` float DEFAULT NULL,
  `points` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `imgPath` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `name`, `email`, `address`, `bDay`, `city`, `tp`, `password`, `rating`, `noOfRaters`, `avgDuration`, `points`, `type`, `imgPath`) VALUES
(1, 'vender1', 'email1', 'address1', '1996-02-02', 'city1', '0711397206', 'vender1', 0, 0, 0, 0, 'vender', '122222.jpg'),
(2, 'vender2', 'email2', 'address2', '2021-04-04', 'city2', '0711397205', 'vender2', 0, 0, 0, 0, 'vender', '122222.jpg'),
(3, 'designer1', 'email3', 'address3', '1991-10-16', 'city3', '0771397209', 'designer1', 0, 0, 0, 0, 'designer', 'IMG_2601.JPG'),
(4, 'designer2', 'email4', 'address4', '2021-04-03', 'city4', '0112345432', 'designer2', 3.5, 1, 1, 10, 'designer', 'IMG_2601.JPG'),
(11, 'user', 'user@gmail.com', 'address5', '2021-04-05', 'city5', '711234567', 'password', 0, 0, 0, 0, 'user', '122222.jpg'),
(12, 'admin', 'admin@gmail.com', 'address5', '2021-04-05', 'city5', '711234567', 'admin', 0, 0, 0, 0, 'admin', '122222.jpg'),
(13, 'nayana lakshitha', 'nayana1995@gmail.com', 'no 3/4', '2021-04-09', 'ambalantota', '0711397206', 'pass', 0, 0, NULL, 0, 'user', ''),
(14, 'rayan liyanage', 'rayan@gmail.com', 'no 3/4', '2021-04-09', 'ambalantota', '711397206', 'pass', 0, 0, NULL, 0, 'designer', '122222.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `venderMaterials`
--

CREATE TABLE `venderMaterials` (
  `id` int(11) NOT NULL,
  `venderId` int(11) NOT NULL,
  `material` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venderMaterials`
--

INSERT INTO `venderMaterials` (`id`, `venderId`, `material`) VALUES
(17, 1, 2),
(18, 1, 6),
(19, 1, 4),
(20, 1, 1),
(22, 2, 7),
(23, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `venderPrinters`
--

CREATE TABLE `venderPrinters` (
  `id` int(11) NOT NULL,
  `venderId` int(11) NOT NULL,
  `printerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venderPrinters`
--

INSERT INTO `venderPrinters` (`id`, `venderId`, `printerId`) VALUES
(5, 1, 1),
(6, 1, 3),
(11, 2, 1),
(12, 2, 3),
(13, 2, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Blogs`
--
ALTER TABLE `Blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Categoris`
--
ALTER TABLE `Categoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Chat`
--
ALTER TABLE `Chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Conversation`
--
ALTER TABLE `Conversation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_Designs`
--
ALTER TABLE `custom_Designs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Custom_Orders`
--
ALTER TABLE `Custom_Orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designCats`
--
ALTER TABLE `designCats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Materials`
--
ALTER TABLE `Materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Notifications`
--
ALTER TABLE `Notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Printers`
--
ALTER TABLE `Printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Quotation`
--
ALTER TABLE `Quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upVotes`
--
ALTER TABLE `upVotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venderMaterials`
--
ALTER TABLE `venderMaterials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venderPrinters`
--
ALTER TABLE `venderPrinters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Blogs`
--
ALTER TABLE `Blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Categoris`
--
ALTER TABLE `Categoris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Chat`
--
ALTER TABLE `Chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Conversation`
--
ALTER TABLE `Conversation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_Designs`
--
ALTER TABLE `custom_Designs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Custom_Orders`
--
ALTER TABLE `Custom_Orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `designCats`
--
ALTER TABLE `designCats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `Materials`
--
ALTER TABLE `Materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Notifications`
--
ALTER TABLE `Notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Printers`
--
ALTER TABLE `Printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Quotation`
--
ALTER TABLE `Quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `Reviews`
--
ALTER TABLE `Reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `upVotes`
--
ALTER TABLE `upVotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `venderMaterials`
--
ALTER TABLE `venderMaterials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `venderPrinters`
--
ALTER TABLE `venderPrinters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
