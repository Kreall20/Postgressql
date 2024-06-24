SELECT ship_country, Count(*) as amount
FROM orders
GROUP BY ship_country;


SELECT category_id,SUM(unit_price * units_in_stock)
FROM products
WHERE discontinued <> 1
GROUP BY category_id
HAVING SUM(unit_price * units_in_stock) > 5000;


SELECT country FROM customers
Union ALL
Select country FROM employees




