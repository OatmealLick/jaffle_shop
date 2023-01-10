with payments as (
  select * from {{ ref('stg_payments') }}
)

select sum(amount) as total_amount from payments