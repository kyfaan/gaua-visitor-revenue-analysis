# An Analysis of Repeat Visitor vs. Single Visitor Revenue Generation

Working in web analytics, understanding complex user behavior plays a pivotal role in business success. Driven by the observation—*"As a user, I never make a purchase on my first visit; I wait for promotions or dynamic price drops"*—this project examines the question: **Do repeat visitors tend to generate higher revenue compared to single visitors?**

## Data
* **Dataset:** Google Analytics Sample (BigQuery public dataset)
* **Period:** August 2017
* **Schema & Definitions:** Detailed in the [Data Dictionary](docs/data_dictionary.md)

## Tools & Workflow
* **SQL (BigQuery):** Data extraction, filtering, and aggregation
* **Python (pandas, seaborn, scipy):** Exploratory Data Analysis (EDA) & statistical testing

## Key Findings
* **Mean Revenue Distortion:** Initial mean calculations showed repeat visitors spending significantly more ($22.01 vs. $1.71). However, this figure was heavily skewed by a single outlier that accounted for 62% of the group's total revenue.
* **Median Spend:** Evaluating the median inverted the trend, with single visitors showing higher median spending ($48.39) compared to repeat visitors ($36.40).
* **Statistical Testing:** A Mann-Whitney U test yielded a p-value of `0.5333` (exceeding the standard `0.05` threshold). We fail to reject the null hypothesis, meaning there is no statistically significant difference in revenue generation between repeat and single visitors.

## Limitations
* Small sample size restricted to an arbitrary 1-month evaluation window (August 2017).
