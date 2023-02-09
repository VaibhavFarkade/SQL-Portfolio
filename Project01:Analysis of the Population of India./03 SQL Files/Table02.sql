--Create Table with appropriate column name and datatype and then import the cleaned csv file						   
CREATE TABLE ProjectD2( District varchar(50) NOT NULL PRIMARY KEY, 
                        State varchar(50) NOT NULL, 
                        Area_Km2 float NOT NULL, 
                        Population int NOT NULL);

-----------------------------------------------------------------------------------

--Display data in the tables:->
SELECT * FROM ProjectD2;

--Number of rows in our tables:->
SELECT COUNT(*) FROM ProjectD2;

--Display all States:->
SELECT DISTINCT State FROM ProjectD2
ORDER BY State;

--Display total Number of States
SELECT COUNT(DISTINCT State)
AS Total_States
FROM ProjectD2;

------------------------------------------------------------------------------------

-- Exploring Area:->

-- Top 3 Districts with largest Area in all of India
SELECT District, Area_Km2
FROM ProjectD2
ORDER BY Area_Km2 DESC -- ASC for top 3 Districts with smallest area
LIMIT 3;

-- State having largest Area 
SELECT State, SUM(Area_Km2)
FROM ProjectD2
GROUP BY State
ORDER BY SUM(Area_Km2) DESC -- ASC for smallest area
LIMIT 1;

-- Average area of District in each state
SELECT State, SUM(Area_Km2)/COUNT(District) 
AS Average_Area_Per_District
FROM ProjectD2
GROUP BY State
ORDER BY Average_Area_Per_District;

-- We can use the limit clause to find many insights such as : State with Largest/Smallest Average_Area_Per_District , etc

-- Average Area of Districts within Maharashtra
SELECT State, AVG(Area_Km2) as Average_Area --Can directly use the AVG function istead of the above division
FROM ProjectD2
WHERE State = 'Maharashtra'
GROUP BY State;

-- Total Area of each State, in ascending order of area
SELECT State, SUM(Area_Km2)
FROM ProjectD2
GROUP BY State 
ORDER BY State ASC;

-- Total Area of the Country
SELECT SUM(Area_Km2)
AS Area_of_India
FROM ProjectD2;

-- We get : 3122853 KM^2 vs 3.287 M KM^2

-- Districts having area larger than 9999 square kilometer
SELECT District, State, Area_Km2
FROM ProjectD2
WHERE Area_Km2 > 9999;

-- State having maximum districts with area larger than 9999 square kilometer
SELECT State, COUNT(District)
FROM ProjectD2
WHERE Area_Km2 > 9999
GROUP BY State
ORDER BY COUNT(District) DESC
LIMIT 2;

-- Difference in area between the first and second largest state
SELECT Area_Km2 - (SELECT Area_Km2 FROM ProjectD2
                   ORDER BY Area_Km2 DESC
                   LIMIT 1 OFFSET 1)
FROM ProjectD2
ORDER BY Area_Km2 DESC
LIMIT 1;


------------------------------------------------------------------------------------


-- Exploring Population:->

-- Top 3 Districts with largest Population in all of India
SELECT District, Population
FROM ProjectD2
ORDER BY Population DESC -- ASC for top 3 Districts with smallest population
LIMIT 3;

-- State having largest Population
SELECT State, SUM(Population)
FROM ProjectD2
GROUP BY State
ORDER BY SUM(Population) DESC -- ASC for smallest population
LIMIT 1;

-- Average population of District in each state
SELECT State, SUM(Population)/COUNT(District)
AS Average_Population_Per_District
FROM ProjectD2
GROUP BY State
ORDER BY Average_Population_Per_District;

-- Average Population of Districts within Maharashtra
SELECT State, AVG(Population) as Average_Population --Can directly use the AVG function istead of the above division
FROM ProjectD2
WHERE State = 'Maharashtra'
GROUP BY State;

-- Population of Maharashtra
SELECT District, Population
FROM ProjectD2
WHERE State='Maharashtra'
ORDER BY Population ASC;

-- Total Population of each State, in ascending order of population
SELECT State, SUM(Population)
FROM ProjectD2
GROUP BY State
ORDER BY SUM(Population) ASC;

-- Total Population of the Country
SELECT SUM(Population)
AS Population_of_India
FROM ProjectD2;

-- Districts having population larger than 50,00,000 people
SELECT District, State, Population
FROM ProjectD2
WHERE Population > 5000000;

-- State having maximum districts with population larger than 50,00,000 people
SELECT State, COUNT(District)
FROM ProjectD2
WHERE Population > 5000000
GROUP BY State
ORDER BY COUNT(District) DESC
LIMIT 2;

-- Difference in population between the first and second largest state
SELECT Population - (SELECT Population FROM ProjectD2
ORDER BY Population DESC
LIMIT 1 OFFSET 1)
FROM ProjectD2
ORDER BY Population DESC
LIMIT 1;

-- Population per Sqaure kilometer in all states, by ascending order:
SELECT State, SUM(Population)/SUM(Area_Km2) AS Population_Per_Square_Kilometer
FROM ProjectD2
GROUP BY State
ORDER BY Population_Per_Square_Kilometer ASC; --Chandigarh is a union territory