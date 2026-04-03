with products as (

    select * from {{ ref('stg_localbike__products') }}

),

brands as (

    select * from {{ ref('stg_localbike__brands') }}

),

categories as (

    select * from {{ ref('stg_localbike__categories') }}

)

select
    p.product_id,
    p.product_name,
    p.brand_id,
    b.brand_name,
    p.category_id,
    c.category_name,
    p.model_year,
    p.list_price

from products p
left join brands b using (brand_id)
left join categories c using (category_id)
