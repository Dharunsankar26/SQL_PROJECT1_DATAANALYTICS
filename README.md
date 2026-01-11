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

📌 **Add SQL Query Here**

```sql
-- SELECT
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

## 📝 **Insights (add after analysis):**

*
*

---

### 2️⃣ Skills Required for Top Paying Jobs

**Objective:** Find which skills appear most often in the highest-paying jobs.

📌 **Add SQL Query Here**

```sql
-- Paste SQL query that joins jobs with skills for top-paying roles
```

📊 **Add Visualization Here**

* Suggested graph: Skill frequency bar chart
* Save image in: `assets/2_top_paying_roles_skills.png`

```md
![Skills for Top Paying Jobs](assets/2_top_paying_roles_skills.png)
```

## 📝 **Insights:**

*
*

---

### 3️⃣ In-Demand Skills for Data Analysts

**Objective:** Identify skills that appear most frequently across data analyst job postings.

📌 **Add SQL Query Here**

```sql
-- Paste SQL query for most in-demand skills
```

📋 **Add Results Table Here**

```md
| Skill | Demand Count |
|------|--------------|
|      |              |
```

## 📝 **Insights:**

*

---

### 4️⃣ Skills Based on Salary

**Objective:** Analyze which skills are associated with higher average salaries.

📌 **Add SQL Query Here**

```sql
-- Paste SQL query for average salary per skill
```

📋 **Add Results Table Here**

```md
| Skill | Average Salary |
|------|----------------|
|      |                |
```

## 📝 **Insights:**

*

---

### 5️⃣ Most Optimal Skills to Learn

**Objective:** Combine **demand** and **salary** to find the best skills to learn.

📌 **Add SQL Query Here**

```sql
-- Paste SQL query combining demand and salary
```

📋 **Add Results Table Here**

```md
| Skill | Demand Count | Avg Salary |
|------|--------------|------------|
|      |              |            |
```

## 📝 **Insights:**

*
*

---

## What I Learned

* Writing **complex SQL queries** using joins and CTEs
* Using **GROUP BY, HAVING, COUNT, AVG** effectively
* Translating business questions into **data-driven insights**

---

## Conclusions

### Key Takeaways

1.
2.
3.
4.
5.

### Final Thoughts

This project strengthened my SQL skills and improved my understanding of the data analyst job market. It highlights how data-driven analysis can guide **career decisions** and **skill development**.

---

📌 **Next Improvements (Optional):**

* Add Python visualizations
* Automate analysis pipeline
* Compare trends year-over-year
