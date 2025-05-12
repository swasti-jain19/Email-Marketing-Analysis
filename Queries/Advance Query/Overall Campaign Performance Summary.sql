WITH base AS (
    SELECT 
        COUNT(*) AS total_sent,
        SUM(clicked) AS total_clicked,
        SUM(opened) AS total_opened,
        SUM(bounced) AS total_bounced,
        SUM(unsubscribed) AS total_unsubscribed,
        SUM(conversion) AS total_conversion
    FROM campaign_data
)
SELECT
    total_sent,
    ROUND(100.0 * total_clicked / total_sent, 2) AS ctr_percent,
    ROUND(100.0 * total_opened / total_sent, 2) AS open_rate_percent,
    ROUND(100.0 * total_bounced / total_sent, 2) AS bounce_rate_percent,
    ROUND(100.0 * total_unsubscribed / total_sent, 2) AS unsubscribe_rate_percent,
    ROUND(100.0 * total_conversion / total_sent, 2) AS conversion_rate_percent
FROM base;

