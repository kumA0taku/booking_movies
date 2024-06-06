-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 08:58 AM
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
-- Database: `nature_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_msche_mapper`
--

CREATE TABLE `booking_msche_mapper` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `sche_id` int(11) NOT NULL,
  `status` enum('confirm','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_sm`
--

CREATE TABLE `booking_sm` (
  `id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `book_msche_id` int(11) NOT NULL,
  `status` enum('confirm','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_thea_mapper`
--

CREATE TABLE `booking_thea_mapper` (
  `id` int(11) NOT NULL,
  `thea_sche_id` int(11) NOT NULL,
  `book_code` varchar(200) NOT NULL,
  `status` enum('confirm','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `m_name` varchar(200) NOT NULL,
  `running_time` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `genre` enum('comedy','horror','romance') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `m_name`, `running_time`, `start_date`, `end_date`, `genre`) VALUES
(1, 'Mulan', 114, '2020-06-02', '2020-06-12', 'comedy'),
(2, 'Tom and Jerry', 120, '2024-06-04', '2024-06-14', 'comedy');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `m_id`, `time`, `date`) VALUES
(1, 1, '10:00:00', '2024-06-06'),
(2, 2, '14:00:00', '2024-06-06'),
(3, 1, '21:00:00', '2020-06-08'),
(4, 1, '14:00:00', '2020-06-09');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `thea_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `s_no` varchar(200) NOT NULL,
  `in_thea` enum('_sriracha','_bangsan') NOT NULL,
  `status` enum('has_booking','none_booking') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `thea_id`, `price`, `s_no`, `in_thea`, `status`) VALUES
(1, 1, 80, 'A1', '_sriracha', 'none_booking'),
(2, 1, 80, 'A2', '_sriracha', 'none_booking'),
(3, 1, 80, 'B1', '_sriracha', 'none_booking'),
(4, 1, 80, 'B2', '_sriracha', 'none_booking'),
(5, 1, 80, 'C1', '_sriracha', 'none_booking'),
(6, 1, 80, 'C2', '_sriracha', 'none_booking'),
(7, 2, 100, 'A1', '_bangsan', 'none_booking'),
(8, 2, 100, 'A2', '_bangsan', 'none_booking'),
(9, 2, 100, 'A3', '_bangsan', 'none_booking'),
(10, 2, 100, 'B1', '_bangsan', 'none_booking'),
(11, 2, 100, 'B2', '_bangsan', 'none_booking'),
(12, 2, 100, 'B3', '_bangsan', 'none_booking'),
(13, 2, 100, 'C1', '_bangsan', 'none_booking'),
(14, 2, 100, 'C2', '_bangsan', 'none_booking'),
(15, 2, 100, 'C3', '_bangsan', 'none_booking'),
(16, 2, 100, 'D1', '_bangsan', 'none_booking'),
(17, 2, 100, 'D2', '_bangsan', 'none_booking'),
(18, 2, 100, 'D3', '_bangsan', 'none_booking');

-- --------------------------------------------------------

--
-- Table structure for table `theatres`
--

CREATE TABLE `theatres` (
  `id` int(11) NOT NULL,
  `thea_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theatres`
--

INSERT INTO `theatres` (`id`, `thea_name`) VALUES
(1, 'Sriracha'),
(2, 'Bangsan');

-- --------------------------------------------------------

--
-- Table structure for table `thea_sche_mapper`
--

CREATE TABLE `thea_sche_mapper` (
  `id` int(11) NOT NULL,
  `thea_id` int(11) NOT NULL,
  `sche_id` int(11) NOT NULL,
  `playing` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `u_name` varchar(200) NOT NULL,
  `u_phone` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_msche_mapper`
--
ALTER TABLE `booking_msche_mapper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_sm`
--
ALTER TABLE `booking_sm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_thea_mapper`
--
ALTER TABLE `booking_thea_mapper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theatres`
--
ALTER TABLE `theatres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thea_sche_mapper`
--
ALTER TABLE `thea_sche_mapper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_msche_mapper`
--
ALTER TABLE `booking_msche_mapper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_sm`
--
ALTER TABLE `booking_sm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_thea_mapper`
--
ALTER TABLE `booking_thea_mapper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `theatres`
--
ALTER TABLE `theatres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `thea_sche_mapper`
--
ALTER TABLE `thea_sche_mapper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
