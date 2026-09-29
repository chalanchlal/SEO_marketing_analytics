CREATE DATABASE seo_marketing_analytics;
USE seo_marketing_analytics;

select * from seo_main;

SHOW TABLES;
DESCRIBE SEO_Main;


ALTER TABLE SEO_Main
ADD PRIMARY KEY (`Keyword ID`);

DESCRIBE Intent_Lookup;

ALTER TABLE intent_Lookup
ADD PRIMARY KEY (`Intent ID`);

ALTER TABLE position_lookup
ADD PRIMARY KEY (`position id`);

ALTER TABLE trend_lookup
ADD PRIMARY KEY (`Trend ID`);

ALTER TABLE serp_lookup
ADD PRIMARY KEY (`SERP Feature ID`);


ALTER TABLE seo_main
ADD CONSTRAINT fk_intent
FOREIGN KEY (`Intent ID`)
REFERENCES intent_lookup(`Intent ID`);

ALTER TABLE seo_main
ADD CONSTRAINT fk_position
FOREIGN KEY (`position id`)
REFERENCES position_lookup(`position id`);

ALTER TABLE seo_main
ADD CONSTRAINT fk_serp
FOREIGN KEY (`SERP Feature ID`)
REFERENCES serp_lookup(`SERP Feature ID`);

ALTER TABLE seo_Main
ADD CONSTRAINT fk_serp
FOREIGN KEY (`serp id`)
REFERENCES serp_lookup(`SERP Feature ID`);

ALTER TABLE SEO_Main
ADD CONSTRAINT fk_trend
FOREIGN KEY (`Trend ID`)
REFERENCES trend_lookup(`Trend ID`);

 describe serp_lookup;
 
 SELECT COUNT(*) AS total_keywords
FROM SEO_Main;

SELECT *
FROM SEO_Main
LIMIT 10;

SELECT SUM(`Search Volume`) AS total_search_volume
FROM SEO_Main;

SELECT SUM(Traffic) AS total_traffic
FROM SEO_Main;

SELECT ROUND(AVG(Position), 2) AS average_position
FROM SEO_Main;

SELECT
    Keyword,
    Traffic,
    Position,
    `Search Volume`
FROM SEO_Main
ORDER BY Traffic DESC
LIMIT 10;

SELECT
    Keyword,
    `Search Volume`,
    Position,
    Traffic
FROM SEO_Main
ORDER BY `Search Volume` DESC
LIMIT 10;

SELECT
    k.`Intent ID`,
    COUNT(*) AS keyword_count,
    SUM(s.Traffic) AS total_traffic
FROM SEO_Main s
JOIN Keyword_Intent_Lookup k
    ON s.Intent_ID = k.`Intent ID`
GROUP BY k.`Keyword Intent`
ORDER BY total_traffic DESC;

SELECT
    Keyword,
    `Previous Position`,
    Position,
    `Ranking Change`
FROM SEO_Main
ORDER BY `Ranking Change` DESC
LIMIT 10;