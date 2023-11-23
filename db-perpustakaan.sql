-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2023 at 06:05 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(125) NOT NULL,
  `kategori_buku` varchar(125) NOT NULL,
  `penerbit_buku` varchar(125) NOT NULL,
  `pengarang` varchar(125) NOT NULL,
  `tahun_terbit` varchar(125) NOT NULL,
  `isbn` int(50) NOT NULL,
  `j_buku_baik` varchar(125) NOT NULL,
  `j_buku_rusak` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `kategori_buku`, `penerbit_buku`, `pengarang`, `tahun_terbit`, `isbn`, `j_buku_baik`, `j_buku_rusak`) VALUES
(1, 'Cantik Itu Luka', 'Novel ', 'Gramedia Pustaka Utama', 'Eka Kurniawan', '2002', 2147483647, '38', '2'),
(2, 'Home Sweet Loan', 'Novel ', 'Gramedia Pustaka Utama', 'Almira Bastari', '2022', 2147483647, '40', '0'),
(3, 'Heartbreak Motel', 'Novel ', 'Gramedia Pustaka Utama', 'Ika Natassa', '2022', 2147483647, '40', '0'),
(4, 'Profesi Konsultan Pajak di Indonesia', 'Majalah', 'Bintang Pustaka Madani', 'Nur Hidayat', '2021', 1, '15', '0'),
(5, 'Ensiklopedia Anak Cerdas : Olahraga', 'Ensiklopedi', 'Bhuana Ilmu Populer', 'Geraldine', '2019', 102828, '20', '0'),
(6, 'Black Showman dan Pembunuhan di Kota Tak Bernama', 'Novel ', 'Gramedia Pustaka Utama', 'Keigo Higashino', '2012', 4, '15', '1'),
(7, 'E-LIBRARY INFORMATIKA', 'Ensiklopedi', 'Erlangga', 'Henry Pandia', '2022', 30040131, '20', '0'),
(8, 'PENGANTAR SISTEM MANAJEMEN ENERGI', 'Ensiklopedi', 'Erlangga', 'Hariyanto', '2022', 2147483647, '30', '0'),
(9, 'SERI TOKOH ISLAM: RADEN FATAH', 'Ensiklopedi', 'Erlangga', 'Amir', '2022', 2147483647, '20', '0');

-- --------------------------------------------------------

--
-- Table structure for table `identitas`
--

CREATE TABLE `identitas` (
  `id_identitas` int(11) NOT NULL,
  `nama_app` varchar(50) NOT NULL,
  `alamat_app` text NOT NULL,
  `email_app` varchar(125) NOT NULL,
  `nomor_hp` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `identitas`
--

INSERT INTO `identitas` (`id_identitas`, `nama_app`, `alamat_app`, `email_app`, `nomor_hp`) VALUES
(1, 'Perpustakaan SMAN 2 Cibtiung', 'Jl.Abdul Manan, Sasak Bakar, Desa Kertamukti, Kecamatan Cibitung, Kabupaten Bekasi, Jawa Barat.', 'perpuscibitung@e-perpus.com', '089537800000');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kode_kategori` varchar(50) NOT NULL,
  `nama_kategori` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kode_kategori`, `nama_kategori`) VALUES
(1, 'KT-001', 'Novel '),
(2, 'KT-002', 'Cergam'),
(3, 'KT-003', 'Ensiklopedi'),
(4, 'KT-004', 'Biografi'),
(5, 'KT-005', 'Catatan Harian'),
(6, 'KT-006', 'Karya Ilmiah'),
(7, 'KT-007', 'Tafsir'),
(8, 'KT-008', 'Panduan (how to)'),
(9, 'KT-009', 'Majalah'),
(10, 'KT-010', 'Antologi');

-- --------------------------------------------------------

--
-- Table structure for table `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id_pemberitahuan` int(11) NOT NULL,
  `isi_pemberitahuan` varchar(255) NOT NULL,
  `level_user` varchar(125) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemberitahuan`
--

INSERT INTO `pemberitahuan` (`id_pemberitahuan`, `isi_pemberitahuan`, `level_user`, `status`) VALUES
(1, '<i class=\'fa fa-exchange\'></i> #Reza  Saputra Telah meminjam Buku', 'Admin', 'Belum dibaca'),
(2, '<i class=\'fa fa-repeat\'></i> #Reza  Saputra Telah mengembalikan Buku', 'Admin', 'Belum dibaca');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `nama_anggota` varchar(125) NOT NULL,
  `ttl` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `judul_buku` varchar(125) NOT NULL,
  `tanggal_peminjaman` varchar(125) NOT NULL,
  `tanggal_pengembalian` varchar(50) NOT NULL,
  `kondisi_buku_saat_dipinjam` varchar(125) NOT NULL,
  `kondisi_buku_saat_dikembalikan` varchar(125) NOT NULL,
  `denda` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `nama_anggota`, `ttl`, `gender`, `judul_buku`, `tanggal_peminjaman`, `tanggal_pengembalian`, `kondisi_buku_saat_dipinjam`, `kondisi_buku_saat_dikembalikan`, `denda`) VALUES
(1, 'Eza Mahardika', '', '', 'Cantik Itu Luka', '23-06-2023', '27-06-2023', 'Baik', 'Baik', 'Tidak ada'),
(2, 'Muhammad Dirwas', '', '', 'Heartbreak Motel', '24-06-2023', '28-06-2023', 'Baik', 'Baik', 'Tidak ada'),
(3, 'Ikmal Permana', '', '', 'Home Sweet Loan', '24-06-2023', '29-06-2023', 'Baik', 'Baik', 'Tidak ada'),
(4, 'Ikhas Maulana', '', '', 'Heartbreak Motel', '25-06-2023', '27-06-2023', 'Baik', 'Baik', 'Tidak ada'),
(5, 'Riana Inara', '', '', 'Ensiklopedia Anak Cerdas : Olahraga', '29-06-2023', '01-07-2023', 'Baik', 'Baik', 'Tidak ada'),
(6, 'Firman Kurniadi', '06 September 2006', 'Laki-Laki', 'E-LIBRARY INFORMATIKA', '15-08-2023', '', 'Baik', '', ''),
(7, 'Nailah Putri', '06 Agustus 2006', 'Perempuan', 'SERI TOKOH ISLAM: RADEN FATAH', '15-08-2023', '', 'Baik', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `kode_penerbit` varchar(125) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL,
  `verif_penerbit` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `kode_penerbit`, `nama_penerbit`, `verif_penerbit`) VALUES
(1, 'P001', 'Gramedia Pustaka Utama', 'Terverifikasi'),
(2, 'P002', 'Mizan Pustaka', 'Terverifikasi'),
(3, 'P003', 'Bentang Pustaka', 'Terverifikasi'),
(4, 'P004', 'Erlangga', 'Terverifikasi'),
(5, 'P005', 'Republika', 'Terverifikasi'),
(6, 'P006', 'Bintang Pustaka Madani', 'Terverifikasi'),
(7, 'P007', 'Bhuana Ilmu Populer', 'Terverifikasi');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `join_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `role`, `join_date`) VALUES
(1, 'admin', 'admin', 'Administrator', '01-06-2023'),
(2, 'admin2', 'admin2', 'Administrator', '15-08-2023');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `kode_user` varchar(25) NOT NULL,
  `nis` char(20) NOT NULL,
  `fullname` varchar(125) NOT NULL,
  `ttl` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `verif` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `join_date` varchar(125) NOT NULL,
  `terakhir_login` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `kode_user`, `nis`, `fullname`, `ttl`, `gender`, `username`, `password`, `kelas`, `alamat`, `verif`, `role`, `join_date`, `terakhir_login`) VALUES
(1, '-', '-', 'Administrator', '', '', 'admin', 'admin', '-', '-', 'Iya', 'Admin', '01-06-2023', '23-11-2023 ( 11:07:37 )'),
(2, 'AP001', '100011', 'Eza  Mahardika', '01 agustus 2006', 'laki - laki', '', '', 'X - MIPA', 'Desa Sambiroto, Kecamatan Tayu, Kabupatem Pati', 'Tidak', 'Anggota', '08-08-2022', '08-08-2022 ( 13:55:52 )'),
(3, 'AP002', '100012', 'Muhammad Dirwas', '', '', '', '', 'X - MIPA', 'Perum galaxi, Kertamukti, Kec. Cibitung, Kabupaten Bekasi.', 'Tidak', 'Anggota', '27-06-2023', ''),
(4, 'AP003', '100013', 'Ikmal Permana', '', '', '', '', 'X - IPS', 'Permata Nusa Indah Cibitung, Muktiwari, Cibitung, Bekasi Regency.', 'Tidak', 'Anggota', '28-06-2023', ''),
(6, 'AP004', '100014', 'Ikhas Maulana', '', '', '', '', 'X - IPS', 'Jl. Diamond, Muktiwari, Kec. Cibitung, Kabupaten Bekasi.', 'Tidak', 'Anggota', '01-07-2023', ''),
(7, 'AP005', '100015', 'Riana Inara', '', '', '', '', 'X - MIPA', 'Jl. KH Abdul Manan 75, Kertamukti, Kec. Cibitung, Kabupaten Bekasi.', 'Tidak', 'Anggota', '01-07-2023', ''),
(8, 'AP006', '100016', 'Nur Saadah', '', '', '', '', 'X - MIPA', 'Jl. Permata 32, Muktiwari, Kec. Cibitung, Kabupaten Bekasi.', 'Tidak', 'Anggota', '01-07-2023', ''),
(9, 'AP007', '100017', 'Gilang Kurniawan', '', '', '', '', 'XII - IPS', 'Jl. Penegak Raya 24, Kertamukti, Kec. Cibitung, Kabupaten Bekasi.', 'Tidak', 'Anggota', '01-07-2023', ''),
(10, 'AP008', '100018', 'Revan Dirwana', '', '', '', '', 'XI - IPS', 'Jl. Emerald 11, Muktiwari, Kec. Cibitung, Kabupaten Bekasi.', 'Tidak', 'Anggota', '01-07-2023', ''),
(11, 'AP009', '100019', 'Ivan Setiawan', '', '', '', '', 'XI - IPS', 'Jl. Venus I 12-21, Muktiwari, Kec. Cibitung, Kabupaten Bekasi.', 'Tidak', 'Anggota', '01-07-2023', ''),
(12, 'AP010', '100020', 'Afif Setiawan', '', '', '', '', 'XII - IPS', 'Perum galaxi, Kertamukti, Kec. Cibitung, Kabupaten Bekasi.', 'Tidak', 'Anggota', '01-07-2023', ''),
(13, 'AP011', '100021', 'Andreas Bastari', '', '', '', '', 'XII - MIPA', 'Jl. Raya Kali CBL No.12, Kertamukti, Kec. Cibitung, Kabupaten Bekasi.', 'Tidak', 'Anggota', '01-07-2023', ''),
(14, 'AP012', '0013', 'ABCD', '', '', '', '', 'X - IPS', 'Cikarang', 'Tidak', 'Anggota', '13-08-2023', ''),
(16, '-', '-', 'Administrator', '', '', 'admin2', 'admin2', '-', '-', 'Iya', 'Admin', '15-08-2023', ''),
(17, 'AP013', '100022', 'Firman Kurnaidi', '06 September 2006', 'Laki - Laki', '', '', 'XII - MIPA', 'Cibitung', 'Tidak', 'Anggota', '15-08-2023', ''),
(18, 'AP014', '100023', 'Nailah Putri', '06 Agustus 2006', 'Perempuan', '', '', 'XII - IPS', 'Cibitung', 'Tidak', 'Anggota', '15-08-2023', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `identitas`
--
ALTER TABLE `identitas`
  ADD PRIMARY KEY (`id_identitas`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id_pemberitahuan`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `identitas`
--
ALTER TABLE `identitas`
  MODIFY `id_identitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id_pemberitahuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
