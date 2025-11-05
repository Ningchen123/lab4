-- 创建API路由临时表
CREATE TEMPORARY TABLE api_routes (
    entity VARCHAR(50),
    db_table VARCHAR(50),
    route VARCHAR(100),
    http_methods VARCHAR(50)
);

-- 插入API路由数据
INSERT INTO api_routes (entity, db_table, route, http_methods) VALUES
('Пользователь', 'users', '/api/users', 'GET, POST, PUT, DELETE'),
('Товар', 'products', '/api/products', 'GET, POST, PUT, DELETE'),
('Поставщик', 'providers', '/api/providers', 'GET, POST, PUT, DELETE'),
('Заказ', 'orders', '/api/orders', 'GET, POST, PUT'),
('Элемент заказа', 'order_items', '/api/order-items', 'GET, POST, DELETE'),
('Аутентификация', 'users', '/api/auth/login', 'POST'),
('Регистрация', 'users', '/api/auth/register', 'POST'),
('Корзина', 'order_items', '/api/cart', 'GET, POST, DELETE'),
('Категории', 'products', '/api/categories', 'GET');

-- 查询生成API路由表格
SELECT 
    entity AS 'Сущность',
    db_table AS 'Таблица БД', 
    route AS 'Маршрут',
    http_methods AS 'HTTP-методы'
FROM api_routes;