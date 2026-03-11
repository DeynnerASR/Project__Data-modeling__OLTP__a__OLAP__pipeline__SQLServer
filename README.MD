# DATA MODELING OLTP <-> OLAP en SQL SERVER
El siguiente proyecto tiene como objetivo practicar el modelado de datos usando fuentes de datos SQL, y su implementación ETL en SQL SERVER.

En el se contempla los siguientes detalles:
- Una base de datos relacional (OLTP), como fuente de datos.
- Modelado de datos siguiendo la metodologia Kimball para desarrollar un DWH (OLAP System) desde cero.
- Consecuentemente, la identificación y aplicación de las reglas de dimensiones lentamente cambiantes (SCD I, II Y III)
- Uso del patron "Medallion arquitecture" (Bronze, Silver, Gold), con el objetivo de:
    - Separar responsabilidades 
    - Permitir un mejor monitoreo de la información por cada etapa (desde raw hasta ready to use)
- Uso de herramientas nativas de SQL para realizar el ETL:
    - Stored_procedures (SP)
    - Views (para las tablas de la capa GOLD)
    

## Arquitectura

#### Modelo de datos de la fuente OLTP
![data_source_model](/documentation/SOURCE-model.png)

#### Modelo de datos destino (OLAP)
![olap_model](/documentation/OLAP-MODEL.png)