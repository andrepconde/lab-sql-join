# Lab | SQL Join
USE sakila;

# 1. List the number of films per category.

SELECT category.name, COUNT(film_category.film_id)
FROM category
INNER JOIN film_category
ON category.category_id = film_category.category_id
INNER JOIN film
ON film.film_id = film_category.film_id
GROUP by category.name, category.category_id;

# 2. Display the first and the last names, as well as the address, of each staff member.
SELECT *
FROM address;

SELECT staff_id, first_name, last_name, address
FROM staff
INNER JOIN address
ON address.address_id = staff.address_id
GROUP BY staff_id;

# 3. Display the total amount rung up by each staff member in August 2005.
SELECT staff_id ,SUM(amount)
FROM payment
WHERE MONTH(payment_date) = 8 AND YEAR(payment_date) = 2005
GROUP BY staff_id;

# 4. List all films and the number of actors who are listed for each film.
SELECT film.film_id, title, SUM(actor_id)
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
GROUP BY film_id;

# 5. Using the payment and the customer tables, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT first_name, last_name, SUM(amount)
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY last_name ASC;