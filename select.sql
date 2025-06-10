SELECT
  *
FROM rola WHERE rola_id  = 2;

SELECT
  *
FROM status ORDER BY nazwa;

SELECT
  projekt_id AS id,
  nazwa,
  opis,
  data_rozpoczecia,
  data_zakonczenia,
  utworzono,
  zaktualizowano
FROM projekt;

SELECT
  uzytkownik_id,
  czy_aktywny,
  imie,
  nazwisko,
  email,
  utworzono,
  zaktualizowano,
  rola_rola_id
FROM uzytkownik WHERE imie LIKE 'J%';

SELECT
  termin 
FROM zadanie GROUP BY termin;

SELECT
  uzytkownik_uzytkownik_id,
  zadanie_zadanie_id
FROM zadanie_uzytkownik;

SELECT
  *
FROM czas_pracy;
