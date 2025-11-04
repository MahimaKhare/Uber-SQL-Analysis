-- 1.Retrieve all successful bookings: 
Create View Successful_booking as 
Select * From Uber 
Where Booking_Status = 'Success'; 
-- 2.Find the average ride distance for each vehicle type: 
Create View Each_Vehicles_Ride_Distance as 
Select vehicle_type, Avg(trip_distance) 
as avg_distance from Uber 
Group By vehicle_type; 
-- 3.Get the total number of cancelled rides by customers: 
Create view Cancelled_ride_by_customers as 
Select Count(*) From Uber 
Where Booking_Status = 'Cancelled by Customer'; 
-- 4. List the top 5 customers who booked the highest number of rides: 
Create view top_5_customers as 
Select Customer_id, Count(Booking_id) as Total_rides 
From Uber 
Group BY Customer_id 
Order BY Total_rides Desc Limit 5; 
-- 5. Get the number of rides canceled by drivers due to personal and car-related 
issues: 
Create view Ride_cancelled_by_driver_P_C_Issues as 
Select Count(*) From Uber 
Where Cancel_reason = 'Personal & Car related issue'; 
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
Create view Max_Min_driver_rating as 
Select Max(Driver_Rating) as Max_rating, 
Min(Driver_Rating) as Min_rating 
From Uber Where Vehicle_type = 'Prime Sedan'; 
-- 7. Retrive all rides where payment was made using UPI: 
Create View UPI_payment as 
Select * From Uber 
Where Payment_method = 'UPI'; 
-- 8. Find the average customer rating per vehicle type: 
Create View Avg_Customer_Rating as 
Select Vehicle_Type, AVG(Customer_rating) as Avg_customer_rating 
From Uber 
Group BY Vehicle_Type; 
-- 9. Calculate the total booking value of rides completed successfully: 
Create View Total_successful_ride_value as 
Select Sum(Booking_Value) as Total_successful_value 
From Uber 
Where Booking_status = 'Success'; 
-- 10. List all incomplete rides along with the reason:    
Create View Incomplete_Ride_Reason as 
Select Booking_ID, Incomplete_ride_reason 
From Uber  Where Incomplete_ride = 'Yes';