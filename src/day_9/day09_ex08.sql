CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
	RETURNS TABLE (fibonacci bigint) AS $$
		WITH RECURSIVE fib(prev, next) AS (
			SELECT 0, 1
			UNION ALL
			SELECT next, prev + next FROM fib WHERE next < pstop
		)
		SELECT prev FROM fib
	$$ LANGUAGE SQL;
	
select * from fnc_fibonacci(100);
--select * from fnc_fibonacci();