SELECT m.pizza_name, m.price, p.name AS pizzeria_name
FROM person_order po 
FULL JOIN menu m ON m.id=po.menu_id 
JOIN pizzeria p ON m.pizzeria_id=p.id 
WHERE m.id NOT IN (SELECT menu_id FROM person_order)
ORDER BY 1, 2, 3

