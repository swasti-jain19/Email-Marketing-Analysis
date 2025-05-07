CREATE TABLE campaign_data (
    campaign_name TEXT,
    campaign_type TEXT,
    conversion_target TEXT,
    date_sent DATE,
    client_email TEXT,
    client_segment TEXT,
    country TEXT,
    country_latitude NUMERIC(9,6),
    country_longitude NUMERIC(9,6),
    device TEXT,
    clicked SMALLINT,        
    bounced SMALLINT,         
    opened SMALLINT,          
    unsubscribed SMALLINT,    
    conversion SMALLINT       
);

-- not required --

ALTER TABLE campaign_data
DROP COLUMN country_latitude,
DROP COLUMN country_longitude;

COPY campaign_data
FROM 'C:\DA\Projects\PowerBi\Marketing Dashboard\Marketing Email Campaign Analysis.csv'
DELIMITER ','
CSV HEADER;

