select
    'IICHTE19' as station_id,
    observation_time,
    temperature,
    humidity,
    pressure,
    wind_direction,
    wind_speed,
    wind_gust,
    solar,
    uv,
    dew_point,
    precip_rate,
    precip_accum
from {{ ref('stg_ichtegem') }}

union all

select
    'ILAMAD25' as station_id,
    observation_time,
    temperature,
    humidity,
    pressure,
    wind_direction,
    wind_speed,
    wind_gust,
    solar,
    uv,
    dew_point,
    precip_rate,
    precip_accum
from {{ ref('stg_la_madeleine') }}

union all

select
    station_id,
    observation_time,
    temperature,
    humidity,
    pressure,
    null as wind_direction,
    wind_speed,
    wind_gust,
    null as solar,
    null as uv,
    null as dew_point,
    null as precip_rate,
    null as precip_accum
from {{ ref('stg_infoclimat') }}