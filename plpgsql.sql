DROP FUNCTION get_total_number
CREATE OR REPLACE FUNCTION get_total_number() RETURNS bigint AS $$
BEGIN
	RETURN SUM(units_in_stock) FROM products;
END;
$$ LANGUAGE plpgsql

SELECT get_total_number();


CREATE OR REPLACE FUNCTION get_price(OUT maxp,OUT minp) AS $$
BEGIN
	maxp := MAX(unit_price) FROM products;
	minp := MIN(unit_price) FROM products;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_price(OUT maxp real,OUT minp real) AS $$
BEGIN
	SELECT MAX(unit_price),MIN(unit_price)
	INTO maxp,minp
	FROM products;
END;
$$ LANGUAGE plpgsql;

SELECT get_price();


CREATE OR REPLACE FUNCTION get_(IN cus_country varchar) RETURNs SETOF customers AS $$
BEGIN
	RETURN QUERY 
	SELECT * 
	FROM customers
	WHERE country = cus_country;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_('USA');

CREATE OR REPLACE FUNCTION get_square(a int,b int) RETURNS int AS $$
DECLARE
	mul int;
BEGIN
	mul = a * b;
	RETURN mul;
END;
$$ LANGUAGE plpgsql;

SELECT get_square(5,4);


CREATE OR REPLACE FUNCTION fib(n int) RETURNS int AS $$
DECLARE
	counter int = 0;
	i int = 0;
	j int = 1;
BEGIN
	IF n < 1 THEN
		RETURN 0;
	END IF;
	
	WHILE counter <= n
	--EXIT WHEN counter > n
	LOOP
		counter = counter + 1;
		SELECT j,i+j INTO i,j;
	END LOOP;
	
	RETURN i;
END;
$$ LANGUAGE plpgsql;

SELECT fib(4)


DO $$
BEGIN
	FOR counter IN 1..5 BY 2
	--FOR counter IN REVERSE 5..1
	LOOP 
		RAISE NOTICE 'asdf';
	END LOOP;
END $$;


CREATE OR REPLACE FUNCTION retres() RETURNS SETOF int AS $$
BEGIN
	RETURN NEXT 1;
	RETURN NEXT 5;
END;
$$ LANGUAGE plpgsql;

SELECT retres();