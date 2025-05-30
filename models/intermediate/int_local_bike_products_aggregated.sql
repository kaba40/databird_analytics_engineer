SELECT  
  store_id,
  product_id,
  order_date as order_creation_date,
  sum(quantity*unit_price) as total_amount,
  count(customer_id) as total_customers
FROM {{ref("int_local_bike_orders_summary")}} 
GROUP BY
  store_id,
  product_id,
  order_date