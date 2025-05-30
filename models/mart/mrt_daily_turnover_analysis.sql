WITH daily_turnover_detail as (
  SELECT  
    order_date as report_date,
    store_id,
    sum(quantity*unit_price) as total_turnover,
    sum(order_id) as total_orders,
    count(product_id) as total_product_sold,
    count(customer_id) as total_customer_served
  FROM {{ref("int_local_bike_orders_summary")}}
  GROUP BY
    report_date,
    store_id
)

SELECT
  ca.report_date,
  ca.store_id,
  store.store_name,
  store.city as store_city,
  store.state as store_state,
  ca.total_turnover,
  ca.total_orders,
  SAFE_DIVIDE(ca.total_turnover, ca.total_orders) as average_basket,
  ca.total_product_sold,
  ca.total_customer_served
FROM daily_turnover_detail ca 
LEFT JOIN {{ref("stg_stores")}} store
ON 1 = 1
  AND store.store_id = ca.store_id