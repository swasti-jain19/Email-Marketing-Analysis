SELECT 
    campaign_type,
    COUNT(*) AS total_sent,
    SUM(clicked) AS total_clicked,
    ROUND(100.0 * SUM(clicked) / COUNT(*), 2) AS ctr_percent
FROM campaign_data
GROUP BY campaign_type
ORDER BY ctr_percent DESC;
