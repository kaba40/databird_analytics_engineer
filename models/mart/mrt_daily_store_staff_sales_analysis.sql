select
  staff.store_id,
  staff.staff_id,
  staff.order_creation_date,
  best_sold.product_id as staff_best_seller,
  staff.total_order_amount_sold,
  staff.total_number_product_sold,
  staff.total_number_customer_served,
  staff.total_number_order_processed
from {{ref("int_local_bike_staff_aggregated")}} staff
LEFT JOIN {{ref("int_local_bike_store_staff_best_seller")}} best_sold
ON 1 = 1
  AND staff.store_id = best_sold.store_id
  AND staff.staff_id = best_sold.staff_id
  AND staff.order_creation_date = best_sold.order_creation_date