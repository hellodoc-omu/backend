-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: db
-- Üretim Zamanı: 08 Oca 2023, 19:40:04
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

--
-- Tablo döküm verisi `AnaBilimDali`
--

INSERT INTO `AnaBilimDali` (`abdNo`, `abdIsim`) VALUES
(0, 'Kardiyoloji'),
(1, 'Psikiyatri'),
(2, 'Dahiliye'),
(3, 'Genel Cerrahi'),
(4, 'Histoloji ve Embriyoloji'),
(5, 'Tıbbi Mikrobiyoloji'),
(6, 'Ortopedi'),
(7, 'İmmünoloji'),
(8, 'Dermatoloji'),
(9, 'Üroloji'),
(10, 'Nöroloji');

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

--
-- Tablo döküm verisi `Doktor`
--

INSERT INTO `Doktor` (`dNo`, `kNo`, `kuNo`, `fNo`, `abdNo`, `uzNo`) VALUES
(0, 0, 0, 1, 1, '[2, 3]'),
(1, 1, 1, 2, 2, '[4]'),
(2, 2, 2, 3, 3, '[6]'),
(3, 3, 3, 4, 4, '[8]'),
(4, 4, 4, 5, 5, '[10]');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Fakulte`
--

CREATE TABLE `Fakulte` (
  `fNo` int NOT NULL,
  `fIsim` varchar(255) COLLATE utf16_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

--
-- Tablo döküm verisi `Fakulte`
--

INSERT INTO `Fakulte` (`fNo`, `fIsim`) VALUES
(0, 'OMÜ Tıp Fakültesi'),
(1, 'Medipol Tıp Fakültesi'),
(2, 'Marmara Tıp Fakültesi'),
(3, 'Ege Tıp Fakültesi'),
(4, 'Koç Tıp Fakültesi'),
(5, 'TOBB Tıp Fakültesi'),
(6, 'Cerrahpaşa Tıp Fakültesi'),
(7, 'Hacettepe Tıp Fakültesi'),
(8, 'Yeditepe Tıp Fakültesi'),
(9, 'Ankara Tıp Fakültesi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Hasta`
--

CREATE TABLE `Hasta` (
  `hNo` int NOT NULL,
  `kNo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

--
-- Tablo döküm verisi `Hasta`
--

INSERT INTO `Hasta` (`hNo`, `kNo`) VALUES
(0, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9);

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

--
-- Tablo döküm verisi `Kisi`
--

INSERT INTO `Kisi` (`kNo`, `KIsim`, `kSoyIsim`, `kAvatar`, `kMail`, `kSifre`, `kCinsiyet`, `kOnline`) VALUES
(0, 'Ahmet', 'Yılmaz', NULL, 'ahmet@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Erkek', 0),
(1, 'Mehmet', 'Öztürk', NULL, 'mehmet@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Erkek', 0),
(2, 'Ayşe', 'Kaya', NULL, 'ayse@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Kadın', 0),
(3, 'Fatma', 'Yıldız', NULL, 'fatma@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Kadın', 0),
(4, 'Ali', 'Çetin', NULL, 'ali@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Erkek', 0),
(5, 'Elif', 'Koç', NULL, 'elif@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Kadın', 0),
(6, 'Murat', 'Güler', NULL, 'murat@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Erkek', 0),
(7, 'Emine', 'Özdemir', NULL, 'emine@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Kadın', 0),
(8, 'Hüseyin', 'Kara', NULL, 'huseyin@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Erkek', 0),
(9, 'Nur', 'Yılmaz', NULL, 'nur@ornek.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'Kadın', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Kurum`
--

CREATE TABLE `Kurum` (
  `kuNo` int NOT NULL,
  `kuIsim` varchar(255) COLLATE utf16_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

--
-- Tablo döküm verisi `Kurum`
--

INSERT INTO `Kurum` (`kuNo`, `kuIsim`) VALUES
(0, 'Ondokuz Mayıs Üniversitesi'),
(1, 'Medipol Tıp Fakültesi'),
(2, 'Marmara Tıp Fakültesi'),
(3, 'Ege Tıp Fakültesi'),
(4, 'Koç Tıp Fakültesi'),
(5, 'TOBB Tıp Fakültesi'),
(6, 'Cerrahpaşa Tıp Fakültesi'),
(7, 'Hacettepe Tıp Fakültesi'),
(8, 'Yeditepe Tıp Fakültesi'),
(9, 'Ankara Tıp Fakültesi');

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

--
-- Tablo döküm verisi `Uzmanlik`
--

INSERT INTO `Uzmanlik` (`uzNo`, `uzIsim`) VALUES
(0, 'Hipertansiyon'),
(1, 'Ateroskleroz'),
(2, 'Şizofreni'),
(3, 'Depresyon'),
(4, 'Ülser'),
(5, 'Gastrit'),
(6, 'Sindirim Sistemi'),
(7, 'Kas-İskelet Sistemi'),
(8, 'İletim Dokusu'),
(9, 'Koruyucu Doku'),
(10, 'Hepatit A,B,C'),
(11, 'Paraziter Hastalıklar'),
(12, 'El Cerrahisi'),
(13, 'Ayak ve Ayak Bileği Cerrahisi'),
(14, 'Lateks Alerjisi'),
(15, 'Çimen Alerjisi'),
(16, 'Sivilce'),
(17, 'Benler'),
(18, 'Böbrek Hastalıkları'),
(19, 'İdrar Yolu Enfeksiyonları'),
(20, 'Omurilik Hastalıkları'),
(21, 'Unutkanlık');

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
  MODIFY `abdNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `Bildirim`
--
ALTER TABLE `Bildirim`
  MODIFY `bNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Doktor`
--
ALTER TABLE `Doktor`
  MODIFY `dNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `Fakulte`
--
ALTER TABLE `Fakulte`
  MODIFY `fNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `Hasta`
--
ALTER TABLE `Hasta`
  MODIFY `hNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `Kisi`
--
ALTER TABLE `Kisi`
  MODIFY `kNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `Kurum`
--
ALTER TABLE `Kurum`
  MODIFY `kuNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `Mesaj`
--
ALTER TABLE `Mesaj`
  MODIFY `mNo` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Uzmanlik`
--
ALTER TABLE `Uzmanlik`
  MODIFY `uzNo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
