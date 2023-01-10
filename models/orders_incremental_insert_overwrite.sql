{{
    config(
        materialized='incremental',
        partition_by={'field': 'order_date', 'data_type': 'date'},
        incremental_strategy='insert_overwrite'
    )
}}

with orders as (
    select * from {{ ref('stg_orders') }}
)

select * from orders
{% if is_incremental() %}
    where order_date = "2018-04-09"
{% endif %}
