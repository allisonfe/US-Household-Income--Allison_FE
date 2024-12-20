# US Household Income Exploratory Data Analysis

SELECT * 
FROM us_project.us_household_income;


SELECT * 
FROM us_project.us_household_income_statistics;



SELECT State_Name, ALand, AWater
FROM us_project.us_household_income;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 3 DESC;

SELECT * 
FROM us_project.us_household_income_statistics;



SELECT * 
FROM us_project.us_household_income u 
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id;

SELECT * 
FROM us_project.us_household_income u 
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE mean <> 0
;


SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u 
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY 2
LIMIT 5
;


SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u 
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC
LIMIT 10
;

SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u 
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY u.State_Name
ORDER BY 3 ASC
LIMIT 10
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u 
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE mean <> 0
GROUP BY Type, `Primary`
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
LIMIT 20
;

SELECT *
FROM us_household_income
WHERE Type = 'Community'
;


SELECT u.State_Name, city, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u 
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, city
ORDER BY 4 DESC;
    
    
