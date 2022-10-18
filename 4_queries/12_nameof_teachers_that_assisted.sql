--We use distinct here in order to eliminate multiple entries

--I.e. many teacehrs will perform more than 1 assistance request for a cohort during their time at LHL

--Therefore simply use DISTINCT to see the names of the teachers involved in that cohort, ONE TIME each. 

SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort

FROM teachers

JOIN assistance_requests ON teachers.id=teacher_id 

JOIN students ON student_id=students.id

JOIN cohorts ON cohort_id=cohorts.id

WHERE cohorts.name = 'JUL02'

ORDER BY teacher;