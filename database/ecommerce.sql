-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2020 pada 10.05
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `cust_id` char(5) NOT NULL,
  `cust_name` varchar(25) NOT NULL,
  `cust_address` varchar(30) DEFAULT NULL,
  `cust_city` varchar(25) DEFAULT NULL,
  `cust_state` varchar(5) DEFAULT NULL,
  `cust_zip` varchar(5) DEFAULT NULL,
  `cust_country` varchar(20) DEFAULT NULL,
  `cust_contact` varchar(25) DEFAULT NULL,
  `cust_email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orderitems`
--

CREATE TABLE `orderitems` (
  `order_num` int(11) NOT NULL,
  `order_item` int(11) NOT NULL,
  `prod_id` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_num` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `cust_id` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `productnotes`
--

CREATE TABLE `productnotes` (
  `note_id` char(3) NOT NULL,
  `prod_id` varchar(10) NOT NULL,
  `note_date` date NOT NULL,
  `note_text` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `prod_id` varchar(10) NOT NULL,
  `vend_id` char(4) NOT NULL,
  `prod_name` varchar(25) NOT NULL,
  `prod_price` int(11) NOT NULL,
  `prod_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nama`, `email`, `username`, `password`) VALUES
(2, 'Nuno Akbar', 'nuno@gmail.com', 'nunoakbar', '0192023a7bbd73250516f069df18b500'),
(1, 'Noor Faizin', 'faiz.jetak@gmail.com', 'noorfaizin', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'Muhammad Solahudin Al Faruq', 'alfaruqsdaga@gmail.com', 'alfafaruq', 'c9b7304d755da98d0c885e9c7d4eca29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `vendors`
--

CREATE TABLE `vendors` (
  `vend_id` char(4) NOT NULL,
  `vend_name` varchar(25) NOT NULL,
  `vend_address` varchar(30) DEFAULT NULL,
  `vend_city` varchar(20) DEFAULT NULL,
  `vend_state` varchar(5) DEFAULT NULL,
  `vend_zip` varchar(7) DEFAULT NULL,
  `vend_country` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indeks untuk tabel `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`order_num`,`order_item`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_num`);

--
-- Indeks untuk tabel `productnotes`
--
ALTER TABLE `productnotes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`password`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`vend_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `productnotes`
--
ALTER TABLE `productnotes`
  ADD CONSTRAINT `productnotes_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
