with staffs as (

    select * from {{ ref('stg_localbike__staffs') }}

),

stores as (

    select * from {{ ref('stg_localbike__stores') }}

)

select
    s.staff_id,
    s.first_name,
    s.last_name,
    s.first_name || ' ' || s.last_name as full_name,
    s.email,
    s.phone,
    s.active,
    s.store_id,
    st.store_name,
    s.manager_id

from staffs s
left join stores st using (store_id)
