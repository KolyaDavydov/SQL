/*
 * Уровень Serializable обеспечивает самую строгую изоляцию транзакций.
 * На этом уровне моделируется последовательное выполнение всех зафиксированных транзакций,
 * как если бы транзакции выполнялись одна за другой, последовательно, а не параллельно. 
 * */
-- в двух сессиях переходим в данный режим
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Session #2

--значение равно 3.6
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; -- Session #2
COMMIT; -- Session #2

-- значение по прежнему 3.6, но после COMMIT Оно поменяется
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1
COMMIT; -- Session #1


SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2