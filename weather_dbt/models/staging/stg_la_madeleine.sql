select
    "Time" as observation_time,
    "Temperature" as temperature,
    "Humidity" as humidity,
    "Pressure" as pressure,
    "Wind" as wind_direction,
    "Speed" as wind_speed,
    "Gust" as wind_gust,
    "Solar" as solar,
    "UV" as uv,
    "Dew_Point" as dew_point,
    "Precip__Rate_" as precip_rate,
    "Precip__Accum_" as precip_accum
from {{ source('weather_raw', 'raw_la_madeleine') }}