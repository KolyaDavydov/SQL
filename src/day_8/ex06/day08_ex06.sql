BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #2

SELECT SUM(rating) FROM pizzeria; -- Session #1 (19.9)

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- Session #2
COMMIT; -- Session #2

SELECT SUM(rating) FROM pizzeria; -- Session #1 (19.9)
COMMIT; -- Session #1

SELECT SUM(rating) FROM pizzeria; -- Session #1 (23.9)
SELECT SUM(rating) FROM pizzeria; -- Session #2 (23.9)