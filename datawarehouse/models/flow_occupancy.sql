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
      from orders
      inner join customer on orders.customer_order_id = customer.customer_order_id
      inner join state_map on customer.customer_st = state_map.st
    )
  select
    *
  from final

