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


### Queries and Analysis

The project includes several predefined queries to analyze the data:
- `daily_cases.sql`: Retrieves the number of daily new cases.
- `total_deaths.sql`: Calculates the total number of deaths.
- `recoveries_by_region.sql`: Summarizes recoveries by region.

Feel free to modify and expand upon these queries to suit your analysis needs.


Feel free to customize this template with additional details specific to your project. Including sections like "Project Overview," "Data Sources," "Setup Instructions," and examples of how to use the SQL queries will help users understand and utilize your project effectively.
