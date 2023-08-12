(SELECT total_cost, '{' || begin_route || ',' || point2 || '}' AS tour
FROM routes
WHERE
	length(routes.begin_route)=7
	AND routes.total_cost=(SELECT min(routes.total_cost) FROM routes WHERE length(begin_route)=7)
ORDER BY 1, 2)
UNION ALL
(SELECT total_cost, '{' || begin_route || ',' || point2 || '}' AS tour
FROM routes
WHERE
	length(routes.begin_route)=7
	AND point2='a'
	AND routes.total_cost=(SELECT max(routes.total_cost) FROM routes WHERE length(begin_route)=7 AND point2 = 'a')
ORDER BY 1, 2)