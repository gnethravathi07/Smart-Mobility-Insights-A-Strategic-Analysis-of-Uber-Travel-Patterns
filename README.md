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

## 📊 Key Metrics Calculated

| KPI                       | Value                                           |
| ------------------------- | ----------------------------------------------- |
| **Total Bookings**        | Number of unique trip IDs (`Trip_id`)           |
| **Total Booking Value**   | Sum of `fare_amount + surge_fee`                |
| **Average Booking Value** | Mean of booking value per ride                  |
| **Total Trip Distance**   | Sum of `trip_distance`                          |
| **Average Trip Distance** | Mean of `trip_distance`                         |
| **Average Trip Duration** | Calculated using pickup and drop-off timestamps |

## 📈 Dashboards & Python Visuals

### 📊 Power BI Dashboards:
- **Dashboard 1: Overview**  
  ▸ KPIs, fare value, distance, vehicle filters
  <img width="1152" height="758" alt="image" src="https://github.com/user-attachments/assets/7d1fa15b-1a83-45ea-ada0-b805a9c5e459" />

- **Dashboard 2: Time Analysis**  
  ▸ Hourly trends, 10-minute intervals, weekday demand
  <img width="1087" height="666" alt="image" src="https://github.com/user-attachments/assets/4ba34252-b3ec-42a8-9f06-6366144e14ce" />
 
- **Dashboard 3: Location Analysis**  
  ▸ Top pickup/drop-off locations, farthest trip, vehicle preference by city
  <img width="1204" height="731" alt="image" src="https://github.com/user-attachments/assets/8482a209-d0e6-4a56-9ad5-30bcfe27db2e" />


### 🐍 Python Visuals:
- Top 5 Pickup & Drop-off Locations → `barh()` with annotations  
- Most Preferred City per Vehicle → `groupby` with merged location data  
- Average Trip Duration in Minutes  
- Custom styling: axis turned off, clean labels, inverted bar order for clarity

---

## 🔍 Insights Discovered

- 🔹 Most rides occur in the evening hours, with demand peaking post 6 PM  
- 🔹 Wallet and card are dominant payment modes across all cities  
- 🔹 Top 5 pickup/drop-off locations show consistent demand in high-density zones  
- 🔹 Premium vehicles are highly preferred in cities like Bangalore and Delhi  
- 🔹 Farthest trips are mostly intercity, revealing long-distance travel use cases  
- 🔹 Weekends have higher booking volumes, especially Saturday nights

---

## ✅ Recommendations

- Dynamic pricing should be focused on evenings and weekends to capture high-value demand  
- Driver allocation can be improved by real-time monitoring of top pickup locations  
- Premium vehicle availability should be increased in metros with high demand  
- Cashless payments are preferred; Uber could consider phasing out cash options in key cities  
- Introduce route-based marketing offers based on most frequent trip zones.

