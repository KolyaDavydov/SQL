-- day03_ex07
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'greek pizza', 800);
-- day_03_ex08
INSERT INTO menu VALUES
	((SELECT MAX(id) FROM menu) + 1,
	 (SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
	 'sicilian pizza', 900);
-- day03_ex09
INSERT INTO person_visits VALUES
	((SELECT MAX(id) FROM person_visits) + 1,
	 (SELECT person.id FROM person WHERE name = 'Denis'),
	 (SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
	 '2022-02-24');
INSERT INTO person_visits VALUES
	 ((SELECT MAX(id) FROM person_visits) + 1,
	 (SELECT person.id FROM person WHERE name = 'Irina'),
	 (SELECT pizzeria.id FROM pizzeria WHERE name = 'Dominos'),
	 '2022-02-24');
-- day03_ex10
INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT max(id) + 1 FROM person_order),
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), '2022-02-24'),
       ((SELECT max(id) + 2 FROM person_order),
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), '2022-02-24');
-- day03_ex11
UPDATE menu SET price = price*0.9
WHERE pizza_name ='greek pizza';
-- day03_ex12
WITH tmp AS (
    SELECT (SELECT MIN(id) FROM person) AS min_person_id,
        (SELECT MAX(id) FROM person) AS max_person_id,
        (SELECT MAX(id) FROM person_order) AS max_old_order,
        (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS pizza_id
		)
INSERT INTO
    person_order (SELECT  generate_series(
                max_old_order + min_person_id,
                max_old_order + max_person_id),
            generate_series(min_person_id, max_person_id),
            pizza_id,
            '2022-02-25'
        FROM tmp
    );
-- day03_ex13
DELETE FROM person_order WHERE order_date = '2022-02-25';

DELETE FROM menu WHERE pizza_name = 'greek pizza';

-- day04_ex07
INSERT INTO person_visits VALUES(
        (SELECT MAX(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        '2022-01-08');
