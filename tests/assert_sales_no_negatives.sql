-- tests/assert_sales_no_negatives.sql
-- Purpose: Ensures that total_sales values in the customer_sales model are never negative. 
-- This serves as a data quality check to prevent invalid aggregations or incorrect upstream data.
select
  customer_id,
  total_sales
from {{ ref('customer_sales') }}
where total_sales < 0