SELECT * FROM products
Inner join categories on categories.category_id = products.category_id
Where categories.category_id = 2