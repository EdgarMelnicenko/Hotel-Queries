-- Revenue

WITH hotels AS(
SELECT * FROM hotel. `2018`
UNION
SELECT * FROM hotel. `2019`
UNION
SELECT * FROM hotel. `2020`)

SELECT 
arrival_date_year,
hotel,
    round(sum((stays_in_week_nights + stays_in_weekend_nights) * adr),2) AS Revenue
FROM
    hotels
    GROUP BY arrival_date_year, hotel
    ORDER BY Revenue
    ;
    
    
    
    -----------------------------------------------------------------
    
      -- ADR
    
WITH hotels AS(
SELECT * FROM hotel. `2018`
UNION
SELECT * FROM hotel. `2019`
UNION
SELECT * FROM hotel. `2020`)

SELECT 
arrival_date_year,
hotel,
ROUND(AVG(adr),2) AS ADR

FROM
    hotels
    GROUP BY arrival_date_year, hotel
    ORDER BY ADR DESC 
    ;
    
-----------------------------------------------------------------

   -- Discount
    
WITH hotels AS(
SELECT * FROM hotel. `2018`
UNION		
SELECT * FROM hotel. `2019`
UNION
SELECT * FROM hotel. `2020`)

SELECT 
    arrival_date_year,
    hotel,
    ROUND(AVG(discount) * 100, 2) AS AVG_Discount
FROM
    hotels
        JOIN
    market_segment$ ON hotels.market_segment = market_segment$.market_segment
        JOIN
    meal_cost$ ON hotels.meal = meal_cost$.meal
GROUP BY arrival_date_year , hotel
ORDER BY avg_discount
    ;
    
    
    
-----------------------------------------------------------------



    -- Total Nights
    
WITH hotels AS(
SELECT * FROM hotel. `2018`
UNION
SELECT * FROM hotel. `2019`
UNION
SELECT * FROM hotel. `2020`)

SELECT 
arrival_date_year,
hotel,

SUM(stays_in_week_nights) + SUM(stays_in_weekend_nights) as Total_nights
FROM
    hotels
    
    GROUP BY hotel, arrival_date_year
    ORDER BY hotel
    ;
    
