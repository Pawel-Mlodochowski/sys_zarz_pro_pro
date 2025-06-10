CREATE OR REPLACE FUNCTION get_user_total_hours(p_user_id INT)
  RETURNS NUMERIC AS
$$
DECLARE
  total_seconds DOUBLE PRECISION;
BEGIN
  SELECT SUM(czas_trwania_sekundy)
    INTO total_seconds
  FROM czas_pracy
  WHERE uzytkownik_uzytkownik_id = p_user_id;

  IF total_seconds IS NULL THEN
    RETURN 0;
  END IF;

  -- Przeliczamy sekundy na godziny (2 miejsca po przecinku)
  RETURN ROUND((total_seconds / 3600.0)::numeric, 2);END;
$$ LANGUAGE plpgsql;


SELECT get_user_total_hours(1) AS total_hours;


CREATE OR REPLACE PROCEDURE assign_task_to_user(
  p_task_id   INT,
  p_user_id   INT
)
LANGUAGE plpgsql
AS $$
BEGIN
  -- Sprawdzamy, czy ju¿ nie ma takiego przypisania
  IF EXISTS(
    SELECT 1 FROM zadanie_uzytkownik
    WHERE zadanie_zadanie_id = p_task_id
      AND uzytkownik_uzytkownik_id = p_user_id
  ) THEN
    RAISE NOTICE 'Zadanie % ju¿ przypisane do u¿ytkownika %', p_task_id, p_user_id;
  ELSE
    INSERT INTO zadanie_uzytkownik
      (zadanie_zadanie_id, uzytkownik_uzytkownik_id)
    VALUES
      (p_task_id, p_user_id);
  END IF;
END;
$$;

CALL assign_task_to_user(1, 1);


ALTER USER Postgres WITH PASSWORD '1234';













