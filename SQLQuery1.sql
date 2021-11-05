select *
from Covid_analyse..covidDeaths
order by 3,4


--the data that we are going to use
select location, date, new_cases, total_cases_per_million, total_deaths, population
from Covid_analyse..covidDeaths
order by 1,2



--Total cases VS Total Deaths

select location, date,  total_cases, total_deaths,(total_deaths/total_cases)*100 as Deaths_Percentage
from Covid_analyse..covidDeaths
where location like '%egypt%'
order by 1,2



--Total cases VCS Population(percentage of people who got covid)
select location, date,  total_cases, population,(total_cases/population)*100 as Cases_persentage 
from Covid_analyse..covidDeaths
where location like '%egypt%'
order by 1,2



-- Countries with Highest Infection Rate compared to Population

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From Covid_analyse..CovidDeaths
Group by Location, Population
order by PercentPopulationInfected desc



-- Countries with Highest Death Count per Population

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Covid_analyse..CovidDeaths
Where continent is not null 
Group by Location
order by TotalDeathCount desc


-- Showing contintents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Covid_analyse..CovidDeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc

--Total cases and total deaths in the world

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From Covid_analyse..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

