This project uses the Indian Census 2011 dataset to extract various Indian population facts and numbers.

This was supposed to be a guided project but then I decided to _Do it Myself_ and took too much time searching for perfection

First of all I downloaded both the datasets from the description of the video I was following and then opened them in Excel.

Both were in *Excel* format(xlsx) and had more than one sheet already so I deleted the other sheets and then cleaned them as follows:

`*` It occured to me that we should always check for the spreadsheet whether it contains null values/ empty cells or not and also if it had any duplicate values or mismatched datatypes in it i.e. string value in integer type column :

`*` For that I selected the whole range and used the "Remove Duplicates" function in the Data tab >> Data Tools 

`*`Number of rows for the first dataset went down by 7 and now there were only 635 and for the second dataset also there are 635 rows

`*` Then I figured datatypes of the columns for first dataset after importing will respectively be:
>District : Varchar(50)

>State : Varchar(50)

>Growth : float

>Sex_Ratio : float

>Literacy : float

`**` Finally Exported it as **_CSV_** (comma delimited) file

`*`For the second dataset after the cleaning process decided to keep the datatypes as follows:
>District : Varchar(50)

>State : Varchar(50)

>Area_Km2 : int

>Population : int

I'd have used bigint datatype however the total area of the country is only  3,287,263 square kilometers and its total population is only 1.21 B according to 2011 census

We know int datatype can store upto roughly 2.1 B so for now its more than enough.
<br/><br/>
PostgreSQL:->
>Created a Database named : **Portfolio**

>Then I created a table named **ProjectD1** with appropriate column names and datatypes with constraint set as Not Null and since the duplicates were removed I made the 'District' Column as 'Primary Key'

>Named the second table as **ProjectD2** and performed same steps and made the 'District' Column as 'Primary Key' 

<br/>

Performed various SQL operations on both the table, these operations demonstrate my ability to use SQL

I covered the following topics:->

>Create Table

>AGGREGATE Functions

>SELECT, DISTINCT, WHERE, LIKE clauses

>Aliases

>Group By, Order By, LIMIT, OFFSET, Lower

>AND, OR, IN Operators

>Subqueries, Complex queries

> Joins 

<br/>

Note:
**If the subquery is the last statement in a batch of statements, you will need to include a semicolon at the end of the subquery to indicate the end of the statement.**

Took sometime to figure this out!

