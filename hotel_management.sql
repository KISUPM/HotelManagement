-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2023 at 08:32 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `EID` char(10) NOT NULL,
  `Username` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `PIN` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Name` varchar(250) NOT NULL,
  `ID` char(13) NOT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `Phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ememgcontract`
--

CREATE TABLE `ememgcontract` (
  `EID` char(10) NOT NULL,
  `EmgName` varchar(250) NOT NULL,
  `EmgID` char(13) NOT NULL,
  `EmgPhone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Name` varchar(255) NOT NULL,
  `ID` char(13) NOT NULL,
  `EID` char(10) NOT NULL,
  `DoB` date NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` char(10) NOT NULL,
  `Position` varchar(255) NOT NULL,
  `StartDate` date NOT NULL,
  `Salary` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_supplies`
--

CREATE TABLE `inventory_supplies` (
  `SName` varchar(250) NOT NULL,
  `SQuantity` int(10) NOT NULL,
  `PricePerUnit` int(10) NOT NULL,
  `TotalPrice` int(10) NOT NULL,
  `Note` varchar(250) DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `RoomNumber` varchar(4) NOT NULL,
  `RoomDno` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_description`
--

CREATE TABLE `room_description` (
  `Dno` char(1) NOT NULL,
  `Price` int(10) NOT NULL,
  `GuestCap` int(1) NOT NULL,
  `BedType` char(4) NOT NULL,
  `Balcony` char(1) NOT NULL,
  `WiFi` char(1) NOT NULL,
  `TV` char(1) NOT NULL,
  `AirCondition` char(1) NOT NULL,
  `Fridge` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stay_in`
--

CREATE TABLE `stay_in` (
  `CheckInDate` date NOT NULL,
  `CheckOutDate` date NOT NULL,
  `RoomNumber` char(3) NOT NULL,
  `AmountGuest` int(1) NOT NULL,
  `StayInState` char(1) NOT NULL,
  `StayInNumber` char(9) NOT NULL,
  `CID` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Username`),
  ADD KEY `EID` (`EID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ememgcontract`
--
ALTER TABLE `ememgcontract`
  ADD PRIMARY KEY (`EmgID`),
  ADD KEY `EID` (`EID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EID`,`ID`);

--
-- Indexes for table `inventory_supplies`
--
ALTER TABLE `inventory_supplies`
  ADD PRIMARY KEY (`SName`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RoomNumber`),
  ADD KEY `RoomDno` (`RoomDno`);

--
-- Indexes for table `room_description`
--
ALTER TABLE `room_description`
  ADD PRIMARY KEY (`Dno`);

--
-- Indexes for table `stay_in`
--
ALTER TABLE `stay_in`
  ADD PRIMARY KEY (`StayInNumber`),
  ADD KEY `CID` (`CID`),
  ADD KEY `RoomNumber` (`RoomNumber`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`);

--
-- Constraints for table `ememgcontract`
--
ALTER TABLE `ememgcontract`
  ADD CONSTRAINT `ememgcontract_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`RoomDno`) REFERENCES `room_description` (`Dno`);

--
-- Constraints for table `stay_in`
--
ALTER TABLE `stay_in`
  ADD CONSTRAINT `stay_in_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `stay_in_ibfk_2` FOREIGN KEY (`RoomNumber`) REFERENCES `room` (`RoomNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
