-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 25, 2019 at 04:19 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdmgi`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `IdAdmin` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(125) NOT NULL,
  `NamaLengkap` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`IdAdmin`, `Username`, `Password`, `NamaLengkap`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `bis`
--

CREATE TABLE `bis` (
  `IdBis` int(11) NOT NULL,
  `IdJadwal` int(11) NOT NULL,
  `IdBisJenis` int(11) NOT NULL,
  `NamaBis` varchar(30) NOT NULL,
  `Harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bis`
--

INSERT INTO `bis` (`IdBis`, `IdJadwal`, `IdBisJenis`, `NamaBis`, `Harga`) VALUES
(1, 1, 1, 'MGI-EK-BDGDPK-1', 90000),
(2, 2, 1, 'MGI-EK-BDGDPK-2', 90000);

-- --------------------------------------------------------

--
-- Table structure for table `bisjenis`
--

CREATE TABLE `bisjenis` (
  `IdBisJenis` int(11) NOT NULL,
  `NamaJenis` varchar(15) DEFAULT NULL,
  `Kapasitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bisjenis`
--

INSERT INTO `bisjenis` (`IdBisJenis`, `NamaJenis`, `Kapasitas`) VALUES
(1, 'Ekonomi', 25),
(2, 'Eksekutif', 30),
(3, 'Bisnis', 35);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `IdJadwal` int(11) NOT NULL,
  `IdRute` int(11) NOT NULL,
  `Waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`IdJadwal`, `IdRute`, `Waktu`) VALUES
(1, 1, '05:00:00'),
(2, 1, '07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kursi`
--

CREATE TABLE `kursi` (
  `IdKursi` int(11) NOT NULL,
  `IdBis` int(11) NOT NULL,
  `NoKursi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `IdPembayaran` int(11) NOT NULL,
  `IdPemesanan` int(11) NOT NULL,
  `TotalBayar` int(7) NOT NULL,
  `Status` enum('Lunas','Belum Lunas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemesan`
--

CREATE TABLE `pemesan` (
  `NoIdentitas` int(11) NOT NULL,
  `NamaPemesan` varchar(30) NOT NULL,
  `Umur` char(2) NOT NULL,
  `JenisKelamin` enum('L','P') NOT NULL,
  `NoTelepon` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `IdPemesanan` int(11) NOT NULL,
  `NoIdentitas` int(11) NOT NULL,
  `IdBis` int(11) NOT NULL,
  `IdAdmin` int(11) NOT NULL,
  `JumlahPenumpang` int(11) NOT NULL,
  `TanggalPesan` date NOT NULL,
  `TanggalBerangkat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_kursi`
--

CREATE TABLE `pemesanan_kursi` (
  `IdPemesananKursi` int(11) NOT NULL,
  `IdPemesanan` int(11) NOT NULL,
  `IdKursi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rute`
--

CREATE TABLE `rute` (
  `IdRute` int(11) NOT NULL,
  `Asal` varchar(20) NOT NULL,
  `Tujuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rute`
--

INSERT INTO `rute` (`IdRute`, `Asal`, `Tujuan`) VALUES
(1, 'Bandung', 'Depok'),
(2, 'Depok', 'Bandung'),
(3, 'Bandung', 'Bogor'),
(4, 'Bogor', 'Bandung'),
(5, 'Bandung', 'Jakarta'),
(6, 'Jakarta', 'Bandung'),
(7, 'Bandung', 'Sukabumi'),
(8, 'Sukabumi', 'Bandung');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`IdAdmin`);

--
-- Indexes for table `bis`
--
ALTER TABLE `bis`
  ADD PRIMARY KEY (`IdBis`),
  ADD KEY `IdJadwal` (`IdJadwal`),
  ADD KEY `IdBisJenis` (`IdBisJenis`);

--
-- Indexes for table `bisjenis`
--
ALTER TABLE `bisjenis`
  ADD PRIMARY KEY (`IdBisJenis`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`IdJadwal`),
  ADD KEY `IdRute` (`IdRute`);

--
-- Indexes for table `kursi`
--
ALTER TABLE `kursi`
  ADD PRIMARY KEY (`IdKursi`),
  ADD KEY `IdBis` (`IdBis`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`IdPembayaran`),
  ADD KEY `IdPemesanan` (`IdPemesanan`);

--
-- Indexes for table `pemesan`
--
ALTER TABLE `pemesan`
  ADD PRIMARY KEY (`NoIdentitas`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`IdPemesanan`),
  ADD KEY `IdAdmin` (`IdAdmin`),
  ADD KEY `IdBis` (`IdBis`),
  ADD KEY `NoIdentitas` (`NoIdentitas`);

--
-- Indexes for table `pemesanan_kursi`
--
ALTER TABLE `pemesanan_kursi`
  ADD PRIMARY KEY (`IdPemesananKursi`),
  ADD KEY `IdPemesanan` (`IdPemesanan`),
  ADD KEY `IdKursi` (`IdKursi`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`IdRute`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `IdAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bis`
--
ALTER TABLE `bis`
  MODIFY `IdBis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bisjenis`
--
ALTER TABLE `bisjenis`
  MODIFY `IdBisJenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `IdJadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kursi`
--
ALTER TABLE `kursi`
  MODIFY `IdKursi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `IdPembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemesan`
--
ALTER TABLE `pemesan`
  MODIFY `NoIdentitas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `IdPemesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemesanan_kursi`
--
ALTER TABLE `pemesanan_kursi`
  MODIFY `IdPemesananKursi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rute`
--
ALTER TABLE `rute`
  MODIFY `IdRute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bis`
--
ALTER TABLE `bis`
  ADD CONSTRAINT `bis_ibfk_1` FOREIGN KEY (`IdJadwal`) REFERENCES `jadwal` (`IdJadwal`),
  ADD CONSTRAINT `bis_ibfk_2` FOREIGN KEY (`IdBisJenis`) REFERENCES `bisjenis` (`IdBisJenis`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`IdRute`) REFERENCES `rute` (`IdRute`);

--
-- Constraints for table `kursi`
--
ALTER TABLE `kursi`
  ADD CONSTRAINT `kursi_ibfk_1` FOREIGN KEY (`IdBis`) REFERENCES `bis` (`IdBis`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`IdPemesanan`) REFERENCES `pemesanan` (`IdPemesanan`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`IdAdmin`) REFERENCES `admin` (`IdAdmin`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`IdBis`) REFERENCES `bis` (`IdBis`),
  ADD CONSTRAINT `pemesanan_ibfk_3` FOREIGN KEY (`NoIdentitas`) REFERENCES `pemesan` (`NoIdentitas`);

--
-- Constraints for table `pemesanan_kursi`
--
ALTER TABLE `pemesanan_kursi`
  ADD CONSTRAINT `pemesanan_kursi_ibfk_1` FOREIGN KEY (`IdPemesanan`) REFERENCES `pemesanan` (`IdPemesanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
