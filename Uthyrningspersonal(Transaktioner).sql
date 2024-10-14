-- Aktör: Uthyrningspersonal
-- Alla transaktioner en uthyrningspersonal kan utföra
USE `green rental`;

-- Genomföra bokning av bil:
INSERT INTO `Bokning` (`bokningsDatum`, `bilNummer`, `stationsNummer`, `kundNummer`)
VALUES ('2023-10-13', 5, 1, 5);

-- Söka efter tillgängliga bilar:
SELECT * FROM `Hyrbil` WHERE `tillganglig` = TRUE AND `stationsNummer` = 2;

-- Söka efter specifikationer som bilar har:
SELECT bm.*
FROM `Bilmodell` bm
INNER JOIN `Hyrbil` h ON bm.modellNamn = h.modellNamn
WHERE bm.dragKrok = TRUE AND h.tillganglig = TRUE;

-- Ett annat villkor:
SELECT bm.*
FROM `Bilmodell` bm
INNER JOIN `Hyrbil` h ON bm.modellNamn = h.modellNamn
WHERE bm.drivMedel = 'el' AND h.tillganglig = TRUE;