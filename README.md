# 🚗 Smart Mobility Insights: A Strategic Analysis of Uber Travel Patterns
This project analyzes Uber trip data to uncover patterns in urban travel, booking behavior, and operational efficiency. Through the combined use of **SQL**, **Power BI**, and **Python**, it delivers insights into fare distribution, distance traveled, time-based demand, and location trends.

This Project study supports data-driven decisions for smarter ride allocation, demand forecasting, and pricing strategies in ride-hailing platforms.

## 🎯 Objectives

- Track core ride metrics: bookings, distances, fare totals, and duration
- Understand travel demand by hour, weekday, and day/night splits
- Identify top pickup and drop-off zones for different cities
- Explore user behavior by vehicle and payment type
- Build visual dashboards and custom Python charts for stakeholder insights

  ## 🗂️ Dataset Description

1. **Uber Trip Details** – Ride-level info including timestamps, fare, surge, distance, vehicle, payment type, and location IDs  
2. **Location Table** – Maps `LocationID` to `Location` and `City`

## 🛠️ Tools & Technologies

| Tool        | Role in Project |
|-------------|------------------|
| **SQL (MySQL)** | Created relational schema, loaded data, and extracted metrics such as total bookings, trip distance, fare value, and time-based trends. |
| **Power BI** | Designed multi-page interactive dashboards with slicers, DAX measures, bookmarks, and custom visuals (heatmaps, matrix views, KPIs). |
| **Python (Pandas + Matplotlib)** | Merged data, calculated KPIs, and visualized top locations and vehicle demand using custom-styled bar charts. |

📊 Key Metrics Calculated

| KPI                       | Value                                           |
| ------------------------- | ----------------------------------------------- |
| **Total Bookings**        | Number of unique trip IDs (`Trip_id`)           |
| **Total Booking Value**   | Sum of `fare_amount + surge_fee`                |
| **Average Booking Value** | Mean of booking value per ride                  |
| **Total Trip Distance**   | Sum of `trip_distance`                          |
| **Average Trip Distance** | Mean of `trip_distance`                         |
| **Average Trip Duration** | Calculated using pickup and drop-off timestamps |

