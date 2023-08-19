WITH orders AS (
	SELECT p.name, count(*) AS count, 'order' AS action_type
	FROM pizzeria p 
	JOIN menu m ON m.pizzeria_id =p.id 
	JOIN person_order po ON po.menu_id =m.id 
	GROUP BY p.name
	ORDER BY count DESC
	),
	visit AS (
	SELECT p2.name, count(*) AS count, 'visit' AS action_type
	FROM pizzeria p2  
	JOIN person_visits pv ON pv.pizzeria_id = p2.id 
	GROUP BY p2.name
	ORDER BY count DESC
	), total AS (
	SELECT * FROM orders
	UNION 
	SELECT * FROM visit
	ORDER BY action_type ASC, count DESC)
SELECT name, sum(count) AS total_count
FROM total
GROUP BY name
ORDER BY total_count DESC;
