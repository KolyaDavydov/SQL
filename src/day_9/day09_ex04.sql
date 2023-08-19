CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar) AS $$
    SELECT * FROM person WHERE gender = 'female';
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar) AS $$
    SELECT * FROM person WHERE gender = 'male';
$$ LANGUAGE SQL;

-- для проверки что функции работают и с ними можно возвращать таблицы:
--SELECT *
--FROM fnc_persons_male();
--
--SELECT *
--FROM fnc_persons_female();