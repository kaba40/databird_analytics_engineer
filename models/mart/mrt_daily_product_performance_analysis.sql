SELECT  
  product_agg.order_creation_date as report_date,
  product_agg.store_id,
  store.store_name,
  store.city as store_city,
  store.state as store_state,
  product_agg.product_id,
  product_sum.product_name,
  product_sum.brand_name,
  product_sum.category_name,
  product_sum.model_year,
  product_sum.list_price,
  product_agg.total_amount,
  product_agg.total_customers 
FROM {{ref("int_local_bike_products_aggregated")}} product_agg
LEFT JOIN {{ref("int_local_bike_products_summary")}} product_sum
ON 1 = 1
  and product_agg.product_id = product_sum.product_id
LEFT JOIN {{ref("stg_stores")}} store
ON 1 = 1
  AND store.store_id = product_agg.store_id
