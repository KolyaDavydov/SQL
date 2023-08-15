CREATE TABLE person_discounts
(id int8 PRIMARY KEY,
 person_id int8 NOT NULL,
 pizzeria_id int8 NOT NULL,
 discount numeric NOT NULL DEFAULT 0,
 CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
 CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
);