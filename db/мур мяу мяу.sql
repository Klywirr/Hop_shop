create database Hop_shop;
use hop_shop;
-- этап 4
delete FROM hop_shop.sup4
where id = "id";
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
p.description, p.photo,
c.name AS category, m.name AS manufacturer, p.name AS supplier
FROM products p
JOIN categories c ON c.id = p.category_id
JOIN manufacturers m ON m.id = p.manufacturer_id
JOIN suppliers s ON s.id = p.supplier_id;
-- этап 5
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,p.description, p.photo,
	c.shoes_name AS category, m.name AS manufacturer, p.name AS supplier
FROM products_shopa p
JOIN shoes_categories c ON c.id = p.category_id
JOIN manufacturers_shoess m ON m.id = p.manufacturer_id
JOIN pvzska s ON s.id = p.supplier_id;
-- этаап 6
SELECT name FROM products_shopa LIMIT 5;
SELECT p.id, p.name, p.price, p.stock_qty, s.name AS supplier
FROM products_shopa p
JOIN sup4 s ON s.id = p.supplier_id
WHERE p.name LIKE CONCAT('%', 'Туфли', '%')
  AND p.supplier_id = 1
ORDER BY p.stock_qty DESC;
--  этап 7 
SELECT id, shoes_name FROM shoes_categories;
SELECT id, name FROM manufacturers_shoess;
SELECT id, name FROM sup4;


INSERT INTO products_shopa 
  (article, name, unit, price, discount, stock_qty, description, photo, category_id, manufacturer_id, supplier_id)
VALUES 
  ('TEST01', 'Кроссовки', 'шт', 3500.00, 0, 10, 'Тестовое описание', 'test.jpg', 1, 1, 1);

SELECT * FROM products_shopa WHERE id = 1; 


UPDATE products_shopa 
SET article='TEST01', name='Кроссовки NEW', unit='шт', price=3600.00, discount=5, stock_qty=8, description='Обновлено', photo='test.jpg',
    category_id=1, manufacturer_id=1, supplier_id=1
WHERE id = 1;

-- этап 8
SELECT COUNT(*) AS used_in_orders FROM produx_orders WHERE product_id = 1;
DELETE FROM products_shopa WHERE id = 1;

