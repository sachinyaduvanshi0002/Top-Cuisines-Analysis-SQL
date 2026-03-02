# 🍽️ Top Cuisines Analysis (SQL) — Cognifyz Technologies Internship

## 📌 Project Overview
This project analyzes restaurant data to identify the **top five most common cuisines** and calculate the **percentage of restaurants serving each cuisine**.

This task was completed during my **Data Analysis Internship at Cognifyz Technologies** as part of the Level 1 requirements.

---

## 🎯 Objective
- Identify the top 5 most common cuisines in the dataset  
- Calculate the percentage of restaurants serving each cuisine  
- Demonstrate data cleaning and SQL aggregation skills  

---

## 🗂️ Dataset
The dataset contains information about restaurants, including:

- Restaurant Name  
- City  
- Cuisines  
- Price Range  
- Aggregate Rating  
- Online Delivery  
- Votes  

> ⚠️ Note: The `Cuisines` column contains multiple values separated by commas, which were normalized using SQL string functions.

---

## 🛠️ Tools & Technologies
- PostgreSQL  
- SQL  
- Data Cleaning & Transformation  
- Aggregation Functions  

---

## 🔍 Approach

### Step 1: Data Preparation
- Imported the CSV dataset into PostgreSQL  
- Selected relevant columns  
- Verified data quality  

### Step 2: Data Normalization
- Split the multi-valued `Cuisines` column using:
  - `string_to_array()`
  - `unnest()`
  - `TRIM()`

### Step 3: Aggregation
- Counted frequency of each cuisine  
- Calculated percentage using total restaurants  
- Sorted results in descending order  
- Extracted top 5 cuisines  

---

## 🧮 Key SQL Logic

```sql
WITH split_data AS (
    SELECT TRIM(unnest(string_to_array(cuisines, ','))) AS cuisine
    FROM restaurants
),
total AS (
    SELECT COUNT(*) AS total_restaurants FROM restaurants
)
SELECT
    cuisine,
    COUNT(*) AS total_count,
    ROUND(100.0 * COUNT(*) / (SELECT total_restaurants FROM total), 2) AS percentage
FROM split_data
GROUP BY cuisine
ORDER BY total_count DESC
LIMIT 5;

<img width="1920" height="1080" alt="Screenshot 2026-03-02 123617" src="https://github.com/user-attachments/assets/553f6ef4-dab4-4db7-8172-18c5f3ece876" />
<img width="1920" height="1080" alt="Screenshot 2026-03-02 123600" src="https://github.com/user-attachments/assets/a19e03e2-22c7-4129-912c-9ecaeeff8114" />
