with order_items as (

    select * from {{ ref('stg_localbike__order_items') }}

),

orders as (

    select * from {{ ref('stg_localbike__orders') }}

)

select
    oi.order_id,
    oi.item_id,
    oi.product_id,
    oi.quantity,
    oi.list_price,
    oi.discount,
    round(oi.quantity * oi.list_price * (1 - oi.discount), 2) as item_revenue,
    o.customer_id,
    o.store_id,
    o.staff_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date

from order_items oi
left join orders o using (order_id)
