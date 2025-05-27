select 
    order_item.order_id,
    orders.customer_id,
    orders.store_id,
    orders.staff_id,
    orders.order_status,
    orders.order_date,
    orders.required_date,
    orders.shipped_date,
    order_item.product_id,
    order_item.list_price,
    order_item.quantity,
    order_item.discount,
    (order_item.list_price - (order_item.list_price * order_item.discount)) as unit_price
from {{ref("stg_order_items")}} order_item
left join {{ref("stg_orders")}} orders
on 
 order_item.order_id = orders.order_id