SELECT  
  store_id,
  staff_id,
  order_date as order_creation_date,
  sum(quantity*unit_price) as total_order_amount_sold,
  COUNT(product_id) as total_number_product_sold,
  COUNT(customer_id) as total_number_customer_served,
  COUNT(order_id) as total_number_order_processed
FROM {{ref("int_local_bike_orders_summary")}} 
GROUP BY
  store_id,
  staff_id,
  order_date