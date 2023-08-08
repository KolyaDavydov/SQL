select
	ORDER_DATE,
	CONCAT (NAME,
	' (age:',
	AGE,
	')') as PERSON_INFORMATION
from
	PERSON_ORDER
natural join (
	select
		ID as PERSON_ID,
		NAME,
		AGE
	from
		PERSON) as PERSON
order by
	ORDER_DATE,
	PERSON_INFORMATION;