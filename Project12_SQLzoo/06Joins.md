![Database Schema](https://sqlzoo.net/w/images/c/ce/FootballERD.png)

--- 

### game

| id   | mdate        | stadium                   | team1 | teams |
|------|--------------|---------------------------|-------|-------|
| 1001 | 8 June 2012	| National Stadium, Warsaw  |	POL   | GRE   |
| 1002 | 8 June 2012	| Stadion Miejski (Wroclaw) | RUS   | CZE   |
| 1003 | 12 June 2012 | Stadion Miejski (Wroclaw) | GRE   | CZE   |
| 1004 | 12 June 2012 | National Stadium, Warsaw  | POL   | RUS   |
|...                                                              |


### goal 

| id   | team1 | player                | gtime |
|------|-------|-----------------------|-------|
| 1001 | POL   | Robert Lewandowski    | 17    |
| 1002 | GRE   | Dimitris Salpingidis  | 51    |
| 1003 | RUS   | Alan Dzagoev          | 15    |
| 1004 | RUS   | Roman Pavlyuchenko    | 82    |
|...                                           |


### eteam

| id  | teamname       | coache           |
|-----|----------------|------------------|
| POL | Poland         | Franciszek Smuda |
| RUS | Russia         | Dick Advocaat    |
| CZE | Czech Republic | Michal Bilek     |
| GRE | Greece         | Fernando Santos  |
|...                                      |

---

1. Write a query to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
```sql
SELECT matchid, player name
FROM goal
WHERE teamid = 'GER'
```

2. Show id, stadium, team1, team2 for just game 1012
```sql
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;
```

3. Show the player, teamid, stadium and mdate for every German goal.
```sql
SELECT player, teamid, stadium, mdate
FROM game
JOIN goal ON (id=matchid)
WHERE teamid = 'GER';
```

4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
```sql
SELECT team1, team2, player
FROM game
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'
```

5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
```sql

```

6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
```sql

```

7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
```sql

```

8. Show the name of all players who scored a goal against Germany.
```sql

```

9. Show teamname and the total number of goals scored.
```sql

```

10. Show the stadium and the number of goals scored in each stadium.
```sql

```

11. For every match involving 'POL', show the matchid, date and the number of goals scored.
```sql

```

12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
```sql

```

13. List every match with the goals scored by each team as shown. Sort your result by mdate, matchid, team1 and team2.
```sql

```
