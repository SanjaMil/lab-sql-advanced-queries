use sakila;
-- Lab | SQL Advanced queries
-- List each pair of actors that have worked together.
select fa.film_id, title, fa.actor_id, fa1.actor_id from film_actor fa
join film_actor fa1 
on fa.film_id = fa1.film_id
and fa.actor_id <> fa1.actor_id
JOIN film f 
on fa.film_id = f.film_id
group by 1;


-- For each film, list actor that has acted in more films.
select distinct actor_id, count(distinct film_id) from film_actor
group by 1
order by 2;

select  actor, film_id from (
	select *, rank() over ( partition by actor order by suma desc) ranking from (
		select actor_id as actor, count(distinct film_id) suma, film_id from film_actor
		group by 1
		order by 2) sub1
	)sub2;