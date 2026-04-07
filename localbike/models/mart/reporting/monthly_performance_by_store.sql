with fct_order_items as (

    select * from {{ ref('fct_order_items') }}

),

stores as (

    select * from {{ ref('dim_stores') }}

)

select
    date_trunc(oi.order_date, month)    as month,
    oi.store_id,
    s.store_name,
    s.city,
    s.state,
    count(distinct oi.order_id)         as nb_orders,
    sum(oi.quantity)                    as total_quantity,
    round(cast(sum(oi.item_revenue) as numeric), 2) as total_revenue

from fct_order_items oi
left join stores s using (store_id)

group by
    month,
    oi.store_id,
    s.store_name,
    s.city,
    s.state

order by month, store_name
