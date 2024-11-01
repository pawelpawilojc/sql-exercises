-- 1.Podaj nazwy miejscowości, w których znajdują się wypożyczalnie w Kanadzie. (UWAGA wpis w tabeli City nie oznacza, że w danej miejscowości jest wypożyczalnia)
SELECT
    city
FROM
    city
WHERE
    city_id IN(
    SELECT
        city_id
    FROM
        address
    WHERE
        address_id IN(
        SELECT
            address_id
        FROM
            store
        WHERE
            address_id IN(
            SELECT
                address_id
            FROM
                address
            WHERE
                city_id IN(
                SELECT
                    city_id
                FROM
                    city
                WHERE
                    country_id IN(
                    SELECT
                        country_id
                    FROM
                        country
                    WHERE
                        country = 'Canada'
                )
            )
        )
    )
);

-- 2.Podaj tytuły filmów, które nie zostały nigdy wypożyczone
SELECT
    title
FROM
    film
WHERE film_id IN(
    SELECT
        film_id
    FROM
    inventory
    WHERE inventory_id NOT IN(
        SELECT
            inventory_id
        FROM
            rental
    )
);

-- 3.Wyświetl listę państw, z których nie pochodzi żaden klient
SELECT
    country
FROM
    country
WHERE country_id IN(
    SELECT
        country_id
    FROM
        city
    WHERE city_id IN(
        SELECT
            city_id
        FROM
            address
        WHERE address_id NOT IN(
            SELECT
                address_id
            FROM
                customer
        )
    )
);

-- 4.Podaj listę filmów, w których grał PARKER GOLDBERG
SELECT
    title
FROM
    film
WHERE film_id IN(
    SELECT
        film_id
    FROM
        film_actor
    WHERE actor_id IN(
        SELECT
            actor_id
        FROM
            actor
        WHERE first_name = 'PARKER' AND last_name = 'GOLDBERG'
    )
);

-- 5.Która kategoria posiada najmniej filmów?
SELECT
    name
FROM
    category
WHERE
    category_id = (
        SELECT
            category_id
        FROM
            (
                SELECT
                    category_id,
                    COUNT(*) AS films_in_category
                FROM
                    film_category
                GROUP BY
                    category_id
                ORDER BY
                    films_in_category ASC
                LIMIT 1
            ) AS t
    );

-- 6.Wypisz listę pracowników, którzy nie obsłużyli nigdy żadnej płatności
SELECT
	staff_id, first_name, last_name
FROM
    staff
WHERE
    staff_id NOT IN(
        SELECT
            staff_id
        FROM
            payment
    )
;

-- NULL, jest tylko 2 pracowników, obaj coś sprzedawali