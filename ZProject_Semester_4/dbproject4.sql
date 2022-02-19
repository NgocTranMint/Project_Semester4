-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 10, 2022 at 03:10 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


--
-- Database: `dbproject4`
--
CREATE DATABASE IF NOT EXISTS `dbproject4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbproject4`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `dob` date DEFAULT NULL,
  `addr` varchar(250) NOT NULL,
  `gender` bit(2) NOT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `avatar` text NOT NULL,
  `status` bit(2) NOT NULL,
  `create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `username`, `password`, `fullname`, `email`, `dob`, `addr`, `gender`, `phone`, `avatar`, `status`, `create_date`) VALUES
(98, 'admin', '$2a$10$cCcdzCmcV8gEdY5M1HfdJ.o2t4IS2NezqD9kZC0nAmQ52VIxTtcAu', 'Admin Nguyen', 'tbao1834510@gmail.com', '1995-01-01', 'Tp HCM', b'00', '0999999999', '7ae495b8454a4fa18ce205e45d19cc1f.jpg', b'01', '2022-01-31'),
(99, 'ngoctran', '$2a$10$cCcdzCmcV8gEdY5M1HfdJ.o2t4IS2NezqD9kZC0nAmQ52VIxTtcAu', 'Nguyen H Ngoc Tran', 'ngoctran.04435012001@gmail.com', '2001-04-01', 'Tay Ninh', b'00', '0765716380', 'd817a1cee4314c58a141d5094be6a954.jpg', b'01', '2022-01-31'),
(100, 'faculty', '$2a$10$cCcdzCmcV8gEdY5M1HfdJ.o2t4IS2NezqD9kZC0nAmQ52VIxTtcAu', 'Faculty John', 'tranmini0434501@gmail.com', '1992-01-01', 'Binh Duong', b'01', '0999123456', '6b751578e8ca40f2ac687be9fb6ebd85.jpg', b'01', '2022-01-31'),
(101, 'chuongnau', '$2a$10$cCcdzCmcV8gEdY5M1HfdJ.o2t4IS2NezqD9kZC0nAmQ52VIxTtcAu', 'Chu Ong Nau', 'lephat832464@gmail.com', '2001-06-14', 'Tay Ninh', b'01', '0942755402', 'bac2667253044015ad123d7aab6b63b3.jpg', b'01', '2022-01-31'),
(102, 'chiongngaongo', '$2a$10$V0/brp1iAprBWyXfTH9UQejZc64w//XYaKYGCUp273FtIzS01jsMm', 'Chi Ong Ngao Ngo', 'chiongnga435ongo@gmail.com', '2001-06-14', 'Tay Ninh', b'01', '0111111111', 'bac2667253044015ad123d7aab6b63b3.jpg', b'01', '2022-01-31'),
(103, 'chionglotomo', '$2a$10$V0/brp1iAprBWyXfTH9UQejZc64w//XYaKYGCUp273FtIzS01jsMm', 'Chi Ong Lo To Mo', 'chionglo345tomo@gmail.com', '2001-06-14', 'Tay Ninh', b'01', '0123456123', 'bac2667253044015ad123d7aab6b63b3.jpg', b'01', '2022-01-31'),
(104, 'chiongxanhle', '$2a$10$V0/brp1iAprBWyXfTH9UQejZc64w//XYaKYGCUp273FtIzS01jsMm', 'Chi Ong Xanh Le', '345@gmail.com', '2001-06-14', 'Tay Ninh', b'00', '0888555222', 'bac2667253044015ad123d7aab6b63b3.jpg', b'01', '2022-01-31'),
(105, 'faculty2', '$2a$10$cCcdzCmcV8gEdY5M1HfdJ.o2t4IS2NezqD9kZC0nAmQ52VIxTtcAu', 'Faculty Marry', 'marry@gmail.com', '1993-01-07', 'Dong Nai', b'00', '0133156555', 'd008449ac37b4531a065b2a37911e568.jpg', b'01', '2022-01-31'),
(106, 'ad', '$2a$10$PnW.x8vhMf.V9zbuf2K7YeiiGm.l0wxiz8SBUopxLXOlM1DiasnQC', 'vuvo', 'tbao45123810@gmail.com', '2022-01-12', 'ba123', b'01', '01235765954', '349ec5fde0444bf68c2fa59a1b9d1a52.jpg', b'01', '2022-02-09'),
(109, 'lephat8464@gmail.com', '$2a$10$ikCFDo08m4MZ1.txYKgV5OESeK/pJPokxmepZfkPPM/7wBiYKxK7y', 'Vĩnh Lê Phát', 'lephat8sdf464@gmail.com', '2022-02-09', 'no', b'01', '5345345345', '4a20e5edeb464f5f864da72c5d2878f3.png', b'01', '2022-02-09'),
(110, 'vinhle', '$2a$10$kby7Gfp8k4zgIBQfSmob3.7sC4Xjkl0ttMUvhmCP69hR22VoyI662', 'Vinh Le', 'lephat846454@gmail.com', '2001-12-30', 'Tay ninh', b'01', '0942755402', 'afa866fb4f7d4b15853925f5e2d1a536.png', b'01', '2022-02-09');

-- --------------------------------------------------------

--
-- Table structure for table `account_pack`
--

CREATE TABLE `account_pack` (
  `account_pack_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `status` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_pack`
--

INSERT INTO `account_pack` (`account_pack_id`, `account_id`, `pack_id`, `start_date`, `status`) VALUES
(3, 99, 1, '2022-02-07', b'01'),
(5, 101, 7, '2022-02-09', b'01'),
(6, 110, 7, '2022-02-09', b'01');

-- --------------------------------------------------------

--
-- Table structure for table `account_role`
--

CREATE TABLE `account_role` (
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_role`
--

INSERT INTO `account_role` (`account_id`, `role_id`) VALUES
(98, 1),
(99, 3),
(100, 2),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 2),
(106, 3),
(109, 3),
(110, 3);

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_status` bit(2) NOT NULL,
  `status` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`answer_id`, `title`, `question_id`, `answer_status`, `status`) VALUES
(108, 'has walked', 40, b'01', b'01'),
(109, 'was walking', 40, b'00', b'01'),
(110, 'walked', 40, b'00', b'01'),
(111, 'is walking', 40, b'00', b'01'),
(112, 'religious   ', 41, b'00', b'01'),
(113, 'performance   ', 41, b'00', b'01'),
(114, 'miserable    ', 41, b'01', b'01'),
(115, 'including   ', 41, b'00', b'01'),
(116, 'Science    ', 42, b'00', b'01'),
(117, 'Geography    ', 42, b'01', b'01'),
(118, 'History          ', 42, b'00', b'01'),
(119, 'Technology  ', 42, b'00', b'01'),
(120, 'put up ', 43, b'00', b'01'),
(121, 'put off   ', 43, b'00', b'01'),
(122, 'put out   ', 43, b'01', b'01'),
(123, 'put on', 43, b'00', b'01'),
(124, 'in order to', 44, b'00', b'01'),
(125, 'though ', 44, b'00', b'01'),
(126, 'so that', 44, b'01', b'01'),
(127, 'unless', 44, b'00', b'01'),
(128, '999999', 45, b'00', b'01'),
(129, '78388', 45, b'01', b'01'),
(130, '73288', 45, b'00', b'01'),
(131, '824566', 45, b'00', b'01'),
(132, '456131540', 46, b'00', b'01'),
(133, '454121155', 46, b'00', b'01'),
(134, '454345364', 46, b'00', b'01'),
(135, '695232192', 46, b'01', b'01'),
(136, '5', 47, b'00', b'01'),
(137, '3', 47, b'00', b'01'),
(138, '4', 47, b'00', b'01'),
(139, '6', 47, b'00', b'01'),
(140, '1000000000', 48, b'01', b'01'),
(141, '10000000000', 48, b'00', b'01'),
(142, '100000000000', 48, b'00', b'01'),
(143, '1000000000000', 48, b'00', b'01'),
(144, '20', 49, b'00', b'01'),
(145, '19', 49, b'00', b'01'),
(146, '22', 49, b'00', b'01'),
(147, '21', 49, b'01', b'01'),
(148, ' Home Tool Markup Language', 50, b'00', b'01'),
(149, ' Hyper Text Markup Language', 50, b'01', b'01'),
(150, ' Hyperlinks and Text Markup Language', 50, b'00', b'01'),
(151, ' Mozilla', 51, b'00', b'01'),
(152, ' The World Wide Web Consortium', 51, b'01', b'01'),
(153, ' Google', 51, b'00', b'01'),
(154, ' Microsoft', 51, b'00', b'01'),
(155, ' <break>', 52, b'00', b'01'),
(156, '<br>', 52, b'01', b'01'),
(157, '<bl>', 52, b'00', b'01'),
(161, '&', 54, b'00', b'01'),
(162, '*', 54, b'00', b'01'),
(163, '/', 54, b'01', b'01'),
(164, '#', 54, b'00', b'01'),
(165, '<h6>', 55, b'00', b'01'),
(166, '<h1>', 55, b'01', b'01'),
(167, '<head>', 55, b'00', b'01'),
(168, '<heading>', 55, b'00', b'01'),
(169, 'True', 56, b'01', b'01'),
(170, 'False', 56, b'00', b'01'),
(171, '<title>  ', 57, b'01', b'01'),
(172, '<head>', 57, b'00', b'01'),
(173, '<meta>', 57, b'00', b'01'),
(174, '<sound>', 58, b'00', b'01'),
(175, '<audio>  ', 58, b'01', b'01'),
(176, '<mp3>', 58, b'00', b'01'),
(177, '<section>', 59, b'00', b'01'),
(178, '<head>', 59, b'00', b'01'),
(179, '<header> ', 59, b'01', b'01'),
(180, '<top>', 59, b'00', b'01'),
(181, '<nav>  ', 60, b'01', b'01'),
(182, '<navigation>', 60, b'00', b'01'),
(183, '<navigate>', 60, b'00', b'01'),
(184, 'Cascading Style Sheets  ', 61, b'01', b'01'),
(185, 'Creative Style Sheets', 61, b'00', b'01'),
(186, 'Colorful Style Sheets', 61, b'00', b'01'),
(187, 'Computer Style Sheets', 61, b'00', b'01'),
(191, 'styles', 63, b'00', b'01'),
(192, 'font', 63, b'00', b'01'),
(193, 'style', 63, b'01', b'01'),
(194, 'class', 63, b'00', b'01'),
(195, '/* this is a comment */  ', 64, b'01', b'01'),
(196, '// this is a comment', 64, b'00', b'01'),
(197, '/* this is a comment aaa */  ', 64, b'01', b'01'),
(198, '// this is a comment //', 64, b'00', b'01'),
(199, 'color', 65, b'00', b'01'),
(200, 'background-color  ', 65, b'01', b'01'),
(201, 'bgcolor', 65, b'00', b'01'),
(202, '<javascript>', 66, b'00', b'01'),
(203, '<scripting>', 66, b'00', b'01'),
(204, '<js>', 66, b'00', b'01'),
(205, '<script>  ', 66, b'01', b'01'),
(206, 'function:myFunction()', 67, b'00', b'01'),
(207, 'function = myFunction()', 67, b'00', b'01'),
(208, 'function myFunction()  ', 67, b'01', b'01'),
(209, 'call function myFunction()', 68, b'00', b'01'),
(210, 'myFunction()  ', 68, b'01', b'01'),
(211, 'call myFunction()', 68, b'00', b'01'),
(212, 'while i = 1 to 10', 69, b'00', b'01'),
(213, 'while (i <= 10)  ', 69, b'01', b'01'),
(214, 'while (i <= 10; i++)', 69, b'00', b'01'),
(215, 'onmouseclick', 70, b'00', b'01'),
(216, 'onchange', 70, b'00', b'01'),
(217, 'onmouseover', 70, b'00', b'01'),
(218, 'onclick  ', 70, b'01', b'01'),
(219, ' At the end of the document', 71, b'00', b'01'),
(220, ' In the <head> section', 71, b'01', b'01'),
(221, ' In the <body> section', 71, b'00', b'01'),
(222, 'Structured Question Language', 72, b'00', b'01'),
(223, 'Structured Query Language', 72, b'01', b'01'),
(224, 'Strong Question Language', 72, b'00', b'01'),
(225, 'SELECT', 73, b'01', b'01'),
(226, 'EXTRACT', 73, b'00', b'01'),
(227, 'OPEN', 73, b'00', b'01'),
(228, 'GET', 73, b'00', b'01'),
(229, 'SAVE', 74, b'00', b'01'),
(230, 'UPDATE', 74, b'01', b'01'),
(231, 'SAVE AS', 74, b'00', b'01'),
(232, 'MODIFY', 74, b'00', b'01'),
(233, 'DELETE  ', 75, b'01', b'01'),
(234, 'COLLAPSE', 75, b'00', b'01'),
(235, 'REMOVE', 75, b'00', b'01'),
(236, 'DELETE  ', 75, b'01', b'01'),
(237, 'INSERT INTO ', 76, b'01', b'01'),
(238, 'INSERT NEW', 76, b'00', b'01'),
(239, 'ADD NEW', 76, b'00', b'01'),
(240, 'ADD RECORD', 76, b'00', b'01'),
(241, 'SORT', 77, b'00', b'01'),
(242, 'SORT BY', 77, b'00', b'01'),
(243, 'ORDER BY  ', 77, b'01', b'01'),
(244, 'ORDER', 77, b'00', b'01'),
(245, 'INNER JOIN ', 78, b'01', b'01'),
(246, 'JOINED', 78, b'00', b'01'),
(247, 'JOINED TABLE', 78, b'00', b'01'),
(248, 'INSIDE JOIN', 78, b'00', b'01'),
(249, 'Private Home Page', 79, b'00', b'01'),
(250, 'PHP: Hypertext Preprocessor  ', 79, b'01', b'01'),
(251, 'Personal Hypertext Processor', 79, b'00', b'01'),
(252, '!', 80, b'00', b'01'),
(253, '$', 80, b'01', b'01'),
(254, '@', 80, b'00', b'01'),
(255, 'TRUE', 81, b'00', b'01'),
(256, 'FALSE', 81, b'01', b'01'),
(257, 'create myFunction()', 82, b'00', b'01'),
(258, 'function myFunction()  ', 82, b'01', b'01'),
(259, 'new_function myFunction()', 82, b'00', b'01'),
(260, 'createcookie', 83, b'00', b'01'),
(261, 'makecookie()', 83, b'00', b'01'),
(262, 'setcookie()  ', 83, b'01', b'01'),
(263, '!=', 84, b'00', b'01'),
(264, '=', 84, b'00', b'01'),
(265, '===', 84, b'01', b'01'),
(266, '=-', 84, b'00', b'01'),
(267, '15', 85, b'00', b'01'),
(268, '12', 85, b'00', b'01'),
(269, '10', 85, b'01', b'01'),
(270, '5', 85, b'00', b'01'),
(271, '1 = 1 + 0', 86, b'01', b'01'),
(272, '5 - 5 = 1', 86, b'00', b'01'),
(273, '5 x 5 = 25', 86, b'01', b'01'),
(274, '2 x 0 = 2', 86, b'00', b'01'),
(275, '9', 87, b'00', b'01'),
(276, '10', 87, b'01', b'01'),
(277, '11', 87, b'00', b'01'),
(278, '12', 87, b'00', b'01'),
(279, '1 x 0 = 1', 88, b'01', b'01'),
(280, '5 + 5 = 10', 88, b'00', b'01'),
(281, '2 x 3 = 7', 88, b'01', b'01'),
(282, '7 + 7 = 15', 88, b'01', b'01'),
(283, '1 = 1 - 1', 89, b'00', b'01'),
(284, '2 = 2 - 1', 89, b'00', b'01'),
(285, '3 = 3 - 1', 89, b'00', b'01'),
(286, '4 = 4 - 1', 89, b'00', b'01'),
(287, '5 = 6 - 1', 89, b'01', b'01'),
(288, '8', 90, b'01', b'01'),
(289, '5', 90, b'00', b'01'),
(290, '4', 90, b'00', b'01'),
(291, '3', 90, b'00', b'01'),
(292, '4', 91, b'00', b'01'),
(293, '3', 91, b'00', b'01'),
(294, '6', 91, b'00', b'01'),
(295, '5', 91, b'01', b'01'),
(296, '7', 91, b'00', b'01'),
(297, '10, 5, 2, 0', 92, b'00', b'01'),
(298, '2 , 0 , 10 , 5', 92, b'00', b'01'),
(299, '0 , 2 , 5 , 10', 92, b'01', b'01'),
(300, '+', 93, b'01', b'01'),
(301, '-', 93, b'00', b'01'),
(302, 'x', 93, b'00', b'01'),
(303, '2', 94, b'01', b'01'),
(304, '8', 94, b'00', b'01'),
(305, '7', 94, b'00', b'01'),
(306, '4', 94, b'01', b'01'),
(307, '12', 95, b'00', b'01'),
(308, '4', 95, b'00', b'01'),
(309, '20', 95, b'01', b'01'),
(310, '13', 95, b'00', b'01'),
(311, '2', 95, b'00', b'01'),
(312, '2', 96, b'00', b'01'),
(313, '5', 96, b'00', b'01'),
(314, '1', 96, b'01', b'01'),
(315, '8', 96, b'00', b'01'),
(316, '7 – 5 = 2', 97, b'00', b'01'),
(317, '4 + 4 = 9', 97, b'01', b'01'),
(318, '3 - 2 = 1', 97, b'00', b'01'),
(319, '4 + 5 = 0', 97, b'01', b'01'),
(320, '1 + 1 = 2', 97, b'00', b'01'),
(321, '5 + 1 = 7', 97, b'01', b'01'),
(322, '1 ', 98, b'00', b'01'),
(323, '3', 98, b'00', b'01'),
(324, '5', 98, b'01', b'01'),
(325, '3', 99, b'00', b'01'),
(326, '8', 99, b'01', b'01'),
(327, '5', 99, b'00', b'01'),
(328, '1', 99, b'00', b'01'),
(329, 'f', 100, b'00', b'01'),
(330, 's', 100, b'00', b'01'),
(331, 'a', 100, b'01', b'01'),
(332, 'i', 100, b'00', b'01'),
(333, 'te', 101, b'00', b'01'),
(334, 'is', 101, b'00', b'01'),
(335, 'are', 101, b'01', b'01'),
(336, 'er', 101, b'00', b'01'),
(337, 'Hi, Benny. Bye, Sue.', 102, b'00', b'01'),
(338, 'Hi, Benny. Hi, Sue.', 102, b'01', b'01'),
(339, 'Hi, Benny. Fine , thanks you', 102, b'00', b'01'),
(340, 'Hi, Benny. My name Sue.', 102, b'00', b'01'),
(341, 'Hi, Sue.', 103, b'01', b'01'),
(342, 'Hello ; Sue.', 103, b'00', b'01'),
(343, 'Hello ; Sue.', 103, b'00', b'01'),
(344, '	Hi; Sue.', 103, b'00', b'01'),
(345, 'Hi !', 104, b'00', b'01'),
(346, 'I\'m Miss Dolly.', 104, b'01', b'01'),
(347, '	Good morning !', 104, b'00', b'01'),
(348, 'Hello, Benny.', 105, b'01', b'01'),
(349, 'Helo , Benny. 	', 105, b'00', b'01'),
(350, 'Hello, John. 	', 105, b'01', b'01'),
(351, 'Benny, hello. 	', 105, b'00', b'01'),
(352, 'I’m a teachre.', 106, b'00', b'01'),
(353, 'I’m a teacher.', 106, b'01', b'01'),
(354, 'I’n a teacher.', 106, b'00', b'01'),
(355, 'Im a teacher.', 106, b'00', b'01'),
(356, '1, 2, 3', 107, b'01', b'01'),
(357, '2, 3, 1', 107, b'00', b'01'),
(358, '4, 5, 6', 107, b'00', b'01'),
(359, 'One ( số 1 )', 108, b'01', b'01'),
(360, 'Three ( số 2 ).', 108, b'00', b'01'),
(361, 'Two ( số 3 )', 108, b'00', b'01'),
(362, 'One ( số 2 )', 108, b'00', b'01'),
(363, 'Thank you', 109, b'01', b'01'),
(364, 'Thanks', 109, b'01', b'01'),
(365, 'Thanh', 109, b'00', b'01'),
(366, 'Thank', 109, b'00', b'01'),
(367, 'Theer', 110, b'00', b'01'),
(368, '	Tehre', 110, b'00', b'01'),
(369, 'Hetre', 110, b'00', b'01'),
(370, '	Three', 110, b'01', b'01'),
(371, 'a', 111, b'00', b'01'),
(372, 'u', 111, b'00', b'01'),
(373, 'o', 111, b'01', b'01'),
(374, 'i', 111, b'00', b'01'),
(375, 'd', 112, b'00', b'01'),
(376, 't', 112, b'00', b'01'),
(377, 'a', 112, b'00', b'01'),
(378, 'l', 112, b'01', b'01'),
(379, 'Yes', 113, b'00', b'01'),
(380, 'No', 113, b'00', b'01'),
(381, 'Sue', 113, b'01', b'01'),
(382, 'Hello', 113, b'00', b'01'),
(383, 'asdf', 114, b'00', b'01'),
(384, 'Hi', 114, b'01', b'01'),
(385, 'atet', 114, b'00', b'01'),
(386, 'Hello', 114, b'01', b'01'),
(387, 'Tete', 114, b'00', b'01'),
(388, 'asdf', 115, b'00', b'01'),
(389, 'terere', 115, b'00', b'01'),
(390, 'Three', 115, b'01', b'01'),
(391, 'Choose the right measuring instrument ', 116, b'00', b'01'),
(392, ' Choose the right measure ', 116, b'01', b'01'),
(393, 'Measure length for accuracy ', 116, b'00', b'01'),
(394, 'There is a way to set the eyes properly', 116, b'00', b'01'),
(395, '2mm', 117, b'01', b'01'),
(396, '1m70', 117, b'00', b'01'),
(397, '1cm', 117, b'00', b'01'),
(398, '10dm', 117, b'00', b'01'),
(399, '1m', 117, b'00', b'01'),
(400, 'Straight ruler with 1m increment and 1mm', 118, b'00', b'01'),
(401, 'The tape measure has a height of 5m and a height of 5mm', 118, b'01', b'01'),
(402, 'Measurement tape measure 150cm and 1mm ', 118, b'00', b'01'),
(403, 'Straight ruler with 1m increment and 1cm', 118, b'00', b'01'),
(404, '6500; 65000', 119, b'01', b'01'),
(405, ' 65000; 650000', 119, b'00', b'01'),
(406, '650; 6500', 119, b'00', b'01'),
(407, '65000; 650', 119, b'00', b'01'),
(408, 'Ruler has a GDT of 1m and a GDC of 1mm', 120, b'01', b'01'),
(409, 'Ruler has a GDT of 20cm and a SPR of 1mm', 120, b'00', b'01'),
(410, 'Ruler has a RR of 0.5m and a NE of 1cm', 120, b'00', b'01'),
(411, 'Ruler has a equivalence of 1m and a length of 1cm', 120, b'00', b'01'),
(412, 'Decimeter (dm)', 121, b'00', b'01'),
(413, 'Meters (m)', 121, b'01', b'01'),
(414, 'Centimeters (cm)', 121, b'00', b'01'),
(415, 'Millimeters (mm)', 121, b'00', b'01'),
(416, ' The maximum length indicated on the ruler.', 122, b'01', b'01'),
(417, 'Minimum length recorded on the ruler.', 122, b'00', b'01'),
(418, 'Length between 2 consecutive divisions on the ruler.', 122, b'00', b'01'),
(419, 'The length between the 2 smallest divisions on the ruler.', 122, b'00', b'01'),
(420, ' A straight ruler has a 1m increment and a 1mm NE.', 123, b'00', b'01'),
(421, ' The tape measure has a height of 5m and a length of 5mm.', 123, b'01', b'01'),
(422, 'The tape measure has a length of 150cm and a length of 1mm.', 123, b'00', b'01'),
(423, 'A straight ruler has a GR of 1m and a NE of 1cm.', 123, b'00', b'01'),
(424, 'A straight ruler with an offset of 1.5m and a vertical line of 1cm', 124, b'00', b'01'),
(425, 'A tape measure with a height of 1m and a length of 0.5cm', 124, b'00', b'01'),
(426, 'Ruler with offset 20cm and DC 1mm', 124, b'01', b'01'),
(427, 'Tape measure with 1m height and 5cm', 124, b'00', b'01'),
(428, ' A straight ruler with an offset of 1.5m and a vertical line of 1cm', 125, b'00', b'01'),
(429, 'A tape measure with a height of 1m and a length of 0.5cm', 125, b'01', b'01'),
(430, 'Ruler with offset 20cm and DC 1mm', 125, b'00', b'01'),
(431, 'Ruler with 2m offset and 1cm', 125, b'00', b'01'),
(432, 'Meters', 126, b'00', b'01'),
(433, 'Kilometers', 126, b'00', b'01'),
(434, ' Cubic meter', 126, b'01', b'01'),
(435, 'Decimeter', 126, b'00', b'01'),
(436, 'Select the appropriate measuring instrument.', 127, b'00', b'01'),
(437, 'Choose the appropriate measure.', 127, b'01', b'01'),
(438, 'Measure length for accuracy.', 127, b'00', b'01'),
(439, ' There is a way to set the eyes properly.', 127, b'00', b'01'),
(440, 'Customer buys 1.4 liters', 128, b'00', b'01'),
(441, 'Customer buys 3.5 liters', 128, b'01', b'01'),
(442, 'Customer buys 2.7 liters ', 128, b'00', b'01'),
(443, 'Customer buys 3.2 liters', 128, b'00', b'01'),
(444, ' Set your eyes to the same height as the liquid level in the tank', 129, b'01', b'01'),
(445, 'Place the graduated cylinder horizontally', 129, b'00', b'01'),
(446, 'Place the eye obliquely at the height of the liquid level in the tank', 129, b'00', b'01'),
(447, 'Place the eye perpendicular to the height of the liquid level in the tank', 129, b'00', b'01'),
(448, ' 100 liters; 10000 ml', 130, b'00', b'01'),
(449, '100 liters; 1000000 ml', 130, b'00', b'01'),
(450, '1000 liters; 100000 ml', 130, b'00', b'01'),
(451, '1000 liters; 1000000 ml', 130, b'01', b'01'),
(452, ' 0.00015 m 3  = 0.15l', 131, b'01', b'01'),
(453, '  0.00015 m 3  = 0.015l', 131, b'00', b'01'),
(454, '0.000015 m 3  = 0.15l', 131, b'00', b'01'),
(455, ' 0.0015 m 3  = 0.015l', 131, b'00', b'01'),
(456, 'meters (m)', 132, b'00', b'01'),
(457, 'kilogram (kg)', 132, b'00', b'01'),
(458, 'cubic meters (m3) and liters (l).', 132, b'01', b'01'),
(459, 'square meter (m2)', 132, b'00', b'01'),
(460, '11', 133, b'00', b'01'),
(461, '12', 133, b'00', b'01'),
(462, '13', 133, b'00', b'01'),
(463, '14', 133, b'01', b'01'),
(464, 'Drinking cup.', 134, b'00', b'01'),
(465, 'Rice bowl.', 134, b'00', b'01'),
(466, 'Kettle for cooking water.', 134, b'00', b'01'),
(467, 'Graduated flask.', 134, b'01', b'01'),
(468, 'The volume of milk in the box is 200ml.', 135, b'01', b'01'),
(469, ' Weight of the milk carton.', 135, b'00', b'01'),
(470, 'Weight of milk in the can.', 135, b'00', b'01'),
(471, 'The volume of the milk carton is 200ml.', 135, b'00', b'01'),
(472, 'The force of the ballpoint pen\'s spring acting on the pen nib ', 136, b'00', b'01'),
(473, 'The force of the ball on the wall when the ball collides with the wall ', 136, b'00', b'01'),
(474, 'The force of the motorcycle shock absorber acting on the motorcycle frame ', 136, b'00', b'01'),
(475, 'The force acting on the wing when the plane is in motion ', 136, b'01', b'01'),
(476, ' In two cases springs have different lengths: in the case of the longer spring, the elastic force is stronger ', 137, b'00', b'01'),
(477, 'The smaller the deformation of the spring, the smaller the elastic force ', 137, b'00', b'01'),
(478, 'The greater the length of the spring when stretched, the smaller the elastic force ', 137, b'01', b'01'),
(479, 'The smaller the length of the spring when compressed, the smaller the elastic force ', 137, b'00', b'01'),
(480, ' Gravity of a weight', 138, b'00', b'01'),
(481, 'The force of attraction of a magnet on a piece of iron', 138, b'00', b'01'),
(482, 'Thrust of the spring under the saddle', 138, b'01', b'01'),
(483, 'Adhesion force between a sheet of paper glued on the board and the board surface', 138, b'00', b'01'),
(484, 'Department of Clay', 139, b'00', b'01'),
(485, 'Copper wire', 139, b'00', b'01'),
(486, 'Rubber rope', 139, b'01', b'01'),
(487, 'Ripe guava', 139, b'00', b'01'),
(488, 'A lump of clay', 140, b'00', b'01'),
(489, 'A stone', 140, b'00', b'01'),
(490, 'A small piece of copper wire', 140, b'00', b'01'),
(491, 'A rubber ball', 140, b'01', b'01'),
(492, 'Bridges, machines, light bulbs ', 141, b'00', b'01'),
(493, 'Cup, bottle, blade', 141, b'00', b'01'),
(494, 'Cup, bridge, bottle', 141, b'00', b'01'),
(495, 'Bridges, machines, blades', 141, b'01', b'01'),
(496, 'Insoluble in water', 142, b'00', b'01'),
(497, 'Smelly', 142, b'00', b'01'),
(498, 'White', 142, b'01', b'01'),
(499, 'Liquids', 142, b'00', b'01'),
(500, 'Both are insoluble in water', 143, b'00', b'01'),
(501, 'Both taste sweet', 143, b'00', b'01'),
(502, 'Both are soluble in water', 143, b'01', b'01'),
(503, ' Both are liquids', 143, b'00', b'01'),
(504, 'Solubility', 144, b'00', b'01'),
(505, 'Combustibility', 144, b'00', b'01'),
(506, 'Color', 144, b'01', b'01'),
(507, 'Smell', 144, b'00', b'01'),
(508, 'Distilled water is colorless, natural water is cloudy', 145, b'00', b'01'),
(509, ' Distilled water is odorless, natural water has an odor', 145, b'00', b'01'),
(510, ' Distilled water has one substance, natural water has many substances', 145, b'01', b'01'),
(511, 'Distilled water has no taste, natural water has a taste', 145, b'00', b'01'),
(512, 'Possible weight loss', 166, b'00', b'01'),
(513, ' Capable of resizing', 166, b'00', b'01'),
(514, 'Being able to reproduce', 166, b'01', b'01'),
(515, 'All options given', 166, b'00', b'01'),
(516, 'Wishing tree     ', 167, b'01', b'01'),
(517, 'Broom', 167, b'00', b'01'),
(518, 'Scissors', 167, b'00', b'01'),
(519, 'Golden tree', 167, b'00', b'01'),
(520, ' Fish swell and wash up on the beach', 168, b'00', b'01'),
(521, 'Young shoots rise above the ground', 168, b'01', b'01'),
(522, 'The ball increases in size when blown', 168, b'00', b'01'),
(523, 'The table is rotten', 168, b'00', b'01'),
(524, 'Bees', 169, b'00', b'01'),
(525, 'Squirrel', 169, b'00', b'01'),
(526, 'Shuttle', 169, b'01', b'01'),
(527, 'Rabbit', 169, b'00', b'01'),
(528, 'Undernutrition', 170, b'01', b'01'),
(529, 'Lack of carbon dioxide', 170, b'00', b'01'),
(530, 'Excess oxygen', 170, b'00', b'01'),
(531, 'Just enough light', 170, b'00', b'01'),
(532, '2', 190, b'01', b'01'),
(533, '3', 190, b'00', b'01'),
(534, '4', 190, b'00', b'01'),
(535, '5', 190, b'00', b'01'),
(536, 'Protection', 191, b'00', b'01'),
(537, 'Sneaky', 191, b'01', b'01'),
(538, 'Sword and spear', 191, b'00', b'01'),
(539, 'Tired', 191, b'00', b'01'),
(540, 'Word is a meaningful linguistic element', 192, b'00', b'01'),
(541, 'Word is the smallest linguistic element used to create sentences', 192, b'00', b'01'),
(542, 'Words are meaningful linguistic elements, used independently, to create sentences.', 192, b'01', b'01'),
(543, 'Words are made up of one syllable.', 192, b'00', b'01'),
(544, 'gloating', 193, b'00', b'01'),
(545, 'withered', 193, b'00', b'01'),
(546, 'customers', 193, b'01', b'01'),
(547, ' have fun', 193, b'00', b'01'),
(548, 'English', 194, b'01', b'01'),
(549, 'From', 194, b'00', b'01'),
(550, 'Letters', 194, b'00', b'01'),
(551, 'Vowels', 194, b'00', b'01'),
(552, 'Round shape', 215, b'00', b'01'),
(553, 'Square', 215, b'00', b'01'),
(554, 'Spherical', 215, b'01', b'01'),
(555, 'Oval shape', 215, b'00', b'01'),
(556, 'Is the meridian to the left of the prime meridian.', 216, b'01', b'01'),
(557, ' Is the meridian to the right of the prime meridian.', 216, b'00', b'01'),
(558, 'Located below the equator.', 216, b'00', b'01'),
(559, 'Located above the equator.', 216, b'00', b'01'),
(560, '3th place', 217, b'01', b'01'),
(561, '5th place', 217, b'00', b'01'),
(562, '9th place', 217, b'00', b'01'),
(563, '7th place', 217, b'00', b'01'),
(564, 'Northern Hemisphere and Western Hemisphere', 218, b'00', b'01'),
(565, 'Southern Hemisphere and Eastern Hemisphere', 218, b'00', b'01'),
(566, 'Northern Hemisphere and Eastern Hemisphere.', 218, b'01', b'01'),
(567, 'Southern Hemisphere and Western Hemisphere', 218, b'00', b'01'),
(568, 'Longitude', 219, b'00', b'01'),
(569, ' Prime Meridian.', 219, b'00', b'01'),
(570, 'Latitude', 219, b'01', b'01'),
(571, 'Prime latitude.', 219, b'00', b'01'),
(572, '1', 240, b'00', b'01'),
(573, '2', 240, b'01', b'01'),
(574, '3', 240, b'00', b'01'),
(575, '1', 241, b'01', b'01'),
(576, '2', 241, b'00', b'01'),
(577, '3', 241, b'01', b'01'),
(578, '4', 241, b'00', b'01'),
(579, '5', 241, b'01', b'01');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `status` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `title`, `description`, `status`) VALUES
(1, 'Math', 'Test Math', b'01'),
(2, 'Physic', 'Test Physic', b'01'),
(3, 'Chemistry', 'Test chemistry', b'00'),
(4, 'Biological', 'About biological', b'01'),
(5, 'Literature', 'About literature', b'01'),
(6, 'Geographic', 'About geographic', b'01'),
(8, 'Information technology', 'About information technology', b'01'),
(9, 'English', 'english', b'01');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `account_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `status` bit(2) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment`, `account_id`, `quiz_id`, `status`, `create_date`) VALUES
(13, 'greate', 99, 15, b'01', '2022-02-06 22:14:02'),
(14, 'Great', 99, 53, b'01', '2022-02-07 17:27:32'),
(15, 'Great', 99, 52, b'01', '2022-02-07 17:28:43'),
(16, 'Great', 99, 51, b'01', '2022-02-07 17:29:15'),
(17, 'Great', 99, 50, b'01', '2022-02-07 17:30:09'),
(18, 'Great', 99, 46, b'01', '2022-02-07 17:30:22'),
(19, 'Great', 99, 43, b'01', '2022-02-07 17:30:36'),
(20, 'Helpful', 99, 43, b'01', '2022-02-07 17:30:47'),
(21, 'Helpful', 99, 53, b'01', '2022-02-07 17:31:00'),
(22, 'Helpful', 99, 52, b'01', '2022-02-07 17:31:13'),
(23, 'good', 99, 21, b'01', '2022-02-09 00:38:52'),
(24, 'me my self', 99, 15, b'01', '2022-02-09 00:39:20'),
(25, 'fine', 99, 48, b'01', '2022-02-09 00:40:09'),
(26, 'good', 99, 47, b'01', '2022-02-09 00:40:23'),
(27, 'fine', 99, 42, b'01', '2022-02-09 00:40:57'),
(28, 'bad', 99, 41, b'01', '2022-02-09 00:41:09'),
(29, 'good', 99, 40, b'01', '2022-02-09 00:41:59'),
(30, 'fine', 99, 39, b'01', '2022-02-09 00:42:20'),
(31, 'good', 99, 38, b'01', '2022-02-09 00:42:35'),
(32, 'a', 99, 32, b'01', '2022-02-09 00:43:20'),
(33, 's', 99, 31, b'01', '2022-02-09 00:43:30'),
(34, 'good', 99, 30, b'01', '2022-02-09 00:43:52'),
(35, 'good', 99, 29, b'01', '2022-02-09 00:44:05'),
(36, 'good', 99, 36, b'01', '2022-02-09 00:44:30'),
(37, 'good', 99, 35, b'01', '2022-02-09 00:44:43'),
(38, 'me my self', 99, 34, b'01', '2022-02-09 00:45:02'),
(39, 'good', 99, 49, b'01', '2022-02-09 00:45:44'),
(40, 'fine', 99, 20, b'01', '2022-02-09 00:45:55'),
(41, 'fine', 99, 19, b'01', '2022-02-09 00:46:03'),
(42, 'good', 99, 18, b'01', '2022-02-09 00:46:15'),
(43, 'bad', 99, 17, b'01', '2022-02-09 00:46:24'),
(44, 'bad', 99, 16, b'01', '2022-02-09 00:46:33'),
(45, 'good', 99, 28, b'01', '2022-02-09 00:46:42'),
(46, 'fine', 99, 27, b'01', '2022-02-09 00:46:53'),
(47, 'fine', 99, 26, b'01', '2022-02-09 00:47:05'),
(48, 'fine', 99, 25, b'01', '2022-02-09 00:47:15'),
(49, 'good', 110, 23, b'01', '2022-02-09 09:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `email_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `reply_content` text DEFAULT NULL,
  `send_date` datetime NOT NULL,
  `reply_date` datetime DEFAULT NULL,
  `checked` bit(2) NOT NULL,
  `status` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`email_id`, `title`, `email_user`, `fullname`, `phone_number`, `content`, `reply_content`, `send_date`, `reply_date`, `checked`, `status`) VALUES
(1, 'con khi', 'useremail@lkadjf', 'ten user', '234234234', 'help me', NULL, '2021-12-12 16:38:12', NULL, b'00', b'01'),
(2, 'con meo', 'useremail@lkadjf', 'ten user', '234234234', 'help me', NULL, '2021-12-12 16:38:12', NULL, b'00', b'01'),
(3, 'hhhh', 'hhh@gmail.com', 'hhhhhh', '000000000', 'hhahahahahahahahahahahaha', NULL, '2021-12-13 20:55:02', NULL, b'00', b'00'),
(4, 'Test', 'ngoctran.04012001@gmail.com', 'ngoc tran', '0911111111', 'Test duoc roi ne !!!', 'TEST LAN NUA NHA BAN IU', '2021-12-16 22:50:45', '2022-01-10 00:01:58', b'01', b'01'),
(5, 'alo', 'ngoctran.04012001@gmail.com', 'trantran', '0111111111', 'alo alo alo haa', 'hi ', '2021-12-16 23:06:12', '2022-02-09 09:17:38', b'01', b'01'),
(6, 'aaaa', 'ngoctran.04012001@gmail.com', 'aaaa', '90000000', 'hello alo ahaha', NULL, '2021-12-16 23:44:10', NULL, b'00', b'00'),
(7, 'abc', 'tran@gmail.com', 'tran', '0123456789', 'pla pla pla pla pla pla pla pla pla pla pla pla', NULL, '2022-01-31 15:19:55', NULL, b'00', b'00'),
(8, 'asdf', 'asdfsdf@asdfsdfgaimasdf.com', 'Vinh Le', '0942755402', 'asdf', NULL, '2022-02-09 08:05:11', NULL, b'00', b'00'),
(9, 'hi admin', 'lephat8464@gmail.com', 'Vinh Le', '0942755402', 'hello', NULL, '2022-02-09 09:35:14', NULL, b'00', b'00');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `status` bit(2) NOT NULL,
  `list_question_id` text NOT NULL,
  `list_answer_choice` text NOT NULL,
  `time_done` int(11) NOT NULL,
  `number_right_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`history_id`, `date`, `quiz_id`, `account_id`, `status`, `list_question_id`, `list_answer_choice`, `time_done`, `number_right_answer`) VALUES
(15, '2022-02-06', 15, 99, b'01', '46 47 48 49 45 ', '', 2, 0),
(16, '2022-02-07', 29, 99, b'01', '116 119 118 117 120 ', '', 11, 0),
(17, '2022-02-09', 53, 99, b'01', '227 231 239 223 235 ', '', 4, 0),
(18, '2022-02-09', 24, 99, b'01', '96 95 97 99 98 ', '312 307 316 319 321 318 317 320 328 323 ', 7, 0),
(19, '2022-02-09', 23, 99, b'01', '90 93 91 92 94 ', '288 300 292 299 306 305 303 304 ', 24, 3),
(20, '2022-02-09', 21, 101, b'01', '85 87 88 89 86 ', '', 2, 0),
(21, '2022-02-09', 23, 110, b'01', '90 91 93 92 94 ', '288 292 302 298 303 304 305 306 ', 24, 2),
(22, '2022-02-09', 54, 99, b'01', '240 241 ', '574 ', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pack`
--

CREATE TABLE `pack` (
  `pack_id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `expiry` int(11) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pack`
--

INSERT INTO `pack` (`pack_id`, `title`, `expiry`, `fee`, `description`, `status`) VALUES
(1, 'Pack 1 month', 30, '0.99', 'You have 1 month to use the service', b'01'),
(2, 'Pack 3 months', 90, '2.99', 'You have 3 months to use the service', b'01'),
(3, 'Pack 1 year', 365, '11.99', 'You have 1 year to use the service', b'01'),
(6, 'Pack 2 years', 730, '23.99', 'You have 2 years use the service', b'01'),
(7, 'Pack 9 months', 270, '8.99', 'You have 9 months to use the service', b'01'),
(8, 'Pack 3 years', 1095, '35.99', 'You have 3 years use the service', b'01');

-- --------------------------------------------------------

--
-- Table structure for table `pay`
--

CREATE TABLE `pay` (
  `pay_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `payment` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `date_paid` datetime NOT NULL,
  `pay_status` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pay`
--

INSERT INTO `pay` (`pay_id`, `account_id`, `payment`, `title`, `fee`, `date_paid`, `pay_status`) VALUES
(15, 99, 'PAYPAL', 'PAYMENT PACK - CODE: Pack 1 month', '0.99', '2022-02-07 17:27:57', b'01'),
(16, 101, 'PAYPAL', 'PAYMENT PACK - CODE: 4PA27664VC063414Y', '8.99', '2022-02-09 08:39:31', b'01'),
(17, 101, 'PAYPAL', 'PAYMENT PACK - CODE: 2JD55611MU039612T', '8.99', '2022-02-09 08:43:26', b'01'),
(18, 110, 'PAYPAL', 'PAYMENT PACK - CODE: 1DL88670RU684645X', '8.99', '2022-02-09 09:13:08', b'01');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `explain_detail` text NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `status` bit(2) NOT NULL,
  `type_answer_choice` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `title`, `explain_detail`, `quiz_id`, `status`, `type_answer_choice`) VALUES
(40, 'When the old man____past the park, he saw some children playing football', 'explain pla pla pla', 14, b'01', 'radio'),
(41, 'Mark the letter A, B, C, or D on your answer sheet to indicate the word that differs from the other three in the position of the primary stress in each of the following questions. ', 'Câu C trọng âm 1, còn lại trọng âm 2.', 14, b'01', 'radio'),
(42, '_______ is the study of the Earth\'s physical features and the people, plants, and animals that live in different regions of the world.', 'Câu này dịch như sau: Địa lí là môn ngành nghiên cứu những sự vật vật lí trên Trái Đất và con người, cây cối, động vật sống ở những khu vực khác nhau trên Thế Giới. ', 14, b'01', 'radio'),
(43, 'As it was getting late, the boys decided to _______ the campfire and crept into their sleeping bags.', 'Câu này dịch là: Vì đã muộn rồi, những cậu con trai quyết định tắt lửa trại và chui vào túi ngủ của chúng', 14, b'01', 'radio'),
(44, 'The student took that course ______ he could improve his English.', 'Câu này dịch như sau: Cậu học sinh đã tham gia khóa học đó để anh ta có thể cải thiện khả năng tiếng Anh của anh ta. \r\nMệnh đề trước và mệnh đề sau mang nghĩa tương đồng => nối nhau bằng so that. \r\n', 14, b'01', 'radio'),
(45, '65842 + 12546  = ?', 'pla pla', 15, b'01', 'radio'),
(46, '1524632 * 456 = ?', 'pla pla', 15, b'01', 'radio'),
(47, '100 / 25', 'pla pla', 15, b'01', 'radio'),
(48, '123456789 + 876543211 = ?', 'pla pla ', 15, b'01', 'radio'),
(49, '2022 - 2001 = ?', 'pla pla', 15, b'01', 'radio'),
(50, 'What does HTML stand for?', 'What does HTML stand for?', 16, b'01', 'radio'),
(51, 'Who is making the Web standards?', 'Who is making the Web standards?', 16, b'01', 'radio'),
(52, 'What is the correct HTML element for inserting a line break?', 'What is the correct HTML element for inserting a line break?', 16, b'01', 'radio'),
(54, 'Which character is used to indicate an end tag?', 'Which character is used to indicate an end tag?', 16, b'01', 'radio'),
(55, 'Choose the correct HTML element for the largest heading:', 'Choose the correct HTML element for the largest heading:', 16, b'01', 'radio'),
(56, 'HTML comments start with <!-- and end with -->', 'HTML comments start with <!-- and end with -->', 16, b'01', 'radio'),
(57, 'Which HTML element defines the title of a document?', 'Which HTML element defines the title of a document?', 16, b'01', 'radio'),
(58, 'What is the correct HTML element for playing audio files?', 'What is the correct HTML element for playing audio files?', 16, b'01', 'radio'),
(59, 'Which HTML element is used to specify a header for a document or section?', 'Which HTML element is used to specify a header for a document or section?', 16, b'01', 'radio'),
(60, 'Which HTML element defines navigation links?', 'Which HTML element defines navigation links?', 16, b'01', 'radio'),
(61, 'What does CSS stand for?', 'What does CSS stand for?', 17, b'01', 'radio'),
(63, 'Which HTML attribute is used to define inline styles?', 'Which HTML attribute is used to define inline styles?', 17, b'01', 'radio'),
(64, 'How do you insert a comment in a CSS file?', 'How do you insert a comment in a CSS file?', 17, b'01', 'checkbox'),
(65, 'Which property is used to change the background color?', 'Which property is used to change the background color?', 17, b'01', 'radio'),
(66, 'Inside which HTML element do we put the JavaScript?', 'Inside which HTML element do we put the JavaScript?', 18, b'01', 'radio'),
(67, 'How do you create a function in JavaScript?', 'How do you create a function in JavaScript?', 18, b'01', 'radio'),
(68, 'How do you call a function named \"myFunction\"?', 'How do you call a function named \"myFunction\"?\r\n\r\n', 18, b'01', 'radio'),
(69, 'How does a WHILE loop start?', 'How does a WHILE loop start?', 18, b'01', 'radio'),
(70, 'Which event occurs when the user clicks on an HTML element?', 'Which event occurs when the user clicks on an HTML element?', 18, b'01', 'radio'),
(71, 'Where in an HTML document is the correct place to refer to an external style sheet?', 'Where in an HTML document is the correct place to refer to an external style sheet?', 17, b'01', 'radio'),
(72, 'What does SQL stand for?', 'What does SQL stand for?', 19, b'01', 'radio'),
(73, 'Which SQL statement is used to extract data from a database?\r\n\r\n', 'Which SQL statement is used to extract data from a database?\r\n\r\n', 19, b'01', 'radio'),
(74, 'Which SQL statement is used to update data in a database?', 'Which SQL statement is used to update data in a database?', 19, b'01', 'radio'),
(75, 'Which SQL statement is used to delete data from a database?', 'Which SQL statement is used to delete data from a database?', 19, b'01', 'checkbox'),
(76, 'Which SQL statement is used to insert new data in a database?', 'Which SQL statement is used to insert new data in a database?', 19, b'01', 'radio'),
(77, 'Which SQL keyword is used to sort the result-set?', 'Which SQL keyword is used to sort the result-set?', 19, b'01', 'radio'),
(78, 'What is the most common type of join?', 'What is the most common type of join?', 19, b'01', 'radio'),
(79, 'What does PHP stand for?', 'What does PHP stand for?', 20, b'01', 'radio'),
(80, 'All variables in PHP start with which symbol?\r\n\r\n', 'All variables in PHP start with which symbol?\r\n\r\n', 20, b'01', 'radio'),
(81, 'When using the POST method, variables are displayed in the URL:', 'When using the POST method, variables are displayed in the URL:', 20, b'01', 'radio'),
(82, 'What is the correct way to create a function in PHP?\r\n\r\n', 'What is the correct way to create a function in PHP?\r\n\r\n', 20, b'01', 'radio'),
(83, 'How do you create a cookie in PHP?', 'How do you create a cookie in PHP?', 20, b'01', 'radio'),
(84, 'Which operator is used to check if two values are equal and of same data type?', 'Which operator is used to check if two values are equal and of same data type?', 20, b'01', 'radio'),
(85, '5 + 5 = ?', 'It is 10', 21, b'01', 'radio'),
(86, 'Which is right calculation', 'Too easy', 21, b'01', 'checkbox'),
(87, '4 + 1 + 5 = ?', 'The right answer is 10', 21, b'01', 'radio'),
(88, 'Choose the wrong answer', 'A bit difficult', 21, b'01', 'checkbox'),
(89, 'Which is right calculation', 'Choose right calculation', 21, b'01', 'radio'),
(90, 'The result of 3 + 5 is:', 'The result of 3 + 5 is: 8', 23, b'01', 'radio'),
(91, 'Number to fill in: ….. – 2 = 3 is:', 'Number to fill in: ….. – 2 = 3 is: 5', 23, b'01', 'radio'),
(92, 'Sort the numbers: 0, 5, 2, 10 in order from smallest to largest:', 'Sort the numbers: 0, 5, 2, 10 in order from smallest to largest: 0, 2, 5, 10', 23, b'01', 'radio'),
(93, 'The mark to fill in 4 ….2 = 6 is:', 'The mark to fill in 4 ….2 = 6 is: +', 23, b'01', 'radio'),
(94, 'Number to fill in: 7 + 1 > …. + 2 is:', 'Number to fill in: 7 + 1 > …. + 2 is:', 23, b'01', 'checkbox'),
(95, 'The largest single digit number is:', 'The largest single digit number is: 20', 24, b'01', 'radio'),
(96, ' The smallest single-digit number is:', ' The smallest single-digit number is: 1', 24, b'01', 'radio'),
(97, ' Which calculation is wrong?', ' Which calculation is wrong? ', 24, b'01', 'checkbox'),
(98, 'The result of the calculation: 10 – 8 + 3 is:', 'The result of the calculation: 10 – 8 + 3 is: 5', 24, b'01', 'radio'),
(99, 'The result of 3 + 5 is:', 'The result of 3 + 5 is: 8', 24, b'01', 'radio'),
(100, 'Te_cher', 'Teacher', 25, b'01', 'radio'),
(101, 'How___you?', 'How___you? are', 25, b'01', 'radio'),
(102, 'Choose the correct sentences', 'Hi, Benny. Hi, Sue.', 25, b'01', 'radio'),
(103, 'Choose the correct sentence ', '\r\n	\r\n	Hi, Sue.\r\n	\r\n', 25, b'01', 'radio'),
(104, 'Introduce', '\r\n	I\'m Miss Dolly.\r\n', 25, b'01', 'radio'),
(105, 'Choose the correct sentence', 'Hello, Benny.\r\nHello, John. 	', 25, b'01', 'checkbox'),
(106, 'Choose the correct sentence', 'I’m a teacher.\r\n	', 26, b'01', 'radio'),
(107, 'One, Two, Three.', 'One, Two, Three. = 1, 2, 3', 26, b'01', 'radio'),
(108, 'Choose the correct word', 'One ( số 1 )\r\n	\r\n	\r\n	', 26, b'01', 'radio'),
(109, 'Choose the correct word', 'Thank you\r\nThanks', 26, b'01', 'checkbox'),
(110, 'Choose the correct word', '	Three\r\n', 26, b'01', 'radio'),
(111, 'H__w', 'How', 28, b'01', 'radio'),
(112, 'gir__', 'girl', 28, b'01', 'radio'),
(113, 'My name\'s __________.', 'My name\'s Sue\r\n', 28, b'01', 'radio'),
(114, 'Choose the correct sentence', 'Hello\r\nHi', 28, b'01', 'checkbox'),
(115, 'Choose the correct word', 'Three', 28, b'01', 'radio'),
(116, 'Before measuring the length of an object, it is necessary to estimate the length to be measured ', ' Choose the right measure ', 29, b'01', 'radio'),
(117, 'A friend uses a ruler to measure the height of a cylindrical cup. The measurement result is 10.4cm. Which of the following values ​​does the DCNN of the ruler have? ', '2mm', 29, b'01', 'radio'),
(118, 'Which of the following rulers is the most suitable to measure the length of your school yard?\r\n\r\n', 'The tape measure has a height of 5m and a height of 5mm', 29, b'01', 'radio'),
(119, 'Fill in the appropriate number: 6.5km = ........ m = ......... dm', '6500; 65000', 29, b'01', 'radio'),
(120, 'A table has a length greater than 0.5m and less than 1m. Which of the following rulers is the most convenient and most accurate to use to measure the length of the table?', 'Ruler has a GDT of 1m and a GDC of 1mm', 29, b'01', 'radio'),
(121, 'The legal unit of length commonly used in our country is:', 'Meters (m)', 30, b'01', 'radio'),
(122, 'The measuring limit (GHD) of the ruler is:', ' The maximum length indicated on the ruler.', 30, b'01', 'radio'),
(123, 'Which of the following rulers is the most suitable to measure the length of your school yard?', ' The tape measure has a height of 5m and a length of 5mm.', 30, b'01', 'radio'),
(124, 'Choose an appropriate ruler to measure the thickness of the book Physics 6:', 'Ruler with offset 20cm and DC 1mm', 30, b'01', 'radio'),
(125, 'Choose the appropriate ruler to measure the circumference of the cup mouth', 'A tape measure with a height of 1m and a length of 0.5cm', 30, b'01', 'radio'),
(126, 'Choose FALSE option. The unit of length is', ' Cubic meter', 31, b'01', 'radio'),
(127, 'Before measuring the length of an object, it is necessary to estimate the length to be measured\r\n\r\n', 'Choose the appropriate measure.', 31, b'01', 'radio'),
(128, 'An oil seller only has a 0.5 liter can and a 1 liter can. Which of the following customers can he only sell oil to?', 'Customer buys 3.5 liters', 31, b'01', 'radio'),
(129, 'When measuring the volume of a liquid, it is necessary to:', ' Set your eyes to the same height as the liquid level in the tank', 31, b'01', 'radio'),
(130, 'Fill in the appropriate number: 1 m 3  = ........liter = ........ml', '1000 liters; 1000000 ml', 31, b'01', 'radio'),
(131, 'Fill in the blanks: 150ml = ............m 3  = ........ .. l', ' 0.00015 m 3  = 0.15l', 32, b'01', 'radio'),
(132, 'The most commonly used unit of volume measurement is:', 'cubic meters (m3) and liters (l).', 32, b'01', 'radio'),
(133, 'People want to store 20 liters of water in small cans marked with 1.5 liters. How many cans should be used at least?', '14', 32, b'01', 'radio'),
(134, 'To measure the volume of a liquid, people use the tool:', 'Graduated flask.', 32, b'01', 'radio'),
(135, 'On a box of fresh milk, 200ml is written. That number says:', 'The volume of milk in the box is 200ml.', 32, b'01', 'radio'),
(136, 'Which of the following is not an elastic force?', 'The force acting on the wing when the plane is in motion ', 33, b'01', 'radio'),
(137, 'Which of the following statements about spring force is true?', 'The greater the length of the spring when stretched, the smaller the elastic force ', 33, b'01', 'radio'),
(138, 'Which of the following is an elastic force?', 'Thrust of the spring under the saddle', 33, b'01', 'radio'),
(139, 'The deformation of which of the objects below is elastic deformation?', 'Rubber rope', 33, b'01', 'radio'),
(140, 'Which of the following objects is elastic?', 'A rubber ball', 33, b'01', 'radio'),
(141, 'Iron is used to make which of the following objects:', 'Bridges, machines, blades', 34, b'01', 'radio'),
(142, 'One of the properties of table salt is:', 'White', 34, b'01', 'radio'),
(143, 'The similarities of sugar and salt are:', 'Both are soluble in water', 34, b'01', 'radio'),
(144, 'Iron powder and sulfur powder can be distinguished based on:', 'Color', 34, b'01', 'radio'),
(145, 'The difference between distilled water and natural water is:', ' Distilled water has one substance, natural water has many substances', 34, b'01', 'radio'),
(146, 'Iron is used to make which of the following objects:', 'Bridges, machines, blades', 35, b'01', 'radio'),
(147, 'One of the properties of table salt is:', 'White', 35, b'01', 'radio'),
(148, 'The similarities of sugar and salt are:', 'Both are soluble in water', 35, b'01', 'radio'),
(149, 'Iron powder and sulfur powder can be distinguished based on:', 'Color', 35, b'01', 'radio'),
(150, 'The difference between distilled water and natural water is:', ' Distilled water has one substance, natural water has many substances', 35, b'01', 'radio'),
(151, 'Iron is used to make which of the following objects:', 'Bridges, machines, blades', 36, b'01', 'radio'),
(152, 'One of the properties of table salt is:', 'White', 36, b'01', 'radio'),
(153, 'The similarities of sugar and salt are:', 'Both are soluble in water', 36, b'01', 'radio'),
(154, 'Iron powder and sulfur powder can be distinguished based on:', 'Color', 36, b'01', 'radio'),
(155, 'The difference between distilled water and natural water is:', ' Distilled water has one substance, natural water has many substances', 36, b'01', 'radio'),
(156, 'Iron is used to make which of the following objects:', 'Bridges, machines, blades', 37, b'01', 'radio'),
(157, 'One of the properties of table salt is:', 'White', 37, b'01', 'radio'),
(158, 'The similarities of sugar and salt are:', 'Both are soluble in water', 37, b'01', 'radio'),
(159, 'Iron powder and sulfur powder can be distinguished based on:', 'Color', 37, b'01', 'radio'),
(160, 'The difference between distilled water and natural water is:', ' Distilled water has one substance, natural water has many substances', 37, b'01', 'radio'),
(161, 'Iron is used to make which of the following objects:', 'Bridges, machines, blades', 38, b'01', 'radio'),
(162, 'One of the properties of table salt is:', 'White', 38, b'01', 'radio'),
(163, 'The similarities of sugar and salt are:', 'Both are soluble in water', 38, b'01', 'radio'),
(164, 'Iron powder and sulfur powder can be distinguished based on:', 'Color', 38, b'01', 'radio'),
(165, 'The difference between distilled water and natural water is:', ' Distilled water has one substance, natural water has many substances', 38, b'01', 'radio'),
(166, 'Living things are different from non-living things in which of the following?', 'Being able to reproduce', 39, b'01', 'radio'),
(167, 'Which of the following is a living organism?', 'Wishing tree     ', 39, b'01', 'radio'),
(168, 'Which of the following phenomena reflects life?', 'Young shoots rise above the ground', 39, b'01', 'radio'),
(169, 'The existence of the following objects does not require the presence of air? ', 'Shuttle', 39, b'01', 'radio'),
(170, 'A living thing can become a non-living thing if it grows under which of the following conditions?', 'Undernutrition', 39, b'01', 'radio'),
(171, 'Living things are different from non-living things in which of the following?', 'Being able to reproduce', 40, b'01', 'radio'),
(172, 'Which of the following is a living organism?', 'Wishing tree     ', 40, b'01', 'radio'),
(173, 'Which of the following phenomena reflects life?', 'Young shoots rise above the ground', 40, b'01', 'radio'),
(174, 'The existence of the following objects does not require the presence of air? ', 'Shuttle', 40, b'01', 'radio'),
(175, 'A living thing can become a non-living thing if it grows under which of the following conditions?', 'Undernutrition', 40, b'01', 'radio'),
(176, 'A living thing can become a non-living thing if it grows under which of the following conditions?', 'Undernutrition', 42, b'01', 'radio'),
(177, 'A living thing can become a non-living thing if it grows under which of the following conditions?', 'Undernutrition', 43, b'01', 'radio'),
(178, 'The existence of the following objects does not require the presence of air? ', 'Shuttle', 41, b'01', 'radio'),
(179, 'The existence of the following objects does not require the presence of air? ', 'Shuttle', 42, b'01', 'radio'),
(180, 'The existence of the following objects does not require the presence of air? ', 'Shuttle', 43, b'01', 'radio'),
(181, 'Which of the following phenomena reflects life?', 'Young shoots rise above the ground', 41, b'01', 'radio'),
(182, 'Which of the following phenomena reflects life?', 'Young shoots rise above the ground', 42, b'01', 'radio'),
(183, 'Which of the following phenomena reflects life?', 'Young shoots rise above the ground', 43, b'01', 'radio'),
(184, 'Which of the following is a living organism?', 'Wishing tree     ', 41, b'01', 'radio'),
(185, 'Which of the following is a living organism?', 'Wishing tree     ', 42, b'01', 'radio'),
(186, 'Which of the following is a living organism?', 'Wishing tree     ', 43, b'01', 'radio'),
(187, 'Living things are different from non-living things in which of the following?', 'Being able to reproduce', 41, b'01', 'radio'),
(188, 'Living things are different from non-living things in which of the following?', 'Being able to reproduce', 42, b'01', 'radio'),
(189, 'Living things are different from non-living things in which of the following?', 'Being able to reproduce', 43, b'01', 'radio'),
(190, 'Vietnamese words are divided into how many types?', '2', 44, b'01', 'radio'),
(191, 'Which of the following words is a compound word?', 'Sneaky', 44, b'01', 'radio'),
(192, ' The most accurate and complete concept of the word?\r\n\r\n', 'Words are meaningful linguistic elements, used independently, to create sentences.', 44, b'01', 'radio'),
(193, 'Which words are often used to describe laughter?\r\n\r\n', 'customers', 44, b'01', 'radio'),
(194, 'What is a word forming unit?', 'English', 44, b'01', 'radio'),
(195, 'Vietnamese words are divided into how many types?', '2', 45, b'01', 'radio'),
(196, 'Vietnamese words are divided into how many types?', '2', 46, b'01', 'radio'),
(197, 'Vietnamese words are divided into how many types?', '2', 47, b'01', 'radio'),
(198, 'Vietnamese words are divided into how many types?', '2', 48, b'01', 'radio'),
(199, 'Which of the following words is a compound word?', 'Sneaky', 45, b'01', 'radio'),
(200, 'Which of the following words is a compound word?', 'Sneaky', 46, b'01', 'radio'),
(201, 'Which of the following words is a compound word?', 'Sneaky', 47, b'01', 'radio'),
(202, 'Which of the following words is a compound word?', 'Sneaky', 48, b'01', 'radio'),
(203, ' The most accurate and complete concept of the word?\r\n\r\n', 'Words are meaningful linguistic elements, used independently, to create sentences.', 45, b'01', 'radio'),
(204, ' The most accurate and complete concept of the word?\r\n\r\n', 'Words are meaningful linguistic elements, used independently, to create sentences.', 46, b'01', 'radio'),
(205, ' The most accurate and complete concept of the word?\r\n\r\n', 'Words are meaningful linguistic elements, used independently, to create sentences.', 47, b'01', 'radio'),
(206, ' The most accurate and complete concept of the word?\r\n\r\n', 'Words are meaningful linguistic elements, used independently, to create sentences.', 48, b'01', 'radio'),
(207, 'Which words are often used to describe laughter?\r\n\r\n', 'customers', 45, b'01', 'radio'),
(208, 'Which words are often used to describe laughter?\r\n\r\n', 'customers', 46, b'01', 'radio'),
(209, 'Which words are often used to describe laughter?\r\n\r\n', 'customers', 47, b'01', 'radio'),
(210, 'Which words are often used to describe laughter?\r\n\r\n', 'customers', 48, b'01', 'radio'),
(211, 'What is a word forming unit?', 'English', 45, b'01', 'radio'),
(212, 'What is a word forming unit?', 'English', 46, b'01', 'radio'),
(213, 'What is a word forming unit?', 'English', 47, b'01', 'radio'),
(214, 'What is a word forming unit?', 'English', 48, b'01', 'radio'),
(215, 'What is the shape of the Earth?', 'Spherical', 49, b'01', 'radio'),
(216, 'The West meridian is:', 'Is the meridian to the left of the prime meridian.', 49, b'01', 'radio'),
(217, ' In the solar system, in what position is the Earth in order of increasing distance from the Sun?', '3th place', 49, b'01', 'radio'),
(218, 'On Earth, our country is located in:', 'Northern Hemisphere and Eastern Hemisphere.', 49, b'01', 'radio'),
(219, ' The circles on the globe perpendicular to the meridians are the lines:\r\n\r\n', 'Latitude', 49, b'01', 'radio'),
(220, 'What is the shape of the Earth?', 'Spherical', 50, b'01', 'radio'),
(221, 'What is the shape of the Earth?', 'Spherical', 51, b'01', 'radio'),
(222, 'What is the shape of the Earth?', 'Spherical', 52, b'01', 'radio'),
(223, 'What is the shape of the Earth?', 'Spherical', 53, b'01', 'radio'),
(224, 'The West meridian is:', 'Is the meridian to the left of the prime meridian.', 50, b'01', 'radio'),
(225, 'The West meridian is:', 'Is the meridian to the left of the prime meridian.', 51, b'01', 'radio'),
(226, 'The West meridian is:', 'Is the meridian to the left of the prime meridian.', 52, b'01', 'radio'),
(227, 'The West meridian is:', 'Is the meridian to the left of the prime meridian.', 53, b'01', 'radio'),
(228, ' In the solar system, in what position is the Earth in order of increasing distance from the Sun?', '3th place', 50, b'01', 'radio'),
(229, ' In the solar system, in what position is the Earth in order of increasing distance from the Sun?', '3th place', 51, b'01', 'radio'),
(230, ' In the solar system, in what position is the Earth in order of increasing distance from the Sun?', '3th place', 52, b'01', 'radio'),
(231, ' In the solar system, in what position is the Earth in order of increasing distance from the Sun?', '3th place', 53, b'01', 'radio'),
(232, 'On Earth, our country is located in:', 'Northern Hemisphere and Eastern Hemisphere.', 50, b'01', 'radio'),
(233, 'On Earth, our country is located in:', 'Northern Hemisphere and Eastern Hemisphere.', 51, b'01', 'radio'),
(234, 'On Earth, our country is located in:', 'Northern Hemisphere and Eastern Hemisphere.', 52, b'01', 'radio'),
(235, 'On Earth, our country is located in:', 'Northern Hemisphere and Eastern Hemisphere.', 53, b'01', 'radio'),
(236, ' The circles on the globe perpendicular to the meridians are the lines:\r\n\r\n', 'Latitude', 50, b'01', 'radio'),
(237, ' The circles on the globe perpendicular to the meridians are the lines:\r\n\r\n', 'Latitude', 51, b'01', 'radio'),
(238, ' The circles on the globe perpendicular to the meridians are the lines:\r\n\r\n', 'Latitude', 52, b'01', 'radio'),
(239, ' The circles on the globe perpendicular to the meridians are the lines:\r\n\r\n', 'Latitude', 53, b'01', 'radio'),
(240, 'question 1', 'explain', 54, b'01', 'radio'),
(241, 'qestion 2', 'explain', 54, b'01', 'checkbox');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `account_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `times` int(11) NOT NULL,
  `timer` tinyint(4) NOT NULL,
  `fee` bit(2) NOT NULL,
  `image` text NOT NULL,
  `status` bit(2) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quiz_id`, `title`, `description`, `account_id`, `category_id`, `times`, `timer`, `fee`, `image`, `status`, `date_created`) VALUES
(14, 'Test English 12', 'english 12', 100, 9, 340000, 45, b'00', 'd151813aba814344a3d4c3a4079d9194.jfif', b'01', '2022-01-31 14:32:26'),
(15, 'Test Math 12', 'math 12', 100, 1, 2300, 45, b'00', 'e86b97497bba4ac787efec1ffa0c3b74.jpg', b'01', '2022-01-31 15:04:14'),
(16, 'HTML Quiz', 'Learn about HTML', 100, 8, 1200, 15, b'00', 'c52e82a8dd3c4b13b48fe6a5fe4b70bb.png', b'01', '2022-02-06 22:52:24'),
(17, 'CSS Quiz', 'Learn about CSS', 100, 8, 6000, 10, b'00', 'c130901af5ab4a7189cfc50b0afd0e2e.png', b'01', '2022-02-06 23:21:32'),
(18, 'JavaScript Quiz', 'Learn about JavaScript', 100, 8, 300, 10, b'00', '44d9a0f557c343dc9e31e8cd16d430ca.png', b'01', '2022-02-07 11:13:03'),
(19, 'SQL Quiz', 'Learn about SQL', 100, 8, 400, 5, b'00', '99f40b5c1a75410795906cc4a95c6674.png', b'01', '2022-02-07 11:29:04'),
(20, 'PHP Quiz ', 'Learn about PHP', 100, 8, 500, 5, b'00', '1af96038945c40daa7575c89932be6cd.jpeg', b'01', '2022-02-07 11:39:39'),
(21, 'TEST MATH 5', 'Test Math 5', 100, 1, 201, 10, b'01', '5a0347fbcee4491997377876588ea3b8.jpeg', b'01', '2022-02-07 11:46:34'),
(22, 'TEST MATH 6', 'Test Math 6', 100, 1, 300, 10, b'01', '46ea5b48cda14da69e9a2aaa97107970.jpeg', b'01', '2022-02-07 11:56:42'),
(23, 'TEST MATH 1', 'Learn about math', 100, 1, 101, 20, b'00', '81198c7d454d4b448543a0dcc8643075.jpeg', b'01', '2022-02-07 13:42:20'),
(24, 'TEST MATH 2', 'Learn about math 2', 100, 1, 400, 30, b'00', '6a88e68e800b4e96aa3c0daa9afb9efd.jpeg', b'01', '2022-02-07 13:46:41'),
(25, 'TEST ENGLISH 1', 'Learn about english 1', 100, 9, 500, 5, b'01', '4d3bfe7460fa46b7a089209a4786c755.jpeg', b'01', '2022-02-07 13:54:20'),
(26, 'TEST ENGLISH 2', 'Learn about english 2', 100, 9, 170, 40, b'00', '2a50462ca0934f29b7263d92b4528de0.png', b'01', '2022-02-07 14:23:51'),
(27, 'TEST ENGLISH 3', 'Learn about English 3', 100, 9, 400, 15, b'01', '17d13abb89fe4dafafa550b4bb5b4aae.png', b'01', '2022-02-07 14:30:19'),
(28, 'TEST ENGLISH 4', 'Learn about English 4', 100, 9, 200, 45, b'01', 'a1989d8b15884e58bd7ee03826caa825.jpeg', b'01', '2022-02-07 14:43:26'),
(29, 'Physics quiz 6 ', 'Physics quiz 6 ', 100, 2, 180, 30, b'00', '011f65feae2e4d8ab2de638bf47b2280.jpeg', b'01', '2022-02-07 14:59:17'),
(30, 'Physics quiz 7', 'Physics quiz 7', 100, 2, 300, 40, b'01', 'cda9d3e8a53943578bd04f6d60170c35.jpeg', b'01', '2022-02-07 15:04:17'),
(31, 'Physics quiz 8', 'Physics quiz 8', 100, 2, 200, 45, b'01', 'fbb523dfe7384d798fbac333a1c355dc.jpeg', b'01', '2022-02-07 15:16:28'),
(32, 'Physics quiz 9', 'Physics quiz 9', 100, 2, 126, 35, b'01', 'b0151405daa349a6bde2a38f4bccc36e.jpeg', b'01', '2022-02-07 15:30:27'),
(33, 'Physics quiz 10', 'Physics quiz 10', 100, 2, 600, 40, b'01', '412ea1c6a1f74d35a36857ca7e054fce.jpeg', b'00', '2022-02-07 15:58:04'),
(34, 'Chemistry test ', 'Chemistry test ', 105, 3, 3000, 20, b'00', '6a071d9ed6d646d5ae20a9e195341aa1.jpeg', b'01', '2022-02-07 16:25:09'),
(35, 'Chemistry test 1', 'Chemistry test 1', 105, 3, 300, 20, b'01', 'd7d3c94850174fbbb8463127cb45d752.png', b'01', '2022-02-07 16:25:09'),
(36, 'Chemistry test 2', 'Chemistry test 2', 105, 3, 4000, 20, b'01', '24d41a284a47472581bb9b843bb5ed2c.jpeg', b'01', '2022-02-07 16:25:09'),
(37, 'Chemistry test 3', 'Chemistry test 3', 105, 3, 500, 20, b'01', '6a071d9ed6d646d5ae20a9e195341aa1.jpeg', b'01', '2022-02-07 16:25:09'),
(38, 'Chemistry test 4', 'Chemistry test 4', 105, 3, 3000, 20, b'01', 'b2e429aa05c64de8b66b87148e17c279.png', b'01', '2022-02-07 16:25:09'),
(39, 'Biology Quiz', 'Biology Quiz', 105, 4, 600, 15, b'00', 'c3d2e099c66848fe8289c453e2851747.jpeg', b'01', '2022-02-07 16:38:25'),
(40, 'Biology Quiz 1', 'Biology Quiz 1', 105, 4, 280, 15, b'01', '35f19550492d49f8bc6f15034ae386a2.jpeg', b'01', '2022-02-07 16:38:25'),
(41, 'Biology Quiz 2', 'Biology Quiz 2', 105, 4, 500, 15, b'01', '3957ce404e4c4aa0b0bf6d7db6646631.jpeg', b'01', '2022-02-07 16:38:25'),
(42, 'Biology Quiz 3', 'Biology Quiz 3', 105, 4, 470, 15, b'01', 'c3d2e099c66848fe8289c453e2851747.jpeg', b'01', '2022-02-07 16:38:25'),
(43, 'Biology Quiz 4', 'Biology Quiz 4', 105, 4, 360, 15, b'01', '0c17dbff446f4fcfb6ae20733c0bbb0f.jpeg', b'01', '2022-02-07 16:38:25'),
(44, 'Grammar test : Vietnamese words and word structure', 'Grammar test : Vietnamese words and word structure', 105, 5, 260, 30, b'00', '15091275d7714d0992c3835e3212a4c5.jpeg', b'01', '2022-02-07 16:51:09'),
(45, 'Grammar test 1 : Vietnamese words and word structure', 'Grammar test 1: Vietnamese words and word structure', 105, 5, 770, 30, b'01', 'f2777431433446de94ca35d9dd6d8ae4.jpeg', b'01', '2022-02-07 16:51:09'),
(46, 'Grammar test 2: Vietnamese words and word structure', 'Grammar test 2: Vietnamese words and word structure', 105, 5, 670, 30, b'01', '9eac4f37286c4ccda96ddf86130d1a27.jpeg', b'01', '2022-02-07 16:51:09'),
(47, 'Grammar test 3: Vietnamese words and word structure', 'Grammar test 3: Vietnamese words and word structure', 105, 5, 870, 30, b'01', '15091275d7714d0992c3835e3212a4c5.jpeg', b'01', '2022-02-07 16:51:09'),
(48, 'Grammar test 4: Vietnamese words and word structure', 'Grammar test 4: Vietnamese words and word structure', 105, 5, 600, 30, b'01', '10ebbda53b48499396d0d8ece4211bcb.jpeg', b'01', '2022-02-07 16:51:09'),
(49, 'Geography quiz ', 'Geography quiz ', 105, 6, 400, 20, b'00', '6cf4d5f2d4ff43dfbef0d856e6e80d51.jpeg', b'01', '2022-02-07 17:03:04'),
(50, 'Geography quiz 1', 'Geography quiz 1', 105, 6, 200, 20, b'01', '8b84c80130bc49dba42f63cd695ace56.jpeg', b'01', '2022-02-07 17:03:04'),
(51, 'Geography quiz 2', 'Geography quiz 2', 105, 6, 190, 20, b'01', 'a6b7b73d0b78496992ae3973dafe1c2d.jpeg', b'01', '2022-02-07 17:03:04'),
(52, 'Geography quiz 3', 'Geography quiz 3', 105, 6, 260, 20, b'01', '6cf4d5f2d4ff43dfbef0d856e6e80d51.jpeg', b'01', '2022-02-07 17:03:04'),
(53, 'Geography quiz 4', 'Geography quiz 4', 105, 6, 140, 20, b'01', '2722897f6e474d348d1a3375215deb78.jpeg', b'01', '2022-02-07 17:03:04'),
(54, 'new quiz', 'new quiz', 100, 1, 1, 20, b'01', 'e717ceedba1e4c03b330057ec32748c6.jpeg', b'01', '2022-02-09 09:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `star` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `status` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_id`, `account_id`, `quiz_id`, `star`, `created`, `status`) VALUES
(4, 99, 15, 5, '2022-02-06 22:14:08', b'01'),
(5, 99, 14, 4, '2022-02-06 22:23:11', b'01'),
(6, 100, 22, 5, '2022-02-07 11:59:55', b'01'),
(7, 99, 53, 5, '2022-02-07 17:27:23', b'01'),
(8, 99, 52, 4, '2022-02-07 17:28:34', b'01'),
(9, 99, 51, 3, '2022-02-07 17:29:05', b'01'),
(10, 99, 50, 5, '2022-02-07 17:30:04', b'01'),
(11, 99, 46, 4, '2022-02-07 17:30:18', b'01'),
(12, 99, 43, 5, '2022-02-07 17:30:32', b'01'),
(13, 99, 24, 5, '2022-02-09 00:38:26', b'01'),
(14, 99, 23, 5, '2022-02-09 00:38:38', b'01'),
(15, 99, 21, 5, '2022-02-09 00:38:44', b'01'),
(16, 99, 48, 4, '2022-02-09 00:40:05', b'01'),
(17, 99, 47, 4, '2022-02-09 00:40:19', b'01'),
(18, 99, 42, 4, '2022-02-09 00:40:40', b'01'),
(19, 99, 41, 1, '2022-02-09 00:41:05', b'01'),
(20, 99, 40, 4, '2022-02-09 00:41:57', b'01'),
(21, 99, 39, 4, '2022-02-09 00:42:17', b'01'),
(22, 99, 38, 3, '2022-02-09 00:42:33', b'01'),
(23, 99, 32, 3, '2022-02-09 00:43:17', b'01'),
(24, 99, 31, 3, '2022-02-09 00:43:28', b'01'),
(25, 99, 30, 3, '2022-02-09 00:43:49', b'01'),
(26, 99, 29, 4, '2022-02-09 00:44:02', b'01'),
(27, 99, 36, 3, '2022-02-09 00:44:26', b'01'),
(28, 99, 35, 2, '2022-02-09 00:44:39', b'01'),
(29, 99, 34, 5, '2022-02-09 00:44:58', b'01'),
(30, 99, 49, 3, '2022-02-09 00:45:41', b'01'),
(31, 99, 20, 3, '2022-02-09 00:45:52', b'01'),
(32, 99, 19, 1, '2022-02-09 00:46:01', b'01'),
(33, 99, 18, 5, '2022-02-09 00:46:12', b'01'),
(34, 99, 17, 3, '2022-02-09 00:46:21', b'01'),
(35, 99, 16, 1, '2022-02-09 00:46:30', b'01'),
(36, 99, 28, 4, '2022-02-09 00:46:39', b'01'),
(37, 99, 27, 4, '2022-02-09 00:46:49', b'01'),
(38, 99, 26, 1, '2022-02-09 00:47:03', b'01'),
(39, 99, 25, 3, '2022-02-09 00:47:13', b'01'),
(40, 110, 23, 4, '2022-02-09 09:11:54', b'01');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `status` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `description`, `status`) VALUES
(1, 'ROLE_ADMIN', 'role admin', b'01'),
(2, 'ROLE_USER_FACULTY', 'role user faculty', b'01'),
(3, 'ROLE_USER_CANDIDATE', 'role user candidate\r\n', b'01');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `salary_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `create_date` datetime NOT NULL,
  `status` bit(2) NOT NULL,
  `total_click_quiz` int(11) NOT NULL,
  `accept_payment` bit(2) NOT NULL,
  `total_click_quiz_month` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`salary_id`, `account_id`, `salary`, `create_date`, `status`, `total_click_quiz`, `accept_payment`, `total_click_quiz_month`) VALUES
(32, 100, '6.17', '2021-12-09 01:09:06', b'01', 6166, b'01', 6166),
(33, 105, '8.37', '2021-12-09 01:09:06', b'01', 8370, b'01', 8370),
(35, 100, '11.61', '2022-01-09 01:15:07', b'01', 17776, b'01', 11610),
(36, 105, '2.70', '2022-01-09 01:15:07', b'01', 11070, b'01', 2700),
(41, 100, '336.60', '2022-02-09 09:18:57', b'01', 354378, b'01', 336602),
(42, 105, '6.30', '2022-02-09 09:18:57', b'01', 17370, b'01', 6300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `account_pack`
--
ALTER TABLE `account_pack`
  ADD PRIMARY KEY (`account_pack_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `pack_id` (`pack_id`);

--
-- Indexes for table `account_role`
--
ALTER TABLE `account_role`
  ADD PRIMARY KEY (`account_id`,`role_id`),
  ADD KEY `ac_role_pk_2` (`role_id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `pack`
--
ALTER TABLE `pack`
  ADD PRIMARY KEY (`pack_id`);

--
-- Indexes for table `pay`
--
ALTER TABLE `pay`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `FK_pay_account` (`account_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `account_id` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `account_pack`
--
ALTER TABLE `account_pack`
  MODIFY `account_pack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=580;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pack`
--
ALTER TABLE `pack`
  MODIFY `pack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pay`
--
ALTER TABLE `pay`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_pack`
--
ALTER TABLE `account_pack`
  ADD CONSTRAINT `account_pack_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `account_pack_ibfk_2` FOREIGN KEY (`pack_id`) REFERENCES `pack` (`pack_id`);

--
-- Constraints for table `account_role`
--
ALTER TABLE `account_role`
  ADD CONSTRAINT `ac_role_pk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `ac_role_pk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`);

--
-- Constraints for table `pay`
--
ALTER TABLE `pay`
  ADD CONSTRAINT `FK_pay_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
