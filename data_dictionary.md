## 1. Data source
Dataset Name: Google Analytics Sample (Google Merchandise Store)
• Location: bigquery-public-data.google_analytics_sample.ga_sessions_*
GA Ver: Universal Analytics (legacy)
Date Range: 1-31 August 2017 (Chosen arbitrarily)
Google Documentation about the data: support.google.com/analytics/answer/3437719

## 2. Raw Table Definition

| Field | Type | Description |
| :--- | :--- | :--- |
| fullVisitorId | String | The unique visitor ID |
| visitNumber | Integer | The session number for this user |
| totals.totalTransactionRevenue | Integer | Total transaction revenue, expressed as the value passed to Analytics multiplied by 10^6 |

## 3. Aggregated Columns Definition

| Column | Type | Description |
| :--- | :--- | :--- |
| fullVisitorId | String | ID visitor |
| jumlah_visit | Integer | The count of total visits per fullVisitorld. E.g: In the column visitNumber, fullVisitorld 1 may have visitNumber: 1, 2, 3. By using COUNT, the result returns '3' |
| visitor_type | String | Deskripsi: Types of visitor based on their jumlah_visit. If greater than 1 visit = repeat visitor, else: single visit |

## 4. Methodology
• COALESCE is used because not all visits result in transactions. So it will be filled with 0 instead.
• The division is necessary since Google multiplies the revenue with 10^6 (for totals.total Transaction Revenue)
• _TABLE_SUFFIX is used because Google stores the dataset in separate tables per date, '*' indicates 'all date tables'. By using _TABLE_SUFFIX, the query is lighter (72KB vs. 33MB if using 'date')
• Basically it tells to check BETWEEN bigquery-public-data.google_analytics_sample.ga_sessions_20170801 AND bigquery-public-data.google_analytics_sample.ga_sessions_20170831 only.
  If 'date' is used in WHERE, we query all tables that contain between 20170801 and 20190831.
• In Aggregated columns, COUNT is used because we want to count the number of visit(s) a visitor did in August. Since visitNumber might be recorded from the previous month.
  E.g: Andy first visited the site on 31 July (visitNumber 1), then made a second visit on 1 August (visitNumber 2). Historically (July-Aug) he is considered a repeat visitor, but he only visited the site once on August. So jumlah_visit only counts his visit in August
