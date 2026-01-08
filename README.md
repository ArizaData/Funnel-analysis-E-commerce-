# Project Background

E-commerce is a rapidly growing industry that continues to generate high revenue annually, driven by advancements in technology and social media. This project analyzes a synthetic E-commerce dataset capturing user behavior and transactional activity across an online retail platform that mirrors a real-world company.

The goal is to identify conversion inefficiencies, revenue drivers, and drop-off points in the customer journey, ultimately helping to improve overall business performance and drive growth.

Insights and recommendations are provided on key areas:

* **User behavior Funnel Performance:** Evaluation of how users progress through the funnel (view → cart → purchase), focusing on user counts and conversion rates/ at each stage.

* **Revenue Contribution:** Analysis of total revenue and average order value(AOV), with emphasis on how different user behaviors translate into revenue generation.

* **Repeat Purchaser Impact:** Assessment of user repeat purchase rates, measuring their contribution to overall revenue to highlight retention-driven growth opportunities.

* **User Signup Cohort Analysis:** Analysis of users grouped by signup period to assess how purchase conversion rates and monetization vary across cohorts, helping identify differences in user quality and long-term value over time.

Power BI dashboard can be downloaded [here](E-commerce%20Funnel%20Analysis%20Dashboard.pbix)

All SQL queries used for analysis can be found [here.](SQL/)

# Dataset Overview
The Data the analysis was performed on consist of three tables: events, orders, users, which can be seen below:

click:
<details>
  <summary>Dataset Tables ERD</summary>
  <img src="https://github.com/user-attachments/assets/6e5cd51d-61d1-49df-8eb3-750f7a822473" width="500" alt="Dataset Tables ERD" />
</details>

# Executive Summary
### Overview of findings

Our e-commerce funnel shows strong overall health with a 33% purchase user conversion, though there are areas that can be improved upon to help the business. Nearly 70% of users progressed from view to cart, but cart-to-purchase conversion was only 47%, indicating an opportunity to optimize checkout experience. Total revenue generated exceeded $2 million, with an AOV of $729, showing high contribution per user. Notably, 18% of purchasers were repeat buyers, contributing approximately 32% of total revenue, suggesting retention strategies could be further leveraged. The following sections will explore additional contributing factors and highlight key opportunity areas for improvement.

Below is Overview of Power BI dashboard along with more detailed findings/recommendations.

<img width="1169" height="657" alt="Funnel Analysis Dashboard" src="https://github.com/user-attachments/assets/82caef5a-dcf7-4f18-892e-35bff8c30495" />

### User Funnel Performance:

* Out of 10,000 users in the dataset, 3,320 users (33%) completed a purchase, indicating strong overall funnel performance relative to typical e-commerce benchmarks.

* Product discovery and merchandising appear effective: 9,961 users viewed at least one product, and 6,994 users added an item to cart, resulting in a high 70% view-to-cart conversion that signals strong purchase intent.

* Conversion drops most sharply at checkout, where only 47% of carted users completed a purchase (3,320 of 6,994), identifying checkout as the primary source of revenue leakage in the funnel.


<img width="560" height="247" alt="Screenshot 2026-01-07 204830" src="https://github.com/user-attachments/assets/85f1136e-e0a8-4f7d-9999-2b9ba5653578" />

### Revenue Contribution:
  
* From 2024 through the end of 2025, nearly $2.5M in total revenue was generated from 3,320 purchasing users, indicating strong revenue generation relative to the size of the purchasing user base.

* Average order value (AOV) was $728.83, showing that purchases tend to be high-value rather than driven by low-cost, high-frequency transactions.

### Repeat Purchase Impact:

* 18% of purchasing users (612 out of 3,320) made multiple purchases, indicating a segment of loyal customers within the user base.

* Repeat purchasers contributed approximately 32% of total revenue ($775K), highlighting their disproportionate contribution to overall sales.

<img width="510" height="247" alt="Screenshot 2026-01-07 205255" src="https://github.com/user-attachments/assets/f1af6a40-0ee1-4603-9eda-d9a7650b348b" />


### User Sign up cohort analysis:

* Purchase Conversion rates remain consistent across cohorts, with purchase rates ranging from 30% to 36%, indicating stable funnel performance regardless of signup date.

* Total revenue per cohort varies modestly from $85K to $138K, while average order value (AOV) per cohort ranges from $504 to $710, showing users generate predictable revenue irrespective of signup month.

<img width="1861" height="265" alt="Screenshot 2026-01-07 205759" src="https://github.com/user-attachments/assets/e2d3e416-856c-415b-a36f-be18faeabb22" />

### Recommendations:

Based on the insights, the foloowing recommendations have been provided:

* With only 47% of users converting from cart to purchase, the checkout stage shows the largest revenue leakage. **Simplifying  the checkout process and implementing abandoned cart reminders or limited-time incentives could increase conversions and overall revenue.**

* Repeat buyers are only 18% of purchasers but contribute around 32% of revenue, highlighting high retention value. **Implementing loyalty programs or rewards, leveraging personalized product recommendations, and offering targeted promotions for replenishable items can strengthen engagement and long-term loyalty,** further increasing recurring revenue.
 
* Consistent purchase rates indicate strong funnel efficiency, but the total user base of 10,000 suggests low traffic with high growth potential. **Run targeted onboarding campaigns for new users, implement welcome offers, and track time-to-first purchase** to accelerate early-stage engagement and maximize acquisition value.

### Caveats and assumptions:

* The dataset includes only users who signed up, so it does not account for guest or anonymous traffic, potentially underestimating overall funnel activity and conversion potential.

* Event data tracks interactions per product, but not all user journeys are fully captured; some products may only show a single event type (view, cart, or purchase), limiting full funnel sequence analysis.
  
* The data was artificially generated to mimic real e-commerce behavior, so patterns may not fully reflect actual customer behavior or anomalies found in a live system.
