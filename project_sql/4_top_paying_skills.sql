select 
    skills,
    round (avg(salary_year_avg), 0 )as avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short= 'Data Analyst' 
    and salary_year_avg is not null
    AND job_location= 'Anywhere'
    and job_work_from_home= true
GROUP BY   skills
    order BY avg_salary desc
    limit 30


/*
1. 🧠 Specialized/Enterprise Tools Drive High Pay
Tools like PySpark, DataRobot, and Watson top the list — reflecting the high value placed on big data, ML automation, and AI platforms in modern analytics roles.

These often relate to enterprise-scale data pipelines, which command premium salaries due to complexity and fewer experts.

2. 💻 Version Control & DevOps Integration
Tools like Bitbucket, GitLab, Jenkins, and Atlassian indicate that DevOps skills are becoming more integrated into analytics roles.

Analysts who can work with CI/CD systems or collaborate with engineering teams earn more.

3. 🔬 ML & Scientific Computing Libraries
Pandas, Numpy, Scikit-learn, Jupyter notebooks — all reflect the growing demand for data science and machine learning skills.

These skills link analytics work with modeling, experimentation, and automation, boosting pay.

4. ☁️ Cloud & Distributed Systems
GCP, Airflow, Kubernetes, Databricks, and Hadoop show that cloud-native analysts and data engineers are highly compensated.

The ability to deploy data pipelines and work on distributed systems is key to upper-tier roles.

5. 🧰 Less Common, Niche Tools Pay Well
Tools like Couchbase, Crystal, Twilio, and MicroStrategy suggest that niche skills often lead to less competition and higher pay — especially in companies where those tools are core to infrastructure.

6. 🛠️ Cross-functional Collaboration
Tools like Confluence, Notion, and Atlassian reflect the importance of documentation, project management, and collaboration platforms — increasingly expected even in technical roles.
*/