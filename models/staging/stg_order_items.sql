
{{ config(alias='stg_local_bike_order_items') }}

SELECT  
  concat(order_id, "~", item_id) as order_item_id,
  order_id,
  --item_id,
  product_id,
  quantity,
  list_price,
  discount
FROM {{source("local_bike", "order_items")}} 
