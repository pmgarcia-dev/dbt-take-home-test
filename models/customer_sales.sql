-- models/customer_sales.sql
-- Purpose: Aggregate total sales per customer (Part 1)

{{ config(materialized='table') }}

select
  customer_id,
  sum(amount) as total_sales
from {{ source('snowflake', 'sales_data') }}
group by customer_id
order by customer_id