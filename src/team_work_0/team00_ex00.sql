/*
 * Создаем таблицу согласно условияю задачи и заполняем данными
 * */
CREATE TABLE nodes (point1 varchar, point2 varchar, cost integer);

INSERT INTO nodes VALUES
			('a', 'b', 10),
			('b', 'a', 10),
			('a', 'c', 15),
			('c', 'a', 15),
			('a', 'd', 20),
			('d', 'a', 20),
			('b', 'd', 25),
			('d', 'b', 25),
			('b', 'c', 35),
			('c', 'b', 35),
			('c', 'd', 30),
			('d', 'c', 30);

/*
 * создадим табличку-представление 'routes' с использованием рекурсии
 * Представление сосздаем исклчительно для удобства и возможности просмотра содержимого
 * Описание столбцов:
 * 1. begin_route - строки с точками через запятую, будет увеличиваться количество точек и их комбинации
 * 2,3. point1 и point2 - точки начала и конца отрезка, который будет приплюсовываться к начальному begin_route
 * 4. cost - стоимость отрезка point1:point2
 * 5. общая стоимость пути begin_route:point2
 * */
CREATE VIEW routes AS (
	WITH RECURSIVE routes_by_recursive AS (
--		стартовая часть рекурсии:
		SELECT
			point1 AS begin_route, point1, point2, cost, cost AS total_cost
		FROM
			nodes
		WHERE
			point1='a'
		UNION ALL 
		-- рекурсивная часть:
		SELECT 
			prev.begin_route || ',' || prev.point2 AS begin_route,
			next.point1,
			next.point2,
			prev.cost,
			prev.total_cost + next.cost AS total_cost
		FROM
			nodes AS next
		JOIN routes_by_recursive AS prev ON next.point1=prev.point2
		WHERE begin_route NOT LIKE '%' || prev.point2 || '%'
	)
	SELECT * FROM routes_by_recursive
);
/*
 * Делаем выборку из поученой таблицы 'routes' где нам нужно было что б были все точки и сумма была минимальной
 * */
SELECT total_cost, '{' || begin_route || ',' || point2 || '}' AS tour
FROM routes
WHERE
	length(routes.begin_route)=7
	AND routes.total_cost=(SELECT min(routes.total_cost) FROM routes WHERE length(begin_route)=7)
ORDER BY 1, 2;