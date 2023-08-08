select
	NAME
from
	PIZZERIA
where
	ID not in (
	select
		PIZZERIA_ID
	from
		PERSON_VISITS)

select
	NAME
from
	PIZZERIA
where
	not exists (
	select
		PIZZERIA_ID
	from
		PERSON_VISITS
	where
		PERSON_VISITS.PIZZERIA_ID = PIZZERIA.ID);