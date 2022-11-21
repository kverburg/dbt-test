with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
)

select 
    orders.order_id,
    orders.customer_id,
    order_date,
    order_payments.amount
from
    orders
    left join order_payments 
        using (order_id)
