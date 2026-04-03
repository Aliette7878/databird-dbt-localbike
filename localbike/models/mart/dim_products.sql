with products as (

    select * from {{ ref('int_products_enriched') }}

)

select
    product_id,
    product_name,
    brand_id,
    brand_name,
    category_id,
    category_name,
    model_year,
    list_price

from products
