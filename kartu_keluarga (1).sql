-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jun 2020 pada 04.15
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kartu_keluarga`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `nama`, `email`, `username`, `password`, `created_at`, `deleted_at`) VALUES
(1, 'Admin 1', 'admin1@gmail.com', 'admin1', 'admin1', '2020-06-07 09:12:33', NULL),
(2, 'Admin 2', 'admin2@gmail.com', 'admin2', 'admin2', '2020-06-07 09:12:33', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluarga`
--

CREATE TABLE `keluarga` (
  `id` bigint(16) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `rt` varchar(3) NOT NULL,
  `rw` varchar(3) NOT NULL,
  `desa` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kode_pos` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_admin` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keluarga`
--

INSERT INTO `keluarga` (`id`, `alamat`, `rt`, `rw`, `desa`, `kecamatan`, `kabupaten`, `provinsi`, `kode_pos`, `created_at`, `updated_at`, `deleted_at`, `id_admin`) VALUES
(3322172908083329, 'Jalan Maerasari', '003', '009', 'Bukit Harum', 'Menthobi Raya', 'Lamandau', 'Kalimantan Tengah', 74165, '2020-06-07 09:19:20', NULL, NULL, 1),
(3322172931283000, 'Jalan Makarti', '009', '001', 'Bukit raya', 'Tembalang', 'Semarang', 'Jawa Tengah', 50122, '2020-06-07 09:19:20', NULL, NULL, 1),
(3322172931313333, 'Jalan Pangandaran', '009', '001', 'Nanga Bulik', 'Rawasari', 'Kotawaringin Barat', 'Kalimantan Timur', 50111, '2020-06-07 09:19:20', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kk`
--

CREATE TABLE `kk` (
  `id` int(11) NOT NULL,
  `id_keluarga` bigint(16) NOT NULL,
  `id_warga` bigint(16) NOT NULL,
  `keterangan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kk`
--

INSERT INTO `kk` (`id`, `id_keluarga`, `id_warga`, `keterangan`) VALUES
(1, 3322172908083329, 620901882276755, 1),
(2, 3322172931283000, 620901882211155, 3),
(3, 3322172931283000, 9766738726541255, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `warga`
--

CREATE TABLE `warga` (
  `nik` bigint(16) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `golongan_darah` varchar(2) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `status_perkawinan` int(1) NOT NULL,
  `pekerjaan` varchar(15) NOT NULL,
  `kewarganegaraan` varchar(3) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `rt` varchar(3) NOT NULL,
  `rw` varchar(3) NOT NULL,
  `desa` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `ayah` varchar(50) NOT NULL,
  `ibu` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_admin` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `warga`
--

INSERT INTO `warga` (`nik`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `golongan_darah`, `agama`, `status_perkawinan`, `pekerjaan`, `kewarganegaraan`, `alamat`, `rt`, `rw`, `desa`, `kecamatan`, `kabupaten`, `provinsi`, `ayah`, `ibu`, `created_at`, `updated_at`, `deleted_at`, `id_admin`) VALUES
(620901882211155, 'Barti', 'Lamandau', '2004-06-03', 'Laki Laki', 'AB', 'Islam', 0, 'Pelajar', 'WNI', 'Jalan Blangiran', '008', '009', 'Bukit Manunggal', 'Sematu Jaya', 'Lamandau', 'Kalimantan Tengah', 'Bambang', 'Hartati', '2020-06-07 09:23:42', NULL, NULL, 1),
(620901882276755, 'Aswin Setiawan', 'Pangkalan Bun', '1997-06-09', 'Laki Laki', 'O', 'Islam', 0, 'Pelajar', 'WNI', 'Jalan Thamrin', '002', '001', 'Kembangsari', 'Semarang Tengah', 'Semarang', 'Jawa Tengah', 'Bambang', 'Hartati', '2020-06-07 09:23:42', NULL, NULL, 1),
(9766738726541255, 'Karim', 'Jakarta', '2006-06-03', 'Laki Laki', 'O', 'Islam', 0, 'Pelajar', 'WNI', 'Jalan Blangiran', '008', '009', 'Bukit Manunggal', 'Sematu Jaya', 'Lamandau', 'Kalimantan Tengah', 'Bambang', 'Hartati', '2020-06-07 09:23:42', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_admin` (`id_admin`);

--
-- Indeks untuk tabel `kk`
--
ALTER TABLE `kk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_keluarga` (`id_keluarga`),
  ADD KEY `foreign_warga` (`id_warga`);

--
-- Indeks untuk tabel `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `foreign_admin_1` (`id_admin`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kk`
--
ALTER TABLE `kk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `warga`
--
ALTER TABLE `warga`
  MODIFY `nik` bigint(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9766738726541256;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `keluarga`
--
ALTER TABLE `keluarga`
  ADD CONSTRAINT `foreign_admin` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`);

--
-- Ketidakleluasaan untuk tabel `kk`
--
ALTER TABLE `kk`
  ADD CONSTRAINT `foreign_keluarga` FOREIGN KEY (`id_keluarga`) REFERENCES `keluarga` (`id`),
  ADD CONSTRAINT `foreign_warga` FOREIGN KEY (`id_warga`) REFERENCES `warga` (`nik`);

--
-- Ketidakleluasaan untuk tabel `warga`
--
ALTER TABLE `warga`
  ADD CONSTRAINT `foreign_admin_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
