-- 1. Hosts with the largest portfolios
SELECT
    host_id,
    host_name,
    COUNT(*) AS total_listings
FROM listings_cleaned
GROUP BY host_id, host_name
ORDER BY total_listings DESC
LIMIT 12;

-- 2. Multi-listing hosts (2 or more listings)
SELECT
    host_id,
    host_name,
    COUNT(*) AS total_listings
FROM listings_cleaned
GROUP BY host_id, host_name
HAVING COUNT(*) >= 2
ORDER BY total_listings DESC;

-- Count of multi-listing hosts
SELECT
    COUNT(*) AS multi_listing_hosts
FROM (
    SELECT host_id
    FROM listings_cleaned
    GROUP BY host_id
    HAVING COUNT(*) >= 2
) AS multi_hosts;

-- 3. Neighbourhood concentration of multi-listing hosts
SELECT
    neighbourhood_cleansed,
    COUNT(DISTINCT host_id) AS multi_listing_hosts
FROM listings_cleaned
WHERE host_id IN (
    SELECT host_id
    FROM listings_cleaned
    GROUP BY host_id
    HAVING COUNT(*) >= 2
)
GROUP BY neighbourhood_cleansed
ORDER BY multi_listing_hosts DESC
LIMIT 12;
