-- models/marts/orders_per_month_incremental.sql
-- Purpose: Incrementally track number of orders per month. 
-- This model appends new sales data based on order_date (Part 3)
{{
    config(
        materialized="incremental",
        unique_key="order_month",
        incremental_strategy="merge",
    )
}}

with
    new_orders as (
        select to_char(order_date, 'YYYY-MM') as order_month, count(*) as orders_count
        from {{ source("snowflake", "sales_data") }}
        {% if is_incremental() %}
            -- Only process sales newer than the latest month already in the table
            where
                to_char(order_date, 'YYYY-MM')
                > (select max(order_month) from {{ this }})
        {% endif %}
        group by order_month
        order by order_month
    )

select *
from new_orders
