DROP TABLE IF EXISTS restaurants;
CREATE TABLE restaurants (
    restaurant_id INT,
    restaurant_name TEXT,
    country_code INT,
    city TEXT,
    address TEXT,
    locality TEXT,
    locality_verbose TEXT,
    longitude FLOAT,
    latitude FLOAT,
    cuisines TEXT,
    average_cost_for_two INT,
    currency TEXT,
    has_table_booking TEXT,
    has_online_delivery TEXT,
    is_delivering_now TEXT,
    switch_to_order_menu TEXT,
    price_range INT,
    aggregate_rating FLOAT,
    rating_color TEXT,
    rating_text TEXT,
    votes INT
);

SELECT * FROM restaurants;

\copy restaurants
FROM 'C:\Users\sachi\Downloads\Dataset.csv'
DELIMITER ','
CSV HEADER;

SELECT
    TRIM(unnest(string_to_array(cuisines, ','))) AS cuisine
FROM restaurants;

--top 5 cuisine
SELECT
    TRIM(unnest(string_to_array(cuisines, ','))) AS cuisine,
    COUNT(*) AS total_split
FROM restaurants
GROUP BY cuisine
ORDER BY total_split DESC
LIMIT 5;

--Percentage
WITH split_data AS ( SELECT TRIM(unnest(string_to_array(cuisines, ','))) AS cuisine
    FROM restaurants),
total AS ( SELECT COUNT(*) AS total_restaurants FROM restaurants)
SELECT cuisine,
    COUNT(*) AS total_count,
    ROUND(100.0 * COUNT(*) / (SELECT total_restaurants FROM total), 2) AS percentage
FROM split_data
GROUP BY cuisine
ORDER BY total_count DESC
LIMIT 5;