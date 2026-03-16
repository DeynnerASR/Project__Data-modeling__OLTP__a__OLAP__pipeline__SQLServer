/*
============================================================

DDL para la capa bronce.

============================================================
Este script define, y crea las tablas necesarias que se 
usaran en la capa bronce, para almacenar los datos en su 
forma mas cruda,  tal como llegan desde las fuentes de datos. 
============================================================
*/
 
DROP TABLE IF EXISTS bronze.customer;
DROP TABLE IF EXISTS bronze.staffs;
DROP TABLE IF EXISTS bronze.categories;
DROP TABLE IF EXISTS bronze.products;
DROP TABLE IF EXISTS bronze.stocs;
DROP TABLE IF EXISTS bronze.stores;
DROP TABLE IF EXISTS bronze.orders;
DROP TABLE IF EXISTS bronze.order_items;


CREATE TABLE bronze.customer (
    CUSTOMER_ID INT,
    FIRST_NAME STRING,
    LAST_NAME STRING,
    EMAIL STRING,
    PHONE STRING,
    STREET STRING,
    CITY STRING,
    STATE STRING,
    ZIP_CODE STRING,
    PRIMARY KEY (CUSTOMER_ID)
)


CREATE TABLE bronze.staffs(
    STAFF_ID INT,
    FIRST_NAME STRING,
    LAST_NAME STRING,
    EMAIL STRING,
    PHONE STRING,
    STREET STRING,
    CITY STRING,
    STATE STRING,
    ZIP_CODE STRING,
    PRIMARY KEY (STAFF_ID)
)