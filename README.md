# Proyecto BD: Inspecciones de Comida en Chicago

## Fuente de datos

Para este proyecto se utilizan los datos proporcionados por el portal de datos
de Chicago sobre inspecciones a restaurantes. Se puede acceder a los datos en
[este link](https://data.cityofchicago.org/Health-Human-Services/Food-Inspections/4ijn-s7e5/about_data).

## Carga inicial de datos

Para insertar los datos en bruto se debe primero correr el script `raw_data_schema_creation.sql` y posteriormente
ejecutar el siguiente comando en una sesión de línea de comandos de Postgres.

```{postgresql}
\copy 
    raw.food_inspections (inspection_id, dba_name, aka_name, license_number, facility_type, risk, address, city, state, zip, inspection_date, inspection_type, results, violations, latitude, longitude, location)
    FROM 'path_to_downloaded_csv' 
    WITH (FORMAT CSV, HEADER true, DELIMITER ',');
```

## Limpieza de datos

El proceso de limpieza sigue una metodología de refresh destructiuvo, por lo que cada vez que se corra se generará desde
cero el esquema y las tablas correspondientes. El script correspondiente es el llamado: ```data_cleaning.sql```.

    