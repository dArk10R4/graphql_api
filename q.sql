CREATE TABLE IF NOT EXISTS attribute_sets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    query_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    query_id VARCHAR(255) NOT NULL,
    value VARCHAR(255) NOT NULL,
    displayValue VARCHAR(255) NOT NULL,
    attribute_set_id INTEGER NOT NULL,
    FOREIGN KEY (attribute_set_id) REFERENCES attribute_sets(id)
);


CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS currencies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    label VARCHAR(255) NOT NULL,
    symbol VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    query_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    inStock INTEGER NOT NULL,
    description VARCHAR(255) NOT NULL,
    brand VARCHAR(255) NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE IF NOT EXISTS product_attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    attribute_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    FOREIGN KEY (attribute_id) REFERENCES attributes(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS images (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url VARCHAR(255) NOT NULL,
    alt VARCHAR(255) NOT NULL,
    product_id INTEGER NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS prices (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    amount DECIMAL(10, 2) NOT NULL,
    currency_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO currencies (id, label, symbol) values (1, "USD", "$");

INSERT INTO categories (id, name) VALUES (1, "clothes"), (2, "tech");
INSERT INTO attribute_sets (query_id, name, type) VALUES
('Size', 'Size', 'text'),
('Color', 'Color', 'swatch'),
('Capacity', 'Capacity', 'text'),
('With USB 3 ports', 'With USB 3 ports', 'text'),
('Touch ID in keyboard', 'Touch ID in keyboard', 'text');


INSERT INTO attributes (value, displayValue, query_id, attribute_set_id) VALUES
('40', '40', '40', 1),
('41', '41', '41', 1),
('42', '42', '42', 1),
('43', '43', '43', 1),
('S', 'Small', 'Small', 1),
('M', 'Medium', 'Medium', 1),
('L', 'Large', 'Large', 1),
('XL', 'Extra Large', 'Extra Large', 1),
('#44FF03', 'Green', 'Green', 2),
('#03FFF7', 'Cyan', 'Cyan', 2),
('#030BFF', 'Blue', 'Blue', 2),
('#000000', 'Black', 'Black', 2),
('#FFFFFF', 'White', 'White', 2),
('512G', '512G', '512G', 3),
('1T', '1T', '1T', 3),
('256GB', '256GB', '256GB', 3),
('512GB', '512GB', '512GB', 3),
('Yes', 'Yes', 'Yes', 4),
('No', 'No', 'No', 4),
('Yes', 'Yes', 'Yes', 5),
('No', 'No', 'No', 5);

INSERT INTO product_attributes (product_id, attribute_id) VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 19),
(5, 20),
(5, 21),
(6, 14),
(6, 15),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13);

CREATE TABLE IF NOT EXISTS orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    total DECIMAL(10, 2) NOT NULL,
);

CREATE TABLE IF NOT EXISTS order_products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS order_product_attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_product_id INTEGER NOT NULL,
    attribute_id INTEGER NOT NULL,
    FOREIGN KEY (order_product_id) REFERENCES order_products(id),
    FOREIGN KEY (attribute_id) REFERENCES attributes(id)
);