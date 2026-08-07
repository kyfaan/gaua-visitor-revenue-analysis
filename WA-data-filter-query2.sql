SELECT 
  fullVisitorId,
  jumlah_visit,
  total_revenue,
  CASE
    WHEN jumlah_visit > 1 THEN 'repeat visitor'
    ELSE 'single visit'
  END visitor_type 
FROM ( 
SELECT  
    fullVisitorId,
    COUNT(visitNumber) jumlah_visit,
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*` WHERE _TABLE_SUFFIX BETWEEN '20170801' AND '20170831' 
GROUP BY fullVisitorId) AS visitor_grouped