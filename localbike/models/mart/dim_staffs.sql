with staffs as (

    select * from {{ ref('int_staffs') }}

)

select
    staff_id,
    full_name,
    first_name,
    last_name,
    email,
    phone,
    active,
    store_id,
    store_name,
    manager_id

from staffs
