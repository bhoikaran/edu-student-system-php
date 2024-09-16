-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2024 at 05:46 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(11) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(20) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 8979555558, 'admin@gmail.com', 'e6e061838856bf47e1de730719fb2609', '2019-10-11 04:36:52'),
(2, 'Karan', 'karan', 2323232323, 'karan@gmail.com', '349870a851c5a7a0942cd19ec716117c', '2022-06-28 20:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `tblbatch`
--

CREATE TABLE `tblbatch` (
  `ID` int(11) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `CourseName` varchar(50) DEFAULT NULL,
  `BatchName` varchar(20) DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbatch`
--

INSERT INTO `tblbatch` (`ID`, `StartDate`, `CourseName`, `BatchName`, `EndDate`, `CreationDate`) VALUES
(1, '2022-06-17', 'BCA', 'BCA2022/25', NULL, '2022-06-17 15:03:49'),
(3, '2020-06-01', 'BCA', 'BCA2020/23', NULL, '2022-06-24 13:16:15'),
(4, '2022-07-31', 'Low', 'Low2022/25', NULL, '2022-07-09 05:11:07'),
(5, '2022-07-20', 'MBA', 'MBA2022/24', NULL, '2022-07-20 07:39:30'),
(6, '2022-07-21', 'Low', 'Low2022/25', NULL, '2022-07-20 07:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblcourse`
--

CREATE TABLE `tblcourse` (
  `ID` int(11) NOT NULL,
  `CourseName` varchar(50) DEFAULT NULL,
  `Fee` bigint(20) DEFAULT NULL,
  `Tot_Years` int(11) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcourse`
--

INSERT INTO `tblcourse` (`ID`, `CourseName`, `Fee`, `Tot_Years`, `CreationDate`) VALUES
(1, 'BCA', 28000, 3, '2022-06-15 18:29:44'),
(2, 'MCA', 40000, 2, '2022-06-15 18:31:33'),
(3, 'MBA', 50000, 2, '2022-06-16 07:07:41'),
(6, 'Low', 30000, 3, '2022-07-01 07:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `tblnotice`
--

CREATE TABLE `tblnotice` (
  `ID` int(11) NOT NULL,
  `NoticeTitle` mediumtext DEFAULT NULL,
  `BatchName` varchar(20) DEFAULT NULL,
  `NoticeMsg` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblnotice`
--

INSERT INTO `tblnotice` (`ID`, `NoticeTitle`, `BatchName`, `NoticeMsg`, `CreationDate`) VALUES
(1, 'Assignment submission  ', 'BCA2022/25', 'Assignment submission on 01-07-2022', '2022-06-27 07:43:21'),
(2, 'Project Submission', 'BCA2020/23', 'Project Submission on 10-07-2022', '2022-06-27 07:50:04'),
(3, 'Assignment submission ', 'BCA2022/25', 'Kindly submit your assignment before 31-06-2022', '2022-06-28 21:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(11) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(20) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`) VALUES
(1, 'aboutus', 'About Us', '<div style=\"text-align: start;\"><span style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify; background: transparent; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-weight: bold;\">Shri Ramkrishna Seva Mandal (SRKSM)</span><span style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify;\">&nbsp;</span><span style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify;\">is a registered body under the Societies Act and was established as a public trust in the year 1954. The trust was setup under the able leadership of Late Shri Gordhanbhai Patel, popularly and respectfully known as “VakilSaheb”. And with whole hearted cooperation of the prominent citizens and leading industrialist of the area, as multi-dimensional experiment, advertising various socio-economic problems and its implications. At present, Shri Ramkrishna Seva Mandal is managing about 27 academic institutes from K.G School to Post Graduate Schools of excellence by effectively and efficiently maintaining pace with the ever-changing needs of modern educational environment.</span><br style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify;\"><span style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify;\">The</span><span style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify;\">&nbsp;</span><span style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify; background: transparent; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; font-weight: bold;\">Hon. Secretary, Mrs. Jyotsnaben K Patel&nbsp;</span><span style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify;\">is a source of inspiration by itself and her ever readiness to help by providing dynamic leadership acts as a stimulating force of growth &amp; development.</span><span style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify;\">&nbsp;</span><span style=\"color: rgb(0, 0, 0); font-family: raleway, sans-serif; letter-spacing: 0.48px; text-align: justify; background: transparent; text-decoration-line: underline; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline;\"><a href=\"http://www.srksm.org/\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"color: inherit; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; cursor: pointer;\">www.srksm.org.</a></span><br></div>', NULL, NULL, NULL),
(2, 'contactus', 'Contact Us', 'Shree Ram Krishna Seva Mandal Campus,opp. Town Hall, Anand, Gujrat 388001', 'info@aimis.ac.in', 8780038768, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpublicnotice`
--

CREATE TABLE `tblpublicnotice` (
  `ID` int(11) NOT NULL,
  `NoticeTitle` varchar(200) DEFAULT NULL,
  `NoticeMessage` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpublicnotice`
--

INSERT INTO `tblpublicnotice` (`ID`, `NoticeTitle`, `NoticeMessage`, `CreationDate`) VALUES
(1, 'School will re-open', 'Consult your class teacher.', '2022-01-20 09:11:57'),
(2, 'Test Public Notice', 'This is for Testing\r\n', '2022-02-02 19:04:10'),
(3, 'Yoga Day', 'On 21\'June 2022 we are celebrating World Yoga day in our collage please be present sharp at 7\'o clock .', '2022-06-24 10:50:08'),
(4, 'Documentaion Submittion', 'Dear student, Your last day of submission is 24/07/2022. if you will not submit your documantation on given time then your group will be desppointed from the institiute. all the work of project will give on time. Project represantatioan will be contain next month by the external faculty of GTU. so dont do the raw work be perfect and happy. \r\n\r\nThank you.......', '2022-07-21 09:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudent`
--

CREATE TABLE `tblstudent` (
  `ID` int(11) NOT NULL,
  `StudentName` varchar(200) DEFAULT NULL,
  `StudentEmail` varchar(200) DEFAULT NULL,
  `StudentBatch` varchar(100) DEFAULT NULL,
  `CourseName` varchar(100) DEFAULT NULL,
  `Semester` int(11) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `StuID` varchar(200) DEFAULT NULL,
  `FatherName` mediumtext DEFAULT NULL,
  `MotherName` mediumtext DEFAULT NULL,
  `ContactNumber` bigint(20) DEFAULT NULL,
  `AltenateNumber` bigint(20) DEFAULT NULL,
  `Address` mediumtext DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `DateofAdmission` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudent`
--

INSERT INTO `tblstudent` (`ID`, `StudentName`, `StudentEmail`, `StudentBatch`, `CourseName`, `Semester`, `Gender`, `DOB`, `StuID`, `FatherName`, `MotherName`, `ContactNumber`, `AltenateNumber`, `Address`, `UserName`, `Password`, `Image`, `DateofAdmission`) VALUES
(1, 'Karan', 'karan@gmail.com', 'BCA2022/25', 'BCA', 1, 'Male', '2001-01-08', 'kb14', 'd', 'r', 1234567890, 1111111111, '808-136, Hanumanpura, Lambhvel, Anand', 'kb14', '0b1fd8f04fe5c5405b95b193e21f69a3', 'ab40a8c91abc150aedcaca1a858ef4531656056053.jpg', '2022-06-24 07:34:13'),
(2, 'manish', 'manish@gmail.com', 'BCA2022/25', 'BCA', 1, 'Male', '2001-02-10', 'm3', 'aaa', 'bbb1234567890', 1111111111, 1111111111, 'Full Address', 'manish', '7d5cb6bbbb1f1597d65e5f58e8072e49', 'd33c32015c36e84b3250ca27f0c5fed51656174314.png', '2022-06-25 16:25:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblbatch`
--
ALTER TABLE `tblbatch`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcourse`
--
ALTER TABLE `tblcourse`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblnotice`
--
ALTER TABLE `tblnotice`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpublicnotice`
--
ALTER TABLE `tblpublicnotice`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblstudent`
--
ALTER TABLE `tblstudent`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblbatch`
--
ALTER TABLE `tblbatch`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblcourse`
--
ALTER TABLE `tblcourse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblnotice`
--
ALTER TABLE `tblnotice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblpublicnotice`
--
ALTER TABLE `tblpublicnotice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblstudent`
--
ALTER TABLE `tblstudent`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
