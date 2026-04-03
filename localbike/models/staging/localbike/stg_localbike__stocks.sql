with 

source as (

    select * from {{ source('localbike_source', 'stocks') }}

),

renamed as (

    select
        store_id,
        product_id,
        quantity

    from source

)

select * from renamed