select
	PIZZA_NAME as OBJECT_NAME
from
	MENU
union all
select
	NAME as OBJECT_NAME
from
	PERSON
order by
	OBJECT_NAME