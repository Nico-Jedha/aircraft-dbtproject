SELECT 
    "Airline_Code" as aircraft_id,
    "Airline_Name" as airline_name,
    "Description" as description_airline
FROM 
    {{source('aircraft_db', 'AIRLINES')}}