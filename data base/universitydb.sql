-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2026 at 09:57 PM
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
-- Database: `universitydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Course_Code` varchar(10) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Dept_ID` int(11) DEFAULT NULL,
  `Pre_Req_Code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Course_Code`, `Title`, `Dept_ID`, `Pre_Req_Code`) VALUES
('BUS1', 'Econ', 5, NULL),
('BUS2', 'Mgmt', 5, 'BUS1'),
('CS101', 'Intro CS', 1, NULL),
('CS102', 'Data Struct', 1, 'CS101'),
('ENG1', 'Eng I', 4, NULL),
('ENG2', 'Eng II', 4, 'ENG1'),
('MATH1', 'Calc I', 2, NULL),
('MATH2', 'Calc II', 2, 'MATH1'),
('PHYS1', 'Phys I', 3, NULL),
('PHYS2', 'Phys II', 3, 'PHYS1');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `Dept_ID` int(11) NOT NULL,
  `Dept_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`Dept_ID`, `Dept_Name`) VALUES
(5, 'Business'),
(1, 'CS'),
(4, 'Engineering'),
(2, 'Math'),
(3, 'Physics');

-- --------------------------------------------------------

--
-- Table structure for table `dependents`
--

CREATE TABLE `dependents` (
  `Dep_ID` int(11) NOT NULL,
  `Student_ID` int(11) DEFAULT NULL,
  `Dep_Name` varchar(100) NOT NULL,
  `Relationship` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dependents`
--

INSERT INTO `dependents` (`Dep_ID`, `Student_ID`, `Dep_Name`, `Relationship`) VALUES
(1, 101, 'Ali', 'Father'),
(2, 102, 'Mona', 'Mother');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `Student_ID` int(11) NOT NULL,
  `Course_Code` varchar(10) NOT NULL,
  `Enrollment_Date` date NOT NULL,
  `Grade` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`Student_ID`, `Course_Code`, `Enrollment_Date`, `Grade`) VALUES
(101, 'CS101', '2023-09-01', 'A'),
(101, 'ENG1', '2023-09-01', 'A'),
(101, 'MATH1', '2023-09-01', 'B'),
(101, 'PHYS1', '2023-09-01', 'A'),
(102, 'CS101', '2023-09-01', 'B'),
(102, 'ENG1', '2023-09-01', 'B'),
(102, 'MATH1', '2023-09-01', 'C'),
(103, 'CS101', '2023-09-01', 'A'),
(103, 'CS102', '2023-09-01', 'B'),
(104, 'CS101', '2023-09-01', 'A'),
(104, 'MATH2', '2023-09-01', 'A'),
(105, 'BUS1', '2023-09-01', 'A'),
(105, 'CS101', '2023-09-01', 'C'),
(106, 'BUS2', '2023-09-01', 'B'),
(106, 'PHYS1', '2023-09-01', 'B'),
(107, 'CS101', '2023-09-01', 'A'),
(107, 'ENG2', '2023-09-01', 'A'),
(108, 'MATH1', '2023-09-01', 'B'),
(109, 'CS101', '2023-09-01', 'A'),
(110, 'CS102', '2023-09-01', 'C'),
(111, 'CS101', '2023-09-01', 'B'),
(112, 'MATH1', '2023-09-01', 'A'),
(113, 'PHYS1', '2023-09-01', 'B'),
(114, 'CS101', '2023-09-01', 'C'),
(115, 'CS102', '2023-09-01', 'A'),
(116, 'MATH1', '2023-09-01', 'B'),
(117, 'CS101', '2023-09-01', 'A'),
(118, 'PHYS1', '2023-09-01', 'B'),
(119, 'CS101', '2023-09-01', 'A'),
(120, 'CS102', '2023-09-01', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `Instructor_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Salary` decimal(10,2) DEFAULT NULL CHECK (`Salary` > 0),
  `Dept_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`Instructor_ID`, `Name`, `Salary`, `Dept_ID`) VALUES
(1, 'Dr. A', 15000.00, 1),
(2, 'Dr. B', 14000.00, 1),
(3, 'Dr. C', 13000.00, 1),
(4, 'Dr. D', 16000.00, 1),
(5, 'Dr. E', 12000.00, 2),
(6, 'Dr. F', 12500.00, 2),
(7, 'Dr. G', 13500.00, 2),
(8, 'Dr. H', 14000.00, 2),
(9, 'Dr. I', 11000.00, 3),
(10, 'Dr. J', 11500.00, 3),
(11, 'Dr. K', 15500.00, 4),
(12, 'Dr. L', 16500.00, 4),
(13, 'Dr. M', 17000.00, 4),
(14, 'Dr. N', 15800.00, 4),
(15, 'Dr. O', 10000.00, 5),
(16, 'Dr. P', 10500.00, 5),
(17, 'Dr. Q', 11200.00, 5),
(18, 'Dr. R', 11800.00, 1),
(19, 'Dr. S', 12200.00, 2),
(20, 'Dr. T', 14000.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Student_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Student_ID`, `Name`, `City`) VALUES
(101, 'Ahmed', 'Cairo'),
(102, 'Sara', 'Alex'),
(103, 'Mona', 'Giza'),
(104, 'Ali', 'Cairo'),
(105, 'Omar', 'Tanta'),
(106, 'Noor', 'Alex'),
(107, 'Zaid', 'Cairo'),
(108, 'Huda', 'Giza'),
(109, 'Samy', 'Suez'),
(110, 'Fady', 'Cairo'),
(111, 'Amira', 'Alex'),
(112, 'Laila', 'Giza'),
(113, 'Ramy', 'Cairo'),
(114, 'Yara', 'Tanta'),
(115, 'Adel', 'Suez'),
(116, 'Eman', 'Cairo'),
(117, 'Iyad', 'Alex'),
(118, 'Jana', 'Giza'),
(119, 'Karem', 'Cairo'),
(120, 'Maya', 'Tanta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Course_Code`),
  ADD KEY `Dept_ID` (`Dept_ID`),
  ADD KEY `Pre_Req_Code` (`Pre_Req_Code`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`Dept_ID`),
  ADD UNIQUE KEY `Dept_Name` (`Dept_Name`);

--
-- Indexes for table `dependents`
--
ALTER TABLE `dependents`
  ADD PRIMARY KEY (`Dep_ID`),
  ADD KEY `Student_ID` (`Student_ID`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`Student_ID`,`Course_Code`),
  ADD KEY `Course_Code` (`Course_Code`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`Instructor_ID`),
  ADD KEY `Dept_ID` (`Dept_ID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Student_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `departments` (`Dept_ID`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`Pre_Req_Code`) REFERENCES `courses` (`Course_Code`);

--
-- Constraints for table `dependents`
--
ALTER TABLE `dependents`
  ADD CONSTRAINT `dependents_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`Course_Code`) REFERENCES `courses` (`Course_Code`);

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `departments` (`Dept_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
