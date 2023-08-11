WITH woman_pizzeria AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
	WHERE person.gender= 'female'),
	man_pizzeria AS (SELECT pizzeria.name FROM pizzeria
	JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
	WHERE person.gender= 'male'),
	more_woman_pizzeria AS (SELECT * FROM woman_pizzeria
	          EXCEPT ALL
	          SELECT * FROM man_pizzeria),
	more_man_pizzeria AS (SELECT *  FROM man_pizzeria
	          EXCEPT ALL
	          SELECT * FROM woman_pizzeria)
SELECT * FROM more_woman_pizzeria
UNION
SELECT * FROM more_man_pizzeria
ORDER BY 1