SELECT client_segment,
       COUNT(*) AS total_sent,
       SUM(opened::INT) AS total_opened,
       SUM(clicked::INT) AS total_clicked,
       SUM(conversion::INT) AS total_converted,
       ROUND(SUM(opened::INT) * 100.0 / COUNT(*), 2) AS open_rate,
       ROUND(SUM(clicked::INT) * 100.0 / NULLIF(SUM(opened::INT), 0), 2) AS click_through_rate,
       ROUND(SUM(conversion::INT) * 100.0 / NULLIF(SUM(clicked::INT), 0), 2) AS conversion_rate
FROM campaign_data
GROUP BY client_segment
ORDER BY conversion_rate DESC;
