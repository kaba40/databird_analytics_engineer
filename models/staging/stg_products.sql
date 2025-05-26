
{{ config(alias='stg_local_bike_products') }}

SELECT  
  product_id,
  product_name,
  brand_id,
  category_id,
  model_year,
  list_price
FROM {{source("local_bike", "products")}}  