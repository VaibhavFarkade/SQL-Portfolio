> Query Structure
```sql
SELECT column1, column2
FROM table
WHERE condition
GROUP BY column1
HAVING condition
ORDER BY column2;
LIMIT 10;
```
> Order of Execution
```sql
FROM [MyTable]
    ON [MyCondition]
  JOIN [MyJoinedTable]
 WHERE [...]
 GROUP BY [...]
HAVING [...]
SELECT [...]
 DISTINCT 
 ORDER BY [...]
LIMIT
```

Complex AllMighty Query:->
```sql
SELECT DISTINCT column1, column2
FROM table1
INNER JOIN table2 ON table1.id = table2.id
WHERE column3 LIKE '%example%'
  AND column4 > 100
  OR (column5 = 'value1' AND column6 IS NOT NULL)
GROUP BY column1
HAVING COUNT(column2) > 5
ORDER BY column1 ASC, column4 DESC
LIMIT 10;
```

---

> String Manipulation:

1. SUBSTRING_INDEX(str, delimiter, count)

```sql
Example:
SUBSTRING_INDEX('Hello World', ' ', 1);
Returns: 'Hello'
```

2. SUBSTRING(str, start, length)
```sql
Example:
SUBSTRING('Hello World', 7, 5);
Returns 'World'
```

3. SUBSTR(str, start, length)
```sql
Example:
SUBSTR('Hello World', 7, 5);
Returns 'World'
```
---

### Random peaks of interest

1. Derived Table
On the fly!
```sql
SELECT column1, column2, ...
FROM (
    SELECT number AS column1, 'A' AS column2
    FROM (
        SELECT 435.345 AS number UNION ALL
        SELECT 3453.43 UNION ALL
        SELECT 3453.4
    ) AS subquery1
    UNION
    SELECT number AS column1, 'B' AS column2
    FROM (
        SELECT 345 AS number UNION ALL
        SELECT 4354 UNION ALL
        SELECT 436
    ) AS subquery2
) AS main_query;
```
