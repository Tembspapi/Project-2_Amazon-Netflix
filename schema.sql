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

-- 1. compare number of titles released each year
select count(distinct title) as titles
from netflix;
