-- 1.Ile jest aktorów, których pierwsze imię to 'Scarlett'?
select     
    count(*) Scarlett_count
from
    actor
where 
    first_name = 'Scarlett';

-- 2.Podaj średni czas trwania (w godzinach) wszystkich filmów w bazie.
select     
    avg(length) avg_length
from
    film;

-- 3.Podaj średni czas trwania wszystkich filmów w bazie w rozbiciu na kategorie.
select
category.name as category,
	avg(length) avg_length
from
    film
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)

group by 
    category.name
order by avg_length;

-- 4.Dla każdego filmu podaj jego tytuł oraz liczbę egzemplarzy tego filmu w posiadaniu wypożyczalni.
select
title,
count(inventory_id) inventory_count
from
    film
INNER JOIN inventory USING(film_id)

GROUP BY title

-- 5.Podaj nazwiska i imiona (jako jedno pole) 5 pierwszych aktorów, którzy wystąpili w największej liczbie filmów.
select
concat(actor.last_name,' ', actor.first_name) as actor_full_name,
count(film_id) film_count
from
    actor
INNER JOIN film_actor USING(actor_id)

GROUP BY actor_full_name
ORDER BY film_count DESC
LIMIT 5;

-- 6.Wypisz nazwy kategorii i liczbę filmów przypisanych do tej kategorii.
select
category.name as category,
	count(film_id) film_count
from
    film
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)

group by 
    category.name
order by film_count DESC;