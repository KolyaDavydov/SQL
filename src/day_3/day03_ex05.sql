WITH andrey_order AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN menu ON pizzeria.id=menu.pizzeria_id
	JOIN person_order ON person_order.menu_id=menu.id
	JOIN person ON person_order.person_id=person.id
	WHERE person.name='Andrey'),
	andrey_visit AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id=pizzeria.id
	JOIN person ON person_visits.person_id=person.id
	WHERE person.name='Andrey')
SELECT pizzeria_name FROM andrey_visit
EXCEPT
SELECT pizzeria_name FROM andrey_order
ORDER BY 1