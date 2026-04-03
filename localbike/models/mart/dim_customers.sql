with customers as (

    select * from {{ ref('int_customers') }}

)

select
    customer_id,
    full_name,
    first_name,
    last_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code

from customers
