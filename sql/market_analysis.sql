-- 1. Neighbourhoods with the highest listing density
SELECT 
    neighbourhood_cleansed,
    COUNT(*) AS total_listings
FROM listings_cleaned
GROUP BY neighbourhood_cleansed
ORDER BY total_listings DESC
LIMIT 12;

-- 2. Room type market share
SELECT 
    room_type,
    COUNT(*) AS total_listings,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM listings_cleaned), 2) AS pct_of_market
FROM listings_cleaned
GROUP BY room_type
ORDER BY total_listings DESC;

-- 3. Geographic distribution by borough / neighbourhood group
SELECT 
    neighbourhood_group_cleansed,
    COUNT(*) AS total_listings,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM listings_cleaned), 2) AS market_share_pct
FROM listings_cleaned
GROUP BY neighbourhood_group_cleansed
ORDER BY total_listings DESC;
