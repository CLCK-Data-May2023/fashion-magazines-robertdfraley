DROP TABLE IF EXISTS subscriptions;
CREATE TABLE subscriptions (
    subscription_id INTEGER PRIMARY KEY,
    description TEXT NOT NULL,
    price_per_month INTEGER NOT NULL,
    subscription_length INTEGER NOT NULL
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    subscription_id INTEGER NOT NULL,
    purchase_date TEXT NOT NULL,
    order_status TEXT NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(subscription_id) REFERENCES subscriptions(subscription_id)
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    address TEXT NOT NULL
);

INSERT INTO subscriptions (subscription_id, description, price_per_month, subscription_length)
VALUES 
(1, 'Politics Magazine', 10, '12'),
(2, 'Politics Magazine', 11, '6'),
(3, 'Politics Magazine', 12, '3'),
(4, 'Fashion Magazine', 15, '12'),
(5, 'Fashion Magazine', 17, '6'),
(6, 'Fashion Magazine', 19, '3'),
(7, 'Sports Magazine', 11, '12'),
(8, 'Sports Magazine', 12, '6'),
(0, 'Sports Magazine', 13, '3');

INSERT INTO customers (customer_id, customer_name, address)
VALUES 
(1, 'Allie Rahaim', '123 Broadway'),
(2, 'Jacquline Diddle', '456 Park Ave.'),
(3, 'Lizabeth Letsche', '789 Main St.'),
(4, 'Jessia Butman', '1 Columbus Ave.'),
(5, 'Inocencia Goyco', '12 Amsterdam Ave.'),
(6, 'Bethann Schraub', '29 Monticello'),
(7, 'Janay Priolo', '81 Harrisburg'),
(8, 'Ophelia Sturdnant', '31 Deerfield Ave.'),
(9, 'Eryn Vilar', '56 Morton St.'),
(10, 'Jina Farraj', '100 Bryan Ave.');

INSERT INTO orders (order_id, customer_id, subscription_id, purchase_date, order_status)
VALUES 
(10, 1, 7, '2016-01-26 00:00:00', 'paid'),
(15, 1, 2, '2017-01-06 00:00:00', 'paid'),
(16, 1, 2, '2017-07-06 00:00:00', 'unpaid'),
(20, 1, 7, '2017-01-26 00:00:00', 'unpaid'),
(2, 2, 4, '2017-01-09 00:00:00', 'paid'),
(1, 3, 2, '2017-01-10 00:00:00', 'paid'),
(3, 3, 4, '2017-01-26 00:00:00', 'unpaid'),
(12, 3, 2, '2017-07-10 00:00:00', 'unpaid'),
(13, 3, 5, '2017-01-03 00:00:00', 'paid'),
(17, 3, 6, '2017-07-03 00:00:00', 'unpaid'),
(18, 3, 8, '2017-01-29 00:00:00', 'paid'),
(9, 4, 4, '2017-01-25 00:00:00', 'paid'),
(19, 4, 9, '2017-01-03 00:00:00', 'paid'),
(7, 5, 8, '2017-01-11 00:00:00', 'paid'),
(11, 5, 4, '2017-01-07 00:00:00', 'paid'),
(14, 6, 5, '2017-01-22 00:00:00', 'unpaid'),
(5, 7, 6, '2017-01-25 00:00:00', 'unpaid'),
(6, 8, 2, '2017-01-18 00:00:00', 'paid'),
(4, 9, 9, '2017-01-04 00:00:00', 'paid'),
(8, 9, 5, '2017-01-26 00:00:00', 'unpaid');