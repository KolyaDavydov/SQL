SELECT order_date AS action_date, person_id FROM person_order
INTERSECT 
/*--INTERSECT (ПЕРЕСЕЧЕНИЕ) – ЭТО ОПЕРАТОР TRANSACT-SQL,
 * КОТОРЫЙ ВЫВОДИТ ОДИНАКОВЫЕ СТРОКИ ИЗ ПЕРВОГО, ВТОРОГО
 * И ПОСЛЕДУЮЩИХ НАБОРОВ ДАННЫХ. ДРУГИМИ СЛОВАМИ, ОН ВЫВЕДЕТ
 * ТОЛЬКО ТЕ СТРОКИ, КОТОРЫЕ ЕСТЬ КАК В ПЕРВОМ РЕЗУЛЬТИРУЮЩЕМ НАБОРЕ, ТАК И ВО ВТОРОМ*/
SELECT visit_date AS action_date, person_id FROM person_visits
ORDER BY action_date, person_id DESC