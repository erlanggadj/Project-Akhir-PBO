-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Des 2021 pada 14.02
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `individu`
--

CREATE TABLE `individu` (
  `idNasabah` int(10) NOT NULL,
  `nik` int(100) DEFAULT NULL,
  `npwp` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `individu`
--

INSERT INTO `individu` (`idNasabah`, `nik`, `npwp`) VALUES
(1000001, 2017051034, 3434),
(1000002, 2977119, 289);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nasabah`
--

CREATE TABLE `nasabah` (
  `idNasabah` int(10) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nasabah`
--

INSERT INTO `nasabah` (`idNasabah`, `nama`, `alamat`) VALUES
(1000001, 'Annisa', 'Lampung'),
(1000002, 'Erlangga', 'Jakarta'),
(1000003, 'Kfashion', 'Jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perusahaan`
--

CREATE TABLE `perusahaan` (
  `idNasabah` int(10) NOT NULL,
  `nib` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `perusahaan`
--

INSERT INTO `perusahaan` (`idNasabah`, `nib`) VALUES
(1000003, '20182');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `no_rekening` int(10) NOT NULL,
  `saldo` double(16,2) DEFAULT NULL,
  `idNasabah` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`no_rekening`, `saldo`, `idNasabah`) VALUES
(100000101, 120000.00, 1000001),
(100000102, 90000.00, 1000001),
(100000201, 100000.00, 1000002),
(100000202, 20000.00, 1000002),
(100000301, 15000.00, 1000003);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `individu`
--
ALTER TABLE `individu`
  ADD PRIMARY KEY (`idNasabah`);

--
-- Indeks untuk tabel `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`idNasabah`);

--
-- Indeks untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`idNasabah`);

--
-- Indeks untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`no_rekening`),
  ADD KEY `idNasabah` (`idNasabah`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `individu`
--
ALTER TABLE `individu`
  ADD CONSTRAINT `individu_ibfk_1` FOREIGN KEY (`idNasabah`) REFERENCES `nasabah` (`idNasabah`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD CONSTRAINT `perusahaan_ibfk_1` FOREIGN KEY (`idNasabah`) REFERENCES `nasabah` (`idNasabah`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD CONSTRAINT `rekening_ibfk_1` FOREIGN KEY (`idNasabah`) REFERENCES `nasabah` (`idNasabah`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
