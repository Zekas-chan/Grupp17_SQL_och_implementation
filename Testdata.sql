USE `Green Rental`;
-- Testdata:

-- Skapar bilmodellerna som finns i företaget. Då dessa alltid ska finnas kanske det hör hemma mer i filen som skapar databasen?
INSERT INTO `Bilmodell`(modellNamn, drivMedel, marke, arsModell, vaxelLada, maxAntalSaten, dragKrok, parkeringsFunktion, tv, kamera, lastUtrymme, dorrar)
VALUES
('Stadsbil', 'El', 'Volvo', '2024', 'Automat', 2, FALSE, FALSE, FALSE, FALSE, 1, 2),
('Liten', 'Etanol', 'Volvo', '2024', 'Manuell', 5, FALSE, FALSE, FALSE, FALSE, 1, 2),
('Mellan', 'El', 'Volvo', '2024', 'Automat', 5, FALSE, TRUE, TRUE, FALSE, 2, 4), 
('Kombi', 'El', 'Volvo', '2024', '???', 7, TRUE, FALSE, FALSE, FALSE, 2, 4), -- Även backsystem (annat ord för parkeringsfunktion?). Växellåda ej angiven
('Minibuss', 'Biogas', 'Volvo', '2024', '???', 9, FALSE, FALSE, TRUE, FALSE, 4, 4), -- Eldrivna dörrar, stort lastutrymme. Växellåda ej angiven
('Transportbil', 'Biogas', 'Volvo', '2024', '???', 2, FALSE, FALSE, FALSE, TRUE, 8, 2); -- Växellåda ej angiven
SELECT * FROM `Bilmodell`;

-- Skapar ett antal testerbjudanden (baserat på Sagas testdata i Discord)
 /*
+-------------------------------------------+
| 			ATTENTION NEEDED				|
+-------------------------------------------+
 Just nu känns det inte som att den har rätt kolumner. Jag(Linnea) föreslår att formatet är något i still med:
 rabattkod, rabattyp, rabattmängd, rabattObjekt, erbjudandestart, erbjudandeslut
 rabattObjekt byts från varchar till ENUM
exempelvis:
WEEKEND20, Procentrabatt, 0.2, (Kombi, Mellan, Stadsbil), 2024-01-01, 2024-02-01

INSERT INTO erbjudande (rabattKod, rabattTyp, bilTyp, erbjudandeStart, erbjudandeSlut)
VALUES
('WEEKEND20', 'Totalrabatt', 'Elbilar', ), -- 1, weekendrabatt, elbilar, en helg
(), -- 2, halloweenrabatt, automatbilar, hela halloweenveckan
(), -- 3, julrabatt, dieselbilar, från veckan före jul till 2 januari
(); -- 4, sommarrabatt, en blandning, ?
*/

-- Skapar testuthyrningsstationer
INSERT INTO Uthyrningsstation (address, telefonNummer, epost, oppetTider)
VALUES
('Nordvägen 10', 0712345678, 'norduthyrning@gmail.com', '08-20 vardagar 10-21 helger'),
('Östvägen 11', 0712345678, 'ostrauthyrnings@gmail.com', '09-21 vardagar 10-22 helger'),
('Sydvägen 12', 0712345678, 'syduthyrning@gmail.com', '07-20 alla dagar'),
('Västvägen 13', 0712345678, 'vastuthyrning@gmail.com', '08-21 vardagar 08-22 helger');
SELECT * FROM Uthyrningsstation;

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
SELECT * FROM privatkund;

-- Skapar testföretagskunder
INSERT INTO `företagskund` (`organisationsNummer`, `foretagsNamn`, `kontaktFornamn`, `kontaktEfternamn`) 
VALUES
(5560123456, 'ABC AB', 'Anna', 'Karlsson'),
(5560234567, 'XYZ AB', 'Erik', 'Nilsson'),
(5560345678, 'Tech Solutions AB', 'Lisa', 'Svensson'),
(5560456789, 'Global Ventures AB', 'Karl', 'Andersson'),
(5560567890, 'Future Tech AB', 'Maria', 'Johansson');
SELECT * FROM företagskund;

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
SELECT * FROM hyrbil;