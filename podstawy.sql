-- Pracuj na bazie danych Sakila. Wklej same zapytania. Stosuj czytelne formatowanie
-- 1.Wyświetl wszystkie nazwiska aktorów
SELECT
    last_name
FROM
    actor;

-- 2.Wyświetl wszystkie unikatowe kody pocztowe z tabeli Adres
SELECT DISTINCT
    postal_code
FROM
    address;

-- 3.Wyświetl tytuł, opis, ocenę oraz długość filmu dla filmów, które trwają powyżej 3 godzin
SELECT
    title,
    description,
    rating,
    length
FROM
    film
WHERE
    length > 180;

-- 4.Wyświetl płatności, który odbyły się po 27 maja 2005
SELECT
    *
FROM
    payment
WHERE
    payment_date > '2005-05-27';

-- 5.Wyświetl wszystkich klientów, który adres email kończy się na .com
SELECT
    *
FROM
    customer
WHERE
    email LIKE '%.com';

-- 6.Wyświetl wszystkich klientów, który adres email kończy się na .com
SELECT
    *
FROM
    customer
WHERE
    email LIKE '%.com';

to samo co w piątym

-- ##########################################################################
-- wszyscy klienci mają adres w domenie sakilacustomer.org, co można sprawdzić tak:
SELECT
	COUNT(
        CASE WHEN email LIKE '%.com' THEN email
        END
    ) AS kropkaCom,
    COUNT(
        CASE WHEN email LIKE '%sakilacustomer.org' THEN email
        END
    ) AS sakilaCustomerOrg,
    COUNT(*) 
    AS wszyscy
FROM
    customer;