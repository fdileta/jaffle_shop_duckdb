with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ custom_source( 'RAW', 'RAW_PAYMENTS', "'"'https://duck-db-demo.s3.eu-west-2.amazonaws.com/raw_orders.csv'"'"  ) }}

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount

    from source

)

select * from renamed
