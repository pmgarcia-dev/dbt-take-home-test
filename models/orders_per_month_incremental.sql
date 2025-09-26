-- models/orders_per_month_incremental.sql
-- Purpose: Incrementally track number of orders per month. This model appends new sales data based on order_date.

{{ config(
    materialized='incremental',
    unique_key='order_month',
    incremental_strategy='merge'
) }}

with new_orders as (
    select
        date_trunc('month', order_date)::date as order_month,
        count(*) as orders_count
    from {{ source('snowflake_source', 'sales_data') }}
    {% if is_incremental() %}
        -- Only process sales newer than the latest month already in the table
        where date_trunc('month', order_date) > (select max(order_month) from {{ this }})
    {% endif %}
    group by order_month
)

select *
from new_orders
