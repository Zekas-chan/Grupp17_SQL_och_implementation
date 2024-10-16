-- Alla transaktioner en stationschef kan utföra
USE `green rental`;

-- SKapa och hantera rabatter
    -- Lägga in nya erbjudanden (även uppdatera)
    INSERT INTO `Erbjudande` (rabattKod, rabattTyp, bilModell, erbjudandeStart, erbjudandeSlut)
    VALUES
    ('HALLOWEEN15', '15%', 'alla bilar', '2024-10-28', '2024-11-03'),
    ('CHRISTMAS20', '20%', 'alla bilar', '2024-12-20', '2025-01-05'),
    ('EASTER15', '15%', 'Liten', '2025-04-15', '2025-04-22');
    UPDATE `Erbjudande` Set `bilModell` = 'Mellan' WHERE `kampanjID` = 2;

-- Käpa in bil
    INSERT INTO hyrbil (regNummer, tillganglig, farg, prisPerMil, modellNamn, stationsNummer)
    values ('276HGF', 1, 'svart', 20, 'stadsbil', 1);

-- Ta fram uthyrningsstatistik
    SELECT stationsnummer, COUNT(*) AS Antal_uthyrningar
    FROM bokning
    GROUP BY stationsnummer
    ORDER BY stationsnummer;

-- Hämta uppgifter om företagsfaktura
    SELECT * FROM Företagsfaktura
    NATURAL JOIN företagskund
    WHERE fakturaNummer IN (1, 2, 3, 4);