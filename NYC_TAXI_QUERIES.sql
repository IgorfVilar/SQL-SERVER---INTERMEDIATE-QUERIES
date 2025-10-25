select * from nyctaxi_sample

/* FUN합ES DE AGREGA플O, CASE WHEN, GROUP BY, ORDER BY */

SELECT 
    FORMAT(pickup_datetime, 'yyyy-MM') AS DATA,
    payment_type AS PAYMENT, 
    SUM(total_amount) AS AMOUNT,
    SUM(passenger_count) AS PASSENGERS,
    CASE
        WHEN SUM(total_amount) > 50000 THEN 'Good'
        ELSE 'Regular'
    END AS AMOUNT_RATING
FROM nyctaxi_sample
GROUP BY 
    payment_type, 
    FORMAT(pickup_datetime, 'yyyy-MM')
ORDER BY 
    FORMAT(pickup_datetime, 'yyyy-MM') DESC


/* FUN합ES DE AGREGA플O + HAVING */

SELECT 
    vendor_id AS VENDOR, 
    AVG(trip_time_in_secs) AS TRIP_TIME_AVG,
    AVG(trip_distance) AS TRIP_DISTANCE_AVG, 
    AVG(passenger_count) AS PASSENGERS_AVG,
    SUM(total_amount) AS AMOUNT
FROM nyctaxi_sample
GROUP BY 
    vendor_id
HAVING 
    AVG(passenger_count) <= 2


/* FUN합ES DE JANELA PARA CALCULAR PERCENTUAL MENSAL */

SELECT 
    FORMAT(pickup_datetime, 'yyyy-MM') AS DATA,
    SUM(total_amount) AS AMOUNT,
    SUM(total_amount) / SUM(SUM(total_amount)) OVER() * 100 AS PERCENTS
FROM nyctaxi_sample
GROUP BY 
    FORMAT(pickup_datetime, 'yyyy-MM')
ORDER BY 
    FORMAT(pickup_datetime, 'yyyy-MM') DESC



/* CTE E FUN플O DE JANELA PARA EXIBIR O ACUMULADO DOS MESES */

WITH AMOUNT_MONTHS AS (
    SELECT 
        FORMAT(pickup_datetime, 'yyyy-MM') AS MONTHS,
        SUM(total_amount) AS AMOUNT
    FROM nyctaxi_sample
    GROUP BY 
        FORMAT(pickup_datetime, 'yyyy-MM')
)
SELECT 
    MONTHS, 
    AMOUNT,
    SUM(AMOUNT) OVER (ORDER BY MONTHS) AS ACCUMULATED
FROM AMOUNT_MONTHS
ORDER BY 
    MONTHS DESC


/* CRIA플O DE VIEW */

CREATE VIEW PERFORMANCE AS 
SELECT 
    FORMAT(pickup_datetime, 'yyyy-MM') AS DATA,
    payment_type AS PAYMENT, 
    SUM(total_amount) AS AMOUNT,
    SUM(passenger_count) AS PASSENGERS,
    CASE
        WHEN SUM(total_amount) > 50000 THEN 'Good'
        ELSE 'Regular'
    END AS AMOUNT_RATING
FROM nyctaxi_sample
GROUP BY 
    payment_type, 
    FORMAT(pickup_datetime, 'yyyy-MM')

SELECT * FROM PERFORMANCE

