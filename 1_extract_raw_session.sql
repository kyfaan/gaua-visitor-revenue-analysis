-- Data Filter Query
SELECT
  fullVisitorId,
  visitNumber,
  COALESCE(totals.totalTransactionRevenue / 1000000, 0) AS total_revenue 
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _TABLE_SUFFIX BETWEEN '20170801' AND '20170831'
