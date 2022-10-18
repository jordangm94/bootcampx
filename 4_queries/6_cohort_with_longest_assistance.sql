SELECT cohorts.name as name, AVG(completed_at-started_at) as average_assistance_time

FROM assistance_requests JOIN students ON student_id=students.id

JOIN cohorts ON cohort_id=cohorts.id

GROUP BY cohorts.name
--The DESC allows us to order from highest to lowest
ORDER BY average_assistance_time DESC
--LIMIT allows us to only show the first row of table, which here will be cohort with longest assistance time
LIMIT 1;