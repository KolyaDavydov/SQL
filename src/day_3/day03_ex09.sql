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