-- 1. Stwórz  kwerendę wprowadzającą do tabeli actor następujące dane.

-- actor_id 201
-- first_name Andrew
-- last_name McConaughey
-- last_update 2020-10-21 14:12:23

INSERT INTO actor(first_name, last_name, last_update)
VALUES('Andrew','McConaughey','2020-10-21 14:12:23');

-- 2.Zmień wartość pola last_update w rekordzie wstawionym w zapytaniu 1 na aktualną datę i godzinę (pobraną dynamicznie)
UPDATE actor
SET last_update = CURRENT_TIMESTAMP
WHERE actor_id = 201;

-- 3.Dla wszystkich filmów z kategorii Action zwiększ długość o 10%
UPDATE film
SET length = length * 1.10
WHERE film_id IN(
    SELECT 
        film_id
    FROM 
        film_category
    WHERE category_id IN(
        SELECT 
            category_id
        FROM 
            category
        WHERE name = 'Action'
    )
);

-- 4.Dla pracownika ze sklepu o id 2 ustaw pole wartością DSWpass. Użyj haszowania SHA1 (funkcja wbudowana w SQL)
UPDATE staff
SET password = SHA1('DSWpass')
WHERE store_id = 2;

-- 5. Stwórz widok, który będzie zwierał nazwiska aktorów grających w filmach akcji
CREATE VIEW widok_aktorow_akcji AS
SELECT
    last_name
FROM 
    actor
WHERE actor_id IN(
    SELECT 
        actor_id
    FROM 
        film_actor
    WHERE film_id IN(
        SELECT 
            film_id
        FROM 
            film_category
        WHERE category_id IN(
            SELECT 
                category_id
            FROM 
                category
            WHERE name = 'Action'
        )
    )
);