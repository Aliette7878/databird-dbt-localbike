with 

source as (

    select * from {{ source('localbike_source', 'staffs') }}

),

renamed as (

    select
        staff_id, last_name, first_name, email, phone, active, store_id, manager_id

    from source

)

select * from renamed