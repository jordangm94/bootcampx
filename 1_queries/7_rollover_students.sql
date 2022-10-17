SELECT students.name, cohorts.name, cohorts.start_date as cohort_start_date, students.start_date as student_start_date
FROM students
---Link the students table and cohorts table together via cohort ID
JOIN cohorts ON cohort_id = cohorts.id
--NOW look for condition, where student start date is not the same as cohort start date
WHERE cohorts.start_date != students.start_date
--Order by cohort start date. 
ORDER BY cohort_start_date;