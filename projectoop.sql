-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2023 at 08:13 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectoop`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `id_lapangan` int(11) NOT NULL,
  `jadwal_booking` date NOT NULL,
  `jam` enum('01.00 - 02.00 pm','02.00 - 03.00 pm','03.00 - 04.00 pm','04.00 - 05.00 pm') NOT NULL,
  `status` enum('Available','Not Available') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `id_lapangan`, `jadwal_booking`, `jam`, `status`) VALUES
(10, 6, '2023-06-22', '01.00 - 02.00 pm', 'Available'),
(12, 4, '2023-06-23', '02.00 - 03.00 pm', 'Not Available'),
(13, 7, '2023-06-22', '04.00 - 05.00 pm', 'Available'),
(14, 2, '2023-06-23', '01.00 - 02.00 pm', 'Available'),
(15, 2, '2023-06-24', '03.00 - 04.00 pm', 'Not Available'),
(16, 4, '2023-06-25', '02.00 - 03.00 pm', 'Not Available'),
(19, 7, '2023-10-26', '01.00 - 02.00 pm', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `lapangan`
--

CREATE TABLE `lapangan` (
  `id` int(11) NOT NULL,
  `nama_lapangan` varchar(50) NOT NULL,
  `biaya_sewa` varchar(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lapangan`
--

INSERT INTO `lapangan` (`id`, `nama_lapangan`, `biaya_sewa`, `keterangan`) VALUES
(2, 'Badminton', 'Rp40.000 / hour', 'field Length = 13.40 meter\r\nField Width  = 6.10 meter\r\nNet Height   = 1.524 meter\r\nNet Length   = 6.10 meter\r\nNet Width    = 0.75 meter'),
(4, 'Table Tennis', 'Rp20.000 / hour', 'Table Tennis length = 2.74 meter\r\nTable Tennis width  = 1.525 meter\r\nTable Tennis height = 76 cm (from the ground)\r\nTable area	    = 4.1785 m²'),
(6, 'Volly', 'Rp 70.000 / hour', 'Field Length = 18 meter\r\nField Width  = 9 meter\r\nService Area = 3 meter\r\nNet Height   = 2.24 meter\r\nNet Width    = 1 meter\r\nNet Length   = 9 meter'),
(7, 'Basketball', 'Rp 150.000 / hour', 'Field Length           = 28 meter\r\nField Width            = 15 meter\r\nCenter Circle Diameter = 3,6 meter\r\nRing Height	       = 3,05 meter\r\nArc Radius	       = 1,25 meter\r\nFree Throw Distance    = 4,6 meter\r\nLine Width	       = 5 cm');

-- --------------------------------------------------------

--
-- Table structure for table `penyewaan`
--

CREATE TABLE `penyewaan` (
  `id` int(11) NOT NULL,
  `id_penyewa` int(11) NOT NULL,
  `id_lapangan` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `kode_booking` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyewaan`
--

INSERT INTO `penyewaan` (`id`, `id_penyewa`, `id_lapangan`, `id_jadwal`, `kode_booking`) VALUES
(21, 12, 2, 14, 'PY005'),
(22, 15, 2, 15, 'PY006'),
(23, 15, 2, 15, 'PY007'),
(24, 16, 6, 10, 'PY008'),
(25, 17, 7, 13, 'PY009');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` enum('Admin','Renter') NOT NULL DEFAULT 'Renter'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `level`) VALUES
(12, 'Hatta Abdillah', 'mhmhatta', 'f5bb0c8de146c67b44babbf4e6584cc0', 'Renter'),
(13, 'Admin', 'admin123', 'f5bb0c8de146c67b44babbf4e6584cc0', 'Admin'),
(15, 'Stia', 'Stia Adjie', 'f5bb0c8de146c67b44babbf4e6584cc0', 'Renter'),
(16, 'Hatta Abdillahi', 'hattaabd', 'f5bb0c8de146c67b44babbf4e6584cc0', 'Renter'),
(17, 'Felix', 'felix123', 'f5bb0c8de146c67b44babbf4e6584cc0', 'Renter');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lapangan` (`id_lapangan`);

--
-- Indexes for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_booking` (`kode_booking`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `id_lapangan` (`id_lapangan`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lapangan`
--
ALTER TABLE `lapangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `penyewaan`
--
ALTER TABLE `penyewaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `id_lapangan` FOREIGN KEY (`id_lapangan`) REFERENCES `lapangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD CONSTRAINT `jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lapangan` FOREIGN KEY (`id_lapangan`) REFERENCES `lapangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penyewa` FOREIGN KEY (`id_penyewa`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
