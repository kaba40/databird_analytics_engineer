-- to remove may be later
select 
  order_tab.store_id,
  order_tab.staff_id,
  order_tab.order_id,
  order_tab.order_status,
  order_tab.order_date as order_creation_date,
  order_tab.required_date as order_required_date,
  order_tab.shipped_date as order_shipped_date,
  user_tab.customer_id,
  user_tab.first_name as customer_first_name,
  user_tab.last_name as customer_last_name,
  user_tab.phone as customer_phone_number,
  user_tab.email as customer_email,
  user_tab.street as customer_street,
  user_tab.city as customer_city,
  user_tab.state as customer_state,
  coalesce(order_item.total_order_amount, 0) as total_order_amount,
  coalesce(order_item.total_items, 0) as total_items,
  coalesce(order_item.total_distinct_items, 0) as total_distinct_items
from {{ref("int_local_bike_orders_summary")}} as order_tab
left join {{ref("int_local_bike_orders_aggregated")}} as order_item on order_tab.order_id = order_item.order_id
left join {{ref("stg_customers")}} as user_tab on user_tab.customer_id = order_tab.customer_id