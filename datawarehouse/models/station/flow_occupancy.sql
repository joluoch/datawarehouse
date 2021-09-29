{{ config(
    materialized="view",
) }}
with date_time as (
    select date from stations.time

)
select date, flowtotal from stations.flow

INNER JOIN date_time ON stations.date=Customers.CustomerID;




