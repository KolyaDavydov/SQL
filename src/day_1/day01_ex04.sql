select
	PERSON_ID
from
	PERSON_ORDER
where
	ORDER_DATE = '2022-01-07'
/**
 *  EXCEPT ВОЗВРАЩАЕТ ВСЕ СТРОКИ, ПРЕДСТАВЛЕННЫЕ В ПЕРВОМ НАБОРЕ,
 * НО НЕ ВО ВТОРОМ. GОВТОРЯЮЩИЕСЯ СТРОКИ ИСКЛЮЧАЮТСЯ ИЗ РЕЗУЛЬТАТА,
 * ЕСЛИ ЯВНО НЕ УКАЗАНО ALL
 * */
except all
select
	PERSON_ID
from
	PERSON_VISITS
where
	VISIT_DATE = '2022-01-07';