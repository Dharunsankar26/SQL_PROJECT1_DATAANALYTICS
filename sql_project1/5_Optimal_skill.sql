WITH skills_demand AS ( 
    SELECT 
        skills_dim.skills,skills_dim.skill_id,count(skills_job_dim.job_id) as demand
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short ='Data Analyst' AND salary_year_avg is NOT NULL AND job_work_from_home=TRUE
    GROUP BY skills_dim.skill_id
),average_salary AS(
    select skills_job_dim.skill_id,round(avg(salary_year_avg),0) as avg
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    where salary_year_avg is NOT NULL AND job_title_short='Data Analyst'
        AND job_work_from_home=TRUE
    GROUP BY skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand,
    avg 
FROM skills_demand
INNER JOIN average_salary on skills_demand.skill_id = average_salary.skill_id
where demand>10
ORDER BY avg DESC,demand DESC
limit 25




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
