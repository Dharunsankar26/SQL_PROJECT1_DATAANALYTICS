WITH COMPANY_JOB_COUNT AS (
    SELECT
        Company_id,
        COUNT(*) AS total_jobs 
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
)
SELECT 
    company_dim.name as company_name,
    COMPANY_JOB_COUNT.total_jobs
from company_dim
LEFT JOIN COMPANY_JOB_COUNT ON COMPANY_JOB_COUNT.Company_id=company_dim.company_id
ORDER BY total_jobs DESC 


SELECT 
    skills_dim.skill_id,count(job_id),skills
from skills_job_dim
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
group by skills_dim.skill_id
order by count(job_id) DESC
LIMIT 5

with remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim
    INNER JOIN job_postings_fact ON job_postings_fact.job_id=skills_job_dim.job_id
    WHERE job_postings_fact.job_work_from_home = TRUE
    GROUP BY skill_id
)

SELECT skills_dim.skill_id,skills,skill_count
from remote_job_skills
INNER JOIN skills_dim ON skills_dim.skill_id=remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5

SELECT quater1_jobs.job_title_short,
       quater1_jobs.job_location,
       quater1_jobs.salary_year_avg
FROM(
    SELECT * FROM jan_jobs
    UNION all
    SELECT * from feb_jobs
    UNION all
    SELECT * FROM mar_jobs
) AS quater1_jobs
WHERE quater1_jobs.salary_year_avg>70000 AND
      job_title_short='Data Analyst'



