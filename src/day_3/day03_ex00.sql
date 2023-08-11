SELECT m.pizza_name, m.price, p.name AS pizzeria_name, pv.visit_date
FROM menu m
JOIN pizzeria p ON m.pizzeria_id=p.id 
JOIN person_visits pv ON pv.pizzeria_id = p.id 
JOIN person p2 ON pv.person_id=p2.id 
WHERE m.price <=1000 AND m.price>=800 AND p2.name='Kate'
ORDER BY 1, 2, 3
