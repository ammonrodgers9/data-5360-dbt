{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

select
    employee_id as employee_key,
    employee_id as employeeid,
    first_name as firstname,
    last_name as lastname,
    email,
    phone_number,
    hire_date,
    position
from {{ source('oliver_landing', 'employee') }}