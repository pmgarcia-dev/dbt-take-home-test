-- tests/assert_orders_no_negatives.sql
-- Purpose: Ensures that orders_count values in the orders_per_month model are never negative. 
-- Negative counts would indicate upstream issues or incorrect logic in the transformation.
select
  order_month,
  orders_count
from {{ ref('orders_per_month') }}
where orders_count < 0