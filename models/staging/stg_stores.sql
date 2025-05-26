
{{ config(alias='stg_local_bike_stores') }}

SELECT  
  store_id,
  store_name,
  phone,
  email,
  street,
  city,
  state,
  zip_code
FROM {{source("local_bike", "stores")}}