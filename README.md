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

You can run the provided SQL queries to perform various analyses. Here are a few examples:

1. **Daily Cases:**
   ```sql
   USE covid19;
   GO
   \i sql/queries/daily_cases.sql
   ```

2. **Total Deaths:**
   ```sql
   USE covid19;
   GO
   \i sql/queries/total_deaths.sql
   ```

3. **Recoveries by Region:**
   ```sql
   USE covid19;
   GO
   \i sql/queries/recoveries_by_region.sql
   ```

## Queries and Analysis

The project includes several predefined queries to analyze the data:
- `daily_cases.sql`: Retrieves the number of daily new cases.
- `total_deaths.sql`: Calculates the total number of deaths.
- `recoveries_by_region.sql`: Summarizes recoveries by region.

Feel free to modify and expand upon these queries to suit your analysis needs.


Feel free to customize this template with additional details specific to your project. Including sections like "Project Overview," "Data Sources," "Setup Instructions," and examples of how to use the SQL queries will help users understand and utilize your project effectively.
