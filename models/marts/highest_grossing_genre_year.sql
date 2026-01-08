-- Highest grossing genre per year
with yearly_genre_grossing as(
select
        release_year
        , major_genres
        , sum(worldwide_gross) as worldwide_gross
        , row_number() over(partition by release_year order by sum(worldwide_gross) desc) as rn
from {{ ref('stg_movies') }}
where major_genres is not null
group by release_year, major_genres
)

select
    release_year
    , major_genres
    , worldwide_gross
from yearly_genre_grossing
where rn=1
order by release_year desc

