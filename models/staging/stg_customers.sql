with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ custom_source( 'RAW', 'RAW_CUSTOMERS', "'"'https://duck-db-demo.s3.eu-west-2.amazonaws.com/raw_customers.csv'"'"  ) }}

),

renamed as (

    select
        id,
        first_name,
        last_name
    from source

)

select * from renamed
