with orders as (

    select * from {{ ref('int_orders_enriched') }}

)

select
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    nb_items,
    total_quantity,
    total_revenue

from orders
