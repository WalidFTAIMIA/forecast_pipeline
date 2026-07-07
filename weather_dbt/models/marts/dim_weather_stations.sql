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
    'IICHTE19',
    'WeerstationBS',
    51.092,
    2.999,
    15,
    'Ichtegem',
    'other',
    'EasyWeatherV1.6.6'