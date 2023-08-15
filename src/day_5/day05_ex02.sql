CREATE INDEX idx_person_name ON person(UPPER(name));
SET enable_seqscan = OFF; -- принуждаем сканировать по индексу
EXPLAIN ANALYZE
SELECT *
FROM person
WHERE (UPPER(name) IS NOT NULL);