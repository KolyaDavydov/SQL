select
	ORDER_DATE as ACTION_DATE,
	PERSON_ID as PERSON_ID
from
	PERSON_ORDER
intersect
/*--INTERSECT (ПЕРЕСЕЧЕНИЕ) – ЭТО ОПЕРАТОР TRANSACT-SQL,
 * КОТОРЫЙ ВЫВОДИТ ОДИНАКОВЫЕ СТРОКИ ИЗ ПЕРВОГО, ВТОРОГО
 * И ПОСЛЕДУЮЩИХ НАБОРОВ ДАННЫХ. ДРУГИМИ СЛОВАМИ, ОН ВЫВЕДЕТ
 * ТОЛЬКО ТЕ СТРОКИ, КОТОРЫЕ ЕСТЬ КАК В ПЕРВОМ РЕЗУЛЬТИРУЮЩЕМ НАБОРЕ, ТАК И ВО ВТОРОМ*/
select
	VISIT_DATE as ACTION_DATE,
	PERSON_ID as PERSON_ID
from
	PERSON_VISITS
order by
	ACTION_DATE,
	PERSON_ID desc