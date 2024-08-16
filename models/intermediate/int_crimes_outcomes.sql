with 
crimes as (

    select * from {{ ref('stg_police_data__street_level_crime_new')}}

),

outcomes as (
    select * from {{ ref('stg_police_data__crime_outcomes_new')}}
)

select
crimes.crime_id,
crimes.crime_month,
crimes.reported_by,
crimes.falls_within,
crimes.longitude,
crimes.latitude,
crimes.location,
crimes.lsoa_code,
crimes.lsoa_name,
crimes.crime_type,
crimes.last_outcome_category,
crimes.context,
crimes.area,
coalesce(outcomes.outcome_type, "Unknown") as outcome_type

from crimes

left join outcomes on crimes.crime_id = outcomes.crime_id