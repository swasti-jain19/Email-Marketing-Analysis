SELECT 
    country,
    COUNT(*) AS total_sent,
    SUM(opened) AS total_opened,
    ROUND(100.0 * SUM(opened) / COUNT(*), 2) AS open_rate_percent
FROM campaign_data
GROUP BY country
HAVING COUNT(*) > 50 -- filter for meaningful volume
ORDER BY open_rate_percent DESC;

-- Helps allocate budget geographically --
