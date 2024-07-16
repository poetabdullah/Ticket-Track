-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2024 at 11:53 AM
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
-- Table structure for table `tbl_inter`
--

CREATE TABLE `tbl_inter` (
  `Name_of_Passenger` varchar(50) NOT NULL,
  `Departure_Station` varchar(60) NOT NULL,
  `Arrival_Station` varchar(80) NOT NULL,
  `ID_Card` bigint(12) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Category_of_Seat` varchar(20) NOT NULL,
  `Number_of_Passengers` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_intra`
--

CREATE TABLE `tbl_intra` (
  `Name_of_Passenger` varchar(50) NOT NULL,
  `Departure_Station` varchar(60) NOT NULL,
  `Arrival_Station` varchar(80) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(10) NOT NULL,
  `Category_of_Seat` varchar(20) NOT NULL,
  `Number_of_Passengers` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_inter`
--
ALTER TABLE `tbl_inter`
  ADD PRIMARY KEY (`ID_Card`);

--
-- Indexes for table `tbl_intra`
--
ALTER TABLE `tbl_intra`
  ADD PRIMARY KEY (`Name_of_Passenger`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


------ ADMIN PANEL --------------------------------

-- Table structure for table `city_price_update`
--

CREATE TABLE `city_price_update` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `departure_city` VARCHAR(255) NOT NULL,
    `arrival_city` VARCHAR(255) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data for table `city_price_update`
--

INSERT INTO `city_price_update` (`departure_city`, `arrival_city`, `price`) VALUES
('Berlin', 'Leipzig', 30.00),
('Frankfurt', 'Cologne', 30.00),
('Munich', 'Nuremberg', 30.00),
('Hamburg', 'Bremen', 30.00),
('Stuttgart', 'Munich', 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `country_price_update`
CREATE TABLE `country_price_update` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `departure` VARCHAR(255) NOT NULL,
    `arrival` VARCHAR(255) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data for table `country_price_update`
--

INSERT INTO `country_price_update` (`departure`, `arrival`, `price`) VALUES
('Frankfurt, Germany', 'Brussels, Belgium', 80.00),
('Frankfurt, Germany', 'Amsterdam, Netherlands', 80.00),
('Amsterdam, Netherlands', 'Brussels, Belgium', 50.00);

--

--
-- Table structure for table `city_route_update`
--

CREATE TABLE `city_route_update` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `destination_city` VARCHAR(255) NOT NULL,
    `arrival_city` VARCHAR(255) NOT NULL,
    `new_destination_city` VARCHAR(255) NOT NULL,
    `new_arrival_city` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Initial data for table `city_route_update`
--

INSERT INTO `city_route_update` (`destination_city`, `arrival_city`, `new_destination_city`, `new_arrival_city`) VALUES
('Berlin', 'Leipzig', '', ''),
('Frankfurt', 'Cologne', '', ''),
('Munich', 'Nuremberg', '', ''),
('Hamburg', 'Bremen', '', ''),
('Stuttgart', 'Munich', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `country_route_update`
--

CREATE TABLE `country_route_update` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `destination` VARCHAR(255) NOT NULL,
    `arrival` VARCHAR(255) NOT NULL,
    `new_destination` VARCHAR(255) NOT NULL,
    `new_arrival` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Initial data for table `country_route_update`
--

INSERT INTO `country_route_update` (`destination`, `arrival`, `new_destination`, `new_arrival`) VALUES
('Frankfurt, Germany', 'Brussels, Belgium', '', ''),
('Frankfurt, Germany', 'Amsterdam, Netherlands', '', ''),
('Amsterdam, Netherlands', 'Brussels, Belgium', '', '');


-- Admin Panel tables:
CREATE TABLE IF NOT EXISTS city_admin_panel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    departure_city VARCHAR(255) NOT NULL,
    arrival_city VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS country_admin_panel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    departure VARCHAR(255) NOT NULL,
    arrival VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO city_admin_panel (departure_city, arrival_city, price) VALUES 
('Berlin', 'Leipzig', 30),
('Frankfurt', 'Cologne', 30),
('Munich', 'Nuremberg', 30),
('Hamburg', 'Bremen', 30),
('Stuttgart', 'Munich', 50);

INSERT INTO country_admin_panel (departure, arrival, price) VALUES 
('Frankfurt, Germany', 'Brussels, Belgium', 80),
('Frankfurt, Germany', 'Amsterdam, Netherlands', 80),
('Amsterdam, Netherlands', 'Brussels, Belgium', 50);

--- Routes tables:

-- Create tables
CREATE TABLE IntraCountryMorning (
    route_no INT,
    departure_station VARCHAR(255),
    arrival_station VARCHAR(255),
    departure_time TIME,
    arrival_time TIME,
    distance VARCHAR(255),
    fare VARCHAR(255),
    time_taken VARCHAR(255)
);

CREATE TABLE IntraCountryAfternoon (
    route_no INT,
    departure_station VARCHAR(255),
    arrival_station VARCHAR(255),
    departure_time TIME,
    arrival_time TIME,
    distance VARCHAR(255),
    fare VARCHAR(255),
    time_taken VARCHAR(255)
);

CREATE TABLE IntraCountryEvening (
    route_no INT,
    departure_station VARCHAR(255),
    arrival_station VARCHAR(255),
    departure_time TIME,
    arrival_time TIME,
    distance VARCHAR(255),
    fare VARCHAR(255),
    time_taken VARCHAR(255)
);

CREATE TABLE InterCountryMorning (
    route_no INT,
    departure_station VARCHAR(255),
    arrival_station VARCHAR(255),
    departure_time TIME,
    arrival_time TIME,
    distance VARCHAR(255),
    fare VARCHAR(255),
    time_taken VARCHAR(255)
);

CREATE TABLE InterCountryAfternoon (
    route_no INT,
    departure_station VARCHAR(255),
    arrival_station VARCHAR(255),
    departure_time TIME,
    arrival_time TIME,
    distance VARCHAR(255),
    fare VARCHAR(255),
    time_taken VARCHAR(255)
);

CREATE TABLE InterCountryEvening (
    route_no INT,
    departure_station VARCHAR(255),
    arrival_station VARCHAR(255),
    departure_time TIME,
    arrival_time TIME,
    distance VARCHAR(255),
    fare VARCHAR(255),
    time_taken VARCHAR(255)
);

-- Insert data into IntraCountryMorning
INSERT INTO IntraCountryMorning (route_no, departure_station, arrival_station, departure_time, arrival_time, distance, fare, time_taken) VALUES
(1, 'Berlin', 'Leipzig', '08:00:00', '09:00:00', '190 KM', '€30', '1 hour'),
(2, 'Frankfurt', 'Cologne', '09:00:00', '10:00:00', '190 KM', '€30', '1 hour'),
(3, 'Munich', 'Nuremberg', '09:00:00', '10:00:00', '170 KM', '€30', '1 hour'),
(4, 'Hamburg', 'Bremen', '09:00:00', '09:45:00', '120 KM', '€30', '45 minutes'),
(5, 'Stuttgart', 'Munich', '09:00:00', '11:00:00', '220 KM', '€50', '2 hours');

-- Insert data into IntraCountryAfternoon
INSERT INTO IntraCountryAfternoon (route_no, departure_station, arrival_station, departure_time, arrival_time, distance, fare, time_taken) VALUES
(1, 'Berlin', 'Leipzig', '13:00:00', '14:00:00', '190 KM', '€30', '1 hour'),
(2, 'Frankfurt', 'Cologne', '13:00:00', '14:00:00', '190 KM', '€30', '1 hour'),
(3, 'Munich', 'Nuremberg', '13:00:00', '14:00:00', '170 KM', '€30', '1 hour'),
(4, 'Hamburg', 'Bremen', '13:00:00', '13:45:00', '120 KM', '€30', '45 minutes'),
(5, 'Stuttgart', 'Munich', '13:00:00', '15:00:00', '220 KM', '€50', '2 hours');

-- Insert data into IntraCountryEvening
INSERT INTO IntraCountryEvening (route_no, departure_station, arrival_station, departure_time, arrival_time, distance, fare, time_taken) VALUES
(1, 'Berlin', 'Leipzig', '17:00:00', '18:00:00', '190 KM', '€30', '1 hour'),
(2, 'Frankfurt', 'Cologne', '17:00:00', '18:00:00', '190 KM', '€30', '1 hour'),
(3, 'Munich', 'Nuremberg', '17:00:00', '18:00:00', '170 KM', '€30', '1 hour'),
(4, 'Hamburg', 'Bremen', '17:00:00', '17:45:00', '120 KM', '€30', '45 minutes'),
(5, 'Stuttgart', 'Munich', '17:00:00', '19:00:00', '220 KM', '€50', '2 hours');

-- Insert data into InterCountryMorning
INSERT INTO InterCountryMorning (route_no, departure_station, arrival_station, departure_time, arrival_time, distance, fare, time_taken) VALUES
(1, 'Frankfurt, Germany', 'Brussels, Belgium', '08:00:00', '11:30:00', '320 KM', '€80', '3:30 hours'),
(2, 'Frankfurt, Germany', 'Amsterdam, Netherlands', '08:00:00', '12:00:00', '400 KM', '€80', '4 hours'),
(3, 'Amsterdam, Netherlands', 'Brussels, Belgium', '08:00:00', '10:00:00', '170 KM', '€50', '2 hours');

-- Insert data into InterCountryAfternoon
INSERT INTO InterCountryAfternoon (route_no, departure_station, arrival_station, departure_time, arrival_time, distance, fare, time_taken) VALUES
(1, 'Frankfurt, Germany', 'Brussels, Belgium', '12:00:00', '15:30:00', '320 KM', '€80', '3:30 hours'),
(2, 'Frankfurt, Germany', 'Amsterdam, Netherlands', '12:00:00', '16:00:00', '400 KM', '€80', '4 hours'),
(3, 'Amsterdam, Netherlands', 'Brussels, Belgium', '12:00:00', '14:00:00', '170 KM', '€50', '2 hours');

-- Insert data into InterCountryEvening
INSERT INTO InterCountryEvening (route_no, departure_station, arrival_station, departure_time, arrival_time, distance, fare, time_taken) VALUES
(1, 'Frankfurt, Germany', 'Brussels, Belgium', '16:00:00', '19:30:00', '320 KM', '€80', '3:30 hours'),
(2, 'Frankfurt, Germany', 'Amsterdam, Netherlands', '16:00:00', '20:00:00', '400 KM', '€80', '4 hours'),
(3, 'Amsterdam, Netherlands', 'Brussels, Belgium', '16:00:00', '18:00:00', '170 KM', '€50', '2 hours');
