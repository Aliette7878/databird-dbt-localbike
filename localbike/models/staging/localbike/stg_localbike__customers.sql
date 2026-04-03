with 

source as (

    select * from {{ source('localbike_source', 'customers') }}

),

renamed as (

    select
        customer_id,
        first_name,
        last_name,
        phone,
        email,
        street,
        city,
        state,
        zip_code

    from source

)

select * from renamed