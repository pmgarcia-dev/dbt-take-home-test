-- models/orders_per_month.sql
-- Purpose: Compute number of orders per month (Part 2)
{{ config(materialized="table") }}

select to_char(order_date, 'YYYY-MM') as order_month, count(*) as orders_count
from {{ source("snowflake", "sales_data") }}
group by order_month
order by order_month
