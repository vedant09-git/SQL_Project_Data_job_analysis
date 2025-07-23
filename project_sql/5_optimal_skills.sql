with skills_demand as (
    select 
         skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short= 'Data Analyst' AND
        job_location= 'Anywhere' 
        and salary_year_avg is not null
    GROUP BY   skills_dim.skill_id
   
     
), avg_salary as (
    select 
         skills_job_dim.skill_id,
        round (avg(job_postings_fact.salary_year_avg), 0 )as avg_salary
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short= 'Data Analyst' 
        and salary_year_avg is not null
        AND job_location= 'Anywhere'
        and job_work_from_home= true
    GROUP BY   skills_job_dim.skill_id

    
)
select
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from
    skills_demand
Inner JOIN avg_salary on skills_demand.skill_id=avg_salary.skill_id

ORDER BY
    avg_salary,
    demand_count DESC
limit 30