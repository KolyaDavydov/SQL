-- при запуске скрипта в каждой сессии : `SHOW TRANSACTION ISOLATION LEVEL;`
-- должно быть `read committed`, что значит:
-- Оператор видит только те строки, которые были зафиксированы до начала его выполнения.
-- Этот уровень устанавливается по умолчанию.

-- запускаем обе сессии в двух терминалах:
BEGIN; -- Session #1
BEGIN; -- Session #2

-- проверяем значение рейтинга в каждой сессии:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (5)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2 (5)

-- изменяем значение рейтинга в каждой сессии по разному.
-- При этом после того как мы в первой сессии выполним UPDATE появится подтверждение,
-- и после того как мы сделаем UPDATE во второй сессии она перейдет в режим ожидания:
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- Session #1 (4)
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Session #2

-- Следующая команда фиксирует текущую транзакцию и сохраняет все изменения:
-- после того когда мы в первой сессии сделаем COMMIT - во второй сессии у нас
-- терминал выйдет из режима ожидания
COMMIT; -- Session #1 (4)
COMMIT; -- Session #2 (3.6)

-- Проверяем значение рейтинга и видим, что оно везде одинаковое
-- и соответствует COMMITу который был позже
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (3.6)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2 (3.6)