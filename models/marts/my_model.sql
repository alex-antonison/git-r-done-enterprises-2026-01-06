SELECT title
FROM {{ ref('stg_movies') }}
WHERE major_genres = 'Comedy'
AND imb_rating >= 7.0