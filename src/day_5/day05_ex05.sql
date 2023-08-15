CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';
-- https://postgrespro.ru/docs/postgresql/14/indexes-partial
-- частичный уникальный индекс
/*
 * теперь мы сможем добавить строку со значениями (2-ое и 3-е)
 * которые уже присутствуют в таблице, но не сможем добавить,
 * когда у нас 2-ое и 3-е поле будут присутствовать и одновременно 4-ое
 * поле будет равно `2022-01-01`
 * */
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT person_id, menu_id
FROM person_order
WHERE order_date = '2022-01-01';