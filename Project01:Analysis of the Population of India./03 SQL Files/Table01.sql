--Create Table with appropriate column name and datatype and then import the cleaned csv file
CREATE TABLE ProjectD1( District varchar(50) NOT NULL PRIMARY KEY, 
                        State varchar(50) NOT NULL, 
                        Growth float NOT NULL, 
                        Sex_Ratio float NOT NULL, 
                        Literacy float NOT NULL);
						   

-----------------------------------------------------------------------------------

--Display data in the tables:->
SELECT * FROM ProjectD1;

--Number of rows in our tables:->
SELECT COUNT(*) FROM ProjectD1;

--Display all States:->
SELECT DISTINCT State FROM ProjectD1
ORDER BY State;

--Display total Number of States
SELECT COUNT(DISTINCT State)
AS Total_States
FROM ProjectD1;

------------------------------------------------------------------------------------

-- Exploring Districts:->

--Total number of Districts in India
SELECT COUNT(District) AS Total_Districts
FROM ProjectD1;

--Total number of States in India
SELECT COUNT(DISTINCT State) AS Total_States
FROM ProjectD1;

--Display State and number of Districts it has in Ascending order
SELECT State, COUNT(District) AS Total_Districts 
FROM ProjectD1
GROUP BY State
ORDER BY COUNT(District);

--Display State with maximum number of Districts
SELECT State, COUNT(District) AS Total_Districts
FROM ProjectD1
GROUP BY State
HAVING COUNT(District) = (
    SELECT COUNT(District) FROM ProjectD1
    GROUP BY State
    ORDER BY COUNT(District) DESC
    LIMIT 1
);

--Display State with minimum number of Districts, multiple if they have same number of states
SELECT State, COUNT(District) AS Total_Districts
FROM ProjectD1
GROUP BY State
HAVING COUNT(District) = (
    SELECT COUNT(District) FROM ProjectD1
    GROUP BY State
    ORDER BY COUNT(District) ASC 
    LIMIT 1
);

--Find average number districts per state 
SELECT COUNT(District) / COUNT(DISTINCT State) 
AS Avg_District 
FROM ProjectD1;

--Display all Districts that start with the letter 'j' and end with letter 'r'
SELECT District FROM ProjectD1
WHERE LOWER(District) LIKE 'j%'
AND LOWER(District) LIKE '%r';

--Display all Districts that start with the letter 'n' or end with letter 'b'
SELECT District FROM ProjectD1
WHERE LOWER(District) LIKE 'n%'
OR LOWER(District) LIKE '%b';

--Display State with number of District that start with the letter 'n'
SELECT State, Count(District)
FROM ProjectD1
WHERE LOWER(District) LIKE 'n%'
GROUP BY State;

------------------------------------------------------------------------------------

--Exploring Literacy Rate:->

--Display Districts and their Literacy Rate from Maharashtra and Assam District
SELECT District, Literacy from ProjectD1
WHERE state in ('Maharashtra', 'Assam');

--Display District with maximum Literacy Rate
SELECT District, Literacy from ProjectD1
WHERE Literacy = (SELECT MAX(Literacy) FROM ProjectD1);

----Display District with minimum Literacy Rate
SELECT District, Literacy from ProjectD1
WHERE Literacy = (SELECT MIN(Literacy) FROM ProjectD1);

--Display average Literacy Rate of India
SELECT AVG(Literacy) AS Avg_Lit_India FROM ProjectD1;

--Find average Literacy Rate per State
SELECT State, AVG(Literacy) AS Avg_Literacy
FROM ProjectD1
GROUP BY State
ORDER BY Avg_Literacy;

--Find Top 5 States maximum Literacy Rate 
SELECT State, AVG(Literacy) AS Avg_Literacy
FROM ProjectD1
GROUP BY State
ORDER BY Avg_Literacy DESC
LIMIT 5;

--Find Bottom 5 States minimum Literacy Rate 
SELECT State, AVG(Literacy) AS Avg_Literacy
FROM ProjectD1
GROUP BY State
ORDER BY Avg_Literacy
LIMIT 5;

--Display Top 25 Districts, State with Maximum literacy rate in Ascending order of Literacy rate
SELECT District, State, Literacy 
FROM ProjectD1
WHERE Literacy IN (
    SELECT LiteracY FROM ProjectD1
    ORDER BY Literacy DESC
    LIMIT 25
)
ORDER BY Literacy;

------------------------------------------------------------------------------------

--Exploring Growth Rate:->

--Display District with maximum Growth Rate
SELECT District, Growth from ProjectD1
WHERE Growth = (SELECT MAX(Growth) FROM ProjectD1);

----Display District with minimum Growth Rate
SELECT District, Growth from ProjectD1
WHERE Growth = (SELECT MIN(Growth) FROM ProjectD1);

--Display Growth Rate of India
SELECT AVG(Growth) AS Grow_India FROM ProjectD1;

--Find average Growth Rate per State
SELECT State, AVG(Growth) AS Avg_Growth
FROM ProjectD1
GROUP BY State
ORDER BY Avg_Growth;

--Find Top 5 States maximum Growth Rate 
SELECT State, AVG(Growth) AS Avg_Growth
FROM ProjectD1
GROUP BY State
ORDER BY Avg_Growth DESC
LIMIT 5;

--Find Bottom 5 States minimum Growth Rate 
SELECT State, AVG(Growth) AS Avg_Growth
FROM ProjectD1
GROUP BY State
ORDER BY Avg_Growth
LIMIT 5;

--Display Top 25 Districts, State with Maximum Growth rate in Ascending order of Growth rate
SELECT District, State, Growth 
FROM ProjectD1
WHERE Growth IN (
    SELECT Growth FROM ProjectD1
    ORDER BY Growth DESC
    LIMIT 25
)
ORDER BY Growth;

--Return third highest State in terms of growth
SELECT State FROM ProjectD1
GROUP BY State
ORDER BY AVG(Growth) DESC
LIMIT 1 OFFSET 2;

------------------------------------------------------------------------------------

--Exploring Sex Ratio:->

--Display District with maximum Sex_Ratio
SELECT District, Sex_Ratio from ProjectD1
WHERE Sex_Ratio = (SELECT MAX(Sex_Ratio) FROM ProjectD1);

----Display District with minimum Sex_Ratio
SELECT District, Sex_Ratio from ProjectD1
WHERE Sex_Ratio = (SELECT MIN(Sex_Ratio) FROM ProjectD1);

--Count of Districts having SR greater than equal to 1000
SELECT COUNT(District) AS Dis_SR_High
FROM ProjectD1
WHERE Sex_Ratio>=1000;

--Count of Districts having SR less than 1000
SELECT COUNT(District) AS Dis_SR_Low
FROM ProjectD1
WHERE Sex_Ratio<1000;

--Display Sex_Ratio of India
SELECT AVG(Sex_Ratio) AS India_SR FROM ProjectD1;

--Find average Sex_Ratio per State
SELECT State, AVG(Sex_Ratio) AS Avg_Sex_Ratio
FROM ProjectD1
GROUP BY State
ORDER BY Avg_Sex_Ratio;

--Find Top 5 States maximum Sex_Ratio 
SELECT State, AVG(Sex_Ratio) AS Avg_Sex_Ratio
FROM ProjectD1
GROUP BY State
ORDER BY Avg_Sex_Ratio DESC
LIMIT 5;

--Find Bottom 5 States minimum Sex_Ratio 
SELECT State, AVG(Sex_Ratio) AS Avg_Sex_Ratio
FROM ProjectD1
GROUP BY State
ORDER BY Avg_Sex_Ratio
LIMIT 5;

--Display all Districts, State having Sex_Ratio greater than equal to 1000 in Ascending order of Sex_Ratio rate
SELECT District, State, Sex_Ratio 
FROM ProjectD1
WHERE Sex_Ratio IN (
    SELECT Sex_Ratio FROM ProjectD1
    WHERE Sex_Ratio>=1000
    ORDER BY Sex_Ratio DESC
)
ORDER BY Sex_Ratio;

--Find State having maximum district with SR greater than 1000
SELECT State, COUNT(District) 
FROM ProjectD1
WHERE Sex_Ratio IN (
    SELECT Sex_Ratio FROM ProjectD1
    WHERE Sex_Ratio>=1000
    ORDER BY Sex_Ratio DESC
)
GROUP BY State
ORDER BY COUNT(District)  DESC
LIMIT 1;

--Find State not having SR greater than 1000
SELECT State, COUNT(District) 
FROM ProjectD1
WHERE Sex_Ratio IN (
    SELECT Sex_Ratio FROM ProjectD1
    WHERE Sex_Ratio>=1000
    ORDER BY Sex_Ratio DESC
)
GROUP BY State
ORDER BY COUNT(District)
LIMIT 1;

--Return third highest State in terms of Sex_Ratio
SELECT State FROM ProjectD1
GROUP BY State
ORDER BY AVG(Sex_Ratio) DESC
LIMIT 1 OFFSET 2;
