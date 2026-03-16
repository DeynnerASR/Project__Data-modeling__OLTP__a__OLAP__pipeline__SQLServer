/*
=============================================================

DDL para la capa bronce.

=============================================================
Este script define, y crea las tablas necesarias que se 
usaran en la capa bronce, para almacenar los datos en su 
forma mas cruda,  tal como llegan desde las fuentes de datos. 

Detalles a tener en cuenta:
- Se crean las tablas sin definir llaves primarias y foraneas.
- En esta capa, se tolera la existencia de duplicados.
- Agregaremos metadatos o columnas de ingestion (con el objetivo 
de permitir, auditoria, re-procesamiento,cargas incrementales).

    - bronze_load_datetime
    - bronze_source  
=============================================================
*/
 
DROP TABLE IF EXISTS bronze.customer;
DROP TABLE IF EXISTS bronze.staffs;
DROP TABLE IF EXISTS bronze.categories;
DROP TABLE IF EXISTS bronze.products;
DROP TABLE IF EXISTS bronze.stocs;
DROP TABLE IF EXISTS bronze.stores;
DROP TABLE IF EXISTS bronze.orders;
DROP TABLE IF EXISTS bronze.order_items;

CREATE TABLE bronze.brands (

    brand_id INT,
    brand_name VARCHAR(255),

    bronze_load_datetime DATETIME2 DEFAULT GETDATE(),
    bronze_source VARCHAR(50) DEFAULT 'BikeStores'

);


CREATE TABLE bronze.categories (

    category_id INT,
    category_name VARCHAR(255),

    bronze_load_datetime DATETIME2 DEFAULT GETDATE(),
    bronze_source VARCHAR(50) DEFAULT 'BikeStores'

);

CREATE TABLE bronze.products (

    product_id INT,
    product_name VARCHAR(255),
    brand_id INT,
    category_id INT,
    model_year SMALLINT,
    list_price DECIMAL(10,2),

    bronze_load_datetime DATETIME2 DEFAULT GETDATE(),
    bronze_source VARCHAR(50) DEFAULT 'BikeStores'

);

CREATE TABLE bronze.stocks (

    store_id INT,
    product_id INT,
    quantity INT,

    bronze_load_datetime DATETIME2 DEFAULT GETDATE(),
    bronze_source VARCHAR(50) DEFAULT 'BikeStores'

);

CREATE TABLE bronze.customers (

    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone VARCHAR(25),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(25),
    zip_code VARCHAR(5),

    bronze_load_datetime DATETIME2 DEFAULT GETDATE(),
    bronze_source VARCHAR(50) DEFAULT 'BikeStores'

);

CREATE TABLE bronze.orders (

    order_id INT,
    customer_id INT,
    order_status TINYINT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    store_id INT,
    staff_id INT,

    bronze_load_datetime DATETIME2 DEFAULT GETDATE(),
    bronze_source VARCHAR(50) DEFAULT 'BikeStores'

);

CREATE TABLE bronze.order_items (

    order_id INT,
    item_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),

    bronze_load_datetime DATETIME2 DEFAULT GETDATE(),
    bronze_source VARCHAR(50) DEFAULT 'BikeStores'

);


CREATE TABLE bronze.staffs (

    staff_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255),
    phone VARCHAR(25),
    active TINYINT,
    store_id INT,
    manager_id INT,

    bronze_load_datetime DATETIME2 DEFAULT GETDATE(),
    bronze_source VARCHAR(50) DEFAULT 'BikeStores'

);

CREATE TABLE bronze.stores (

    store_id INT,
    store_name VARCHAR(255),
    phone VARCHAR(25),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(10),
    zip_code VARCHAR(5),

    bronze_load_datetime DATETIME2 DEFAULT GETDATE(),
    bronze_source VARCHAR(50) DEFAULT 'BikeStores'

);

