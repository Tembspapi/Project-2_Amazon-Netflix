DROP TABLE IF EXISTS amazon;
DROP TABLE IF EXISTS netflix;

CREATE TABLE Amazon(
	id serial NOT NULL primary key,
	show_id VARCHAR, 
	title VARCHAR, 
	director VARCHAR, 
	country VARCHAR, 
	release_year int, 
	rating VARCHAR,
	category VARCHAR
);

CREATE TABLE Netflix(
	id serial NOT NULL primary key,
	show_id VARCHAR, 
	title VARCHAR, 
	director VARCHAR, 
	country VARCHAR, 
	release_year int, 
	rating VARCHAR,
	category VARCHAR
);

-- show all (*) from each table
SELECT * FROM Amazon;
SELECT * FROM Netflix;

/*
show categories containing 'Drama'
*/
select * from amazon where category like 'Drama';
select * from netflix where category like '%Drama%';

-- show release year before 2017
select * from netflix where release_year < 2017;

-- show title 'Take Care Good Night'
SELECT *
FROM amazon
INNER JOIN netflix
ON amazon.id = netflix.id
where amazon.title = 'Take Care Good Night';

-- query amazon tables for title matching 'Take Care Good Night' and category like Drama
SELECT amazon.*
FROM amazon
INNER JOIN netflix
ON amazon.id = netflix.id
where amazon.title = 'Take Care Good Night' 
and amazon.category like '%Drama%'; 


-- query all columns (*) director name beginning with 'C' and category like Drama
SELECT *
FROM amazon
INNER JOIN netflix
ON amazon.id = netflix.id
where amazon.director like 'C%'
and amazon.category like '%Drama%'
or netflix.category like '%Drama%'; 


-- 1. Netflix - compare number of titles released each year
select release_year, count(distinct title) as titles
from netflix
GROUP by release_year;

--2. Netflix - compare number of released categories each year
select release_year, count(distinct category) as category
from netflix
GROUP by release_year;

--3. Netflix - most active director
select director, count(distinct title) as titles
from netflix
where director is not null
GROUP by director
order by titles DESC
fetch first 5 rows only;

--4. Netflix - which country releases the most each year?
select country, release_year, count(distinct title) as titles
from netflix
GROUP by country, release_year
order by titles DESC
fetch first 5 rows only;

--5. Movies title that are in both Netflix and Amazon
select distinct netflix.title, amazon.title
from netflix inner join amazon
on netflix.title = amazon.title

--6. Movies that are exclusively to netflix
select distinct netflix.title
from netflix
where netflix.title not in (select distinct amazon.title
from netflix inner join amazon
on netflix.title = amazon.title)
