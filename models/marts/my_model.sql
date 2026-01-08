with

stg_movies as (

    select *
    from {{ ref('stg_movies') }}

),

transformed as (

    select
        major_genres,
        avg(rotten_tomatoes_rating) as rotten_tomatoes_rating,
        avg(imdb_rating) as imdb_rating,
        avg(imdb_votes) as imdb_votes
    from stg_movies
    group by major_genres

)

select *
from transformed