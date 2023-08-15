/*
 * создадим временную таблицу исключительно для наглядности,
 * которую заполним теми данными которе хотим внести в `person_discount`
 * и что бы она имела жы такие же поля
 * row_number() over() - нумерует каждую строку по порядку
 * */
WITH temp AS (
	SELECT ROW_NUMBER() OVER() AS id, person_id, pizzeria_id,
	       (CASE WHEN count(pizzeria_id) = 1 THEN 10.5
	             WHEN count(pizzeria_id) = 2 THEN 22
	             ELSE 30
	             END ) AS discount
	FROM person_order
	JOIN menu ON menu.id = person_order.menu_id
	GROUP BY person_id, pizzeria_id
	)
-- после того ка проверили что таблица получилась отличной
-- копируем её в person_discounts
INSERT INTO person_discounts
SELECT * FROM temp