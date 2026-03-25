DROP TABLE IF EXISTS silver.customer;
DROP TABLE IF EXISTS silver.brands;
DROP TABLE IF EXISTS silver.categories;
DROP TABLE IF EXISTS silver.staffs;
DROP TABLE IF EXISTS silver.products;
DROP TABLE IF EXISTS silver.stores;
DROP TABLE IF EXISTS silver.orders;
DROP TABLE IF EXISTS silver.order_items;

CREATE TABLE silver.customers (
    customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone VARCHAR(25),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(25),
    zip_code VARCHAR(5),
    create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE silver.staffs (
    staff_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(25),
    active TINYINT,
    store_id INT,
    create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE silver.products (
    product_id INT,
    product_name VARCHAR(255),
    brand_id INT,
    category_id INT,
    model_year SMALLINT,
    list_price DECIMAL(10,2),
    create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE silver.stores (
    store_id INT,
    store_name VARCHAR(255),
    phone VARCHAR(25),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(25),
    zip_code VARCHAR(5),
    create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE silver.orders (
    order_id INT,
    customer_id INT,
    order_status TINYINT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    store_id INT,
    staff_id INT,
    create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE silver.order_items (
    order_id INT,
    item_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),
    create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

create table silver.brands (
    brand_id INT,
    brand_name VARCHAR(255),
    create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

create table silver.categories (
    category_id INT,
    category_name VARCHAR(255),
    create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE silver.load_details
(
    batch_start_load_datetime TIMESTAMP,
    batch_end_load_datetime TIMESTAMP,
    transformation_start_datetime TIMESTAMP,
    transformation_end_datetime TIMESTAMP,
    duration_time TIME, 
    error_message TEXT,
);