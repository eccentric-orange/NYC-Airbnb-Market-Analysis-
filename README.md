# NYC Airbnb Market Explorer

End-to-end analytics project exploring New York City Airbnb listings. The pipeline covers data cleaning in Python, structured SQL analysis in MySQL, exploratory work in Jupyter, and an interactive Power BI dashboard.

## Overview

Starting from a raw Inside Airbnb style export, the project:

1. Cleans and reduces the raw dataset to an analysis-ready table of ~30k listings
2. Loads the cleaned data into MySQL
3. Answers a focused set of business questions across market structure, pricing, hosts, performance, availability and entry opportunities
4. Visualizes key findings in Power BI

## Project Layout

```
NYC_Airbnb_Market_Explorer/
├── data/
│   └── processdata/
│       └── listings_cleaned.csv
├── notebooks/
│   ├── datainfo.ipynb
│   ├── datacleaning.ipynb
│   └── Business.ipynb
├── sql/
│   ├── database_setup.sql
│   ├── data_quality.sql
│   ├── market_analysis.sql
│   ├── pricing_analysis.sql
│   ├── host_analysis.sql
│   ├── listing_performance.sql
│   └── opportunity_analysis.sql
├── src/
│   └── importingdata.ipynb
├── powerbi/
│   └── Airbnb-dashboard.pbix
└── README.md
```

## Dataset

- Cleaned file: ~30,259 listings × 45 columns
- Coverage: Manhattan, Brooklyn, Queens, Bronx, Staten Island
- Room types: Entire home/apt, Private room, Shared room, Hotel room
- Core fields: price, room type, neighbourhood, host metrics, review scores, occupancy estimates

## Data Cleaning Summary

Performed in `notebooks/datacleaning.ipynb`:

- Dropped non-analytic columns (URLs, images, free-text descriptions) and fully null columns
- Imputed low-missingness numeric columns with 0 and text columns with "Unknown"
- Filled remaining numeric gaps with column medians
- Converted price from currency string to float
- Exported clean CSV for downstream use

## Business Questions

**Market**
1. Which neighbourhoods have the most listings?
2. Which room types dominate?
3. How is supply distributed across boroughs?

**Pricing**
4. Average price by neighbourhood and room type
5. Most expensive areas
6. Presence of extreme prices

**Hosts**
7. Hosts managing the largest number of listings
8. Prevalence of multi-listing hosts
9. Geographic concentration of multi-listing hosts

**Performance**
10. Listings with the most reviews
11. Neighbourhoods and room types with higher ratings
12. Relationship between price, ratings and review volume

**Availability & Opportunity**
13. High / low occupancy patterns by area and room type
14. Market implications of occupancy
15. Suggested neighbourhood + room type combinations for a new host

## Tech Stack

- Python (pandas, numpy)
- MySQL
- Jupyter
- Power BI

## Quick Start

1. Place the cleaned CSV under `data/processdata/`
2. Run the notebooks in order for exploration and verification
3. Create the MySQL database with `sql/database_setup.sql` and import the CSV
4. Execute the analysis scripts under `sql/`
5. Open the Power BI file for interactive views

## Notes

- Update any remaining absolute paths in notebooks to match your local environment
- The Power BI dashboard is provided as-is; refresh the data source after import if needed

---
Portfolio project demonstrating the full analytics workflow from raw data to business insights.
