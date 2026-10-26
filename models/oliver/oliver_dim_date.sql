{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

with cte_date as (
    {{ dbt_date.get_date_dimension("2020-01-01", "2030-12-31") }}
)

select
    date_day as date_key,
    date_day as date_id,
    day_of_week_name as dayofweek,
    month_name as month,
    quarter_of_year as quarter,
    year_number as year
from cte_date