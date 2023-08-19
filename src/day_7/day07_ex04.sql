SELECT person.name, count(*) AS count_of_visits
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY person.name
-- `HAVING` - фильтрует сгруппированные строки
HAVING COUNT(*) > 3;
