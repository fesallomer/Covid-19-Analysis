# COVID-19 Analysis Project Using SQL

## Table of Contents

1. [Project Overview](#project-overview)
2. [Data Sources](#data-sources)
3. [Usage](#usage)
4. [Queries and Analysis](#queries-and-analysis)


## Project Overview

This project aims to analyze COVID-19 data using SQL. The analysis includes tracking the number of cases, deaths, and recoveries over time and across different regions. The project leverages SQL queries to extract, manipulate, and visualize data to provide insights into the pandemic's progression.

## Data Sources

The data used in this project is sourced from:
- [World Health Organization (WHO)](https://www.who.int/emergencies/diseases/novel-coronavirus-2019)

## Usage

### Running Queries

1. **Data we are using:**
   ```sql
   select location , date , total_cases , new_cases ,total_deaths , population from "CovidDeaths"
   where continent is not null
   order by 1,2 
   ```

2. **Comparison of Total Cases and Total Deaths & Evaluating the likelihood of death upon contracting COVID-19 in Egypt**
   ```sql
   select location , date , total_cases ,total_deaths ,COALESCE((total_deaths/CAST(total_cases AS FLOAT))*100,0) as Death_ratio
   from "CovidDeaths"
   where location like 'Egypt%'
   order by 5 desc
   ```

3. **Total Cases vs Population & Probability of Contracting COVID-19 in Egypt**
   ```sql
   select location , date , total_cases , population , COALESCE((total_cases/CAST(population AS FLOAT))*100,0) as Cases_ratio
   from "CovidDeaths"
   where location like 'Egypt%'
   order by 5 desc 
   ```
4. **Countries with the Highest Infection Rates Relative to Their Populations**
   ```sql
   select location , max(total_cases)as max_total_cases , population , max(COALESCE((total_cases/CAST(population AS FLOAT))*100,0)) as max_Cases_ratio
   from "CovidDeaths"
   where continent is not null
   group by location , population
   order by 4 desc 
   ```
5. **Countries with the Highest Death Rate Compared to Their Population**
   ```sql
   select location , max(total_deaths)as max_total_deaths , population , max(COALESCE((total_deaths/CAST(population AS FLOAT))*100,0)) as max_death_ratio
   from "CovidDeaths"
   where continent is not null 
   group by location , population 
   order by 4 desc
   ```
6. **continent with the highest death rate attributable to COVID-19**
   ```sql
   select continent , max(total_deaths)as max_total_deaths
   from "CovidDeaths" 
   where continent is not null
   group by continent
   order by 2 desc 
   ```   
7. **Global numbers**
   ```sql
   select sum(new_cases)as total_cases, sum(new_deaths)as total_deaths,sum(new_deaths)/sum(cast(new_cases as float) )*100
   from "CovidDeaths"
   ```   
8. **The relationship between total population and vaccination rates is a critical factor in public health planning and policy implementation**
   ```sql
   select D.continent , D.location , D.population ,max(V.people_vaccinated)as people_vaccinated 
   from "CovidDeaths" as D
   join "CovidVaccination" as V 
   on D.location = V.location 
   and D.date = V.date 
   where D.continent is not null 
   and  V.people_vaccinated is not null
   group by D.continent , D.location , D.population 
   ```
9. **individuals who have received at least one dose of the vaccine vs. individuals who have completed the full vaccination regimen**
   ```sql
   select D.continent , D.location , D.population ,max(V.people_vaccinated)as people_vaccinated ,max(v.people_Fully_vaccinated) as people_fully_vacc , (max(v.people_Fully_vaccinated)/max(cast(V.people_vaccinated as float)))*100 as full_vacc_ratio 
   from "CovidDeaths" as D  
   join "CovidVaccination" as V 
   on D.location = V.location  
   and D.date = V.date  
   where D.continent is not null 
   and  V.people_vaccinated is not null 
   group by D.continent , D.location , D.population 
   order by 6 desc 
   ``` 

   
### Queries and Analysis

The project includes several predefined queries to analyze the data:
- `Comparison of Total Cases and Total Deaths & Evaluating the likelihood of death upon contracting COVID-19 in Egypt`: In Egypt, the total number of deaths stands at 24,826 out of 515,970 total reported cases, yielding a mortality rate of approximately 4.8%. Understanding this statistic aids in assessing the severity of the COVID-19 situation in Egypt and helps policymakers and healthcare professionals allocate resources effectively, implement targeted interventions, and guide public health messaging to mitigate further transmission and reduce mortality rates.
- `Total Cases vs Population & Probability of Contracting COVID-19 in Egypt`: With a total of 515,970 reported cases and a population of approximately 110,990,096, the probability of contracting COVID-19 stands at 0.46%. Understanding this statistic enables informed decision-making regarding public health measures, resource allocation, and risk assessment, fostering a more effective response to the pandemic.
- `Countries with the Highest Infection Rates Relative to Their Populations`: 
1. **Cyprus:** With a maximum total of 658,450 cases and a population of 896,007, the cases ratio stands at 73.49%.
2. **San Marino:** Reporting 24,132 cases against a population of 33,690, resulting in a cases ratio of 71.63%.
3. **Austria:** Recording 6,065,711 cases with a population of 8,939,617, the cases ratio reaches 67.85%.
4. **Faeroe Islands:** Noting 34,658 cases and a population of 53,117, the cases ratio is 65.25%.
5. **Brunei:** With 288,051 cases and a population of 449,002, the cases ratio is 64.15%.
- `Countries with the Highest Death Rate Compared to Their Population`:
1. **Peru:** Maximum total deaths - 220,122; Population - 34,049,588; Max death ratio - 0.646%
2. **Bulgaria:** Maximum total deaths - 38,328; Population - 6,781,955; Max death ratio - 0.565%
3. **Bosnia** and Herzegovina: Maximum total deaths - 16,337; Population - 3,233,530; Max death ratio - 0.505%
4. **Hungary:** Maximum total deaths - 48,762; Population - 9,967,304; Max death ratio - 0.489%
5. **North Macedonia:** Maximum total deaths - 9,673; Population - 2,093,606; Max death ratio - 0.462%


Feel free to modify and expand upon these queries to suit your analysis needs.


Feel free to customize this template with additional details specific to your project. Including sections like "Project Overview," "Data Sources," "Setup Instructions," and examples of how to use the SQL queries will help users understand and utilize your project effectively.
