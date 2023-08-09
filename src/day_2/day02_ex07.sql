SELECT p.name
FROM menu m
JOIN pizzeria p ON p.id=m.pizzeria_id
JOIN person_visits pv ON pv.pizzeria_id = p.id 
JOIN person p2 ON pv.person_id = p2.id 
WHERE p2.name = 'Dmitriy' AND pv.visit_date = '2022-01-08' AND m.price < 800
