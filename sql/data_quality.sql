-- Total rows in cleaned dataset
SELECT COUNT(*) AS total_rows
FROM listings_cleaned;

-- Count of NULL / missing values across key columns
SELECT 
    SUM(id IS NULL) AS id,
    SUM(scrape_id IS NULL) AS scrape_id,
    SUM(last_scraped IS NULL) AS last_scraped,
    SUM(source IS NULL) AS source,
    SUM(host_id IS NULL) AS host_id,
    SUM(host_name IS NULL) AS host_name,
    SUM(hosts_time_as_user_years IS NULL) AS hosts_time_as_user_years,
    SUM(hosts_time_as_user_months IS NULL) AS hosts_time_as_user_months,
    SUM(hosts_time_as_host_years IS NULL) AS hosts_time_as_host_years,
    SUM(hosts_time_as_host_months IS NULL) AS hosts_time_as_host_months,
    SUM(host_is_superhost IS NULL) AS host_is_superhost,
    SUM(host_listings_count IS NULL) AS host_listings_count,
    SUM(host_identity_verified IS NULL) AS host_identity_verified,
    SUM(neighbourhood_cleansed IS NULL) AS neighbourhood_cleansed,
    SUM(neighbourhood_group_cleansed IS NULL) AS neighbourhood_group_cleansed,
    SUM(latitude IS NULL) AS latitude,
    SUM(longitude IS NULL) AS longitude,
    SUM(property_type IS NULL) AS property_type,
    SUM(room_type IS NULL) AS room_type,
    SUM(accommodates IS NULL) AS accommodates,
    SUM(bathrooms IS NULL) AS bathrooms,
    SUM(bathrooms_text IS NULL) AS bathrooms_text,
    SUM(bedrooms IS NULL) AS bedrooms,
    SUM(beds IS NULL) AS beds,
    SUM(amenities IS NULL) AS amenities,
    SUM(price IS NULL) AS price,
    SUM(number_of_reviews IS NULL) AS number_of_reviews,
    SUM(number_of_reviews_ltm IS NULL) AS number_of_reviews_ltm,
    SUM(number_of_reviews_l30d IS NULL) AS number_of_reviews_l30d,
    SUM(number_of_reviews_ly IS NULL) AS number_of_reviews_ly,
    SUM(estimated_occupancy_l365d IS NULL) AS estimated_occupancy_l365d,
    SUM(estimated_revenue_l365d IS NULL) AS estimated_revenue_l365d,
    SUM(first_review IS NULL) AS first_review,
    SUM(last_review IS NULL) AS last_review,
    SUM(review_scores_rating IS NULL) AS review_scores_rating,
    SUM(review_scores_accuracy IS NULL) AS review_scores_accuracy,
    SUM(review_scores_cleanliness IS NULL) AS review_scores_cleanliness,
    SUM(review_scores_checkin IS NULL) AS review_scores_checkin,
    SUM(review_scores_communication IS NULL) AS review_scores_communication,
    SUM(review_scores_location IS NULL) AS review_scores_location,
    SUM(review_scores_value IS NULL) AS review_scores_value,
    SUM(calculated_host_listings_count_entire_homes IS NULL) AS calculated_host_listings_count_entire_homes,
    SUM(calculated_host_listings_count_private_rooms IS NULL) AS calculated_host_listings_count_private_rooms,
    SUM(calculated_host_listings_count_shared_rooms IS NULL) AS calculated_host_listings_count_shared_rooms,
    SUM(reviews_per_month IS NULL) AS reviews_per_month
FROM listings_cleaned;

-- Missing values as percentage of total rows
SELECT 
    ROUND(SUM(id IS NULL) * 100.0 / COUNT(*), 2) AS id_pct,
    ROUND(SUM(scrape_id IS NULL) * 100.0 / COUNT(*), 2) AS scrape_id_pct,
    ROUND(SUM(last_scraped IS NULL) * 100.0 / COUNT(*), 2) AS last_scraped_pct,
    ROUND(SUM(source IS NULL) * 100.0 / COUNT(*), 2) AS source_pct,
    ROUND(SUM(host_id IS NULL) * 100.0 / COUNT(*), 2) AS host_id_pct,
    ROUND(SUM(host_name IS NULL) * 100.0 / COUNT(*), 2) AS host_name_pct,
    ROUND(SUM(price IS NULL) * 100.0 / COUNT(*), 2) AS price_pct,
    ROUND(SUM(review_scores_rating IS NULL) * 100.0 / COUNT(*), 2) AS rating_pct,
    ROUND(SUM(bedrooms IS NULL) * 100.0 / COUNT(*), 2) AS bedrooms_pct,
    ROUND(SUM(bathrooms IS NULL) * 100.0 / COUNT(*), 2) AS bathrooms_pct
FROM listings_cleaned;

-- Check for potential duplicate listing IDs
SELECT
    id AS listing_id,
    COUNT(*) AS duplicate_count
FROM listings_cleaned
GROUP BY id
HAVING COUNT(*) > 1;

-- Validate rating range (should be between 0 and 5)
SELECT *
FROM listings_cleaned
WHERE review_scores_rating < 0
   OR review_scores_rating > 5;

-- Distinct room types present
SELECT DISTINCT room_type
FROM listings_cleaned
ORDER BY room_type;

-- Listings with missing or blank neighbourhood
SELECT id, neighbourhood_cleansed, neighbourhood_group_cleansed
FROM listings_cleaned
WHERE neighbourhood_cleansed IS NULL
   OR TRIM(neighbourhood_cleansed) = '';
