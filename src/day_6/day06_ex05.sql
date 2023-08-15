COMMENT ON TABLE person_discounts IS 'Таблица скидок в зависимости от количества заказов';

COMMENT ON COLUMN person_discounts.id IS 'идентификтор строк таблицы скидок';

COMMENT ON COLUMN person_discounts.person_id IS 'идентификтор пользователя';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'идентификатор пиццерии';

COMMENT ON COLUMN person_discounts.discount IS 'размер скидки в %';