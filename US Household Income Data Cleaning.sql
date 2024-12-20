# US Household Income Data Cleaning


SELECT * FROM us_project.us_household_income;

SELECT * FROM us_project.us_household_income_statistics;

ALTER TABLE us_project.us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id`;


SELECT count(id)
FROM us_project.us_household_income;

SELECT count(id)
FROM us_project.us_household_income_statistics;

# Removing Duplicates

SELECT id, COUNT(id)
FROM us_project.us_household_income
GROUP BY id
HAVING COUNT(id) > 1
;

SELECT row_id
FROM(
SELECT row_id,
id,
ROW_NUMBER () OVER(PARTITION BY id ORDER BY id) row_num
FROM us_project.us_household_income
) duplicates
WHERE row_num > 1
;



DELETE FROM us_household_income
WHERE row_id IN (
SELECT row_id
FROM(
SELECT row_id,
id,
ROW_NUMBER () OVER(PARTITION BY id ORDER BY id) row_num
FROM us_project.us_household_income
) duplicates
WHERE row_num > 1)
;


SELECT State_Name, COUNT(State_Name)
FROM us_household_income
GROUP BY State_Name
;

UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia'
;

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;

SELECT * 
FROM us_project.us_household_income;


SELECT DISTINCT State_ab
FROM us_project.us_household_income
ORDER BY 1
;

SELECT * 
FROM us_project.us_household_income
WHERE place = ''
ORDER BY 1
;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'
;


SELECT Type, COUNT(Type)
FROM us_project.us_household_income
GROUP BY Type
;

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

SELECT AWater
FROM us_project.us_household_income
WHERE AWater = 0 OR AWater = '' OR AWater IS NULL
;

SELECT DISTINCT(AWater)
FROM us_project.us_household_income
WHERE AWater = 0 OR AWater = '' OR AWater IS NULL
;

SELECT ALand
FROM us_project.us_household_income
WHERE ALand = 0 OR ALand = '' OR ALand IS NULL
;

SELECT DISTINCT(ALand)
FROM us_project.us_household_income
WHERE ALand = 0 OR ALand = '' OR ALand IS NULL
;

