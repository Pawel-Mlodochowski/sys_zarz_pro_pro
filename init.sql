DROP TABLE IF EXISTS czas_pracy CASCADE;
DROP TABLE IF EXISTS zadanie_uzytkownik CASCADE;
DROP TABLE IF EXISTS zadanie CASCADE;
DROP TABLE IF EXISTS uzytkownik CASCADE;
DROP TABLE IF EXISTS projekt CASCADE;
DROP TABLE IF EXISTS status CASCADE;
DROP TABLE IF EXISTS rola CASCADE;

CREATE TABLE rola (
  rola_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tytul VARCHAR(45) NOT NULL UNIQUE
);

CREATE TABLE status (
  status_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nazwa VARCHAR(45) NOT NULL UNIQUE,
  opis VARCHAR(45)
);

CREATE TABLE projekt (
  projekt_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nazwa VARCHAR(45) NOT NULL UNIQUE,
  opis VARCHAR(45),
  data_rozpoczecia TIMESTAMP,
  data_zakonczenia TIMESTAMP,
  utworzono TIMESTAMP NOT NULL DEFAULT now(),
  zaktualizowano TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE uzytkownik (
  uzytkownik_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  czy_aktywny BOOL,
  imie VARCHAR(45),
  nazwisko VARCHAR(45),
  email VARCHAR(45) UNIQUE,
  utworzono TIMESTAMP NOT NULL DEFAULT now(),
  zaktualizowano TIMESTAMP NOT NULL DEFAULT now(),
  rola_rola_id INT,
  CONSTRAINT fk_uzytkownik_rola
    FOREIGN KEY (rola_rola_id) REFERENCES rola (rola_id)
);

CREATE TABLE zadanie (
  zadanie_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tytul VARCHAR(45) NOT NULL,
  opis VARCHAR(45),
  data_utworzenia TIMESTAMP NOT NULL DEFAULT now(),
  termin TIMESTAMP,
  priorytet INT,
  zaktualizowano TIMESTAMP NOT NULL DEFAULT now(),
  projekt_projekt_id INT,
  status_status_id INT,
  CONSTRAINT fk_zadanie_projekt
    FOREIGN KEY (projekt_projekt_id) REFERENCES projekt (projekt_id),
  CONSTRAINT fk_zadanie_status
    FOREIGN KEY (status_status_id) REFERENCES status (status_id)
);

CREATE TABLE zadanie_uzytkownik (
  uzytkownik_uzytkownik_id INT NOT NULL,
  zadanie_zadanie_id INT NOT NULL,
  PRIMARY KEY (uzytkownik_uzytkownik_id, zadanie_zadanie_id),
  CONSTRAINT fk_zu_uzytkownik
    FOREIGN KEY (uzytkownik_uzytkownik_id) REFERENCES uzytkownik (uzytkownik_id),
  CONSTRAINT fk_zu_zadanie
    FOREIGN KEY (zadanie_zadanie_id) REFERENCES zadanie (zadanie_id)
);

CREATE TABLE czas_pracy (
  czas_pracy_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  data_rozpoczecia TIMESTAMP,
  data_zakonczenia TIMESTAMP,
  czas_trwania_sekundy DOUBLE PRECISION,
  utworzono TIMESTAMP NOT NULL DEFAULT now(),
  zaktualizowano TIMESTAMP NOT NULL DEFAULT now(),
  zadanie_zadanie_id INT,
  uzytkownik_uzytkownik_id INT,
  CONSTRAINT fk_cp_zadanie
    FOREIGN KEY (zadanie_zadanie_id) REFERENCES zadanie (zadanie_id),
  CONSTRAINT fk_cp_uzytkownik
    FOREIGN KEY (uzytkownik_uzytkownik_id) REFERENCES uzytkownik (uzytkownik_id)
);

CREATE INDEX idx_uzytkownik_rola_id ON uzytkownik (rola_rola_id);
CREATE INDEX idx_zadanie_projekt_id ON zadanie (projekt_projekt_id);
CREATE INDEX idx_zadanie_status_id ON zadanie (status_status_id);
CREATE INDEX idx_zu_uzytkownik_id ON zadanie_uzytkownik (uzytkownik_uzytkownik_id);
CREATE INDEX idx_zu_zadanie_id ON zadanie_uzytkownik (zadanie_zadanie_id);
CREATE INDEX idx_czas_pracy_zadanie_id ON czas_pracy (zadanie_zadanie_id);
CREATE INDEX idx_czas_pracy_uzytkownik_id ON czas_pracy (uzytkownik_uzytkownik_id);
