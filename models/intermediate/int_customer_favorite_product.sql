SELECT
    customer_id,
    product_id,
    store_id,
    ROW_NUMBER() OVER (
    PARTITION BY customer_id
    ORDER BY SUM(quantity) DESC
    ) AS rn
FROM {{ref("int_local_bike_orders_summary")}}
GROUP BY
    customer_id,
    product_id,
    store_id
QUALIFY
    rn = 1
 
  