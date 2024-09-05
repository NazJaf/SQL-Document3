
--1)List all customers who live in Texas (use JOINs)
select c.first_name
from customer c  
left join address a on c.address_id = a.address_id 
where a.district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full Name
 select c.first_name, c.last_name , p.amount 
 from customer c 
 left join payment p on c.customer_id =p.customer_id 
 where p.amount > 6.99;
 
--3. Show all customers names who have made payments over $175(usesubqueries)
SELECT c.first_name 
FROM customer c
JOIN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
) high_value_customers ON c.customer_id = high_value_customers.customer_id;
  --4. List all customers that live in Nepal (use the citytable)
SELECT c.first_name 
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
WHERE ci.city = 'Nepal';

--5.Which staff member had the mosttransactions?
select s.first_name  , count(p.payment_id)as transaction_count
from staff s 
join payment p on p.staff_id=s.staff_id 
group by s.staff_id 
order by transaction_count desc 
limit 1;
--6.How many movies of each rating are
there?
select count(film_id),rating
from film f 
group by rating;

--7. 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.customer_id IN (
    SELECT p.customer_id
    FROM payment p
    WHERE p.amount > 6.99
    GROUP BY p.customer_id
    HAVING COUNT(p.payment_id) = 1
);
--8.how many free rentals did our stores give away?
SELECT COUNT(*)
FROM payment
WHERE amount = 0;