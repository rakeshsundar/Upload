-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2019 at 12:50 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ibs`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `m_status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`id`, `name`, `username`, `password`, `m_status_id`) VALUES
(1, 'Admin', 'admin', '12345', 1);

-- --------------------------------------------------------

--
-- Table structure for table `case_details`
--

CREATE TABLE `case_details` (
  `id` int(11) NOT NULL,
  `case_name` varchar(150) NOT NULL,
  `m_service_type_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(30) NOT NULL,
  `white_paper` varchar(30) NOT NULL,
  `m_status_id` int(11) NOT NULL,
  `date_of_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_details`
--

INSERT INTO `case_details` (`id`, `case_name`, `m_service_type_id`, `company_name`, `description`, `image`, `white_paper`, `m_status_id`, `date_of_creation`) VALUES
(1, 'Hardware Name', 1, 'Softdew Tech', 'wqdwef rfre fgr grg', 'img_20042017051723.jpg', 'img_20042017051723.jpg', 1, '2017-04-20'),
(2, 'frgfg', 2, 'fgfg', '<p><b><i>dvfvgfbbgb</i></b></p>', 'img_20042017071522.jpg', 'wp_20042017071522.jpg', 1, '2017-04-20');

-- --------------------------------------------------------

--
-- Table structure for table `case_study`
--

CREATE TABLE `case_study` (
  `id` mediumint(9) NOT NULL,
  `case_title` varchar(64) DEFAULT NULL,
  `case_document_url` varchar(256) DEFAULT NULL,
  `added_on` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0 means disable 1 means enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `mobile` varchar(14) DEFAULT NULL,
  `message` varchar(1024) DEFAULT NULL,
  `date_of_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `message`, `date_of_creation`) VALUES
(1, 'Naresh Kumar', 'naresh@gmail.com', '7835909031', 'This is test message', '2017-05-15'),
(2, 'Kalu Ram', 'kalu@gmail.com', 'kalu78359', 'There is no message for displaying', '0000-00-00'),
(3, 'defgre', 'baghel3349@gmail.com', 'rfg', 'ggg', '0000-00-00'),
(4, ',l ;k;', 'naresh@softdew.co.in', '7835909031', 'sdfdef grtgtrg ', '0000-00-00'),
(5, 'ed', 'ed', 'eded', 'ededed', '0000-00-00'),
(6, 'ed', 'ed', 'eded', 'ededed', '0000-00-00'),
(7, 'ed', 'ed', 'eded', 'ededed', '0000-00-00'),
(8, 'uki', 'iki', 'k,ik,', 'k,ki,k,', '0000-00-00'),
(9, 'ggh', 'ghg', 'hghg', 'h gh', '0000-00-00'),
(10, 'jjj', 'jhj', 'hjhj', ' jhj', '0000-00-00'),
(11, 'fbn', 'ngn', 'hnhnh', 'nhnhn', '0000-00-00'),
(12, 'gbhgb', 'gb', 'gbgb', 'gbgb', '0000-00-00'),
(13, 'gbgb', 'gbgb', 'gbg', 'bgbgbg', '0000-00-00'),
(14, 'iolo', 'loi;', 'o;o', ';o;op;', '0000-00-00'),
(15, 'efe', 'fefe', 'ferfe', 'ferf', '0000-00-00'),
(16, 'ghjghj', 'ghjgh', 'jhgj', ' jghjghk', '0000-00-00'),
(17, 'dfgbb', 'gbg', 'bgbg', 'bgbgb', '0000-00-00'),
(18, 'gfhj', 'ghgh', 'ghgh', 'ghghg', '0000-00-00'),
(19, 'hn', 'nhn', 'nhnhn', 'hnhn', '0000-00-00'),
(20, 'erg', 'gtgtg', 'tgtg', 'tgtg', '0000-00-00'),
(21, 'fgh', 'htyh', 'yhyh', 'yhyhyh', '0000-00-00'),
(22, 'tyy', 'jyj', 'yjy', 'jyjyj', '0000-00-00'),
(23, 'dfgdg', 'fgfg', 'fgfgf', 'gfgg', '0000-00-00'),
(24, 'tgbg', 'bgbgb', 'gbg', 'bgbgb', '0000-00-00'),
(25, 'yhjyh', 'yhyh', 'yhyh', 'yhyh', '0000-00-00'),
(26, 'hn', 'nyhn', 'nhn', 'hnhn', '0000-00-00'),
(27, 'rgr', 'gtg', 'tgtgt', 'tgtg', '0000-00-00'),
(28, 'dfgrthfv', 'vfv', 'vfv', 'fvfv', '0000-00-00'),
(29, 'bgf', 'bgbg', 'bgbg', 'bgb', '0000-00-00'),
(30, 'bhtg', 'bgb', 'gbgb', 'gbgb', '0000-00-00'),
(31, 'hnh', 'nhnh', 'nhn', 'hnhn', '0000-00-00'),
(32, 'hj', 'jj', 'uj', 'ujuj', '0001-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` int(11) NOT NULL,
  `m_service_type_id` smallint(6) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_description` varchar(2048) DEFAULT NULL,
  `product_image` varchar(512) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL COMMENT '0 means disable and 1 means enable',
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `m_service_type_id`, `product_name`, `product_title`, `product_description`, `product_image`, `price`, `status`) VALUES
(1, 4, 'ATID AT-870', 'RFID - ATID READERS - HANDHELD', '<h4><b><i><u>Naresh</u></i></b></h4><div>ATID: Lightweight rugged handheld computer in a convenient compact format. It comes with a variety of integrated options such as RFID reader/writer in HF or UHF, 1D Laser or 2D Imager for Barcode scanning, Wi-Fi, Edge/GPRS GSM, Camera, Bluetooth Class II and GPS. The large 3,5? touch screen of the AT-870 provides a large clear display and easy interaction with the user. The AT-870 can drop of 1,5 meter height and has a IP65 rated enclosure which makes it an ideal device for Industrial environments. Suitable for applications in Healthcare, Pharmaceutical, Retail, Libraries and Logistics<br></div>', '/Upload_Product/17052017011044FRID1jpg.jpg', '12000', 0),
(2, 4, 'ATID AT-911', 'RFID - ATID READERS - HANDHELD', 'AT911 Android system: 4.0, Industrial Handheld Reader, Providing various communication functions with Micro SD Memory Card correspondence. RFID (HF /UHF) available mounting, Barcode scanner, WLAN/Bluetooth/GSM/GPRS/HSPA+ along with Camera/GPS and Memory RAM/ROM 512MB', '/Upload_Product/17052017024231FRID2.jpg', '5000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_info`
--

CREATE TABLE `service_info` (
  `id` mediumint(9) NOT NULL,
  `application` varchar(512) DEFAULT NULL,
  `hardware` varchar(512) DEFAULT NULL,
  `service` varchar(512) DEFAULT NULL,
  `wireless` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `id` smallint(6) NOT NULL,
  `service_name` varchar(128) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`id`, `service_name`, `status`) VALUES
(1, 'Application Solution', 1),
(2, 'Hardware Products', 1),
(3, 'Service & Support', 1),
(4, 'Wireless Infrastructure', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_details`
--
ALTER TABLE `case_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_study`
--
ALTER TABLE `case_study`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_info`
--
ALTER TABLE `service_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `case_details`
--
ALTER TABLE `case_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `case_study`
--
ALTER TABLE `case_study`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `service_info`
--
ALTER TABLE `service_info`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
