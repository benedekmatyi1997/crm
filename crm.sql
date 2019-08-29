-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 29. Aug 2019 um 14:47
-- Server-Version: 10.3.16-MariaDB
-- PHP-Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `crm`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `angebotbaustein`
--

CREATE TABLE `angebotbaustein` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Beschreibung` text NOT NULL,
  `Nettopreis` double NOT NULL,
  `MwSt` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `angebotkunde`
--

CREATE TABLE `angebotkunde` (
  `ID` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `AngebotNummer` varchar(10) NOT NULL,
  `KundeID` int(11) NOT NULL,
  `BearbeiterID` int(11) NOT NULL,
  `TerminStart` datetime NOT NULL,
  `TerminEnd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `angebotposition`
--

CREATE TABLE `angebotposition` (
  `ID` int(11) NOT NULL,
  `AngebotID` int(11) NOT NULL,
  `BausteinID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bearbeiter`
--

CREATE TABLE `bearbeiter` (
  `ID` int(11) NOT NULL,
  `Telefon` varchar(30) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `ID` int(11) NOT NULL,
  `Telefon` varchar(30) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Adresse` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `angebotbaustein`
--
ALTER TABLE `angebotbaustein`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `angebotkunde`
--
ALTER TABLE `angebotkunde`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `angebotposition`
--
ALTER TABLE `angebotposition`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BausteinID` (`BausteinID`),
  ADD KEY `AngebotID` (`AngebotID`) USING BTREE;

--
-- Indizes für die Tabelle `bearbeiter`
--
ALTER TABLE `bearbeiter`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `angebotbaustein`
--
ALTER TABLE `angebotbaustein`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `angebotkunde`
--
ALTER TABLE `angebotkunde`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `angebotposition`
--
ALTER TABLE `angebotposition`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `bearbeiter`
--
ALTER TABLE `bearbeiter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `angebotposition`
--
ALTER TABLE `angebotposition`
  ADD CONSTRAINT `BausteinID` FOREIGN KEY (`BausteinID`) REFERENCES `angebotbaustein` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `KundeID` FOREIGN KEY (`AngebotID`) REFERENCES `angebotkunde` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
