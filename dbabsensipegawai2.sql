-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jun 2022 pada 05.21
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbabsensipegawai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `username` varchar(10) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin'),
('lana', 'lana');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblabsen`
--

CREATE TABLE `tblabsen` (
  `no` int(5) NOT NULL,
  `idpegawai` varchar(10) NOT NULL,
  `izin` varchar(4) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblabsen`
--

INSERT INTO `tblabsen` (`no`, `idpegawai`, `izin`, `tanggal`, `keterangan`) VALUES
(18, 'J3D112105', 'Cuti', '2022-06-01', 'Mudik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbljabatan`
--

CREATE TABLE `tbljabatan` (
  `idJabatan` varchar(3) NOT NULL,
  `namajabatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbljabatan`
--

INSERT INTO `tbljabatan` (`idJabatan`, `namajabatan`) VALUES
('B01', 'Manajer Pemasaran'),
('B02', 'Manajer IT'),
('B03', 'Manajer Keuangan'),
('B04', 'Manajer HRD'),
('B05', 'Manajer Produksi'),
('C01', 'Staff IT'),
('C02', 'Staff Keuangan'),
('C03', 'Staff Pemasaran'),
('C04', 'Staff HRD'),
('C05', 'Staff Produksi'),
('D01', 'Office Boy'),
('D02', 'Office Girl');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbljam`
--

CREATE TABLE `tbljam` (
  `id_jam` varchar(3) NOT NULL,
  `jam_masuk_mulai` time NOT NULL,
  `jam_kerja_mulai` time NOT NULL,
  `jam_kerja_selesai` time NOT NULL,
  `jam_keluar_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbljam`
--

INSERT INTO `tbljam` (`id_jam`, `jam_masuk_mulai`, `jam_kerja_mulai`, `jam_kerja_selesai`, `jam_keluar_selesai`) VALUES
('1', '07:30:00', '08:00:00', '15:30:00', '15:59:59'),
('2', '15:30:00', '16:00:00', '23:30:00', '23:59:59'),
('3', '23:30:00', '00:00:00', '07:30:00', '07:59:59'),
('D', '07:00:00', '08:00:00', '17:00:00', '17:59:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblkehadiran`
--

CREATE TABLE `tblkehadiran` (
  `no_rec` mediumint(10) NOT NULL,
  `idpegawai` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `jmasuk` time DEFAULT NULL,
  `jkeluar` time DEFAULT NULL,
  `id_jam` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblpegawai`
--

CREATE TABLE `tblpegawai` (
  `idpegawai` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jabatan` varchar(3) NOT NULL,
  `foto` varchar(20) NOT NULL,
  `id_jam` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblpegawai`
--

INSERT INTO `tblpegawai` (`idpegawai`, `nama`, `jabatan`, `foto`, `id_jam`) VALUES
('J3D112002', 'Ahmad', 'D01', 'avatar_09.jpg', '2'),
('J3D112026', 'Agus', 'B03', 'avatar_03.jpg', 'D'),
('J3D112029', 'Irsyad', 'C02', 'avatar_10.jpg', 'D'),
('J3D112032', 'Dewi', 'D02', 'avatar_11.jpg', 'D'),
('J3D112042', 'Aldi Akbar', 'B01', 'avatar_02.jpg', 'D'),
('J3D112062', 'Putra', 'C03', 'avatar_07.jpg', 'D'),
('J3D112066', 'Adit', 'B04', 'avatar_04.jpg', 'D'),
('J3D112081', 'Ivan', 'C05', 'avatar_04.jpg', '1'),
('J3D112092', 'Amin', 'B05', 'avatar_06.jpg', 'D'),
('J3D112093', 'Abdul', 'B02', 'avatar_01.jpg', 'D'),
('J3D112101', 'Nia', 'C05', 'avatar_01.jpg', '2'),
('J3D112105', 'Akbar', 'C04', 'avatar_08.jpg', '2'),
('J3D112114', 'Ali', 'C05', 'avatar_05.jpg', '3'),
('J3D212123', 'Tirzah', 'C01', 'avatar_12.jpg', '1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tblabsen`
--
ALTER TABLE `tblabsen`
  ADD PRIMARY KEY (`no`),
  ADD KEY `idpegawai` (`idpegawai`);

--
-- Indeks untuk tabel `tbljabatan`
--
ALTER TABLE `tbljabatan`
  ADD PRIMARY KEY (`idJabatan`);

--
-- Indeks untuk tabel `tbljam`
--
ALTER TABLE `tbljam`
  ADD PRIMARY KEY (`id_jam`);

--
-- Indeks untuk tabel `tblkehadiran`
--
ALTER TABLE `tblkehadiran`
  ADD PRIMARY KEY (`no_rec`),
  ADD KEY `id pegawai di tbl kehadiran` (`idpegawai`),
  ADD KEY `id_jam` (`id_jam`);

--
-- Indeks untuk tabel `tblpegawai`
--
ALTER TABLE `tblpegawai`
  ADD PRIMARY KEY (`idpegawai`),
  ADD KEY `jabatan` (`jabatan`),
  ADD KEY `id_jam` (`id_jam`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tblabsen`
--
ALTER TABLE `tblabsen`
  MODIFY `no` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tblkehadiran`
--
ALTER TABLE `tblkehadiran`
  MODIFY `no_rec` mediumint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tblabsen`
--
ALTER TABLE `tblabsen`
  ADD CONSTRAINT `idpegawai di absen` FOREIGN KEY (`idpegawai`) REFERENCES `tblpegawai` (`idpegawai`);

--
-- Ketidakleluasaan untuk tabel `tblkehadiran`
--
ALTER TABLE `tblkehadiran`
  ADD CONSTRAINT `id pegawai di tbl kehadiran` FOREIGN KEY (`idpegawai`) REFERENCES `tblpegawai` (`idpegawai`),
  ADD CONSTRAINT `jam di kehadiran` FOREIGN KEY (`id_jam`) REFERENCES `tbljam` (`id_jam`);

--
-- Ketidakleluasaan untuk tabel `tblpegawai`
--
ALTER TABLE `tblpegawai`
  ADD CONSTRAINT `tblpegawai_ibfk_1` FOREIGN KEY (`id_jam`) REFERENCES `tbljam` (`id_jam`),
  ADD CONSTRAINT `tblpegawai_ibfk_2` FOREIGN KEY (`jabatan`) REFERENCES `tbljabatan` (`idJabatan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
