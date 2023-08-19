SELECT
	p.name,
	count(*) AS count_of_orders,
	round(avg(m.price), 2) AS average_price,
	max(m.price) AS max_price,
	min(m.price) AS min_price
FROM pizzeria p
JOIN menu m ON m.pizzeria_id=p.id
JOIN person_order po ON po.menu_id=m.id
GROUP BY p.name
ORDER BY p.name
