with Date_Time as (
  select
    *
  from {{ ref('time') }}
),
flow as (
  select
    *
  from {{ ref('flow') }}
),
occupancy as (
  select
    *
  from {{ ref('occupancy') }}
),
final as (
  select
    Date_Time.date,
    flow.flowtotal,
    occupancy.ocuppancy1
    occupancy.ocuppancy2
      from flow
      inner join Date_Time on flow.date = time.date
      inner join occupancy on flow.date = occupancy.date
    )
  select
    *
  from final

