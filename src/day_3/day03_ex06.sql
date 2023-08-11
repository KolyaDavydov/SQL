WITH temp AS (SELECT pizzeria.id, pizzeria.name AS pizzeria_name, pizzeria_id, pizza_name, price
		FROM pizzeria
		JOIN menu ON menu.pizzeria_id = pizzeria.id)
SELECT p1.pizza_name, p1.pizzeria_name AS pizzeria_name_1, p2.pizzeria_name AS pizzeria_name_2, p1.price
FROM temp AS p1
JOIN temp AS p2 ON p1.price = p2.price AND p1.pizza_name = p2.pizza_name
WHERE p1.price = p2.price AND p1.id > p2.id
ORDER BY 1