SELECT
    director
    ,sum(worldwide_gross) as total_gross
FROM {{ ref('stg_movies') }}
group by director 
order by sum(worldwide_gross) desc
limit 11
