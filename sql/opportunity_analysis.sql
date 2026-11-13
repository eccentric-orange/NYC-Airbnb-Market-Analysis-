-- Opportunity ranking for a new host entering the NYC market
-- Prioritizes strong ratings + solid review volume + reasonable average price
SELECT
    neighbourhood_cleansed,
    room_type,
    ROUND(AVG(price), 2) AS average_price,
    ROUND(AVG(review_scores_rating), 2) AS average_rating,
    ROUND(AVG(number_of_reviews), 2) AS average_reviews,
    COUNT(*) AS listing_count
FROM listings_cleaned
WHERE price IS NOT NULL
  AND review_scores_rating IS NOT NULL
  AND number_of_reviews IS NOT NULL
  AND price BETWEEN 50 AND 400
GROUP BY neighbourhood_cleansed, room_type
HAVING COUNT(*) >= 12
ORDER BY average_rating DESC, average_reviews DESC
LIMIT 12;
