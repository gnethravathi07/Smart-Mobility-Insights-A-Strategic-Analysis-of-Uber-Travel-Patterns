CREATE DATABASE Uber_Analysis;
USE Uber_Analysis;

-- Location Table
CREATE TABLE locations (
    LocationID INT PRIMARY KEY,
    Location VARCHAR(100),
    City VARCHAR(100)
);


-- Uber Trip Details Table
CREATE TABLE trips (
    trip_id INT AUTO_INCREMENT PRIMARY KEY,
    pickup_time DATETIME,
    dropoff_time DATETIME,
    passenger_count INT,
    trip_distance DECIMAL(10,2),
    PULocationID INT,
    DOLocationID INT,
    fare_amount DECIMAL(10,2),
    surge_fee DECIMAL(10,2),
    vehicle VARCHAR(50),
    payment_type VARCHAR(50),
    FOREIGN KEY (PULocationID) REFERENCES locations(LocationID),
    FOREIGN KEY (DOLocationID) REFERENCES locations(LocationID)
);

LOAD DATA LOCAL INFILE "C:\Users\DELL'\Music\Uber\Uber Trip Details.csv"
INTO TABLE your_table
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


SELECT * FROM Locations;

select * from trips;

#  KPIs

-- 1.Total Bookings
SELECT COUNT(Trip_id) AS Total_Bookings
FROM trips;

-- 2. Total Booking Value

SELECT SUM(fare_amount + Surge_Fee) AS Total_Booking_Value FROM trips;

-- 3. Average Booking Value

SELECT ROUND(AVG(fare_amount + Surge_Fee), 2) AS Average_Booking_Value FROM trips;

-- 4. Total Trip Distance

SELECT SUM(trip_distance) AS Total_Trip_Distance FROM trips;

-- 5. Average Trip Distance

SELECT ROUND(AVG(trip_distance), 2) AS Average_Trip_Distance FROM trips;

-- 6. Average Trip Time

SELECT ROUND(AVG(TIMESTAMPDIFF(MINUTE, Pickup_Time, DropOff_time)), 2) AS Average_Trip_Duration_Minutes FROM trips;

-- 7. Bookings by Vehicle Type

SELECT Vehicle, COUNT(*) AS Total_Bookings FROM trips
 GROUP BY Vehicle ORDER BY Total_Bookings DESC;

-- 8.Return all metrics per vehicle

SELECT 
  Vehicle,
  COUNT(*) AS Total_Bookings,
  SUM(fare_amount + Surge_Fee) AS Total_Booking_Value,
  SUM(trip_distance) AS Total_Trip_Distance
FROM trips
GROUP BY Vehicle;

-- 9.Total Bookings by Payment Type 

SELECT 
  Payment_type,
  COUNT(*) AS Total_Bookings
FROM trips
GROUP BY Payment_type;

-- 10.Total Booking Value by Payment Type

SELECT 
  Payment_type,
  SUM(fare_amount + Surge_Fee) AS Total_Booking_Value
FROM trips
GROUP BY Payment_type;

-- 11.Total Trip Distance by Payment Type

SELECT 
  Payment_type,
  SUM(trip_distance) AS Total_Trip_Distance
FROM trips
GROUP BY Payment_type;

-- Combine All in One

SELECT 
  Payment_type,
  COUNT(*) AS Total_Bookings,
  SUM(fare_amount + Surge_Fee) AS Total_Booking_Value,
  SUM(trip_distance) AS Total_Trip_Distance
FROM trips
GROUP BY Payment_type;


-- 12.Bookings by Day/Night

SELECT 
  CASE WHEN HOUR(Pickup_Time) BETWEEN 6 AND 17 THEN 'Day' ELSE 'Night' END AS Trip_Type,
  COUNT(*) AS Total_Bookings
FROM trips
GROUP BY Trip_Type;

-- 13.Combined Day/Night Summary

SELECT 
  CASE 
    WHEN HOUR(Pickup_Time) BETWEEN 6 AND 17 THEN 'Day'
    ELSE 'Night'
  END AS Trip_Type,
  COUNT(*) AS Total_Bookings,
  SUM(fare_amount + Surge_Fee) AS Total_Booking_Value,
  ROUND(AVG(fare_amount + Surge_Fee), 2) AS Average_Booking_Value,
  SUM(trip_distance) AS Total_Trip_Distance
FROM trips
GROUP BY Trip_Type
ORDER BY Trip_Type;

-- 14. Bookings by Day

SELECT 
    DATE(Pickup_Time) AS Trip_Date,
    COUNT(*) AS Total_Bookings
FROM trips
GROUP BY Trip_Date
ORDER BY Trip_Date;

-- 15. Top 5 Pickup Locations 

SELECT 
    l.Location AS Pickup_Location,
    COUNT(*) AS Total_Bookings
FROM trips t
JOIN locations l ON t.PULocationID = l.LocationID
GROUP BY l.Location
ORDER BY Total_Bookings DESC
LIMIT 5;

-- 16.Most Frequent Drop-off Point

SELECT 
    l.Location AS Dropoff_Location,
    COUNT(*) AS Total_Trips
FROM trips t
JOIN locations l ON t.DOLocationID = l.LocationID
GROUP BY l.Location
ORDER BY Total_Trips DESC
LIMIT 1;

-- 17. Farthest Trip 

SELECT 
  t.Trip_ID,
  t.Pickup_Time,
  t.Dropoff_Time,
  t.trip_distance,
  t.Vehicle,
  t.Payment_type,
  t.passenger_count,
  t.fare_amount,
  t.Surge_Fee,
  l1.Location AS Pickup_Location,
  l2.Location AS Dropoff_Location,
  l1.City AS Pickup_City,
  l2.City AS Dropoff_City
FROM trips t
LEFT JOIN locations l1 ON t.PULocationID = l1.LocationID
LEFT JOIN locations l2 ON t.DOLocationID = l2.LocationID
ORDER BY t.trip_distance DESC
LIMIT 1;

-- 18.Bookings by 10-Minute Intervals

SELECT 
    DATE_FORMAT(Pickup_Time, '%H:%i') AS Time_Interval,
    COUNT(*) AS Total_Bookings
FROM (
    SELECT 
        FROM_UNIXTIME(FLOOR(UNIX_TIMESTAMP(Pickup_Time) / 600) * 600) AS Pickup_Time
    FROM trips
) AS rounded
GROUP BY Time_Interval
ORDER BY Time_Interval;

-- 19  Bookings by Weekday Name

SELECT 
    DAYNAME(Pickup_Time) AS Day_Name,
    COUNT(*) AS Total_Bookings
FROM trips
GROUP BY Day_Name
ORDER BY FIELD(Day_Name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- Bookings by Hour & Weekday
SELECT    
  HOUR(Pickup_Time) AS Hour,
  DAYNAME(Pickup_Time) AS Day,
  COUNT(*) AS Total_Bookings
FROM trips
GROUP BY Hour, Day
ORDER BY 
  Hour,
  FIELD(Day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

