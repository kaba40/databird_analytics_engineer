{% docs int_local_bike_orders_aggregated %}

# Model: `int_local_bike_orders_aggregated`

## Overview

The `int_local_bike_orders_aggregated` model provides an aggregated view of orders by combining data from:

- Order items  
- Customer details  
- Store data  
- Staff information  

It enriches the order-level data with customer-specific metrics that support deeper customer behavior analysis.

## Enriched Metrics

- **`Total orders`**: Total number of orders placed by the customer.
- **`Total order amount`**: Total monetary value of all orders placed by the customer.
- **`Total items`**: Total number of items the customer has ordered.
- **`Total distinct items`**: Number of distinct item types ordered by the customer.

## Column Descriptions

| Column Name                   | Description                                                                 |
|------------------------------|-----------------------------------------------------------------------------|
| `order_id`                   | Unique identifier for the order.                                            |
| `customer_id`                | Unique identifier of the customer who placed the order.                    |
| `store_id`                   | Identifier of the store where the order was made.                          |
| `staff_id`                   | Identifier of the staff member who handled the order.                      |
| `order_creation_date`                 | The date when the order was placed.                                        |
| `total_orders`                | Total number of the order.                                                  |
| `total_order_amount`                 | Total value of the order.                                     |
| `total_items`      | Number of items included in the order.               |
| `total_distinct_items` | Number of distinct items included in the order.                          |

{% enddocs %}
