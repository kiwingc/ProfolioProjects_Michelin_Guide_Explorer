CREATE DATABASE Michelin;

-- Check NULL values
SELECT *
FROM Michelin.restaurants
WHERE city IS NULL or city = '';  -- The only null cities have a region of Hong Kong

-- Replace null values as Hong Kong
SELECT r.name, r.year, r.latitude, r.longitude,
	CASE WHEN r.city IS NULL THEN 'Hong Kong'
    WHEN r.city = '' THEN 'Hong Kong'
    ELSE r.city END AS city,
    r.region, r.rating, r.zipCode, r.url, c.cuisine, c.price
FROM Michelin.restaurants AS r

-- JOIN cuisine table

LEFT JOIN Michelin.cuisine AS c
	ON r.restaurant_id = c.restaurant_id;
