{{
  config(
    materialized='table',
    indexes=[
      {'columns': ['station_id'], 'unique': true}
    ]
  )
}}

select
    'ILAMAD25' as station_id,
    'La Madeleine' as station_name,
    50.659 as latitude,
    3.070 as longitude,
    23 as elevation,
    'La Madeleine' as city,
    'other' as hardware,
    'EasyWeatherPro_V5.1.6' as software

union all

select
    'IICHTE19' as station_id,
    'WeerstationBS' as station_name,
    51.092 as latitude,
    2.999 as longitude,
    15 as elevation,
    'Ichtegem' as city,
    'other' as hardware,
    'EasyWeatherV1.6.6' as software