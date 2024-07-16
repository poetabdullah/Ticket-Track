-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2024 at 07:29 PM
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
-- Database: `db_tickettrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `city_admin_panel`
--

CREATE TABLE `city_admin_panel` (
  `id` int(11) NOT NULL,
  `departure_city` varchar(255) NOT NULL,
  `arrival_city` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city_admin_panel`
--

INSERT INTO `city_admin_panel` (`id`, `departure_city`, `arrival_city`, `price`) VALUES
(1, 'Berlin', 'Leipzig', 25.00),
(2, 'Frankfurt', 'Cologne', 30.00),
(3, 'Munich', 'Nuremberg', 30.00),
(4, 'Hamburg', 'Bremen', 30.00),
(5, 'Stuttgart', 'Munich', 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `contact_form`
--

CREATE TABLE `contact_form` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_form`
--

INSERT INTO `contact_form` (`id`, `email`, `message`, `created_at`) VALUES
(1, 'person@gmail.com', 'Sorry', '2024-07-04 18:28:15'),
(2, 'person@gmail.com', 'Sorry', '2024-07-04 18:37:46'),
(3, 'person@gmail.com', 'Sorry', '2024-07-04 18:38:06'),
(4, 'person@gmail.com', 'Sorry', '2024-07-04 18:39:41'),
(5, 'person@gmail.com', 'Sorry', '2024-07-04 18:45:49'),
(6, 'person@gmail.com', 'Sorry', '2024-07-04 18:48:34'),
(7, 'person@gmail.com', 'Sorry', '2024-07-04 18:50:55'),
(8, 'person@gmail.com', 'Sorry', '2024-07-04 18:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `country_admin_panel`
--

CREATE TABLE `country_admin_panel` (
  `id` int(11) NOT NULL,
  `departure` varchar(255) NOT NULL,
  `arrival` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country_admin_panel`
--

INSERT INTO `country_admin_panel` (`id`, `departure`, `arrival`, `price`) VALUES
(1, 'Frankfurt, Germany', 'Brussels, Belgium', 20.00),
(2, 'Frankfurt, Germany', 'Amsterdam, Netherlands', 80.00),
(3, 'Amsterdam, Netherlands', 'Brussels, Belgium', 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `intercountryafternoon`
--

CREATE TABLE `intercountryafternoon` (
  `route_no` int(11) DEFAULT NULL,
  `departure_station` varchar(255) DEFAULT NULL,
  `arrival_station` varchar(255) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `fare` varchar(255) DEFAULT NULL,
  `time_taken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `intercountryafternoon`
--

INSERT INTO `intercountryafternoon` (`route_no`, `departure_station`, `arrival_station`, `departure_time`, `arrival_time`, `distance`, `fare`, `time_taken`) VALUES
(1, 'Frankfurt, Germany', 'Brussels, Belgium', '12:00:00', '15:30:00', '320 KM', '20.00', '3:30 hours'),
(2, 'Frankfurt, Germany', 'Amsterdam, Netherlands', '12:00:00', '16:00:00', '400 KM', '80.00', '4 hours'),
(3, 'Amsterdam, Netherlands', 'Brussels, Belgium', '12:00:00', '14:00:00', '170 KM', '50.00', '2 hours');

-- --------------------------------------------------------

--
-- Table structure for table `intercountryevening`
--

CREATE TABLE `intercountryevening` (
  `route_no` int(11) DEFAULT NULL,
  `departure_station` varchar(255) DEFAULT NULL,
  `arrival_station` varchar(255) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `fare` varchar(255) DEFAULT NULL,
  `time_taken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `intercountryevening`
--

INSERT INTO `intercountryevening` (`route_no`, `departure_station`, `arrival_station`, `departure_time`, `arrival_time`, `distance`, `fare`, `time_taken`) VALUES
(1, 'Frankfurt, Germany', 'Brussels, Belgium', '16:00:00', '19:30:00', '320 KM', '20.00', '3:30 hours'),
(2, 'Frankfurt, Germany', 'Amsterdam, Netherlands', '16:00:00', '20:00:00', '400 KM', '80.00', '4 hours'),
(3, 'Amsterdam, Netherlands', 'Brussels, Belgium', '16:00:00', '18:00:00', '170 KM', '50.00', '2 hours');

-- --------------------------------------------------------

--
-- Table structure for table `intercountrymorning`
--

CREATE TABLE `intercountrymorning` (
  `route_no` int(11) DEFAULT NULL,
  `departure_station` varchar(255) DEFAULT NULL,
  `arrival_station` varchar(255) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `fare` varchar(255) DEFAULT NULL,
  `time_taken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `intercountrymorning`
--

INSERT INTO `intercountrymorning` (`route_no`, `departure_station`, `arrival_station`, `departure_time`, `arrival_time`, `distance`, `fare`, `time_taken`) VALUES
(1, 'Frankfurt, Germany', 'Brussels, Belgium', '08:00:00', '11:30:00', '320 KM', '20.00', '3:30 hours'),
(2, 'Frankfurt, Germany', 'Amsterdam, Netherlands', '08:00:00', '12:00:00', '400 KM', '80.00', '4 hours'),
(3, 'Amsterdam, Netherlands', 'Brussels, Belgium', '08:00:00', '10:00:00', '170 KM', '50.00', '2 hours');

-- --------------------------------------------------------

--
-- Table structure for table `intracountryafternoon`
--

CREATE TABLE `intracountryafternoon` (
  `route_no` int(11) DEFAULT NULL,
  `departure_station` varchar(255) DEFAULT NULL,
  `arrival_station` varchar(255) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `fare` varchar(255) DEFAULT NULL,
  `time_taken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `intracountryafternoon`
--

INSERT INTO `intracountryafternoon` (`route_no`, `departure_station`, `arrival_station`, `departure_time`, `arrival_time`, `distance`, `fare`, `time_taken`) VALUES
(1, 'Berlin', 'Leipzig', '13:00:00', '14:00:00', '190 KM', '25.00', '1 hour'),
(2, 'Frankfurt', 'Cologne', '13:00:00', '14:00:00', '190 KM', '30.00', '1 hour'),
(3, 'Munich', 'Nuremberg', '13:00:00', '14:00:00', '170 KM', '30.00', '1 hour'),
(4, 'Hamburg', 'Bremen', '13:00:00', '13:45:00', '120 KM', '30.00', '45 minutes'),
(5, 'Stuttgart', 'Munich', '13:00:00', '15:00:00', '220 KM', '50.00', '2 hours');

-- --------------------------------------------------------

--
-- Table structure for table `intracountryevening`
--

CREATE TABLE `intracountryevening` (
  `route_no` int(11) DEFAULT NULL,
  `departure_station` varchar(255) DEFAULT NULL,
  `arrival_station` varchar(255) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `fare` varchar(255) DEFAULT NULL,
  `time_taken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `intracountryevening`
--

INSERT INTO `intracountryevening` (`route_no`, `departure_station`, `arrival_station`, `departure_time`, `arrival_time`, `distance`, `fare`, `time_taken`) VALUES
(1, 'Berlin', 'Leipzig', '17:00:00', '18:00:00', '190 KM', '25.00', '1 hour'),
(2, 'Frankfurt', 'Cologne', '17:00:00', '18:00:00', '190 KM', '30.00', '1 hour'),
(3, 'Munich', 'Nuremberg', '17:00:00', '18:00:00', '170 KM', '30.00', '1 hour'),
(4, 'Hamburg', 'Bremen', '17:00:00', '17:45:00', '120 KM', '30.00', '45 minutes'),
(5, 'Stuttgart', 'Munich', '17:00:00', '19:00:00', '220 KM', '50.00', '2 hours');

-- --------------------------------------------------------

--
-- Table structure for table `intracountrymorning`
--

CREATE TABLE `intracountrymorning` (
  `route_no` int(11) DEFAULT NULL,
  `departure_station` varchar(255) DEFAULT NULL,
  `arrival_station` varchar(255) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `fare` varchar(255) DEFAULT NULL,
  `time_taken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `intracountrymorning`
--

INSERT INTO `intracountrymorning` (`route_no`, `departure_station`, `arrival_station`, `departure_time`, `arrival_time`, `distance`, `fare`, `time_taken`) VALUES
(1, 'Berlin', 'Leipzig', '08:00:00', '09:00:00', '190 KM', '25.00', '1 hour'),
(2, 'Frankfurt', 'Cologne', '09:00:00', '10:00:00', '190 KM', '30.00', '1 hour'),
(3, 'Munich', 'Nuremberg', '09:00:00', '10:00:00', '170 KM', '30.00', '1 hour'),
(4, 'Hamburg', 'Bremen', '09:00:00', '09:45:00', '120 KM', '30.00', '45 minutes'),
(5, 'Stuttgart', 'Munich', '09:00:00', '11:00:00', '220 KM', '50.00', '2 hours');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inter`
--

CREATE TABLE `tbl_inter` (
  `ID` int(11) NOT NULL,
  `Name_of_Passenger` varchar(255) NOT NULL,
  `Departure_Station` varchar(255) NOT NULL,
  `Arrival_Station` varchar(255) NOT NULL,
  `ID_Card` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Category_of_Seat` varchar(50) NOT NULL,
  `Number_of_Passengers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_inter`
--

INSERT INTO `tbl_inter` (`ID`, `Name_of_Passenger`, `Departure_Station`, `Arrival_Station`, `ID_Card`, `Date`, `Time`, `Category_of_Seat`, `Number_of_Passengers`) VALUES
(1, 'Hammad', 'Amsterdam, Netherlands', 'Brussels, Belgium', '122222222222', '2024-06-22', '08:00:00', 'Window', 1),
(2, 'Hammad', 'Amsterdam, Netherlands', 'Brussels, Belgium', '122222222222', '2024-06-22', '08:00:00', 'Window', 1),
(3, 'Hammad', 'Amsterdam, Netherlands', 'Brussels, Belgium', '122222222222', '2024-06-22', '08:00:00', 'Window', 1),
(4, 'ninja', 'Amsterdam, Netherlands', 'Brussels, Belgium', '122222222222', '2024-06-22', '04:00:00', 'Window', 1),
(5, 'ninja', 'Frankfurt, Germany', 'Amsterdam, Netherlands', '122222222222', '2024-06-24', '04:00:00', 'Aisle', 1),
(6, 'ninja', 'Brussels, Belgium', 'Amsterdam, Netherlands', '122222222222', '2024-06-24', '08:00:00', 'Window', 1),
(7, 'Person', 'Frankfurt, Germany', 'Brussels, Belgium', '121212121212', '2024-06-24', '04:00:00', 'Window', 1),
(8, 'SHAFIQUE', 'Amsterdam, Netherlands', 'Brussels, Belgium', '145588898921', '2024-06-28', '04:00:00', 'Window', 1),
(9, 'Jack', 'Brussels, Belgium', 'Amsterdam, Netherlands', '352011111111', '2024-07-05', '12:00:00', 'Aisle', 1),
(10, 'Hammad', 'Amsterdam, Netherlands', 'Brussels, Belgium', '122222222222', '2024-06-29', '04:00:00', 'Window', 1),
(11, 'Person', 'Amsterdam, Netherlands', 'Brussels, Belgium', '144454545454', '2024-06-29', '08:00:00', 'Window', 1),
(12, '', '', '', '', '0000-00-00', '00:00:00', '', 0),
(13, '', '', '', '', '0000-00-00', '00:00:00', '', 0),
(14, 'Person', 'Frankfurt, Germany', 'Brussels, Belgium', '144454545454', '2024-07-05', '08:00:00', 'Window', 1),
(15, 'TestSample', 'Frankfurt, Germany', 'Brussels, Belgium', '144454545454', '2024-07-05', '08:00:00', 'Window', 1),
(16, 'Obaid', 'Frankfurt, Germany', 'Brussels, Belgium', '124664746364', '2024-07-27', '08:00:00', 'Window', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_intra`
--

CREATE TABLE `tbl_intra` (
  `id` int(11) NOT NULL,
  `Name_of_Passenger` varchar(255) NOT NULL,
  `Departure_Station` varchar(255) NOT NULL,
  `Arrival_Station` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Category_of_Seat` varchar(255) NOT NULL,
  `Number_of_Passengers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_intra`
--

INSERT INTO `tbl_intra` (`id`, `Name_of_Passenger`, `Departure_Station`, `Arrival_Station`, `Date`, `Time`, `Category_of_Seat`, `Number_of_Passengers`) VALUES
(1, 'Ahamd', 'Munich', 'Leipzig', '2024-06-29', '01:00:00', 'Window', 1),
(2, 'Jenny', 'Berlin', 'Leipzig', '2024-06-29', '09:00:00', 'Window', 1),
(3, 'ninja', 'Munich', 'Nuremberg', '2024-07-05', '09:00:00', 'Window', 1),
(4, 'Jenny', 'Berlin', 'Cologne', '2024-07-05', '09:00:00', 'Window', 1),
(5, 'Person', 'Lahore', 'Islamabad', '2024-07-06', '09:00:00', 'Window', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `gmail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `gender`, `age`, `gmail`, `password`, `created_at`) VALUES
(1, 'admin', 'Admin', '', 0, 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '2024-06-28 15:10:28'),
(4, 'Hammad', 'Hammad Shafique', 'Male', 20, 'hammad10b1@gmail.com', '6a5822545c29592f5cc990e61dfd3f83', '2024-07-06 16:01:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city_admin_panel`
--
ALTER TABLE `city_admin_panel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_form`
--
ALTER TABLE `contact_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_admin_panel`
--
ALTER TABLE `country_admin_panel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_inter`
--
ALTER TABLE `tbl_inter`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_intra`
--
ALTER TABLE `tbl_intra`
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
-- AUTO_INCREMENT for table `city_admin_panel`
--
ALTER TABLE `city_admin_panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_form`
--
ALTER TABLE `contact_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `country_admin_panel`
--
ALTER TABLE `country_admin_panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_inter`
--
ALTER TABLE `tbl_inter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_intra`
--
ALTER TABLE `tbl_intra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
