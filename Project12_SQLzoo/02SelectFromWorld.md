
| name        | continent | area     | population | gdp          |
|-------------|-----------|----------|------------|--------------|
| Afghanistan |	Asia      | 652230   |	25500100  | 20343000000  |
| Albania    	| Europe    | 28748    | 2831741    | 12960000000  |
| Algeria	    | Africa    | 2381741  | 37100000   | 188681000000 |
| Andorra	    | Europe    | 468      | 78115      | 3712000000   |
| Angola	    | Africa    | 1246700  | 20609294   | 100990000000 |



1. Observe the result of running this SQL command to show the name, continent and population of all countries.
```sql
SELECT name, continent, population FROM world;
```

2. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
```sql
SELECT name FROM world
WHERE population >= 200000000;
```

3. Give the name and the per capita GDP for those countries with a population of at least 200 million.<br>
HELP: Per capita GDP is the GDP divided by the population, i.e. GDP/population
```sql
SELECT name, gdp/population FROM world
WHERE population >= 200000000;
```


