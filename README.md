# 📊 Data Analyst Job Market Analysis (SQL Project)

## Introduction

This project explores the **data analyst job market** using SQL, focusing on:

* 💰 Top-paying data analyst roles
* 🔥 Most in-demand skills
* 📈 Skills that balance **high demand and high salary**

The goal is to help aspiring data analysts understand **what to learn** and **where opportunities lie**.

> 📁 All SQL queries used in this project should be stored in the **`project_sql/`** folder.

---

## Background

This project was created to better navigate the data analyst job market by analyzing real-world job postings.

The dataset contains information on:

* Job titles & roles
* Salaries
* Locations (remote/on-site)
* Required technical skills

📌 **Data Source:** SQL course dataset by Luke Barousse

---

## Questions Answered

The SQL analysis aims to answer the following questions:

1. What are the **top-paying data analyst jobs**?
2. What **skills** are required for these top-paying jobs?
3. Which skills are **most in demand** for data analysts?
4. Which skills are associated with **higher salaries**?
5. What are the **most optimal skills to learn** (high demand + high pay)?

---

## Tools & Technologies

* **SQL** – Core analysis language
* **PostgreSQL** – Database engine
* **Visual Studio Code** – SQL execution & workflow
* **Git & GitHub** – Version control and project sharing

---

## The Analysis

Below, each section explains **what was analyzed**. You can add your **SQL code**, **tables**, and **graphs** in the clearly marked spaces.

---

### 1️⃣ Top Paying Data Analyst Jobs

**Objective:** Identify the highest-paying remote data analyst roles.


```sql
SELECT
    job_title,
    company_dim.name AS company_name,
    salary_year_avg,
    job_country,
    job_schedule_type,
    job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
where job_title_short='Data Analyst' AND salary_year_avg is NOT NULL AND job_location='Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10
```

📊 **Add Visualization Here**

* Suggested graph: Bar chart of top 10 salaries
* Save image in: `assets/1_top_paying_roles.png`

```md
![Top Paying Data Analyst Jobs](assets/1_top_paying_roles.png)
```

## 📝 **Insights:**
🔹Top Paying Data Analyst Jobs — Insights

Remote data analyst roles can reach exceptionally high salary ranges, showing strong demand for senior and specialized analysts.

High-paying roles are often offered by large tech firms and data-driven companies, indicating strong analytics maturity.

Job titles vary widely (Analyst, Lead, Director), suggesting salary growth is closely tied to experience and responsibility, not just the title.

---

### 2️⃣ Skills Required for Top Paying Jobs

**Objective:** Find which skills appear most often in the highest-paying jobs.

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim 
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
      AND job_location = 'Anywhere'
      AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC
```

📊 **Add Visualization Here**

* Suggested graph: Skill frequency bar chart
* Save image in: `assets/2_top_paying_roles_skills.png`

```md
![Skills for Top Paying Jobs](assets/2_top_paying_roles_skills.png)
```

## 📝 **Insights:**
Skills Required for Top Paying Jobs — Insights

SQL appears in almost all top-paying roles, confirming it as a non-negotiable core skill.

Python and visualization tools (Tableau / Power BI) frequently accompany higher salaries, highlighting the importance of end-to-end analysis.

Top-paying jobs typically demand a broader skill stack, combining querying, programming, and visualization

---

### 3️⃣ In-Demand Skills for Data Analysts

**Objective:** Identify skills that appear most frequently across data analyst job postings.

📌 **Add SQL Query Here**

```sql
SELECT 
    skills,count(skills_job_dim.job_id) as demand
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short ='Data Analyst'
GROUP BY skills
ORDER BY demand DESC
LIMIT 5

```

📋 **Add Results Table Here**

```md
| Skill | Demand Count |
|------|--------------|
|      |              |
```

## 📝 **Insights:**
SQL and Excel dominate demand, reinforcing their role as foundational tools across all analyst levels.

Programming languages and BI tools follow closely, indicating employers expect analysts to both analyze and communicate insights.

Demand trends suggest companies prioritize versatile, general-purpose skills over niche tools for most analyst roles


---

### 4️⃣ Skills Based on Salary

**Objective:** Analyze which skills are associated with higher average salaries.


```sql
select skills,round(avg(salary_year_avg),0) as avg
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
where salary_year_avg is NOT NULL AND job_title_short='Data Analyst'
      AND job_work_from_home=TRUE
GROUP BY skills
ORDER BY avg DESC
```

📋 **Add Results Table Here**

```md
| Skill | Average Salary |
|------|----------------|
|      |                |
```

## 📝 **Insights:**
Niche and advanced technical skills are associated with significantly higher average salaries.

Skills related to cloud platforms, big data, and machine learning workflows consistently rank at the top.

This indicates that analysts who move closer to data engineering or ML-adjacent roles unlock higher earning potential.
---

### 5️⃣ Most Optimal Skills to Learn

**Objective:** Combine **demand** and **salary** to find the best skills to learn.



```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

📋 **Add Results Table Here**

```md
| Skill | Demand Count | Avg Salary |
|------|--------------|------------|
|      |              |            |
```

## 📝 **Insights:**
Skills that combine high demand and high salary offer the strongest return on learning investment.

Cloud tools and modern data technologies stand out as long-term career accelerators.

While foundational skills remain essential, pairing them with specialized or scalable tools maximizes market value.


---

## What I Learned

* Writing **complex SQL queries** using joins and CTEs
* Using **GROUP BY, HAVING, COUNT, AVG** effectively
* Translating business questions into **data-driven insights**

---

## Conclusions

### Key Takeaways

1.Top-Paying Data Analyst Jobs: The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!

2.Skills for Top-Paying Jobs: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.

3.Most In-Demand Skills: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.

4.Skills with Higher Salaries: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.

5.Optimal Skills for Job Market Value: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value

### Final Thoughts

This project strengthened my SQL skills and improved my understanding of the data analyst job market. It highlights how data-driven analysis can guide **career decisions** and **skill development**.

---

📌 **Next Improvements (Optional):**

* Add Python visualizations
* Automate analysis pipeline
* Compare trends year-over-year
