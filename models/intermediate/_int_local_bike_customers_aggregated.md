{% docs int_local_bike_customers_aggregated %}

# Model: `int_local_bike_customers_aggregated`

## Overview

The `int_local_bike_customers_aggregated` model provides an aggregated view of customers by combining data from:

- Order items  
- Customer details  
- Store data  
- Staff information  
- Products data

It enriches the customer-level data with the folllowing metrics:
## Enriched Metrics

- **`customer total orders`**: Total number of orders placed by the customer.
- **`customer total order spent`**: Total monetary value of all orders placed by the customer.
- **`customer total item ordered`**: Total number of items the customer has ordered.
- **`customer total distinct items`**: Number of distinct item types ordered by the customer.

{% enddocs %}
