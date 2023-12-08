with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ custom_source( 'RAW', 'RAW_ORDERS', "'"'https://duck-db-demo.s3.eu-west-2.amazonaws.com/raw_orders.csv'"'"  ) }}

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source

)

select * from renamed
