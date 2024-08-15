with 

source as (

    select * from {{ source('police_data', 'stop_and_search_new') }}

),

renamed as (

    select
        type,
        date(date || "-01") as stop_and_search_month,
        part_of_policing_operation,
        policing_operation,
        latitude,
        longitude,
        gender,
        age_range,
        self_defined_ethnicity,
        officer_defined_ethnicity,
        legislation,
        object_of_search,
        outcome,
        outcome_linked_to_object,
        removal_more_than_outer,
        area

    from source

)

select * from renamed
