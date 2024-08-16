with 

source as (

    select * from {{ source('police_data', 'crime_outcomes_new') }}

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
        outcome_type,
        area

    from source

    qualify row_number() over(partition by crime_id order by crime_month) = 1

)

select * from renamed
