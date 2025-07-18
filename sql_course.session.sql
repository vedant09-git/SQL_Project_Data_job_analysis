with remote_jobs_skills as (

SELECT
    sjd.skill_id,
    count(*) as skills_count
FROM skills_job_dim as sjd
INNER JOIN job_postings_fact as jpf
on jpf.job_id= sjd.job_id
where job_work_from_home = TRUE AND job_title_short='Data Analyst'
GROUP BY skill_id
order BY skills_count DESC
limit 5
)
SELECT sd.skill_id,
    sd.skills as skill_name,
    skills_count
FROM
    remote_jobs_skills as rjs
inner JOIN skills_dim as sd ON sd.skill_id=rjs.skill_id