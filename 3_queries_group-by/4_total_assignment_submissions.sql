SELECT cohorts.name as cohort_name, COUNT(assignment_id) as total_submissions

--Connect the assignments table with the cohorts table through students

FROM assignment_submissions JOIN students ON student_id = students.id JOIN cohorts ON students.cohort_id = cohorts.id

--Make aggregate function call apply to each cohrot NAME
GROUP BY cohorts.name

--DESC here allows us to sort from highest to lowest, found on POSTGRESQL Tutorial!

ORDER BY total_submissions DESC;