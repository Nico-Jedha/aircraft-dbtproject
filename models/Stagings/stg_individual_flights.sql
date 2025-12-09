-- columns to choose from the INDIVIDUAL_FLIGHTS table
SELECT "Flight_Id" AS flight_id, 
        "Airline_Code" AS airline_code, 
        "Aircraft_Id" AS aircraft_id,
        "Departure_Airport_Code" AS departure_airport_code,
        "Destination_Airport_Code" AS destination_airport_code

FROM 
    -- Jinja source with the DB ,schema (source alias <aircraft> in ymal) and the table name
    {{source('aircraft_db', 'INDIVIDUAL_FLIGHTS')}}