SELECT NAME,
	RATING
FROM PIZZERIA
WHERE RATING >= 3.5
	AND RATING <= 5.0
ORDER BY RATING;

SELECT NAME,
	RATING
FROM PIZZERIA
WHERE RATING BETWEEN 3.5 AND 5
ORDER BY RATING