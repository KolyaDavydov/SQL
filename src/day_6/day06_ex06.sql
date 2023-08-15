/*
 * CREATE SEQUENCE - создает специальный объект - последовательность
 * (это специальная таблица из одной строки).
 * Обычно используются для получения уникальных идентификаторов строк таблиц
 * После создания последовательности работать с ней можно,
 * вызывая функции nextval, currval и setval
 * */
-- создаем последовательность начиная от 1:
CREATE SEQUENCE seq_person_discounts START 1;
-- функция setval - устанваливает для объекта последовательнотси текущее значние
SELECT setval('seq_person_discounts', (SELECT max(id) FROM person_discounts));
-- nextval - Продвигает объект последовательности к следующему значению и возвращает это значение.
ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');