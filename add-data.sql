BEGIN;

INSERT INTO rola (tytul)
VALUES  ('Programista'), ('Projekt Manager');

INSERT INTO status (nazwa, opis)
VALUES ('Do zrobienia', 'Zadanie jeszcze nie rozpoczête'), ('Prace rozpoczête', 'Zadanie jest w trakcie realizacji'), ('Do testów', 'Zadanie jest przekazanie do testów'),
('Gotowe', 'Zadanie wykonane');

INSERT INTO projekt (nazwa, opis, data_rozpoczecia, data_zakonczenia)
VALUES
  (
    'System CRM',
    'Pierwszy projekt CRM w firmie',
    '2025-05-01 09:00:00',
    '2025-06-01 18:00:00'
  );

INSERT INTO uzytkownik (czy_aktywny, imie, nazwisko, email, rola_rola_id)
VALUES
  (
    true,
    'Jan',
    'Kowalski',
    'jan.kowalski@example.com',
    1
  );

INSERT INTO zadanie (tytul, opis, termin, priorytet, projekt_projekt_id, status_status_id)
VALUES
  (
    'Implementacja modu³u logowania',
    'Stworzyæ mechanizm logowania z JWT',
    '2025-05-25 17:00:00',
    5,
    1,
    1
  );

INSERT INTO zadanie_uzytkownik (uzytkownik_uzytkownik_id, zadanie_zadanie_id)
VALUES
  (1, 1);

INSERT INTO czas_pracy (
    data_rozpoczecia,
    data_zakonczenia,
    czas_trwania_sekundy,
    zadanie_zadanie_id,
    uzytkownik_uzytkownik_id
  )
VALUES
  (
    '2025-05-21 10:00:00',
    '2025-05-21 12:00:00',
    EXTRACT(EPOCH FROM ('2025-05-21 12:00:00'::timestamp - '2025-05-21 10:00:00'::timestamp)),
    1,
    1
  );

COMMIT;
