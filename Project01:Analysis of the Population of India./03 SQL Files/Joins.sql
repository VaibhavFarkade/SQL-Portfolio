-- Display all data from both tables showing district, state, growth, sex ratio, literacy rate, area and population
SELECT ProjectD1.District, ProjectD1.State, ProjectD1.Growth, ProjectD1.Sex_Ratio, ProjectD1.Literacy, ProjectD2.Area_Km2, ProjectD2.Population
FROM ProjectD1
JOIN ProjectD2 ON ProjectD1.District = ProjectD2.District;

-- Display District, State, Population, and Growth
SELECT ProjectD1.District, ProjectD1.State, ProjectD2.Population, ProjectD2.Area_Km2
FROM ProjectD1
JOIN ProjectD2 ON ProjectD1.District = ProjectD2.District
WHERE ProjectD1.Growth > 1;

-- Display State, Total_Population, Total_Area, and Average_Growth
SELECT ProjectD1.State, SUM(ProjectD2.Population) as Total_Population,
SUM(ProjectD2.Area_Km2) as Total_Area,
AVG(ProjectD1.Growth) as Average_Growth
FROM ProjectD1
JOIN ProjectD2 ON ProjectD1.District = ProjectD2.District
GROUP BY ProjectD1.State
ORDER BY Average_Growth DESC;

-- Get data from both tables showing district, state, population, area, and sex ratio for only the districts that have a literacy rate of more than 75%.
SELECT ProjectD1.District, ProjectD1.State, ProjectD2.Population, ProjectD2.Area_Km2, ProjectD1.Sex_Ratio
FROM ProjectD1
JOIN ProjectD2 ON ProjectD1.District = ProjectD2.District
WHERE ProjectD1.Literacy > 0.75;

-- Sum of population in high literacy areas (Literacy > 75) and low literacy areas (Literacy <= 75) for each state
SELECT ProjectD1.State,
    SUM(CASE WHEN Literacy > 75 THEN Population END) AS High_Literacy_Pop,
    SUM(CASE WHEN Literacy <= 75 THEN Population END) AS Low_Literacy_Pop
FROM ProjectD1
JOIN ProjectD2 ON ProjectD1.District = ProjectD2.District AND ProjectD1.State = ProjectD2.State
GROUP BY ProjectD1.State;

-- Population in 2011 and in 2021 Estimate
SELECT ProjectD1.State, SUM(ProjectD2.Population) AS Population2011,
SUM(ProjectD2.Population) * POWER(1+AVG(ProjectD1.Growth),10) AS Population2021
FROM ProjectD1
JOIN ProjectD2 ON ProjectD1.District = ProjectD2.District AND ProjectD1.State = ProjectD2.State
GROUP BY ProjectD1.State;

-- Population in 2011 vs Estimated 2021
SELECT SUM(ProjectD2.Population) AS India2011, 
SUM(ProjectD2.Population) * POWER(1+AVG(ProjectD1.Growth), 10) AS India2021
FROM ProjectD1
JOIN ProjectD2 ON ProjectD1.District = ProjectD2.District AND ProjectD1.State = ProjectD2.State;


-- Join both tables to get the average growth rate and average sex ratio of each state 
SELECT ProjectD1.State, AVG(ProjectD1.Growth) AS Avg_Growth,
AVG(ProjectD1.Sex_Ratio) AS Avg_Sex_Ratio
FROM ProjectD1
JOIN ProjectD2
ON ProjectD1.District = ProjectD2.District AND ProjectD1.State = ProjectD2.State
GROUP BY ProjectD1.State;

