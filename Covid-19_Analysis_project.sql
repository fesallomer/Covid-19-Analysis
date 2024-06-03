-- Data we are going to use 
select location , date , total_cases , new_cases ,total_deaths , population 
from "CovidDeaths"
where continent is not null
order by 1,2 

-- looking at total cases vs total deaths
-- showing the probability of dying if you contract covid-19 in Egypt 
select location , date , total_cases ,total_deaths ,COALESCE((total_deaths/CAST(total_cases AS FLOAT))*100,0) as Death_ratio 
from "CovidDeaths"
where location like 'Egypt%'
order by 5 desc

-- total_cases vs population 
-- the probability of being contract with covid-19 in Egypt 
select location , date , total_cases , population , COALESCE((total_cases/CAST(population AS FLOAT))*100,0) as Cases_ratio  
from "CovidDeaths"
where location like 'Egypt%'
order by 5 desc 

-- countries with highest infection rate compare to thier population 
select location , max(total_cases)as max_total_cases , population , max(COALESCE((total_cases/CAST(population AS FLOAT))*100,0)) as max_Cases_ratio  
from "CovidDeaths" 
where continent is not null
group by location , population 
order by 4 desc 

-- countries with highest death rate compare to thier population 
select location , max(total_deaths)as max_total_deaths , population , max(COALESCE((total_deaths/CAST(population AS FLOAT))*100,0)) as max_death_ratio  
from "CovidDeaths" 
where continent is not null
group by location , population 
order by 4 desc 

-- continent with highest death 
select continent , max(total_deaths)as max_total_deaths
from "CovidDeaths" 
where continent is not null
group by continent  
order by 2 desc 

--Global numbers 
select sum(new_cases)as total_cases, sum(new_deaths)as total_deaths,
sum(new_deaths)/sum(cast(new_cases as float) )*100
from "CovidDeaths"

--total population vs vaccination 
select D.continent , D.location , D.population ,max(V.people_vaccinated)as people_vaccinated 
from "CovidDeaths" as D
join "CovidVaccination" as V 
on D.location = V.location 
and D.date = V.date 
where D.continent is not null 
and  V.people_vaccinated is not null
group by D.continent , D.location , D.population 


-- people vaccinated vs fully vaccinated 
select D.continent , D.location , D.population ,max(V.people_vaccinated)as people_vaccinated ,
max(v.people_Fully_vaccinated) as people_fully_vacc , 
(max(v.people_Fully_vaccinated)/max(cast(V.people_vaccinated as float)))*100 as full_vacc_ratio
from "CovidDeaths" as D
join "CovidVaccination" as V 
on D.location = V.location 
and D.date = V.date 
where D.continent is not null 
and  V.people_vaccinated is not null
group by D.continent , D.location , D.population 
order by 6 desc

