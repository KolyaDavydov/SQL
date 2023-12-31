/*
 * BEGIN начинает блок транзакции, то есть обозначает, что все операторы после команды BEGIN
 * и до явной команды COMMIT или ROLLBACK будут выполняться в одной транзакции.
 * По умолчанию (без BEGIN) Postgres Pro выполняет транзакции в режиме «autocommit» (автофиксация),
 * то есть каждый оператор выполняется в своей отдельной транзакции,
 * которая неявно фиксируется в конце оператора
 * (если оператор был выполнен успешно; в противном случае транзакция откатывается)
 * */
-- запускаем две комнатной строки (сессии) и проверяем как работют обновления до и после COMMIT
-- Командная строка 1
BEGIN; -- начало сессии 1
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
UPDATE pizzeria SET rating = 5 WHERE name  = 'Pizza Hut'; -- внесли изменения рейтинга 

-- Командная строка 2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; -- рейтинг не обновится

-- Командная строка 1
COMMIT; -- публикация изменений для всех транзакций

-- Командная строка 2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut'; -- после COMMIT в первой сессии рейтинг обновится