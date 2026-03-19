/*
El siguiente stored procedure, se encargara de cargar los datos al
schema Bronze. 

Para cada tabla, su metodologia de carga es la siguiente:
- Elimina los datos existentes de las tablas del schema Bronze, con TRUNCATE TABLE.
- Carga los datos desde los archivos CSV utilizando BULK INSERT.
- Agrega un campo que indica la fecha, hora de la carga; y el nombre de la fuente
*/

CREATE PROCEDURE bronze.sp_load_bronze
    @variable_batch_start_load_datetime TIMESTAMP = NULL,
    @variable_batch_end_load_datetime TIMESTAMP = NULL,
    @variable_duration_time TIME = NULL,
    @variable_error_message TEXT = NULL,
    @variable_start_time DATETIME2 = NULL,
    @variable_end_time DATETIME2 = NULL

AS
BEGIN
    SET @variable_batch_start_load_datetime = GETDATE();

    /*Tabla brands*/
    TRUNCATE TABLE bronze.brands;

    BULK INSERT bronze.brands
    FROM 'C:\Data\BikeStores\brands.csv'
    WITH 
    (
        DATAFILETYPE = 'char',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )


    /*Tabla categories*/
    TRUNCATE TABLE bronze.categories;

    BULK INSERT bronze.categories
    FROM 'C:\Data\BikeStores\categories.csv'
    WITH 
    (
        DATAFILETYPE = 'char',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )


    /*Tabla products*/
    TRUNCATE TABLE bronze.products;

    BULK INSERT bronze.products
    FROM 'C:\Data\BikeStores\products.csv'
    WITH 
    (
        DATAFILETYPE = 'char',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )


    /*Tabla stocks*/
    TRUNCATE TABLE bronze.stocks;

    BULK INSERT bronze.stocks
    FROM 'C:\Data\BikeStores\stocks.csv'
    WITH 
    (
        DATAFILETYPE = 'char',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )

    /*Tabla customers*/
    TRUNCATE TABLE bronze.customers;

    BULK INSERT bronze.customers
    FROM 'C:\Data\BikeStores\customers.csv'
    WITH 
    (
        DATAFILETYPE = 'char',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )

        /*Tabla orders*/
    TRUNCATE TABLE bronze.orders;

    BULK INSERT bronze.orders
    FROM 'C:\Data\BikeStores\orders.csv'
    WITH 
    (
        DATAFILETYPE = 'char',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )

            /*Tabla order_items*/
    TRUNCATE TABLE bronze.order_items;

    BULK INSERT bronze.order_items
    FROM 'C:\Data\BikeStores\order_items.csv'
    WITH 
    (
        DATAFILETYPE = 'char',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )

    /*Tabla staffs*/
    TRUNCATE TABLE bronze.staffs;

    BULK INSERT bronze.staffs
    FROM 'C:\Data\BikeStores\staffs.csv'
    WITH 
    (
        DATAFILETYPE = 'char',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )

    /*Tabla stores*/
    TRUNCATE TABLE bronze.stores;

    BULK INSERT bronze.stores
    FROM 'C:\Data\BikeStores\stores.csv'
    WITH 
    (
        DATAFILETYPE = 'char',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    )

    SET @variable_batch_end_load_datetime = GETDATE();

    /*Detalles de la carga*/
    INSERT INTO bronze.load_details (
            batch_start_load_datetime,
            batch_end_load_datetime,
            duration_time,
            error_message
    )
    VALUES (
             @variable_batch_start_load_datetime,
             @variable_batch_end_load_datetime,
             DATEDIFF(SECOND, @variable_batch_start_load_datetime, @variable_batch_end_load_datetime),
             @variable_error_message
           );
END; GO