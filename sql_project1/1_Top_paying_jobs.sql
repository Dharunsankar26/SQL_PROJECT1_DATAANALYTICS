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