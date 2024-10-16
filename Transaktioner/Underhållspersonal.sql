-- Genomföra kontroller av uthyrda bilar.
USE `green rental`;

-- Genomföra kontroll av bil
    INSERT INTO Kontroll (kontrollDatum, kilometerDelta, bilNummer, personalNummer)
    VALUES(2024-10-15, 85, 3, 11);

-- Hitta bilar som inte besiktats på 545 dagar
    SELECT hb.bilNummer,
           MAX(b.besiktningsDatum) senaste_besiktningen,
           DATEDIFF(CURRENT_DATE, MAX(b.besiktningsDatum)) dagar_sedan_besiktning
    FROM hyrbil hb
    JOIN besiktning b ON hb.bilNummer = b.bilNummer
    GROUP BY hb.bilNummer
    HAVING DATEDIFF(CURRENT_DATE, MAX(b.besiktningsDatum)) > 545;

    -- eller 1500km
    SELECT hb.bilnummer,
           SUM(k.kilometerDelta) kördSträcka
    FROM hyrbil hb
    JOIN kontroll k ON hb.bilNummer = k.bilNummer
                           WHERE k.kontrollDatum > (SELECT MAX(b.besiktningsDatum) FROM besiktning b WHERE b.bilNummer = hb.bilNummer)
    GROUP BY hb.bilnummer
    HAVING kördSträcka > 1500;

-- Genomföra besiktning
    INSERT INTO Besiktning (besiktningsDatum, bilNummer, personalNummer)
    VALUES (2023-09-20, 1, 2);

-- Registrera skada
    INSERT INTO Skada (skadeTyp, skadeGrad, bild, beskrivning, kontrollNummer)
    VALUES ('repa', 3, 'skada.png', 'vänster bakdörr', 1);