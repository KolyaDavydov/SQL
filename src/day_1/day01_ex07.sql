select
	ORDER_DATE,
	CONCAT (NAME, ' (age:',	AGE, ')') as PERSON_INFORMATION
from
	PERSON_ORDER
join PERSON on
	PERSON_ORDER.PERSON_ID = PERSON.ID
order by
	ORDER_DATE,
	PERSON_INFORMATION;