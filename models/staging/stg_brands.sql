
{{ config(alias='stg_local_bike_brands') }}

SELECT  
  brand_id,
  brand_name
FROM {{source("local_bike", "brands")}} 