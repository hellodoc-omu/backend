-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: db
-- Üretim Zamanı: 08 Oca 2023, 09:40:47
-- Sunucu sürümü: 8.0.31
-- PHP Sürümü: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `hellodoc`
--
CREATE DATABASE IF NOT EXISTS `hellodoc` DEFAULT CHARACTER SET utf16 COLLATE utf16_turkish_ci;
USE `hellodoc`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `AnaBilimDali`
--

CREATE TABLE `AnaBilimDali` (
  `abdNo` int NOT NULL,
  `abdIsim` varchar(255) COLLATE utf16_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Bildirim`
--

CREATE TABLE `Bildirim` (
  `bNo` int NOT NULL,
  `bIcerik` text COLLATE utf16_turkish_ci NOT NULL,
  `dNo` int NOT NULL,
  `hNo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Degerlendirme`
--

CREATE TABLE `Degerlendirme` (
  `deNo` int NOT NULL,
  `deIcerik` text COLLATE utf16_turkish_ci NOT NULL,
  `dePuan` tinyint NOT NULL,
  `deUzNo` int NOT NULL,
  `dNo` int NOT NULL,
  `hNo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Doktor`
--

CREATE TABLE `Doktor` (
  `dNo` int NOT NULL,
  `kNo` int NOT NULL,
  `kuNo` int NOT NULL,
  `fNo` int NOT NULL,
  `abdNo` int NOT NULL,
  `uzNo` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Fakulte`
--

CREATE TABLE `Fakulte` (
  `fNo` int NOT NULL,
  `fIsim` varchar(255) COLLATE utf16_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hasta`
--

CREATE TABLE `Hasta` (
  `hNo` int NOT NULL,
  `kNo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Kisi`
--

CREATE TABLE `Kisi` (
  `kNo` int NOT NULL,
  `KIsim` varchar(255) COLLATE utf16_turkish_ci NOT NULL,
  `kSoyIsim` varchar(255) COLLATE utf16_turkish_ci NOT NULL,
  `kAvatar` blob,
  `kMail` varchar(255) COLLATE utf16_turkish_ci NOT NULL,
  `kSifre` varchar(255) COLLATE utf16_turkish_ci NOT NULL,
  `kCinsiyet` varchar(255) COLLATE utf16_turkish_ci NOT NULL,
  `kOnline` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Kurum`
--

CREATE TABLE `Kurum` (
  `kuNo` int NOT NULL,
  `kuIsim` varchar(255) COLLATE utf16_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Mesaj`
--

CREATE TABLE `Mesaj` (
  `mNo` int NOT NULL,
  `mIcerik` varchar(255) COLLATE utf16_turkish_ci NOT NULL,
  `mResim` blob,
  `mDosya` blob,
  `mTarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dNo` int NOT NULL,
  `dUzNo` int NOT NULL,
  `hNo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Uzmanlik`
--

CREATE TABLE `Uzmanlik` (
  `uzNo` int NOT NULL,
  `uzIsim` varchar(255) COLLATE utf16_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Yardim`
--

CREATE TABLE `Yardim` (
  `yNo` int NOT NULL,
  `ySoru` varchar(255) COLLATE utf16_turkish_ci NOT NULL,
  `yCevap` varchar(255) COLLATE utf16_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `AnaBilimDali`
--
ALTER TABLE `AnaBilimDali`
  ADD PRIMARY KEY (`abdNo`);

--
-- Tablo için indeksler `Bildirim`
--
ALTER TABLE `Bildirim`
  ADD PRIMARY KEY (`bNo`),
  ADD KEY `dNo` (`dNo`),
  ADD KEY `hNo` (`hNo`);

--
-- Tablo için indeksler `Degerlendirme`
--
ALTER TABLE `Degerlendirme`
  ADD PRIMARY KEY (`deNo`),
  ADD KEY `deUzNo` (`deUzNo`),
  ADD KEY `dNo` (`dNo`),
  ADD KEY `hNo` (`hNo`);

--
-- Tablo için indeksler `Doktor`
--
ALTER TABLE `Doktor`
  ADD PRIMARY KEY (`dNo`),
  ADD KEY `kNo` (`kNo`),
  ADD KEY `kuNo` (`kuNo`),
  ADD KEY `fNo` (`fNo`),
  ADD KEY `abdNo` (`abdNo`);

--
-- Tablo için indeksler `Fakulte`
--
ALTER TABLE `Fakulte`
  ADD PRIMARY KEY (`fNo`);

--
-- Tablo için indeksler `Hasta`
--
ALTER TABLE `Hasta`
  ADD PRIMARY KEY (`hNo`),
  ADD KEY `kNo` (`kNo`);

--
-- Tablo için indeksler `Kisi`
--
ALTER TABLE `Kisi`
  ADD PRIMARY KEY (`kNo`);

--
-- Tablo için indeksler `Kurum`
--
ALTER TABLE `Kurum`
  ADD PRIMARY KEY (`kuNo`);

--
-- Tablo için indeksler `Mesaj`
--
ALTER TABLE `Mesaj`
  ADD PRIMARY KEY (`mNo`),
  ADD KEY `dNo` (`dNo`),
  ADD KEY `dUzNo` (`dUzNo`),
  ADD KEY `hNo` (`hNo`);

--
-- Tablo için indeksler `Uzmanlik`
--
ALTER TABLE `Uzmanlik`
  ADD PRIMARY KEY (`uzNo`);

--
-- Tablo için indeksler `Yardim`
--
ALTER TABLE `Yardim`
  ADD PRIMARY KEY (`yNo`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `AnaBilimDali`
--
ALTER TABLE `AnaBilimDali`
  MODIFY `abdNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Bildirim`
--
ALTER TABLE `Bildirim`
  MODIFY `bNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Doktor`
--
ALTER TABLE `Doktor`
  MODIFY `dNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Fakulte`
--
ALTER TABLE `Fakulte`
  MODIFY `fNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Hasta`
--
ALTER TABLE `Hasta`
  MODIFY `hNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Kisi`
--
ALTER TABLE `Kisi`
  MODIFY `kNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Kurum`
--
ALTER TABLE `Kurum`
  MODIFY `kuNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Mesaj`
--
ALTER TABLE `Mesaj`
  MODIFY `mNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Uzmanlik`
--
ALTER TABLE `Uzmanlik`
  MODIFY `uzNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Yardim`
--
ALTER TABLE `Yardim`
  MODIFY `yNo` int NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `Bildirim`
--
ALTER TABLE `Bildirim`
  ADD CONSTRAINT `Bildirim_ibfk_1` FOREIGN KEY (`dNo`) REFERENCES `Doktor` (`dNo`),
  ADD CONSTRAINT `Bildirim_ibfk_2` FOREIGN KEY (`hNo`) REFERENCES `Hasta` (`hNo`);

--
-- Tablo kısıtlamaları `Degerlendirme`
--
ALTER TABLE `Degerlendirme`
  ADD CONSTRAINT `Degerlendirme_ibfk_1` FOREIGN KEY (`deUzNo`) REFERENCES `Uzmanlik` (`uzNo`),
  ADD CONSTRAINT `Degerlendirme_ibfk_2` FOREIGN KEY (`dNo`) REFERENCES `Doktor` (`dNo`),
  ADD CONSTRAINT `Degerlendirme_ibfk_3` FOREIGN KEY (`hNo`) REFERENCES `Hasta` (`hNo`);

--
-- Tablo kısıtlamaları `Doktor`
--
ALTER TABLE `Doktor`
  ADD CONSTRAINT `Doktor_ibfk_1` FOREIGN KEY (`kNo`) REFERENCES `Kisi` (`kNo`),
  ADD CONSTRAINT `Doktor_ibfk_2` FOREIGN KEY (`kNo`) REFERENCES `Kisi` (`kNo`),
  ADD CONSTRAINT `Doktor_ibfk_3` FOREIGN KEY (`kuNo`) REFERENCES `Kurum` (`kuNo`),
  ADD CONSTRAINT `Doktor_ibfk_4` FOREIGN KEY (`fNo`) REFERENCES `Fakulte` (`fNo`),
  ADD CONSTRAINT `Doktor_ibfk_5` FOREIGN KEY (`abdNo`) REFERENCES `AnaBilimDali` (`abdNo`);

--
-- Tablo kısıtlamaları `Hasta`
--
ALTER TABLE `Hasta`
  ADD CONSTRAINT `Hasta_ibfk_1` FOREIGN KEY (`kNo`) REFERENCES `Kisi` (`kNo`);

--
-- Tablo kısıtlamaları `Mesaj`
--
ALTER TABLE `Mesaj`
  ADD CONSTRAINT `Mesaj_ibfk_1` FOREIGN KEY (`dNo`) REFERENCES `Doktor` (`dNo`),
  ADD CONSTRAINT `Mesaj_ibfk_2` FOREIGN KEY (`dUzNo`) REFERENCES `Uzmanlik` (`uzNo`),
  ADD CONSTRAINT `Mesaj_ibfk_3` FOREIGN KEY (`hNo`) REFERENCES `Hasta` (`hNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
