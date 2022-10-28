select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from  gpi-civis-gcp.dbt_test_jaffle_shop.shop_orders