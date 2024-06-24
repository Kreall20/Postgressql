SELECT * FROM categories
INNER JOIN products on products.category_id = categories.category_id;


SELECT * FROM categories
INNER JOIN products USING(category_id);


SELECT * FROM categories
NATURAL JOIN products;



SELECT DISTINCT company_name
FROM suppliers
WHERE country IN (Select DISTINCT country
					FROM customers);
					
					
SELECT category_name, SUM(units_in_stock)
FROM products
JOIN categories USING(category_id)
GROUP BY category_name
ORDER BY SUM(units_in_stock) DESC
LIMIT (SELECT MIN(product_id)+ 4 FROM products);


SELECT product_name,units_in_stock
FROM products
WHERE units_in_stock > (SELECT AVG(units_in_stock) 
						FROM products)
ORDER BY units_in_stock DESC;


SELECT company_name,contact_name
FROM customers
WHERE EXISTS (SELECT customer_id FROM orders
			 WHERE customer_id = customers.customer_id
			 AND freight BETWEEN 50 AND 100);
			 
			 
SELECT DISTINCT company_name
FROM customers
JOIN orders USING(customer_id)
JOIN order_details USING(order_id)
WHERE quantity > 40;



--SELECT AVG(units_in_stock) 
--FROM products

