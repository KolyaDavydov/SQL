SELECT name FROM person p 
JOIN person_order po ON po.person_id = p.id 
JOIN menu m ON po.menu_id =m.id 
WHERE p.gender = 'female' AND m.pizza_name='pepperoni pizza'
INTERSECT  
SELECT name FROM person p 
JOIN person_order po ON po.person_id = p.id 
JOIN menu m ON po.menu_id =m.id 
WHERE p.gender = 'female' AND m.pizza_name='cheese pizza'
ORDER BY name

