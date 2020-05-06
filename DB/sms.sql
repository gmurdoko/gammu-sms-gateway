-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 08 Jan 2017 pada 14.02
-- Versi Server: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daemons`
--

CREATE TABLE IF NOT EXISTS `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gammu`
--

CREATE TABLE IF NOT EXISTS `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `gammu`
--

INSERT INTO `gammu` (`Version`) VALUES
(13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `inbox`
--

CREATE TABLE IF NOT EXISTS `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `inbox`
--

INSERT INTO `inbox` (`UpdatedInDB`, `ReceivingDateTime`, `Text`, `SenderNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `RecipientID`, `Processed`) VALUES
('2016-12-29 04:26:57', '2016-12-29 04:22:42', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 86, '', 'true'),
('2016-12-07 15:38:33', '2016-12-07 15:38:24', '0055004E005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'UNREG', 48, '', 'true'),
('2016-12-29 04:20:02', '2016-12-29 04:20:04', '0052004500470020004D0054004200200049004C00490020004400450056004900540041', '+628976596044', 'Default_No_Compression', '', '+628964011092', -1, 'REG MTB ILI DEVITA', 85, '', 'true'),
('2016-12-07 15:43:05', '2016-12-07 15:43:04', '0052004500470020004D0054004200200049004C0049002000470041004C0041004E0047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTB ILI GALANG', 50, '', 'true'),
('2016-12-07 15:46:35', '2016-12-07 15:46:35', '0055004E005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'UNREG', 51, '', 'true'),
('2016-12-07 15:48:01', '2016-12-07 15:48:00', '0048006100680061', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'Haha', 52, '', 'true'),
('2016-12-07 15:57:12', '2016-12-07 15:52:04', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 53, '', 'true'),
('2016-12-07 16:01:17', '2016-12-07 16:01:14', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 54, '', 'true'),
('2016-12-07 16:03:06', '2016-12-07 16:03:05', '0052004500470020004D0054004200200049004C0049002000470041004C', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTB ILI GAL', 55, '', 'true'),
('2016-12-07 16:20:24', '2016-12-07 16:06:47', '005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG', 56, '', 'true'),
('2016-12-07 16:32:59', '2016-12-07 16:21:05', '0052004500470020004D00540041', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTA', 57, '', 'true'),
('2016-12-07 16:33:37', '2016-12-07 16:33:37', '0052004500470020004D0054004200200049004C0041', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTB ILA', 58, '', 'true'),
('2016-12-07 16:37:56', '2016-12-07 16:37:55', '0052004500470020004D0054004200200049004C0049', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTB ILI', 59, '', 'true'),
('2016-12-07 16:38:56', '2016-12-07 16:38:55', '0052004500470020004D0054004200200049004C0049002000470041004C0041004E004700200043004100480059004F0020004D005500520044004F004B004F', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTB ILI GALANG CAHYO MURDOKO', 60, '', 'true'),
('2016-12-07 16:40:12', '2016-12-07 16:40:12', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 61, '', 'true'),
('2016-12-07 16:43:53', '2016-12-07 16:42:45', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 62, '', 'true'),
('2016-12-07 16:44:30', '2016-12-07 16:44:29', '0052004500470020004D0054004200200049004C0049002000470041004C0041004E004700200043004100480059004F0020004D005500520044004F004B004F', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTB ILI GALANG CAHYO MURDOKO', 63, '', 'true'),
('2016-12-07 16:45:00', '2016-12-07 16:44:59', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 64, '', 'true'),
('2016-12-07 16:48:06', '2016-12-07 16:48:04', '00480061006800610068006100680061', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'Hahahaha', 65, '', 'true'),
('2016-12-07 16:50:40', '2016-12-07 16:49:04', '0055004E005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'UNREG', 66, '', 'true'),
('2016-12-07 16:51:00', '2016-12-07 16:50:59', '0055004E005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'UNREG', 67, '', 'true'),
('2016-12-07 16:52:06', '2016-12-07 16:52:05', '0055004E005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'UNREG', 68, '', 'true'),
('2016-12-07 17:15:57', '2016-12-07 17:14:50', '004800610068006100680061', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'Hahaha', 69, '', 'true'),
('2016-12-07 17:16:22', '2016-12-07 17:16:21', '00540069006400610061006B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'Tidaak', 70, '', 'true'),
('2016-12-07 17:24:12', '2016-12-07 17:24:05', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 71, '', 'true'),
('2016-12-07 17:25:32', '2016-12-07 17:25:30', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 72, '', 'true'),
('2016-12-09 07:57:18', '2016-12-09 07:57:19', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 76, '', 'true'),
('2016-12-09 08:01:05', '2016-12-09 08:01:04', '0052004500470020004D005400550020005000330041002000460061006E006E0079', '+6282158393559', 'Default_No_Compression', '', '+6281107908', -1, 'REG MTU P3A Fanny', 77, '', 'true'),
('2016-12-09 08:02:24', '2016-12-09 08:02:23', '00430045004B', '+6282158393559', 'Default_No_Compression', '', '+6281107908', -1, 'CEK', 78, '', 'true'),
('2016-12-09 08:03:35', '2016-12-09 08:03:35', '005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG', 79, '', 'true'),
('2016-12-29 03:52:21', '2016-12-29 03:51:49', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 80, '', 'true'),
('2016-12-29 04:02:48', '2016-12-29 04:02:53', '0052004500470020004D005400530020005000330041002000470041004C0041004E0047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTS P3A GALANG', 81, '', 'true'),
('2016-12-29 04:06:15', '2016-12-29 04:06:26', '0052004500470020004D005400530020005000330041002000470041004C0041004E0047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTS P3A GALANG', 82, '', 'true'),
('2016-12-29 04:06:50', '2016-12-29 04:07:02', '0055004E005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'UNREG', 83, '', 'true'),
('2016-12-29 04:29:42', '2016-12-29 04:29:44', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 87, '', 'true'),
('2016-12-29 04:30:44', '2016-12-29 04:30:56', '0055006E007200650067', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'Unreg', 88, '', 'true'),
('2016-12-29 04:31:34', '2016-12-29 04:31:45', '0055004E005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'UNREG', 89, '', 'true'),
('2016-12-29 04:33:29', '2016-12-29 04:33:35', '00480061006800610068006100680061', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'Hahahaha', 90, '', 'true'),
('2016-12-29 04:34:37', '2016-12-29 04:34:49', '0052004500470020004D005400420020005000330041002000470041004C0041004E0047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTB P3A GALANG', 91, '', 'true'),
('2016-12-29 04:45:26', '2016-12-29 04:45:30', '00480061006800610068006100680061', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'Hahahaha', 92, '', 'true'),
('2016-12-29 04:46:27', '2016-12-29 04:46:29', '00430045004B', '+628976596044', 'Default_No_Compression', '', '+628964011092', -1, 'CEK', 93, '', 'true'),
('2016-12-29 05:07:42', '2016-12-29 05:07:52', '0055004E005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'UNREG', 94, '', 'true'),
('2016-12-29 05:08:32', '2016-12-29 05:08:23', '0052004500470020004D005400420020005000330041002000470041004C0041004E0047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'REG MTB P3A GALANG', 95, '', 'true'),
('2016-12-29 05:11:14', '2016-12-29 05:11:25', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 96, '', 'true'),
('2016-12-29 05:14:09', '2016-12-29 05:13:54', '00430045004B', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'CEK', 97, '', 'true'),
('2016-12-29 05:15:10', '2016-12-29 05:14:56', '0055004E005200450047', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'UNREG', 98, '', 'true'),
('2017-01-04 06:31:28', '2017-01-04 06:31:37', '005400650073', '+6285769930856', 'Default_No_Compression', '', '+62816124', -1, 'Tes', 99, '', 'true'),
('2017-01-04 06:32:36', '2017-01-04 06:32:33', '00430045004B', '+628976596044', 'Default_No_Compression', '', '+628964011092', -1, 'CEK', 100, '', 'true'),
('2017-01-04 06:33:11', '2017-01-04 06:33:07', '0055004E005200450047', '+628976596044', 'Default_No_Compression', '', '+628964011092', -1, 'UNREG', 101, '', 'true');

--
-- Trigger `inbox`
--
DELIMITER $$
CREATE TRIGGER `inbox_timestamp` BEFORE INSERT ON `inbox`
 FOR EACH ROW BEGIN
    IF NEW.ReceivingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.ReceivingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `outbox`
--

CREATE TABLE IF NOT EXISTS `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;

--
-- Trigger `outbox`
--
DELIMITER $$
CREATE TRIGGER `outbox_timestamp` BEFORE INSERT ON `outbox`
 FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingTimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.SendingTimeOut = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `outbox_multipart`
--

CREATE TABLE IF NOT EXISTS `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pbk`
--

CREATE TABLE IF NOT EXISTS `pbk` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pbk_groups`
--

CREATE TABLE IF NOT EXISTS `pbk_groups` (
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `phones`
--

CREATE TABLE IF NOT EXISTS `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '-1',
  `Signal` int(11) NOT NULL DEFAULT '-1',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `phones`
--

INSERT INTO `phones` (`ID`, `UpdatedInDB`, `InsertIntoDB`, `TimeOut`, `Send`, `Receive`, `IMEI`, `Client`, `Battery`, `Signal`, `Sent`, `Received`) VALUES
('', '2017-01-05 06:56:07', '2017-01-04 06:29:35', '2017-01-05 06:56:17', 'yes', 'yes', '865633015843024', 'Gammu 1.32.0, Windows Server 2007 SP1, GCC 4.7, MinGW 3.11', 0, 45, 3, 3);

--
-- Trigger `phones`
--
DELIMITER $$
CREATE TRIGGER `phones_timestamp` BEFORE INSERT ON `phones`
 FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.TimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.TimeOut = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sentitems`
--

CREATE TABLE IF NOT EXISTS `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sentitems`
--

INSERT INTO `sentitems` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `DeliveryDateTime`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `SenderID`, `SequencePosition`, `Status`, `StatusError`, `TPMR`, `RelativeValidity`, `CreatorID`) VALUES
('2016-12-29 05:16:10', '2016-12-29 05:15:10', '2016-12-29 05:16:10', NULL, '0041006E00640061002000740065006C00610068002000620065007200680065006E007400690020006200650072006C0061006E006700670061006E0061006E0020006C006100790061006E0061006E00200069006E0069', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Anda telah berhenti berlangganan layanan ini', 417, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-29 05:15:08', '2016-12-29 05:14:09', '2016-12-29 05:15:08', NULL, '00500069006E00740075002000610069007200200075006E00740075006B002000640061006500720061006800200061006E0064006100200073007500640061006800200064006900620075006B0061', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air untuk daerah anda sudah dibuka', 416, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-29 05:13:35', '2016-12-29 05:12:45', '2016-12-29 05:13:35', NULL, '00500069006E00740075002000610069007200200061006B0061006E00200064006900620075006B006100200070006100640061002000740061006E006700670061006C002000270032003000310037002D00300031002D00300031002700200068006100720061007000200070006500720073006900610070006B0061006E0020006A0065006E00690073002000740061006E0061006D0061006E0020002700500041004400490027', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air akan dibuka pada tanggal ''2017-01-01'' harap persiapkan jenis tanaman ''PADI''', 414, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-29 05:14:07', '2016-12-29 05:12:45', '2016-12-29 05:14:07', NULL, '00420075006B0061002000700069006E00740075002000610069007200200070006100640061002000740061006E006700670061006C002000270032003000310037002D00300031002D003000310027002000730061006D007000610069002000740061006E006700670061006C002000270032003000310037002D00300031002D0030003500270020', '+628976596044', 'Default_No_Compression', '', '+6281100000', -1, 'Buka pintu air pada tanggal ''2017-01-01'' sampai tanggal ''2017-01-05'' ', 415, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-29 03:52:56', '2016-12-29 03:52:21', '2016-12-29 03:52:56', NULL, '004E006F006D006F007200200061006E00640061002000620065006C0075006D0020007400650072006400610066007400610072', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Nomor anda belum terdaftar', 394, '', 1, 'SendingOKNoReport', -1, 86, 255, 'Gammu'),
('2016-12-29 04:02:53', '2016-12-29 04:02:48', '2016-12-29 04:02:53', NULL, '0054006500720069006D0061006B006100730069006800200061006E00640061002000740065006C006100680020007400650072006400610066007400610072002000640061006C0061006D002000700072006F006700720061006D', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Terimakasih anda telah terdaftar dalam program', 395, '', 1, 'SendingOKNoReport', -1, 87, 255, 'Gammu'),
('2016-12-09 08:04:06', '2016-12-09 08:03:35', '2016-12-09 08:04:06', NULL, '004E006F006D006F007200200061006E006400610020007300750064006100680020007400650072006400610066007400610072002C0020', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Nomor anda sudah terdaftar, ', 393, '', 1, 'SendingOKNoReport', -1, 85, 255, 'Gammu'),
('2016-12-09 08:02:31', '2016-12-09 08:02:24', '2016-12-09 08:02:31', NULL, '00500069006E00740075002000610069007200200061006B0061006E00200064006900620075006B006100200070006100640061002000740061006E006700670061006C002000270032003000310036002D00310032002D00310035002700200068006100720061007000200070006500720073006900610070006B0061006E0020006A0065006E00690073002000740061006E0061006D0061006E0020002700500041004400490027', '+6282158393559', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air akan dibuka pada tanggal ''2016-12-15'' harap persiapkan jenis tanaman ''PADI''', 392, '', 1, 'SendingOKNoReport', -1, 84, 255, 'Gammu'),
('2016-12-29 04:06:27', '2016-12-29 04:06:15', '2016-12-29 04:06:27', NULL, '004E006F006D006F007200200061006E006400610020007300750064006100680020007400650072006400610066007400610072002C0020', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Nomor anda sudah terdaftar, ', 396, '', 1, 'SendingOKNoReport', -1, 88, 255, 'Gammu'),
('2016-12-29 04:07:01', '2016-12-29 04:06:50', '2016-12-29 04:07:01', NULL, '0041006E00640061002000740065006C00610068002000620065007200680065006E007400690020006200650072006C0061006E006700670061006E0061006E0020006A0069006B006100200069006E00670069006E0020006D0065006E00670061006B007400690066006B0061006E0020006B0065006D00620061006C0069002000730069006C00610068006B0061006E00200068007500620075006E0067006900200070006500740075006700610073', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Anda telah berhenti berlangganan jika ingin mengaktifkan kembali silahkan hubungi petugas', 397, '', 1, 'SendingOKNoReport', -1, 89, 255, 'Gammu'),
('2016-12-29 04:09:05', '2016-12-29 04:08:40', '2016-12-29 04:09:05', NULL, '0054006500720069006D0061006B006100730069006800200061006E00640061002000740065006C006100680020007400650072006400610066007400610072002000640061006C0061006D002000700072006F006700720061006D', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Terimakasih anda telah terdaftar dalam program', 398, '', 1, 'SendingOKNoReport', -1, 90, 255, 'Gammu'),
('2016-12-29 04:20:09', '2016-12-29 04:20:02', '2016-12-29 04:20:09', NULL, '0054006500720069006D0061006B006100730069006800200061006E00640061002000740065006C006100680020007400650072006400610066007400610072002000640061006C0061006D002000700072006F006700720061006D', '+628976596044', 'Default_No_Compression', '', '+6281100000', -1, 'Terimakasih anda telah terdaftar dalam program', 399, '', 1, 'SendingOKNoReport', -1, 91, 255, 'Gammu'),
('2016-12-29 04:21:43', '2016-12-29 04:21:15', '2016-12-29 04:21:43', NULL, '00420075006B0061002000700069006E00740075002000610069007200200070006100640061002000740061006E006700670061006C002000270032003000310037002D00300031002D003000310027002000730061006D007000610069002000740061006E006700670061006C002000270032003000310037002D00300031002D0030003500270020', '+628976596044', 'Default_No_Compression', '', '+6281100000', -1, 'Buka pintu air pada tanggal ''2017-01-01'' sampai tanggal ''2017-01-05'' ', 402, '', 1, 'SendingOKNoReport', -1, 92, 255, 'Gammu'),
('2016-12-29 04:21:46', '2016-12-29 04:21:15', '2016-12-29 04:21:46', NULL, '00500069006E00740075002000610069007200200061006B0061006E00200064006900620075006B006100200070006100640061002000740061006E006700670061006C002000270032003000310037002D00300031002D00300031002700200068006100720061007000200070006500720073006900610070006B0061006E0020006A0065006E00690073002000740061006E0061006D0061006E0020002700500041004400490027', '+6285669917051', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air akan dibuka pada tanggal ''2017-01-01'' harap persiapkan jenis tanaman ''PADI''', 400, '', 1, 'SendingOKNoReport', -1, 93, 255, 'Gammu'),
('2016-12-29 04:21:49', '2016-12-29 04:21:15', '2016-12-29 04:21:49', NULL, '00500069006E00740075002000610069007200200061006B0061006E00200064006900620075006B006100200070006100640061002000740061006E006700670061006C002000270032003000310037002D00300031002D00300031002700200068006100720061007000200070006500720073006900610070006B0061006E0020006A0065006E00690073002000740061006E0061006D0061006E0020002700500041004400490027', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air akan dibuka pada tanggal ''2017-01-01'' harap persiapkan jenis tanaman ''PADI''', 401, '', 1, 'SendingOKNoReport', -1, 94, 255, 'Gammu'),
('2016-12-29 04:27:23', '2016-12-29 04:26:57', '2016-12-29 04:27:23', NULL, '00500069006E00740075002000610069007200200075006E00740075006B002000640061006500720061006800200061006E0064006100200073007500640061006800200064006900620075006B0061', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air untuk daerah anda sudah dibuka', 403, '', 1, 'SendingOKNoReport', -1, 95, 255, 'Gammu'),
('2016-12-29 04:29:57', '2016-12-29 04:29:42', '2016-12-29 04:29:57', NULL, '00500069006E00740075002000610069007200200061006B0061006E00200064006900620075006B006100200070006100640061002000740061006E006700670061006C002000270032003000310037002D00300031002D00300035002700200068006100720061007000200070006500720073006900610070006B0061006E0020006A0065006E00690073002000740061006E0061006D0061006E0020002700500041004400490027', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air akan dibuka pada tanggal ''2017-01-05'' harap persiapkan jenis tanaman ''PADI''', 404, '', 1, 'SendingOKNoReport', -1, 96, 255, 'Gammu'),
('2016-12-29 04:31:01', '2016-12-29 04:30:44', '2016-12-29 04:31:01', NULL, '0046006F0072006D00610074002000790061006E006700200061006E006400610020006D006100730075006B006B0061006E002000530061006C00610068', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Format yang anda masukkan Salah', 405, '', 1, 'SendingOKNoReport', -1, 97, 255, 'Gammu'),
('2016-12-29 04:32:05', '2016-12-29 04:31:34', '2016-12-29 04:32:05', NULL, '0041006E00640061002000740065006C00610068002000620065007200680065006E007400690020006200650072006C0061006E006700670061006E0061006E0020006C006100790061006E0061006E00200069006E0069', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Anda telah berhenti berlangganan layanan ini', 406, '', 1, 'SendingOKNoReport', -1, 98, 255, 'Gammu'),
('2016-12-29 04:34:07', '2016-12-29 04:33:29', '2016-12-29 04:34:07', NULL, '004E006F006D006F007200200061006E00640061002000620065006C0075006D0020007400650072006400610066007400610072', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Nomor anda belum terdaftar', 407, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-29 04:35:08', '2016-12-29 04:34:37', '2016-12-29 04:35:08', NULL, '0054006500720069006D0061006B006100730069006800200061006E00640061002000740065006C006100680020007400650072006400610066007400610072002000640061006C0061006D002000700072006F006700720061006D', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Terimakasih anda telah terdaftar dalam program', 408, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-29 04:46:12', '2016-12-29 04:45:26', '2016-12-29 04:46:12', NULL, '0046006F0072006D00610074002000790061006E006700200061006E006400610020006D006100730075006B006B0061006E002000530061006C00610068', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Format yang anda masukkan Salah', 409, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-09 07:57:51', '2016-12-09 07:57:18', '2016-12-09 07:57:51', NULL, '00420075006B0061002000700069006E00740075002000610069007200200070006100640061002000740061006E006700670061006C002000270032003000310036002D00310032002D003100350027002000730061006D007000610069002000740061006E006700670061006C002000270032003000310036002D00310032002D003100360027', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Buka pintu air pada tanggal ''2016-12-15'' sampai tanggal ''2016-12-16''', 390, '', 1, 'SendingOKNoReport', -1, 82, 255, 'Gammu'),
('2016-12-09 07:55:45', '2016-12-09 07:55:11', '2016-12-09 07:55:45', NULL, '00420075006B0061002000700069006E00740075002000610069007200200070006100640061002000740061006E006700670061006C002000270032003000310036002D00310032002D003100350027002000730061006D007000610069002000740061006E006700670061006C002000270032003000310036002D00310032002D0031003600270020', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Buka pintu air pada tanggal ''2016-12-15'' sampai tanggal ''2016-12-16'' ', 389, '', 1, 'SendingOKNoReport', -1, 81, 255, 'Gammu'),
('2016-12-09 07:55:24', '2016-12-09 07:55:11', '2016-12-09 07:55:24', NULL, '00500069006E00740075002000610069007200200061006B0061006E00200064006900620075006B006100200070006100640061002000740061006E006700670061006C002000270032003000310036002D00310032002D00310035002700200068006100720061007000200070006500720073006900610070006B0061006E0020006A0065006E00690073002000740061006E0061006D0061006E0020002700500041004400490027', '+6285669917051', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air akan dibuka pada tanggal ''2016-12-15'' harap persiapkan jenis tanaman ''PADI''', 388, '', 1, 'SendingOKNoReport', -1, 80, 255, 'Gammu'),
('2016-12-29 05:12:04', '2016-12-29 05:11:14', '2016-12-29 05:12:04', NULL, '00500069006E00740075002000610069007200200061006B0061006E00200064006900620075006B006100200070006100640061002000740061006E006700670061006C002000270032003000310037002D00300031002D00300035002700200068006100720061007000200070006500720073006900610070006B0061006E0020006A0065006E00690073002000740061006E0061006D0061006E0020002700500041004400490027', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air akan dibuka pada tanggal ''2017-01-05'' harap persiapkan jenis tanaman ''PADI''', 413, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-29 05:08:30', '2016-12-29 05:07:42', '2016-12-29 05:08:30', NULL, '0041006E00640061002000740065006C00610068002000620065007200680065006E007400690020006200650072006C0061006E006700670061006E0061006E0020006C006100790061006E0061006E00200069006E0069', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Anda telah berhenti berlangganan layanan ini', 411, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-29 05:09:31', '2016-12-29 05:08:32', '2016-12-29 05:09:31', NULL, '0054006500720069006D0061006B006100730069006800200061006E00640061002000740065006C006100680020007400650072006400610066007400610072002000640061006C0061006D002000700072006F006700720061006D', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Terimakasih anda telah terdaftar dalam program', 412, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2016-12-29 04:47:14', '2016-12-29 04:46:27', '2016-12-29 04:47:14', NULL, '00420075006B0061002000700069006E00740075002000610069007200200070006100640061002000740061006E006700670061006C002000270032003000310037002D00300031002D003000350027002000730061006D007000610069002000740061006E006700670061006C002000270032003000310037002D00300031002D003100320027', '+628976596044', 'Default_No_Compression', '', '+6281100000', -1, 'Buka pintu air pada tanggal ''2017-01-05'' sampai tanggal ''2017-01-12''', 410, '', 1, 'SendingError', -1, -1, 255, 'Gammu'),
('2017-01-04 06:31:38', '2017-01-04 06:31:28', '2017-01-04 06:31:38', NULL, '004E006F006D006F007200200061006E00640061002000620065006C0075006D0020007400650072006400610066007400610072', '+6285769930856', 'Default_No_Compression', '', '+6281100000', -1, 'Nomor anda belum terdaftar', 418, '', 1, 'SendingOKNoReport', -1, 112, 255, 'Gammu'),
('2017-01-04 06:32:42', '2017-01-04 06:32:36', '2017-01-04 06:32:42', NULL, '00500069006E00740075002000610069007200200075006E00740075006B002000640061006500720061006800200061006E0064006100200073007500640061006800200064006900620075006B0061', '+628976596044', 'Default_No_Compression', '', '+6281100000', -1, 'Pintu air untuk daerah anda sudah dibuka', 419, '', 1, 'SendingOKNoReport', -1, 113, 255, 'Gammu'),
('2017-01-04 06:33:16', '2017-01-04 06:33:11', '2017-01-04 06:33:16', NULL, '0041006E00640061002000740065006C00610068002000620065007200680065006E007400690020006200650072006C0061006E006700670061006E0061006E0020006C006100790061006E0061006E00200069006E0069', '+628976596044', 'Default_No_Compression', '', '+6281100000', -1, 'Anda telah berhenti berlangganan layanan ini', 420, '', 1, 'SendingOKNoReport', -1, 114, 255, 'Gammu');

--
-- Trigger `sentitems`
--
DELIMITER $$
CREATE TRIGGER `sentitems_timestamp` BEFORE INSERT ON `sentitems`
 FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_admin`
--

CREATE TABLE IF NOT EXISTS `t_admin` (
  `ID` int(11) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(50) NOT NULL,
  `access` enum('','SU') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_admin`
--

INSERT INTO `t_admin` (`ID`, `username`, `password`, `access`) VALUES
(1, 'galang', 'galang', 'SU');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kecamatan`
--

CREATE TABLE IF NOT EXISTS `t_kecamatan` (
  `id_kec` int(11) NOT NULL,
  `nama_kec` varchar(32) NOT NULL,
  `kode_kec` varchar(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_kecamatan`
--

INSERT INTO `t_kecamatan` (`id_kec`, `nama_kec`, `kode_kec`) VALUES
(1, 'METRO BARAT', 'MTB'),
(2, 'METRO SELATAN', 'MTS'),
(3, 'METRO TIMUR', 'MTT'),
(4, 'METRO UTARA', 'MTU'),
(5, 'METRO PUSAT', 'MTP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kontak`
--

CREATE TABLE IF NOT EXISTS `t_kontak` (
  `id_kontak` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `id_kec` int(11) NOT NULL,
  `jabatan` enum('P3A','Ili-ili') NOT NULL,
  `publish` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_kontak`
--

INSERT INTO `t_kontak` (`id_kontak`, `nama`, `telepon`, `id_kec`, `jabatan`, `publish`) VALUES
(23, 'Andi', '+6285669917051', 4, 'P3A', 1),
(34, 'Fanny', '+6282158393559', 4, 'P3A', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tanaman`
--

CREATE TABLE IF NOT EXISTS `t_tanaman` (
  `id_tanaman` int(11) NOT NULL,
  `tanaman` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_tanaman`
--

INSERT INTO `t_tanaman` (`id_tanaman`, `tanaman`) VALUES
(1, 'PADI'),
(2, 'PALAWIJA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_transaksi`
--

CREATE TABLE IF NOT EXISTS `t_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_broadcast` date NOT NULL,
  `tgl_buka` date NOT NULL,
  `tgl_tutup` date NOT NULL,
  `id_tanaman` int(11) NOT NULL,
  `id_kec` int(11) NOT NULL,
  `status` enum('T','F') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_transaksi`
--

INSERT INTO `t_transaksi` (`id_transaksi`, `tgl_broadcast`, `tgl_buka`, `tgl_tutup`, `id_tanaman`, `id_kec`, `status`) VALUES
(18, '2016-11-23', '2016-11-23', '2016-11-23', 1, 1, 'F'),
(19, '2016-11-30', '2016-11-30', '2016-11-30', 2, 2, 'F'),
(24, '2016-12-07', '2016-12-08', '2016-12-09', 1, 1, 'F'),
(26, '2016-12-29', '2017-01-01', '2017-01-05', 1, 1, 'F');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `outbox`
--
ALTER TABLE `outbox`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  ADD KEY `outbox_sender` (`SenderID`);

--
-- Indexes for table `outbox_multipart`
--
ALTER TABLE `outbox_multipart`
  ADD PRIMARY KEY (`ID`,`SequencePosition`);

--
-- Indexes for table `pbk`
--
ALTER TABLE `pbk`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`IMEI`);

--
-- Indexes for table `sentitems`
--
ALTER TABLE `sentitems`
  ADD PRIMARY KEY (`ID`,`SequencePosition`),
  ADD KEY `sentitems_date` (`DeliveryDateTime`),
  ADD KEY `sentitems_tpmr` (`TPMR`),
  ADD KEY `sentitems_dest` (`DestinationNumber`),
  ADD KEY `sentitems_sender` (`SenderID`);

--
-- Indexes for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_kecamatan`
--
ALTER TABLE `t_kecamatan`
  ADD PRIMARY KEY (`id_kec`);

--
-- Indexes for table `t_kontak`
--
ALTER TABLE `t_kontak`
  ADD PRIMARY KEY (`id_kontak`);

--
-- Indexes for table `t_tanaman`
--
ALTER TABLE `t_tanaman`
  ADD PRIMARY KEY (`id_tanaman`);

--
-- Indexes for table `t_transaksi`
--
ALTER TABLE `t_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `outbox`
--
ALTER TABLE `outbox`
  MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=421;
--
-- AUTO_INCREMENT for table `pbk`
--
ALTER TABLE `pbk`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_kecamatan`
--
ALTER TABLE `t_kecamatan`
  MODIFY `id_kec` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `t_kontak`
--
ALTER TABLE `t_kontak`
  MODIFY `id_kontak` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `t_tanaman`
--
ALTER TABLE `t_tanaman`
  MODIFY `id_tanaman` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_transaksi`
--
ALTER TABLE `t_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;