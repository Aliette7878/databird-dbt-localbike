with customers as (

    select * from {{ ref('stg_localbike__customers') }}

)

select
    customer_id,
    first_name,
    last_name,
    first_name || ' ' || last_name as full_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code

from customers
