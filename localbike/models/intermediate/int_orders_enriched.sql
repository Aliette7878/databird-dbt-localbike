with order_items_enriched as (

    select * from {{ ref('int_order_items_enriched') }}

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
    count(item_id)          as nb_items,
    sum(quantity)           as total_quantity,
    round(sum(item_revenue),2) as total_revenue

from order_items_enriched
group by
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_status,
    order_date,
    required_date,
    shipped_date
