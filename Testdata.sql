USE `Green Rental`;
-- Testdata:

-- Skapar bilmodellerna som finns i företaget. Då dessa alltid ska finnas kanske det hör hemma mer i filen som skapar databasen?
INSERT INTO `Bilmodell`(modellNamn, drivMedel, vaxelLada, maxAntalSaten, dragKrok, parkeringsFunktion, tv, kamera, lastUtrymme, dorrar)
VALUES
('Stadsbil', 'El', 'Automat', 2, FALSE, FALSE, FALSE, FALSE, 1, 2),
('Liten', 'Etanol', 'Manuell', 5, FALSE, FALSE, FALSE, FALSE, 1, 2),
('Mellan', 'El', 'Automat', 5, FALSE, TRUE, TRUE, FALSE, 2, 4),
('Kombi', 'El',  'Automat', 7, TRUE, FALSE, FALSE, FALSE, 2, 4), -- Även backsystem (annat ord för parkeringsfunktion?). Växellåda ej angiven
('Minibuss', 'Biogas',  'Automat', 9, FALSE, FALSE, TRUE, FALSE, 4, 4), -- Eldrivna dörrar, stort lastutrymme. Växellåda ej angiven
('Transportbil', 'Biogas', 'Manuell', 2, FALSE, FALSE, FALSE, TRUE, 8, 2); -- Växellåda ej angiven

-- Skapar ett testerbjudande
INSERT INTO erbjudande (rabattKod, rabattTyp, bilModell, erbjudandeStart, erbjudandeSlut)
VALUES
('WEEKEND20', '20%', 'Kombi', '2024-10-01', '2024-10-31' );


-- Skapar testuthyrningsstationer
INSERT INTO Uthyrningsstation (address, telefonNummer, epost, oppetTider)
VALUES
('Nordvägen 10', 0712345678, 'norduthyrning@gmail.com', '08-20 vardagar 10-21 helger'),
('Östvägen 11', 0712345678, 'ostrauthyrnings@gmail.com', '09-21 vardagar 10-22 helger'),
('Sydvägen 12', 0712345678, 'syduthyrning@gmail.com', '07-20 alla dagar'),
('Västvägen 13', 0712345678, 'vastuthyrning@gmail.com', '08-21 vardagar 08-22 helger');

-- Skapar testprivatkunder
INSERT INTO `privatkund` (`personNummer`, `epost`, `förNamn`, `telefonNummer`) 
VALUES
(9901010123, 'nilshallberg@gmail.com', 'Nils', 0787654321),
(9802021234, 'sarahwallberg@gmail.com', 'Sarah', 1787654321),
(9703032345, 'sofielarsson@gmail.com', 'Sofie', 2787654321),
(9604043456, 'oketrulls@gmail.com', 'Oke', 3787654321),
(198707072345, 'maria.persson@example.com', 'Maria', 701234571),
(199512223456, 'stefan.eriksson@example.com', 'Stefan', 701234572),
(200201012345, 'eva.andersson@example.com', 'Eva', 701234573),
(199806053456, 'oskar.jonsson@example.com', 'Oskar', 701234574),
(198305122345, 'jenny.karlsson@example.com', 'Jenny', 701234575),
(197911223456, 'mats.berg@example.com', 'Mats', 701234576);

-- Skapar testföretagskunder
INSERT INTO `företagskund` (`organisationsNummer`, `foretagsNamn`, `kontaktFornamn`, `kontaktEfternamn`) 
VALUES
(5560123456, 'ABC AB', 'Anna', 'Karlsson'),
(5560234567, 'XYZ AB', 'Erik', 'Nilsson'),
(5560345678, 'Tech Solutions AB', 'Lisa', 'Svensson'),
(5560456789, 'Global Ventures AB', 'Karl', 'Andersson'),
(5560567890, 'Future Tech AB', 'Maria', 'Johansson');

-- Skapar testbilar. AI-genererad
INSERT INTO `hyrbil` (`regNummer`, `tillganglig`, `farg`, `prisPerMil`, `modellNamn`, `stationsNummer`) 
VALUES
-- Uthyrningsstation 1 (Norduthyrning)
('ABC123', 1, 'Red', 150, 'Stadsbil', 1),
('JKL012', 1, 'Yellow', 120, 'liten', 1),
('STU901', 1, 'Grey', 170, 'mellan', 1),
('BCD890', 1, 'White', 200, 'kombi', 1),
('KLM789', 1, 'Silver', 250, 'minibuss', 1),
('TUV678', 1, 'Grey', 300, 'transportbil', 1),

-- Uthyrningsstation 2 (Östra Uthyrning)
('CDE123', 1, 'Red',  150, 'Stadsbil', 2),
('LMN012', 1, 'Yellow', 120, 'liten', 2),
('UVW901', 1, 'Grey', 170, 'mellan', 2),
('DEF890', 1, 'White', 200, 'kombi', 2),
('MNO789', 1, 'Silver', 250, 'minibuss', 2),
('VWX678', 1, 'Grey', 300, 'transportbil', 2),

-- Uthyrningsstation 3 (Syd uthyrning)
('EFG567', 1, 'Red', 150, 'Stadsbil', 3),
('NOP456', 1, 'Yellow', 120, 'liten', 3),
('WXY345', 1, 'Grey', 170, 'mellan', 3),
('FGH234', 1, 'White', 200, 'kombi', 3),
('OPQ123', 1, 'Silver', 250, 'minibuss', 3),
('XYZ012', 1, 'Grey',  300, 'transportbil', 3),

-- Uthyrningsstation 4 (Väst uthyrning)
('GHI901', 1, 'Red', 150, 'Stadsbil', 4),
('PQR890', 1, 'Yellow', 120, 'liten', 4),
('YZA789', 1, 'Grey', 170, 'mellan', 4),
('HIJ678', 1, 'White', 200, 'kombi', 4),
('QRS567', 1, 'Silver', 250, 'minibuss', 4),
('ZAB456', 1, 'Grey', 300, 'transportbil', 4);

-- Skapar testpersonal för Uthyrningsstationer 1 2, 3 och 4
INSERT INTO `Personal` (`titel (tillstånd)`, `namn`, `stationsNummer`)
VALUES
('Uthyrningspersonal', 'Anna Larsson', 1),
('Uthyrningspersonal', 'Oskar Nilsson', 1),
('Uthyrningspersonal', 'Maria Svensson', 1),
('Uthyrningspersonal', 'Johan Eriksson', 1),
('Underhåll', 'Sara Andersson', 1),
('Underhåll', 'Lars Karlsson', 1),
('Stationschef', 'Karin Johansson', 1),
('Styrelsemedlem', 'Erik Persson', 1),

-- Uthyrningsstation 2 (Östvägen 11)
('Uthyrningspersonal', 'Emma Jonsson', 2),
('Uthyrningspersonal', 'Oliver Svensson', 2),
('Uthyrningspersonal', 'Sofia Karlsson', 2),
('Uthyrningspersonal', 'David Olsson', 2),
('Underhåll', 'Nina Lindgren', 2),
('Underhåll', 'Mikael Bergström', 2),
('Stationschef', 'Johanna Pettersson', 2),

-- Uthyrningsstation 3 (Sydvägen 12)
('Uthyrningspersonal', 'Linda Eriksson', 3),
('Uthyrningspersonal', 'Kalle Johansson', 3),
('Uthyrningspersonal', 'Julia Andersson', 3),
('Uthyrningspersonal', 'Filip Nilsson', 3),
('Underhåll', 'Eva Jansson', 3),
('Underhåll', 'Henrik Lindström', 3),
('Stationschef', 'Mia Björk', 3),

-- Uthyrningsstation 4 (Västvägen 13)
('Uthyrningspersonal', 'Daniel Svensson', 4),
('Uthyrningspersonal', 'Anna Andersson', 4),
('Uthyrningspersonal', 'Tobias Olsson', 4),
('Uthyrningspersonal', 'Sara Karlsson', 4),
('Underhåll', 'Martin Jansson', 4),
('Underhåll', 'Louise Lindgren', 4),
('Stationschef', 'Karin Persson', 4);

-- Skapar testbokningar
INSERT INTO `Bokning` (`bokningsDatum`, `bilNummer`, `stationsNummer`, `kundNummer`, `foretagsKundNummer`, `kampanjID`)
VALUES
('2024-10-13', 11, 1, 5, NULL, NULL),
('2024-10-14', 12, 1, NULL, 1, NULL),
('2024-10-15', 13, 2, 6, NULL, NULL),
('2024-10-16', 14, 3, 7, NULL, 1),
('2024-10-16', 14, 3, 7, NULL, 1),
('2024-10-17', 15, 4, NULL, 2, NULL);

INSERT INTO `Avtal` (`startDatum`, `slutDatum`, `avtalsVillkor`, `bokningsNummer`)
VALUES
('2024-10-13', '2024-10-20', '/srvr/avtal.pdf', 1),
('2024-10-14', '2024-10-21', '/srvr/avtal.pdf', 2),
('2024-10-15', '2024-10-22', 'Uthyrning av bil i en vecka', 3),
('2024-10-16', '2024-10-23', 'Uthyrning av bil i en vecka', 4),
('2024-10-17', '2024-10-24', 'Uthyrning av bil i en vecka', 5);

insert into `lämning` (`bokningsNummer`, `stationsNummer`)
VALUES
(1, 1),
(2,1),
(3,2),
(4,3),
(5,4);

insert into `hämtning` (`bokningsNummer`, `stationsNummer`)
VALUES
(1, 1),
(2,1),
(3,2),
(4,3),
(5,4);

-- Testkontroller för bil 1
-- PersonalID 5 är en underhållare på station 1
INSERT INTO kontroll (kontrollDatum, kilometer, bilNummer, personalNummer)
VALUES
    ('2024-09-01', 12000, 1, 5),
    ('2024-09-15', 12500, 1, 5),
    ('2024-10-01', 13000, 1, 5),
    ('2024-10-10', 13500, 1, 5),
    ('2024-10-14', 14000, 1, 5);

-- Kanske behövs mer kolumner, kanske duger i nuvarande utformning?
INSERT INTO företagsfaktura (foretagsKundNummer)
VALUES
    (1),
    (1),
    (1);

-- Besiktningar
-- PersonalID 5 är en underhållare på station 1
INSERT INTO besiktning (besiktningsDatum, bilNummer, personalNummer)
VALUES
    ('2024-01-10', 1, 5),
    ('2024-03-15', 1, 5),
    ('2024-06-20', 1, 5),
    ('2024-08-05', 1, 5),
    ('2024-10-12', 1, 5);