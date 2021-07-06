Select  *
from BikersProject..bike_buyers_cleaned

--Updating the Regions to replace them by countries
Update BikersProject..bike_buyers_cleaned
SET Region='Spain'
where Region='Europe'

Update BikersProject..bike_buyers_cleaned
SET Region='Italy'
where Region='Pacific'

Update BikersProject..bike_buyers_cleaned
SET Region='France'
where Region='North America'

---Toatl bike buyers
Select Count(*) as bike_buyers
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'

--Classifiaction Based on Mariage Status
Select ID,Marital_Status,Gender,Purchased_Bike
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'

Select Marital_Status,Count(*) as bike_buyers_count
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
group by Marital_Status

--People who own both cars and bikes
Select Count(ID) as car_bike_count
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
and Cars>0

--Bikes own by each Occupation Category
Select Occupation,Count(ID) as bike_count_per_occupation
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
group by Occupation
order by 2 desc

--Bike_count of each region
Select Region,Count(ID) as bike_count_per_region
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
group by Region

--Bike_count of each region based upon gender
Select Region,Gender,Count(ID) as Bikers_Count
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
group by Region,Gender

--Bike_count by Each Income
Select Income,Count(Purchased_Bike) as Bike_Count_Income
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
Group by Income
order by Bike_Count_Income

--Top 5 Income groups with highest bike count
Select TOP 5 Income,Count(Purchased_Bike) as Bike_Count_Income
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
Group by Income
order by Bike_Count_Income desc

--Bike owners in each Commute Distance category
Select Commute_Distance,Count(ID) as Bike_buyers_count
from
BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
group by Commute_Distance
order by Bike_buyers_count desc

--Comparison between age groups
select count(*) as Biker_buyers_below40,(select count(*) from BikersProject..bike_buyers_cleaned where age>40 and Purchased_Bike='Yes') 
as Bike_buyer_above40
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
and Age<=40
--People above age 40 buy more bikes as compared to people below age of 40

--People who have House,car and bikes
Select Count(*) as Total_count
from BikersProject..bike_buyers_cleaned
where Purchased_Bike='Yes'
and Cars>0
and Home_Owner='Yes'

