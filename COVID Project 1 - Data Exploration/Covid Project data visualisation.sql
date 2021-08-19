/*
Queries used for Tableau Project
*/

use Portfolio;

-- 1. GLOBAL NUMBERS (Text Table)

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths
-- Where location like '%states%'
where continent is not null 
-- Group By date
order by 1,2;

-- 2. TOTAL DEATHS PER CONTINENT (Bar Graph)

Select continent, SUM(cast(new_deaths as int)) as TotalDeathCount
From CovidDeaths

Where continent is not null 
and continent not in ('World', 'European Union', 'International')
Group by continent
order by TotalDeathCount desc;


-- 3. PERCENT POPULATION INFECTED PER COUNTRY (Map)

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths
-- Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc;


-- 4. PERCENT POPLUATION INFECTED (Line Graph)

Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths
-- Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc;
