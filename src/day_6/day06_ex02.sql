SELECT p.name, m.pizza_name, m.price, m.price - (m.price * pd.discount / 100) AS discount_price, pi.name
FROM menu m
JOIN person_order po ON po.menu_id = m.id 
JOIN person p ON p.id=po.person_id 
JOIN person_discounts pd ON pd.person_id =p.id 
JOIN pizzeria pi ON pd.pizzeria_id =pi.id
ORDER BY 1,2;