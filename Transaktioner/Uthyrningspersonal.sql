-- Aktör: Uthyrningspersonal
-- Alla transaktioner en uthyrningspersonal kan utföra
USE `green rental`;

-- Genomföra bokning av bil för privatkund:
    -- Sök efter bil,
    -- Antar att kunden är registrerad.
    -- Kräver
    -- Bokningsdatum kan rimligtvis också använda CURRENT_DATE
    INSERT INTO `Bokning` (`bokningsDatum`, `bilNummer`, `stationsNummer`, `kundNummer`)
    VALUES (
            '2024-10-31',
            5,
            1,
            (SELECT kundNummer FROM privatkund WHERE personNummer = 198707072345) -- Hitta kundnummer
           );
    -- Ett avtal ska också finnas.
    INSERT INTO avtal (startDatum, slutDatum, avtalsVillkor, bokningsNummer)
    VALUES
    ('2023-10-14', '2023-10-15', '/srvr/avtal.pdf', LAST_INSERT_ID());
    -- Testrad för att visa att ovanstående fungerar
    SELECT *
    FROM avtal
        INNER JOIN bokning ON bokning.bokningsNummer = avtal.bokningsNummer
    WHERE avtal.bokningsNummer = LAST_INSERT_ID();

-- Söka efter alla just nu tillgängliga bilar på en specifik station:
    -- Kräver: Stationsnummer
    SELECT bilNummer
    FROM `Hyrbil`
    WHERE
        `tillganglig` = TRUE AND
        `stationsNummer` = 2;

-- Söka efter bil med specifika egenskaper (har dragkrok)
    SELECT h.bilNummer, h.modellNamn, bm.dragKrok, bm.drivMedel
    FROM hyrbil h
    INNER JOIN `bilmodell` bm ON bm.modellNamn = h.modellNamn
    WHERE bm.dragKrok = TRUE;

    -- Variant: Söka efter bilar med specifika drivmedel (el, biogas)
    SELECT h.bilNummer, h.modellNamn, bm.drivMedel
    FROM hyrbil h
    INNER JOIN bilmodell bm ON bm.modellNamn = h.modellNamn
    WHERE bm.drivMedel IN ('el', 'biogas')
    ORDER BY bilNummer;

-- Hitta och visa alla rabattkoder som gäller just nu och vilken bilmodell det gäller
    SELECT rabattKod, bilModell
    FROM erbjudande
    WHERE CURRENT_DATE BETWEEN erbjudandeStart AND erbjudandeSlut;

-- Utlämning av bil
    -- Kund uppger personuppgifter, vilket låter oss identifiera bokningen.
    -- Avtalet skrivs på och körkort visas (sker utanför systemet, avtal innehåller referens)
    INSERT INTO hämtning (bokningsNummer, stationsNummer)
    VALUES (6, 1);

    -- BIlen är inte längre tillgänglig
    UPDATE hyrbil
    SET tillganglig = FALSE
    WHERE bilNummer = (SELECT bilNummer FROM bokning WHERE bokningsNummer = 5);
    -- Testrad för att se att det fungerar, baserad på transaktionen för bilbokning
    SELECT * FROM hämtning WHERE bokningsNummer = 6;
    SELECT * FROM hyrbil WHERE bilNummer = 5;

-- Ta emot en bil som var uthyrd.
    INSERT INTO lämning (bokningsNummer, stationsNummer)
    VALUES
    (6, 2);
    -- Om bilen lämnas på annan station än den hämtades måste dess stationstillhörighet uppdateras
    UPDATE hyrbil
    SET stationsNummer = 2
    WHERE bilNummer = (SELECT bilNummer FROM bokning WHERE bokningsNummer = 6);
    -- Testrader för att visa att ändringarna gick igenom
    SELECT * FROM lämning WHERE bokningsNummer = 6;
    SELECT * FROM hyrbil WHERE bilNummer = 5;
    SELECT COUNT(bilNummer) FROM hyrbil WHERE stationsNummer = 1;
/*
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 !!                         ALLT NEDANFÖR ÄR OFÄRDIGT                               !!
 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */
-- Söka och applicera tillgängliga rabatter(Kom inte så långt här, oklar):
SELECT er.*
FROM Erbjudande er
INNER JOIN Bilmodell bm ON er.bilModell = bm.modellNamn
WHERE bm.drivMedel = er.rabattTyp;  -- exempelvillkor för rabatttyp




-- Hämta uppgifter om avtal(Ofärdig):
SELECT a.*, k.*
FROM Avtal a
INNER JOIN Bokning b ON a.bokningsNummer = b.bokningsNummer
INNER JOIN Privatkund k ON b.kundNummer = k.kundNummer;

-- Kolla uppgifter för hämtning/lämning(dödade mig nästan så är osäker på om den är helt fungerande):
-- Allt för att kolla hämtning/lämning :,(
SELECT
    u.address AS stationAddress,
    h.bokningsNummer AS bookingNumber,
    hy.regNummer AS carRegNumber,
    a.startDatum AS agreementStartDate,
    a.slutDatum AS agreementEndDate
FROM
    Lämning l
INNER JOIN
    Hämtning h ON l.bokningsNummer = h.bokningsNummer
INNER JOIN
    Bokning b ON l.bokningsNummer = b.bokningsNummer
INNER JOIN
    Avtal a ON b.bokningsNummer = a.bokningsNummer
INNER JOIN
    Hyrbil hy ON b.bilNummer = hy.bilNummer
INNER JOIN
    Uthyrningsstation u ON l.stationsNummer = u.stationsNummer
WHERE
    l.stationsNummer = 1;

-- Hämta uppgifter om uthyrningsstationer:
SELECT * from `uthyrningsstation`;
