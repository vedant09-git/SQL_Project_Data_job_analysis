SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    cd.name as company_name,
    job_posted_date
From 
    job_postings_fact as jpf
LEFT JOIN company_dim as cd
on jpf.company_id=cd.company_id
WHERE 
    job_title_short='Data Analyst' and 
    job_location='India' and 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
limit 10;


SELECT  *
from skills_dim