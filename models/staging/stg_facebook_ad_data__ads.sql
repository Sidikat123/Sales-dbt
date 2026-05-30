
source as (

    select * from {{ source('facebook_ad_data', 'ads') }}

),

renamed as (

    select

    from source

)

select * from renamed