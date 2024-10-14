-- Aktör: Uthyrningspersonal
USE `green rental`;

SELECT *
FROM hyrbil
WHERE hyrbil.tillganglig = TRUE;