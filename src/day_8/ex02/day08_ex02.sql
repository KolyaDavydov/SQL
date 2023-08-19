/*
 * В режиме Repeatable Read видны только те данные, которые были зафиксированы до начала транзакции,
 * но не видны незафиксированные данные и изменения,
 * произведённые другими транзакциями в процессе выполнения данной транзакции.
 * (Однако запрос будет видеть эффекты предыдущих изменений в своей транзакции,
 * несмотря на то, что они не зафиксированы.)
 * */

-- В каждой сессии переходим в режим REPEATABLE READ
-- После перехода можно проверить текущий режим транзакий с помощью команды `SHOW TRANSACTION ISOLATION LEVEL;`
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Session #2

-- Проверяем текущее значение и оно равно 3.6 в обоих сессиях:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1 (3.6)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2 (3.6)

-- обновляем данные сначала на первой сесси, после попытки обновления на второй сессии - в режим ожидания переходит она
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- Session #1
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Session #2 

-- после того как введем COMMIT в первой сессии у нас во второй сесси выходит ошибка:
-- `ERROR:  could not serialize access due to concurrent update`
-- после этого как мы сделаем COMMIT на второй сессии у нас выйдет 
-- ROLLBACK - ROLLBACK откатывает текущую транзакцию и приводит к аннулированию всех изменений, произведённых транзакцией.
COMMIT; -- Session #1
COMMIT; -- Session #2

-- проверив данные после манипуляций мы увидим что изменения второй сессии не сохранились,
-- потому что данный режим тразакций нам это не позволяет
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Session #2