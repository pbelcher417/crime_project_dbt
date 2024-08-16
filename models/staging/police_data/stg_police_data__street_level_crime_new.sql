with 

source as (

    select * from {{ source('police_data', 'street_level_crime_new') }}

),

renamed as (

    select
        crime_id,
        date(month || "-01") as crime_month,
        reported_by,
        falls_within,
        longitude,
        latitude,
        location,
        lsoa_code,
        lsoa_name,
        crime_type,
        last_outcome_category,
        context,
        area

    from source

    qualify row_number() over(partition by crime_id order by crime_month) = 1

)

select * from renamed
