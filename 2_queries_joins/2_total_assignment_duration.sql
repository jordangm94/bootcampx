SELECT SUM(duration)
-- This line connects Assignment_Submissions to students via student ID, and then students to cohorts via cohort id
FROM assignment_submissions JOIN students ON student_id = students.id JOIN cohorts ON cohort_id = cohorts.id
-- Once we have access to Cohorts, we can now ask to find the duration of a particular cohort by NAME using where
WHERE cohorts.name = 'FEB12';