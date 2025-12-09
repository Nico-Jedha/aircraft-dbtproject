{{ config(
    materialized = "table"
)
}}

/* As our files dim_ are a copy of our stg_ files and to avoid repeation i decieded to use my stg_ fiels directely
with 
dim_individual_flights AS (SELECT * FROM {{ref('dim_individual_flights')}}),
dim_aircraft AS (SELECT * FROM {{ref('dim_aircraft')}})
*/ 
SELECT 
    a.aircraft_type, -- Utilisation de l'alias 'a'
    f.aircraft_id, -- Utilisation de l'alias 'f'
    COUNT(*) AS n_flights, -- Here we'll get the number of flights for each Aircraft type
    -- ROUND(COUNT(*) / (SELECT count(*) FROM dim_individual_flights) * 100, 2) AS Flights_Percentage -- the percentage %
    ROUND(COUNT(*) / (SELECT count(*) FROM aircrafts.public.individual_flights) * 100, 2) AS Flights_Percentage -- Using a window function>> better and faster.
FROM {{ ref('stg_individual_flights') }} f -- Utilisation directe du staging, avec un alias 'f'
JOIN {{ ref('stg_aircraft') }} a         -- Utilisation directe du staging, avec un alias 'a'
    ON f.aircraft_id = a.aircraft_id
group by a.aircraft_type,
        f.aircraft_id
ORDER BY n_flights desc