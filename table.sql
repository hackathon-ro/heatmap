-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 14, 2012 at 10:56 PM
-- Server version: 5.1.54
-- PHP Version: 5.3.5-1ubuntu7.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `heatmap`
--

-- --------------------------------------------------------

--
-- Table structure for table `heatmap`
--

CREATE TABLE IF NOT EXISTS `heatmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `time` date NOT NULL,
  `button` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `heatmap`
--

INSERT INTO `heatmap` (`id`, `url`, `x`, `y`, `time`, `button`) VALUES
(1, 'http://localhost/rac-heatmap/test.html', 799, 172, '2012-06-14', 0),
(2, 'http://localhost/rac-heatmap/test.html', 551, 105, '2012-06-14', 0),
(3, 'http://localhost/rac-heatmap/test.html', 551, 280, '2012-06-14', 0),
(4, 'http://localhost/rac-heatmap/test.html', 693, 336, '2012-06-14', 0),
(5, 'http://localhost/rac-heatmap/test.html', 693, 336, '2012-06-14', 0),
(6, 'http://localhost/rac-heatmap/test.html', 903, 198, '2012-06-14', 0),
(7, 'http://localhost/rac-heatmap/test.html', 964, 186, '2012-06-14', 0),
(8, 'http://localhost/rac-heatmap/test.html', 964, 186, '2012-06-14', 0),
(9, 'http://localhost/rac-heatmap/test.html', 405, 223, '2012-06-14', 0),
(10, 'http://localhost/rac-heatmap/test.html', 127, 250, '2012-06-14', 0),
(11, 'http://localhost/rac-heatmap/test.html', 0, 424, '2012-06-14', 0),
(12, 'http://localhost/rac-heatmap/test.html', 229, 313, '2012-06-14', 0),
(13, 'http://localhost/rac-heatmap/test.html', 767, 137, '2012-06-14', 0),
(14, 'http://localhost/rac-heatmap/test.html', 1228, 18, '2012-06-14', 0),
(15, 'http://localhost/rac-heatmap/test.html', 1279, 159, '2012-06-14', 0),
(16, 'http://localhost/rac-heatmap/test.html', 1194, 348, '2012-06-14', 0),
(17, 'http://localhost/rac-heatmap/test.html', 1095, 449, '2012-06-14', 0),
(18, 'http://localhost/rac-heatmap/test.html', 616, 455, '2012-06-14', 0),
(19, 'http://localhost/rac-heatmap/test.html', 210, 438, '2012-06-14', 0),
(20, 'http://localhost/rac-heatmap/test.html', 109, 361, '2012-06-14', 0),
(21, 'http://localhost/rac-heatmap/test.html', 90, 72, '2012-06-14', 0),
(22, 'http://localhost/rac-heatmap/test.html', 84, 13, '2012-06-14', 0),
(23, 'http://localhost/rac-heatmap/test.html', 576, 240, '2012-06-14', 0),
(24, 'http://localhost/rac-heatmap/test.html', 1104, 295, '2012-06-14', 0),
(25, 'http://localhost/rac-heatmap/test.html', 1279, 311, '2012-06-14', 0),
(26, 'http://localhost/rac-heatmap/test.html', 612, 298, '2012-06-14', 0),
(27, 'http://localhost/rac-heatmap/test.html', 976, 168, '2012-06-14', 0),
(28, 'http://localhost/rac-heatmap/test.html', 475, 172, '2012-06-14', 0),
(29, 'http://localhost/rac-heatmap/test.html', 312, 282, '2012-06-14', 0),
(30, 'http://localhost/rac-heatmap/test.html', 621, 377, '2012-06-14', 0),
(31, 'http://localhost/rac-heatmap/test.html', 818, 181, '2012-06-14', 0),
(32, 'http://localhost/rac-heatmap/test.html', 862, 113, '2012-06-14', 0),
(33, 'http://localhost/rac-heatmap/test.html', 761, 114, '2012-06-14', 0),
(34, 'http://localhost/rac-heatmap/test.html', 1046, 74, '2012-06-14', 0),
(35, 'http://localhost/rac-heatmap/test.html', 1046, 74, '2012-06-14', 0),
(36, 'http://localhost/rac-heatmap/test.html', 1203, 131, '2012-06-14', 0);