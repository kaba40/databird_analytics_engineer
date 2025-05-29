  SELECT
    store_id,
    staff_id,
    product_id,
    order_date as order_creation_date,
    ROW_NUMBER() OVER (
    PARTITION BY store_id, staff_id, order_date
    ORDER BY SUM(quantity) DESC
    ) AS rn
  FROM {{ref("int_local_bike_orders_summary")}}
  GROUP BY
      staff_id,
      product_id,
      store_id,
      order_date
  QUALIFY
      rn = 1