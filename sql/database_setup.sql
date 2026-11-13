-- Database initialization for NYC Airbnb analysis
CREATE DATABASE IF NOT EXISTS nyc_airbnb_analysis;

USE nyc_airbnb_analysis;

-- Verify tables after import
SHOW TABLES;

-- Inspect cleaned listings table structure
DESC listings_cleaned;

-- Quick data sample
SELECT * FROM listings_cleaned LIMIT 5;
