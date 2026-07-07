select
    'IICHTE19' as station_id,
    *
from {{ ref('stg_ichtegem') }}

union all

select
    'ILAMAD25' as station_id,
    *
from {{ ref('stg_la_madeleine') }}