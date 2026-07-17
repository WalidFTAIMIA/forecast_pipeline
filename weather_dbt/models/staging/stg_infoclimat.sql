{{ config(materialized='view') }}

with infoclimat_hourly as (

    select
        jsonb_array_elements(hourly -> '00052') as observation

    from {{ source('weather_raw', 'raw_infoclimat') }}

)

select
    observation ->> 'id_station' as station_id,
    observation ->> 'dh_utc' as observation_time,
    observation ->> 'temperature' as temperature,
    observation ->> 'humidite' as humidity,
    observation ->> 'pression' as pressure,
    observation ->> 'vent_moyen' as wind_speed,
    observation ->> 'vent_rafales' as wind_gust

from infoclimat_hourly
