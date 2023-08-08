SELECT
	order_date,
	concat(name, ' (age:',
	age,
	')') AS person_information
FROM
	person_order
/*
 * в этом запросе нет необходимости указывать какие-либо критерии объединения,
 * поскольку предложение NATURAL JOIN автоматически определяет столбцы,
 * имеющие одинаковые имена в обеих объединяемых таблица
 * */
NATURAL JOIN (SELECT id AS person_id, age, name FROM person) AS person 
ORDER BY
	order_date,
	person_information