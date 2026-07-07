select
    station_id,
    observation_time,
    temperature,
    humidity,
    pressure,
    wind_speed,
    wind_gust,
    uv,
    solar,
    precip_rate,
    precip_accum
from {{ ref('int_weather_observations') }}