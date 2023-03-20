name | continent
Afghanistan | Asia
Albania | Europe
Algeria | Africa
Andorra | Europe
Angola | Africa
....

1. Find the country that start with Y
```sql
SELECT name FROM world
  WHERE name LIKE 'Y%'
```

2. Find the countries that end with y
```sql
SELECT name FROM world
  WHERE name LIKE '%y'
```

3. Find the countries that contain the letter x
```sql
SELECT name FROM world
  WHERE name LIKE '%x%'
```

4. Find the countries that end with land
```sql
SELECT name FROM world
  WHERE name LIKE '%land'
```

5. Find the countries that start with C and end with ia
```sql
SELECT name FROM world
  WHERE name LIKE 'C%ia'
```
