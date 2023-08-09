SELECT
	missing_date::date
FROM
	generate_series('2022-01-01',
	'2022-01-10',
	INTERVAL '1 day') AS missing_date
LEFT JOIN (
	SELECT
		*
	FROM
		person_visits
	WHERE
		person_id = 1
		OR person_id = 2
    ) AS p ON
	p.visit_date = missing_date
WHERE
	id IS NULL
ORDER BY visit_date