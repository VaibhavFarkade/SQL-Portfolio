
| name        | continent | area     | population | gdp          |
|-------------|-----------|----------|------------|--------------|
| Afghanistan |	Asia      | 652230   |	25500100  | 20343000000  |
| Albania     | Europe    | 28748    | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741  | 37100000   | 188681000000 |
| Andorra     | Europe    | 468      | 78115      | 3712000000   |
| Angola      | Africa    | 1246700  | 20609294   | 100990000000 |
|...                                                             |

---
> world(name, continent, area, population, gdp)

> ALL keyword compares a value with all values in a subquery result set 

1. List each country name where the population is larger than that of 'Russia'.
```sql
SELECT name FROM world
WHERE population > (
    SELECT population FROM world
    WHERE name='Russia');
```

2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
```sql
SELECT name FROM world
WHERE gdp/population> (
    SELECT gdp/population FROM world
    WHERE name='United Kingdom')
AND continent='Europe';
```

3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
```sql
SELECT name, continent
FROM world
WHERE continent IN (
    SELECT continent FROM world
    WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;
```

4. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
```sql
SELECT name, population FROM world
WHERE population >(
    SELECT population FROM world
    WHERE name='United Kingdom')
AND population < (
    SELECT population FROM world
    WHERE name='Germany');
```

5. Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
The format should be Name, Percentage for example:
```sql
SELECT name, CONCAT(CAST(ROUND(population/(
    SELECT population FROM world
    WHERE name='Germany'),0) AS INT), '%')
FROM world
WHRE continent='Europe';
```

6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
```sql
SELECT name FROM world
WHERE gdp > (
    SELECT MAX(gdp) FROM world
    WHERE continent='Europe')
AND continent <> 'Europe';
```

7. Find the largest country (by area) in each continent, show the continent, the name and the area:
```sql
SELECT continent, name, area
FROM world w 
WHERE area=(
    SELECT MAX(area) 
    FROM world
    WHERE continent=w.continent);
```

8. List each continent and the name of the country that comes first alphabetically.
```sql
SELECT continent, name
FROM world w
WHERE name IN (
    SELECT TOP 1 name
    FROM world
    WHERE continent = w.continent
    ORDER BY continent, name
);

```

9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
```sql
SELECT name, continent, population
FROM world
WHERE continent IN (
    SELECT continent 
    FROM world x
    WHERE 25000000 > ALL(
    SELECT population 
    FROM world y 
    WHERE x.continent=y.continent));

-- OR

SELECT name, continent, population
FROM world x
WHERE NOT EXISTS (
    SELECT 1
    FROM world y
    WHERE y.continent = x.continent
    AND y.population >= 25000000
);
```

10. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
```sql
SELECT name, continent FROM world x
WHERE population > ALL(
    SELECT population*3 
    FROM world y
    WHERE y.continent=x.continent 
    AND x.name <> y.name);
```
--
