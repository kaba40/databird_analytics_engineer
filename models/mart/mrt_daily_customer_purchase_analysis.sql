SELECT
  int_customer.order_creation_date as report_date,
  int_customer.customer_id,
  stg_customer.city as customer_city,
  stg_customer.state as customer_state,
  int_customer.store_id,
  store.store_name,
  store.city as store_city,
  store.state as store_state,
  int_customer.customer_favorite_product,
  product.product_name,
  product.brand_name,
  product.category_name,
  product.model_year,
  product.list_price,
  sum( int_customer.customer_total_orders) as customer_total_orders,
  sum( int_customer.customer_total_order_spent) as customer_total_order_spent,
  sum( int_customer.customer_total_item_ordered) as customer_total_item_ordered,
  sum( int_customer.customer_total_distinct_items) as customer_total_distinct_items
FROM {{ref("int_local_bike_customers_aggregated")}} int_customer --1445
LEFT JOIN {{ref("stg_customers")}} stg_customer
ON 1 = 1
  AND int_customer.customer_id = stg_customer.customer_id
LEFT JOIN {{ref("stg_stores")}} store
ON 1 = 1
  AND store.store_id = int_customer.store_id
LEFT JOIN {{ref("int_local_bike_products_summary")}} product
ON 1 = 1
  and product.product_id = int_customer.customer_favorite_product
GROUP BY
  int_customer.order_creation_date,
  customer_id,
  customer_city,
  customer_state,
  store_id,
  store_name,
  store_city,
  store_state,
  customer_favorite_product,
  product.product_name,
  product.brand_name,
  product.category_name,
  product.model_year,
  product.list_price