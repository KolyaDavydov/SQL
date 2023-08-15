/*
 * CREATE INDEX создаёт индексы по указанному столбцу(ам)
 * заданного отношения, которым может быть таблица или
 * материализованное представление. Индексы применяются в
 * первую очередь для оптимизации производительности базы данных
 * (хотя при неправильном использовании возможен и противоположный эффект).
 * */

CREATE INDEX idx_menu_pizzeria_id ON menu (pizzeria_id);
CREATE INDEX idx_person_order_person_id ON person_order (person_id);
CREATE INDEX idx_person_order_menu_id ON person_order (menu_id);
CREATE INDEX idx_person_visits_person_id ON person_visits (person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits (pizzeria_id);