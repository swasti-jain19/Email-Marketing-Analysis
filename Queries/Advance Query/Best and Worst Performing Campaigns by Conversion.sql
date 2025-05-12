WITH conv_rates AS (
    SELECT 
        campaign_name,
        ROUND(100.0 * SUM(conversion) / COUNT(*), 2) AS conversion_rate
    FROM campaign_data
    GROUP BY campaign_name
)
SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY conversion_rate DESC) AS rank_high,
              ROW_NUMBER() OVER (ORDER BY conversion_rate ASC) AS rank_low
    FROM conv_rates
) sub
WHERE rank_high <= 3 OR rank_low <= 3;
