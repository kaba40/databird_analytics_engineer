
{{ config(alias='stg_local_bike_categories') }}

SELECT  
  category_id,
  category_name
FROM {{source("local_bike", "categories")}} 