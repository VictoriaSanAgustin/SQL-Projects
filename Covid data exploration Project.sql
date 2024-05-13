SELECT *
FROM CovidDeaths$
WHERE continent IS NOT NULL
ORDER BY 3,4

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths$
WHERE continent IS NOT NULL
ORDER BY 1,2

--TOTAL CASES VS TOTAL DEATHS

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM CovidDeaths$
WHERE  location like '%NAMIBIA%'
ORDER BY 1,2

--TOTAL CASES VS POPULATION (WHAT % HAS GOT COVID)

SELECT location, date, total_cases, POPULATION, (total_deaths/population)*100 AS PercentPopulationInfected
FROM CovidDeaths$
WHERE  location like '%NAMIBIA%'
ORDER BY 1,2

--WHAT COUNTRIES HAVE THE HIGHEST INFECTION RATE COMPARED TO POPULATION

SELECT location, population,  MAX(total_cases) AS HighestInfectionCount, Max((total_cases/population))*100 AS PercentPopulationInfected
FROM CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY PercentPopulationInfected desc

--COUNTRIES WITH THE HIGHEST DEATH COUNT PER POPULATION

SELECT location, MAX(cast(TOTAL_DEATHS as int)) AS TotalDeathCount
FROM CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount desc

--SHOWING CONTINENTS WITH HIGHEST DEATH COUNTS

SELECT location, MAX(cast(TOTAL_DEATHS as int)) AS TotalDeathCount
FROM CovidDeaths$
WHERE continent IS NULL
GROUP BY location
ORDER BY TotalDeathCount desc

--GLOBAL NUMBERS BY DATE

SELECT date, SUM(NEW_CASES) AS TOTALCASES, SUM(CAST(NEW_DEATHS AS INT)) AS TOTALDEATHS, SUM(CAST(NEW_DEATHS AS INT))/SUM(NEW_CASES)*100 AS DeathPercentage
FROM CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2

--JOINING TWO TABLES
--LOOKING AT TOTAL POPULATION VS VACCINATIONS

SELECT DEA.continent, DEA.location, DEA.DATE, DEA.population, VAC.new_vaccinations, 
	SUM(CONVERT(INT,VAC.NEW_VACCINATIONS)) OVER (PARTITION BY DEA.LOCATION ORDER BY DEA.LOCATION , DEA.DATE) AS RollingPeopleVaccinated
	FROM CovidDeaths$ DEA
JOIN CovidVaccinations$ VAC
	ON DEA.location = VAC.location
	AND DEA.date = VAC.date
WHERE DEA.continent IS NOT NULL
ORDER BY 2,3


--CREATE CTE

	WITH POPVSVAC (Continent, Location, Date, Popuation, new_vaccinations, RollingPeopleVaccinated)
	AS 
	(
	SELECT DEA.continent, DEA.location, DEA.DATE, DEA.population, VAC.new_vaccinations, 
		SUM(CONVERT(INT,VAC.NEW_VACCINATIONS)) OVER (PARTITION BY DEA.LOCATION ORDER BY DEA.LOCATION , DEA.DATE) AS RollingPeopleVaccinated
		--(RollingPeopleVaccinated/population)*100
	FROM CovidDeaths$ DEA
	JOIN CovidVaccinations$ VAC
		ON DEA.location = VAC.location
		AND DEA.date = VAC.date
	WHERE DEA.continent IS NOT NULL
	)
	Select *, (RollingPeopleVaccinated/Popuation)*100
	From POPVSVAC


--TEMP TABLE

CREATE TABLE #PercentPeopleVaccinated
(
Continent nvarchar (255),
Location nvarchar (255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric)


INSERT INTO #PercentPeopleVaccinated
SELECT DEA.continent, DEA.location, DEA.DATE, DEA.population, VAC.new_vaccinations, 
	SUM(CONVERT(INT,VAC.NEW_VACCINATIONS)) OVER (PARTITION BY DEA.LOCATION ORDER BY DEA.LOCATION , DEA.DATE) AS RollingPeopleVaccinated
	FROM CovidDeaths$ DEA
JOIN CovidVaccinations$ VAC
	ON DEA.location = VAC.location
	AND DEA.date = VAC.date
WHERE DEA.continent IS NOT NULL

SELECT *
FROM #PercentPeopleVaccinated

--CREATING VIEW TO STORE DATA FOR VISUALIZATIONS

CREATE VIEW PercentPopVaccinated AS
SELECT DEA.continent, DEA.location, DEA.DATE, DEA.population, VAC.new_vaccinations, 
	SUM(CONVERT(INT,VAC.NEW_VACCINATIONS)) OVER (PARTITION BY DEA.LOCATION ORDER BY DEA.LOCATION , DEA.DATE) AS RollingPeopleVaccinated
	FROM CovidDeaths$ DEA
JOIN CovidVaccinations$ VAC
	ON DEA.location = VAC.location
	AND DEA.date = VAC.date
WHERE DEA.continent IS NOT NULL

SELECT *
FROM PercentPopVaccinated
