SELECT  
  product.product_id,
  product.product_name,
  product.category_id,
  category.category_name,
  product.brand_id,
  brand.brand_name,
  product.model_year,
  product.list_price,
  stock.store_id,
  stock.quantity as stock_quantity
FROM {{ref("stg_products")}} product
LEFT JOIN {{ref("stg_categories")}} category
ON 
  1 = 1
  AND product.product_id = category.category_id
LEFT JOIN {{ref("stg_brands")}} brand
ON
  1 = 1
  AND product.brand_id = brand.brand_id
LEFT JOIN {{ref("stg_stocks")}} stock
ON 
  1 = 1
  AND stock.product_id = product.product_id