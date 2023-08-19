CREATE TABLE person_audit (
	-- создаем значение даты и времени с типом `timestamp`, не NULL, на момент совершения транзакции
	created timestamp WITH time ZONE NOT NULL DEFAULT now(),
	-- possible values I (insert), D (delete), U (update)
	type_event char(1) DEFAULT 'I' NOT NULL,
	-- создаем ограничение-проверку и присваиваем ей отдельное имя
	CONSTRAINT ch_type_event CHECK (type_event = 'I' OR type_event = 'U' OR type_event = 'D'),
	row_id bigint NOT NULL,
	name varchar,
	age integer,
	gender varchar,
	address varchar
	);
	
/*
 * В PL/pgSQL можно создавать триггерные функции,
 * которые будут вызываться при изменениях
 * данных или событиях в базе данных.
 * Триггерная функция создаётся командой CREATE FUNCTION,
 * при этом у функции не должно быть аргументов,
 * а типом возвращаемого значения должен быть trigger
 * (для триггеров, срабатывающих при изменениях данных)
 * 
 * Триггерная функция должна вернуть либо NULL, либо запись/строку,
 * соответствующую структуре таблице, для которой сработал триггер.
 *
 * `CREATE OR REPLACE FUNCTION` создаёт новую функцию,
 * либо заменяет определение уже существующей
 * */

-- СОздаем тригерную функцию
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $$
	--Когда функция на PL/pgSQL срабатывает как триггер,
	--в блоке верхнего уровня автоматически создаются несколько
	--специальных переменных, одна из них - 
	--`TG_OP` - Тип данных text.
	-- Строка, содержащая INSERT, UPDATE, DELETE или TRUNCATE,
	-- в зависимости от того, для какой операции сработал триггер.
	--
	-- NEW - Тип данных RECORD. Переменная содержит новую строку
	-- базы данных для команд INSERT/UPDATE в триггерах уровня строки.
	BEGIN
		IF (TG_OP = 'INSERT') THEN
			INSERT INTO person_audit(created, type_event, row_id, name, age, gender,address)
			SELECT NOW(), 'I', NEW.*;
			END IF;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

-- СОздаем триггер - Триггер будет связан с указанной таблицей,
-- представлением или сторонней таблицей и будет выполнять
-- заданную функцию `fnc_trg_person_insert_audit` при определённых событиях.
CREATE TRIGGER trg_person_insert_audit
-- Определяет, будет ли заданная функция вызываться до, после или вместо события. Для триггера ограничения можно указать только AFTER.	
AFTER INSERT ON person
	-- Триггер с пометкой FOR EACH ROW вызывается один раз для каждой строки, изменяемой в процессе операции
	FOR EACH ROW
	EXECUTE FUNCTION fnc_trg_person_insert_audit();
	
INSERT INTO person(id, name, age, gender, address)
	VALUES (10,'Damir', 22, 'male', 'Irkutsk');

/*
 * после этого можно увидеть что тригер сработал
 * и у нас внеслись значения и в person и в person_audit
 * */