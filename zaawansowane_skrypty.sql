-- Dodawanie

INSERT INTO projekt (nazwa, opis, data_rozpoczecia, data_zakonczenia)
VALUES ('Projekt X', 'Rozwój modu³u raportów', '2025-06-01 09:00', '2025-07-30 18:00');

INSERT INTO zadanie (tytul, opis, termin, priorytet, projekt_projekt_id, status_status_id)
SELECT
  'Implementacja API',
  'Stworzenie endpointów do raportów',
  '2025-07-15 12:00',
  2,
  projekt_id,
  1
FROM projekt
WHERE nazwa = 'Projekt X';

INSERT INTO zadanie_uzytkownik (uzytkownik_uzytkownik_id, zadanie_zadanie_id)
SELECT
  u.uzytkownik_id,
  z.zadanie_id
FROM uzytkownik u
JOIN zadanie z ON z.tytul = 'Implementacja API'
WHERE u.email = 'jan.kowalski@example.com';



-- Aktualizowanie

UPDATE zadanie
SET
  status_status_id = (
    SELECT status_id
    FROM status
    WHERE nazwa = 'Gotowe'
  ),
  zaktualizowano = now()
WHERE tytul = 'Implementacja API';

UPDATE czas_pracy SET
  czas_trwania_sekundy = EXTRACT(
    EPOCH FROM ('2025-06-04 09:00'::timestamp  - '2025-06-01 10:00'::timestamp )
  ),
  zaktualizowano = now()
WHERE czas_pracy_id = 1;


-- Selekcja

SELECT z.zadanie_id, p.nazwa AS nazwa_projektu, z.tytul AS tytul_zadania, z.termin , u.imie, u.email, s.nazwa AS status_zadania FROM projekt p
INNER JOIN zadanie z 
ON p.projekt_id  = z.projekt_projekt_id 
INNER JOIN zadanie_uzytkownik zu 
ON zu.zadanie_zadanie_id = z.zadanie_id 
INNER JOIN  uzytkownik u 
ON u.uzytkownik_id = zu.uzytkownik_uzytkownik_id
INNER  JOIN  status s 
ON s.status_id = z.status_status_id;


