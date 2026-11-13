-- 1. Listings with the highest review counts
SELECT
    id,
    host_name,
    neighbourhood_cleansed,
    room_type,
    number_of_reviews
FROM listings_cleaned
WHERE number_of_reviews IS NOT NULL
ORDER BY number_of_reviews DESC
LIMIT 12;

-- 2. Neighbourhoods with strongest average ratings (min 15 listings)
SELECT
    neighbourhood_cleansed,
    ROUND(AVG(review_scores_rating), 2) AS average_rating,
    COUNT(*) AS total_listings
FROM listings_cleaned
WHERE review_scores_rating IS NOT NULL
GROUP BY neighbourhood_cleansed
HAVING COUNT(*) >= 15
ORDER BY average_rating DESC
LIMIT 12;

-- Average ratings by room type
SELECT
    room_type,
    ROUND(AVG(review_scores_rating), 2) AS average_rating,
    COUNT(*) AS total_listings
FROM listings_cleaned
WHERE review_scores_rating IS NOT NULL
GROUP BY room_type
ORDER BY average_rating DESC;

-- 3. Price, rating and review volume by room type
SELECT
    room_type,
    ROUND(AVG(price), 2) AS average_price,
    ROUND(AVG(review_scores_rating), 2) AS average_rating,
    ROUND(AVG(number_of_reviews), 2) AS average_reviews,
    COUNT(*) AS total_listings
FROM listings_cleaned
WHERE price IS NOT NULL
  AND review_scores_rating IS NOT NULL
  AND number_of_reviews IS NOT NULL
GROUP BY room_type
ORDER BY average_price DESC;
