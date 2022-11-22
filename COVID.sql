

-- This Example Includes (SELECT, FROM, WHERE, ORDER BY, GROUP BY, AS, IN/NOT IN, SUM, ROUND, MAX, LIMIT) 


-- 1 
-- Worldwide

SELECT 
    SUM(new_cases) AS total_cases,
    SUM(new_deaths) AS total_deaths,
    ROUND(SUM(new_deaths) / SUM(New_Cases) * 100,
            2) AS DeathPercentage
FROM
    PortfolioProject.`CovidDeaths`
;


-- 2 
-- Total Death Per Continent 
SELECT 
    continent, SUM(new_deaths) AS TotalDeathCount
FROM
    portfolioproject.`coviddeaths`
WHERE
    continent IN (
		'europe' , 
        'european union',
        'africa',
        'north america',
        'south america',
        'asia',
        'oceania'
        )
GROUP BY continent
ORDER BY TotalDeathCount DESC
;

-- 3
-- Countries with Highest Infection Rate compared to Population

SELECT 
    Location,
    Population,
    MAX(total_cases) AS HighestInfectionCount,
    ROUND(MAX((total_cases / population)) * 100, 2) AS PercentPopulationInfected
FROM
    PortfolioProject.`CovidDeaths`
GROUP BY Location , Population
ORDER BY PercentPopulationInfected DESC
;

-- 4 
-- Percent Population Infected

SELECT 
    Location,
    Population,
    date,
    MAX(total_cases) AS HighestInfectionCount,
    ROUND(MAX((total_cases / population)) * 100, 2) AS PercentPopulationInfected
FROM
    PortfolioProject.`CovidDeaths`
GROUP BY Location , Population , date
ORDER BY PercentPopulationInfected DESC
;

-- 5 
-- Ratio between Infected and Not Infected in Lithuania 

SELECT 
    location,
    population,
    MAX(total_cases) AS Infected,
    SUM(new_deaths) AS Died,
    MAX(total_cases) - SUM(new_deaths) AS InfectedNoDeaths,
    MAX(population) - MAX(total_cases) AS NotInfected
FROM
    PortfolioProject.`CovidDeaths`
WHERE
    location IN ('lithuania')
GROUP BY location
;


-- 6
-- TOP 5 Countries with the Highest Death percentage per Cases

SELECT 
    Location AS Country,
    MAX(total_cases) AS Confirmed,
    SUM(new_deaths) AS Deaths,
    ROUND(SUM(new_deaths) / SUM(new_cases) * 100,2) AS CaseFatalityPercent
FROM
    CovidDeaths
WHERE
    Location NOT IN
    (
        'europe' , 
		'european union',
        'africa',
        'north america',
        'south america',
        'asia',
        'oceania',
        'high income',
        'north korea'
	)
    
GROUP BY Location
ORDER BY CaseFatalityPercent DESC
LIMIT 5
;


