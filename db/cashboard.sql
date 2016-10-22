DROP TABLE transactions;
DROP TABLE categories;
DROP TABLE merchants;

CREATE TABLE merchants (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255),
location VARCHAR(255),
website_url VARCHAR(255)
);

CREATE TABLE categories (
id SERIAL4 PRIMARY KEY,
type VARCHAR(255),
description VARCHAR(255)
);

CREATE TABLE transactions (
id SERIAL4 PRIMARY KEY,
merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
catgegory_id INT4 REFERENCES categories(id) ON DELETE CASCADE,
value NUMERIC (13,2)
);
