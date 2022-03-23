-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 05:01 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialmediaprojekt`
--

-- --------------------------------------------------------

--
-- Table structure for table `postcomments`
--

CREATE TABLE `postcomments` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `postid` int(11) DEFAULT NULL,
  `comments` varchar(1000) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postcomments`
--

INSERT INTO `postcomments` (`id`, `userid`, `postid`, `comments`, `datetime`) VALUES
(1, 1, 1, 'This is my comment on my post...', '2014-03-28 11:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `postreaction`
--

CREATE TABLE `postreaction` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `postid` int(11) DEFAULT NULL,
  `reaction` enum('Like','Heart','Care','Wow','Sad','Angry','Care') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postreaction`
--

INSERT INTO `postreaction` (`id`, `userid`, `postid`, `reaction`) VALUES
(1, 1, 1, 'Care');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `emailaddress` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `contactno` varchar(20) NOT NULL,
  `profilepic` varchar(1000) DEFAULT NULL,
  `coverpic` varchar(1000) DEFAULT NULL,
  `about` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `firstname`, `lastname`, `emailaddress`, `password`, `contactno`, `profilepic`, `coverpic`, `about`) VALUES
(1, 'John', 'Rambo', 'johnrambo01@gmail.com', '8478787', '+982565', 'urls', 'urls', 'Hello this is John rambo.');

-- --------------------------------------------------------

--
-- Table structure for table `userposts`
--

CREATE TABLE `userposts` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `posttexts` varchar(1000) NOT NULL,
  `postimages` varchar(1000) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `postvisibility` enum('Only me','Friend','Friends of Friends','Public') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userposts`
--

INSERT INTO `userposts` (`id`, `userid`, `posttexts`, `postimages`, `datetime`, `postvisibility`) VALUES
(1, 1, 'Hello people,have a nice day...', 'urls', '2014-03-27 11:48:24', 'Friend');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `postcomments`
--
ALTER TABLE `postcomments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `postid` (`postid`);

--
-- Indexes for table `postreaction`
--
ALTER TABLE `postreaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `postid` (`postid`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emailaddress` (`emailaddress`),
  ADD UNIQUE KEY `contactno` (`contactno`);

--
-- Indexes for table `userposts`
--
ALTER TABLE `userposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `postcomments`
--
ALTER TABLE `postcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `postreaction`
--
ALTER TABLE `postreaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userposts`
--
ALTER TABLE `userposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `postcomments`
--
ALTER TABLE `postcomments`
  ADD CONSTRAINT `postcomments_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userdata` (`id`),
  ADD CONSTRAINT `postcomments_ibfk_2` FOREIGN KEY (`postid`) REFERENCES `userposts` (`id`);

--
-- Constraints for table `postreaction`
--
ALTER TABLE `postreaction`
  ADD CONSTRAINT `postreaction_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userdata` (`id`),
  ADD CONSTRAINT `postreaction_ibfk_2` FOREIGN KEY (`postid`) REFERENCES `userposts` (`id`);

--
-- Constraints for table `userposts`
--
ALTER TABLE `userposts`
  ADD CONSTRAINT `userposts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userdata` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
