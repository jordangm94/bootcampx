SELECT cohorts.name, COUNT(students.cohort_id) as total_students
--LINK students and cohorts together, b/c we are trying to apply COUNT of cohort IDS on all the IDS in a particular COHORT name
FROM students JOIN cohorts on students.cohort_id = cohorts.id
--GROUP BY here allows us to apply aggregate function on cohorts.name
GROUP BY cohorts.name
--This specifies the specific condition we want
HAVING COUNT(students.cohort_id) >= 18
ORDER BY total_students;