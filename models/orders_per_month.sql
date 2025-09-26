-- models/orders_per_month.sql
-- Purpose:  (Part 2)

{{ config(materialized='table') }}

select
  date_trunc('month', order_date)::date as order_month,
  count(*) as orders_count
from {{ source('snowflake', 'sales_data') }}
group by order_month
order by order_month