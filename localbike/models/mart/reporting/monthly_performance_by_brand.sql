with fct_order_items as (

    select * from {{ ref('fct_order_items') }}

),

products as (

    select * from {{ ref('dim_products') }}

)

select
    date_trunc(oi.order_date, month)    as month,
    p.brand_id,
    p.brand_name,
    count(distinct oi.order_id)         as nb_orders,
    sum(oi.quantity)                    as total_quantity,
    round(cast(sum(oi.item_revenue) as numeric), 2) as total_revenue

from fct_order_items oi
left join products p using (product_id)

group by
    month,
    p.brand_id,
    p.brand_name

order by month, brand_name
