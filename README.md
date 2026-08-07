# An analysis of Repeat Visitor vs. Single Visitor Revenue Generation

Working in Web Analytics domain, I always deal with complex user behavior which plays a pivotal role in business success.

To understand it, I have to make hypothesis, observation is my main weapon.

One of the many observations is:
"As a user I never make a purchase on my first visit, I would wait for promotion, or wait until the dynamic pricing drops lower. "

t triggers my interest to research about:
"Are users who are repeat visitors tend to make more revenue compared to single visitors?"

## Data
Dataset: Google Analytics Sample (BigQuery public dataset), Period: Agustus 2017.
Schema details and columns definition: [data dictionary](data_dictionary.md)

## Tools & workflow
* SQL (BigQuery) Initial extraction & aggregation
* Python (pandas, seaborn, scipy) EDA & Statistics test

## Key Findings
* The initial mean of the data reflected on average, a repeat visitor spent significantly higher revenue ($22.01 vs. $1.71). However, this number is propelled by one outlier that contributed to 62% of the group's total revenue.
* By analyzing its median, the result turned upside down where a single visitor on average spent $48.39 compared to just $36.40 for a single visitor.
* A Mann-Whiteney U test is ran with the p-value result of 0.5333 (larger than the accepted 0.05) meaning fail to reject the null hypthesis (fail to reject repeat visitor = single visitor). In other words, from the median test above, we cannot confidently say that the test proof single visit spent more than repeat visitors.

## Limitation
* Low sample size, and arbitrary period (1 month)
