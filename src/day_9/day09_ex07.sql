CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) 
	RETURNS NUMERIC AS $$
    	SELECT min(num) FROM UNNEST(arr) AS num;
	$$ LANGUAGE SQL;

-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);