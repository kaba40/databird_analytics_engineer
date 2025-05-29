select
  orders.customer_id,
  orders.store_id,
  orders.staff_id,
  sum(orders.total_orders) as customer_total_orders,
  sum(orders.total_order_amount) as customer_total_order_spent,
  sum(orders.total_items) as customer_total_item_ordered,
  sum(orders.total_distinct_items) as customer_total_distinct_items,
  product.product_id as customer_favorite_product
from {{ref("int_local_bike_orders_aggregated")}} orders
left join {{ref("int_customer_favorite_product")}} product
on 1 = 1
  and orders.customer_id = product.customer_id
  and orders.store_id = product.store_id
group by
  orders.customer_id,
  orders.store_id,
  orders.staff_id,
  product.product_id