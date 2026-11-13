-- 1. Average price by neighbourhood and room type
SELECT
    neighbourhood_cleansed,
    room_type,
    ROUND(AVG(price), 2) AS average_price,
    COUNT(*) AS listing_count
FROM listings_cleaned
WHERE price IS NOT NULL AND price > 0
GROUP BY neighbourhood_cleansed, room_type
HAVING COUNT(*) >= 5
ORDER BY average_price DESC
LIMIT 20;

-- 2. Most expensive neighbourhoods (overall average)
SELECT
    neighbourhood_cleansed,
    ROUND(AVG(price), 2) AS average_price,
    COUNT(*) AS listing_count
FROM listings_cleaned
WHERE price IS NOT NULL AND price > 0
GROUP BY neighbourhood_cleansed
HAVING COUNT(*) >= 20
ORDER BY average_price DESC
LIMIT 12;

-- 3. Extreme / outlier prices (more than 3x overall average)
SELECT
    id,
    neighbourhood_cleansed,
    room_type,
    price
FROM listings_cleaned
WHERE price > (
    SELECT AVG(price) * 3
    FROM listings_cleaned
    WHERE price IS NOT NULL AND price > 0
)
ORDER BY price DESC
LIMIT 25;
