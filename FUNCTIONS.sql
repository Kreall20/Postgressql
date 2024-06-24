CREATE FUNCTION newfunc(IN productid int) RETURNS int AS $$
	SELECT SUM(units_in_stock) 
	FROM products 
	WHERE product_id = productid
$$ LANGUAGE SQL;
	
Select * From newfunc(1) as sum;

DROP FUNCTION  getavg
CREATE FUNCTION getavg() RETURNS SETOF double precision AS $$
	SELECT AVG(unit_price)
	FROM products
	GROUP BY category_id
$$ LANGUAGE SQL;

SELECT * FROM getavg();


CREATE FUNCTION getavgprices(OUT sum_price real,OUT avg_price float8) RETURNS SETOF RECORD AS $$
	SELECT SUM(unit_price),AVG(unit_price)
	FROM products
	GROUP BY category_id
$$ LANGUAGE SQL;


SELECT sum_price,avg_price FROM getavgprices();

CREATE OR REPLACE FUNCTION getavgprices() RETURNS SETOF RECORD AS $$
	SELECT SUM(unit_price),AVG(unit_price)
	FROM products
	GROUP BY category_id
$$ LANGUAGE SQL;

SELECT * FROM getavgprices() AS (sum_price real,avg_price float8)
DROP FUNCTION  getcustomersbycountry
CREATE OR REPLACE FUNCTION getcustomersbycountry(IN ccountry varchar) RETURNS TABLE(char_code char,company_name varchar) AS $$
	SELECT customer_id,company_name
	FROM customers
	WHERE country = ccountry
$$ LANGUAGE SQL;

SELECT * FROM getcustomersbycountry('USA')



DROP FUNCTION  getcustomersbycountrysetof
CREATE OR REPLACE FUNCTION getcustomersbycountrysetof(IN ccountry varchar) RETURNS SETOF customers AS $$
	SELECT *
	FROM customers
	WHERE country = ccountry
$$ LANGUAGE SQL;

SELECT * FROM getcustomersbycountrysetof('USA')