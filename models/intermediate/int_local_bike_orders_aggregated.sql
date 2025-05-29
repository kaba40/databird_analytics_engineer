select 
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_date as order_creation_date,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(unit_price * quantity) AS total_order_amount,
    sum(quantity) as total_items,
    count(distinct product_id) as total_distinct_items
from {{ref("int_local_bike_orders_summary")}} 
group by 
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_date