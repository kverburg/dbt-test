with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
)

select 
    *
from
    orders
    left join payments
        using (order_id) 
