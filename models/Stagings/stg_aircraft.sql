-- columns to choose from the Aircraft table
SELECT 
    "Aircraft_Id" AS aircraft_id,
    "Aircraft_Type" AS aircraft_type
FROM 
    -- Jinja source with the schema and the table name
    {{source('aircraft_db', 'AIRCRAFT')}}