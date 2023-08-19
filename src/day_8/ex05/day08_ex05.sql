BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Session #2

SELECT SUM(rating) FROM pizzeria; -- Session #1 (21.9)

UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut'; -- Session #2
COMMIT; -- Session #2

SELECT SUM(rating) FROM pizzeria; -- Session #1 (19.9)
COMMIT; -- Session #1

SELECT SUM(rating) FROM pizzeria; -- Session #1 (19.9)
SELECT SUM(rating) FROM pizzeria; -- Session #2 (19.9)