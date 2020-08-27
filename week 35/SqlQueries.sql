use sakila;

-- Task 1.3
-- **opgave 1
-- SELECT *FROM film WHERE length > 180

-- **opgave 2
-- Select * from actor where first_name='Bob' OR first_name='Fred'

-- **opgave 3
--SELECT * FROM film WHERE title LIKE '%mad%'

-- **opgace 4
-- SELECT count(*) FROM film WHERE rating='PG'

-- **opgave 5
-- SELECT TOP 10 * FROM film order by rental_rate desc

-- **opgave 6
-- DECLARE @lastUpdate date 
-- SELECT @lastUpdate = last_update FROM film WHERE film_id=1
-- SELECT DATEDIFF(day, @lastUpdate, GETDATE())

-- **opgave 7
-- SELECT rating, COUNT(*) FROM film group by rating

-- **opgave 8
-- SELECT email, address, postal_code FROM customer LEFT JOIN address ON customer.address_id = address.address_id

-- **opgave 9
/*
SELECT SUM(p.amount) AS cost FROM film 
    INNER JOIN film_category fc ON film.film_id = fc.film_id 
	INNER JOIN category c ON fc.category_id = c.category_id 
	INNER JOIN inventory i ON film.film_id = i.film_id
	INNER JOIN rental r ON i.inventory_id = r.inventory_id
	INNER JOIN payment p ON r.rental_id = p.rental_id
WHERE c.name = 'Horror'
*/
