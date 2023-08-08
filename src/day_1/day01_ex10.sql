select
	PERSON.NAME as PERSON_NAME,
	MENU.PIZZA_NAME as PIZZA_NAME,
	PIZZERIA.NAME as PIZZERIA_NAME
from
	PERSON
join PERSON_ORDER on
	PERSON_ORDER.PERSON_ID = PERSON.ID
join MENU on
	PERSON_ORDER.MENU_ID = MENU.ID
join PIZZERIA on
	MENU.PIZZERIA_ID = PIZZERIA.ID
order by
	PERSON_NAME,
	PIZZA_NAME,
	PIZZERIA_NAME;