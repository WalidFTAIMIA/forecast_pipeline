select 1
where (
    select count(*)
    from {{ ref('dim_weather_stations') }}
) <> 2