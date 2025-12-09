-- columns to choose from the Aircraft table
SELECT 
    "Aircraft_Id" AS aircraft_id , 
    "Aircraft_Type" AS aircraft_type
FROM 
    -- Jinia source with the schema and the table name
    {{source('aircraft_db', 'AIRCRAFT')}}