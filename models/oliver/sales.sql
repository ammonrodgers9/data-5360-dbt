{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

select
    -- Fact metrics
    f.quantity,
    f.unit_price,
    f.dollars_sold,

    -- Customer attributes
    c.firstname as customer_first_name,
    c.lastname as customer_last_name,
    c.email as customer_email,
    c.state as customer_state,

    -- Employee attributes
    e.firstname as employee_first_name,
    e.lastname as employee_last_name,
    e.position as employee_position,

    -- Store attributes
    s.store_name,
    s.city as store_city,
    s.state as store_state,

    -- Product attributes
    p.product_name,
    p.description as product_description,

    -- Date attributes
    d.date_id,
    d.dayofweek,
    d.month,
    d.quarter,
    d.year

from {{ ref('fact_sales') }} f
left join {{ ref('oliver_dim_customer') }} c
    on f.cust_key = c.cust_key
left join {{ ref('oliver_dim_employee') }} e
    on f.employee_key = e.employee_key
left join {{ ref('oliver_dim_store') }} s
    on f.store_key = s.store_key
left join {{ ref('oliver_dim_product') }} p
    on f.product_key = p.product_key
left join {{ ref('oliver_dim_date') }} d
    on f.date_key = d.date_key