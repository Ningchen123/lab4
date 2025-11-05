-- 首先删除已存在的表（如果存在）
DROP TEMPORARY TABLE IF EXISTS use_case_mapping;

-- 重新创建用例映射表，增加列长度
CREATE TEMPORARY TABLE use_case_mapping (
    actor VARCHAR(100),
    use_case VARCHAR(150),
    route VARCHAR(100),
    http_request VARCHAR(20),
    authentication VARCHAR(10)
);

-- 插入映射数据（修正HTTP方法长度）
INSERT INTO use_case_mapping (actor, use_case, route, http_request, authentication) VALUES
('Пользователь (Покупатель, Менеджер)', 'UC 0 Войти в систему', '/api/auth/login', 'GET', 'нет'),
('Пользователь (Покупатель, Менеджер)', 'UC 0.1 Аутентификация', '/api/auth/login', 'POST', 'нет'),
('Пользователь (Покупатель, Менеджер)', 'UC 0.2 Зарегистрироваться', '/api/auth/register', 'POST', 'нет'),
('Пользователь (Покупатель, Менеджер)', 'UC 1.1 Посмотреть список товаров', '/api/products', 'GET', 'нет'),
('Покупатель', 'UC 1.2 Посмотреть список поставщиков', '/api/providers', 'GET', 'нет'),
('Покупатель', 'UC 1.3 Зарегистрироваться в системе', '/api/auth/register', 'POST', 'нет'),
('Покупатель', 'UC 1.4 Добавить товар в корзину', '/api/cart', 'POST', 'да'),
('Покупатель', 'UC 1.5 Оформить заказ', '/api/orders', 'POST', 'да'),
('Покупатель', 'UC 1.6 Просмотреть детали товара', '/api/products/{id}', 'GET', 'нет'),
('Менеджер', 'UC 2.1 Управление товарами', '/api/products', 'POST,PUT,DELETE', 'да'),
('Менеджер', 'UC 2.2 Добавить новый товар', '/api/products', 'POST', 'да'),
('Менеджер', 'UC 2.3 Редактировать товар', '/api/products/{id}', 'PUT', 'да'),
('Менеджер', 'UC 2.4 Просмотреть список заказов', '/api/orders', 'GET', 'да'),
('Менеджер', 'UC 2.5 Изменить статус заказа', '/api/orders/{id}', 'PUT', 'да'),
('Менеджер', 'UC 2.6 Управление поставщиками', '/api/providers', 'POST,PUT,DELETE', 'да'),
('Менеджер', 'UC 2.7 Добавить поставщика', '/api/providers', 'POST', 'да'),
('Администратор', 'UC 3.1 Управление пользователями', '/api/users', 'GET,PUT,DELETE', 'да'),
('Администратор', 'UC 3.2 Назначение ролей', '/api/users/{id}/role', 'PUT', 'да'),
('Администратор', 'UC 3.3 Просмотр статистики', '/api/analytics', 'GET', 'да');

-- 查询生成用例映射表格
SELECT 
    actor AS 'Актор',
    use_case AS 'Use Case',
    route AS 'Маршрут',
    http_request AS 'HTTP-запрос',
    authentication AS 'Аутентификация'
FROM use_case_mapping;