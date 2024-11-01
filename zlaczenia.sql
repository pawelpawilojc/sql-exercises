-- 1.Wyświetl wszystkie filmy, które są po włosku
SELECT
    *
FROM
    film
INNER JOIN language USING(language_id)
WHERE 
	language.name = 'Italian';

-- ###############################################
-- (wszystkie są po angielsku)

-- 2.Wyświetl wszystkie płatności klienta o nazwisku WILLIAMS
SELECT
    *
FROM
    payment
INNER JOIN customer USING(customer_id)
WHERE
    customer.last_name = 'WILLIAMS';

-- 3.Wyświetl wszystkie filmy z kategorii Sports
SELECT
    *
FROM
    film
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
WHERE
    category.name = 'Sports';

-- 4.Wyświetl nazwiska aktorów grających w ANGELS LIFE
SELECT
    last_name
FROM
    actor
INNER JOIN film_actor USING(actor_id)
INNER JOIN film USING(film_id)
WHERE
    film.title = 'ANGELS LIFE';

-- 5.Wyświetl nazwiska pracowników pracujących  na Słowacji
SELECT
    last_name
FROM
    staff
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
WHERE
    country.country = 'Slovakia';

-- 6.Z jakiego kraju pochodzi klient o nazwisku GARCIA?
SELECT
    country
FROM
    country
INNER JOIN city USING(country_id)
INNER JOIN address USING(city_id)
INNER JOIN customer USING(address_id)
WHERE
    customer.last_name = 'GARCIA';