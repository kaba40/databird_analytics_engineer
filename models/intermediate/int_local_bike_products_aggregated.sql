SELECT  
  store_id,
  staff_id,
  product_id,
  order_date as order_creation_date,
  sum(quantity*unit_price) as total_amount,
  count(distinct customer_id) as total_distinct_customers
FROM {{ref("int_local_bike_orders_summary")}} 
GROUP BY
  store_id,
  staff_id,
  product_id,
  order_date