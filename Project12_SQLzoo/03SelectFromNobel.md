
| yr   | subject   | area                         | 
|------|-----------|------------------------------|
| 1960 | Chemistry | Willard F. Libby             |
| 1960 | Literature| Saint-John Perse             |
| 1960 | Medicine  | Sir Frank Macfarlane Burnet  |
| 1960 | Medicine  | Peter Madawar                |
|...                                              |


Note: You cannot use IN with ORDER BY, see Q.14

----------------------------------------------------------------------------------------------------------------------------------------------------------
1. Change the query shown so that it displays Nobel prizes for 1950.
```sql
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;
```

2. Show who won the 1962 prize for literature.
```sql
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature';
```

3. Show the year and subject that won 'Albert Einstein' his prize.
```sql
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';
```

4. Give the name of the 'peace' winners since the year 2000, including 2000.
```sql
SELECT winner
FROM nobel
WHERE yr>1999
AND subject='peace';
```

5. Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
```sql
SELECT * FROM nobel
WHERE subject='literature'
AND yr BETWEEN 1980
AND 1989;
```

6. Show all details of the presidential winners:
```sql
SELECT * FROM nobel
WHERE winner IN 
('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');
```

7. Show the winners with first name John
```sql
SELECT winner FROM nobel
WHERE winner LIKE 'John%';
```

8. Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
```sql
SELECT yr, subject, winner 
FROM nobel
WHERE (subject = 'Physics'
AND yr = 1980)
OR
(subject = 'Chemistry'
AND yr = 1984);
```

9. Show the year, subject, and name of winners for 1980 excluding chemistry and medicine
```sql
SELECT yr, subject, winner 
FROM nobel
WHERE yr = 1980
AND subject NOT IN 
('Chemistry', 'Medicine');
```

10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910)
together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
```sql
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine'
AND yr < 1910)
OR
(subject = 'Literature'
AND yr > 2003);
```

11. Find all details of the prize won by PETER GRÜNBERG
Non-ASCII characters
```sql
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG';
```

12. Find all details of the prize won by EUGENE O'NEILL
Escaping single quotes
```sql
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

```

13. Knights in order
List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
```sql
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;
```

14.The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.
Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
```sql
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY CASE WHEN subject IN ('chemistry', 'physics') THEN 1 ELSE 0 END, subject, winner;
```