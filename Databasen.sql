-- Bygger databasen, behöver bara köras en gång

CREATE DATABASE `Green Rental`;
USE `Green Rental`;

CREATE TABLE `Uthyrningsstation` (
  `stationsNummer` int NOT NULL AUTO_INCREMENT,
  `address` varchar(50) UNIQUE,
  `telefonNummer` int,
  `epost` varchar(50),
  `oppetTider` varchar(50),
  PRIMARY KEY (`stationsNummer`)
);

CREATE TABLE `Bilmodell` (
  `modellNamn` varchar(50) NOT NULL,
  `drivMedel` varchar(50),
  `marke` varchar(50), -- oanvänd kolumn?
  `arsModell` int, -- oanvänd kolumn?
  `vaxelLada` varchar(50),
  `maxAntalSaten` int,
  `dragKrok` bool,
  `parkeringsFunktion` bool,
  `tv` bool,
  `kamera` bool,
  `lastUtrymme` varchar(50),
  `dorrar` int,
  PRIMARY KEY (`modellNamn`)
);

CREATE TABLE `Hyrbil` (
  `bilNummer` int NOT NULL AUTO_INCREMENT,
  `regNummer` varchar(6) NOT NULL UNIQUE,
  `tillganglig` bool NOT NULL,
  `farg` varchar(50),
  `prisPerMil` int,
  `modellNamn` varchar(50),
  `stationsNummer` int NOT NULL,
  PRIMARY KEY (`bilNummer`),
  FOREIGN KEY (`stationsNummer`) REFERENCES `Uthyrningsstation`(`stationsNummer`),
  FOREIGN KEY (`modellNamn`) REFERENCES `Bilmodell`(`modellNamn`)
);

CREATE TABLE `Personal` (
  `personalNummer` int NOT NULL AUTO_INCREMENT,
  `titel (tillstånd)` varchar(50),
  `namn` varchar(50),
  `stationsNummer` int NOT NULL,
  PRIMARY KEY (`personalNummer`),
  FOREIGN KEY (`stationsNummer`) REFERENCES `Uthyrningsstation`(`stationsNummer`)
);

CREATE TABLE `Kontroll` (
  `kontrollNummer` int NOT NULL AUTO_INCREMENT,
  `kontrollDatum` date,
  `kilometer` int,
  `bilNummer` int NOT NULL,
  `personalNummer` int NOT NULL,
  PRIMARY KEY (`kontrollNummer`),
  FOREIGN KEY (`bilNummer`) REFERENCES `Hyrbil`(`bilNummer`),
  FOREIGN KEY (`personalNummer`) REFERENCES `Personal`(`personalNummer`)
);

CREATE TABLE `Skada` (
  `skadeNummer` int NOT NULL AUTO_INCREMENT,
  `skadeTyp` varchar(50),
  `skadeGrad` varchar(50),
  `bild` varchar(70),
  `beskrivning` varchar(70),
  `kontrollNummer` int NOT NULL,
  PRIMARY KEY (`skadeNummer`),
  FOREIGN KEY (`kontrollNummer`) REFERENCES `Kontroll`(`kontrollNummer`)
);

CREATE TABLE `Besiktning` (
  `besiktningdID` int NOT NULL AUTO_INCREMENT,
  `besiktningsDatum` date,
  `bilNummer` int NOT NULL,
  `personalNummer` int NOT NULL,
  PRIMARY KEY (`besiktningdID`),
  FOREIGN KEY (`personalNummer`) REFERENCES `Personal`(`personalNummer`),
  FOREIGN KEY (`bilNummer`) REFERENCES `Hyrbil`(`bilNummer`)
);

CREATE TABLE `Företagskund` (
  `foretagsKundNummer` int NOT NULL AUTO_INCREMENT,
  `organisationsNummer` bigint NOT NULL UNIQUE,
  `foretagsNamn` varchar(50) NOT NULL,
  `kontaktFornamn` varchar(50) NOT NULL,
  `kontaktEfternamn` varchar(50) NOT NULL,
  PRIMARY KEY (`foretagsKundNummer`)
);

CREATE TABLE `Företagsfaktura` (
  `fakturaNummer` int NOT NULL AUTO_INCREMENT,
  `foretagsKundNummer` int NOT NULL,
  PRIMARY KEY (`fakturaNummer`),
  FOREIGN KEY (`foretagsKundNummer`) REFERENCES `Företagskund`(`foretagsKundNummer`)
);

CREATE TABLE `Privatkund` (
  `kundNummer` int NOT NULL AUTO_INCREMENT,
  `personNummer` bigint NOT NULL UNIQUE,
  `epost` varchar(50) NOT NULL UNIQUE,
  `förNamn` varchar(50) NOT NULL,
  `telefonNummer` bigint NOT NULL,
  PRIMARY KEY (`kundNummer`)
);

CREATE TABLE `Erbjudande` (
  `kampanjID` int NOT NULL AUTO_INCREMENT,
  `rabattKod` varchar(20) NOT NULL UNIQUE,
  `rabattTyp` varchar(50) NOT NULL,
  `bilTyp` varchar(50) NOT NULL,
  `erbjudandeStart` date NOT NULL,
  `erbjudandeSlut` date NOT NULL,
  PRIMARY KEY (`kampanjID`)
);

CREATE TABLE `Bokning` (
  `bokningsNummer` int NOT NULL AUTO_INCREMENT,
  `bokningsDatum` date NOT NULL,
  `bilNummer` int NOT NULL,
  `stationsNummer` int NOT NULL,
  `foretagsKundNummer` int,
  `kundNummer` int,
  `kampanjID` int,
  PRIMARY KEY (`bokningsNummer`),
  FOREIGN KEY (`kundNummer`) REFERENCES `Privatkund`(`kundNummer`),
  FOREIGN KEY (`foretagsKundNummer`) REFERENCES `Företagskund`(`foretagsKundNummer`),
  FOREIGN KEY (`kampanjID`) REFERENCES `Erbjudande`(`kampanjID`),
  
  -- Ser till att antingen kundnummer ELLER företagskundnummer finns
  CONSTRAINT must_have_a_customerID CHECK (
  (kundnummer IS NOT NULL AND foretagsKundNummer IS NULL)
  OR
  (kundnummer IS NULL AND foretagsKundNummer IS NOT NULL)
  )
);

CREATE TABLE `Avtal` (
  `avtalsNummer` int NOT NULL AUTO_INCREMENT,
  `startDatum` date NOT NULL,
  `slutDatum` date NOT NULL,
  `avtalsVillkor` varchar(100),
  `bokningsNummer` int NOT NULL,
  PRIMARY KEY (`avtalsNummer`),
  FOREIGN KEY (`bokningsnummer`) REFERENCES `Bokning` (`bokningsNummer`)
);

CREATE TABLE `Lämning` (
  `bokningsNummer` int NOT NULL,
  `stationsNummer` int NOT NULL,
  PRIMARY KEY (`bokningsNummer`, `stationsNummer`),
  FOREIGN KEY (`stationsNummer`) REFERENCES `Uthyrningsstation`(`stationsNummer`),
  FOREIGN KEY (`bokningsNummer`) REFERENCES `Bokning`(`bokningsNummer`)
);

CREATE TABLE `Hämtning` (
  `bokningsNummer` int NOT NULL,
  `stationsNummer` int NOT NULL,
  PRIMARY KEY (`bokningsNummer`, `stationsNummer`),
  FOREIGN KEY (`stationsNummer`) REFERENCES `Uthyrningsstation`(`stationsNummer`),
  FOREIGN KEY (`bokningsNummer`) REFERENCES `Bokning`(`bokningsNummer`)
);