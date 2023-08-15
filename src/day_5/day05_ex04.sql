/*
 * `UNIQUE` -указывает, что система должна контролировать повторяющиеся
 * значения в таблице при создании индекса (если в таблице уже есть
 * данные) и при каждом добавлении данных.
 * Попытки вставить или изменить данные, при которых будет нарушена
 * уникальность индекса, будут завершаться ошибкой.
 * */

CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;
