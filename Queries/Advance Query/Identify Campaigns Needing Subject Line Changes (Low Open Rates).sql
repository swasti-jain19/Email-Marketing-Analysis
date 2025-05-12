WITH campaign_open AS (
    SELECT 
        campaign_name,
        SUM(opened) AS total_opened,
        COUNT(*) AS total_sent
    FROM campaign_data
    GROUP BY campaign_name
)
SELECT 
    campaign_name,
    ROUND(100.0 * total_opened / total_sent, 2) AS open_rate_percent
FROM campaign_open
WHERE ROUND(100.0 * total_opened / total_sent, 2) < 20 -- arbitrary threshold
ORDER BY open_rate_percent ASC;
