# **Toman Bikeshare - Data Analysis (SQL & Power BI)**  
This project involves analyzing bike-sharing data using **SQL Server**, **Power BI**, and **CSV datasets** to extract insights and visualize key business metrics.

## Table of Contents
- [1. Data Analysis Workflow](#1-data-analysis-workflow)
- [2. Project Goal](#2-project-goal)
- [3. Dashboard Requirements](#3-dashboard-requirements)
- [4. Dataset Details & Preparation](#4-dataset-details--preparation)
- [5. SQL Query for Data Extraction](#5-sql-query-for-data-extraction)
- [6. Data Export & Power BI Visualization](#6-data-export--power-bi-visualization)
- [7. Business Insights, Recommendations & Conclusion](#7-business-insights-recommendations--conclusion)
- [8. Technologies Used](#8-technologies-used)
- [9. Final Thoughts](#9-final-thoughts)
- [10. Requirements Gathering](#10-requirements-gathering)

## **1. Data Analysis Workflow**  
The analysis follows a structured workflow:  

### Step 1: Creating the Database  
- The provided **CSV files** are imported into **SQL Server** to create a structured **database**.  
- The tables are properly defined, and relationships are established to ensure data integrity.  

### Step 2: Developing SQL Queries  
- The dataset includes two years of data (`year_0` and `year_1`).  
- The tables are merged using **Common Table Expressions (CTE)** and **JOIN operations**.  
- Key metrics such as **hourly revenue, profit, and seasonal trends** are calculated within SQL.  

### Step 3: Connecting Power BI to the Database  
- Power BI is connected to the **SQL Server database** to fetch the cleaned and structured data.  

### Step 4: Building the Dashboard in Power BI  
- Various **visualizations** are created to answer the business questions.  
- The dashboard is designed based on the provided **stakeholder requirements**.  

### Step 5: Answering the Business Questions 
- The final dashboard provides insights that help in making **data-driven decisions**.  

---

## **2. Project Goal**  
The main objective of this project is to develop a **dashboard** that visualizes **Key Performance Indicators (KPIs)** to support decision-making for **Toman Bikeshare**.  

The company is particularly interested in analyzing **pricing trends** to determine whether **subscription prices should be increased next year**. 
![Toman Bikeshare](https://github.com/user-attachments/assets/b4ba235d-55a9-4d0e-aede-2988757e212c)

---

## **3. Dashboard Requirements**   
- **Hourly Revenue Analysis**  
- **Profit and Revenue Trends**  
- **Seasonal Revenue**  
- **Rider Demographics**
---

## **4. Dataset Details & Preparation**  
The dataset used in this analysis is sourced from **GitHub**: [YT_bike_share](https://github.com/Gaelim/YT_bike_share).  

### **Steps Taken:**  
1. **Downloaded** the dataset and imported it into **SQL Server**.  
2. The dataset consists of:  
   - A **cost table**.  
   - Two years of data: **2021 (`year_0`)** and **2022 (`year_1`)**.  

---

## **5. SQL Query for Data Extraction**  
To analyze the data, we first **merged** records from both years using a **Common Table Expression (CTE)**.  
We then **joined** them with the **cost table** to calculate revenue and profit, selecting only the relevant columns to finalize the query.
![Toman Bikeshare sql](https://github.com/user-attachments/assets/f3729c39-ac43-4ba7-b2b5-4b9155abb30b)

```sql
-- Common Table Expression (CTE) for combining bike share data  
WITH bike_share_CTE AS (  
    SELECT * FROM bike_share_yr_0  
    UNION  
    SELECT * FROM bike_share_yr_1  
)  

-- Selecting relevant columns and calculating revenue and profit  
SELECT dteday, season, bsc.yr, weekday,  
       hr, rider_type, riders, price, COGS,  
       riders * price AS revenue,  
       riders * price - COGS * riders AS profit  
FROM bike_share_CTE bsc  
LEFT JOIN cost_table ct  
ON bsc.yr = ct.yr;
```

---

## 6. Data Export & Power BI Visualization  
- The final query output was **imported into Power BI**.  
- Visualizations were created to represent:  
  - **Revenue trends**  
  - **Demographics**  
  - **Seasonal variations**
  - **Hourly Revenue Analysis**  

--- 
## 7. Business Insights, Recommendations & Conclusion

### 📌 Revenue Trends:  
- Despite the **price increase**, there was **a rise in the number of registered and riders**.  

### 📌 Seasonal Analysis:  
- **Q3** had the **highest usage**.  

### 📌 Pricing Strategy:  
- A **10–15% price increase** could be tested in the market.

---

## 8. Technologies Used  
- **SQL** (for data storage, querying, and transformations)  
- **Power BI** (for visualization and dashboard creation)  
- **CSV** (as the initial raw dataset format)  
- **Data Cleaning & Preprocessing**  
- **Data Visualization & Business Insights**  

---

## 9. Final Thoughts  
This project highlights the **end-to-end data analysis process** using **SQL and Power BI**.  
It provides **valuable insights** into the bike-sharing business and suggests **data-driven recommendations** for price optimization.

---
## 10. Requirements Gathering
For this project, I’ll need to:
- **Create a database.**
- **Develop SQL queries for the database.**
- **Connect to Power BI.**
- **Build a dashboard in Power BI to answer the analysis questions.**
