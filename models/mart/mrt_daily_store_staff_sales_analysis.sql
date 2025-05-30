
select
  staff_agg.order_creation_date as report_date,
  staff_agg.store_id,
  store.store_name,
  store.city as store_city,
  store.state as store_state,
  staff_agg.staff_id,
  concat(staff.first_name, " ", staff.last_name) as staff_name,
  best_sold.product_id as staff_best_seller,
  staff_agg.total_order_amount_sold,
  staff_agg.total_number_product_sold,
  staff_agg.total_number_customer_served,
  staff_agg.total_number_order_processed
from {{ref("int_local_bike_staff_aggregated")}} staff_agg
LEFT JOIN {{ref("int_local_bike_store_staff_best_seller")}} best_sold
ON 1 = 1
  AND staff_agg.store_id = best_sold.store_id
  AND staff_agg.staff_id = best_sold.staff_id
  AND staff_agg.order_creation_date = best_sold.order_creation_date
LEFT JOIN {{ref("stg_stores")}} store
ON 1 = 1
  AND store.store_id = staff_agg.store_id
LEFT JOIN {{ref("stg_staffs")}} staff
ON 1 = 1
  AND staff.staff_id = staff_agg.staff_id
  