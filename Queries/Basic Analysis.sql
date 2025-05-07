-- 1. Total Campaigns Sent --

SELECT 
	COUNT(*) AS total_campaigns 
	FROM campaign_data;

-- 2. Open Rate and Click Rate --

SELECT
  ROUND(AVG(opened::INTEGER) * 100, 2) AS avg_open_rate,
  ROUND(AVG(clicked::INTEGER) * 100, 2) AS avg_click_rate
FROM campaign_data;

-- 3. Bounce Rate and Unsubscribe Rate --

SELECT
  ROUND(AVG(bounced::INTEGER) * 100, 2) AS avg_bounce_rate,
  ROUND(AVG(unsubscribed::INTEGER) * 100, 2) AS avg_unsubscribe_rate
FROM campaign_data;

-- 4. Conversion Rate by Campaign Type --

SELECT campaign_type,
       COUNT(*) AS total_sent,
       SUM(conversion::INTEGER) AS total_conversions,
       ROUND(AVG(conversion::INTEGER) * 100, 2) AS conversion_rate
FROM campaign_data
GROUP BY campaign_type
ORDER BY conversion_rate DESC;

-- 5. Performance by Country --

SELECT country,
       COUNT(*) AS emails_sent,
       ROUND(AVG(opened::INTEGER) * 100, 2) AS open_rate,
       ROUND(AVG(clicked::INTEGER) * 100, 2) AS click_rate,
       ROUND(AVG(conversion::INTEGER) * 100, 2) AS conversion_rate
FROM campaign_data
GROUP BY country
ORDER BY emails_sent DESC;

-- 6. Device Engagement --

SELECT device,
       COUNT(*) AS total_sent,
       ROUND(AVG(opened::INTEGER) * 100, 2) AS open_rate,
       ROUND(AVG(clicked::INTEGER) * 100, 2) AS click_rate
FROM campaign_data
GROUP BY device
ORDER BY open_rate DESC;

-- 7. Top Performing Campaigns by Conversion --

SELECT campaign_name,
       campaign_type,
       COUNT(*) AS total_sent,
       SUM(conversion::INTEGER) AS total_conversions,
       ROUND(SUM(conversion::INTEGER) * 100.0 / COUNT(*), 2) AS conversion_rate
FROM campaign_data
GROUP BY campaign_name, campaign_type
ORDER BY conversion_rate DESC
LIMIT 10;

-- 8. Daily Conversion Trend --

SELECT date_sent,
       COUNT(*) AS emails_sent,
       SUM(conversion::INTEGER) AS total_conversions
FROM campaign_data
GROUP BY date_sent
ORDER BY date_sent;