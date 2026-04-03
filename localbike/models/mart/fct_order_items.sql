with order_items as (

    select * from {{ ref('int_order_items_enriched') }}

)

select
    order_id,
    item_id,
    product_id,
    customer_id,
    store_id,
    staff_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    quantity,
    list_price,
    discount,
    item_revenue

from order_items
