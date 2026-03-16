INSERT INTO bronze.categories
SELECT *
FROM BikeStores.sales.categories;

INSERT INTO bronze.products
SELECT *
FROM BikeStores.sales.products;

INSERT INTO bronze.stocks
SELECT *
FROM BikeStores.sales.stocks;

INSERT INTO bronze.customers
SELECT *
FROM BikeStores.sales.customers;

INSERT INTO bronze.orders
SELECT *
FROM BikeStores.sales.orders;

INSERT INTO bronze.order_items
SELECT *
FROM BikeStores.sales.order_items;

INSERT INTO bronze.staffs
SELECT *
FROM BikeStores.sales.staffs;

INSERT INTO bronze.stores
SELECT *
FROM BikeStores.sales.stores;

INSERT INTO bronze.brands
SELECT *
FROM BikeStores.sales.brands;