SELECT person_id FROM person_order WHERE order_date='2022-01-07'
EXCEPT ALL
/**
 *  EXCEPT ВОЗВРАЩАЕТ ВСЕ СТРОКИ, ПРЕДСТАВЛЕННЫЕ В ПЕРВОМ НАБОРЕ,
 * НО НЕ ВО ВТОРОМ. GОВТОРЯЮЩИЕСЯ СТРОКИ ИСКЛЮЧАЮТСЯ ИЗ РЕЗУЛЬТАТА,
 * ЕСЛИ ЯВНО НЕ УКАЗАНО ALL
 * */
SELECT person_id FROM person_visits WHERE visit_date='2022-01-07'