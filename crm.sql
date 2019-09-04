-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Sep 2019 um 18:05
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

--
-- Daten für Tabelle `angebotbaustein`
--

INSERT INTO `angebotbaustein` (`ID`, `name`, `Beschreibung`, `Nettopreis`, `MwSt`) VALUES
(1, 'Matyi', 'asdfadfbresthhuiawrngjköönkjdfiubaslksgnfoihhödsgf', 2500, 20);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `angebotdetails`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `angebotdetails` (
`ID` int(11)
,`Datum` date
,`AngebotNummer` varchar(10)
,`KundeID` int(11)
,`BearbeiterID` int(11)
,`TerminStart` datetime
,`TerminEnd` datetime
,`Kunde_Name` varchar(100)
,`Kunde_Telefon` varchar(30)
,`Kunde_Email` varchar(256)
,`Kunde_Adresse` text
,`Bearbeiter_Name` varchar(100)
,`Bearbeiter_Telefon` varchar(30)
,`Bearbeiter_Email` varchar(256)
);

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

--
-- Daten für Tabelle `angebotkunde`
--

INSERT INTO `angebotkunde` (`ID`, `Datum`, `AngebotNummer`, `KundeID`, `BearbeiterID`, `TerminStart`, `TerminEnd`) VALUES
(1, '2019-08-30', '001/2019', 1, 1, '2019-09-10 00:00:00', '2019-09-15 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `angebotposition`
--

CREATE TABLE `angebotposition` (
  `ID` int(11) NOT NULL,
  `AngebotID` int(11) NOT NULL,
  `BausteinID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `angebotposition`
--

INSERT INTO `angebotposition` (`ID`, `AngebotID`, `BausteinID`) VALUES
(1, 1, 1);

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

--
-- Daten für Tabelle `bearbeiter`
--

INSERT INTO `bearbeiter` (`ID`, `Telefon`, `Email`, `Name`) VALUES
(1, '702504097', 'benedekmatyi1997@gmail.com', 'Benedek Mátyás');

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
-- Daten für Tabelle `kunde`
--

INSERT INTO `kunde` (`ID`, `Telefon`, `Email`, `Name`, `Adresse`) VALUES
(1, '1234', 'csabi.burus@gmail.com', 'Burus Alpar Csaba', '');

-- --------------------------------------------------------

--
-- Struktur des Views `angebotdetails`
--
DROP TABLE IF EXISTS `angebotdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `angebotdetails`  AS  select `ak`.`ID` AS `ID`,`ak`.`Datum` AS `Datum`,`ak`.`AngebotNummer` AS `AngebotNummer`,`ak`.`KundeID` AS `KundeID`,`ak`.`BearbeiterID` AS `BearbeiterID`,`ak`.`TerminStart` AS `TerminStart`,`ak`.`TerminEnd` AS `TerminEnd`,`k`.`Name` AS `Kunde_Name`,`k`.`Telefon` AS `Kunde_Telefon`,`k`.`Email` AS `Kunde_Email`,`k`.`Adresse` AS `Kunde_Adresse`,`b`.`Name` AS `Bearbeiter_Name`,`b`.`Telefon` AS `Bearbeiter_Telefon`,`b`.`Email` AS `Bearbeiter_Email` from ((`angebotkunde` `ak` left join `kunde` `k` on(`ak`.`KundeID` = `k`.`ID`)) left join `bearbeiter` `b` on(`ak`.`BearbeiterID` <> 0)) ;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `angebotkunde`
--
ALTER TABLE `angebotkunde`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `angebotposition`
--
ALTER TABLE `angebotposition`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `bearbeiter`
--
ALTER TABLE `bearbeiter`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
