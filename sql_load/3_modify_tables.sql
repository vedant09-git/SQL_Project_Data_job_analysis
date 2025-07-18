SELECT
  company_id,
  COUNT(job_id) AS number_of_jobs,
  CASE
    WHEN salary_year_avg < 50000 THEN 'Under_paying'
    WHEN salary_year_avg BETWEEN 50000 AND 100000 THEN 'Rightly_paying'
    WHEN salary_year_avg > 100000 THEN 'Over_paying'
    ELSE 'IDC'
  END AS salary_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY company_id,
  CASE
    WHEN salary_year_avg < 50000 THEN 'Under_paying'
    WHEN salary_year_avg BETWEEN 50000 AND 100000 THEN 'Rightly_paying'
    WHEN salary_year_avg > 100000 THEN 'Over_paying'
    ELSE 'IDC'
  END
order BY company_id