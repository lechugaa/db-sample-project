-- Creating raw schema
DROP SCHEMA IF EXISTS raw CASCADE;
CREATE SCHEMA IF NOT EXISTS raw;

-- Creating table for raw data
DROP TABLE IF EXISTS raw.food_inspections;
CREATE TABLE raw.food_inspections (
    inspection_id bigint,
    dba_name text,
    aka_name text,
    license_number bigint,
    facility_type text,
    risk text,
    address text,
    city text,
    state text,
    zip text,
    inspection_date timestamp,
    inspection_type text,
    results text,
    violations text,
    latitude double precision,
    longitude double precision,
    location text
);
